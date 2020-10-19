Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web09.3914.1603135290348640849
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 12:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=hAtoPf56;
 spf=pass (domain: burtonini.com, ip: 209.85.208.182, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f182.google.com with SMTP id m16so1376656ljo.6
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 12:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q/CcPDXiV/tzkW276Rx/5H42GZSnaHcO3S0ej+Bv720=;
        b=hAtoPf56zq63yMcaw5xTOHRqb63QQ2B+KXzGsSLUNuQR0wk1JGcOX6oYABow2I5yUr
         928Sa1iWpA0GHQlxzBfG/9GFOwdKyIseLYVBaBhrLl1dORmkBP6qrnmJSfqe2/aTY9H0
         3QTlHWYMtdrPmGbgQFVm0GLHnMH7T+DksLszXR0QI27oAvfqt9hdupZYTA1LGA/X6j1n
         VY0wKnydzEdaYfyZpWH11/Neo+v97s+dbjbRx2yrfLYX0UINJYOWlaSKs7Jv+YFNWTJU
         aonWoAG6uHSprlcgzbMa59fPe/9Q9j9ESStsFFuUZD6QuqtLrT29fD/Tbg89n963nUQU
         qKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q/CcPDXiV/tzkW276Rx/5H42GZSnaHcO3S0ej+Bv720=;
        b=PjYO2Q42Tx2saHmw1ynDjrGId0RPv97Hr0uYY5E5w43H+hpYRs0HZZyqVPYF+v+Yyb
         URSu/WR/42rigveVfXlBgwdBTHdfaYS195aSKVie4OEB709ks4C818krexhlgTbYbBwc
         Oy05/LmI85tKo0RqRQJCo8UVir2NuTS6z4IQQ8pxCy+DRTodiAGTYhX1V5g6HdkWPkiY
         g6b3N79jkKfL6s/fWqtAT0Xt99EXyS7+a/YL+Nszfqoi4Vg+iMJCatEyhCr2h+Jyjzjs
         DQnGJN3titwCTF9arS6Hs6j5guiwkkysup6RO7TSf6HsmSCiHJu7BLzkc2uuwtlRxYfa
         jESg==
X-Gm-Message-State: AOAM532hxEzDVl1sqbQAj/1Sx5dB59uOtPTvgV+u4QDe+e+clO5VS6kT
	0t5M+7CFmaPcBXc6l8cmojZ1FQJ/lTMVLoLj57hrJ8aJ7C5vwZlH
X-Google-Smtp-Source: ABdhPJyH9GxlWIUUWEiBVEesQ4RBn4MQKRQ/C60btj9oDcWgFGNGQHAK3xIp2I4EtGnXS/K4Wy2NPucJkctabpi7toE=
X-Received: by 2002:a2e:97c5:: with SMTP id m5mr663711ljj.22.1603135288506;
 Mon, 19 Oct 2020 12:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201018101813.DC7D29601F8@nuc.router0800d9.com>
In-Reply-To: <20201018101813.DC7D29601F8@nuc.router0800d9.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 19 Oct 2020 20:21:17 +0100
Message-ID: <CAAnfSTsVj6QEioYOsnLJ=9rOT9BY_THAyEU1pAWA+FKYGNtm=w@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for dunfell on Sun 18 Oct 2020 12:15:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2020 at 11:18, Steve Sakoman <steve@sakoman.com> wrote:
> Removed this week:
> CVE-2015-8666: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8666 *
> CVE-2016-1568: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-1568 *
> CVE-2016-2391: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2391 *
> CVE-2016-2857: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2857 *
> CVE-2016-2858: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2858 *
> CVE-2016-4001: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4001 *
> CVE-2016-4020: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4020 *
> CVE-2016-4964: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4964 *
> CVE-2016-5126: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5126 *
> CVE-2016-5337: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5337 *
> CVE-2016-5338: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5338 *
> CVE-2016-6351: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6351 *
> CVE-2016-6490: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6490 *
> CVE-2016-6833: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6833 *
> CVE-2016-6834: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6834 *
> CVE-2016-6836: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6836 *
> CVE-2016-6888: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6888 *
> CVE-2016-7116: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7116 *
> CVE-2016-7155: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7155 *
> CVE-2016-7156: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7156 *
> CVE-2016-7157: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7157 *
> CVE-2016-7170: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7170 *
> CVE-2016-7421: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7421 *
> CVE-2016-7422: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7422 *
> CVE-2016-7423: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7423 *
> CVE-2016-7466: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7466 *
> CVE-2016-7995: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7995 *
> CVE-2016-8576: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8576 *
> CVE-2016-8577: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8577 *
> CVE-2016-8669: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8669 *
> CVE-2016-9102: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9102 *
> CVE-2016-9103: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9103 *
> CVE-2016-9105: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9105 *
> CVE-2016-9106: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9106 *

The tedium of chasing patches and identifying releases and mailing the
update in is entirely worth it when this happens in a report. isn't
it!

Ross
