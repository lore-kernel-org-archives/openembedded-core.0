Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id BE79F7990F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 21:33:18 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id g18-v6so5927140uam.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 14:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nIQmvlOYWhl6oePjExCfmdeI8GmvgE8nL5tswOxxje0=;
	b=f593ZSwZFvWdKatGgcOwT+yN0ZmBnx9ie40AmmzeuKtGOSmWJrpOIoV8QKslGW7ong
	2eLVlmmBPDBFpBEhMJDXYvbxDZYTugNFNiEub5PnHcdOQk6wEXFmyfZzAC/tabdjNS6g
	0iQS3XMHRXKbH/PQyOi6k9KlukWfZFsqpDQ+id9RyUE7ELN8IrgfXkleaKxrUhNBPjPW
	L37PKs0GlJBEkts2AHi9yFAPttGLTVUOIjWdd3qZNUBUaDr++Of0u615mVjGvYUSTh0U
	KpxjDbWppwvVtcbNFyD24z6dWGSkZ6ElO8NnDvAO0pYvilpUNd0RdSqlmApvXVjTg7ts
	oAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nIQmvlOYWhl6oePjExCfmdeI8GmvgE8nL5tswOxxje0=;
	b=rCjfovcm3WSkqVjKH6QQKOpCkxs+GApq8z//qDHAlDhcoIX6gCMtMAz9l5um0wR9Pv
	1jDiXRHmJ+KwzXd1itAMmZtTTNAHPsPjGXnrdUBiAPaltebaEe+hJncdkg/mjF6rpH7x
	G1hIDfqICqypH5cScOJsA+26wfscIbD94EFxcMIVBzd3ADxvUKiBwQWumt+h4kw5Ph4i
	eT2R1WwgKQBcwrEnQbLep2MQ+cLpxh5LIcftuROGY9eRH28AwbhqnpwCCQpZ7L1Ea4uU
	7DulDnbhSC0uCX8p604/RW3NIiPIJelNTubw8HqgyxYiXyn5bUJle0k8s5EnmsC2DaTz
	LRAQ==
X-Gm-Message-State: APzg51DxJHA9XhD8eFnlcw2UDXHRUpzjyA0bnq4Z9lsy7qCKlIGJgZF6
	mF966NhMqAtrwuBxEJe8/yUXmBEnAUYex8+txnE=
X-Google-Smtp-Source: ANB0VdYG2a08HJ7HECZdTOVKhPYkx71yKGDB+TYhFgaUhgOPrKucwU1z3HTlKyqiqD5KGxJT8egykZmh4B3ZogMV04U=
X-Received: by 2002:ab0:5c0c:: with SMTP id
	q12-v6mr3160966uaf.134.1536874399533; 
	Thu, 13 Sep 2018 14:33:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:3481:0:0:0:0:0 with HTTP; Thu, 13 Sep 2018 14:33:18
	-0700 (PDT)
In-Reply-To: <20180913072547.12321-1-anuj.mittal@intel.com>
References: <20180913072547.12321-1-anuj.mittal@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 13 Sep 2018 14:33:18 -0700
Message-ID: <CAJ86T=V1LDa=b07pxFi3x-D0ijw0PZMFH_BwsHsoQodhjEOnNg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-core2: use n270 instead of core2duo
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
X-List-Received-Date: Thu, 13 Sep 2018 21:33:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 13, 2018 at 12:25 AM, Anuj Mittal <anuj.mittal@intel.com> wrote:
> Fixes warnings in builds using core2-32 tune:
>
> warning: TCG doesn't support requested feature: CPUID.80000001H:EDX.syscall [bit 11]
> warning: TCG doesn't support requested feature: CPUID.80000001H:EDX.lm [bit 29]
>
> when executing postinsts using qemu-i386.
>
> i386 target doesn't enable CPUID_EXT2_SYSCALL and CPUID_EXT2_LM [1]
> while cpu choice of core2duo that we use for core2-32 TUNE does [2].
> Use n270 cpu instead to use with qemu which supports SSSE3 and doesn't
> have these bits enabled [3].
>
> [1] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L739
> [2] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L1439
> [3] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L1603
>
> Fixes [YOCTO #12916]

Is this working around a bug in qemu?

> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>> ---
>  meta/conf/machine/include/tune-core2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
> index c686bb4682..ddde719bde 100644
> --- a/meta/conf/machine/include/tune-core2.inc
> +++ b/meta/conf/machine/include/tune-core2.inc
> @@ -21,7 +21,7 @@ TUNE_FEATURES_tune-core2-32 = "${TUNE_FEATURES_tune-x86} core2"
>  BASE_LIB_tune-core2-32 = "lib"
>  TUNE_PKGARCH_tune-core2-32 = "core2-32"
>  PACKAGE_EXTRA_ARCHS_tune-core2-32 = "${PACKAGE_EXTRA_ARCHS_tune-i686} core2-32"
> -QEMU_EXTRAOPTIONS_core2-32 = " -cpu core2duo"
> +QEMU_EXTRAOPTIONS_core2-32 = " -cpu n270"
>
>  AVAILTUNES += "core2-64"
>  TUNE_FEATURES_tune-core2-64 = "${TUNE_FEATURES_tune-x86-64} core2"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

