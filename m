Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web08.7787.1615378323995663958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 04:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f42my+tg;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id z65so8580107vsz.12
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 04:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S66+1cdFTJrLLSAYK5B3l0zAc73T44tfexhaHBWbV9Q=;
        b=f42my+tgGHCVIiP96/i+nkNjFgVbS7Ti4X9wrjzM74z+E50gFCpKHSTBKrAZ4S/45x
         BYtogiOEBQKyCNHJG9TPvy9pmBpgGZJNH0lJu1hmjmrq0zO4RF5gBPDKDCueybpZvI94
         ZevSPLIOacvSXugpdztCsyar3N1snuvE2t9owqobIhmC0McBsXKHpeV8dyL+7aFuhl57
         NEFeCuLHhoqxmBbfpkMDg2HNN9f0nUHY+eDxG3eCWUv8NhuvEfwnB/VUYZC+90JOwjg5
         zcFfvDkgyERW9jIcjUcPRijscmuAefbcmp/zLIkwejFEeTAM7iwkhnR+cGKt44djBIik
         hkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S66+1cdFTJrLLSAYK5B3l0zAc73T44tfexhaHBWbV9Q=;
        b=OMJInqwApZXnfFES62xebo7MYXq5JyFk5tYmR/Ueh4+F09yfL3vawc3mpzxzLUY6vb
         jUjWbbeDFYGdcg1w1tEVAMoFEXtDS162ZYdyo5HCXt5zqrXZ8CQVHLFX/CzHhT9HFlP0
         V24bnh2gJH9XOLD3wDAlxeHOuuQ+5KZkznVvgbaWj1h43mQ5kVTlNv5xcw+qu3dwfNxI
         cgSp15mko2e8XL5/fLjhBi8kEdhs5G53EGdbIpydgQ1O0GDbnJ2eabYvmmmkF+e9Hf6S
         rpojlz6WKnZ5hafMDY+N8EpeRXuH1uVqcdYOlsbt4MGLYfjOIcxonLBXAqD/Cfy75y8P
         dwdw==
X-Gm-Message-State: AOAM533LhfLpU3nzVLZEk++Lgam8Q3Nrz2JAqCaKb3quiD9k0YS/RNP5
	4ihM6ahePxHFVNcR8f6wD6wlVE2H1ycCc4t1II0=
X-Google-Smtp-Source: ABdhPJyWSgGApsJ6S+Nglp02cCOwq/z2rwCjDPwnJTdhhiFyk7DwxQgZlHVv2/fZrtnYx1qXl7EGmnTIuTyjQuMG6Go=
X-Received: by 2002:a05:6102:74a:: with SMTP id v10mr1243443vsg.20.1615378323085;
 Wed, 10 Mar 2021 04:12:03 -0800 (PST)
MIME-Version: 1.0
References: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com> <1615376771-3093-5-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1615376771-3093-5-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 10 Mar 2021 13:11:51 +0100
Message-ID: <CANNYZj_0W87FVS+yg2amwUJoSMkHBDNQbvVP6C4s79hbBEeB_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] jquery: upgrade 3.5.1 -> 3.6.0
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000201ecc05bd2d9324"

--000000000000201ecc05bd2d9324
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Mar 2021 at 12:47, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> License file updated
>

There has to be an explanation of what exactly was updated. The checksum is
in place to ensure we don't miss license terms changes.

Alex

--000000000000201ecc05bd2d9324
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 10 Mar 2021 at 12:47, Wang Mingyu &lt;<a href=3D"mailto:wang=
my@cn.fujitsu.com">wangmy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">License file updated<br></blockquot=
e><div><br></div><div>There has to be an explanation of what exactly was up=
dated. The checksum is in place to ensure we don&#39;t miss license terms c=
hanges.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000201ecc05bd2d9324--
