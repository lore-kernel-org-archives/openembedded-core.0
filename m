Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 52AA161625
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 19:28:41 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a5so728371wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 11:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kltKRz4ulwJotlMTovvF50jSXNlL4MDEry9XJ0l2Qn8=;
	b=Y2DXb7TpWsWCumOg4XUeJ2IQROZhbDJECALw1Kjve4lhVxmPCy/ADJIKqccXCQADJK
	VKvqwgXELIvkVzhBsWc4LJqfBHwudTVO8fn8O1gxC4GxniUsMHuczZ1S94GOaYg/gd5s
	43s/3JxhUJC5illYcJEIWU1blH7dpT3yPtjeQ6IPKa0vzFyMaKDVvfAkBFb3DD3jy7+x
	Lg0i7mDQtBKfe+6w6PxVvM5qjAlqq9n5rA5jITQDJEeNILJ1x6Kndlj/Gs5z5oNsTLKU
	PoYeKvk1ICZ8Wb8DzDeSv8GMzx+NFZnBQRL41iNmQy6lX0KjSumxp6dfW/Ld9RtLC/Tr
	BQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kltKRz4ulwJotlMTovvF50jSXNlL4MDEry9XJ0l2Qn8=;
	b=Q1Cl02W2b0hjuIrBTFplTHsYLUEl7efs29tUizqJcg2WHe5fXTbH2G0COqPp5T2iw5
	qNtDX2//M8d83f/syoqzKogT01C/vF7dQwvuYCkZLW2Skzp6YjYX64dlgKt0HnBaChBX
	TbyE/vDzK34iwwcVbZhA2Idv95KveIsXBYNr4bSj86U19H8xRF5BicCmflKafX7uZ7ip
	JrsQuaMiYAejs0cSlIFW3Efz19rXB4tFyppO9TM+ETIAfb1DFs1q2u0/kRrOQvB8h6l5
	n3F6rz7Gqar6/67V93ccU3nElhVMEA1UAAECwxpNfrQO3drDUQX8SoPlhm8h7niJfD9J
	9KkA==
X-Gm-Message-State: APjAAAWIk4MXOR0Eq9FKewAg3PYf6ZJMB6ZewOcuPheRmVAUgXq4PsPQ
	6W+36GQ5HWy7Jpw6LUeNnh+ku/dPEGOk/W+VnZmOdA==
X-Google-Smtp-Source: APXvYqxqxI09KWyH2nIOm55htrHisEDDCSHDZJIKcwIUnhtjh4XDQThJejbD/Ai99Wx/bZWipp0UtyllgPlkE/hvtuQ=
X-Received: by 2002:a1c:a505:: with SMTP id o5mr311313wme.78.1582831721767;
	Thu, 27 Feb 2020 11:28:41 -0800 (PST)
MIME-Version: 1.0
References: <1579813379-1724-1-git-send-email-jaewon.lee@xilinx.com>
In-Reply-To: <1579813379-1724-1-git-send-email-jaewon.lee@xilinx.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 27 Feb 2020 13:28:30 -0600
Message-ID: <CAJdd5GYJrw_b_BMRjza+0R5AJvhNiNuvrUD9Yv+KBXB3+vGHDw@mail.gmail.com>
To: Jaewon Lee <jaewon.lee@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-cortexa72-cortexa53.inc: Adding missing TUNE_FEATURES
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
X-List-Received-Date: Thu, 27 Feb 2020 19:28:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 23, 2020 at 3:03 PM Jaewon Lee <jaewon.lee@xilinx.com> wrote:
>
> Without the proper default tune in TUNE_FEATURES, certain variables
> won't expand correctly. MACHINEOVERRIDES won't add cortexa72-cortexa53:
> TUNE_CCARGS won't add -mtune=cortexa72.cortexa-53, generating the toolchain
> incorrectly.
> Adding missing 'cortexa72-cortexa53' to both
> TUNE_FEATURES_tune-cortexa72-cortexa53 and
> TUNE_FEATURES_tune-cortexa72-cortexa53-crypto

I can confirm that this patch is required to correctly generate the
tunes for cortexa72-cortexa53... did it get missed for being merged?

>
> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
> ---
>  meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> index 0d43531..f208b98 100644
> --- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> +++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> @@ -14,8 +14,8 @@ TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -
>  AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
>  ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
>  ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53"
> -TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc}"
> -TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crc-crypto}"
> +TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa72-cortexa53"
> +TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa72-cortexa53"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
>  BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

