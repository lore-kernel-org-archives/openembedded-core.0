Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037D2C25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:30:47 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.200184.1698327038292567756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 06:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=cIww20ra;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.208.44, mailfrom: jester@theyoctojester.info)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-53d9f001b35so1398542a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 06:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1698327037; x=1698931837; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ndO5bUYSzSoIwe0hFBOaUNd1kr3/d/yw7n1CC3H5KNM=;
        b=cIww20ra+zfVcONjEb6FMbRKsPXOp4IxzoDJoT8SPW1RCq9AJoFIVOmbGUXA1BGHr8
         w5AGQKchzFh6WS5tXLr89Ifq85Lryxw8toIr8bXi/KuRA+cMldFRZf8W7C2CPL3sfsdE
         pyNRoj76cpOILQTr1uQBaFeHfLmLzahH6tarLfs7XOqobBBKlcVlL+ls+oopA4xRLOg6
         k9gGycpyJozXu0y0d5tSaHpKhR3HWWsuZLDtATzom4yK5J93oz64XqcM2dL7wPXbdx8q
         aBPjGCbcrS/7teO43njbKc0xLyTbVyw3s+CWfKsvSQAMxXotPtY7/L9RKKLLYLBUk9td
         fCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698327037; x=1698931837;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndO5bUYSzSoIwe0hFBOaUNd1kr3/d/yw7n1CC3H5KNM=;
        b=ZnyFfzGd1Wy8eAy8Gyx1h4lj44SEWn8RtE7CG/XbdmO4RPy03qYtaYocQD3vHkS5Xz
         KcBFEwA0w2PBsDj3PEuK4/hBoABbMUqTQ4wkjClfdoohWKRudOmXTcHRP2GQag9I2WO5
         0sTZnskJnaxrvIAgoh+Zce8QhBuHUpGCo9Z7W6kiQFH9RUNNfM1iR6Twh3rqGdVdtfJ1
         J61IbSjGhj/m2Q4KDAx0bd5OTDq+tDMx/LnjR8zbZ/UtexOPp/d3klYIFgyxTKscMjo8
         9RG7kIGJeZHbaD0olG9zAjJa2SSINVkauXXih2Po9Rvf9MIuXpJLZWlpKA4MgeOPeHJy
         BFgg==
X-Gm-Message-State: AOJu0Yx1gf7W6whwEIJdDYUZHcRrDKE/M2UyjnWCTAKKPz05pBc3vmNc
	NT0GgBdAjvnIoNkZ7WvKr5XVnuUlaOuFi8gSOq6A2Q==
X-Google-Smtp-Source: AGHT+IHRyKKfDCyQhOdHc/TvKTRID5BVxx9PksY+089e5A7Ee8YD73cZPAU/SSDo5F4ZTC6dFQIBT6+kLZnWWFXfZjY=
X-Received: by 2002:a05:6402:1d4d:b0:540:c8b7:6023 with SMTP id
 dz13-20020a0564021d4d00b00540c8b76023mr5264117edb.35.1698327036462; Thu, 26
 Oct 2023 06:30:36 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 26 Oct 2023 15:30:10 +0200
Message-ID: <CAEt6NwrEPS379dzhPKO1rKDk8uc7anzjNNah=GRV+=EDcUdvWg@mail.gmail.com>
Subject: OpenEmbedded Workshop CFP - February 5th, 2024
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-members@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000b8a8d406089e93a0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 13:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189726

--000000000000b8a8d406089e93a0
Content-Type: text/plain; charset="UTF-8"

We are hosting a workshop on Monday, February 5th 2024 in Brussels. Yes
exactly, the day right after FOSDEM. So make sure to extend your stay and
share your findings or the things you bring. How? By submitting to the OE
Workshop 2024 CFP. Open now and waiting for you.

https://pretalx.com/oe-ws-2024/cfp

Josef,
on behalf of the OpenEmbedded board

--000000000000b8a8d406089e93a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>We are hosting a workshop on Monday, February 5th 202=
4 in Brussels. Yes exactly, the day right after FOSDEM. So make sure to ext=
end your stay and share your findings or the things you bring. How? By subm=
itting to the OE Workshop 2024 CFP. Open now and waiting for you.</div><div=
><br><a href=3D"https://pretalx.com/oe-ws-2024/cfp">https://pretalx.com/oe-=
ws-2024/cfp</a><br></div><br><div>Josef,</div><div>on behalf of the OpenEmb=
edded board</div></div>

--000000000000b8a8d406089e93a0--

