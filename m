Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.47606.1617571184965639718
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Apr 2021 14:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PMNA31DW;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id l13so7256429qtu.9
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Apr 2021 14:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pj7hfeqzuejflQFnNBq3HtjTsxzXMWwIGSufVxePedg=;
        b=PMNA31DWZ/C+U3d5w6iuPApW9upHUhQ5tMQ6vtklweGxJkf/Ghhf8tDeyKNPcsLa6z
         Ig81dcina0ZGsCU+CRuRi/90B8bEc01SJdakClYOj8b8KqixYnW+iCnA8clfxVpn1/HE
         OzPt7Qq3RUH36S6T4saEIyjo+ZJjzTwgZom3CktliuQVQQK7EMZ/LtIqW8pLlzsOnOfF
         0hXHTlC7jSAIfyn2AbHHhu4pHcO8d6Ay+iyFhCnb6uO6rkNORWMB6mCL+K5g0FALyRXU
         5KQu62G6A5eqZ8pVq2Onp/tu6DntzuP+SiUbefdHzRAGtomwhPw3isTizi74FgTfCBJE
         wW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pj7hfeqzuejflQFnNBq3HtjTsxzXMWwIGSufVxePedg=;
        b=Nax3lc9IddvmSJS6lJmUGAX0Cr1dDlVEg7ZH1kcbTC5kzHvwWZ/WrovaTD8Tp85Hh/
         x3KBaKDAEDQR23wWkU4KkciFqPSD/Vl/kxiK+OaIp4diYpyrmx4O/n+THjxsTABg5wLM
         WaSM1hlpynk16xsyXr2OePkCi/WwUY5mq6PrK4J/gSf0GpPt6iNo3o3wtU6SjXQKJDj+
         YyUUzCRhrumcyQlFb/XvkfBvHKe5TF4pW4kvYCuQxh4zDTyfj5Ux9/I8HKwx//nPu3hp
         20Uwix2o8ZKeK2GQoq6kok/5f6P19YcurrZxHskv2abhwGEjvLRez/K7n5nWfx7Znak4
         X4rg==
X-Gm-Message-State: AOAM531xhgsJKmKPwmBwEU5yJaoudHy3foq6Sid2wbVkx03Jiuu1oxiZ
	+/qgIt/HSusabIwaS1xnE+eh9somU/+IV4j8tC0=
X-Google-Smtp-Source: ABdhPJwqKLbdJl7sFGatQAAUooSri4poQAOGlGzkA4RgdZyV8Wwq83UTTmfGz1rjDYV5c+5ZRn2o9mLUg3jXvdGvz1M=
X-Received: by 2002:ac8:6e85:: with SMTP id c5mr19284324qtv.299.1617571183973;
 Sun, 04 Apr 2021 14:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210404200513.581466-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20210404200513.581466-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 4 Apr 2021 14:19:18 -0700
Message-ID: <CAMKF1srjDhhqY5FqxmvNBweYNER7WKdGR93fWXjxxy3pJDpYsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ell: update to 0.39
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This fails to compile with clang, I have notified upstream dev about it.

On Sun, Apr 4, 2021 at 1:05 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Changelog:
> - Add support for serialized test execution framework.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/ell/{ell_0.38.bb => ell_0.39.bb} (90%)
>
> diff --git a/meta/recipes-core/ell/ell_0.38.bb b/meta/recipes-core/ell/ell_0.39.bb
> similarity index 90%
> rename from meta/recipes-core/ell/ell_0.38.bb
> rename to meta/recipes-core/ell/ell_0.39.bb
> index 7d3a339978..68ec4cb4a4 100644
> --- a/meta/recipes-core/ell/ell_0.38.bb
> +++ b/meta/recipes-core/ell/ell_0.39.bb
> @@ -17,7 +17,7 @@ inherit autotools pkgconfig
>  SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
>             file://0001-pem.c-do-not-use-rawmemchr.patch \
>             "
> -SRC_URI[sha256sum] = "c1b7ae5676eec310f08757b3d8652b8e818776be1897fb5deb59e55f02a012a7"
> +SRC_URI[sha256sum] = "653e2e139e23ed31e03c56c05f15321a9e818e2dca00a315c18d2c7b72f15d08"
>
>  do_configure_prepend () {
>      mkdir -p ${S}/build-aux
> --
> 2.25.1
>
>
> 
>
