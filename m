Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.68480.1629377652267212468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 05:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=FL925mau;
 spf=pass (domain: burtonini.com, ip: 209.85.128.50, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f50.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so6761419wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IHjSMicGQw+DW3akmknA1jUMCvA9jufGtUW3lSzHJO8=;
        b=FL925mauPMqgmTMuFnXrmPnYIrpdEmzwyqQaU216nm8mRhPpDCVKiwmw9Yb2PhX8wS
         1SvdAcbX7n9HjtQg8Z/1wJ95x3xG6Ybczw59yeeNg5XxXXg2zhIZTB16vkWAne8DAikW
         /oVrAmtGKpMhM2aXD2FcKPOU34ntgsqCihVfp9su9hhNGo3iAhZTFBKeyLKDuFZd4rj2
         EzN4PJQhJ7q4Jm0YuAhMRvBXHdFoz1zX7Y41XnJm3xYaoclQ2i1HeahtjuC1CpLcXnZo
         +LQ57n05mKSgS3Q2xtU5KaQpMasS8ZpPRshYEeP1j4h/8iLvlpTlc+cMZNPD6Hiyr3W7
         DTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IHjSMicGQw+DW3akmknA1jUMCvA9jufGtUW3lSzHJO8=;
        b=My6oGvWDYgvfksMYS4L9vpM5pXPWR8+0zf8rbsgTjYlt/QNOOOVsOVNkj1Sw5XEUyo
         PSj33OBRQ2xVQ8le1HZqBw1NTf/gy2Ya5lvxW1TLytxXeftFTf727Om9efzkuGvJ4k1U
         yNZxzxO9L/TH2TJ+qNQ9KkYOOz48Z6Uej2zZankBTfByf87MpMLs8VuMdWPitz00GJoO
         qYPVO6SoEjIX1EfuXcdJU15XC3XDZeW5jj4pyJ8igDOsbKbNotzHu5XWJImtX02uv85c
         R6gho0Sd1AWuA4DlmJ1fsVCoCV60anDiaEEiuHluGml9nS0iK0NgX2J+KGQVs0Kzqrtu
         oa0g==
X-Gm-Message-State: AOAM532bh3KE4RIl9LEWkSFevuIh5ZJBOvqpFtIBB9e01lZI2vvriPgT
	SmU3ZqZ5TDNimQ+YojAtN7C43IBqn60jwpk9cM5qtw==
X-Google-Smtp-Source: ABdhPJy3hHvee+2hs1QEbKXA0xXl3RnE7DKiZptcVhbVtVHE654VSIuwxRgFga4XlGjEcAmYHrLnZdKKXBt9BgyXzSY=
X-Received: by 2002:a05:600c:3505:: with SMTP id h5mr4435734wmq.171.1629377650702;
 Thu, 19 Aug 2021 05:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210819063335.3670-1-rybczynska@gmail.com>
In-Reply-To: <20210819063335.3670-1-rybczynska@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 19 Aug 2021 13:53:59 +0100
Message-ID: <CAAnfSTtzG6sSkKtUEmkopf4hp1bFKXczy6d8ASemVOmD77y_9w@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] lzo: add CVE_PRODUCT
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This replaces the default value of 'lzo', it might be safer to use +=
so both this name and just lzo are searched for.

The CVE database isn't very reliable for consistent naming, so I
prefer to cover all bases.

Ross

On Thu, 19 Aug 2021 at 07:33, Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> lzo was missing CVE_PRODUCT and related CVEs (at least CVE-2014-4607) were
> not reported.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> ---
>  meta/recipes-support/lzo/lzo_2.10.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/lzo/lzo_2.10.bb
> index 85b14b3c5c..31a229c7f5 100644
> --- a/meta/recipes-support/lzo/lzo_2.10.bb
> +++ b/meta/recipes-support/lzo/lzo_2.10.bb
> @@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b42
>
>  inherit autotools ptest
>
> +CVE_PRODUCT = "oberhumer:lzo2"
> +
>  EXTRA_OECONF = "--enable-shared"
>
>  do_install_ptest() {
> --
> 2.30.2
>
>
> 
>
