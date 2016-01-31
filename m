Return-Path: <carol.zhu@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0053.outbound.protection.outlook.com [157.55.234.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3F69660667
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 14:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rcasi3WFzhCVshm3Gr6gAqVYQdsHyf7emQAiwxB6IRU=;
	b=r2aJe3a9/S1B4xv/MhB5u+sJlFBmoJG+sbwPoOU3J3tbBPYczgCksr2Q9d9Jh9SZO0UQWTnJW59gbHsHQsZk+0djHoXNB3uVkhG/kERvzRt6biX1bWkjU6ZEXC8fcRXZBdRjUOVNh6QHIVVZj9ucVz999WEYRvDzCcKGajQVGVc=
Received: from AM4PR04MB1635.eurprd04.prod.outlook.com (10.164.78.157) by
	AM4PR04MB1636.eurprd04.prod.outlook.com (10.164.78.158) with Microsoft
	SMTP Server (TLS) id 15.1.396.15; Sun, 31 Jan 2016 14:13:46 +0000
Received: from AM4PR04MB1635.eurprd04.prod.outlook.com ([10.164.78.157]) by
	AM4PR04MB1635.eurprd04.prod.outlook.com ([10.164.78.157]) with mapi id
	15.01.0396.017; Sun, 31 Jan 2016 14:13:46 +0000
From: Yuqing Zhu <carol.zhu@nxp.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [poky][PATCH 0/2] Add patches for gstreamer 1.6
Thread-Index: AQHRWasNfsaTJDU+oEeyz0uza0uiaJ8Q4rwAgATMtNA=
Date: Sun, 31 Jan 2016 14:13:46 +0000
Message-ID: <AM4PR04MB16353EEAAE89D408AFE92EBDE9DD0@AM4PR04MB1635.eurprd04.prod.outlook.com>
References: <1453971768-27844-1-git-send-email-b54851@freescale.com>
	<56AA0F8A.5080900@linux.intel.com>
In-Reply-To: <56AA0F8A.5080900@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
	header.d=none; linux.intel.com;
	dmarc=none action=none header.from=nxp.com; 
x-originating-ip: [180.171.60.16]
x-microsoft-exchange-diagnostics: 1; AM4PR04MB1636;
	5:gy20WDIje2De7TVHrulmFKKNtQ+C3OXkvtGZgW8fiVDr9FGwmuIwFLVf2CJI8gzv2PdCgJ7UXzBLx2kkqZdXjKOFGomREcDTmX4hE3wdQZfd0YM/x1u9x1n6cXmfp7qgf5nSJanBC1i9CuJ/O+DBvA==;
	24:FJsDhmbQZe7FotL5c5TN7As3vUu3nb05iCdVbbk4wymTKxrYocy/R21JMXczAr/PxWr+T1h78WA1/TnjlNp9zQtv7ggYl7im9TTzW0udTPY=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM4PR04MB1636;
x-ms-office365-filtering-correlation-id: adfed0c2-5f1c-4521-4d31-08d32a48bbfa
x-microsoft-antispam-prvs: <AM4PR04MB1636FF7D05F67538EF236F7EE9DD0@AM4PR04MB1636.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(101931422205132);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:AM4PR04MB1636; BCL:0; PCL:0; RULEID:; SRVR:AM4PR04MB1636; 
x-forefront-prvs: 08381C729B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(24454002)(377454003)(479174004)(3280700002)(189998001)(86362001)(3470700001)(5001960100002)(92566002)(5002640100001)(5001770100001)(3660700001)(5003600100002)(5008740100001)(77096005)(106116001)(2900100001)(19580395003)(2950100001)(19580405001)(2501003)(76576001)(33656002)(40100003)(11100500001)(1220700001)(122556002)(66066001)(1096002)(54356999)(76176999)(50986999)(586003)(4326007)(2906002)(87936001)(3846002)(102836003)(6116002)(74316001)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR04MB1636;
	H:AM4PR04MB1635.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2016 14:13:46.4595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR04MB1636
Subject: Re: [poky][PATCH 0/2] Add patches for gstreamer 1.6
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
X-List-Received-Date: Sun, 31 Jan 2016 14:28:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

     Sorry for causing this misunderstanding.
     Actually I have replied the maintainer's email. And for some rejected =
patches, I said I would keep them in our internal layer.=20
     For these two following patches, Richard said the Backports might be o=
k, so I was waiting for these two patches' feedback.
     But I might regenerate a second version patches only with these two pa=
tches at that time. That was my inconsideration.
    =20
      Really sorry for this misunderstanding! Please help to review them ag=
ain, thanks!



B.R.

Yuqing Zhu

-----Original Message-----
From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]=20
Sent: Thursday, January 28, 2016 8:55 PM
To: openembedded-core@lists.openembedded.org
Cc: b54851@freescale.com
Subject: Re: [OE-core] [poky][PATCH 0/2] Add patches for gstreamer 1.6

On 01/28/2016 11:02 AM, Yuqing Zhu wrote:
> As gstreamer has been upgraded from 1.6.2 to 1.6.3, and my former=20
> patches haven't been accepted yet, need to recreate the patches based on =
new recipe.

The patches have not been accepted because you didn't answer the questions =
that oe-core maintainers had asked you.


Alex


