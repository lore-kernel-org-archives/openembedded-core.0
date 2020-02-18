Return-Path: <scott.branden@broadcom.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5C96260697
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 19:08:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g3so25269523wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 11:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=YD/a+uAQr2qtT6Oedj6uwNm8Avwc9rJoYo0jz5N/Rgs=;
	b=S9btu8Z36D7llsSf0wqWcNWHTlUxlfCQd+QUs2jSWrQHYiAfD5OutFQQkOhn7W2IfL
	4Fm3rhZR6zwH8n6V1XSFnSujz9o6DOTpOa15czQRR4Td0fyBvFlaocDOUyrBvemtWLWP
	A8Kp/EK2bS4MzPeNGnJoYsUkAY6OiDdah+a7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=YD/a+uAQr2qtT6Oedj6uwNm8Avwc9rJoYo0jz5N/Rgs=;
	b=YTn702L32pzGtmRHqvpM0Gi1nBI9z2Jig1rSoYLLgY0WQimyoYoWe6jTCSm9JK0rvi
	LNy6wmPz33b2A2bbcS1s022ybujVsWQVEuqR6BzrL3rJ3C3RcB+cjf9p3TF06L66VS7s
	6RcoiDIX0yAN9R57aLmti6IoQNioj752eHm+xizv4dthTHR2ykbbcSI3TbqLjtN4kF/w
	Btx10VGwghc6OfOcTjJp1hv/D+tQnHC8TwINMbYUawDKvTesnHPS5PwWsg9ld/SecK7e
	2BQajcojm8KnTh+C72R4HgTRfj3wskS2mDiIKrgUwPFwBMad5pB7XFlQJSR52g5qYjq/
	wRRQ==
X-Gm-Message-State: APjAAAUwdYp+f0upKGCA8IK5Qeej68ugAb22Cxwi9TD3pK7BlofWwlXh
	Ochq7q5zEnMc+wn8XXGfKHTFhG/SPc3/w1LV/Cd/7Z+kYxD/OgyEg+UR/pVjnAHYmrClFrQ0hIW
	4+PF16snyF4eUrAfQezHHB8+ouGLHwVskvGAmXWqd5Db+FgAnctmNcMqriuoP5zlw2rCP5MLV8J
	S39xr/+fxJxYG7UCr1ZHswexjiO4A=
X-Google-Smtp-Source: APXvYqyMuAJoLZeLsCUouHdZz3IsHqgA+t4ysFLbvnHQMvxoEbmSDpjk5NB76I/j38ZECQ2ky9yU8g==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr30216706wrm.24.1582052919458; 
	Tue, 18 Feb 2020 11:08:39 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id f8sm7406117wru.12.2020.02.18.11.08.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 18 Feb 2020 11:08:38 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20200209202600.2918-1-scott.branden@broadcom.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <8d0addba-a2f8-a9c6-172d-57ee31ce9ef1@broadcom.com>
Date: Tue, 18 Feb 2020 11:08:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200209202600.2918-1-scott.branden@broadcom.com>
Subject: Re: [PATCH] iproute2: add devlink support to iproute2
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
X-List-Received-Date: Tue, 18 Feb 2020 19:08:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Could somebody have a look at merging this patch?

On 2020-02-09 12:26 p.m., Scott Branden wrote:
> Add devlink support to iproute2 recipe.
>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   meta/recipes-connectivity/iproute2/iproute2.inc | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
> index fc31b8444e..6ef9201258 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -15,11 +15,13 @@ inherit update-alternatives bash-completion pkgconfig
>   
>   CLEANBROKEN = "1"
>   
> -PACKAGECONFIG ??= "tipc elf"
> +PACKAGECONFIG ??= "tipc elf devlink"
>   PACKAGECONFIG[tipc] = ",,libmnl,"
>   PACKAGECONFIG[elf] = ",,elfutils,"
> +PACKAGECONFIG[devlink] = ",,libmnl,"
>   
> -EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
> +EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib devlink tc ip bridge misc genl \
> +                ${@bb.utils.contains('PACKAGECONFIG', 'devlink', 'devlink', '', d)}                                               \
>                   ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>   
>   do_configure_append () {
> @@ -46,7 +48,8 @@ PACKAGES =+ "${PN}-tc \
>                ${PN}-rtacct \
>                ${PN}-nstat \
>                ${PN}-ss \
> -             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)}"
> +             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)} \
> +             ${@bb.utils.contains('PACKAGECONFIG', 'devlink', '${PN}-devlink', '', d)}"
>   FILES_${PN}-tc = "${base_sbindir}/tc* \
>                     ${libdir}/tc/*.so"
>   FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
> @@ -58,6 +61,7 @@ FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
>   FILES_${PN}-nstat = "${base_sbindir}/nstat"
>   FILES_${PN}-ss = "${base_sbindir}/ss"
>   FILES_${PN}-tipc = "${base_sbindir}/tipc"
> +FILES_${PN}-devlink = "${base_sbindir}/devlink"
>   
>   ALTERNATIVE_${PN} = "ip"
>   ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"


