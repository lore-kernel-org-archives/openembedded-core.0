Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 875F360116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 14:56:01 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id t74so175887366ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2016 07:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=K8pSjPBvZpFEBhLZwQr9o+Yf14ynKR7GHtXEatV7cm4=;
	b=qQZ5K4FgTzbpHDwCMubEHzMn0VwPoPEzDTq5+8gjoYSCcMobqhxAZ/c9NCvoVbWCNA
	zBOH0tnuiwUxfOorUhIX8Ehtmsttoxs0knc06TxnxuSQzpxKNvs1tYswclIIqkJKawmm
	sWxFDNVxU2U9GRzIMB7q+pfkSMbtFlyC5FRSyOc3T5VlvkOD+JMJZcCP5lrrKuGEjoYP
	VgaUX3+d+Y4XIeZq4BiO2vp0dE1Kz1Bw8Z0vc/Huw3yg57IiXLvnJPTF2BUsNqU7YEZB
	QDlkm3xCKtZv5YwlQbyUKgN5AoA7lScukg1OM9EPb9ICHzQ4UINwC4ItKtU8UaaTAoCz
	UdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=K8pSjPBvZpFEBhLZwQr9o+Yf14ynKR7GHtXEatV7cm4=;
	b=O3o2d/xg4lQBw4WzWY1z6Phxi0indfRoSbLwroQHT+I6IVF0a7hY/UV5vvNMSS+dLZ
	XiiJWzCT3LLIxIKIYJXaMrWnT43uTR3cWvw9k7RMGB/Xg3mS5lNslPxkTo6JLGyx4Bwd
	WONflcTTgMbfohLfH+M3aWlr88HGWaJ+Wc4U4DGB2BX+/9NM6PAWWorSSnHDpGcezmBx
	CPDUnVm6I/UP0e5UjCLUrD+gD3pmYJXBj5H2CwOunvKrNoybTGpkDpnQxaRFfxv/415W
	I4Dl5/GMCcTx1FCW8ljDrmorHVHwerMbysv9hZwDy2Jqtv0dj+oH1YVrBKcZjIWDZK0z
	PtJA==
X-Gm-Message-State: ALyK8tKPhVm21FmduF+g3qUm9MvIACwAf9EEil1kELWm1frAFGU75kKq6wo1lJjximeiUw==
X-Received: by 10.107.195.140 with SMTP id t134mr16043259iof.175.1467730562166;
	Tue, 05 Jul 2016 07:56:02 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	f185sm394343ith.0.2016.07.05.07.55.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jul 2016 07:56:00 -0700 (PDT)
Date: Tue, 5 Jul 2016 10:56:14 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160705145614.GA1669@openSUSE-i7.site>
References: <cover.1463157783.git.raj.khem@gmail.com>
	<fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<20160703134538.GA4902@openSUSE-i7.site>
	<CAMKF1spGY2N5ejw=baPouT45sQBAhyYGBL69HRJ=gPWEeHVs6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spGY2N5ejw=baPouT45sQBAhyYGBL69HRJ=gPWEeHVs6A@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] glibc: Add recipes for 2.24 release
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
X-List-Received-Date: Tue, 05 Jul 2016 14:56:02 -0000
X-Groupsio-MsgNum: 84131
Content-Type: multipart/mixed; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Khem,

Sorry for the delay, I wanted to make absolutely sure of the statements in
this email so I started fresh and rebuilt everything from scratch a number of
times, stripped it down to the minimum, just to make sure I wasn't doing
something wrong with the things I'm doing in my normal builds. As you can
guess, building images (especially debug images) involving chromium can take a
while, not to mention I then need to download them from my build machine at
work to my home machine over a slow connection in order to run them... :-)


On Sun 2016-07-03 @ 08:02:04 AM, Khem Raj wrote:
> On Sun, Jul 3, 2016 at 6:45 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> > I just finished a bisection task which implies this patch is the reason why
> > chromium crashes when run on x86_64 (minnow) with signal 4 ILL_ILLOPN. Note
> > that chromium compiles fine both before and after this patch, the problem is
> > when chromium is run.
> >
> > I'm not 100% how to move forward, at this point. Maybe the problem is caused
> > by the remove of the SSE patch?
> >
> > Any suggestions greatly appreciated! :-)
> >
> >
> > Received signal Received signal 44 ILL_ILLOPN  ILL_ILLOPN 557b2cb6cc90557b2cb6cc90
> 
> couple of ideas.
> 
> compile the image with debug info so we can see the full stack trace
> with symbols.

Taking your advice, I installed the chromium -dbg package to my minnow board,
then I installed all the -dbg packages opkg said the chromium -dbg package
recommended (28 in total) and re-ran the browser. I saw a slight improvement
in the dump to:

        root@intel-corei7-64:~/opkg# export DISPLAY=:0
        root@intel-corei7-64:~/opkg# google-chrome 
        [808:808:0703/160711:ERROR:gl_implementation.cc(223)] Failed to load libGLESv2.so.2: libGLESv2.so.2: cannot open shared object file: No such file or directory
        [808:808:0703/160712:ERROR:gpu_child_thread.cc(376)] Exiting GPU process due to errors during initialization
        [780:800:0703/160712:ERROR:browser_gpu_channel_host_factory.cc(119)] Failed to launch GPU process.
        [780:800:0703/160712:ERROR:browser_gpu_channel_host_factory.cc(119)] Failed to launch GPU process.
        Received signal 4 ILL_ILLOPN 55f79db06c90
        #0 0x55f7995a460e <unknown>
        #1 0x55f7995a49d9 <unknown>
        #2 0x7fa49806fe40 <unknown>
        #3 0x55f79db06c90 <unknown>
        #4 0x55f79a2b5580 <unknown>
        #5 0x55f79a2b5d93 <unknown>
        #6 0x55f79a2b3956 <unknown>
        #7 0x55f79a2b41dc <unknown>
        #8 0x55f79aa08c5d <unknown>
        #9 0x55f79a9fd01e <unknown>
        #10 0x55f79a9fdcf0 <unknown>
        #11 0x55f79cb295fe <unknown>
        #12 0x55f79cb2a321 <unknown>
        #13 0x55f79cb1ea1b <unknown>
        #14 0x55f79e03b172 <unknown>
        #15 0x55f79a0cfd86 <unknown>
        #16 0x55f79960e7fd <unknown>
        #17 0x55f79e0a48ce <unknown>
        #18 0x55f79e0a4ec4 <unknown>
        #19 0x55f79960e7fd <unknown>
        #20 0x55f7995c265b <unknown>
        #21 0x55f7995c31dd <unknown>
        #22 0x55f7995c34ab <unknown>
        #23 0x55f7995c4da9 <unknown>
        #24 0x55f7995db3fa <unknown>
        #25 0x55f7995c1495 <unknown>
        #26 0x55f79cb40cd0 <unknown>
        #27 0x55f7995739a1 <unknown>
        #28 0x55f799573f3d <unknown>
        #29 0x55f7995731d1 <unknown>
        #30 0x55f79913cf9a ChromeMain
        #31 0x7fa493637040 <unknown>
        #32 0x55f79913cdfa _start
          r8: 0000000000000000  r9: 0000000000000000 r10: 0000000000000000 r11: 0000000000000202
         r12: 00001884ff4181e0 r13: 0000000000000004 r14: 00001884ff4181f8 r15: 000055f7a0ba0352
          di: 0000134bf2101000  si: 000000000001e000  bp: 00001884ff464000  bx: 00001884ff418200
          dx: 0000000000000008  ax: ffffffffffffffff  cx: ffffffffffffff58  sp: 00007ffe64badc10
          ip: 000055f79db06c90 efl: 0000000000010286 cgf: 0000000000000033 erf: 0000000000000000
         trp: 0000000000000006 msk: 0000000000000000 cr2: 0000000000000000
        [end of stack trace]


As you can see, I went from a dump where no symbols were known to one where
only one was known :-)

I then decided to build an image that included every -dbg package (by adding
"dbg-pkgs" to "EXTRA_IMAGE_FEATURES") and ran the resulting image only to end
up with the exact same trace as above; everything unknown except for one line
with ChromeMain, grrr. I wonder why that didn't work and how I could get it to
work better?



> secondly, see if it fails same way on qemux86-64 as well.


Good idea!

I created minimal, core-image-x11, builds for qemux86-64 and the problem is
demonstrated there as well.

I've attached my local.conf and my chromium recipe if anyone is interested in
seeing this same behaviour too.

At the last ELC I mentioned in the BoF that I was working on splitting the
chromium recipe into -x11 and -wayland parts so that the -x11 part could move
forward independently of the ozone patches. This is what I was working on when
I stumbled across this issue, so I wanted to clear this up before submitting
my chromium updates for review (and, hopefully, inclusion).

To make things easier, start with a simple poky build:

$ git clone git://git.yoctoproject.org/poky meta-poky

You'll need to add meta-openembedded/meta-oe (for ninja) and
meta-openembedded/meta-gnome (for gnome-keyring):

$ git clone git://git.openembedded.org/meta-openembedded

$ . meta-poky/oe-init-build-env

add the two meta-openembedded repositories to bblayers and

$ bitbake core-image-x11

	Build Configuration:
	BB_VERSION        = "1.31.0"
	BUILD_SYS         = "x86_64-linux"
	NATIVELSBSTRING   = "SUSELINUX-42.1"
	TARGET_SYS        = "x86_64-poky-linux"
	MACHINE           = "qemux86-64"
	DISTRO            = "poky"
	DISTRO_VERSION    = "2.1+snapshot-20160705"
	TUNE_FEATURES     = "m64 core2"
	TARGET_FPU        = ""
	meta              
	meta-poky         
	meta-yocto-bsp    = "master:5c11e365e19357f721c49d076971567e7b64b61b"
	meta-oe           
	meta-gnome        = "master:1cb7275961fd4bca3a6cb70e064ad6e6e1ff04d6"

Run the resulting image in qemu, then, at the console:

# export DISPLAY=:0
# google-chrome

...and you'll see the problem.

Start a second build, but before you do, in the meta-poky repository:

$ git checkout 9b25b35

This is the commit just before the "problem" commit. Rebuild, re-run... and
chromium starts and runs without issue.


> sse patch was upstreamed so technically its not removed.

Ah, ok thanks.

--6c2NcOVqGQ03X4Wi
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="chromium-53.tar.xz"
Content-Transfer-Encoding: base64

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

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="local.conf"

MACHINE ?= "qemux86-64"
DISTRO ?= "poky"
DL_DIR ?= "/home/trevor/devel/Downloads"

# build data
INHERIT += "buildhistory"
INHERIT += "image-buildinfo"
INHERIT += "distrodata"
BUILDHISTORY_COMMIT = "1"

LICENSE_FLAGS_WHITELIST = "commercial"

CHROMIUM_BUILD_TYPE ?= "Release"
PACKAGECONFIG_pn-chromium-x11 ?= ""
IMAGE_FSTYPES_append = " vmdk"

# x11
CORE_IMAGE_EXTRA_INSTALL += " \
	chromium-x11 \
	"

# package_rpm, package_deb, package_ipk
PACKAGE_CLASSES ?= "package_ipk"
# dbg-pkgs, dev-pkgs, ptest-pkgs, tools-sdk, tools-debug, eclipse-debug, tools-profile, tools-testapps, debug-tweaks
#EXTRA_IMAGE_FEATURES = "debug-tweaks tools-debug tools-profile dbg-pkgs"
EXTRA_IMAGE_FEATURES = "debug-tweaks"
# buildstats, image-mklibs, image-prelink, image-swab
USER_CLASSES ?= "buildstats image-mklibs image-prelink"
# user, noop
PATCHRESOLVE = "noop"
# auto, gnome, xfce, rxvt, screen, konsole, none
OE_TERMINAL = "auto"
# contents of ~/local/bin/oeshell.sh: /bin/bash --rcfile $HOME/.bashrc.oe
#OE_TERMINAL = "custom"
#OE_TERMINAL_CUSTOMCMD = "/usr/bin/xterm -e $HOME/local/bin/oeshell.sh"

BB_DISKMON_DIRS = "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    ABORT,${TMPDIR},100M,1K \
    ABORT,${DL_DIR},100M,1K \
    ABORT,${SSTATE_DIR},100M,1K"
PACKAGECONFIG_append_pn-qemu-native = " sdl"
PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
ASSUME_PROVIDED += "libsdl-native"
CONF_VERSION = "1"

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="bblayers.conf"

# POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
POKY_BBLAYERS_CONF_VERSION = "2"

BBPATH = "${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
  /z/chromium-qemux86-64/meta-poky/meta \
  /z/chromium-qemux86-64/meta-poky/meta-poky \
  /z/chromium-qemux86-64/meta-poky/meta-yocto-bsp \
  /z/chromium-qemux86-64/meta-openembedded/meta-oe \
  /z/chromium-qemux86-64/meta-openembedded/meta-gnome \
  "

--6c2NcOVqGQ03X4Wi--
