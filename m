Return-Path: <prvs=333343292=Mikko.Rapeli@bmw.de>
Received: from esa1.bmw.c3s2.iphmx.com (esa1.bmw.c3s2.iphmx.com
	[68.232.133.201])
	by mail.openembedded.org (Postfix) with ESMTP id 3700F61C32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 13:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1584019522; x=1615555522;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	content-id:content-transfer-encoding:mime-version;
	bh=B3SC/03xptabRldwwtI2Hdqd5JmFIW8sooMSSbrrRpM=;
	b=jbFDYnwOm2IxeJdEHM9leGndRtByOzgqv/ncj6LyBS2HO0eee19P5JZ2
	IA8QLyNk2xVF1nmPswo71Nh+Fx0o0jwD/v8oUyI8qzffvrsZsXEQ9e/gC
	xYR3QmLEOMf/f+nXXWX4GDeDk1vsFanab4EccBq3tO1RXbnbuZc8i6lrg c=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa1.bmw.c3s2.iphmx.com with ESMTP/TLS; 12 Mar 2020 14:25:20 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw4.muc with ESMTP/TLS;
	12 Mar 2020 14:25:19 +0100
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb5.muc with ESMTP/TLS; 12 Mar 2020 14:25:18 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Thu, 12 Mar 2020 14:25:18 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Thu, 12 Mar 2020 14:25:18 +0100
From: <Mikko.Rapeli@bmw.de>
To: <bunk@stusta.de>, <anuj.mittal@intel.com>
Thread-Topic: [OE-core] [PATCH] [zeus] aspell: CVE-2019-20433
Thread-Index: AQHV+HGs3kZ9JBBQ50+WAdtzEWjdnA==
Date: Thu, 12 Mar 2020 13:25:18 +0000
Message-ID: <20200312132517.GV104502@korppu>
In-Reply-To: <C0207330DF60C5409302EC78C3FE68F30349D9B0@PGSMSX101.gar.corp.intel.com>
	<20200312124908.GA21921@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [zeus] aspell: CVE-2019-20433
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Mar 2020 13:25:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <60B60CD36918ED48968E3934779410AF@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Yes, you are correct. White listing isn't right either.

-Mikko=

