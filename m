Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id B1BA860EA4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 08:03:08 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id jy13so2258671veb.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Oct 2013 01:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tvBpn9ROGwP7TXsfMBLUiMHSE0TtN+qcDZQQPKtyrPo=;
	b=mFrEOSNNcVs1wIsmq3FaY9DXRnjKqOGwe8O+ZKqbqc7MsUahJMUP5+8pkYoPGbf9LG
	Whb2y2ZiSSz2aNVYWJwpKbp++jUH7DjICoJXpe5GLDQMGlRZ3s34LWVdnpzDoQBjih83
	KYbe3k8pI0uCDNOiPYpm6XUJQ8jiFcD37u8NKJtlWdtrB/3V8aa9Y3ykeV16akXbftfU
	sWdNro4AS4Xevp0hSL9aLw0XJ8DcT+HQq44hfE80ZzP+bQyEgr2XC2gR/GSJsmnNJDoj
	0r6e4mMZeZcqjYm+/4MkpFLi62DcQQ2WVzKTRtFFWIaqQ/Ksu7Xcbeccp3GSc/V52QCo
	RtxQ==
X-Gm-Message-State: ALoCoQk9AlK/9Yc5TZqEqxVxNl0Vojm8zOZDeBMjq+r9zNrhGYOS7sCz1murX5q+7pwXOpAUpJDE
X-Received: by 10.220.11.7 with SMTP id r7mr11349072vcr.12.1380873790118; Fri,
	04 Oct 2013 01:03:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 4 Oct 2013 01:02:50 -0700 (PDT)
In-Reply-To: <524E24AE.5060009@windriver.com>
References: <524E24AE.5060009@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Oct 2013 09:02:50 +0100
Message-ID: <CAJTo0LZ9hgtDX1EHvinBtrnVgJsm6YeTOQ6p1FBp49MTVOn4+A@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: DISTRO_FEATURES and world builds.
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
X-List-Received-Date: Fri, 04 Oct 2013 08:03:09 -0000
Content-Type: text/plain; charset=UTF-8

On 4 October 2013 03:15, Randy MacLeod <randy.macleod@windriver.com> wrote:
> ERROR: Nothing PROVIDES 'virtual/libgl' (but
> /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/clutter/clutter-1.0_1.14.4.bb,
> /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb,
> /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/glew/glew_1.10.0.bb,
> /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-qt/qt4/qt4-x11-free_4.8.5.bb,
> /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/mesa/libglu_9.0.0.bb,
> /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb
> DEPENDS on or otherwise requires it)
> ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required distro
> feature ['opengl'] (not in DISTRO_FEATURES)

Would a better solution be for "world" builds to recognise that a
dependency was explicitly skipped and turn that into a warning instead
of an error?

Ross

