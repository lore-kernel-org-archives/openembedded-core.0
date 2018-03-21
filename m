Return-Path: <BSREEKAN@xilinx.com>
X-Greylist: delayed 1099 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Mar 2018 19:07:31 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0052.outbound.protection.outlook.com [104.47.42.52])
	by mail.openembedded.org (Postfix) with ESMTP id DB85D78966
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 19:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FTapUVFrh7EPfEtaksOJ6InKt2WqTd0ejHFfkrCtI8Y=;
	b=xvI4X12jJ1n/3K7E8q6BAwB8/AdkL5p7CEthDkK/JDEqliEVQq5ul4amYM9tR1x+ZKPuOq3vkv6hmtOUAS3vhWuIHmyK2RXikJGOnYD+Rfh93+bbDel3sUt5Kvfj/8lxiX/azhKVa4EUOWvmkio7MJ4mDf8BdH6ic2HZDZafR6I=
Received: from CY1PR0201MB0841.namprd02.prod.outlook.com (10.160.142.12) by
	CY1PR0201MB1881.namprd02.prod.outlook.com (10.163.56.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.588.14; Wed, 21 Mar 2018 18:34:19 +0000
Received: from CY1PR0201MB0841.namprd02.prod.outlook.com
	([fe80::18e:fea4:d1d6:f51f]) by
	CY1PR0201MB0841.namprd02.prod.outlook.com
	([fe80::18e:fea4:d1d6:f51f%17]) with mapi id 15.20.0588.017;
	Wed, 21 Mar 2018 18:34:19 +0000
From: Bhargava Sreekantappa Gayathri <BSREEKAN@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core] Disable post install script during build time.
Thread-Index: AdPBQzCbudNHT9CWTXCb3/x9BS9vNw==
Date: Wed, 21 Mar 2018 18:34:19 +0000
Message-ID: <CY1PR0201MB0841AEDC741585C62F827A31B0AA0@CY1PR0201MB0841.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=BSREEKAN@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY1PR0201MB1881;
	7:QQQxt9p2HXDutOKEZ+w3uuqIgJT2C1UaXTWwEIf/YRHYgPA1S8EKzYAawtHrUmluHh/16oWxqZ3C3i0ZeBKBtPkAyKVpnwJ/oREP4Gghy4zSrdljKHGQqWIbESRo/2ocCLoXCknsZ/+kiQMD1vZeR3unMW+UyfeS3t+zS+ILmL6b+hKfkGYwfTp8Vuu/LFxhKW/FNY/BMuZ/HIZMqIwtUs8nhaiJtaA3TgpXyPMuFsWl9IsmRIfuvvqPbFBL2Whj
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f40603c4-1e81-4114-94d3-08d58f5a5bcd
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY1PR0201MB1881; 
x-ms-traffictypediagnostic: CY1PR0201MB1881:
x-microsoft-antispam-prvs: <CY1PR0201MB188137FAFDD77B09E600D85BB0AA0@CY1PR0201MB1881.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231221)(944501325)(52105095)(93006095)(93001095)(10201501046)(3002001)(6055026)(6041310)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:CY1PR0201MB1881; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0201MB1881; 
x-forefront-prvs: 0618E4E7E1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39380400002)(39860400002)(396003)(376002)(366004)(199004)(189003)(7736002)(25786009)(3846002)(6116002)(8676002)(81166006)(305945005)(74316002)(186003)(478600001)(14454004)(1857600001)(86362001)(105586002)(6916009)(316002)(72206003)(4326008)(81156014)(5660300001)(106356001)(2351001)(102836004)(68736007)(8936002)(97736004)(33656002)(5890100001)(6506007)(99286004)(26005)(55016002)(59450400001)(6436002)(66066001)(5640700003)(5250100002)(3280700002)(2906002)(3660700001)(107886003)(2900100001)(53936002)(9686003)(2501003)(7696005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0201MB1881;
	H:CY1PR0201MB0841.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: iAv32HyYmnS9pCvB2Xq+3ZJNgmmqr6bRP2o+LWWU3oBtOwXV3J8JffAz1YQOzguEenjEZyBy2KQzcdrGlJ+1neomWeCj1/NFBO5Lq9Vbvf7/rLp6NqgpsFTqRnfGydizv+si4rn2XwDdzXHtzFcLHAY7ONql/PjvK/DVBRoLlC61lkkHqI4unWOVRJs8v0D8dNyI5DJ7bddbLmcuD+AVhouaYAoVKL3Glzau67I9ODKbOE/dM1XctqJ3RaSuNutnKpzYwiqCni3fQ0Y/Vzix+dPO34aBN3TYtHyUHOTqSjlO/5Jd6FZTYcHiT1LwxF112/+irHw1TgHhHfjA/ZRhjg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f40603c4-1e81-4114-94d3-08d58f5a5bcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2018 18:34:19.1727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0201MB1881
Subject: Disable post install script during build time.
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
X-List-Received-Date: Wed, 21 Mar 2018 19:07:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I see that there is a post install script in "meta/recipes-core/sysvinit/sy=
svinit-inittab_2.88dsf.bb" which needs to be run on target. However, it is =
run on the host every time I make a build and the scriptlet fails since it =
is checking for /proc/consoles and bitbake gives this warning:

[log_check] warning: %post(sysvinit-inittab-2.88dsf-r10.plnx_zynqmp) script=
let failed, exit status 1

Is there a way to disable this post install script during build?

Thanks,
Bhargav

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

