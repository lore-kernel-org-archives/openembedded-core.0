Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.2033.1618529936853594122
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 16:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=acwd5PSe;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.180, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f180.google.com with SMTP id h13so8483052qka.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 16:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v/RyQh8HmyFFAkXlC99P+djC2enWtvgZPqbiC7pThiU=;
        b=acwd5PSe2ZI1qSXyz/pWUHwyMAnFSsDKRLirKyiasMEqdiS87uBQ782qKZUU40K9ss
         tszjMPHXEh55X6KUTCiWCXeTOZkvi8EgnSAupfHWpsuQaiF/02wQ9PJ5QsUnfHtXvzy9
         W1Jd6XMRj2DDmqMN+oJoZkcTvrsZxhC99j8qTyuNN5THu/nrrHQsFe3ac3gnrXFmGeUP
         qohMhIcIphTRzWtNBSiVKQYpqsp5aXTy5Gds+rd4oXLSm9ikL/fhIST/IJPKlDkqFCah
         65UwrNzMUsbhvYTI3SW6hDUXR5HAz/8Vkw4eVHxK92xk96/WGvEsNsRhBuKLYpzw9Y6U
         K+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v/RyQh8HmyFFAkXlC99P+djC2enWtvgZPqbiC7pThiU=;
        b=Wi08Iij/mhHG+RdX3L++NMC+pIm4dsYI6FQm8/qKjiyjLyIUBPNMj1NVOH3elU+I1m
         tWsvzKgFOZG93wWHwDv9laTP5dwNSE0Y4eRQDRla4q5fCAKMKAwyOPb288TkoZnp/n9I
         fe2YqrGrsIwa7N3hSuUXLcx/0fLfHtPnJaV0qyufRRaihy3YvPl8ayHhCaSx/yQKCh2U
         yVNAvvth+h1tJRqZmtiS7/AX5kSdbI7eSaXBMTuMdWEqy4/Xe7M2aNWxcnUPyKJ+tp14
         YjHotaTtppUjyh1hxU/nRrsXwEMX8S5tBi8RQ6DNA08ZqmxItFLVHrKXwq0PrfRQpKlg
         rcyA==
X-Gm-Message-State: AOAM53049ypfW7mmZPgQTRr8hqtlx5xI+pL6pHi7+nxH3ppwTt474jg7
	73GWKhPxcZQWQ5q07llIEh5DuQmrGTnLEW0B
X-Google-Smtp-Source: ABdhPJzWKW4to/nxVYPaV3lmqKr6WMRZDeUKaHmgTZN9jjkrIGQ9Jt2iniHjRmRXHmHhpB5JMxnhDw==
X-Received: by 2002:a37:9547:: with SMTP id x68mr6047048qkd.474.1618529935840;
        Thu, 15 Apr 2021 16:38:55 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id 191sm3069548qkj.90.2021.04.15.16.38.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 16:38:55 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f173.google.com with SMTP id s5so18377730qkj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 16:38:55 -0700 (PDT)
X-Received: by 2002:a05:620a:13a6:: with SMTP id m6mr6235263qki.64.1618529935012;
 Thu, 15 Apr 2021 16:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210415145929.2007522-1-otavio@ossystems.com.br>
 <20210415145929.2007522-2-otavio@ossystems.com.br> <DBBPR04MB775354F404BF99B70CF26EC1E24D9@DBBPR04MB7753.eurprd04.prod.outlook.com>
In-Reply-To: <DBBPR04MB775354F404BF99B70CF26EC1E24D9@DBBPR04MB7753.eurprd04.prod.outlook.com>
Date: Thu, 15 Apr 2021 20:38:43 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrgoiTOP5KG7TrQurdVhiJcQmo71kkSnvf11vk9OLdg9g@mail.gmail.com>
Message-ID: <CAP9ODKrgoiTOP5KG7TrQurdVhiJcQmo71kkSnvf11vk9OLdg9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-base: Use bb.utils.filter to reduce code
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 15 de abr. de 2021 =C3=A0s 19:28, Tom Hochstein
<tom.hochstein@nxp.com> escreveu:
>
>
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Otavio Salvador via lists.openembedded.org
> > Sent: Thursday, April 15, 2021 9:59 AM
>
>
> > +OPENGL_WINSYS_append =3D "${@bb.utils.filter('PACKAGECONFIG', 'x11 gbm=
 wayland dispmanx egl viv-fb', d)}"
>
> Needs a leading space?

Good catch, will fix it and resend.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
