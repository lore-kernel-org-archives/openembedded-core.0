Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8094E6AED0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 09:42:53 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5S9mbYl022215; Fri, 28 Jun 2013 10:49:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 589wS1ImpoiW; Fri, 28 Jun 2013 10:49:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5S9nZc4022234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 28 Jun 2013 10:49:36 +0100
Message-ID: <1372412549.9930.248.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <Kai.Kang@windriver.com>
Date: Fri, 28 Jun 2013 10:42:29 +0100
In-Reply-To: <51CD5880.7000102@windriver.com>
References: <cover.1372403777.git.kai.kang@windriver.com>
	<0b6b3178a957a5f1719d6e7d3de74ef10e997266.1372403777.git.kai.kang@windriver.com>
	<2137104.dM5Hszjkko@helios> <51CD5880.7000102@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] Disable build qt related packagegroups on mips64 with 64 bits userspace
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
X-List-Received-Date: Fri, 28 Jun 2013 09:42:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2013-06-28 at 17:33 +0800, Kang Kai wrote:
> On 2013年06月28日 17:00, Paul Eggleton wrote:
> > Hi Kai,
> >
> > On Friday 28 June 2013 15:48:47 Kai Kang wrote:
> >> Because qt could not be built on mips64 with 64 bits userspace, set
> >> COMPATIBLE_HOST for qt related packagegroups to disable them on mips64
> >> with 64 bit userspace too.
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   .../packagegroups/packagegroup-core-qt.bb          |    3 +++
> >>   .../packagegroups/packagegroup-core-qt4e.bb        |    3 +++
> >>   .../packagegroup-qt-toolchain-target.inc           |    3 +++
> >>   3 files changed, 9 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
> >> b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb index
> >> 315df33..c993242 100644
> >> --- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
> >> +++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
> >> @@ -6,6 +6,9 @@ DESCRIPTION = "Qt package groups"
> >>   LICENSE = "MIT"
> >>   PR = "r4"
> >>
> >> +# Qt4 could NOT be built on MIPS64 with 64 bits userspace
> >> +COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
> >> +
> >>   inherit packagegroup
> >>
> >>   PACKAGES = "${PN}-demoapps"
> >> diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> >> b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb index
> >> 9263828..6ef844f 100644
> >> --- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> >> +++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> >> @@ -2,6 +2,9 @@ SUMMARY = "Qt for Embedded Linux (Qt without X11)"
> >>   PR = "r2"
> >>   LICENSE = "MIT"
> >>
> >> +# Qt4 could NOT be built on MIPS64 with 64 bits userspace
> >> +COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
> >> +
> >>   inherit packagegroup
> >>
> >>   # For backwards compatibility after rename
> >> diff --git
> >> a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> >> b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc index
> >> 8413eec..fc1ccba 100644
> >> --- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> >> +++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> >> @@ -1,5 +1,8 @@
> >>   LICENSE = "MIT"
> >>
> >> +# Qt4 could NOT be built on MIPS64 with 64 bits userspace
> >> +COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
> >> +
> >>   inherit packagegroup
> >>
> >>   PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
> > I'm fine with the other change; the question is is this one needed in addition?
> > Since the packagegroup-*qt* recipes reference packages from Qt which itself
> > inherits qt4x11/qt4e bbclasses, surely trying to build these will immediately
> > fail for mips64 anyway?
> 
> Yes, it will fail immediately. What I want to do is to underline these 
> packagegroups' build platform.
> If you believe that they are redundant, I retrieve the patch 2/2.

At a guess the one advantage of this is to clean up what "bitbake world"
would show?

Cheers,

Richard


