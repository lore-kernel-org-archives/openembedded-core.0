Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8F88E60119
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 20:12:11 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id v68so7935199vka.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=vnot7uMABrODAyRLidnlO0r4r8xcpda5WbPCDrjAdMQ=;
	b=lZVj1KfKEM66NE+X/dTjPeB1dPdB7ubM+p5wDTJZo09IIKy7ryTpX5c/Ap5tRPcdvO
	lDHdv0NUKo83L6uH19ruilp4ViiRnVceVBc8RvUm6NX1S0J+/5vE6MNxyFe4qzsfr8GF
	Pyz56h/sIHCqQ8CekwliqsjF/bxQTexNacj6+LNtbAcFhZOmagEb1ubXZEL17Scb5RwU
	lv9Z3nawD9dyt9Qt5TNYYDYLKHw1gOm6ulVWBG09/HxzXkFdnXcalReeBRVaKt4lE+RV
	JP/x1JVRkvdSId1WzAhb5+sji0FGQ+V8N4g3ozwuUZsxMjK/qgmsPAwwEHNk3TTch5pv
	m/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=vnot7uMABrODAyRLidnlO0r4r8xcpda5WbPCDrjAdMQ=;
	b=fyY1CSFs0hoUmpjZrH9UBEFh9aQSfWjka3TIifDe4rxEPHXLnI+ysT7A/8wLP/W5co
	LK9xA8jdBhEGpuYBfklLm3iYE/BpQon03j7fZvvLKpg8xdpTQkPNpbgGFQA90Jkv4aAf
	RRLnzsv1eoWQcfHrlU302q5PA+qVY92c6kJYKHWUk5zPfDbVJuh9J55geyNshgwoFNs1
	XIl3OjDGe7CcNThwayjntNUgRXCPbWpvczI1iO290gz0vf+r491SDeRthBxXODZSeGX/
	4toMw8h0FlLXl77cQOgpLFykskm/9iLxTYSdNfi9UlP1dT2HJgySF0rHfoCQf779Kyl/
	CzyA==
X-Gm-Message-State: AOPr4FWbqwOMpvu+lep18AxnUo03arO/baQta3x6dnqp8gL+zSAGyYh0XlmtfsUa95Bu/3ha+1m2/NiTwexmBw==
MIME-Version: 1.0
X-Received: by 10.176.1.117 with SMTP id 108mr5688183uak.49.1461183132320;
	Wed, 20 Apr 2016 13:12:12 -0700 (PDT)
Received: by 10.103.94.2 with HTTP; Wed, 20 Apr 2016 13:12:12 -0700 (PDT)
In-Reply-To: <1461180303-2392-1-git-send-email-tkilbourn@gmail.com>
References: <1461180303-2392-1-git-send-email-tkilbourn@gmail.com>
Date: Wed, 20 Apr 2016 14:12:12 -0600
Message-ID: <CACS+7ZQSAepGy-V3eRVC=44yJoT5HLE3NNA-Psh8z10qhuzf9g@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Tim Kilbourn <tkilbourn@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [jethro] boot-directdisk.bbclass: remove HDDIMG before create
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
X-List-Received-Date: Wed, 20 Apr 2016 20:12:13 -0000
Content-Type: text/plain; charset=UTF-8

On 20 April 2016 at 13:25, Tim Kilbourn <tkilbourn@gmail.com> wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>
> Fixed when rebuild:
> mkdosfs: file /path/to/hdd.image already exists
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> (cherry-pick from 9abcd309c098558360cde2bff65be840ead25f83)
> Signed-off-by: Tim Kilbourn <tkilbourn@gmail.com>
> ---
>  meta/classes/boot-directdisk.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
> index 600e21a..b324d89 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -121,6 +121,8 @@ build_boot_dd() {
>         # done in blocks, thus the mod by 16 instead of 32.
>         BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
>
> +       # Remove it since mkdosfs would fail when it exists
> +       rm -f $HDDIMG
>         mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS
>         mcopy -i $HDDIMG -s $HDDDIR/* ::/
>
> --
> 1.9.1
>

This one has bitten us too. +1


> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

