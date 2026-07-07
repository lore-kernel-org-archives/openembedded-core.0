Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD643C43602
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 10:29:04 +0000 (UTC)
Received: from mailer56.gate186.sl.smtp.com (mailer56.gate186.sl.smtp.com [192.40.186.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.168808.1783412543946939126
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 01:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=eC71QiiW;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=tVukDmSm;
 spf=pass (domain: centricular.com, ip: 192.40.186.56, mailfrom: tarun@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.37] (unknown [10.138.12.176])
	by mtl-mta02-out1 (Halon) with ESMTP
	id b14b3f47-69f0-4ddd-b401-9b5438c3f696;
	Tue, 07 Jul 2026 08:22:22 +0000 (UTC)
Received: Received from 10.138.12.169 by Caffeine
 (s0-aws-app2-swarm-manager-4) with SMTP id
 d495df30-357b-46ba-afa0-40de9533439c  for
 openembedded-core@lists.openembedded.org;
  Tue, 07 Jul 2026 08:21:49 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app2-mta-in-2 (Halon) with ESMTPSA
	id d495df30-357b-46ba-afa0-40de9533439c;
	Tue, 07 Jul 2026 08:21:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9DAF29D27F;
	Tue,  7 Jul 2026 10:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1783412507;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=VIB6Qy8lMVkjCPerxKIiC36OZ/U3RMQkkxI9i3V6avg=;
	b=eC71QiiWpeLIgHkEHJq2EfucO4XbOPJhQJWZdUYXdyKyZy/PLFGWxr1OZFsztm8btCZ51Y
	NVKZOUQmqmtnun9T5LyFiM3FxFneK+7nrnuWM8pSIdJI19KZZcAh7D1ZjZoib92SzM67lw
	TgdY506IS96TDBwndl2MH7gbs120cXE/R0jlo+mVy5qocYkH6lnXP4h367J7LjM8PZ89CN
	XXguXEpzYvGwunceQe6KTVBPLtRvYBREUbs3qtd2z+qgEVYnYW77gaIzBuTGhNijaoZuEe
	O5NGl1No6XKtWRa/V9NC71XOPtvOTA6lcOXbFR8yc5AWiuXWjQVLePxeUA3iGA==
Message-ID: <520ec6425dd16909533b757ef1182078effbfab3.camel@centricular.com>
Subject: Re: [OE-core] [PATCH v3] gstreamer1.0-plugins-rs: add new package
From: Taruntej Kanakamalla <tarun@centricular.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>, "sebastian@centricular.com"	
 <sebastian@centricular.com>, "nirbheek@centricular.com"	
 <nirbheek@centricular.com>, "alex.kanavin@gmail.com"
 <alex.kanavin@gmail.com>
Date: Tue, 07 Jul 2026 13:51:41 +0530
In-Reply-To: 
 <DB5PR02MB10213A6316CA0308623698FEBEF0A2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260513071155.1215141-1-tarun@centricular.com>
	 <20260524012357.3178877-1-tarun@centricular.com>
	 <CANNYZj-yJ_CMvCq6bXu8RHiDDCNUbQcOTrJANZoKfZ5SMhoNkA@mail.gmail.com>
	 <DB5PR02MB10213A6316CA0308623698FEBEF0A2@DB5PR02MB10213.eurprd02.prod.outlook.com>
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: d495df30-357b-46ba-afa0-40de9533439c
X-SMTPCOM-Message-ID: 0909b62a-7f6b-42bf-9331-e3effcc33509
X-SMTPCOM-Payload: 
 qDTX09X-ZQiBU033oPTqxAKdnycCMi9bdjvDaCSnw4EiOXz8__T7tM3UWKXl0ZGbmQ-7ngE5lCJVzgjMRQoC2quiR-EonOkrz8f7-1Uj8IZq6-Q6ChTT5bIUpPR5UG4kLH3hsxcDo3gmj_1FVIKlIzc-NljPJ-oqjqDujGjv3Pp7F-_oAlNt9Jxhre6k_jigGnI9EjqgI--1wDZ6Iunthw==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=0909b62a-7f6b-42bf-9331-e3effcc33509_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=0909b62a-7f6b-42bf-9331-e3effcc33509&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1783412530;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : mime-version :
 list-unsubscribe : list-unsubscribe-post : subject : from : to : cc :
 date; bh=VIB6Qy8lMVkjCPerxKIiC36OZ/U3RMQkkxI9i3V6avg=;
 b=tVukDmSmj7/YrndJYNaFewOngqwe8boRAPzUDKnJoGowdK935OupBphZLi8VGJjPuu1XT
 HXRuRvLC3LUiC5j4PlyUVeb886Pntc3d5SSNseVVic105A6wrCdQ+bxi8ZmT5MbAhjGJwhG
 JeZoOQpYwTEu8zJvMqZ5QIPwIhDlnkOHNzdFXtX/tAsKEf4mijANnkBZ4Yrjz1Ics1emrbq
 3j3Z+gg2OKJbNThr5tlJ3V9yB6B/GVdS8Ihz4VRsZv0GLg/ZYbVEj9/L1otAEqO8IJXTtp4
 BoeJN7eRGce9ccLRjKXmKGGo/vZ9k+2e2tSPhaSM8wZXvpw043wJp35P57NQ==
Content-Type: multipart/alternative; boundary="=-x/cvVuo6JcaXANJe4B8+"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 10:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240377

--=-x/cvVuo6JcaXANJe4B8+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Mon, 2026-05-25 at 17:06 +0000, Peter Kjellerstedt wrote:
> Rather than explicitly listing the PACKAGES above, and their files below,=
 =20
> you should make use of the do_split_packages() function, which will do =
=20
> this automatically. Unless of course you follow Alex' suggestion and =20
> split this into one recipe per plugin.

Thanks for the input, we indeed want to use the `do_split_packages()` funct=
ion. Applied that change in the v4 patch.

Cheers,
Tarun

--=-x/cvVuo6JcaXANJe4B8+
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Peter,</p>
<p>On Mon, 2026-05-25 at 17:06 +0000, Peter Kjellerstedt wrote:</p>
<blockquote type=3D"cite">
<p>Rather than explicitly listing the PACKAGES above, and their files below=
,<br />
you should make use of the do_split_packages() function, which will do<br /=
>
this automatically. Unless of course you follow Alex' suggestion and<br />
split this into one recipe per plugin.</p>
</blockquote>
<p>Thanks for the input, we indeed want to use the <code>do_split_packages(=
)</code> function. Applied that change in the v4 patch.</p>
<p>Cheers,
Tarun</p>

--=-x/cvVuo6JcaXANJe4B8+--

