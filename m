Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E31C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 00:37:51 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.5256.1635295070149759834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 17:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a9bbDve5;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d3so1117481wrh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 17:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5MrgFjzactDd7UY/WED2GCisSJ3QsiYZIn51lMHTss0=;
        b=a9bbDve5DhFqv1ramA30vonvckORaW8vuBH6wzLt1D0rumDW356F2gkbLUnvtDzb1I
         MWl6nSVOR5yP4iI1ELPNPsd5JBnLosaCZMX1sTWxkcTHecqX35lacn58Ja5KQVXnSaFm
         BBeJ7lj2KMkzpNJqJpF1diWYXG3RtBl0OOClqYO8Wwy5B4IenlbpfCReGE40rwTGdnFn
         rZShqZx0lyw+uf0oN8DHoIljfKo/tARisMyzum4rsXuPqgiGyoQxaEBxu6toh/mmac+T
         3O1hdl44tNVtzfdTy+KhOnQrlMGuAKG5EKedVl9iM6BjOwYbtxTrOOP0jvmVl/nzJ+sa
         u2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5MrgFjzactDd7UY/WED2GCisSJ3QsiYZIn51lMHTss0=;
        b=U1GTUaRMNqcMxWD60YRhxeekw/IJP1c77sOSiZgDH5Swhlmbhyi71ig8xn4J4/aRMf
         xwWr/03OxOOpJZS8YqzQRuOp7ds84idA//oso6NYgBVub7urSO5P0IJbWEvSdyEBjur+
         HwLG+6o5IG4ryCml+PZL4jXg3MuxngDB/xjVDOfn87zjnkyqgPBjfUFf4uKOxEniDLZv
         40pCcp+YkQk2Hip3zr/X6R8vhj+RkJI9cg/FBbDvrTgOBCJ+H8HQhQZvhwElcq6rfewH
         jcGD96ENr+BP7j9+caAN4MFX497SvxO3ymLUvxnci1Dh8clJZQP0unMwxL4pdXDZ8ikC
         iVFA==
X-Gm-Message-State: AOAM5331lCUbTI67OYyMHOncryJ4pC+ngIIEi8zSsS6b8IRyP3TkJ6S1
	rZJSkuLjtCGuz8iehsevUM/xPJDKKY0vBj96JcE=
X-Google-Smtp-Source: 
 ABdhPJwPNlaYcgaVXpXprgzOGgkWd7VhiiXZPnt43gfFaX79U3iTJ10oqVRSieg+c2MDg/5mgsXIcB5Es8JZRuu+Q2U=
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr35741299wry.382.1635295068641;
 Tue, 26 Oct 2021 17:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211026233602.71762-1-saul.wold@windriver.com>
 <20211026233602.71762-4-saul.wold@windriver.com>
In-Reply-To: <20211026233602.71762-4-saul.wold@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 26 Oct 2021 19:37:37 -0500
Message-ID: 
 <CAJdd5GY3gQhSh3X_1HxWnh1JsuZUba5mWaXbS14sHYZPONCL_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] create-spdx: cross recipes are native also
To: Saul Wold <saul.wold@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 00:37:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157463

On Tue, Oct 26, 2021 at 6:36 PM Saul Wold <saul.wold@windriver.com> wrote:
>
> Recipes that inherit cross should also be categorized as isNative
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  classes/create-spdx.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/classes/create-spdx.bbclass b/classes/create-spdx.bbclass
> index 72a9b55..883bc23 100644
> --- a/classes/create-spdx.bbclass
> +++ b/classes/create-spdx.bbclass
> @@ -418,8 +418,9 @@ python do_create_spdx() {
>      recipe.name = d.getVar("PN")
>      recipe.versionInfo = d.getVar("PV")
>      recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
> -    if bb.data.inherits_class("native", d):
> +    if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
>          recipe.annotations.append(create_annotation(d, "isNative"))
> +    recipe.annotations.append(create_annotation(d, "SPDXDIR:%s" % str(spdx_workdir).replace(str(top_dir) +'/', '')))

This seems to be a leftover from something else and is unused?

>
>      for s in d.getVar('SRC_URI').split():
>          if not s.startswith("file://"):
> @@ -610,7 +611,7 @@ python do_create_runtime_spdx() {
>
>      deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
>      spdx_deploy = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
> -    is_native = bb.data.inherits_class("native", d)
> +    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
>
>      creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
>
> --
> 2.31.1
>

