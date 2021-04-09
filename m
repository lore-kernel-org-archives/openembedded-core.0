Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web09.5815.1617954513072651464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 00:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FDaSTpQe;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id n138so8278283lfa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 00:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MzqWDzpwF43FKWPOhPRwfvz1a7wYWnaRWOAn4y/DPms=;
        b=FDaSTpQe+Yvrig8MjOn/GBW7CgB6+nPqBvLng+kwO4OrFBFdx04KUzOFIlLx5gcqUK
         NxDmhntF1tRJ7g+7ywWtoIaY1e/CGlu9+GbTivSLMUt1jV8uTHJcp8ZuvSy8eOwg1Ggm
         rWks+90cQpVuJRell78JGoNUoBY43GpeG9rd4B6tkIpmWfYOUx6SsqZC5sQSH/gPudA/
         rT920aLzPpJ0yI65OyksKHFMQm/A21tPb4LE7KDJUKdZqkxTGbp7/u72hhFZeVBETLOU
         NmtiJeWNaxE/MGq1K5AbQMC2n1QfoS+cIHLJKFFAhunWMbUxzLs0hHiGrh45E0MUz5tZ
         2WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MzqWDzpwF43FKWPOhPRwfvz1a7wYWnaRWOAn4y/DPms=;
        b=ctDTEyp4O6dzcTmLTueDQPRRn3qAoxm98VQLHihK3Hq7eZpB3bPNnhYsfcYj+AAaUX
         plRshZlnDI76BC0UO3B+L60t93UBByAMqNarLZT4Gucj1kw3X3ZxFsxr8DyOmdgUL38w
         j+OviG2dG7gfy7VreZrEqemVaZAyhW2C/fA7e0DjToAjFv1H+N60sPr0p9g/Wq7XrVbw
         /qWCNeCtU7xEgvtNqzJBH710rfEuN/VJLVoKEkcoGA7xH2mrCJz+jx6Um0XM/EtFCcOn
         EYRU3e8nrPjcR0i8hGpNq6JL7brwwN9KLKJtz4+IoYTzD62eIgtArvpfB6AMxxI926q7
         1/8Q==
X-Gm-Message-State: AOAM53136BTUVvN5PD8MXU9hUhxqOVAyZrSMZr8jfwpTRqxKWvdcNrwz
	d1kTNDfu8CPmaEweWq7eRZocPxr+B9sjMU11XTM=
X-Google-Smtp-Source: ABdhPJxG+tNhjoKajunBX+XO4+zhDzSvYFI1tKdMQgiAAynQXlaw+wcUWVg/hjTClst8LHNsEWjGWjAHzXFRrADGFSA=
X-Received: by 2002:a05:6512:3e20:: with SMTP id i32mr9549093lfv.257.1617954511140;
 Fri, 09 Apr 2021 00:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <1617860454-5064-1-git-send-email-wangmy@fujitsu.com>
 <1617860454-5064-2-git-send-email-wangmy@fujitsu.com> <b26851b2-e3ce-f702-aae7-8b5615514927@windriver.com>
 <OSBPR01MB18454482F7055674EBCE1C46DC739@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <CAMKF1sqAEvnkGrhizqm=1UgcjK6zU7Kof2OtuauOGUW6zA9V5Q@mail.gmail.com> <OSBPR01MB18456A7EF732C1328517655CDC739@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB18456A7EF732C1328517655CDC739@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 9 Apr 2021 00:48:20 -0700
Message-ID: <CAJ86T=Xa0JB2hPULpXXaCWsUS9So70Q8kdEBrvHxjntBDeGxEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] curl: upgrade 7.75.0 -> 7.76.0
To: wangmy <wangmy@fujitsu.com>
Cc: Khem Raj <raj.khem@gmail.com>, Trevor Gamblin <trevor.gamblin@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 9, 2021 at 12:07 AM wangmy <wangmy@fujitsu.com> wrote:
>
> I'm going to revise it like this. Please see if it's OK:
>
> @@ -54,6 +54,7 @@
>  PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
>  PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
>  PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
> +PACKAGECONFIG[libgsasl] = "--with-libgsasl,--without-libgsasl,libgsasl"

The list of PACKAGECONFIG options is sorted, so the options for
libgsasl should be added between the options for ldaps and libidn, not
at the end after the options for zlib.
