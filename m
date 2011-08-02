Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QoDDI-0004St-CK
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 13:32:44 +0200
Received: by wyg30 with SMTP id 30so2443309wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 04:28:23 -0700 (PDT)
Received: by 10.216.141.166 with SMTP id g38mr1911904wej.54.1312284502990;
	Tue, 02 Aug 2011 04:28:22 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t46sm3950109wec.14.2011.08.02.04.28.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 04:28:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 2 Aug 2011 13:28:16 +0200
Message-Id: <7743C457-85FC-40B5-A6B6-3C7C0D1D6C05@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1244.3)
X-Mailer: Apple Mail (2.1244.3)
Subject: Ideal (combined) repo layout?
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
X-List-Received-Date: Tue, 02 Aug 2011 11:32:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I've been experimenting with a combined repo =
(https://github.com/koenkooi/Angstrom-integration-layer/) the past few =
days and I have some mixed feelings about it. I tried to mimic the yocto =
setup and the questions I get from people are "how do I know where all =
the stuff is originally from", "what if I want to contribute upstream" =
and "git submodules are awesome, combo repos aren't".=20

So let's assume that we want a single git repo that people can clone the =
way they expect (awesome, submodules ruled out already), is intuitive to =
use and facilitates contributing back upstream. Since this is a from =
scratch effort I don't need to mimic yocto since, but can if it makes =
sense. Having said all that, here's the layout I was thinking of:

sources/
	o bitbake (external git, bitbake)
	o layers/
		* meta (external git, oe-core)
		* meta-openembedded (external git, meta-oe)
		* meta-efl (external git, meta-oe)
		* meta-angstrom (external git, meta-angstrom)
		* ...
	o downloads (DL_DIR)

build/
	o tmp(-$TCLIBC) (TMPDIR)
	o shared-state-cache (SSTATE_DIR)

output/
	o images (DEPLOY_DIR_IMAGE)
	o packages (DEPLOY_DIR_(IPK/RPM/DEB)

conf/
	o auto.conf  bblayers.conf  local.conf  sanity_info  site.conf =
(under git control)

All the meta-* directories are at the same level and the build output is =
easier to find and not hidden a few levels deep in build/TMPDIR. I think =
this would be an improvement over the existing angstrom and yocto =
layout, but I've been doing this for the past 7 years so I'd appreciate =
a fresh look from other people[1].

regards,

Koen

[1] especially if you have been or are presently using eclipse, I don't =
get along with IDEs=


