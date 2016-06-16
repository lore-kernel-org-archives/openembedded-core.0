Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 9D32C73193
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 11:01:09 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20160616110045386_0485
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 11:00:45 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=56498 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bDV46-0004Fb-6F for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2016 07:02:26 -0400
Date: Thu, 16 Jun 2016 07:00:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1606160643040.23824@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: couple trivial(?) questions regarding RPM revision/version numbers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 11:01:09 -0000
Content-Type: text/plain; charset=US-ASCII


  not at my dev machine at the moment; otherwise, i could just test
this but i'd probably still want clarification, anyway.

  so, i'm well aware that a single recipe can generate numerous (in my
case, rpm) package files. basic case: a recipe can generate the "base"
package, a "doc" package, a "dev" package, and so on and so on. no
problem there.

  first clarification -- regardless of how versioning and revisioning
is being done, *all* packages generated from a single recipe during
the same build have to have the same version and revision number, yes?
i can't imagine how that couldn't be true, but i've been surprised
before.

  next question -- if any part of the base content for a recipe
changes and that recipe is processed again, all generated packages
have to jump to the next version/revision together, correct? again,
this seems obvious, but i want to make absolutely sure.

  so if i have a recipe for which i make a tiny change that affects
the content of only one of the generated packages, if the revision
number increases from, say, "r4" to "r5", *all* of the generated
packages go along for the ride, even all the rest of the packages
whose content did *not* change. so i could end up with a slew of
generated packages whose revision number increased, even though
absolutely nothing about the package content actually changed. so far,
so good?

  and finally, if the above is accurate, at some point, if i get an
updated recipe, and rebuild never package files from it, and do an
update, a lot of those "newer" packages might not contain any actual
changes, and if that happens, does the rpm update operation actually
do any work?

  i understand that the end result will be(?) that all of those
related packages will now have the newer revision number once the
update is done, but it's entirely possible (even normal) for there to
have been no change effected by that "update". and in cases like that,
even if one of my packages was "updated":

  rday-doc-1.0-r0  --->  rday-doc-1.0-r1

the content of that package could be unchanged. and if that happens
(and if everything i've been saying so far is true), is rpm smart
enough to not do any work in cases like that, and just quietly bump up
the version number of the installed package and move on?

  is there anything here i'm missing or misunderstanding? thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


