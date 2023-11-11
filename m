Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BDEC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 00:17:29 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.43189.1699661847676661023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Nov 2023 16:17:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G3Rab0h3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32df66c691dso1419394f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 16:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699661846; x=1700266646; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VXbkK4y8apLB1kyEGox4d1scTOjcFsB7KY7r4OKUZT0=;
        b=G3Rab0h3U2GncVLPS0fvtNcH48KjjypQ35Mvt4mhRADUMz5Z3unKsstecQqLhbfjd0
         B+tEQzaxWJbqJYpKImqoQ7225KJeEM6e+rwl/ckGQN3u871gNuidMhOu205FGmgP9xZA
         Wu5RYm+trS1Cc7nQ+JNgRA3c1t/KBvGzi2qnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699661846; x=1700266646;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VXbkK4y8apLB1kyEGox4d1scTOjcFsB7KY7r4OKUZT0=;
        b=XYumPs2dIK3AZBcUisHISp79b4ojoJiT2YRnp/qUrBpDsaiSbToDDnIIx40p0LlkDE
         JupOjDuYk0aikuoh55UL60M3eCNV1DSnL49gTd157BsazdBvA2dGsjsn09y6t+j+3wNl
         cRfaqPjEyLrcmrFg1cpq+4Q7MViMhJq8+icB1734XS09/uhlb9s8zymfoZEecF0gzpXB
         RedfBk9TCYwEyEB/bvepyK4PCdMd6fjTIldXang7B8qcnganEx2In0++SdeD2RxZ0lkR
         j4D9DNqoSDXHjdFxhXd0tUX7Z4JbxSLgiSIxedZ37QjzbAnm3NVAuugSq9LY8YWs6Pqq
         7P5Q==
X-Gm-Message-State: AOJu0YzdQM7hoyA2te0rq7JdAGq67nFN7EzRF12eC+G8QXU9ffwRTTwP
	FYhCiGWFyPzrSYjRqgZHVgxJ1w==
X-Google-Smtp-Source: AGHT+IHw51hfjAXxsFI4d9xGFCdjuTT97t4maaOMTZu5ZgOaETi6LvIAZrM8Uk4ozy0/XXHoM4XAAw==
X-Received: by 2002:a5d:4648:0:b0:32d:80e:6893 with SMTP id j8-20020a5d4648000000b0032d080e6893mr462938wrs.36.1699661845713;
        Fri, 10 Nov 2023 16:17:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:de84:b269:f218:5c59? ([2001:8b0:aba:5f3c:de84:b269:f218:5c59])
        by smtp.gmail.com with ESMTPSA id e16-20020adfa450000000b0032d8034724esm371470wra.94.2023.11.10.16.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 16:17:25 -0800 (PST)
Message-ID: <c3ba342b7fa2f1a5bb58e5093cda0354cf809e73.camel@linuxfoundation.org>
Subject: Re: Patchtest results for [OE-core][kirkstone 5/7] cve-check:
 slightly more verbose warning when adding the same package twice
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Trevor Gamblin
	 <tgamblin@baylibre.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Nov 2023 00:17:24 +0000
In-Reply-To: <DB5PR02MB102137E183FED66ECFFFB402BEFAEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
	4b449d5dcbaebb0690a55cf45e3a735c2d8df101.1699483825.git.steve@sakoman.com <0101018bb132b353-748b9567-dd8c-4bb7-a06b-dcb1a6da9975-000000@us-west-2.amazonses.com>
	 <DB5PR02MB102137E183FED66ECFFFB402BEFAEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 00:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190411

On Fri, 2023-11-10 at 22:17 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Patchtest
> > Sent: den 9 november 2023 00:10
> > To: Steve Sakoman <steve@sakoman.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Patchtest results for [OE-core][kirkstone 5/7] cve-check:
> > slightly more verbose warning when adding the same package twice
> >=20
> > Thank you for your submission. Patchtest identified one
> > or more issues with the patch. Please see the log below for
> > more information:
> >=20
> > ---
> > Testing patch /home/patchtest/share/mboxes/kirkstone-5-7-cve-check-
> > slightly-more-verbose-warning-when-adding-the-same-package-
> > twice.patch
> >=20
> > FAIL: test shortlog length: Edit shortlog so that it is 90
> > characters or less (currently 91 characters)
> > (test_mbox.TestMbox.test_shortlog_length)
>=20
> I find it extremely confusing that this test refers to "shortlog".
> I had to go check the code to see what it was actually testing.
> It seems it is actually the "commit subject" that is being tested.
>=20
> Can we please change this and other tests that refer to "shortlog"=20
> to either use "commit subject" (in messages) or "subject" (in=20
> names)?
>=20
> Also, it seems the test incorrectly includes the "[kirkstone 5/7]"=20
> part in the tested length.

The code is here:

https://git.yoctoproject.org/poky/tree/meta/lib/patchtest/tests/test_mbox.p=
y#n83

so patches very welcome. Part of the work was to make these tests more
accessible so we can all work on and improve them.

shortlog is technically correct since this does become the shortlog in
the git commit so I'd prefer to keep that but we can mention message
subject as well. We should also definitely strip off the [] sections
before calculating the length.

Cheers,

Richard





