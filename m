Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.70750.1629385655128587149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 08:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=fNUJaX02;
 spf=softfail (domain: sidebranch.com, ip: 209.85.222.180, mailfrom: leon@sidebranch.com)
Received: by mail-qk1-f180.google.com with SMTP id bk29so1726970qkb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 08:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u1OnYPAPpdyND+fG/dNYL259x8cfsmX1wVmJknutweQ=;
        b=fNUJaX0279XQcbT0GZ1dP0mEB5NTBkCkrrnmQIim3ebVotreFJOdQ/nZI+iYhRuWGX
         c67mMwpXPRE4lCpDQd8FrBfrdM2hH0KeBDewhdicd7TaTLYt67ZUF7HOBsBdzJCuvPjC
         oI3s9GFu+LT70xkbko+GUJXzAKuetLd8s5UOMSU6mwcBO6JtBxN+84RW1Gm7jxlO50hi
         ciPgR/4zjiRWnLkqkTi1u0t4/N9AjNAm9vx+D8O/uTv7i6l3HVO9o+GGyh6meWlbGRKX
         /P3s2zOVgDnflrEZlaUlPzqSJPTYFQOT1YyH19Ph4wU+FJ72HAfq8hBbItP47UNYPwFs
         rpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u1OnYPAPpdyND+fG/dNYL259x8cfsmX1wVmJknutweQ=;
        b=HbvJZJ0TZmlKU2S0a4rX7rCpgUPHkFPWUyLo5tlTnmJboA6Prs0VNiDJ2qh0ykuFMX
         6E96xh+rGrkmBoW+OFzQBWssB9F4T7Xr3AV76EW8jlUQo4sxiz/SH9w8F/obw6byqdsv
         iL1LYnXLkOsmJnz8/9iNIfFUmwDudt+dWKUfLEOZxYlexhna6wLM9+uVNUkMLH1hS1wW
         nwocGnR0+uUZCb4XSeex2rLEmEKac4oa8Q0Ud8B3GIyfIYr8erJhTyGuMkprN0POF9Ju
         QrbTsnHAqeMsZGW9821+AdBW86oGTLeEGlS4fHDF/TAo6ycCwThhPc9e0GI3+Q/Es5C8
         3/PQ==
X-Gm-Message-State: AOAM530YwGpMsrcGzzze/q+/nmtKz910yzX2EvtysPWGEKqyttJ1s//H
	6EO4yuqkfQT+wKAi0fUDJ0wM8FbrLT/vLTk8iXt8aA==
X-Google-Smtp-Source: ABdhPJw+eMC/UNkKgUIKDSxb/jhkVLHiAWyre2OsaIa0csa8CpXUhMWHr+T3RokTXID/Kt2lPP5G5mzMfDqrtvyoiv8=
X-Received: by 2002:a05:620a:1090:: with SMTP id g16mr4308145qkk.202.1629385654017;
 Thu, 19 Aug 2021 08:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210714134248.21366-1-JPEWhacker@gmail.com> <CAMKF1sqy4JmetZ43q7Nq0EFN1ooRBdR8uutxZxzi2QvuvU1SpA@mail.gmail.com>
 <2ec0fd8d-a20f-c64c-b5c0-0c86b3a682a7@windriver.com> <AM9PR09MB4642908F79699D4DD2839AF2A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB4642908F79699D4DD2839AF2A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Thu, 19 Aug 2021 17:07:23 +0200
Message-ID: <CAMjhiJjxtXe6Q2QPEk9bByUy3i6NvJHbxW8swF+faAyUVgdeRg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Konrad,

On Thu, Aug 19, 2021 at 4:51 PM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> I mean this is the second hard cut in the project within just weeks and
> this time it was host related, which is even harder to fix in a timely
> manner in a corporate environment (basically rolling out changes to all
> dev installations isn't something I fancy on a Wednesday morning :-( )
>
The choice to follow bleeding edge, means bleeding at some points in time.

Why do you follow master on all dev installations if you are not able
to match (slightly) disruptive changes?

I would recommend to prevalidate changes on one instance before
spreading across all (inflexible) dev installations anyway.

I did not follow the rationale closely, but I think it was related to
CMake dependencies as well.

Regards,

Leon.
