Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F86C433F5
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 14:38:14 +0000 (UTC)
Received: from esa4.hc324-48.eu.iphmx.com (esa4.hc324-48.eu.iphmx.com
 [207.54.71.48])
 by mx.groups.io with SMTP id smtpd.web10.24768.1637937492305341907
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 06:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=Xb7d3N9i;
 spf=pass (domain: bmw.de, ip: 207.54.71.48,
 mailfrom: prvs=957cc9452=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1637937492; x=1669473492;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6bJJPWlvAE5uRzDtH6PrKx4Wiv2mVfKj4MuwkdQ/fNY=;
  b=Xb7d3N9i7FNOaLGuLP/odF9Sizv+UGXKMpJkFyHd7XiN/ODvduf0Dj+i
   CzZvZdGfiKZPKo4Qq1ASvKv6wqF7hQDWTYnfeaBMu3kgXJKd9lbMnIm6v
   Cvbedi2SUHWxe6bFG9lnhDrC68e7chrsPgvRvXxyyCefvPbo6aXM+DDqp
   M=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa4.hc324-48.eu.iphmx.com with ESMTP/TLS; 26 Nov 2021 15:38:10 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw1.muc with ESMTP/TLS;
 26 Nov 2021 15:38:10 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp)
 ([160.46.167.67])
 by esabb4.muc with ESMTP/TLS; 26 Nov 2021 15:38:09 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Fri, 26 Nov 2021 15:38:09 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.026; Fri,
 26 Nov 2021 15:38:09 +0100
From: <Mikko.Rapeli@bmw.de>
To: <Mikko.Rapeli@bmw.de>
CC: <openembedded-core@lists.openembedded.org>, <wangmy@cn.fujitsu.com>,
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] openssh: Improve LICENSE to show BSD
 license variants.
Thread-Topic: [OE-core] [PATCH 1/2] openssh: Improve LICENSE to show BSD
 license variants.
Thread-Index: AQHX4tKdrPFT9HzH4kSFr561uDKZw6wV0AwA
Date: Fri, 26 Nov 2021 14:38:09 +0000
Message-ID: <YaDxUOskBc7oxU+I@korppu>
References: <16BB1F347B211662.14741@lists.openembedded.org>
In-Reply-To: <16BB1F347B211662.14741@lists.openembedded.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <38130EFD7041BF4AAA8BE9CEDED5E507@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 14:38:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158831

Missing dunfell subject prefix. Will send v2.

-Mikko=

