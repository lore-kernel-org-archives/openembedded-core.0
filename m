Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.28489.1623669437399285712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 04:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=apJ2s9BW;
 spf=pass (domain: burtonini.com, ip: 209.85.221.42, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f42.google.com with SMTP id l2so14159089wrw.6
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 04:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i+shhEouFh8E7YtccK5O5gCwBMaKBQHbRXXh59shfz8=;
        b=apJ2s9BWs93Gx3m9qlOB38QBtSlU8Ugho0q4vEmbCXIaDMD02JRq1BZ+Z+GPK3hKJa
         ISLjFAtHGW36xcYiAbkSjdCPsaEv1DdMCx4KybIpX/4etuhd/dpb8aNw6ObFZ3mA2XA3
         ptTOPof05mIcUw00NgD8o9ShsDMl3Gv4TH5Rslj8OZQ7+pq5lwC3i3aONPhxYBC5hPCa
         RhLp5/wVGzAv2rUbDK8PvmZNbWYXnP7Itky3I4wk6dswmkAuDhL70QVyhi6RGVhrChoS
         YzLWLCnGxoHbEeS5VROfLrY3Pk6wvK9ZdoElc5xy1/PgEVQEU980Uq9QRNE34XaUshTl
         patA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i+shhEouFh8E7YtccK5O5gCwBMaKBQHbRXXh59shfz8=;
        b=ezIvSpO6NouEzT8udrFpw3Avnpr/uKOVihT+Hlh07+BWaOrTbKzMnz0nO7PmsYa4ii
         gRagOecFlNDGhITSwRKRULktpbf0H3HcdMUr0XsfUd9vlRkoCPi+DsXHuEfZUsi6TK0W
         GkpYzQ8NROy/oufhZrBRYAF6LuMZ4KlyOTZ376Pkxyt2WhWSHFVdnGgXW3B+LH5ACtIW
         AAFWLKuygA5kDlPlpdtid5ZbE0ga0DcYIXFMnrHMM1lfOiC6lUM3kIGiiuvkQpOIdXwh
         vewIK/lKk7nekdVv1bexO8IMtuVD99bou+or7dz83qDZg0xVGE49+RIc+MMPlsYRnW9P
         MQcA==
X-Gm-Message-State: AOAM530JaCu4TVTlfxINFuQZ7leQk1qKDgy8r2jlllA0kC9Ah2mz3lSe
	f+K9EEL9EBsbiBYOdjDn9Y/4YBj+Ln6+Hdv/E+iDWA==
X-Google-Smtp-Source: ABdhPJzHhp4SnGEi3r+K7LkqCNR3XTr2glNZLoMyy4sAZHhxzGNVMBRp7BziGgZKXiOlB1PYLiEvFX6i+0dCQYauFpM=
X-Received: by 2002:a5d:5082:: with SMTP id a2mr18264476wrt.199.1623669435828;
 Mon, 14 Jun 2021 04:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210613140403.4202C9602DE@nuc.router0800d9.com>
In-Reply-To: <20210613140403.4202C9602DE@nuc.router0800d9.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 14 Jun 2021 12:17:05 +0100
Message-ID: <CAAnfSTuNEwQoW9S2CxhVM7vS8TrVJbJfZMVVdhgFrea_RggH5g@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 13 Jun 2021 04:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Jun 2021 at 15:04, Steve Sakoman <steve@sakoman.com> wrote:
> CVE-2020-27661: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *

Fixed in 5.2, CPE updated.

> CVE-2020-35505: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *

Malformed CPE, I think.  This is fixed in 6.0.

Ross
