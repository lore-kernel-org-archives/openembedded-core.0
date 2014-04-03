Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8CFEB617AA;
	Thu,  3 Apr 2014 14:24:31 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id db12so310694veb.38
	for <multiple recipients>; Thu, 03 Apr 2014 07:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+B8xDxHWgYg8BvGvYEJzWciYrJffrPVgxg3DGyxALl8=;
	b=wP40+rUyXLv8zJh2SZnFFyuXMRLL5h8kwtZwld+4b+MFwaKSRLkmRHIeCa85uEbspG
	36B4IP1vxlAQ7P+oKSdrXxGUU1qtbXEQbxXDBMGgM/7m8advHkPFJgP/QhEdk6tzbVJ4
	3u0g10jLeOtxgNs72Tps5KjsV8mR8TS+PcPMJIYAfFBiEmd2queGWHC5Bbps4h4z8cHO
	LO9B4m4L13lzTHq/nsgPDd5y2Z3wnYpRxNuOkgTJdirT480TCevYktTnlAJgNPmGXSuB
	KhaLeeFAuKhoXJcYFD5vlA0X1Jarj3H71XMUSfD63hWZJgqjTf7y/zVFgzkILNFCNd1r
	3+8w==
MIME-Version: 1.0
X-Received: by 10.52.104.33 with SMTP id gb1mr6540762vdb.45.1396535072792;
	Thu, 03 Apr 2014 07:24:32 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Thu, 3 Apr 2014 07:24:32 -0700 (PDT)
In-Reply-To: <20140403130609.GF2132@jama>
References: <20140403130609.GF2132@jama>
Date: Thu, 3 Apr 2014 16:24:32 +0200
Message-ID: <CALbNGRQY409cj2TUy9EoS6d1LQ0O_r+2c9Dowk-h9A7Mcy3QTQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2014-04-03
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
X-List-Received-Date: Thu, 03 Apr 2014 14:24:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 3, 2014 at 3:06 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Mar 30, 2014 at 01:28:00AM +0100, Martin Jansa wrote:
>> Be aware that I plan to run test-dependencies script for next few days,
>> so changes to meta-oe will be delayed until it's finished and I can use
>> jenkins again to test incoming changes.
>
> I've just started this long test-dependencies build so jenkins will be busy
> for next 14 days or so, but I'll send complete qa.log in advance as soon as
> it finishes building world from scratch.
>
> The report looks a lot better, thanks to everybody who sent patches! Be aware
> that qemuarm still shows a lot more failures, that's because only last qemux86-64
> build contained all fixes from ML.
>
> Here is just qemux86-64 build:
>   meta-qt5/recipes-qt/qt5/qtbase_5.2.1.bb, do_configure
>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>   meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_install
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb, do_configure
>   meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
>   meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb, do_configure
>   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb, do_compile
>   openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb, do_configure
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_configure
>   meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_compile
>   meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, do_configure
>
> qtbase was broken by one patch from oe-devel ML, I've removed it for now.
>
> abiword was upgraded to fix failure, but will need some more changes.
After a short look into build log make me guessing that

-PARALLEL_MAKE = ""

was not a good idea...

Will send a follow up patch this evening

Andreas

