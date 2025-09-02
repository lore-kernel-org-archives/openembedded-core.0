Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A81CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 15:22:49 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.80246.1756826558981950445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 08:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=p+WRUn3q;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 582FMEog2557067;
	Tue, 2 Sep 2025 10:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756826535;
	bh=TgriMF9NGa+hLmUdvK+UPnBXbTb547WJNVI3XZ9EP4w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=p+WRUn3qFRQQYx3HKS9DxfkNWjJ6gboPgRiabOKYuQ9DT4UQO3sdEtmXGb4AAGUj/
	 a4N5p8WaqkuwZ9XwTZVVTalUv4DGyefyueLDH0YidSwCm32uJnQ0zoJ3YviN4Uhoa2
	 9RtZ/2FDWLKmuVnU172nL6w/SCg0qCvxlCqguwqE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 582FMEMC2363382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 10:22:14 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 10:22:14 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Tue, 2 Sep
 2025 10:22:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 10:22:14 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 582FMEZn091168;
	Tue, 2 Sep 2025 10:22:14 -0500
Message-ID: <b9fc2ac8-e6ef-47af-bb5c-66cbae8f1b54@ti.com>
Date: Tue, 2 Sep 2025 10:22:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [OE-core] [master][PATCH] libsdl2: Add tests
 package and ptest support
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Yoann Congal
	<yoann.congal@smile.fr>
CC: <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>
References: <20250827222051.367093-1-a-christidis@ti.com>
 <CAMSfU+498tFH0DSdi+NyFqAaDHQ-qxQgT149fjOBNxHr-2O8gQ@mail.gmail.com>
 <CANNYZj8nW8WKvQ6o4EsQe_F-6C3p5BGTww8i66Ku348+eFxD9Q@mail.gmail.com>
 <CAMSfU+5zuq=KwWnp0OrZTQ4s9RrSgPnh1K+GCLDSq8NFK9jE-g@mail.gmail.com>
 <CANNYZj9VBtTkEagr7r+WsX6mgeTc2N57tkQ+XO7u6XUTxusD=Q@mail.gmail.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <CANNYZj9VBtTkEagr7r+WsX6mgeTc2N57tkQ+XO7u6XUTxusD=Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 582FMEog2557067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 15:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222736

Dear all,

What meeting is being referenced ? What was the conclusion of such?

Kind Regards,

Antonios

On 8/28/25 1:08 PM, Alexander Kanavin wrote:
> On Thu, 28 Aug 2025 at 17:=E2=80=8A24, Yoann Congal <yoann.=E2=80=8Acon=
gal@=E2=80=8Asmile.=E2=80=8Afr>=20
> wrote: > That is the whole point of the ticket: realign what the=20
> existings run-ptest scripts do, what the dos says, what the code=20
> running tests expects (ptest-runner
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!tDdkczhAu0BQayqqd=
F8IsugIjX7zadsugLmM-EbBW8Oq0a4_NJqc3VSXvZy3_udB9hIMqaoUjEqvKMEG22xp083xtu=
Y8ML3NRgyFVVZtLOCIG2rqv1J7v14pKoM$>=20
>
> ZjQcmQRYFpfptBannerEnd
> On Thu, 28 Aug 2025 at 17:24, Yoann Congal <yoann.congal@smile.fr> wrot=
e:
>
> > That is the whole point of the ticket: realign what the existings run=
-ptest scripts do, what the dos says, what the code running tests expects=
 (ptest-runner & testimage)
> > Maybe we should talk about it in a tuesday call?
>
> We can talk, but I do not think it is realistic to have new
> requirements on run-ptest, especially around return codes. They are
> expected to print at least one PASS or FAIL, and it stops there.
>
> Alex

