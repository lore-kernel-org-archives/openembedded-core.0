Return-Path: <BSREEKAN@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0064.outbound.protection.outlook.com [104.47.34.64])
	by mail.openembedded.org (Postfix) with ESMTP id E717478995
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 18:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=NZwWvMVWi3qqLj15Ypob0vqk1e8OL0dR4bBh0Gb+6nw=;
	b=cwNzYG7Ed4hfjcx9d4cDTF8jzN/8OZ1hfoRIQ+urw1fnPVU01qHHSacSAlgbLIuFdoPOPVx2b312ap34EVKMIMYEYaAV7gY4kIAw6/HeNPIc+8IJISmuPr1SuhDEqXm0vyGFnjswVCCpYpmNZtMZuRtW+bcfaBz4Sj3DBQi5h3g=
Received: from CY1PR0201MB0841.namprd02.prod.outlook.com (10.160.142.12) by
	CY1PR0201MB0905.namprd02.prod.outlook.com (10.160.164.15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.588.14; Wed, 21 Mar 2018 18:32:04 +0000
Received: from CY1PR0201MB0841.namprd02.prod.outlook.com
	([fe80::18e:fea4:d1d6:f51f]) by
	CY1PR0201MB0841.namprd02.prod.outlook.com
	([fe80::18e:fea4:d1d6:f51f%17]) with mapi id 15.20.0588.017;
	Wed, 21 Mar 2018 18:32:04 +0000
From: Bhargava Sreekantappa Gayathri <BSREEKAN@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Disable post install script during build time.
Thread-Index: AdPBQs2S9nkrUr8eQ/2JAZGWsrfI0A==
Date: Wed, 21 Mar 2018 18:32:03 +0000
Message-ID: <CY1PR0201MB0841DA8B7AFA88A36A490152B0AA0@CY1PR0201MB0841.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=BSREEKAN@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY1PR0201MB0905;
	7:wGxGtv7wMv1jmbod7LXMa5LpEsKgcJxI+MpMSqayWvvK3YLN+aShMvXHUhcarSGhMEDvJ7+OcrFvbzXvMZHscpJQSlD7fnO+QKXKPy+O9aJo7TXKqdtQs31oCFQKSY+f7KNNmx8bR8cQVisPlDXFm0JvolTxP+4rFbutcoAEJo3rh5STYA/A2OriI+E3A1/XMUkA9bpb36Wrqd7Zb3lIa5nXJhkg48nLMYvfr6peQfmWKXtcLXrpjwVO509P8pBv
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 056270c3-8a2e-4ba8-0bad-08d58f5a0b30
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY1PR0201MB0905; 
x-ms-traffictypediagnostic: CY1PR0201MB0905:
x-microsoft-antispam-prvs: <CY1PR0201MB09053AB94CBA13C86AD97759B0AA0@CY1PR0201MB0905.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(3231221)(944501325)(52105095)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY1PR0201MB0905; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0201MB0905; 
x-forefront-prvs: 0618E4E7E1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39380400002)(366004)(346002)(396003)(376002)(39860400002)(199004)(189003)(305945005)(102836004)(186003)(106356001)(26005)(7736002)(6436002)(74316002)(59450400001)(6506007)(9686003)(97736004)(5640700003)(2351001)(316002)(3660700001)(55016002)(68736007)(81166006)(53936002)(8936002)(107886003)(8676002)(6916009)(81156014)(2501003)(2900100001)(86362001)(5250100002)(2906002)(33656002)(6116002)(3846002)(4326008)(25786009)(3280700002)(7696005)(99286004)(478600001)(72206003)(14454004)(5660300001)(105586002)(5890100001)(66066001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0201MB0905;
	H:CY1PR0201MB0841.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: ULgx2yEurBQAoYj5Crr59prZo57BEcc9gW9KDj8ZUNnjMn6e1ln+dYv2nloicn9mMVPn/Dv7m3xd1uX5bxYQEp1SS1T8Ai2gsRnU103DgelRRJAKWxEMVOhchstjTCSRNR23Cxy1tNlGqPmy/iPt0bB+zNPUVKuu7UgmSQ271oR/nudZJtxUkQNOnmr2lNjgKo+Rq31uJibw2xINpWJLYCoz3N4ErV3oIFOSs6N83nlZLsxaI6gzmtN+XNP+kHqSYDVpVfqLMplBv83zwzQlDWptnSWnlHB6MmHyxYssLI7jViBmDSluOfE7h4/t7611dZWOl6HdJGCP7/4N/oXIlg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 056270c3-8a2e-4ba8-0bad-08d58f5a0b30
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2018 18:32:03.8757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0201MB0905
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
X-List-Received-Date: Wed, 21 Mar 2018 18:32:05 -0000
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

