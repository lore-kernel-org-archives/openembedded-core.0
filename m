Return-Path: <mihai.serban@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id F40F975521
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 14:24:05 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id u5-v6so9211103lff.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xv5D7jQAG3sSsRqTHR/xw+oa12Tt8UZR3hTGJvj2WJQ=;
	b=Gx300ZYT2eiN613Rt17w83+ntJ5DM245GHCGHodz5E7YWyL7I1vss+/eqpVZogoxJX
	5YP5jArzHSZqvJvS2SAkS/qXmTdt1PShXeweyus3eK0cnOsYIiDbnSaZ8EAbg1pzrDlz
	w4rWKIvl8mHViT5gWegIyKiEZqKAHYdP8slb4ahyuddw5jPlwofbvv7Ltk0CAU3J/0Uf
	3/z3TSV/nbxpIgb0FM9IIRxQf4au8x1b50vNqSJubbOD9+JmmmikpgEFPbSltkodFS+M
	Dk4Nea/DkXEk0vsQp5ctOwAoBYezuOgoruCuTy4mmNQ5XHaxaj3L8j1KB0qgfPaqW738
	2S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xv5D7jQAG3sSsRqTHR/xw+oa12Tt8UZR3hTGJvj2WJQ=;
	b=iSL4bEZ3eOvRrmGZw5khRfhZbm37DtPi+mCeCB34k0RhGoF7U2kPRwvhhx++hNnpmL
	48/l0IKS2XYlaUwTjfzEwqv63fflF1B+HvwcWU40Y8ELk7FfAbl07mx9AHWgMX2xJCUD
	CqzgA0t1tUZblIAF9ot2Iqrw7jgf57j1fIIIoSXKCJKxSkQSKkDHbfaChKncAu3S3B52
	wZaTRHj0uvrR8RgH9CfnO/JGw00KmG7emHDSiv2mWx7B/2D4si0vky2c4edJNoFfWiCM
	2AJ+4AZlSEJaRiqb14Ek5W7c0u7+Phv+Q9Nkn8Zg8I1kPKFvcm3tvrpA8j6xtDz19V2M
	v8kQ==
X-Gm-Message-State: APt69E166zftwTois6zJV6oUysUXXWIvPbh6j7BgmbbqeAn2LpEXsQHW
	GWMJXnH31QNnyna9esBnWVl6Egpt5CqVWDweiAk=
X-Google-Smtp-Source: ADUXVKJ8NdfVWYoR/Q+A+ac9McDtYPDfUXxNw0eePIPP/gQq3FIJHKP0Edb+4R5I78gkCxvKxZuiu9LGiD9YzQlYzwg=
X-Received: by 2002:a2e:2948:: with SMTP id
	u69-v6mr11131871lje.130.1529418246571; 
	Tue, 19 Jun 2018 07:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <1529141333-17754-1-git-send-email-alex.kiernan@gmail.com>
In-Reply-To: <1529141333-17754-1-git-send-email-alex.kiernan@gmail.com>
From: Mihai Serban <mihai.serban@gmail.com>
Date: Tue, 19 Jun 2018 17:23:54 +0300
Message-ID: <CADoSQ11erO_mh==kUeZ9g1wqZ-GfBdQCra8PgW0CXqV-L4t1Cg@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] kernel-fitimage: Allow setting of DTB/DTBO relocation address
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
X-List-Received-Date: Tue, 19 Jun 2018 14:24:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 16, 2018 at 12:28 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Introduce UBOOT_DTB_LOADADDRESS and UBOOT_DTBO_LOADADDRESS so that you
> can set where U-Boot loads full and overlay DTBs. This is required when
> using bootm's overlay support to construct the final DTB.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> This commit conflicts with this patch:
>
> https://patchwork.openembedded.org/series/12589/
>
> Either that needs applying first and this needs rebasing on top of it, or
> use this one in its place.
>
> Changes in v2: None

Hi Alex,

I see these 2 patches are merged into master. Can you send them to be
integrated in 'rocko' branch also?

Thanks,
Mihai

>
>  meta/classes/kernel-fitimage.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 50a91e1..f3c2ff0 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -135,6 +135,15 @@ fitimage_emit_section_dtb() {
>
>         dtb_csum="sha1"
>
> +       dtb_loadline=""
> +       dtb_ext=${DTB##*.}
> +       if [ "${dtb_ext}" = "dtbo" ]; then
> +               if [ -n "${UBOOT_DTBO_LOADADDRESS}" ]; then
> +                       dtb_loadline="load = <${UBOOT_DTBO_LOADADDRESS}>;"
> +               fi
> +       elif [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
> +               dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
> +       fi
>         cat << EOF >> ${1}
>                  fdt@${2} {
>                          description = "Flattened Device Tree blob";
> @@ -142,6 +151,7 @@ fitimage_emit_section_dtb() {
>                          type = "flat_dt";
>                          arch = "${UBOOT_ARCH}";
>                          compression = "none";
> +                        ${dtb_loadline}
>                          hash@1 {
>                                  algo = "${dtb_csum}";
>                          };
> --
> 2.7.4
>

