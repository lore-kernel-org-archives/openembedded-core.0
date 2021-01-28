Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.528.1611870023309132400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 13:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=i/uq4Kaj;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.174, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f174.google.com with SMTP id k193so6856428qke.6
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 13:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9aCeYlCmZ5p9iVBdl6a2G7bBrZEnBh28F4pGDAEch5o=;
        b=i/uq4KajH+qc5nqkvVKjgplJDY2Kc4nSHxlKsRG0mVDoy0clik8651npPxWOom5eHF
         w/FSYPaZhUHjy6n66TxY9izc0kDLRa5Xol1a6xZ704KIrvixN5SM/r/Z0IBoxSMa6ltu
         dlu1wF+DFCS0d5OZtV08MdLgdkjLIapkSXIAGxzsdVdjqMzemJOaNhbflQtZGek+KiQZ
         j+OoF4maoS6GWYsQGb2/NNePN4Y2tvl5qWWe1LsfkypBFCAGxTSLbym1UN7rAEO7LXFD
         QSsAnjCYgi2dm3PdEhe+KKA0PSae+acyyTMQy8D6tSW7ZK0smXzzGOcmmzYJEOIoof3A
         qVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9aCeYlCmZ5p9iVBdl6a2G7bBrZEnBh28F4pGDAEch5o=;
        b=jnzanteyA43hPAXtunIH0VpQra9pAX+VkyKjNXEvx1G8/x0V2YT3XE6+FXa7MlKFcF
         dKfC2gyP0GobpCo4xIvG7Mtvf/jj3MM4FcTDAhDc9vkrP0MEhgwjwUCKzF+FPxB3PYfU
         GwRg2SqTywBdXFLiXNTn7a6HLodP/GPq1yxV3Yoxg0kg5cvNlaW9xaqNc1fgK4o2VZKk
         oxfjxCdzEMC+MtDeUVvmifVzQsusCei0akD/jG8i3Oia3v6jtJpzep6zkzmrxyIiJtKU
         hoADM4X2QfKuCdapiYzv9Ee1oSJ31pA37n3YZSUpGdmWmVtYLkA1XTB77cml/Nl0gNcC
         tO8w==
X-Gm-Message-State: AOAM530GaCakmQ0Caom0u4oHtx2QTyUUdBCBDhC/Lg1ptmysd0O4gB+t
	MxZFWDcc8rLxqPkS34bHFQ6Mc+MQDsWmtKWo
X-Google-Smtp-Source: ABdhPJyJpgE0VyBkU9t+VQ4jzJzWhW7RYGBRkSvGhuB2+kQ658OsoeuXMnJDJuOgdMyTksxID83W9w==
X-Received: by 2002:a05:620a:5ae:: with SMTP id q14mr1317741qkq.156.1611870022285;
        Thu, 28 Jan 2021 13:40:22 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id m64sm4390665qkb.90.2021.01.28.13.40.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 13:40:21 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f172.google.com with SMTP id t14so5253756qto.8
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 13:40:21 -0800 (PST)
X-Received: by 2002:ac8:2615:: with SMTP id u21mr1557893qtu.233.1611870021396;
 Thu, 28 Jan 2021 13:40:21 -0800 (PST)
MIME-Version: 1.0
References: <20210128213504.3821-1-tom.hochstein@nxp.com>
In-Reply-To: <20210128213504.3821-1-tom.hochstein@nxp.com>
Date: Thu, 28 Jan 2021 18:40:09 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpEeAQou7ru_YMVOoHdoUHVGfWOxJbf=f3UyR-08F4cZw@mail.gmail.com>
Message-ID: <CAP9ODKpEeAQou7ru_YMVOoHdoUHVGfWOxJbf=f3UyR-08F4cZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] openssl: Enable cryptodev-linux by default
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 28 de jan. de 2021 =C3=A0s 18:36, Tom Hochstein
<tom.hochstein@nxp.com> escreveu:
>
> This is a Request for Comment. Would it be a good idea to enable cryptode=
v-linux
> by default, gaining hardware acceleration where supported? Are there any
> unacceptable drawbacks? What happens on hardware without acceleration?
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>

Tom and I were discussing about this and I suggested him to raise the
issue here. We are not aware of drawbacks  but as we are not experts
on this field we'd like to receive feedback from the community prior
sending the formal patch for it.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
