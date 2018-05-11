Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id B66D0782DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 18:56:49 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id n10-v6so3778722plp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 11:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H7o01pEsvjy/vlzYfsRBs0pKyoaMLYvdAmAcKo7+vfk=;
	b=CqnU7gVeAGIHezf8OWr2HLfQOdzI53VfgV7ivcn0nCciCG6ccTpudQaqVDh84UzK4T
	6p3WB8XRnoD1FZAk0SYiHpT0EllVLw27RcdNIuaWuXX1xWtlJfyGeK6d+oZcSrl4Xyn4
	dqAh/ho+BvfxLolio/QWyhD3uZsq9dNrf+fXE2Y9UW4tLMoHqK0ns9czoMVO4r+eMybZ
	B1VgP/XizsRRZn74RosRMy50wstvdAD6OFaoDxJSLLiaARAdKbPdUC+aG3CVRidCY4j8
	XtR7FbKoVKXvhogLCh78Qivu5KgAUrWEYFWmBI/eK29Gjo9vDS/7rA/19axyubhxakiG
	wdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H7o01pEsvjy/vlzYfsRBs0pKyoaMLYvdAmAcKo7+vfk=;
	b=TCmVzgJe5LoWwTYI1SylWBDEgnBi+yqqCXGeNQA5DTtNLZSs+Fd1fJHMFIOtu0Mfc2
	xajQI5xmIES2VEaPre5bENZqcx08ftF43Oplh74nCS6G4mN6P1BtZFvcz1bsrWbgJeCp
	LIxYrbNvYoLAAzJ3mrfyPMR18b3ZzH6poG46M89qznZ7lP5HlvpUGSOYmmk54eyOqepF
	i00HjtjvcCiMNfcNCURvpIApXPR6ZiSbtX1Xg0vjCGE1A5xzQAECGMbliMkluv5yDeSA
	TVra5VTsodRQtIPS+e3vI3jx8erebWWt9FUeNSyJWxLRk5uknNVYhzT8srMIe2T8tbcI
	3Hlw==
X-Gm-Message-State: ALKqPwdEpzyP+UgDi+j4SSLGuRi+I5u//VbHG3J8NNbAHF05s9Xfq9G+
	zGNMWFpFm5j8/dLlIkP56s35S2NIwtscC6e6JQ4=
X-Google-Smtp-Source: AB8JxZrkAHbAU+3ZkVLM2ik2wB4qodXHGvMpx+6saAalXEY8XfAS1YrW8w4bO2ZQ7i/blyPtxqC+g+h311oAZ3ERyPY=
X-Received: by 2002:a17:902:59ce:: with SMTP id
	d14-v6mr6721202plj.253.1526065010302; 
	Fri, 11 May 2018 11:56:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.139.145 with HTTP; Fri, 11 May 2018 11:56:19 -0700 (PDT)
In-Reply-To: <1526059514-31799-1-git-send-email-cjp256@gmail.com>
References: <1526059514-31799-1-git-send-email-cjp256@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 May 2018 11:56:19 -0700
Message-ID: <CAMKF1sqdyiscFziLxV+oMpGFxrc1TAVHT0JUj14sAPnOyv6zAA@mail.gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: Chris Patterson <pattersonc@ainfosec.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] qemu: add gettext-native to DEPENDS
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
X-List-Received-Date: Fri, 11 May 2018 18:56:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 11, 2018 at 10:25 AM, Chris Patterson <cjp256@gmail.com> wrote:
> From: Chris Patterson <pattersonc@ainfosec.com>
>
> Otherwise QEMU build may fail with missing `msgfmt` command.
>
> | make -C po install
> |   GEN     bg.mo
> |   GEN     tr.mo
> |   GEN     de_DE.mo
> | /bin/sh: msgfmt: command not found
> | /bin/sh: msgfmt: command not found
>

are you enabling gtk+ packageconfig ?
I dont see po files build built otherwise if you are enabling gtk+
then please move the
dependency into that packageconfig.

Adding gettext dependency especially on native recipes can dampen
parallism and increase
build time due to serialization. And qemu-native is quite a
fundamental package we need at early
stages of build.

> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index dc73df8..78fa30c 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -1,7 +1,7 @@
>  SUMMARY = "Fast open source processor emulator"
>  HOMEPAGE = "http://qemu.org"
>  LICENSE = "GPLv2 & LGPLv2.1"
> -DEPENDS = "glib-2.0 zlib pixman"
> +DEPENDS = "glib-2.0 zlib pixman gettext-native"
>  RDEPENDS_${PN}_class-target += "bash"
>
>  require qemu-targets.inc
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

