Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QDS0J-0005te-VD; Sat, 23 Apr 2011 03:51:24 +0200
Received: by qwh5 with SMTP id 5so492652qwh.6
	for <multiple recipients>; Fri, 22 Apr 2011 18:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=+wIiA4zo55Iq6x7Dt0utjgwC36dqpWn8pjXdnzqSj9I=;
	b=LJlEYNPCQm8dz4MgLMMk778nqbEPrfbIEhC1Tiv7H0+auTovJYmmEOo3dpOkYoDZlx
	xTkO5VBTys1KYSjHAEk6cT8eUzsmrnyAewKsAuejrMlPW56yf6zuTS//RFUIP8V+X8yO
	RasdMOxIVHisot7Ouz9h+UtXwqTEf4W2lVnNc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=I9gvgkVFdaguFqzj6boDUmtpNIbt9q+2eBC2E2sbwNUvGjQxfrjvOP0+UB+TYsj9uR
	DTCc5WPZnyeF/4IUR+nabdWYvTk/seODNLmms5tbCZCPE9Mq66XKmeof6IMJrpjYrQ4D
	EdK0UWTnv3Cg9PaUc8hKQ5chYgRyo3ZT7Tk5Y=
MIME-Version: 1.0
Received: by 10.229.51.74 with SMTP id c10mr1182456qcg.248.1303523337688; Fri,
	22 Apr 2011 18:48:57 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.229.95.205 with HTTP; Fri, 22 Apr 2011 18:48:57 -0700 (PDT)
Date: Fri, 22 Apr 2011 18:48:57 -0700
X-Google-Sender-Auth: K8ILnevczfJlSNbcG-xqUjk3sOw
Message-ID: <BANLkTikK5Mr+wfjprJHrX2GGU==Q9dd66A@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Technical Steering Committee Minutes, F2F meeting April 10 2011
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Apr 2011 01:51:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee Minutes, F2F meeting April 10 2011
12:00pm - 5:00pm

OE-TSC Attendees:
Tom Rini (Tartarus)
Richard Purdie (RP)
Khem Raj (khem)
Koen Kooi (koen)
Mark Hatle (fray)

Other Attendees:
Denys Dmytriyenko (denix) - OE board
Jeff Osier-Mixon (jefro) - secretary

_____________________________________________________________
Agenda & Action Items

Note: This was a working meeting rather than a regular status meeting.

* BBCLASS_EXTEND and .inc files don't work well with the layer approach
==> document, explain why bad idea, don't want to do for x reasons

* Import xorg structure from OE .dev into meta-oe

* Task-boot in meta-angstrom is fit for meta-oe

* Angstrom-core-tweaks seems for meta-oe as well
==> action item for khem - please use LIBC rather than ANGSTROMLIBC

* Global poky files need improvement:
=> on yocto 1.1 plan - action - document, take action for october (oe-core)

* patchwork instance for layers (e.g. meta-oe/meta-efl/meta-angstrom) & pull
requests, need to track

* infrastructure
* Yocto steering group discussion summary (inc BSPs + interest groups)
==>   //> collaborative charter with Yocto Project
==>   //> create clearinghouse for bsps/layers & set of mgmt policies (fray)
+ mirroring
==>   //> denix - clause in contact that oe owns their set of data
==>   //> rp -> denix: talk to LF to sort infrastructure hosting details

* Layer tooling brainstorming
==> RP  improve addhandler functionality in bitbake to list relative events

* layer creation tools
==> already works in layer.conf, need documentation

* OECore branding

* config options

* multilibs
==> continue any discussion needed on ml


* fixing local.conf
==> document bbmask
==> simplify local.conf.sample

other:
==> getting rid of poky name: poky -> core

_____________________________________________________________
Raw notes

Martin raised some points we should discuss:

* BBCLASS_EXTEND and .inc files don't work well with the layer approach
// can't do bb append into a .inc file
// painful to append to a .inc file
// also bbclass files
// rp - natural pressure to share core files
==> document, explain why bad idea, don't want to do for x reasons

* Import xorg structure from OE .dev into meta-oe
// xserver-xorg, x11 - need to synchronize
// lots of recipes, need to share common files
// defer to hackathon session later in evening
// fray working on as part of yocto - synch bits in meta-oe with oe-core
// koen - import from dev

* Task-boot in meta-angstrom is fit for meta-oe
// koen already moved to meta-oe
// defer to hackathon

* Angstrom-core-tweaks seems for meta-oe as well
==> action item for khem - please use LIBC rather than ANGSTROMLIBC
// oe-core may be missing this bit (Tartarus)
// RP suggests : core distro include file "shared libcs" to share libcs
within same work dir
// RP contintued: with specific include file
// defer implementation to hackathon

* Global poky files need improvement:
// <JaMa|Wrk> and on ELC meetup, when doing oe-core rebranding,  please
raise my concern about
// couple of global poky files, like SRCREVs etc.. I really hate
// openembedded-core/meta/conf/distro/include/poky-default-revisions.inc
file included directly
// from layer.conf as SRCREV_pn-u-boot ??= "v2010.12" there is harder to
overwrite from own
// u-boot recipe (SRCREV_pn-u-boot works, SRCREV itself doesn't ofc), but
enduser will be
// confused for sure when most recipes have just SRCREV and sometimes it's
not enough

// rp doesn't disagree, but some use case breaks - bb keeps src rev stuff in
core config context
// doesn't know about src rev until passing individual recipe
// mismatch between recipes
// teach core about revs in individ. recipes, missing code to do this atm
// bitbake problem
// can add SRC_REV to bbcache but validation timing is at issue wrt cache
// rp can solve in layers
// fray: want to get rid of, but must cope with corner cases
=> on yocto 1.1 plan - action - document, take action for october (oe-core)
* patchwork instance for layers (e.g. meta-oe/meta-efl/meta-angstrom) & pull
requests, need to track
// manual intervention needed, need to automate as much as possible
// education issue
// alternatives are expensive
// rp first thing, improve hooks
// go for net improvement (koen) - can include items in patchwork, find
individual to monitor
// need janitors - koen doing some of this
// where to put patchwork instance? all on oe currently, falls to oe
maintainers
// koen - patchwork.kernel.org ?
// ** also see infrastructure discussion

infrastructure
// resources constrained, but political pressure to keep inside OE
// rather than depend on corporate support from any corp sponsor


* Yocto steering group discussion summary (inc BSPs + interest groups)
// don't want manuf bsps hosted on oe - yocto ok, i.e. beagleboard ok, ti
boards not ok
// nor confusion of one manuf saying "this is official for x board"
// can work with yocto to provide hosting for some
// koen - layers promote silo mentality - hosting elsewhere promotes that
mentality
// rp - if layers spread across infrastructures, hard to see what is there
already
// rp - this is why git.yoctoproject.org set up for many repos
// tartarus - having mirrors only solves the problem once it exists
// koen - want to promote cooperation, oe board should not tell corps to get
lost
// rp - layers have specific owners, koen - if layer owner disappears, oe
can deprecate/mark read-only
// rp - readonly mirror is not a fork
// koen - tsc can resolve a namespace conflict, has charter that covers
infrastructure
// koen re hosting "yes, but", not "no, unless"
// fray - layers are a planned way to cope with distribution (layers vs
repos)

multilayer problem:
  community issues:
    political inside OE
    political with corporations
integration with yocto
==>   //> collaborative charter
  technical:
    infrastructure  - immediate
  hardware, admin
==>   //> create clearinghouse for bsps/layers & set of mgmt policies (fray)
+ mirroring
==>   //> denix - clause in contact that oe owns their set of data
==>   //> rp -> denix: talk to LF to sort infrastructure hosting details

* Layer tooling brainstorming
// problems today - khem : abi  fray: dependencies & versioning, latter no
way to specify
// rp have something but very basic
// fray would like to see layer file, specify url & download layer as a step
- possible? desirable?
// denix - 2 yrs ago trying to enable devteams, update recipes with new
versions
    instead of making changes in mainline (arago) used recipe specified
default version,
in component specific branches have config file, pokes values into recipe
offload recipe updating to the teams, build from internal URL without
churning mainline
BOM into one config file, create BOM layers for products
easy to implement, nothing in core infrastructure changed
   fray: wget clones repos until pulled entire tree
    desired: config file to be just downloaded, script to pull layer stuff
knows that if I ran this, here is where everything went
khem: submodules? fray: problem
   koen: want something like that but not actual submodules
   fray: ok when want to be locked to version, suck when don't
     mostly want version of some branch
   denix: mvl6 pull compressed layers from different places (single server)
   rp : mv has bitbake run bitbake denix: collections
   fray: bitbake fetcher works
   rp: variety of higher level tooling doesn't belong in bitbake - eg qemu,
pseudo
     seem to develop more use cases where we need something above bitbake
fray: as we move fwd, need stage1 then auto downloads of collective data
 large things
 have components to do downloads, but no way to structure right now
 have to do this, but lower priority
    rp: leave provisioning for later
fray: roadmap item
fray: missing sanity checks specific to a layer
rp: some checks on yocto 1.1 roadmap
kk:  config file to fetch layers, simple format
  fray: dependency reordering
rp: visualizing dependencies between layers
fray: flatten tool -> single layer, flattened model
  tar: should be able to do with something chris published before leaving mv
  may be a virtual flatten
(kk: fuse filesystem?)
rp: create effective layer repos: layer repo tools to merge layers into a
repo, or
  separate respective patches to upstream repos
pedigree - genealogy of a layer
kk: note deviations from default
  output variable state against given recipe, refer to what pulling in (-e
on steroids)
additional information inside layers: pedigree, where maintained, which rev
top of bitbake output, banner that summarizes build - add revisions for each
layer
  addhandler improvement - layer fingerprint

==> RP  improve addhandler functionality in bitbake to list relative events
currently every handler receives every event - performance issue
have handlers optionally specify which events to receive
 fray: user's build directory is a layer in wrl
  also "make export" layer
  very handy for prototyping
  rp: technically already is, but missing "make export"
  //> verify build dir does act as layer, figure out export tooling

layer creation tools
  fetching
  easy tool to integrate sstate cache?
==> already works in layer.conf, need documentation
  list of layers constructed from, top layer/bottom layer
  unique id or uses filepath
  internal recipe variable so a component can use it
  tool to show recipes shadowing each other

==> continue tooling discussion on ml

rp: implementation - effective way to create new tooling
  git submodules, repo, "um waitwait..."
  fray: reality is people will choose own ways
  khem/rp: have to set own path
  rp: agree to create higher level tooling? tartarus: yes, want to hear real
proposal
    look at git submodules, look at repo, but do our own thing
  fray: build in discrete stages
    1 - set up environment
2 - download & set up tools, layers
3 - ...
4 - other tools
5 - now have everything, run build user asked for
  multiple (recursive?) layers


* OECore branding
  I'd also like to touch on the various major changes we're thinking about
  for Yocto 1.1 (multilib, config options) and see if there is anything at
  the TSC/architecture level we should be touching upon. There are
  proposals on the mailing list about these now.



* config options
  binary only, package config options, rocket cows (koen)
  koen: cascading of changes up the trees, e.g. gcc r4 to r5, dependencies
automatically updated
  fray: checksums in wrl
  tar: make moderately painful to add new flags
  fray: flags when defined need defined states
  rp: what are criteria for having flags in the first place
  denix: gentoo has local use flags vs global, we are discussing global
    not implement package-specific? fray: generally yes
    machine feature
  fray: trying to make policy dynamic: system vs package vs machine
  denix: if flag touches 5 or more different recipes.. rp suggests 8 fray:
even #
  rp - distro specific thing, e.g. yocto doesn't get rid of x, user can
  fray: define default answer, or distro defined?
    oe-core shouldn't require a distro file to be present
    default in most cases is on
  can only provide sane defaults for flags in main layer
    complain about flags used but not defined
  avoid bb multistate flags
  avoid arbitrary values
  distro features already binary only
  fray: distro flags part of hash
  rp: checksum of distro features variable (denix: sort before hashing)
 * multilibs
   all agree that multilib needs to not hinder the non-multilib case
==> continue any discussion needed on ml
Minutes

fray: will have a way to separate layer oe-core layers out, but don't have
it today
  move meta-demo to yocto.. meta-rt stays for now, becomes a seperate
repository/layer in the future

==> getting rid of poky name: poky -> core

distro conf file included or not? sane defaults to allow to run with no
distro
rp: propose to keep yocto config in sync with oe-core amap
  keep defaults matching
  implicitly agree

rp: poky.lsb override becomes linuxstandardbase
  flag becomes override as well
  in distrofeatures becomes override

pokyimage.bbclass can become coreimage.bbclass
longer term, merge in

tasks -> core

fixing local.conf
==> document bbmask
==> simplify local.conf.sample

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

