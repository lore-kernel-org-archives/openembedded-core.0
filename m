Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 297DD606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 12:15:28 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id p126so6494125qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PDZTSJ39WZEfNC7AyZnNizMYLbzB6m07yHK2XI+i1Ug=;
	b=sEu47BvEI+hc+WlfkOx0YHjKfvpA7QiDfAONuRk37Luu7+yJ2cTunpOMyaIfgxJ3vY
	D/Ght03qsO9YS4XbfrWJPLmFk48Lnlz31A9ExTxUAMKqWjAOb6ziE33Wdoo4JfQiXqYa
	UGWTAu4aW/ANd9ARRNQ8SRAmV2AONK1g/WeUgZ/SDgXFhzltos9d/IB4fSEboCDtV0fN
	e2EcQ9cOqsRRxJ52fj1kGG2sr+7RBr0txUP/gCxEZG1XvCmOm7jw3dyRVXE7/o1wEFzh
	UQloD1uSVvFRzmmzaVLYagK2d7UIFf4L0iVFVOhKnpJ406C0GZ4FeJrcwbHGNZ4mLYLH
	8N9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PDZTSJ39WZEfNC7AyZnNizMYLbzB6m07yHK2XI+i1Ug=;
	b=Fs0w33jrX62CxavngdEmrQmuO7yU6kuiIXzhWs2jDwmdIejPeP5v+Pk8hHX16uJbas
	UExZ9TrDBlk/VNSVOU86RO41UUrJto+r2Wj2zHt4HVu7s2SJAIP9jLBlLx/vWEeh4Bug
	dtidTAkGn3TI554nqxVD0OityuhJV445ypPwQc2zBNpJBxNetHs/pM2FxgGwA88EQeVY
	aDKi1w8kZib5PgXBSdznPMv7A3Ce/NxrKGz9YhZ0NSRNJZEQqkfBOu4iKvbLPxHMo5ca
	Hy1U6ntQPTdO5jcNOHzjFtAZymuRvNa7yOBXmRGMphXRUJmgAunZu/wQalXx6R2tfIE1
	VmKw==
X-Gm-Message-State: ALyK8tIk2jpN58k2PXjdX2cmUPloDWLkIfSdr6WyWbj3E252fa6A3312f37HECQ4u5LKBg==
X-Received: by 10.55.155.198 with SMTP id d189mr45992109qke.54.1468844129329; 
	Mon, 18 Jul 2016 05:15:29 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	z1sm1387521qkc.40.2016.07.18.05.15.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 05:15:28 -0700 (PDT)
Date: Mon, 18 Jul 2016 08:16:00 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160718121600.GA18190@openSUSE-i7.site>
References: <20160702081927.7365-1-raj.khem@gmail.com>
	<20160707053905.GA28068@openSUSE-i7.site>
	<CAMKF1spS0OSZ=aWRP+ZJPkcBPn=SfMrgP=uA9SvR8CmNiXm4PQ@mail.gmail.com>
	<20160707200510.GA4311@openSUSE-i7.site>
	<CAMKF1soSd7zJt4PXa0oDzycHK5G6+r1xeh2AvCw3srgFZ-mSCA@mail.gmail.com>
	<CAMKF1srYvEAAeMu8aGhB2OVaG9h+MpweZ-YPdWhME99V-0JMTw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srYvEAAeMu8aGhB2OVaG9h+MpweZ-YPdWhME99V-0JMTw@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] glibc: Upgrade to latest tip of master
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
X-List-Received-Date: Mon, 18 Jul 2016 12:15:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri 2016-07-08 @ 01:55:18 PM, Khem Raj wrote:
> Trevor
> 
> On Thu, Jul 7, 2016 at 1:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > Ok thanks. Let me know if you get to see the same issue on say qemuarm or
> > qemuarm64
> 
> I built core-image-sato/qemux86-64 vmdk with chromium added
> 
> CORE_IMAGE_EXTRA_INSTALL_append = " chromium "
> 
> launched this image in VM and chromium starts normally.

Someday I hope that we'll have a mechanism in place that will be able to
better record the full information about a build to help make it easier for
multiple people to fully recreate the exact same builds, independently (iow,
in situations like this).

I've done my best to recreate your build, and I'm still seeing the failure.
I was able, however, to convince someone else to try building and running
chromium (from master), they tried it, and are seeing the run-time failure
too.

> 
> I am using github.com/kraj/openembedded-core kraj/master branch and
> github.com/kraj/meta-raspberrypi kraj/master
> everything else is upstream master and gcc is 5.x
> 
> here is my build info
> 
> Build Configuration:
> BB_VERSION        = "1.31.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "universal"
> TARGET_SYS        = "x86_64-oe-linux"
> MACHINE           = "qemux86-64"
> DISTRO            = "nodistro"
> DISTRO_VERSION    = "nodistro.0"
> TUNE_FEATURES     = "m64 core2"
> TARGET_FPU        = ""
> meta-raspberrypi  = "kraj/master:b9ba221e520f39bc3e273f709b5ceea02897d525"
> meta-qcom         = "master:0eaea003cac6c3175b0a3682efd6e1f20ecc9dab"
> meta-96boards     = "master:6b2744bf3e82154a9329ab89cf03eec9d1f80837"
> oe-meta-go        = "master:dc19a245ae5224d1c9859119a9c53b6331812400"
> meta-browser      = "master:77736988073a5d90fcff9d0005c8477332ede387"
> meta-metrological = "kraj/master:356f0c33298eb63af415f333fe06121d056261e1"
> meta-multimedia
> meta-gnome
> meta-oe           = "master:f11f8664de82e4f8c23b075542f4c98c16ce1f5e"
> meta              = "kraj/master:96ed9e94082589a62a6c602e5f774c11de3328c6"

At first I looked at your list and thought to myself: why all the extras? For
qemux86-64, all that's needed are:
	- something to provide the meta (poky or openembedded-core)
	- meta-browser
	- meta-openembedded

As such my first build was:

        BB_VERSION        = "1.31.0"
        BUILD_SYS         = "x86_64-linux"
        NATIVELSBSTRING   = "SUSELINUX-42.1"
        TARGET_SYS        = "x86_64-oe-linux"
        MACHINE           = "qemux86-64"
        DISTRO            = "nodistro"
        DISTRO_VERSION    = "nodistro.0"
        TUNE_FEATURES     = "m64 core2"
        TARGET_FPU        = ""
        meta              = "kraj/master:f30e9793b8f247f691e5ffd023e1b83301508409"
        meta-browser      = "master:77736988073a5d90fcff9d0005c8477332ede387"
        meta-oe
        meta-gnome
        meta-multimedia   = "master:303d9ea960e2d88281079a4e71abe2cf8c815184"

Running chromium showed the failure, as usual.

So then I thought I'd try to recreate your build exactly -- except that's not possible:

	oe-meta-go from https://github.com/errordeveloper/oe-meta-go doesn't contain a dc19a245ae5224d1c9859119a9c53b6331812400
	meta-openembedded doesn't contain a f11f8664de82e4f8c23b075542f4c98c16ce1f5e
	openembedded-core from https://github.com/kraj/openembedded-core doesn't contain a 96ed9e94082589a62a6c602e5f774c11de3328c6


But even at that, I ended up removing meta-metrological because:
	ERROR: ParseError at /z/chromium-qemux86-64/meta-metrological/recipes-qt/qtbrowser/qtbrowser_2.0.11.bb:14: Could not inherit file classes/qmake5.bbclass


So I performed my build with:
        BB_VERSION        = "1.31.0"
        BUILD_SYS         = "x86_64-linux"
        NATIVELSBSTRING   = "SUSELINUX-42.1"
        TARGET_SYS        = "x86_64-oe-linux"
        MACHINE           = "qemux86-64"
        DISTRO            = "nodistro"
        DISTRO_VERSION    = "nodistro.0"
        TUNE_FEATURES     = "m64 core2"
        TARGET_FPU        = ""
        meta-raspberrypi__kraj = "HEAD:b9ba221e520f39bc3e273f709b5ceea02897d525"
        meta-qcom         = "HEAD:0eaea003cac6c3175b0a3682efd6e1f20ecc9dab"
        meta-96boards     = "HEAD:6b2744bf3e82154a9329ab89cf03eec9d1f80837"
        oe-meta-go        = "master:0712320950adf810fb324d49fba5d49ae19981b0"
        meta-browser      = "HEAD:77736988073a5d90fcff9d0005c8477332ede387"
        meta-oe
        meta-gnome
        meta-multimedia   = "master:303d9ea960e2d88281079a4e71abe2cf8c815184"
        meta              = "kraj/master:f30e9793b8f247f691e5ffd023e1b83301508409"

This build succeeded (with gcc-5%), but running chromium caused the failure to
occur, as usual.

In the last couple weeks I've built chromium for x86-64 52 times and haven't
once seen it run successfully unless glibc was at 2.23. Plus I've had someone
else independently build and run chromium once, and it failed. I'm baffled how
it could be failing for me but succeeding for you :-(

