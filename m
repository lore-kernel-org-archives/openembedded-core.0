Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.28013.1623667351881087778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 03:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ft+r/qUV;
 spf=pass (domain: burtonini.com, ip: 209.85.221.42, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f42.google.com with SMTP id l2so14045459wrw.6
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 03:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iqE2eI2J57XcUzBoKeaEcfuR/XIkNtDfy67nFWNcO7U=;
        b=ft+r/qUVYFqYHZC6Qh53/4omLc3HHWhDrhDyXIV5iWDn3us7xvNizCy+zzX2rmv1dj
         q/OwU6v0cD1tRQh9GryQchTBfRChXf6vQMQULc+DGj/t74f40pZhZ2Wpdj1z9tKFo3tY
         0sYpchpHQ/51aaEe5ztV8FpVPutddczDsF3yq//BtS3xrOOpuL7T2Lq3L15+TviRNIj5
         9UFObNeyOWEnMNJ3c934raHuP5L16wZJc/r94Mhyur34txOA+NRJN9MkPGiRIb2C1rC6
         eYz17PqJPT6Oq9t9R1fkoAPRFmhfJv2eieO9SbK5pJUBcaG7VkCD+W9DgPttivT3uWnu
         YANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iqE2eI2J57XcUzBoKeaEcfuR/XIkNtDfy67nFWNcO7U=;
        b=fUbv/y4D6/TjH1dIkQ+sOnpSkUueBhvY5xF4GrRJ4NL8FQe/Z2JwcahBxnLc9ApmM2
         BTLQhLI4UJOZ+cIrEUd2SIdhWtpNYytwSUoL4WxdH8fHGdZ+SKuQ/zdynJlRJCFo+nCY
         wF6pqeayyollqxNVqrpbE1qz67N7u7EiwyXtL+vAfz6Xp+oRK+dN12JiFxFwYB5eBbUt
         FNESbbDOG/sBxlxkSinuWs2ogcwbe5hYHQFnSwbRgSi2/XI36MpRsHGRVzE4w8V61Fua
         B8FP41keAbBTFnq+uaICiGDJt0Km648y/42EiSdj5eViDAyNRRA0H3i2eZpAnuS0l+36
         I8RQ==
X-Gm-Message-State: AOAM530iKUFtMJ/ScHAuwVNSniA12NhQpw+2uH1HqpD/eWTVMPlIrIrJ
	vD7Xcec2CS4/mBWNiUebEd5JRs2HtwY8vO3EDbpvaA==
X-Google-Smtp-Source: ABdhPJxPbayGWy6jP+Qz+6Ex949vlBLxPQm2criQCDZ5SgAWJOOcDaQC62+RyXfBV5xiBp80L+qeFl0mj62kSbxcOmg=
X-Received: by 2002:a05:6000:2a3:: with SMTP id l3mr17955009wry.395.1623667350351;
 Mon, 14 Jun 2021 03:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210613140403.4202C9602DE@nuc.router0800d9.com>
In-Reply-To: <20210613140403.4202C9602DE@nuc.router0800d9.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 14 Jun 2021 11:42:19 +0100
Message-ID: <CAAnfSTtaR43Uy-cvWug4mXnnvO55S16RefxVasq7XaGj3kS8xw@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 13 Jun 2021 04:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Jun 2021 at 15:04, Steve Sakoman <steve@sakoman.com> wrote:
> CVE-2020-17541: libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17541 *

Bad CPE, send a change request.

> CVE-2021-3468: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3468 *
> CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
> CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
> CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *

I have patches in test for these.

Ross
