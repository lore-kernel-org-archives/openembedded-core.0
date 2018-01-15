Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0054.outbound.protection.outlook.com
	[104.47.37.54])
	by mail.openembedded.org (Postfix) with ESMTP id BDCBD71A8D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 06:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DuUU+CdV3YNUF1zvq4ZHNeUIsHuTp5aLic+df3XsiM4=;
	b=P8we9orcjoOzRDz36vs183wZzgneU3QPGvB9Qd39P18AtbpMB2bi2fYV8cuOL+qFkR4QxEu3TAObWSIrtSo5/Cxdcxp+QOwQY1uljsQQ7WBxUI37Yne5feVesQabJaX2GZIH+3Wzb4WEElXhl/MRqv37Tz9ZJNCtAfSjmvRb3xg=
Received: from BY2PR02MB347.namprd02.prod.outlook.com (10.141.140.149) by
	BY2PR02MB443.namprd02.prod.outlook.com (10.141.144.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Mon, 15 Jan 2018 06:20:29 +0000
Received: from BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) by
	BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) with mapi id
	15.20.0407.009; Mon, 15 Jan 2018 06:20:29 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>, "meta-xilinx@yoctoproject.org"
	<meta-xilinx@yoctoproject.org>
Thread-Topic: liblzma: Memory allocation failed on do_package_rpm 
Thread-Index: AdONyO7F0CbDbyZMTvmUCBS8jdjlFQ==
Date: Mon, 15 Jan 2018 06:20:28 +0000
Message-ID: <BY2PR02MB347697DA9F50BFD39015C3BB9EB0@BY2PR02MB347.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB443;
	7:MX6D0wrLV3GN6TepZXyXY3G5aOHG9dlFnMmOPbWwG+7HGneDarRAYE792SMftDHnZ+km87yRddCbHGNu9S6Dk0jWUiqDbHC8q8yQvFQ/D+s52q7YOh09QOObZo8tKNFsXOGRG9aNNSXfrTMUYaiBq1fWxR6vrogNXb84tSY3AxLhIkBiAjYNQJ6cmPi4qWlELl6N0emjd9gk/vOcPjqduhMGpgBHcblxOE5VYRkhLKjaiP7BimbEyR+dIFvFkG5Y
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 851e7e0d-7acf-40d2-a986-08d55be012e0
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:BY2PR02MB443; 
x-ms-traffictypediagnostic: BY2PR02MB443:
x-microsoft-antispam-prvs: <BY2PR02MB443CC0AC4EC5EFB3162CDD6B9EB0@BY2PR02MB443.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(3231023)(944501161)(10201501046)(6055026)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:BY2PR02MB443; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BY2PR02MB443; 
x-forefront-prvs: 0553CBB77A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(396003)(39860400002)(376002)(39380400002)(346002)(189003)(199004)(105586002)(6436002)(74316002)(68736007)(81166006)(81156014)(14454004)(9686003)(72206003)(110136005)(4743002)(106356001)(478600001)(55016002)(66066001)(99286004)(2501003)(5890100001)(2201001)(86362001)(305945005)(77096006)(8676002)(316002)(102836004)(25786009)(6506007)(6116002)(3846002)(7736002)(7696005)(33656002)(3660700001)(97736004)(2906002)(59450400001)(5660300001)(53936002)(3280700002)(8936002)(2900100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB443;
	H:BY2PR02MB347.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: z5awPFAMYy+FuFZL6/uc4dTlcd0RKHf0UlUHzniLtknpO4cVX7XLuqjoVuoJRL3KgaXxHxHDKXC5TBhFaFW/Rg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851e7e0d-7acf-40d2-a986-08d55be012e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2018 06:20:28.8433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB443
Subject: liblzma: Memory allocation failed on do_package_rpm
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
X-List-Received-Date: Mon, 15 Jan 2018 06:35:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

Has anybody seen this error?

Finished binary package job, result 0, filename (null)
error: create archive failed: cpio: write failed - Cannot allocate memory
error: liblzma: Memory allocation failederror: liblzma: Memory allocation f=
ailedFinished binary package job, result 2,

.......

RPM build errors:
|     Deprecated external dependency generator is used!
|     Deprecated external dependency generator is used!
|     Deprecated external dependency generator is used!
|     Deprecated external dependency generator is used!
|     Deprecated external dependency generator is used!
|     Deprecated external dependency generator is used!
|     Deprecated external dependency generator is used!
|     Deprecated external dependency generator is used!
|     Deprecated external dependency generator is used!
|     liblzma: Memory allocation failed    liblzma: Memory allocation faile=
d    liblzma: Memory allocation failed    liblzma: Memory allocation failed=
    liblzma: Memory allocation failed    liblzma: Memory allocation failed

This happens in do_package_rpm task on various recipes, coreutils/libgpg/di=
ffutils etc.

The host machine has good amount on memory, 256G to be exact. When I see th=
e error and issue free -h command, I still see ~120G free memory available.
This is a RHEL 7.2 machine and I am running rocko baseline.

Any reason why this would happen? Where should I look to fix this issue?

Thanks,
Manju
This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

