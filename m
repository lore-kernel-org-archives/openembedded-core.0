Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id A46A26C4CE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 01:21:48 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id l24so722438vsr.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 17:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QxKRDkS3UlqgFnNeZLnESFVpqnjsL+wyE0i1NGdMRnc=;
	b=NsqjQJwy7/uAzQJoGijbeMXQysFPw87hQ2FbZLcp1ng3bbGKe5Txnidf4S+4t0PolJ
	fvWX7jdCDR40vgE+UJRgs4t2K6a3v7EgXqUM2VsHyjAIZQe9MuuG0JCD+AAHEZrBU5PN
	dq3s2fwdqiXDekORE0klm5WN+R/7jq7cMz4pyeiZ6bucVlli6ZH4DE0ti85WXDfojmMt
	hn25Jx80hlXZiEeO94TAchUK8Vsp7XWxw7/Rcr0U1mHEcMBli0Xr6JDIXaEVsh3ZMmRg
	7iEnHBbvDIOBrnH6fJSU6yHvWzr9DLvf8isVQzbWaz3VfIod6vXkfVa/xrMVxCLHR4y+
	r/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QxKRDkS3UlqgFnNeZLnESFVpqnjsL+wyE0i1NGdMRnc=;
	b=IsDRryshjXOBug0YIaC5Tpfs+g25Vj66XtytVB8miOgShuNzqnsfXAhBxzeWGCipzy
	jQU7ASxG0lOjqJ0KLcZF/bcJ1CgzBKP5GiCZnKbUqMRnIgRzbqMT3qAP0xMJktHek8FV
	EvAfN+3MYPEhFQRUjkvwWIryn85XmDJJe1+AvTN7ai1Z5xmFuO6dzwnCtn7exsKvNhBI
	A+lysXxFAp+gnk4FS1TdlK5eXeO6058CbIiGiEWvFlo0OQaxniKHwvlXbZiB5BnYS51b
	qf5ROjSyT1Ewdn+kaMmJ1bGhFX1G1w932lCU+DZ5kwMe1JHLrVaA7iR+86tUjr/6ITJH
	AmIQ==
X-Gm-Message-State: APjAAAVVfs8fQGZufJNoh2Bk8+x0SKeTj3XiA7VZoYRYWf3lB1O+M4Bi
	sGVP3Gu6VE1GiOZN0UuNeoAigW3WGQ9y1ZfT5QY=
X-Google-Smtp-Source: APXvYqxqPBSGPOGlCIJOWS/Z6zYEWdoMNlm9sdlujK2DbZJhzUkS6/Ikq4LgYjxcvTGCqSOpSlw/ocakf65YO50DTB0=
X-Received: by 2002:a67:fa16:: with SMTP id i22mr13440826vsq.137.1576286509472;
	Fri, 13 Dec 2019 17:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20191213220309.3964324-1-JPEWhacker@gmail.com>
	<20191214005448.162460-1-JPEWhacker@gmail.com>
In-Reply-To: <20191214005448.162460-1-JPEWhacker@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 13 Dec 2019 17:21:38 -0800
Message-ID: <CAJ86T=WqO7W_XxfvKxZMj6k2wmZOK_Hmwi4gN3O2oWDDhn16Kw@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] tune-cortexa72-cortexa53: Add tunes
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
X-List-Received-Date: Sat, 14 Dec 2019 01:21:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 13, 2019 at 4:55 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Adds tunes for Cortex-A72 Cortex-A53 big.LITTLE SoCs (with and without
> crypto extensions), e.g. Rockchip RK3399
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../include/tune-cortexa72-cortexa53.inc      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> new file mode 100644
> index 00000000000..6bf3b83abe9
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> @@ -0,0 +1,24 @@
> +DEFAULTTUNE ?= "cortexa72-cortexa53"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", " -march=armv8-a", "" ,d)}"
> +
> +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> +
> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
> +
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mtune=cortex-a72.cortex-a53", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
> +ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
> +ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53"
> +TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a}"
> +TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crypto}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} cortexa72-cortexa53"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto} cortexa72-cortexa53-crypto"

Shouldn't cortexa72-cortexa53-crypto also be able to use
cortexa72-cortexa53 packages?

> +BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
> +BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
> +
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

