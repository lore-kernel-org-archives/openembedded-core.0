Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.71583.1629389064126758771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 09:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rZsWINbz;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so4358601wma.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 09:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ryF7ELrQQGHYRh7FqGsrphWtukSejibkh16+9EPV9pA=;
        b=rZsWINbzBKCwxlxUUSl+xVIHGX/RBI9prBI/FUHr1gYiWJUCiRjmf+m1dT2fFV8tfv
         v0qp4zyyMEtaNlBUNdhhUsPqyPCtCf0b6n7oxFmDS3ak8Y/gzr5QBbgXVF30ZBbMBI/D
         tVsuhgKy+mpHOfHgd1HyrLQl/ZNhrIlzilPdjcmFDVxGp9sMSit5MOxpLOtb5pYy6pB8
         SnZkvzeiPJfOXquSx5rUzwyBhXBQ1NwIh7Ae1/JZXxhLhJVp4ZMD4781n1q+iFlX1K9O
         Wu+5WjA+ioaQ1Jt9GvQVH1KYW3SOPIEYzH7aWKWSGTln1Nc8+3gObqWjlu00PPDVZj2m
         BzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ryF7ELrQQGHYRh7FqGsrphWtukSejibkh16+9EPV9pA=;
        b=QtirOCz81mrOfP+tjvc4nQS8s8K8sttfdwgEPT65jRth9NJFqulu+pZsm1KCwxiRxj
         ixqAn6zz1i7h32n4bfaGzm/Af0GIFJXTipPHeSYNFjzi7avBtO5MYFGtTX35rmIKXYgE
         LJdLkcxcG+LZtQWjGxfNKDJxFaIdtajHsZdqiacgFulBNao3TMsqbu4JpjdEkO1oMVC8
         jRCY9eAZIsMiaLrU6qKGDnlbP9Sw2MF9Mx7VaaUiE0PLNy3YYrNVQjmYnCYz5EDcv55f
         1+hCBU3gPYXMwGI3ZqFfLwEnaNVLcmVBX0j4D9PQJGPxAApb+LCy9Oy6kdF+RiQsQCJ5
         5Grw==
X-Gm-Message-State: AOAM532uUIdWN/k1DSbNlak/gRIsQMBABKuwjti5vkgwsqaxEwRBu7SX
	6AOwMbQWWf+AyjqFX0157udnpnp6Ry38R7m3eqg=
X-Google-Smtp-Source: ABdhPJxQ8JXN5v2QgL8EwOE8RgGUbw6wUTn5ebB8uIL86o4XLnZQJTC4vEs9ZbzdL/QSiJqrhkzKBpqSuvfxNXB2GEU=
X-Received: by 2002:a05:600c:a08:: with SMTP id z8mr14305904wmp.52.1629389062576;
 Thu, 19 Aug 2021 09:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210811145158.12224-1-JPEWhacker@gmail.com>
In-Reply-To: <20210811145158.12224-1-JPEWhacker@gmail.com>
From: "Marta Rybczynska" <rybczynska@gmail.com>
Date: Thu, 19 Aug 2021 18:04:10 +0200
Message-ID: <CAApg2=QW94Bh2a6iC+YgeDakFB1SjtpT-5KVCb0xKYpQEqRTfg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/cve-check: Move get_patches_cves to library
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, saul.wold@windriver.com
Content-Type: multipart/alternative; boundary="000000000000469fb905c9ebb432"

--000000000000469fb905c9ebb432
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 11, 2021 at 4:52 PM Joshua Watt <JPEWhacker@gmail.com> wrote:

> Moving the function will allow other classes to capture which CVEs have
> been patched, in particular SBoM generation.
>
> Also add a function to capture the CPE ID from the CVE Product and
> Version
>
>
Do you have a link to some resource on how you plan to use it for SBOM
generation?

Thanks,
Marta

--000000000000469fb905c9ebb432
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 11, 2021 at 4:52 PM Joshua Wa=
tt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Moving t=
he function will allow other classes to capture which CVEs have<br>
been patched, in particular SBoM generation.<br>
<br>
Also add a function to capture the CPE ID from the CVE Product and<br>
Version<br>
<br></blockquote><div><br></div><div>Do you have a link to some resource on=
 how you plan to use it for SBOM generation?</div><div><br></div><div>Thank=
s,<br></div><div>Marta<br></div></div></div>

--000000000000469fb905c9ebb432--
