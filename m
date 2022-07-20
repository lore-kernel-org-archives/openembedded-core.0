Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA87CCA482
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 09:23:35 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.51867.1658309009104642914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UWPOhM4e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id z12so25260841wrq.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=hnmp+FavXMWKDrRJik8vwzpJZDVqUKMTeRK3wMSOb6E=;
        b=UWPOhM4e5iEbOw1ZdEJUQfh79ZZ8G/4zfEeiR2YMKTffufCbX8zvEkevXVLHN/Le2o
         3quP2Fprs7nRHb41t+SDzytbWzj0e0s6wxIcnN+0UzAIXQ+IPQrJzIHUZYQVVlMu9Pb1
         7o0hqk4dhjoFVaHEpuoeHmAAtHtUWOC2kL17E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=hnmp+FavXMWKDrRJik8vwzpJZDVqUKMTeRK3wMSOb6E=;
        b=EMPrFXPH07jUEqAwqzN3UFv+b6AhekGfbnInGCcSVNAodrBN9SIbBnta+yEVbA2yb+
         Z+/G7peqpd2q7OA4WAs7+8XYPZtXBF1ewwV83A70wJ0l3xVbiZf4J4qGqUWPIqhDnH8L
         PtbFUzXobAzORkyEdQ/cgX9HGAAdqhRS/Q0tAv8CdxC2J3MsO2df6eGOFAcI8Butxj17
         n45Rxag+zvi7YGAYCbSI1cVAHXa0DAmg41ZylE4STF9tAD2A7OxwrBWxfIMdo4ojkWjL
         xWizhg68NieyyQ2rNxa9ofSEsRIAFwkW4dZZtF6HRgpbcK12UqSrFMZPoYohjhjbIMGk
         ps3w==
X-Gm-Message-State: AJIora8OhKhsFe2VA7KuBIzm9qXKweglFEEGZLg2MevTELk9fFjryr+R
	FI7sBcME6FEDKXpCVWWfCKym2Q==
X-Google-Smtp-Source: 
 AGRyM1ujeieKvwB00L7ltVrJiSoDfcivEMgbyqa9KGxOYrJrp7yATolsn74wbHya+25fSiSFPQ3+EQ==
X-Received: by 2002:a05:6000:178c:b0:21d:b6d0:11a8 with SMTP id
 e12-20020a056000178c00b0021db6d011a8mr29045559wrg.547.1658309007344;
        Wed, 20 Jul 2022 02:23:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:feec:14a3:c5ce:5d56?
 ([2001:8b0:aba:5f3c:feec:14a3:c5ce:5d56])
        by smtp.gmail.com with ESMTPSA id
 p30-20020a05600c1d9e00b003a2f6367049sm1768863wms.48.2022.07.20.02.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 02:23:26 -0700 (PDT)
Message-ID: 
 <ee397d3552782e6fd969a497e55396ff474fee92.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Let's drop x86-x32 (was Re:
 [OE-core] [PATCH 05/51] rpm: update 4.17.0 -> 4.17.1)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>, openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
	 <yocto@lists.yoctoproject.org>
Date: Wed, 20 Jul 2022 10:23:25 +0100
In-Reply-To: 
 <CANNYZj9KKfqK8fH6HB3mLP8Vhi=U-VCMOus1uAq9kUQ7+6D74A@mail.gmail.com>
References: <20220720084442.2940187-1-alex@linutronix.de>
	 <17037D268C38CE83.21682@lists.openembedded.org>
	 <CANNYZj9KKfqK8fH6HB3mLP8Vhi=U-VCMOus1uAq9kUQ7+6D74A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 09:23:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168348

On Wed, 2022-07-20 at 10:49 +0200, Alexander Kanavin wrote:
> Note: this update fails on x32 with
>=20
> > configure: error: unrecognized GNU build triplet linux-gnux32
>=20
> This time I want to put my foot down and suggest that we just drop the
> whole x32 variant from the autobuilder (I had already sent a patch for
> this previously). In all likelihood it was never used to ship anything
> to customers, and was only devised to look better in benchmarks
> against competition.

That amounts to dropping x32 support because as soon as we remove these
tests, it will bitrot.

There is still some value in the project being able to support
different architectures and different type sizes so I do still lean
towards keeping this alive at a minimal level.

Cheers,

Richard

