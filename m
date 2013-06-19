Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id A0F8560071;
	Wed, 19 Jun 2013 08:07:44 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id ha12so3522950vcb.21
	for <multiple recipients>; Wed, 19 Jun 2013 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=cZF1x8BPKitDSzE9PD1XyoLUsh1ZnDp4d7nteQvAs6I=;
	b=FBAVr8RfzsrdUzIhAytdC3gvauVvXH8/puikM0NM7NuBEzzztP+STuzmkaby/fJa+q
	5w3C2BGfDSdaZ74hj7gBKEpoQ9OkbELsQ7llMMkENmcE+p1RB+BAl2l9PMkUgzK2yOsz
	hIHw6U5hKqYIrsMMli6xOoM8LaaHmWPfCJSRh01eN3CX9RziJ4ElVUpZQVcArwSf+LFt
	j5Zc0HT4eWu9TAUstx7xkwLzYO4/CQyWnQLi6f1erGtruV/GApaoRY5hf9PQhfWQDpUX
	AWOkue1pRpXwSPUZqtCFiBUt+KS7hJk9QRban+Epaysdh86JJbKvys2qgQwq3cfZUEJz
	E62w==
X-Received: by 10.52.163.165 with SMTP id yj5mr461140vdb.104.1371629265138;
	Wed, 19 Jun 2013 01:07:45 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Wed, 19 Jun 2013 01:07:04 -0700 (PDT)
In-Reply-To: <20130611160434.GI3233@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 19 Jun 2013 09:07:04 +0100
X-Google-Sender-Auth: Z5FfRuM9ew7kpP11VdaPKzPHKVI
Message-ID: <CANyK_8fMj+=hDVMV+q7CJi7_G5HvztE+n_wcHDn0kTUB7dxFhA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world
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
X-List-Received-Date: Wed, 19 Jun 2013 08:07:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 11 June 2013 17:04, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> qemuarm Summary: 14 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130610_065148.log/
>
> qemux86 Summary: 17 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130608_071258.log/
>
> qemux86-64 Summary: 18 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130609_081044.log/
>

Thought I'd post a summary of what fails for MACHINE=raspberrypi at the minute:

    meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb,
do_compile
    openembedded-core/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb,
do_compile
    openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_compile
    meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb,
do_compile
    openembedded-core/meta/recipes-graphics/wayland/weston_1.1.0.bb, do_compile
    meta-openembedded/meta-oe/recipes-support/gperftools/gperftools_2.0.bb,
do_compile
    openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb,
do_configure
    meta-raspberrypi/recipes-multimedia/omxplayer/omxplayer_git.bb, do_compile
    meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb,
do_compile
    meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb,
do_compile
    meta-openembedded/meta-oe/recipes-support/mg/mg_20110905.bb, do_configure
    openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb,
do_compile

A lot of these are related to missing vcos_platform_types.h
(https://github.com/raspberrypi/firmware/issues/34).

luajit is rather a strange error, HOST_CC can't find <sys/types.h> or
some other common headers.

mplayer2 is failing to find <mad.h>, this needs the same sort of fix I
made to vlc (http://git.openembedded.org/meta-openembedded/commit/?id=3d6369b7c39d78b0d424dbe5a97e736b694e3c48).

Full logs, conf files, etc: http://www.paulbarker.me.uk/yocto/20130617_poky/

Note that for the final build everything in "fixes/" has been applied,
including Khem's patches for gypsy, omgps, packagekit and tk.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

