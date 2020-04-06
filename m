Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.7816.1586167587822956134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 03:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tJSCUblg;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id y17so13038682iow.9
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eO5JwbzAeGCTd/gdjaE6PULU5J9GJFU/DDnL8uREXsQ=;
        b=tJSCUblgJCv3wQZ+SCuA95CvnwbHCqri5XBO9xKCjQmteiMEMRnZMkZKpmXqswN05Z
         okQPAvV7b4ssdlXyS+DunRRvXq4JALITsroz83LvvHywlTiXlBQjf1H3on2HO2RqG+k7
         tGvsx3RPWX+AG1q7LA2DVPeyYyTqXEIAVdSTQJdaWubmvpYHuhXdktryvSHyUpyl6nO6
         GdbLgDPbMIlSkt3ooXhosyh3TgGKoYGh/D/SvLfbIoRAiq46CpWEfa0FmykT+KM8Y+Yk
         99w+2zyqhzGo4yAqnYPx/XrmYwpFRF3tYVyq5+isopZcCPx4JAAI8iUy6czy6HF07smN
         8Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eO5JwbzAeGCTd/gdjaE6PULU5J9GJFU/DDnL8uREXsQ=;
        b=k4cMThsvTXiWPXuD/Ldh2ic8VKlW0K8LttxYSqCx4f0BWrSo5jrngPGTc4Br5mB+b+
         sh7GK9M2Di4kSx85VRQRgPtJ1YACKcp/p5R5afzG2KY3yIDT0Mh63PKPgZkIkUskoOFC
         Lf8VHxlMgpHRCNfU2GXtYeb7kb5GMOKfayrfBZwR5fmHZ10eVkRAGHsY6DxihJmA/Ufo
         NFi5/NJUmcKi5FDnqWReoLaLOnq7CqgRDNWxlii3TYof4VyMmaK2ZUTJ/SaINStK+bRZ
         3Tx+bU8hJH9aM6EWnCb5PuyJmtsiumYGbgEy+gd4mbf9um/jfvMzJeQcPDC59vuHrUUh
         iF9A==
X-Gm-Message-State: AGi0PuZtYFSC45J38orqy2wjM7jxOq4DfNc1+4B3wmMJknSrbleEbnkg
	eQyThf+JtJM6edNXDcczi3zoSNN/+1PQtzw3dmc=
X-Google-Smtp-Source: APiQypK9ZOmSZ5uxTenwb2tIjgZxPkh76weSPLaY1QCvbu7nf/7HrkGzmTIHxcGEyqeqxqPCUb6IK95Z2dA4bhQAi3E=
X-Received: by 2002:a5d:8553:: with SMTP id b19mr19159691ios.129.1586167587270;
 Mon, 06 Apr 2020 03:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200406065314.1641984-1-raj.khem@gmail.com>
In-Reply-To: <20200406065314.1641984-1-raj.khem@gmail.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Mon, 6 Apr 2020 11:06:15 +0100
Message-ID: <CAO5Uq5R1R_oegKuY7BJKfHvGhiNqdKOas21s7czw8mKOjXq4ZA@mail.gmail.com>
Subject: Re: [PATCH] systemd: Package systemd-hwdb-update.service into udev
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 6, 2020 at 7:53 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Currently, this unit is packaged into udev-hwdb which then adds it as rdep
> instead of rrecommends to systemd itself, this meant that even if we
> added udev-hwdb to BAD_RECOMMENDATIONS, it would not be respected since
> its a rdep, therefore move the service unit file into udev package
> instead, this decouples the hard runtime dependency and restores the bad
> recommendations expectations
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alex Kiernan <alex.kiernan@gmail.com>
> Cc: Otavio Salvador <otavio@ossystems.com.br>

Tested-by: Alex Kiernan <alex.kiernan@gmail.com>

-- 
Alex Kiernan
