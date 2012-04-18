Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKT7F-00083e-4m; Wed, 18 Apr 2012 13:32:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IBMdpI000800;
	Wed, 18 Apr 2012 12:22:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00502-02; Wed, 18 Apr 2012 12:22:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IBMV9u000793
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 Apr 2012 12:22:32 +0100
Message-ID: <1334748154.24091.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Apr 2012 12:22:34 +0100
In-Reply-To: <20120417133207.GC3665@jama.jama.net>
References: <20120417131445.7F9BF10219@opal>
	<20120417133207.GC3665@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : gst-plugins-bad: Add missing PR bump after curl change
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
X-List-Received-Date: Wed, 18 Apr 2012 11:32:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-17 at 15:32 +0200, Martin Jansa wrote:
> Please revert DISTRO_FEATURES_LIBC_DEFAULT change as it doesn't belong
> to this commit.

Eeek, sorry about that :(. Not what I'd meant to do at all, this was
intended for post 1.2 discussion.

I'm left in two minds over this change since it does fix a real world
issue with toolchains and has now gone through two sets of build
testing. Reverting it in some ways creates more risk that leaving it
alone now :/.

I'm going to run some tests locally but I might leave this alone as it
does improve certain problems and shouldn't have any negative effects
(particularly as the automated testing completed against it).

Cheers,

Richard



> On Tue, Apr 17, 2012 at 01:14:45PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 2865d01773e405212aa6f531139898d90a6819a8
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=2865d01773e405212aa6f531139898d90a6819a8
> > 
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Tue Apr 17 12:33:01 2012 +0100
> > 
> > gst-plugins-bad: Add missing PR bump after curl change
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > ---
> > 
> >  meta/conf/distro/include/default-distrovars.inc    |    4 +++-
> >  .../gstreamer/gst-plugins-bad_0.10.23.bb           |    2 +-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> > index 16b3108..f770919 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -10,12 +10,14 @@ LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
> >  ENABLE_BINARY_LOCALE_GENERATION ?= "1"
> >  LOCALE_UTF8_ONLY ?= "0"
> >  
> > -DISTRO_FEATURES_LIBC ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> > +DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> >  					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
> >  					libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code \
> >  					libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
> >  					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
> >  					libc-posix-wchar-io"
> > +DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
> > +DISTRO_FEATURES_LIBC_virtclass-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
> >  DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g x11 ${DISTRO_FEATURES_LIBC}"
> >  
> >  IMAGE_FEATURES ?= ""
> > diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> > index fbe1709..a277417 100644
> > --- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
> > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> >  
> >  DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg curl"
> >  
> > -PR = "r1"
> > +PR = "r2"
> >  
> >  inherit gettext




