Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web12.357.1610625433410096707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 03:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=RFYqSGu2;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.177, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f177.google.com with SMTP id a6so3259885qtw.6
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 03:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oVHOpSBFkfCohq9ouFVGxeUTf6VZPVIuuYVvq073oHw=;
        b=RFYqSGu2TgmAAo//XTodMcyMIPIWlMQMXfT60TIImC8UGQvXnmZqNr2KFHqQYl2wju
         jhZFepdflkQT63xD7ZZKEpn29l3DvIXBF4zU9QjXiI4Pan0QLO96wnyTrMicQL9w82bo
         5pYGN03hWaATK9vj9d04eHu6qMO3XF8EBJfQtKkuqptD6qyJkSLqmKbRpTvZvqggnNMy
         8naFBeTjsIlxUuvNtW1HSy73OLe+H2jtDYRM8utBmnjfsmjpxhgqgXcV7SY3hnk6aRgM
         y4NMMQXgzuo+gS31VWt1L8TxMSPxO74EzBG2fvAdKc9zdScOpnpo1hAQb5lQyDg30LWS
         PJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oVHOpSBFkfCohq9ouFVGxeUTf6VZPVIuuYVvq073oHw=;
        b=OY0WZza/t6dXh8V7e/EuxsETi9uNOuaWOqfUUxBHHRlS6+H8SmSIXlOsjk46KfewxB
         FHEvRQuMlN0YaanKWp6a4WJQi87iTA1BPj5RFM6T9JTATVx3y/a0w/3Cf+pvAYkTN6Dh
         Xe+rfFIFkVO+/Y6LmvblKlrnK5DITDZJXV++lY8UD3Hp+PDIEaW78yd8J2z7JYNHlJcH
         GQlZTm/vbEvzPZ/Gq9VLBMwM9oh7ctCcvZeOgoaMCqVF11q9ChVx+tirADI3nKe8KdD+
         oOr6bBeZs9A/xYGKKP5J8PhibeWGoKk4umK5HE0eo0vTZiUOfbh+1EPVU6BC8VHoR/eB
         mDdA==
X-Gm-Message-State: AOAM530DOM+yfJxqJ0pw3Q2YzzxcaPz+OPeKofFPnQkntvUHsWdRxhoj
	oGfSsA2shkjuN9NLbcADIhhmnQd+MD7gcFqy
X-Google-Smtp-Source: ABdhPJzVdYdqZqX9Fap071cRCW0MQHXT3r89xJD+mY1SU8nqoFadTejDvC9qmkM6DuVJL6E2nj3n+A==
X-Received: by 2002:ac8:4e0a:: with SMTP id c10mr6714418qtw.312.1610625432221;
        Thu, 14 Jan 2021 03:57:12 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id a206sm2821260qkc.30.2021.01.14.03.57.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 03:57:11 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f173.google.com with SMTP id c7so7219982qke.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 03:57:10 -0800 (PST)
X-Received: by 2002:a37:a510:: with SMTP id o16mr6679026qke.383.1610625430293;
 Thu, 14 Jan 2021 03:57:10 -0800 (PST)
MIME-Version: 1.0
References: <830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
In-Reply-To: <830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
Date: Thu, 14 Jan 2021 08:56:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrAHAYfPvF=xjZk1aPPXuwP2_zOcg11U71sKiiR1o6kRw@mail.gmail.com>
Message-ID: <CAP9ODKrAHAYfPvF=xjZk1aPPXuwP2_zOcg11U71sKiiR1o6kRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] classes: Introduce intermediate-deploy.bbclass
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 14 de jan. de 2021 =C3=A0s 05:06, Diego Sueiro
<diego.sueiro@arm.com> escreveu:
>
> The intermediate-deploy class is to be inherited by recipes that
> install intermediate artifacts which are not present in the filesystem
> to be further processed by other recipes.
>
> The INTERMEDIATE_DEPLOY_DIRS variable is a space separated list of dirnam=
es
> from ${D} which include the intermediate artifacts.
>
> Change-Id: I314987587c1cf0e4cdb28fbf11463f1feb37504b
...
> +        for dir in ${INTERMEDIATE_DEPLOY_DIRS}; do
> +            dir=3D"${dir%/}"
> +            dir=3D"${dir#/}"

Does this work with dash? I believe this is bashism.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
