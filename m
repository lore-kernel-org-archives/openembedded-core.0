Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id BC37A78C64
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 23:15:22 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id b134-v6so13272495vke.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 16:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/HontGnt26aNcZsr5GZW8/wjk+kFpivYrx++4izLx0E=;
	b=FWbyUHT16OkTKC01GpDhszYkAM31FA73s7a0IX5VS3jI1/Rpf9DMwsv9VRvALA5ZRS
	WIEfBoeoz8Ak07+zQ/EPMc1MyKmFYvk8pwSz1DVAnONhshv28u+fb7MLWEHcEOvpWbCt
	imegF4sx/1TmI4mq0Z8bDL6P6SrdVIrG1eslD1c2YTLg/V05q7RXY/6Vj7nqTAYHUVYZ
	fXzN/UdQqzv+5CfNg8QpqE48o5lZ7WmwYwWDQ02yKqEcctJSZlbXVJJbA+8027FvLtWo
	EhVwGFJ5Opn8mazGHFGKOGtMBa1LYDqwnq41mEFI7TJNkmEDHVZATR0CFAWA5jzKdzwT
	x7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/HontGnt26aNcZsr5GZW8/wjk+kFpivYrx++4izLx0E=;
	b=MwnTIuFuDYrx1vefpCoGlovG9RjKAEhdGk4Uty4sfn6KhC9QB88EXVat4XSOa90fwZ
	7FQ2pOY3WKctyneQ1t9wyM4o2Cs8xlA+YsqizZZELniY6eUlhfxeW01Mw31kIunkRq+E
	jPpKvKttkLAWgBbA+W+gmc6Vtv4BPMuHLkhxXei6isXqMnFxVRFNZutevzPR4CetQ7ex
	UdjvdbmVOhyfmS6e1QMGW2G5XLbJ74SUcxTNzggK/HFXxIgzTtl4rjBkk0DlEhwbkdEv
	0kuewsP8LOXx26MaLtRQZ+r03A97H/+3c1MAszPtnl2B9KzRfX6OzO5IRJYdDjPiMair
	QoJg==
X-Gm-Message-State: APt69E3qLo8TcvVmnolfpa+lv9I9qnkpIQaV33FFb+EPP6DPoCb/TEx5
	7T+R4A+OU+slrl0u8Vd3icFPSY0kMsNBehqE3iA=
X-Google-Smtp-Source: ADUXVKJHc2mQKbUp3bczfyaHiO8BrxXVb/rMEVJL33n2TC5s1+t2ASHo1x7xPVSZkvB1hdAb5gZhfadcgabd2yplWsk=
X-Received: by 2002:a1f:142:: with SMTP id 63-v6mr746214vkb.2.1528758923654;
	Mon, 11 Jun 2018 16:15:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 11 Jun 2018 16:15:22 -0700 (PDT)
In-Reply-To: <1528716867-20270-1-git-send-email-liu.ming50@gmail.com>
References: <1528716867-20270-1-git-send-email-liu.ming50@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 11 Jun 2018 16:15:22 -0700
Message-ID: <CAJ86T=X_BFLzGB4PDKSOJR3Boiv+gQvTN-3D+d+tk=Otw7iwew@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] bitbake.conf: add BB_CURRENT_MC to OVERRIDES
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
X-List-Received-Date: Mon, 11 Jun 2018 23:15:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 11, 2018 at 4:34 AM,  <liu.ming50@gmail.com> wrote:
> From: Ming Liu <liu.ming50@gmail.com>
>
> This is useful when the users want different variables/tasks when using
> multiconfig.

Isn't the idea of multiconfig to select between configurations which
already fully define all necessary over-rides?

If a particular multiconfig build needs a custom over-ride then the
multiconfig can append to OVERRIDES (or MACHINEOVERRIDES etc, as
appropriate) directly.

ie to avoid confusion isn't it good if building with a multiconfig
enabled is always equivalent to building with the contents of the
multiconfig file copied directly in local.conf?

> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3b2ef9f..0c803d5 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -731,7 +731,7 @@ DISTRO_NAME ??= "OpenEmbedded"
>  # And finally '<foo>_forcevariable' overrides any standard variable, with the highest priority.
>  # This works for functions as well, they are really just variables.
>  #
> -OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
> +OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:mc-${BB_CURRENT_MC}:forcevariable"
>  LIBCOVERRIDE ?= ""
>  CLASSOVERRIDE ?= "class-target"
>  DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

