Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sdqbu-0005LX-Hu
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 00:27:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jun 2012 15:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="151060106"
Received: from unknown (HELO helios.localnet) ([10.252.120.99])
	by orsmga001.jf.intel.com with ESMTP; 10 Jun 2012 15:17:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Sun, 10 Jun 2012 23:17:15 +0100
Message-ID: <2136941.XPPaWGlh8A@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-24-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <CAMZjud0TFhLgd2H+fEifCgMC26mqPb0+ab=1OZzFE6=MRvRMFg@mail.gmail.com>
References: <1339153524-20746-1-git-send-email-bogdan.a.marinescu@intel.com>
	<20120608112246.GI3140@jama.jama.net>
	<CAMZjud0TFhLgd2H+fEifCgMC26mqPb0+ab=1OZzFE6=MRvRMFg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpcre: updated to version 8.30
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
X-List-Received-Date: Sun, 10 Jun 2012 22:27:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 08 June 2012 14:32:07 Marinescu, Bogdan A wrote:
> On Fri, Jun 8, 2012 at 2:22 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Fri, Jun 08, 2012 at 02:05:24PM +0300, Bogdan Marinescu wrote:
> >> Tested by compiling lighttpd
> >> 
> >> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> >> ---
> >>  .../libpcre/{libpcre_8.21.bb => libpcre_8.30.bb}   |   10 +++++-----
> >>  1 file changed, 5 insertions(+), 5 deletions(-)
> >>  rename meta/recipes-support/libpcre/{libpcre_8.21.bb => libpcre_8.30.bb}
> >> (86%)
> >> 
> >> diff --git a/meta/recipes-support/libpcre/libpcre_8.21.bb
> >> b/meta/recipes-support/libpcre/libpcre_8.30.bb similarity index 86%
> >> rename from meta/recipes-support/libpcre/libpcre_8.21.bb
> >> rename to meta/recipes-support/libpcre/libpcre_8.30.bb
> >> index f5fa4ef..83831e7 100644
> >> --- a/meta/recipes-support/libpcre/libpcre_8.21.bb
> >> +++ b/meta/recipes-support/libpcre/libpcre_8.30.bb
> >> @@ -5,15 +5,15 @@ provides a POSIX calling interface to PCRE; the regular
> >> expressions \ themselves still follow Perl syntax and semantics. The
> >> header file for \ the POSIX-style functions is called pcreposix.h."
> >>  SECTION = "devel"
> >> -PR = "r1"
> >> +PR = "r0"
> >>  LICENSE = "BSD"
> >> -LIC_FILES_CHKSUM = "file://LICENCE;md5=2f00d186a775c8002422a5315079d96b"
> >> -SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
> >> +LIC_FILES_CHKSUM = "file://LICENCE;md5=115e2bee152e2e23e838a29136094877"
> > 
> > What's changed in LICENCE? And add it to commit message in v2.
> 
> The copyright was extended to 2012. Do I need to resubmit the patch
> with this information?

I would say yes; if LIC_FILES_CHKSUM changes legitimately for any reason we 
should always mention the reason in the commit message.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


