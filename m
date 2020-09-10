Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.25266.1599752823217004455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 08:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AF9Vif4z;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id k25so5223232qtu.4
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 08:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CynzhI0T155xlWTVggTpEWRCLIp2dhfytuTMfjNqVq4=;
        b=AF9Vif4zIw6QPR41G3gYjKIJQ4UXmWy7GEQd5MNgaiwacf7BQoj6f257LX6KGMkFg3
         j4k+6n0O8AQQkruE8WaF3EKsNbcZ+UK+oho7SPLJ+YaITr1enYOC+WFLUEB0x0vfCLzs
         7WkKj8jA194oC1zmL1FpZ4+6Fgk5fOOs0LANVmM8rrMJ73A4CmN1Q9aplazXyMywoDi9
         Su0XUs75yc6RpH8/zHAlRmTwH4yKnXXMCDg7piTbZcbJ4D7Uvncn+sNybBXrktKbwOdG
         4tGsWCwfEyZFOr31ey0JiD7xQMKSNN7MioO1rUOZlOlwTFlSzc71Od6Yx7j71wbBBZno
         BBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CynzhI0T155xlWTVggTpEWRCLIp2dhfytuTMfjNqVq4=;
        b=KlUBamYJXBvYFhsXrIfm6V18CSQejjhgkaWGhQKCRw3k0/NlCGy8NpVSgPWRC0fC4i
         O6DgwQQXgy7AQ4DhWICKr5P8n13sm+YkacdmCyU7r29lTGTxPA5eemwkireQVil9X9k1
         cTmejEDBTDyGqRc/0/Y81OAghSYVKpcpdyE6V4cy51Byn0RRpQ+Ul6oADlt3+WzKKaRY
         v7e7GDM7gBUVdyrm0IjgcXH+wQA1wmXtkkpm2IfX4Hdu31Ge26vfezyAXWl3yZTVyScm
         FmmoERWVUzuQQZDHzKyLDeNrjdiDK4wPyfQigtNz9RuoeDrjipH17sZI3uFGHSFXfBKl
         qzlQ==
X-Gm-Message-State: AOAM533rHHUzx9QPrJK73UqSfwAjozDhcC9Ce1coAhu6o9ectNnlbXhQ
	6VKfOA6roqtbjX0XSr9WS0J+841zCG2kGHETjFQ=
X-Google-Smtp-Source: ABdhPJySBy07E9Wabc9+9QSGp9fCSOueH6Gw6n9oFOVY3dNg6ilebR3z67+q9MoBJpFtQKAwX/7jR7WRW2N5z0V8NJg=
X-Received: by 2002:ac8:3fcb:: with SMTP id v11mr8409160qtk.80.1599752822046;
 Thu, 10 Sep 2020 08:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <1599700598-39322-1-git-send-email-denis@denix.org>
In-Reply-To: <1599700598-39322-1-git-send-email-denis@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 10 Sep 2020 08:46:36 -0700
Message-ID: <CAMKF1sp9wrwonL4iW2MWcGqK557vP5Ci-hprdu+zLx0bbm1FwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] cryptodev: bump 1 commit past 1.11 to fix 5.9-rc1+
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 9, 2020 at 6:16 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> There's one commit on top of 1.11 release that fixes builds against kernel 5.9-rc1+.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - append SRCPV to PV
>
>  meta/recipes-kernel/cryptodev/cryptodev.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
> index 906f4fc..027d636 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
> @@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
>             "
> -SRCREV = "2299d39475e91392abd050ea09f2d20feecb4adf"
> +SRCREV = "fabe5989a3dc9fba0cd0a40b612247cdde351c01"
> +PV .= "+git${SRCPV}"

I just saw that this change does not go well with some of
meta-freescale changes which uses the inc file paired with PV, so
perhaps keeping the version at same PV
or creating a single patch is better.

now ends up with.

ERROR: ParseError at
/mnt/b/yoe/master/sources/meta-freescale/recipes-kernel/cryptodev/cryptodev-qoriq-tests_1.11.bb:2:
Could not include required file cryptodev-qoriq-1.11+git${SRCPV}.inc


>
>  S = "${WORKDIR}/git"
>
> --
> 2.7.4
>
> 
