Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67458CD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 20:10:32 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.1913.1711656623291284028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 13:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=zl8SarbM;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.167.45, mailfrom: jester@theyoctojester.info)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-515c3eeea5dso1346074e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1711656621; x=1712261421; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I/O8U9HWEsexVLiy0RvIYWmTjb92YYaLWBhnuptwlNg=;
        b=zl8SarbMLJw2xHvX0ATSESy92LXDHRduKC8V3HUrqsfKeE6g4w88m01Gqt5YKbYGER
         GgsusLTgYZd6oPU/qZ3AXpBN/88/fv+t2IlANd1mOkwrHneZPVNZmBVCJRNKilkTPONS
         g4LDPrcm6REAPabD1CQNzOZs/YvwxrZ3ewbJNqDAq741eB5RnN7vxIe1as1/Hj5JQ3/M
         2Wi6AY0pmZv03Uz1CrMiidqLGmCXd94b79ffnWedVcfMjdUroOk+nrygt3cQdYasAj8u
         e+wZWsWOqloT65k/DK4eT1VF/SX4pFTyoFT3BIdK00j5k12h+Vx9P19qJgCo5BiR3a8o
         HGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711656621; x=1712261421;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/O8U9HWEsexVLiy0RvIYWmTjb92YYaLWBhnuptwlNg=;
        b=XBFYZPBcLD6NTo8ihet9K/SO9r+ULuvJYKgOzhsowgTfuNrnPlSDIKGxO5YFSIRvYc
         7zLUTe4DZORhbK3eFfcYdrz6BP6cUmKRL7sfcPzYwPllFSDqQJhjwDDunSceom9JmLti
         Dyk47WtSiTz1CmohRjZ4+MM6R3IrPOK0rxN9NGacltLAUCLjHzN1M12bHqW1uG2To0qS
         WdKB891aPbIQPPhqixNlPfZesLOwO7FUFP3r4xSqjRf5NbRrbKu+egaUUrAF97GYXbqP
         t13be3AtXbokub8lAmqNjNBR/6BawV3ytdZxSF+Hgfn2YONaTH+ajiXE8Lb5/KCIQvPD
         DvLA==
X-Gm-Message-State: AOJu0YweX22hdY+C4OwgKMkknXqHltC6GAjAuS88g5rq8eouiiJd7nlr
	6mTrYEVT1QMh6qJUkH5PHsB1gF0R8kQNGnveEf4xHgUxglHYcbEF3xGATqUZnTt7aH4xJPAvWQk
	5NXxWPSlwPRxXig2/dRc49eIwEyCFtUBcod57SSVonSZve9OIJEx3jA==
X-Google-Smtp-Source: AGHT+IFs6R3dOU2HWKWFkPkil/RmGU6xAnQwSboXdSZsFRFvgt7WRcFALgYn2I5eFyV9BZcVGJ5hbTdahKa0iWojdkI=
X-Received: by 2002:a05:6512:48c9:b0:513:cae8:4409 with SMTP id
 er9-20020a05651248c900b00513cae84409mr331830lfb.7.1711656621157; Thu, 28 Mar
 2024 13:10:21 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 28 Mar 2024 21:09:55 +0100
Message-ID: <CAEt6NwpL8Wich0H_65nBtCgLV_7unNwLZ44b2w9o0bHb-76KUw@mail.gmail.com>
Subject: Yocto status mailing list
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: members@lists.openembedded.org, members <members@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000e1db550614be1cf1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 20:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197608

--000000000000e1db550614be1cf1
Content-Type: text/plain; charset="UTF-8"

Hi all,

Following some discussions and suggestions to improve, the
yocto-status@lists.yoctoproject.org mailing list has been created. It will
serve as a low-traffic, high-density list aimed at those who want a big
picture of things going on without getting overwhelmed by patches and their
discussions.

Currently, this mailing list will receive the weekly status report, as
already known from the openembedded-core and yocto mailing lists. If you
are following those and are happy with it, you don't need to change
anything. If you would like to receive only the condensed status, please
join yocto-status. Upon relevant events or decisions additional mails
beyond the weekly report might be sent to this list, but we will keep the
volume very low.

Greets,
Josef
Yocto Project Community Manager

--000000000000e1db550614be1cf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div>Following some discussions and sugge=
stions to improve, the <a href=3D"mailto:yocto-status@lists.yoctoproject.or=
g">yocto-status@lists.yoctoproject.org</a> mailing list has been created. I=
t will serve as a low-traffic, high-density list aimed at those who want a =
big picture of things going on without getting overwhelmed by patches and t=
heir discussions.<div><br></div><div>Currently, this mailing list will rece=
ive the weekly status report, as already known from the openembedded-core a=
nd yocto mailing lists. If you are following those and are happy with it, y=
ou don&#39;t need to change anything. If you would like to receive only the=
 condensed status, please join yocto-status. Upon relevant events or decisi=
ons additional mails beyond the weekly report might be sent to this list, b=
ut we will keep the volume very low.</div><div><br></div><div>Greets,</div>=
<div>Josef</div><div>Yocto Project Community Manager</div></div>

--000000000000e1db550614be1cf1--

