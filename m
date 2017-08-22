Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 15AA178282
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 16:34:18 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 83so27794413pgb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 09:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zstuVGvc0nEnTuPIrLo6XEV6SiViCHk7dxRs4qepKyA=;
	b=o377jcEjOKIxaOvzmhVHBhYqEzDtV+OySWI8L9ZGOD9C0EWI1Ve0URGYEKrhdHtAZD
	qcRFbTc1S3orCRy/6Dqj/av18/HRK/fkIZ8knEoFFL6L8MgOpK8S5y73zzhrDCKzRorI
	XkUbeUFvRcD1ZVbfklaAaNEhhOe+VRYnL3ldxSk0r5rFyXmq65AKK7ZEHfNY7tQ/bvzC
	5x5RmJNH7/eHWI7kF6/Yt+phECwqaIKQycMLIknyKXz3irQ4yba3B4XT6KDIHbdSLssw
	m4nKJw4CAsSfQSsOReIuiXQ4KHp2QQwrq7D1OtjNs1C9Ip+GQoNC+8wfw7c0UeCNV2MN
	N8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zstuVGvc0nEnTuPIrLo6XEV6SiViCHk7dxRs4qepKyA=;
	b=uR5fSPKmTDUJw1xD+nIvnVkprn1TQO/XwnUqz27w9lBlUN2jFW1u/XhtQrH+0fNefA
	l72VAxG/ZEth39YC2NKGPEpi7GkcT/5OURQ98ri84eczRCOGbzMWW605gHLyd7DyiTNa
	e0n99c7opn7g7I9ov3oqxyV5Oomha29G31duU2SwppPA6MV2QNQqdpJU7KJ2faKRzoZM
	aUJym6lc+01w6BzTZcOzWzhOIeuUbwb4t9sfKDOM6dxVBn5hlGAxES7behF3MgREh9wQ
	oPpprZBDj5Po1i2isRSqscAXPsPq6uIvOrRZxZpw35mjADoaiOVmFVCgnArkmbJLFjch
	MhIw==
X-Gm-Message-State: AHYfb5h7+1fGc/7mQI6/PqG3701o3B9PzUwCqy0JQVrYNejgsV8qSXd2
	4nxcaqveceNFEfon0ytciFuh+1fI8Q==
X-Received: by 10.101.86.12 with SMTP id l12mr1296906pgs.123.1503419660174;
	Tue, 22 Aug 2017 09:34:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Tue, 22 Aug 2017 09:33:49 -0700 (PDT)
In-Reply-To: <20170822073650.8413-1-jackie.huang@windriver.com>
References: <20170822073650.8413-1-jackie.huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2017 09:33:49 -0700
Message-ID: <CAMKF1sonQOf55b0Aap8Lm7yFcoLtoi8kO+6it1PLmXcME_Fxhw@mail.gmail.com>
To: jhuang0 <jackie.huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: disable gobject-introspection on armv7a
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
X-List-Received-Date: Tue, 22 Aug 2017 16:34:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 12:36 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Disable gobject-introspection on armv7a to avoid
> do_compile failure:
>
> | qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> | Segmentation fault
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.16.6.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
> index df355d2..a53c42d 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
> @@ -112,3 +112,7 @@ ARM_INSTRUCTION_SET_armv6 = "arm"
>  ARM_INSTRUCTION_SET_armv7a = "thumb"
>  ARM_INSTRUCTION_SET_armv7r = "thumb"
>  ARM_INSTRUCTION_SET_armv7ve = "thumb"
> +
> +# qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> +# Segmentation fault
> +EXTRA_OECMAKE_append_armv7a = " -DENABLE_INTROSPECTION=OFF "

there should be a space between beginning quote and -DENABLE_INTROSPECTION
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

