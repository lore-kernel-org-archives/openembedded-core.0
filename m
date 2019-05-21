Return-Path: <kamensky@cisco.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 May 2019 21:45:02 UTC
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
	by mail.openembedded.org (Postfix) with ESMTP id E45C67E2AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 21:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1717; q=dns/txt; s=iport;
	t=1558475104; x=1559684704;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=h+J8HEXAhJuYkWIsq8XpIYc8f4FDq8aE1xa5r6bI0Fo=;
	b=Ltzqg53IqCq37QXe1rvw1FREwB7x/6G+QshgnOWT4BwIOeySYzTBZ7ys
	2MARtM96fqgWk0AUA6K7Ms6ITllWvtzLIhRil38TQ83NDPY3Hr8kGfvd7
	HlrwiioTvqMO1iIII8cPUC/IyOZGDD+6AHVYfHqrgHM6aVVs5Wk2LxuBc Y=;
IronPort-PHdr: =?us-ascii?q?9a23=3AW2vL7h29251N2vlLsmDT+zVfbzU7u7jyIg8e44?=
	=?us-ascii?q?YmjLQLaKm44pD+JxKGt+51ggrPWoPWo7JfhuzavrqoeFRI4I3J8RVgOIdJSw?=
	=?us-ascii?q?dDjMwXmwI6B8vQCkT+IfjxbD0SF8VZX1gj9Ha+YgBY?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BRAQCobuRc/4gNJK1lHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBVAQBAQsBgT1QA2lVIAQLKIdaA452SoElaIlAjWeCUgNUCQEBAQwBARg?=
	=?us-ascii?q?LCgIBAYN6RgKCJiM3Bg4BAwEBBAEBAgEEbRwMhUoBAQEEAQEQFRkBASwMDwI?=
	=?us-ascii?q?BCA4DBAEBLyEGAQodCAIEARIIGoMBgWoDHQECDJwXAoE1iF+BbTOCeQEBBYU?=
	=?us-ascii?q?DDQuCDwmBNAGLUBeBf4FXgkw+ghpHAQSBXgKDOoImi2iHYZQlOQkCgg2GLod?=
	=?us-ascii?q?ogQyDeYMFkyeMVoZygVONAwIEAgQFAg4BAQWBZSKBV3AVO4JsCYIGDAEWg0y?=
	=?us-ascii?q?FFIU/coEpjX8BAQ?=
X-IronPort-AV: E=Sophos;i="5.60,496,1549929600"; d="scan'208";a="562491203"
Received: from alln-core-3.cisco.com ([173.36.13.136])
	by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	21 May 2019 21:37:55 +0000
Received: from XCH-RCD-003.cisco.com (xch-rcd-003.cisco.com [173.37.102.13])
	by alln-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id x4LLbun8016542
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 21 May 2019 21:37:56 GMT
Received: from xhs-aln-001.cisco.com (173.37.135.118) by XCH-RCD-003.cisco.com
	(173.37.102.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 21 May 2019 16:37:55 -0500
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by xhs-aln-001.cisco.com
	(173.37.135.118) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 21 May 2019 16:37:54 -0500
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (64.101.32.56) by
	xhs-rtp-003.cisco.com (64.101.210.230) with Microsoft SMTP Server
	(TLS) id
	15.0.1473.3 via Frontend Transport; Tue, 21 May 2019 17:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
	s=selector2-cisco-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6Oq6gLkCd1FyOluQsj7zMU73nc4ae9HdPNPt1eBnjtM=;
	b=iLImj6z71X9ip4umllwGjFCTIvIpoIFgHRCM/zXlwGdSKAdamHVOrX9Ix28losdxmZlx06QWFbaqA2PFgTD+d/XcyIZB3KdiAdLMV68d6FBtydidkEVoQ7SjGDUKMgKfPPSUj3KNmk+jh+CBp5i7D6Gg8iZXOV9msikOk3qm+VA=
Received: from BYAPR11MB3653.namprd11.prod.outlook.com (20.178.237.78) by
	BYAPR11MB2629.namprd11.prod.outlook.com (52.135.227.26) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1900.18; Tue, 21 May 2019 21:37:53 +0000
Received: from BYAPR11MB3653.namprd11.prod.outlook.com
	([fe80::707d:b1fc:4150:a38]) by BYAPR11MB3653.namprd11.prod.outlook.com
	([fe80::707d:b1fc:4150:a38%6]) with mapi id 15.20.1900.020;
	Tue, 21 May 2019 21:37:53 +0000
From: "Victor Kamensky (kamensky)" <kamensky@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 13/42] systemtap: upgrade 4.0 -> 4.1
Thread-Index: AQHVDxZKOKyqhIysz0W0GnmSgFJt/KZ2G8gk
Date: Tue, 21 May 2019 21:37:53 +0000
Message-ID: <BYAPR11MB3653872C0E596E71869D90C7CD070@BYAPR11MB3653.namprd11.prod.outlook.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>,
	<20190520141125.10805-13-alex.kanavin@gmail.com>
In-Reply-To: <20190520141125.10805-13-alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=kamensky@cisco.com; 
x-originating-ip: [2001:420:302:1250:7cdd:2c6e:5dd:7778]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d78cd7bd-3819-4ef6-8925-08d6de3494c3
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
	SRVR:BYAPR11MB2629; 
x-ms-traffictypediagnostic: BYAPR11MB2629:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR11MB262908B608259C192EA3CABDCD070@BYAPR11MB2629.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(346002)(136003)(376002)(39860400002)(366004)(199004)(189003)(81166006)(8676002)(8936002)(81156014)(25786009)(6246003)(305945005)(53936002)(110136005)(446003)(5660300002)(52536014)(86362001)(256004)(11346002)(14444005)(6116002)(476003)(71190400001)(7736002)(74316002)(46003)(486006)(71200400001)(53546011)(102836004)(6506007)(7696005)(76176011)(478600001)(6306002)(316002)(66446008)(76116006)(9686003)(186003)(99286004)(66946007)(64756008)(66556008)(2906002)(66476007)(33656002)(73956011)(229853002)(2501003)(966005)(6436002)(68736007)(55016002)(14454004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR11MB2629;
	H:BYAPR11MB3653.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ndMrpyVs2g97WEfvkLXaFYd71XBRU5aYhKWKkyclcyNsiGxqbEOpEKeViyDOXC3eXdEvs69fheZ4WLCydEBr8S88jsXW40bjwFAE/bPQxR1eiq7bUhB306wctRDqZ9BkJG5rZirXtcytM6i7GLWFtI4PR7lkzOwVuXt8O5b0xVAg8Kn+V89RPRG6i1ywe2CmzJ5iLVJFZ3UPjfIyTUQ8M12g9GVDVnlrin5Z2em1NlWZRGs476zhViMkzttWGw9TuHC1XB/zakiQQi4HfzUS8DfFlS5XMP44wvDcSkbkiX5EY1cgZXw0rJ6VDUE+ylzIAymPcKa+OJIik6nHgB0lfzW2V7rHnPujU0LW6wRD+K5TX9y4J8skWJkp0HpDRbIrf2drYxKspZKVSQ+redyVFuDO9DKT0w6xpIiuvt3jnZQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d78cd7bd-3819-4ef6-8925-08d6de3494c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 21:37:53.3542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2629
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.13, xch-rcd-003.cisco.com
X-Outbound-Node: alln-core-3.cisco.com
Subject: Re: [PATCH 13/42] systemtap: upgrade 4.0 -> 4.1
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
X-List-Received-Date: Tue, 21 May 2019 21:45:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,=0A=
=0A=
I am curios how much did you test it? I had the same patch for=0A=
a while, waited to post it till proper regressions are done.=0A=
=0A=
Thanks,=0A=
Victor=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Alexander Kanavin <alex.kanavin=
@gmail.com>=0A=
Sent: Monday, May 20, 2019 7:10 AM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH 13/42] systemtap: upgrade 4.0 -> 4.1=0A=
=0A=
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>=0A=
---=0A=
 meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--=0A=
 1 file changed, 2 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes=
-kernel/systemtap/systemtap_git.inc=0A=
index 54de7226608..c5348b3204b 100644=0A=
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc=0A=
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc=0A=
@@ -1,7 +1,7 @@=0A=
 LICENSE =3D "GPLv2"=0A=
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"=0A=
-SRCREV =3D "90ff34ac0506f0d5440393a4c78565f6aaf9b726"=0A=
-PV =3D "4.0"=0A=
+SRCREV =3D "984d6d1696ed06626b07cb65ab55d6ae0ece1131"=0A=
+PV =3D "4.1"=0A=
=0A=
 SRC_URI =3D "git://sourceware.org/git/systemtap.git \=0A=
            file://configure-allow-to-disable-libvirt.patch \=0A=
--=0A=
2.17.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

