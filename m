Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (unknown [209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0F266086
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 15:29:01 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id a108so584206qge.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 08:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=Od8iLWP2BpVQVBpUiCyQV3YynQC8OG9MW4lpODYYNf0=;
	b=I7u6v/pipir61bt6EK8vTGVqGAC67HQ+m208lo8wZfQQmqor0XwW4YYl0OnX/zZtU+
	B6t2DZVw8b2uN0ck1QtbhR+aaB1QmP0ONJGVXD/Y1b8QAslDAzEsrOqHxs8+si1Vj3Ns
	kR9K5/jxrZUhCgQ/h7+gp+2MKXGfB5rgsa30W7b/tvKkrcp0e5Gx0na6avCsgZpe48kj
	QBKNnNaa5YYiHXBX8vUcLCaZu0E7JO0T/k4ECTKMwUIpasuTCwO5bfhyYrQ0MF73GBK0
	/m3MhZz02c/YMIATcnoRL1N32nJIVbvVyqWpOlaHZY19MHJJmrXSCrwFFxNMHpDP1Uxm
	CmXA==
X-Gm-Message-State: ALoCoQnR83xqfSp9ln38fM+klAnlH6iEJueZKic4HmKGSUHZ6GSkvUv8G9aWlNDHlGfCv2aaMG7s
X-Received: by 10.140.25.37 with SMTP id 34mr21016490qgs.60.1399994942738;
	Tue, 13 May 2014 08:29:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Tue, 13 May 2014 08:28:42 -0700 (PDT)
In-Reply-To: <cover.1399993010.git.valentin.popa@intel.com>
References: <cover.1399993010.git.valentin.popa@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 May 2014 16:28:42 +0100
Message-ID: <CAJTo0LaNVqizccFhw8E_Bp8WXX07ZB9Mu+_DoQ0tmjcLf8f=Fg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/3] mesa upgrade
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
X-List-Received-Date: Tue, 13 May 2014 15:29:03 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

As this is a major release of Mesa I'm expecting breakage somewhere...
 Can BSP maintainers please test these patches if their machines build
Mesa?  I'm expecting machines that use mesa-gl to break if they don't
just use the pure software drivers (so that's at least EMGD and if I
recall correctly some ARM drivers).

Ross

On 13 May 2014 15:59, Valentin Popa <valentin.popa@intel.com> wrote:
> mesa upgrade to 10.1.3
>
> The following changes since commit 40551859671a1c9da26cfdcda34da952c66ac8c2:
>
>   qemu/local.conf.sample: Add sdl PACKAGECONFIG (2014-05-13 08:02:04 +0100)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib vpopa/mesa
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=vpopa/mesa
>
> Valentin Popa (3):
>   dri3proto: add it to oe-core
>   libxshmfence: add it to oe-core
>   mesa: upgrade to 10.1.3
>
>  .../mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb}   |  0
>  meta/recipes-graphics/mesa/mesa.inc                | 35 +++++++++++++---------
>  .../mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb}         |  4 +--
>  meta/recipes-graphics/mesa/mesa_git.bb             |  4 +--
>  meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb | 17 +++++++++++
>  meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb  | 14 +++++++++
>  6 files changed, 56 insertions(+), 18 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb} (82%)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
>  create mode 100644 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

