Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E813CE79D4
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 14:17:32 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.40828.1695219441817849919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 07:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=U+iL3dK8;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.208.53, mailfrom: jester@theyoctojester.info)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-532addba879so2213886a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1695219440; x=1695824240; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IJdAztqFRUOiRQTDZKhrjRaZ+PYJlBespXmIrYQL0eA=;
        b=U+iL3dK8rzsnfE72hO9DaGQA0DGPW2PyMTezzEUStMoj+YeYJ6+CDoibkf35Ii+ZbX
         drBGUIVSeCGSWlt3l8RSfCXNTZl4w9hbXxTB6NAPKDQ2upz2bVNkevvKku7UvyqeXF7V
         NNthrJyCTwQI6vf3H+YQSyNzDUAT+hNgtwqq2wA4WyIK85SfsFMgu9/nPBlrF8R+AALG
         BorY4Y1aC6z9bG8I4aGIgzsAFPyG2bCKwpGTSJ0hxNmMSTKmF3nwb+SqsJJxYvD59PJm
         PBELmxP+k5zAP3Wy81zw/oipn1peyJvinR5wMVDPJY09cYCn/HUZ2demaV6BGxpWRlrH
         7BTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695219440; x=1695824240;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJdAztqFRUOiRQTDZKhrjRaZ+PYJlBespXmIrYQL0eA=;
        b=NSVECl6U2jli7WWgtKXId8kwi/Wax7QAyQOJ9S0WEwglo4iG1rURjIBHkxUF+R9368
         bNJyqBwVJYId9OIgZvSQHJVx3GRYKdzSz98I+/VspMDPbYo2BT4WPkVzS2nP5LwjJQel
         i5pidXwGQ49pG/YulAxG3UDtQ92majQdy50z6C5md2xw/aU1Q+BezM6Tgn4eXfMVp2LW
         iMdm9y1I+b7YxAq4YVoUu31LT4GEaooC1wl70iTDqQH+dzf7BiDMD8VzbD28TuajEEhj
         Mrdtag76kGUQ3r+96xCr5tWCbbx7eXVYvAfQsrRgQg460TqhInYMzACJIOmF/RCGcs3g
         4kKg==
X-Gm-Message-State: AOJu0Yy5VVLxXy2+VZ7a0ti/EK8n/1X8sfm5pvvqN2pr1WododsLPzmF
	ZnyOu38vk2uymonmfhygpeZsjMTA1xktT3E/YRViaA==
X-Google-Smtp-Source: AGHT+IFkDN+uDeFHiaLrHt0M4thONG33wpoM+Zceal3rSiRI0eNjzZy1Qk3dmeOOeeRHMDr56Gf1sMB6mhLyRLaKLI0=
X-Received: by 2002:a05:6402:5242:b0:527:1855:be59 with SMTP id
 t2-20020a056402524200b005271855be59mr7637965edd.3.1695219440000; Wed, 20 Sep
 2023 07:17:20 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Wed, 20 Sep 2023 16:16:54 +0200
Message-ID: <CAEt6NwpLj4EPmZPQZ+YsAfThd3S_1QE2pNkF=ZNVidKf9qAaSQ@mail.gmail.com>
Subject: OEDvM / TSC news
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000089b8080605cb085e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 14:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187924

--00000000000089b8080605cb085e
Content-Type: text/plain; charset="UTF-8"

Hello my fellow OpenEmbedded aficionados, users, and developers!

You might have noticed that the OEDvM is coming up on December 1st, 2023
(see https://www.openembedded.org/wiki/OEDvM_2023.12)
You also might have noticed that the TSC (Technical Steering Committee)
elections are in full motion already.

If both assumptions apply to you - congratulations!

If not, consider joining the OpenEmbedded organization.
As outlined at https://www.openembedded.org/wiki/Organization#Membership,
it gives you a very direct way to influence the direction of the project.
Not only through code, but also as a person, and an opinion. You are
invited to join, regardless of your affiliation, or your contributions. We
would like to have YOU, as the kind of person that you are.

Feel interested? Reach out to either the board or me, and we are happy to
talk!

Greetz,
Josef - on behalf of the OE board

--00000000000089b8080605cb085e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello my fellow OpenEmbedded aficionados, users, and devel=
opers!<div><br></div><div>You might have noticed that the OEDvM is coming u=
p on December 1st, 2023 (see=C2=A0<a href=3D"https://www.openembedded.org/w=
iki/OEDvM_2023.12">https://www.openembedded.org/wiki/OEDvM_2023.12</a>)</di=
v><div>You also might have noticed that the TSC (Technical Steering Committ=
ee) elections are in full motion already.</div><div><br></div><div>If both =
assumptions apply to you - congratulations!</div><div><br></div><div>If not=
, consider joining the OpenEmbedded organization.=C2=A0</div><div>As outlin=
ed at=C2=A0<a href=3D"https://www.openembedded.org/wiki/Organization#Member=
ship">https://www.openembedded.org/wiki/Organization#Membership</a>, it giv=
es you a very direct way to influence the direction of the project. Not onl=
y through code, but also as a person, and an opinion. You are invited to jo=
in, regardless of your affiliation, or your contributions. We would like to=
 have YOU, as the kind of person that you are.</div><div><br></div><div>Fee=
l interested? Reach out to either the board or me, and we are happy to talk=
!</div><div><br></div><div>Greetz,</div><div>Josef - on behalf of the OE bo=
ard</div></div>

--00000000000089b8080605cb085e--

