Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5707523F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 18:25:24 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id o17-v6so10153524vka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 11:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mB9MyhHm9ARqDCqBCVPN7SjOpbPdJFc3V92tULxzom0=;
	b=LE+bhDbnS0PFyJgv2NouXaxNepGY/Vkc0oqWSQdBWfYsiIaOtt3fAoIrdiXWf3zeLO
	eZIaLpotCnnIRlFO7toRlPL2TwxcR9ycgzticwwovsdzzj7i2qq8mYIKSuef0LHfvT/5
	z42Qtb90QBt3ChNl/9nT9j48cOSgarooLKDesCsGfPvOkdLPF3cC4/KaI0xHBir1NCL3
	FTI9na+b7q1ccemONFTWiridWPPT7lOas0NmijL69gQjBtiRBMZXugIrijcoFA51Jdh0
	Yz1Fw9AiX988oilb9VC3XZ4OplQX+6zNkffIMXL8r2qCH/e7WL3LgRjCQ1fGpDTiincu
	os6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mB9MyhHm9ARqDCqBCVPN7SjOpbPdJFc3V92tULxzom0=;
	b=lDir2TiUa6mKMgLE3AYYqxw1M9uv4qvn0F+mnHh3ICnW0YhIFcBkDuQdMcB4GFplUh
	3Y+8sNhrZvSL4EvwoA2OJDoKOZtWmgVf9yrKjeeZTWAWr6TWIUUUn5KSMmzR6AcoHXLc
	6BjILOc8eED7wlfffIuxaNJ/Xa3p50d0q9P7LJvH+AvZjYj8yc3/Bn/AhQNV6fhG2URF
	NkA5gmGwewv777fAGY7vUoGWjQJzQWdV9KV9MpKSaucuE1jaz8USS5Y9Ovi5NVihUBld
	shRCFVie9CiFOFmMB5hzjKNvoJVdq9CMK6elrm3ljbN/ZBGivH29pjCQKZZD8LOI1FM9
	wMmw==
X-Gm-Message-State: APt69E3B6XMPzuXl9d37b7Ju8vl0VaX77G9x1BbPijY319zDijsfujKh
	GHz5zrZaqej1YjevheC+7vWrdvFR9MIUeHhZP7I+GQ==
X-Google-Smtp-Source: ADUXVKLbxRjqp68F7p3NY7wKhHe8TstkXNF5l1sCp08ZfLu3c0FctrzOBkOzIwpVPnIOJ5TJi3ea7wMbaMkEETHwhrs=
X-Received: by 2002:a1f:85:: with SMTP id 127-v6mr5521529vka.154.1529346325802;
	Mon, 18 Jun 2018 11:25:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 18 Jun 2018 11:25:25 -0700 (PDT)
In-Reply-To: <DB6PR0601MB2133494840B64E5FA74F9A63C3710@DB6PR0601MB2133.eurprd06.prod.outlook.com>
References: <DB6PR0601MB2133494840B64E5FA74F9A63C3710@DB6PR0601MB2133.eurprd06.prod.outlook.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Jun 2018 11:25:25 -0700
Message-ID: <CAJ86T=XimG18eRffGveHYQwFNSVamr-eQLc8C2i-qPpjJzKezA@mail.gmail.com>
To: Tobias Olausson <TOl@hms.se>
Cc: Magnus Olsson <Mago@hms.se>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] image_types.bbclass: add optional size to ubi vols
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
X-List-Received-Date: Mon, 18 Jun 2018 18:25:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 18, 2018 at 4:29 AM, Tobias Olausson <TOl@hms.se> wrote:
> From d7b8be3f844c10ace0d4c04e35986145fc20d0d8 Mon Sep 17 00:00:00 2001
> From: Tobias Olausson <tol@hms.se>
> Date: Mon, 18 Jun 2018 13:22:04 +0200
> Subject: [meta-oe][PATCH] image_types.bbclass: add optional size to ubi vols
>
> Instead of hard coding the ubi volume to be just large enough to fit the
> root file system, one can use a variable to set a preferred size.
>
> Signed-off-by: Tobias Olausson <tol@hms.se>
> ---
>  meta/classes/image_types.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 00a00d318f..ae23aeaa8a 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -164,10 +164,18 @@ multiubi_mkfs() {
>                 local vname="_$3"
>         fi
>
> +       # Set UBI_VOL_SIZE (for regular ubi) or UBI_VOL_SIZE_name for multiubi
> +       eval local UBI_VOL_SIZE=\"\$UBI_VOL_SIZE_${name}\"

If UBI_VOL_SIZE is a shell variable then by convention it should be
lower case (to avoid confusion with bitbake variables, which are upper
case). Also, where is the variable ${name} coming from? Should it be
${vname} ?

> +
>         echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
>         echo mode=ubi >> ubinize${vname}-${IMAGE_NAME}.cfg
>         echo image=${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
>         echo vol_id=0 >> ubinize${vname}-${IMAGE_NAME}.cfg
> +
> +       if [ -n "${UBI_VOL_SIZE}" ]; then
> +               echo "vol_size=${UBI_VOL_SIZE}" >> ubinize${vname}-${IMAGE_NAME}.cfg
> +       fi
> +
>         echo vol_type=dynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
>         echo vol_name=${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
>         echo vol_flags=autoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

