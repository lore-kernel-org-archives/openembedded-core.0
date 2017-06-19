Return-Path: <carol.zhu@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0045.outbound.protection.outlook.com [104.47.2.45])
	by mail.openembedded.org (Postfix) with ESMTP id 54430780B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pVe5oABVi+C9j7tD6TH9cJYfFWU9qVKO7s3JZLyk/BA=;
	b=jDm5MjQHZaDhEvsqrnkG80VFVWFRU9Or2LqiL5f1GxGPQJqGMxzMSzv/V9XGtBlIxy/t8j2PsIJrAwYZlN8M3sOT6BI2je6ES5tHu6ozAzIl76itXUueLcmylhjAVAqmBFn8cJCpUIt2WByWH27Zz3L1vV8vGQyV0+eUFPA2ao0=
Received: from HE1PR0401MB2682.eurprd04.prod.outlook.com (10.168.148.151) by
	HE1PR0401MB2684.eurprd04.prod.outlook.com (10.168.149.8) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1178.14; Mon, 19 Jun 2017 10:28:20 +0000
Received: from HE1PR0401MB2682.eurprd04.prod.outlook.com
	([fe80::c1c4:e5ca:6a37:6f2e]) by
	HE1PR0401MB2682.eurprd04.prod.outlook.com
	([fe80::c1c4:e5ca:6a37:6f2e%15]) with mapi id 15.01.1178.018;
	Mon, 19 Jun 2017 10:28:20 +0000
From: Carol Zhu <carol.zhu@nxp.com>
To: "alexander.kanavin@linux.intel.com" <alexander.kanavin@linux.intel.com>,
	"jussi.kukkonen@intel.com" <jussi.kukkonen@intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [pyro][PATCH 0/6] Add some gstreamer1.0-plugins-bad patches for
	pyro
Thread-Index: AQHS0844U/+c/1wJLEicd+Td+KLKpKIsJO8Q
Date: Mon, 19 Jun 2017 10:28:20 +0000
Message-ID: <HE1PR0401MB2682999351A6A7BA524C04BEE9C40@HE1PR0401MB2682.eurprd04.prod.outlook.com>
References: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
In-Reply-To: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
	header.d=none; linux.intel.com;
	dmarc=none action=none header.from=nxp.com; 
x-originating-ip: [199.59.225.131]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0401MB2684;
	7:1RwSNo3a2uM6PJ37riojwswEOkY7BtDQyUgv8sDCo+iC8KNSiJpOE/pZq7mac8HQLQ/F/yKllP6S9a5zxvEfxWZiY+KxkKfaVwXz5GwPt20lQhB8ZS7g6/K6OAQQP+827qtk9J5p8F2tpYHMUPCkb5DRgLnuEpoRwq6gKsVYg+Eoz2HH4yC4aE+N8n90KKE7KxorczpDvMdRLXzzwtWRx5uxnI8QCSxF7OHwj4VQWkZAhd8IahXRQAX5aCjRZhNMKNKVKjH7CPGewJrUpFL7+LQeAKM+Xa3dVZ7mLp0MddlBzLuzWXCkyUMnjkjrKr5EtipMAA5o/zSi7YgbpZmgx+XEA73i1Vjpek7+6d5GZK/UoccM4S4Rgbl595k5jdwWiIm7suI1tUE0V1hV+2ZoD+i8u+hNkop+//+XJ8xboIQ7gNUToThbtcv/Uee/WSKsze17XD9F7VwhjCx1GihHuPZ+pTtWCKOqS9/YxIu3DzOXFa9vg9PAkGUbsAgmcSbvx21sN1Ksh9kzFc/o4pNOqc4BYvS/dQIpYOfrysGgp+VZ9wusqzbMUZG7P7wpY6a5up4P0ZUfbGdxh4ZycZcOtK5z7lPpWzi/r8W6ijMrMm1LQWjG0DgURHUzgqcogxTP7/q6f+Yc6PWBACa7dHjK2s58jo0I2Mqw4wAl2Bc6ma+BZt80jHqNQehp7p2ypWcf0VsEJVQ4747hRRtrplsNCobN5YStyIZoCWGtTRfuvCsdk3DdFkg1g5zUCv00VKXpsR/iqqy0WkgbhYGvm+qZlgF5T2mhR78efLo4DMD0V1s=
x-ms-office365-filtering-correlation-id: 132b1629-430f-4eba-468c-08d4b6fde83c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500041)(300135000095)(300000501041)(300135300095)(22001)(300000502041)(300135100095)(2017030254075)(300000503041)(300135400095)(48565401081)(201703131423075)(201703031133081)(300000504041)(300135200095)(300000505041)(300135600095)(300000506037)(300135500095);
	SRVR:HE1PR0401MB2684; 
x-ms-traffictypediagnostic: HE1PR0401MB2684:
x-microsoft-antispam-prvs: <HE1PR0401MB2684E508331DCB1E417630BAE9C40@HE1PR0401MB2684.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249)(228905959029699); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(100000703101)(100105400095)(6055026)(6041248)(20161123562025)(20161123558100)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:HE1PR0401MB2684; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1PR0401MB2684; 
x-forefront-prvs: 0343AC1D30
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39450400003)(39850400002)(39400400002)(39840400002)(39410400002)(39860400002)(57704003)(377454003)(53754006)(13464003)(189998001)(7696004)(6436002)(66066001)(3846002)(6116002)(6506006)(102836003)(9686003)(33656002)(2501003)(8676002)(25786009)(230783001)(99286003)(53936002)(8936002)(2900100001)(74316002)(229853002)(55016002)(478600001)(4326008)(38730400002)(7736002)(305945005)(50986999)(54356999)(76176999)(86362001)(81166006)(2950100002)(14454004)(2906002)(6246003)(53546009)(5660300001)(3280700002)(3660700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0401MB2684;
	H:HE1PR0401MB2682.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2017 10:28:20.3346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2684
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH 0/6] Add some gstreamer1.0-plugins-bad patches for pyro
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
X-List-Received-Date: Mon, 19 Jun 2017 15:04:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,
     May I ask what's the patch review state?
     Do I need to do some other updates?
     Thanks~


B.R.
Carol

-----Original Message-----
From: Yuqing Zhu [mailto:carol.zhu@nxp.com]=20
Sent: Tuesday, May 23, 2017 10:08 PM
To: openembedded-core@lists.openembedded.org
Cc: alexander.kanavin@linux.intel.com; jussi.kukkonen@intel.com; Carol Zhu =
<carol.zhu@nxp.com>
Subject: [pyro][PATCH 0/6] Add some gstreamer1.0-plugins-bad patches for py=
ro

-Add some enhancements for qmlglsrc
 Some common features for qmlglsrc are added to make app development much e=
asier.

-Add some enhancements for gstplayer
 Some gstplayer API enhancements are added to make it much easier for users=
 to use.
 Without these API enhancements, some features may not be realized  (like a=
ccurate seek, video sink configuration) when using gstplayer API.
 So it would be better if they can be picked.

-Fix a memory leak issue in glupload, which is common

Yuqing Zhu (6):
  gstreamer1.0-plugins-bad: Add two enhancements for qmlglsrc
  gstreamer1.0-plugins-bad: Add configuration for enabling accurate
    seeks
  gstreamer1.0-plugins-bad: Add get track number media info API
  gstreamer1.0-plugins-bad: Add overlayvideorenderer video sink
  gstreamer1.0-plugins-bad: Fix gst-player failed to load external
    subtitle uri
  gstreamer1.0-plugins-bad: Fix memory leak when use a GValue in
    glupload

 ...2-qmlglsrc-some-enhancements-for-qmlglsrc.patch | 170 +++++++++++++++++=
++++  ...configuration-for-enabling-accurate-seeks.patch | 148 ++++++++++++=
++++++  ...layer-Add-get-track-number-media-info-API.patch | 126 ++++++++++=
+++++  ...layer-Add-overlayvideorenderer-video-sink.patch | 138 +++++++++++=
++++++  ...fix-gst-player-failed-to-load-external-su.patch |  50 ++++++  ..=
.-glupload-fix-memory-leak-when-use-a-GVal.patch |  29 ++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   6 +
 7 files changed, 667 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0004-player-Add-get-track-number-media-info-API.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0005-player-Add-overlayvideorenderer-video-sink.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0006-gst-player-fix-gst-player-failed-to-load-external-su.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0007-glupload-fix-memory-leak-when-use-a-GVal.patch

--
1.9.1


