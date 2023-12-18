Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AEDC46CD4
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 11:34:24 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.42151.1702899254543134227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 03:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=lDh8BkiY;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.218.48, mailfrom: jester@theyoctojester.info)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2340c803c6so131636366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 03:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1702899253; x=1703504053; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6tXSLnJNuclctIY+DmoQr81eQmlqmxOOA0cP+sAtwgo=;
        b=lDh8BkiYUvFkibpIfM8DmpOhpzpXlTsJ6wOqf+IrJMAqX/qAaPJDirMqCvY9mhJDgO
         XrKH3IeLasTM0YpI97N0vBIKEtzClI8VSuyxY1x3CZmqzqlRUq+/uvt6y2EuxMqQDZam
         Smudj8nCiKUa12/4+GIQDYCQavBNOhrGCxPHmWsM+i55BrZxFBLEGXlLLdF6sm0qgR5D
         mv/A4d+z1MeQngiLNPZPNIV3hPLQ7b2AMT1n3vaEMloEkUdtV6RNrqt0R4juffmJSXRY
         fnwrdAo7XvMi8h0mZdpKI0+Juu9lddB4GRKM0qMAxjlZQfpuF1Z/LGuHlsKhEHzJlhLN
         eTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702899253; x=1703504053;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6tXSLnJNuclctIY+DmoQr81eQmlqmxOOA0cP+sAtwgo=;
        b=QOzXELGF5gMQ0hUuK7bQN5nw6TGkpxJE/ARBrCslR4fi7fWD3gASzzyFUs4Xxg+Jhw
         ggnh20LEcu9NkCJIgHHW613O2u+Giqs1BMGkX0TKzD8xfedVcQ7UuFeRGsUiPDGYT+66
         5wRV++rtCEgWuBQaUUHqO/4GWX0uOcEzJK9MKJ0EUtGO4rQCO1ulY5PlACBc8lAwV4rL
         UpODVkQQkGQNt4lpVqL5sQMEftYzzjkwg4e991crcfcFhX8CAJ/GxCBi78qVL+yHOYeX
         9gtNG+IEuge3bw3JxLjEJFS6ozAaXEfYeMI4jP8HkUrcpzjEt7g6AiYAUWUyzlfUATm5
         048Q==
X-Gm-Message-State: AOJu0Yz5U/3tF7DquipnfhwrDFmkrc1q9PGLsrwfu/Wd1fS2PFBo6c/I
	tABqyDIqjQoDAV4UHAgucQfRDBNwvQbRxAKqbBdjNQ==
X-Google-Smtp-Source: AGHT+IEnyb1BfHo+/CwGIig4Njrkjd0vCCm1MBFKoosEZ6mCghw5fPRQg91JkPLJZl28DO6BWYUVENLia7k1t8TYrvA=
X-Received: by 2002:a17:906:5345:b0:a23:4f2e:f7b with SMTP id
 j5-20020a170906534500b00a234f2e0f7bmr701964ejo.56.1702899252311; Mon, 18 Dec
 2023 03:34:12 -0800 (PST)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Mon, 18 Dec 2023 12:33:46 +0100
Message-ID: <CAEt6Nwrk4xR6KEPYdtPJCzYHV=zsxnJapGCDPm1h8t30TSxeWg@mail.gmail.com>
Subject: CFP for OE Workshop extended
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-members@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000005cab0060cc7216b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 11:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192634

--00000000000005cab0060cc7216b
Content-Type: text/plain; charset="UTF-8"

We have extended the deadline for the OE Workshop in Brussels, Monday
February 5th until the upcoming Friday, December 22th.

Give the gift of OE and share your knowledge at
https://pretalx.com/oe-ws-2024/cfp

Josef,
Your friendly OE Santa Helper

--00000000000005cab0060cc7216b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We have extended the deadline for the OE Workshop in Bruss=
els, Monday February 5th until the upcoming Friday, December 22th.<br><br>G=
ive the gift of OE and share your knowledge at <a href=3D"https://pretalx.c=
om/oe-ws-2024/cfp">https://pretalx.com/oe-ws-2024/cfp</a><br><div><br></div=
><div>Josef,</div><div>Your friendly OE Santa Helper</div></div>

--00000000000005cab0060cc7216b--

