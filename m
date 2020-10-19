Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.4015.1603135672138068809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 12:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pE21a1/U;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id cm24so536923edb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=odfDw9+85SkFwzH/ULEezkXkl2z5m9nVKT663/z4cyo=;
        b=pE21a1/UUmoJpM/bV9tRGk2D4zzdc6t7TNZB8+7m0MAsCkRcOiyvNIx7LyTflbRJLL
         dBAcc44KsGu+KkHlmwRb55H7MHnIDfGEf3H4g6lYWGZmt7aOlrENo13UDbpXPgtaMSrL
         2TkvldVkt1eAEEe/YuCCUgfZttgQjhSvK6RTeWfRSVivw3/KzJXqYYAxVCJk+1cKT+Sa
         0shTZg9Eqv/N9lKULL8W4KsjKMPSK/dmCUh2unLQQ61RIdgQlGKBOdE9+e0PnQE23955
         qk3ThisVisb9tF7cYNOLhGOVd8V8hu4vGN5G2tD1FvTnlFWYblLivA2ZpTsuhSucNVVb
         cGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=odfDw9+85SkFwzH/ULEezkXkl2z5m9nVKT663/z4cyo=;
        b=Wjg2LtpdDl41ZytituubPhNAqSXgZTWQJHPO/uXq0LmjWItaoPy3/40M1/kt5iRD+o
         QeOA/pgNFsTUGKDkV74FuvAR2bfjXIdVGlH8rdJ8B2POPbDVmA91xcryMpIOhsx+K902
         WSVgyHmLaD2DzTiDRUblBRyGQ8Qrhbh2ZKam1x1dAZaBWK3rrfl1MvF/NrTEEDNR3bJg
         H8R8+d6eVpzeEs0Ga2FrrxL+kJWdvCz2QDe/HXXX13di+pvXeleCahuFCQ+EB7uDls4N
         o8OWN7+d4D7j97xeii1eHmwsoqRuJsCDtF1KsTt+r3GSb52h3RPCpGj1EqE3wX/dommv
         HP2A==
X-Gm-Message-State: AOAM532L2yItzJhbDbmPW5UWcH6ODkbGq8v+73OabIWICj6WCK8xi1cW
	hkez01TKm8jniLLnZp9yMmLP+eVKf/0wYwZSP3VPJw==
X-Google-Smtp-Source: ABdhPJysQiFIKQZaBfbKmvnCq5ARvZQ5/J0Zb1iy/iDfAGxGeYYyVIFGSZJdyGPAvnBrCFd8/oEgctqTZVP0RM7qsk0=
X-Received: by 2002:aa7:ca52:: with SMTP id j18mr1328301edt.147.1603135670377;
 Mon, 19 Oct 2020 12:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201018101813.DC7D29601F8@nuc.router0800d9.com> <CAAnfSTsVj6QEioYOsnLJ=9rOT9BY_THAyEU1pAWA+FKYGNtm=w@mail.gmail.com>
In-Reply-To: <CAAnfSTsVj6QEioYOsnLJ=9rOT9BY_THAyEU1pAWA+FKYGNtm=w@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 19 Oct 2020 09:27:39 -1000
Message-ID: <CAOSpxdYTuCtzg3d7Qs2Gk6O2-uTEChjjCPDERY9auuyNbhe4nw@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for dunfell on Sun 18 Oct 2020 12:15:01 AM HST
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2020 at 9:21 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Sun, 18 Oct 2020 at 11:18, Steve Sakoman <steve@sakoman.com> wrote:
> > Removed this week:
> > CVE-2015-8666: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8666 *
> > CVE-2016-1568: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-1568 *
> > CVE-2016-2391: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2391 *
> > CVE-2016-2857: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2857 *
> > CVE-2016-2858: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2858 *
> > CVE-2016-4001: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4001 *
> > CVE-2016-4020: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4020 *
> > CVE-2016-4964: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4964 *
> > CVE-2016-5126: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5126 *
> > CVE-2016-5337: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5337 *
> > CVE-2016-5338: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5338 *
> > CVE-2016-6351: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6351 *
> > CVE-2016-6490: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6490 *
> > CVE-2016-6833: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6833 *
> > CVE-2016-6834: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6834 *
> > CVE-2016-6836: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6836 *
> > CVE-2016-6888: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6888 *
> > CVE-2016-7116: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7116 *
> > CVE-2016-7155: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7155 *
> > CVE-2016-7156: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7156 *
> > CVE-2016-7157: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7157 *
> > CVE-2016-7170: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7170 *
> > CVE-2016-7421: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7421 *
> > CVE-2016-7422: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7422 *
> > CVE-2016-7423: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7423 *
> > CVE-2016-7466: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7466 *
> > CVE-2016-7995: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7995 *
> > CVE-2016-8576: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8576 *
> > CVE-2016-8577: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8577 *
> > CVE-2016-8669: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8669 *
> > CVE-2016-9102: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9102 *
> > CVE-2016-9103: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9103 *
> > CVE-2016-9105: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9105 *
> > CVE-2016-9106: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9106 *
>
> The tedium of chasing patches and identifying releases and mailing the
> update in is entirely worth it when this happens in a report. isn't
> it!

Indeed!  Some are easy, some take a bit of effort, and others look
like they could take unbounded amounts of time :-)

I think it took about 5 hours to do 36 of them.

I stuck to the first two categories, though the third category takes
an investment of time to determine that it isn't low hanging fruit!

Steve
