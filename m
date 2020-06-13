Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.1803.1592014762103565848
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 19:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=h3yxT4fQ;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.178, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f178.google.com with SMTP id q14so8612405qtr.9
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 19:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IASomQHE5vmicMyCbo0loBsF1dQTUgvCfkpCIAlVC/Y=;
        b=h3yxT4fQIdZ/5rKwOVWfevju4FR7tJ+emv1tExciU4guJ98vCEVTcEwYPXHPbhz4tG
         PgAnTMQMqzP4w2OqVU96enM8N03rXsBnIPGZOOKtSq5KNHiigWrzraIbqOU43Ssp1OBH
         WcAA14gps7n2jsLZHoBKc/KRODHs5jQG5bgQRfBwu1zoHXWiiM2hdn74VPd8iw90Szxy
         blNJy5+JQWZ0Dcn31tuQznDbvazHo/EOh2kiE48QXQNhh/DaVpKPk8S4qmA+C8rLho8P
         JUshI3iBLnRWsXo8wQjRGgmrne1rvNwe9Pn806dSZqOn54VWu9CgWEbY/ccP1HGWyMBg
         4Y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IASomQHE5vmicMyCbo0loBsF1dQTUgvCfkpCIAlVC/Y=;
        b=mxyB1mdGa3uxDk0XQxr2Mcuhk42Nizhd2tnoohRvwX2p+LPsfa6+73h9cQpvjnVdRL
         LmUlKcL0ZB17vV28wVXeM7aU1scdU3+S8tc8tbIhc1cPpYF50MgXCT+Cq8XHSSZPOEXv
         +ZX0vpADeilCzqd3JazaPF6kikeWhaJnBjgQrZABHGbfG41sD50kODeyhOTSE2ncor8F
         qGcCBLQtsTdHUSPpxKXRa4YZK2mLOFPljLqZJ3aXexdN3cAUMui87Yiy5fZYHkp+dEaa
         mfkoPFlYkggKqIMnIWUMiNn6Z/JRj1KDetOj+nMDW87AOKEE/51nGygPEXl1Xx0iW6ja
         SsgQ==
X-Gm-Message-State: AOAM532yMKKu/8Sb9U/O1/KCm693IkQdTcXE8qVrr3RbOmVBEMx9K6Jh
	FZ8YBtDN+j5WquB8EC6dOtAa9XEug8G6XA==
X-Google-Smtp-Source: ABdhPJwqunc5fGPnH0j4SncuTvjYXYRhmSDAqYj89JG/ja9qZV4sdpEjVxDtgkRmwUxfl/+uTrXrLA==
X-Received: by 2002:ac8:1844:: with SMTP id n4mr5852631qtk.142.1592014760970;
        Fri, 12 Jun 2020 19:19:20 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id m53sm6421832qtb.64.2020.06.12.19.19.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 19:19:19 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f51.google.com with SMTP id ec10so5296233qvb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 19:19:19 -0700 (PDT)
X-Received: by 2002:ad4:44e3:: with SMTP id p3mr8299927qvt.134.1592014758778;
 Fri, 12 Jun 2020 19:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200612204531.1119475-1-otavio@ossystems.com.br> <3337028.jk9WjbSPrm@tyche>
In-Reply-To: <3337028.jk9WjbSPrm@tyche>
Date: Fri, 12 Jun 2020 23:19:07 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqR_BufWY3ytGpX7RW8U4mq-L=L78bdaH2i1r4NQQC+nA@mail.gmail.com>
Message-ID: <CAP9ODKqR_BufWY3ytGpX7RW8U4mq-L=L78bdaH2i1r4NQQC+nA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] util-linux: Split out zramctl in a specific package
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 12 de jun. de 2020 =C3=A0s 21:26, Khem Raj <raj.khem@gmail.com> es=
creveu:
>
> On Friday, June 12, 2020 1:45:30 PM PDT Otavio Salvador wrote:
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >
> >  meta/recipes-core/util-linux/util-linux.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/util-linux/util-linux.inc
> > b/meta/recipes-core/util-linux/util-linux.inc index 532cceb935..e3ef558=
d7e
> > 100644
> > --- a/meta/recipes-core/util-linux/util-linux.inc
> > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > @@ -270,6 +270,7 @@ ALTERNATIVE_LINK_NAME[umount] =3D "${base_bindir}/u=
mount"
> >  ALTERNATIVE_LINK_NAME[unshare] =3D "${bindir}/unshare"
> >  ALTERNATIVE_LINK_NAME[utmpdump] =3D "${bindir}/utmpdump"
> >  ALTERNATIVE_LINK_NAME[wall] =3D "${bindir}/wall"
> > +ALTERNATIVE_LINK_NAME[zramctl] =3D "${sbindir}/zramctl"
> >
>
> is this sufficient to create it into an independent package ? or do we ne=
ed to
> add it to PACKAGES too ?
>
> >  ALTERNATIVE_${PN}-doc =3D "\
> >  blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logge=
r.1
> > mesg.1 \

In fact, it is not needed. It was split already. I looked it again and
it is already in a specific package.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
