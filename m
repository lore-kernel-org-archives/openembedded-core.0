Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3AF74BEA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 17:58:08 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id k14-v6so6946788uao.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 10:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aCYg0St/3IhMBfj2WDe75oTU+Oj60G7bLaZEzkAljMY=;
	b=PIw+pZYNkWnjPDSR/BMwdpM4lCS2utVKG5reGGDLWOSnCwyk4SMwp/QJHKpUKEA7XV
	ZX+CpN1G7DQeVqJN2/DeZqYNc6xDN3cJ2Z0Tg9zdtwnWsIQ6X2cJy+dhgFy5eAqntzGi
	oXovczeVeLuOobu7E3qQl0JUFauRV5nQIJQDi2LU2tKsAuwNWIgxAviXSA5VLj0WaWpe
	jAZMhqRzXnnb/Bu58K5zAu0eD47yC/dUP8/6LyulU/82vyZPgFLnqwa4d7gOnScUwQ7o
	tnwRaN9jq1ohTULJ5sGTzjcLVt/aj74PhgPXmvdiNn5c8P+MmG+0P///NQmnKPKYyNoW
	iZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aCYg0St/3IhMBfj2WDe75oTU+Oj60G7bLaZEzkAljMY=;
	b=mPlG022n4xdrByDfg573DP2m6ObOVdCH2tiKmX7ZQEsgsVbrrwIAZQ4W2sSr8m7JVM
	g5uui1COQGSoSOjPmdloNmix7/VjCbmYM73uXX7dBgAKWC0Cd2kjio9wQWdETgLYeAWu
	iDiXpKaLqdw50pN9hWfJMqNRIzw2juLEr060SO+xHatx1r14uS+1k/s5yTj4f6nDyR9n
	VQdUTpX82dDYxxfTrFTM8YIjpf6Xjmd2KzVXEInVBDKx3jRO48FNAplaHq2ZRagZDfPm
	XvN+AUCxSF5l3YDbNHj44Brlfd8NmSL3CUCH1A5jvIvxJKUuOzjWSu+Fg4kOmraMans3
	oD0A==
X-Gm-Message-State: APt69E35fiN6S7y7+MK0TCyHbzEiD8WDKo2KAxDRiPN3xlSvI9d8mt06
	VTODdGig4gSdB3NxBCWhy4QFr7oLPe8BIxU4BVw=
X-Google-Smtp-Source: ADUXVKLenyZTvraXAFx+kwdJuizY4NhKwGruYEcIJcrw303GXYGlFJc6TzyynlcG28sLrWGjF+lE3thDMQoxk6bYWis=
X-Received: by 2002:a9f:2c4f:: with SMTP id
	s15-v6mr1869810uaj.109.1529085489867; 
	Fri, 15 Jun 2018 10:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20180615161818.831-1-mihai.serban@gmail.com>
In-Reply-To: <20180615161818.831-1-mihai.serban@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 15 Jun 2018 18:57:58 +0100
Message-ID: <CAO5Uq5SOwRVqnVRWYkPR=8j+wNAexr68NjXVDZaFkhHPUc0qOQ@mail.gmail.com>
To: mihai.serban@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage: Allow DTB file relocation at boot time
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
X-List-Received-Date: Fri, 15 Jun 2018 17:58:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 15, 2018 at 5:19 PM Mihai Serban <mihai.serban@gmail.com> wrote:
>
> Use UBOOT_DTB_LOADADDRESS and UBOOT_DTB_ENTRYPOINT variables to instruct
> U-Boot where to place the selected DTB file when booting the system.
> Without these settings U-Boot uses the relative offset where DTB resides
> inside the loading address of the FIT image.
>
> Signed-off-by: Mihai Serban <mihai.serban@gmail.com>

I've a similar patch I've been sitting on for a while, which also
deals with the case where you want DTB overlays, but I don't have the
entry line - what's the use for that in a DTB inside a FIT image?

I'll get what I've got posted up.

> ---
>  meta/classes/kernel-fitimage.bbclass | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 50a91e199069..981d11f19f8d 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -134,6 +134,15 @@ EOF
>  fitimage_emit_section_dtb() {
>
>         dtb_csum="sha1"
> +       dtb_loadline=""
> +       dtb_entryline=""
> +
> +       if [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
> +               dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
> +       fi
> +       if [ -n "${UBOOT_DTB_ENTRYPOINT}" ]; then
> +               dtb_entryline="entry = <${UBOOT_DTB_ENTRYPOINT}>;"
> +       fi
>
>         cat << EOF >> ${1}
>                  fdt@${2} {
> @@ -142,6 +151,8 @@ fitimage_emit_section_dtb() {
>                          type = "flat_dt";
>                          arch = "${UBOOT_ARCH}";
>                          compression = "none";
> +                        ${dtb_loadline}
> +                        ${dtb_entryline}
>                          hash@1 {
>                                  algo = "${dtb_csum}";
>                          };
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Alex Kiernan

