Return-Path: <Peter.Marko@siemens.com>
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50086.outbound.protection.outlook.com [40.107.5.86])
	by mail.openembedded.org (Postfix) with ESMTP id 224E661C42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 15:21:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=fQTY+HF0TZ6tEZ/RskhNbueRlGDLtFzO6asUZH3G28HZYZKr01Et5AbfXNJ86oiZ0Em/yVConyrq/EpQXnYBvh9Iuvwiab9YlqrR8oOiomU2+82rOMW/BdC4HMXCI6fH62mY9/ZIp4+geac6f4Ry3Jh2GpGmdfQtWERzkw8/4B59VSm2Y5j+NZxgR4eIB5CW9TDunOl4QrhuKhV1w5ddi3he2f3zx1/FwRMRPqpuWAVpUvdKO1QhWdEnJ5zxppW1/jvqY/fUVmuqESqfwf27vovftalAi/lN5iC57qLw3Jy9ieNYAXyjsMNU9rwSoEwddmlqpMEeFDg6AkbfW36zPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=K9kRJrxMkIKKv6idn/oECV+FJsbNZQa0Ny01JVMddcE=;
	b=Xt7u1kVcyW1bNAXgOTOFviDYpVqsKcPhQXKDnKjmSWjE9KnV5exhO5itrPNIGrgXnZTypnDy/PugpU0vwT1rVXQ8XKKGDnB8zmooCyLEYNbXa3mWJ3ZNsCdsPnml+tg41zprIJLIvZzrkDHpNzm7hwPkWmL0U6JQTIWJ78ashGhxQIsehMEuhV+MnyNH9RNgFU6DBzpTRhFqTuwJFaDw2CzvFQXM3nh7STZtbmq8ZLKTL4Nrt8aTYuGty/MbqujTa8BVIImA0ZKO83pLRV/FFWeyWhDMkcoVTvlb+yAgz5p5QmxjCJp+RK4trRj0Y6nGD0UgG9IMX9ozb+3cipaTQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=siemens.com;
	dmarc=pass action=none header.from=siemens.com; 
	dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=K9kRJrxMkIKKv6idn/oECV+FJsbNZQa0Ny01JVMddcE=;
	b=mqdQvx0uu9f97uKNsv1iP3+ix/xd8IgvyxBxWaxqPPx0KxTQlBtHvhkxj4HX/tojVz7kXWs5OUFWNX6l3JrQFp+qmwcVBeggzYubyAWF8G1gqrTRLYeZ5XQtg1jBX7bAfZEytt450q8hmi3qJFm5C9/PVwbZIJmZ/qdcFQORiV8=
Received: from VI1PR10MB3664.EURPRD10.PROD.OUTLOOK.COM (10.186.163.142) by
	VI1PR10MB2861.EURPRD10.PROD.OUTLOOK.COM (20.178.204.143) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2793.17; Thu, 12 Mar 2020 15:21:54 +0000
Received: from VI1PR10MB3664.EURPRD10.PROD.OUTLOOK.COM
	([fe80::a97b:42c6:cea5:cfdf]) by
	VI1PR10MB3664.EURPRD10.PROD.OUTLOOK.COM
	([fe80::a97b:42c6:cea5:cfdf%6]) with mapi id 15.20.2814.007;
	Thu, 12 Mar 2020 15:21:54 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] runqemu nographic and hvc0
Thread-Index: AdX4gaD98QP0OLdhRK++EMpeYWsFQA==
Date: Thu, 12 Mar 2020 15:21:54 +0000
Message-ID: <VI1PR10MB366487DDF67A917978FD21D7FDFD0@VI1PR10MB3664.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Peter.Marko@siemens.com; 
x-originating-ip: [165.225.73.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5f0d2f5b-e4a2-4a90-5906-08d7c69918cd
x-ms-traffictypediagnostic: VI1PR10MB2861:
x-microsoft-antispam-prvs: <VI1PR10MB28611B51B0DE52639930DC09FDFD0@VI1PR10MB2861.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(199004)(186003)(26005)(4744005)(5660300002)(52536014)(316002)(6916009)(33656002)(8936002)(81166006)(81156014)(7696005)(9686003)(55016002)(64756008)(2906002)(76116006)(66946007)(66556008)(66446008)(66476007)(86362001)(8676002)(71200400001)(55236004)(6506007)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR10MB2861;
	H:VI1PR10MB3664.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: siemens.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wKk0Qg9kWHvqP8wZgeyWKEI/1j28SF0nE5FTlDPMzzWdTYIy2RBqrxwh1Y3vnIh68SJ6C1ASGnKQPFIUO9bG6pu5Lc8RxVjcOtoke2sPMfDSyoqaM28+Xbm86XBT5b2m5y8Ay/NvTjR95g8cuFcNicCcnth+Wl4Osq7Ur7golqkip8QMz17tSZ2vUD5ICajhG17Gajr/kApuL+oqQwENV6GHBkqEXfA4zoej6IDtpYMdRqB7V7tPnd7fy+yrUt7yLGNL34zrnkd5g16EZEN5PV6bw3u3e4tO31vytaacess6dRk5vqweSTAY8cdKiYFJwVWMM802wbLiCaIZ75lUaR67c8RRMZZUgCp5+J+OJr/P5k9UeArNafXS6kNZQBbtbW2VosI/aUex+wqsps8fI1oHDfktR6xj11yj0xTNeIdAqHTItNpexEuomrce8885
x-ms-exchange-antispam-messagedata: zyAHryy/mMe/mfRQLBQpYmXm3FHaKW+pki4Onx0NqUehmcqyy9r34FU5h0YYAM8qe8wtOklDFk6zJkxJpOJ7LScZ0nLlawVyKb0GZJnIRcB7CwBnvrKapoSAJnO7rrT6DOvO/ZMmyRVNJBP2xjA49g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0d2f5b-e4a2-4a90-5906-08d7c69918cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 15:21:54.3327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5qBjlX10Rh+sVT3368ZZM6J6kvhuKnhy/Fnl+cfZKheOo2JCFOZKD/6c8Ix5Y9KpxlrdT4R9ezF1hoXgJEMGIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2861
Subject: runqemu nographic and hvc0
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
X-List-Received-Date: Thu, 12 Mar 2020 15:21:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to boot my own qemu image on zeus branch with "runqemu nographic=
 /path/to/extracted/rootfs" but I have problem that console is flooded with
process '/sbin/getty 115200 hvc0' (pid 383) exited. Scheduling for restart.
starting pid 385, tty '': '/sbin/getty 115200 hvc0'
I'm using yocto qemuarm kernel and qemuarm machine (but it's the same with =
qemuarm64).

Basically qemuarm machine has
SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
which is transferred to /etc/inittab, however hvc0 device does not exist af=
ter booting in nographic mode.

What kind of configuration am I missing in my image?
I think that might be the graphic console which does not exist in nographic=
 mode?
Is there a way to get rid of this problem without breaking graphic mode con=
sole?

Thanks,
  Peter

