Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.727.1591995769092754005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 14:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ubx/91pS;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id t8so10033694ilm.7
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 14:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IlSzWI5eXz+IcKEmIvyk7rsrLlxxFmdTBAE6RdATEkU=;
        b=ubx/91pSKaPWJhwR2zzuXsl1QxiNwuiZ1Or1P+7xIB23InvPhEX1CPxN55Jm/k6HOL
         IWHwjceztZKfp65H69KNMegcV2YIcVm/Q4JT3arXB/BXANrMhOouTVUbJ+O83xWPOBgD
         7Tbdh5hcNDmiWc7QpfkD4jZ2p7fNEdnufY1SUBAbuGb8bESP0ivfb08aVJCzaW43nMOX
         PQgvD+5EEE/pRjR4O2IUv5lg6kuSisCfPJGb+diZ+0bMau2ZpGSNLu+L3E1Eo+4G/Eyf
         chMv/j6O9dsBAN7vqrn8goQNmVWBdYCgabAzkvGwHPfvCfLF0wLn071q2CJwE49KqjYy
         DsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IlSzWI5eXz+IcKEmIvyk7rsrLlxxFmdTBAE6RdATEkU=;
        b=gMy3d49g8W8V7G7Z43pvq9eazgG/7Igrr0LX/Ah4tHGr1hnBUcXElnRUogZG0d2oNd
         k/Qbe4xJImBkixex71M5+Efu0+QfA3N+nJf0hUh4LJZYOBzs4JxFmLzsUbwbXjUqglvH
         v0zJ6LFy2wXwiZ4NGwSUsX6GZ4Yhq5bRG0/smeygXzoD57HeX9KpRh8A4BJ0abxEaso3
         Coy14J7S1JdkyZW2f1Bo92AKCJLZgc9fK6ElQJTl33MqSWIt1DRbYRUlaSlPyrH7/l5l
         HWmCDd3xz2OCjgkn/UUEa6O4V+QoTaYKWkY7X+WYJcflgi7hAWApt1dO5w6FH/jhARBD
         6lcQ==
X-Gm-Message-State: AOAM533PKEQQw6Le06d8/TZpbRWUm4S6KZwfqHeXn44iksL0SceMyBIj
	l2yHIQma7KHxMZoVzpW7ad3W4DPuSUpD+dQhTRE=
X-Google-Smtp-Source: ABdhPJzZzqIqWuUYFn+altfKiKKRunL74Q+uO76JxyXr+Advk3SxTpfPrEOX9t/yVCJoYAKrS0Qezhad8qb0HYL4PHA=
X-Received: by 2002:a92:cf48:: with SMTP id c8mr14462534ilr.147.1591995768479;
 Fri, 12 Jun 2020 14:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200612173318.103232-1-otavio@ossystems.com.br> <20200612173318.103232-3-otavio@ossystems.com.br>
In-Reply-To: <20200612173318.103232-3-otavio@ossystems.com.br>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 12 Jun 2020 23:02:36 +0200
Message-ID: <CALbNGRTG5xccaQBOLevgtjDvF3cz1gBEx+tLU-8nH0AnmwNazA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell-backport PATCH 3/9] libtirpc: upgrade 1.2.5 -> 1.2.6
To: Otavio Salvador <otavio.salvador@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	zhengruoqin <zhengrq.fnst@cn.fujitsu.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 7:33 PM Otavio Salvador
<otavio.salvador@gmail.com> wrote:
>
> From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
>
> 0001-xdr_float-do-not-include-bits-endian.h.patch
> removed since it is included in 1.2.6
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit c940792e1492923036cae97010f9945e7ad43a32)
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
For me this fixes native build on hosts with gcc10

Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
