Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.6254.1614777034533255009
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Luswd8Yg;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id hs11so42091544ejc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 05:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UOOKdUJQwG47ZuocTyJG/e0iARW0N71/g2dBg168qEw=;
        b=Luswd8YgoEQ+zIbo39LQZP5R3qYAxDKLADu2E0pHYS5wxV1Jgk2AVQmQvO6ajNFb9w
         A7taa2CvgqBRftSNLZz62GiK1K9FvBlTYmiOIlmOHqV3IUBvaLfWbVUHciVzHppibV72
         r7a9DV1nO/Pk3mQLKc3giiP1V1z9ewlTv9H4cFES3WeOlt70bgoffUnQlBcic+w39KLP
         4ooVCHOTxt7vRZ+BjLL30U1wBwG4YM0xoAJzZ5HKmTdWDdl8qJBN9mYc85st8TEkRUR3
         8FSx4NwQZWWVEFZyZGP489gsvRFkElfhq7EP5on1Px84xcUKcnlqQ4UkNMfojuX5duIY
         sxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UOOKdUJQwG47ZuocTyJG/e0iARW0N71/g2dBg168qEw=;
        b=ao73Q+2wuXqlDBXg04Oi4jD2c7JagJMDtqKwOGlsPhfO/mxuGsYTqreFYXa0rpY3Jn
         k87KBcCTrW1TgjRmOff1A3YqVltcLkW3jIfuldjeM+wD0H30T7y/eq4W7GvWPuH+Un04
         fOrebGAaVLWow92uQQVxjDq6KEKQiLBek4ZN9T14doxmKHl10eN5AOVAWdWB4vjD8uh/
         hjmUAN2GOqOAajL0eyRo0j5ReLKOkZhohmACn+MsmMbrUIMumolt3sxPbutbBe+uEjTR
         WUcDbCfAHjrDfW2GKVRzF6nfPRUDT/RUqj2vN99eV0r/525iOQrORfFQ09Xf5LtjYlBR
         +lWg==
X-Gm-Message-State: AOAM533couVzn12GJusGHdRLqhRWEKpde63CxLZtKuHBXZ2ewxAIlF9Q
	FQ++rrzCsfeOqmW4Y/2CPtgj2YoCQR8ql+k2z3E=
X-Google-Smtp-Source: ABdhPJw0JE2RuP+MExZgiggoVCh2Fo0A/yy3icN2DfWzOUtnA4QyZ98g8P9vNN2OVKXiQrEJKWIguDSmuTVUGKRprNk=
X-Received: by 2002:a17:906:11d1:: with SMTP id o17mr22083106eja.517.1614777032853;
 Wed, 03 Mar 2021 05:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20210303061555.40835-1-yanfei.xu@windriver.com>
In-Reply-To: <20210303061555.40835-1-yanfei.xu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 3 Mar 2021 08:10:21 -0500
Message-ID: <CADkTA4OmhPPijicVGb7Vm6WB6GKxtAfEPOsUo9MsVcOANnZLFw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] lttng-tools: upgrade 2.12.2->2.12.3
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 3, 2021 at 1:16 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
> From: Yanfei Xu <yanfei.xu@windriver.com>
>

We should get into the habit of summarizing the changes in version
bump commits, along with a comment explaining if it is a bug fix
release, features, etc.

Bruce

> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  .../lttng/{lttng-tools_2.12.2.bb => lttng-tools_2.12.3.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-kernel/lttng/{lttng-tools_2.12.2.bb => lttng-tools_2.12.3.bb} (98%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
> similarity index 98%
> rename from meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
> rename to meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
> index 0787e04d19..eae95da2ed 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
> @@ -37,7 +37,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>             file://0001-tests-regression-disable-the-tools-live-tests.patch \
>             "
>
> -SRC_URI[sha256sum] = "9ed9161795ff023b076f9f95afaa4f1f822ec42495c0fa04c586ab8fa74e84f1"
> +SRC_URI[sha256sum] = "2890da230edd523fcf497e9eb28133b7606d64fa01bcbffadbfcba42104db153"
>
>  inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
>
> --
> 2.27.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
