Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0832AC7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 07:56:33 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.9395.1750319782976134613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 00:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XjlOdepK;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fadb9a0325so4284716d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 00:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750319782; x=1750924582; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kM8wZ9S3jtmvT5PewT14KjnpuhszD/fgTglfgKoaAlk=;
        b=XjlOdepK6IFyNdTjAnI43e+tvpL/ZXpNSu3a5/jvdi/T+dYd+AE5KOEFLomBHlpC4S
         ovxoM56zJaGlXUbqgWpKi+Gl+ufssXSLAPun8dXZVArwBkK58DlMu64W4ESlQ3UUSfZJ
         LptqrwAVuVy6F8bwuC+RLKDET3XLq2tVftxMPknqrHbU3ApWjeVEpeAZkFm0tD75pQrY
         aVOIP9f3Sg39/OZO/oVmsXoeoBD0XFBc86YBwI/BuNdQtLHmyPCha7wolNRyoCMxWrFF
         UTXKQMR5ZwbFpIFNv0zoTQKv3U82t1vuyQJPHpu6w7YiExV96+onHfWrXgc8+yJYebuv
         sXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750319782; x=1750924582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kM8wZ9S3jtmvT5PewT14KjnpuhszD/fgTglfgKoaAlk=;
        b=lTdhyRBH5N1yY23MKo+XRC4btH35Fj2QIwJ2+Mp9YwBEtNpy6+nRa+aEEF5DIeV5wn
         quSQIWitg9m1Gn4Jan0Qi+IhraG0ib5hrAr0PnmSMUFmsplQ1gDo9ieFMFyDpZwC0Hpb
         Ydjzpw2eBJVA0zHelHElG+2IN/9LPVXa+PMf2Ncd05q7z+XgnhymjyMs8lu5n35rG/r6
         37P4TnxnIeq7uFBGz/8s3m0G/9NTaQtoDcmXzjveaPR1Q3GiXeo4XYc+DZ61G3vMD6d3
         mBHg2/+foFr50M8DDKEzykut/3JjR2Xp1+wNjtDOTzEQk0Eo1wulGEB6cGKj2QaWtnz8
         O+cg==
X-Gm-Message-State: AOJu0YxdRT6YX7tsF7ZXDJAr+bjzTKQ0hav0qvorDEPPhLKdnYm2gYY7
	v20qigl9Bt9C1ZCjd3MuAvqb/85STkWkaIVXyp5nSs9pqnEwhT+rUN6uu6htUjSP3vLDqoNEMuX
	F1dCmXMu1seJsf0ct/vIXVVjDPxTGRyCDJie+
X-Gm-Gg: ASbGncvUBWwT7W/yAKbIwG/Az25IYPyantfXDq/D4PT7XiyJpjXLrFRiF9+olayEm8n
	nWIqedllNoPp3CM4JUWVXOWcZQznQr7N6XwxU0dhPJ7o2ee1OGmeytWoL+3NLQlY9q8eRXFwqbE
	WIbH3S9lMxD2p68cUhF8zM6iz7KK7d1n1xwr/NLDNFLZqUQqBnO9Rgp4zgJ3TN5l52b8A6hxNwl
	h9nx6ZxkTOnEiIt
X-Google-Smtp-Source: AGHT+IHKVOW9LXzQDjSexe/MfSs9XL8SldTcfCUzsIR3+r51DDKg69Cu2Vk+EIUOQq734aAR9ts335KSmPF8hrBb6dM=
X-Received: by 2002:a05:6214:2465:b0:6fa:c41e:cce2 with SMTP id
 6a1803df08f44-6fb47738707mr353886706d6.18.1750319781961; Thu, 19 Jun 2025
 00:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <7dee70c7-d0a8-44ea-94a1-2c4be581208e@skyrain.eu>
In-Reply-To: <7dee70c7-d0a8-44ea-94a1-2c4be581208e@skyrain.eu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Jun 2025 09:56:11 +0200
X-Gm-Features: Ac12FXzSyWWXlJCq3EdGAsGdzwM3idkIKveKmXS0WDQAfD6xc6gU1LGft2nr0d4
Message-ID: <CANNYZj91bFZAMB0XiLyEewy6t0RnrtNAZGEsiV+znM5xSY7S0Q@mail.gmail.com>
Subject: Re: [OE-core] perf: nativesdk
To: andrej.v@skyrain.eu
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 07:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219056

On Thu, 19 Jun 2025 at 09:53, Andrej Valek via lists.openembedded.org
<andrej.v=skyrain.eu@lists.openembedded.org> wrote:
> I know, that what I'm doing is not fully supported way, but... . I
> wanted to build the perf for target device (aarch64), record the data
> and analyze them on the host. So I extended the recipe by adding
> BBCLASSEXTEND = "native nativesdk".

If you want to run perf natively, just 'native' should be enough for a
start, no?

Alex

