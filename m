Return-Path: <mvader@victronenergy.com>
X-Greylist: delayed 9528 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 23 May 2016 11:36:59 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0119.outbound.protection.outlook.com [157.55.234.119])
	by mail.openembedded.org (Postfix) with ESMTP id F1044601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 11:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MjObi4FzZj6XJB237HJAQxRAhy+mt8SU/ELnYHIyWxs=;
	b=fjv8rvey4CywLB+N210rwcV7v6/MfOiZc3l38PPWPz3P3uuVerCuTqVISXIApCNDuyo4/FtD2KMKhvqvjVIrPq1aRfU1kBXa7cynmpIy5ZjECxHdNT+FiKjzuGbLIOzV+E3IY8l5RG1Jbyh/hky1YSpp5pk1qCgh8phbOivn06A=
Received: from DB5PR07MB1431.eurprd07.prod.outlook.com (10.166.4.17) by
	DB5PR07MB1429.eurprd07.prod.outlook.com (10.166.4.15) with Microsoft
	SMTP Server (TLS) id 15.1.497.12; Mon, 23 May 2016 11:36:58 +0000
Received: from DB5PR07MB1431.eurprd07.prod.outlook.com ([10.166.4.17]) by
	DB5PR07MB1431.eurprd07.prod.outlook.com ([10.166.4.17]) with mapi id
	15.01.0497.019; Mon, 23 May 2016 11:36:58 +0000
From: Matthijs Vader <mvader@victronenergy.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: wic wks: data partition only mounted on second boot?
Thread-Index: AdG0z+bhJeMhTGUwS9ql4pikgxt6oAAFoWow
Date: Mon, 23 May 2016 11:36:58 +0000
Message-ID: <DB5PR07MB1431386E8583B4F0F5204924C54E0@DB5PR07MB1431.eurprd07.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=victronenergy.com;
x-originating-ip: [84.53.67.98]
x-ms-office365-filtering-correlation-id: ef720c2b-ecfc-4f00-33f8-08d382fe8ce1
x-microsoft-exchange-diagnostics: 1; DB5PR07MB1429;
	5:ySCgBih7n3utP+vSZFiseijb/zfJDULulJOzhtbgwL7TLs92Zk/NmlJWS4/BrqDR4yTXOLEcG8HdVNpNud5WntkvJjrD3FLvDTVHQ9Nqoz1f5YIHsAOJ2ilc4VcPnfcoxvKNeve89tUyGksdCbRK3g==;
	24:tlR1P3vF/WLq1WwotdU+e8nnGUqur+Vng7xjKft0VZcyaVyLxz0MVEB/eP+t8EAPWw/gKRaCVtN9ZiKNQiUUbshxD9UdYHCZBBnV1zYEBr0=;
	7:FlS8+CGteT5Dl3d4PO8HB/3cWbw40HIU8LXn/ZhLHBNoWFjFaMzhh+CMqhbrtAcv3pSghWEa6DdFUCaY1PM9v7Y0RngA9bPFCzAmlqynhL7h/oHXK0cZ9JBug9KAgkxOK1b7xxQd/+KWKTmVE8EEIVq0zX8KMk0npgEIthHvEWMdMF2QZxgLAM524TAS5U+U
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR07MB1429;
x-microsoft-antispam-prvs: <DB5PR07MB14298BF3CCFB06E5B028FE69C54E0@DB5PR07MB1429.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040130)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6041072)(6043046);
	SRVR:DB5PR07MB1429; BCL:0; PCL:0; RULEID:; SRVR:DB5PR07MB1429; 
x-forefront-prvs: 0951AB0A30
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(8676002)(2351001)(87936001)(81166006)(3660700001)(6116002)(33656002)(107886002)(586003)(575784001)(86362001)(15975445007)(19580395003)(50986999)(3846002)(102836003)(54356999)(66066001)(9686002)(8936002)(77096005)(11100500001)(10400500002)(1220700001)(5002640100001)(2906002)(74316001)(76576001)(2900100001)(450100001)(110136002)(122556002)(5004730100002)(5003600100002)(2501003)(5008740100001)(92566002)(189998001)(3280700002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR07MB1429;
	H:DB5PR07MB1431.eurprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2016 11:36:58.5463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR07MB1429
Subject: Re: wic wks: data partition only mounted on second boot?
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
X-List-Received-Date: Mon, 23 May 2016 11:37:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> It creates the /data partition, and adds it to the .wic file, all fine. B=
ut on
> the first boot it is not auto-mounted. From the boot log:
>=20
>=20
> [    1.898069] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data =
mode. Opts: (null)
> [    1.906798] VFS: Mounted root (ext4 filesystem) readonly on device 179=
:2.
> [    1.919446] devtmpfs: mounted
> [    1.923113] Freeing unused kernel memory: 264K (c069e000 - c06e0000)
> version 2.88 booting
> Starting udev
> [    2.535288] udevd[657]: starting version 182

Hi again, fixed and found it myself already. There is an error while mounti=
ng that
partition on the first boot because the mount point (/data) doesn't exist y=
et.
Then, later during first boot, some application creates it. Which explains =
why
it does work on the second boot.

Which brings me to a new question:

Is there are reason for mountall.sh to put all errors into /dev/null? See:
https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-=
core/initscripts/initscripts-1.0/mountall.sh#L20

Or shall I send a -tiny- patch dropping that 2>/dev/null?

Best, Matthijs

