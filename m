Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 378 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 Aug 2016 14:15:04 UTC
Received: from mail1.bemta5.messagelabs.com (mail1.bemta5.messagelabs.com
	[195.245.231.153])
	by mail.openembedded.org (Postfix) with ESMTP id 6F16E60620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 14:15:04 +0000 (UTC)
Received: from [85.158.136.3] by server-17.bemta-5.messagelabs.com id
	0C/44-24990-EE4E6C75; Wed, 31 Aug 2016 14:08:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRWlGSWpSXmKPExsVyU6aHU/ftk2P
	hBvsPWFuc2dDMbnHn5zt2i3k77B2YPRbvecnkcW7jCkaPvZ9/swQwR7Fm5iXlVySwZtx7t5O9
	4DVTxZs7z1gbGDcwdTFycQgJbGGUeH78NZSzl1FixswFjF2MnBxsAmYSu16tYwexRQQKJb4sP
	skEYjMLRElMmv2KpYuRg0NYwEpi0SIziBJrif3/90CVu0mc37iUFaSERUBVYuYjPZAwr4CrxK
	T3W5khVv1klDj97RALSIJTwE5i3paXrCA2o4CsxJfG1cwQq8Qlbj2ZD7ZWQkBAYsme88wQtqj
	Ey8f/WCFsA4mtS/exQNgKEj96T0HVWEv8e3AX6mQdiQW7P7FB2NoSyxa+ZoY4SFDi5MwnLBMY
	xWYhWTcLScssJC2zkLQsYGRZxahenFpUllqka6SXVJSZnlGSm5iZo2toYKqXm1pcnJiempOYV
	KyXnJ+7iREYawxAsIPx+x+nQ4ySHExKorxss4+FC/El5adUZiQWZ8QXleakFh9ilOHgUJLgZQ
	fGrpBgUWp6akVaZg4w6mHSEhw8SiK8ux8DpXmLCxJzizPTIVKnGHU5Fvy4vZZJiCUvPy9VSpz
	3PkiRAEhRRmke3AhYArrEKCslzMsIdJQQT0FqUW5mCar8K0ZxDkYlYd5IkCk8mXklcJteAR3B
	BHREwZ3DIEeUJCKkpBoYbQ6vXFsWJFLD8LQ3LqDu+18D9qAXszu/HlrWc3WVcIOv0YWGUxs+t
	n0oTNN6lPGqkunfEo4J+ZuPvmOaw1OyIOBfi7luewKH0/+3pyzFDrC9/vzsg05v0ZxXMabfhT
	SCNmWEMteIzFfNffraetLc9RNYQ429Gf+ri9s94vUK3PM9WYzlb16hEktxRqKhFnNRcSIAMpc
	WnzsDAAA=
X-Env-Sender: andrew.goodbody@cambrionix.com
X-Msg-Ref: server-8.tower-123.messagelabs.com!1472652525!43371363!1
X-Originating-IP: [217.28.140.9]
X-StarScan-Received: 
X-StarScan-Version: 8.84; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2573 invoked from network); 31 Aug 2016 14:08:45 -0000
Received: from smtp.hs20.net (HELO outlook.hs20.net) (217.28.140.9)
	by server-8.tower-123.messagelabs.com with AES256-SHA256 encrypted SMTP;
	31 Aug 2016 14:08:45 -0000
Received: from THHSTE15D2BE2.hs20.net (192.168.251.32) by
	THHSTE15D2BE2.hs20.net (192.168.251.32) with Microsoft SMTP Server
	(TLS) id 15.0.1178.4; Wed, 31 Aug 2016 15:08:45 +0100
Received: from THHSTE15D2BE2.hs20.net ([fe80::d195:d16f:3c24:f255]) by
	THHSTE15D2BE2.hs20.net ([fe80::d195:d16f:3c24:f255%21]) with mapi id
	15.00.1178.000; Wed, 31 Aug 2016 15:08:45 +0100
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>,
	"Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] Build of u-boot with gold is broken
Thread-Index: AdH5VjLhAuTAF19QS3yoE/njm4xwfAEHdroAAIRDB9cA3NaMgAAmJzzQ
Date: Wed, 31 Aug 2016 14:08:44 +0000
Message-ID: <ff9a2a29c7074480ae64c66cff99c5d4@THHSTE15D2BE2.hs20.net>
References: <cf64ae59ea584fb18975ca5f33464981@SEHSTE15D2BE2.hs20.net>
	<CAJTo0LbYUFLWAhiM+WF3dYzrcLksTLDCQUDqDVr4w0m9050jdA@mail.gmail.com>
	<e0328689f1a4439a97564d4e2620da53@THHSTE15D2BE2.hs20.net>
	<b79f5b71-f8eb-d466-fe5a-ca2d460b6169@xilinx.com>
In-Reply-To: <b79f5b71-f8eb-d466-fe5a-ca2d460b6169@xilinx.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [46.17.166.30]
x-exclaimer-md-config: 266e7a57-cddd-49fd-bdea-19bca6d40303
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build of u-boot with gold is broken
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
X-List-Received-Date: Wed, 31 Aug 2016 14:15:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> From: Manjukumar Harthikote Matha [mailto:manjukumar.harthikote-
> matha@xilinx.com]
>=20
> Can we do ${S}/config.mk ? Meaning
> sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk I
> dont have a setup for gold linker, If you can send the instructions I wil=
l give it
> a try
>=20
> Thanks
> Manju

That works. I have sent a patch.

Andrew

