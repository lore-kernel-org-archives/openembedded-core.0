Return-Path: <gtertych@cisco.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Nov 2019 15:16:16 UTC
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by mail.openembedded.org (Postfix) with ESMTP id E05637F8AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 15:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1834; q=dns/txt; s=iport;
	t=1572880578; x=1574090178;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=BGmmyhvV1SGxly2HyyNHFBkD83gp67rDZfRlTmY9gqk=;
	b=ALnhja3oaChgONCLd9iPL27YKJhQNfQ3pnND4hVql8Q0dX34xLyooeR4
	EtK+EbPqu7g7Dciv84UxDqUJuaQ+Mc5pwGvssVNmc2HlzU3c7y7PbPctk
	Os70JZVWXy8FefldVPlK8/h0JsgmQ4CBz33DiN2XDFiCoBnlAXInpO+Sb g=;
IronPort-PHdr: =?us-ascii?q?9a23=3AUQ0hWBMRPuWJOC42pssl6mtXPHoupqn0MwgJ65?=
	=?us-ascii?q?Eul7NJdOG58o//OFDEu6w/l0fHCIPc7f8My/HbtaztQyQh2d6AqzhDFf4ETB?=
	=?us-ascii?q?oZkYMTlg0kDtSCDBj0MPPwcz0xHOxJVURu+DewNk0GUMs=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ApAAD1PcBd/4kNJK1mGgEBAQEBAQE?=
	=?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFsAgEBAQELAYFKUAWBRCAECyqHbwOKdoJel32?=
	=?us-ascii?q?CUgNUCQEBAQwBARgVAgEBhEAChA4kNwYOAgMBAwIDAgEBBAEBAQIBBQRthTc?=
	=?us-ascii?q?MhVEBAQEBAgEBES4BATIFAQQLAgEIEQQBAS8oCh0IAgQBDQUIGoVHAw4gAaZ?=
	=?us-ascii?q?jAoE4iGCCJ4J+AQEFhQwYghcJFIEiAYwSGIFAP4FXghc1PoRFAoNAggoijHS?=
	=?us-ascii?q?IaWCINY8ECoIkkAWFTJllLY4VmVcCBAIEBQIOAQEFgWgjgVhwFTuCbFARFIM?=
	=?us-ascii?q?Gg3OKU3SBKI1FAQE?=
X-IronPort-AV: E=Sophos;i="5.68,267,1569283200"; d="scan'208";a="372325304"
Received: from alln-core-4.cisco.com ([173.36.13.137])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	04 Nov 2019 15:09:12 +0000
Received: from XCH-RCD-006.cisco.com (xch-rcd-006.cisco.com [173.37.102.16])
	by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id xA4F9CSd030355
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 4 Nov 2019 15:09:12 GMT
Received: from xhs-aln-001.cisco.com (173.37.135.118) by XCH-RCD-006.cisco.com
	(173.37.102.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 4 Nov 2019 09:09:11 -0600
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by xhs-aln-001.cisco.com
	(173.37.135.118) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 4 Nov 2019 09:09:10 -0600
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (64.101.32.56) by
	xhs-rtp-001.cisco.com (64.101.210.228) with Microsoft SMTP Server
	(TLS) id
	15.0.1473.3 via Frontend Transport; Mon, 4 Nov 2019 10:09:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Er4USoro+wXmnigRiJzlmVx0P3tkcX6DPwpnZKqKgPrRbJfQpTGMuMfdPFV+iu/UWg2YdvdLLw8X1/ThKeDWrmlQ6NhIeGPBa4VPMcMAQod45LQJiVSk6NYq84Prlll2k9LGj9ULBx//8VLNR1mapmXRU1z6LqQ/hOVDNlFWSg3z5+iO5rdGs6xE2zQYb0ZiLWrHvDuTyY7qnsCQi/i1vXZkRkQ+qTxmIQY7+oaJoykvFvtx2fa0ZL8gZTIF/qwq49WIbdHKjLnJ+dl57WzPw/ul2GfGRCTwTwdvah57birtwIqlFvJEipB1Lh33NWla9l4jVfDl3MFEGriEatZBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gD3f2oMPIu9AXFfDQ2rCRBUse0kj7IngW2xDJ7UTMAc=;
	b=dK4YZBegGmcK9x7LxE954aDSnMO0/ATi7B4gKIfHp+itJRSaTHN5vQcsbZCsV4ii7ub05DoGwjFRLCtFc+HhGjk/ECV5LnXc3VuOPa4s4bOuz+zM0SPJvxEnTyjvn9QGRcW01MQCwDRLtZcDgc+GombuJjGRSyJKDnK7PbFEEFzNGyhfyQ62jQzkVKgDghT79ocPyf4NpFNCS0LkyxKc9JF85vMjfMg0Xcwv7C1KTBRqdXTL6IySZWHHtvrIwfITPcaV6lE6ZVSPLZbpAujTCwuJjpLlVqDSXgHWZnedO6h7rwlH/fTZFVBEcnkI0HLvAeYNt2iX/d6VECt6+KvZ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com; 
	dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
	s=selector2-cisco-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gD3f2oMPIu9AXFfDQ2rCRBUse0kj7IngW2xDJ7UTMAc=;
	b=wQjxva0jnt934T+L7A+91YxjPOLh3FhCkDw0bPShuwqK5H0WuKPaxj3XaG+l5eHsg6BqGdpO+x2BIMOsUiOygfVjd7pHZ0wpTtBS20mKdDU9KM0carRmQMmuavjVKf1oMiglBV8ogR9l3jg+pfWZMNzR/AnI1XGci2Er04UHxy0=
Received: from MWHPR11MB1918.namprd11.prod.outlook.com (10.175.54.17) by
	MWHPR11MB1807.namprd11.prod.outlook.com (10.175.55.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Mon, 4 Nov 2019 15:09:08 +0000
Received: from MWHPR11MB1918.namprd11.prod.outlook.com
	([fe80::cd30:1483:29a0:2ee4]) by
	MWHPR11MB1918.namprd11.prod.outlook.com
	([fe80::cd30:1483:29a0:2ee4%11]) with mapi id 15.20.2408.024;
	Mon, 4 Nov 2019 15:09:08 +0000
From: "Grygorii Tertychnyi (gtertych)" <gtertych@cisco.com>
To: Andrei Gherzan <andrei@gherzan.ro>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] archiver: avoid empty incfile in ar_recipe
Thread-Index: AQHVkINrSPE3wsUkS0qsZp7uiCiFxqd2LdcAgATq/mg=
Date: Mon, 4 Nov 2019 15:09:08 +0000
Message-ID: <MWHPR11MB1918D426CB1703852C320064C27F0@MWHPR11MB1918.namprd11.prod.outlook.com>
References: <20191101071043.16558-1-gtertych@cisco.com>,
	<CAK18fxFVpCbD38Y3FK2XMfvK_+pZF2-usf1xC5P2oR5FQhQC-Q@mail.gmail.com>
In-Reply-To: <CAK18fxFVpCbD38Y3FK2XMfvK_+pZF2-usf1xC5P2oR5FQhQC-Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=gtertych@cisco.com; 
x-originating-ip: [2001:420:c0c0:1001::b8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 968fcb2a-7c97-4438-264a-08d76138f0e6
x-ms-traffictypediagnostic: MWHPR11MB1807:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1807554466C8D8626E9C7F93C27F0@MWHPR11MB1807.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0211965D06
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(199004)(189003)(229853002)(6436002)(486006)(55016002)(71190400001)(52536014)(53546011)(186003)(76176011)(33656002)(2501003)(66476007)(66556008)(7696005)(91956017)(66446008)(99286004)(66946007)(64756008)(76116006)(86362001)(14454004)(71200400001)(9686003)(8676002)(8936002)(316002)(81156014)(81166006)(11346002)(102836004)(5660300002)(476003)(107886003)(110136005)(6246003)(46003)(478600001)(7736002)(74316002)(305945005)(6116002)(25786009)(2906002)(256004)(4326008)(14444005)(6506007)(446003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR11MB1807;
	H:MWHPR11MB1918.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Z1gVrLzain129rYuYqIAV1gdmAG9Pb/4MWscio3kDG0hRz6XCbk2ighBbYwrJ7lE5+Mwnilg+hRNRywIEONGdCcgw8su4RQ064johzdAd3LGI33cxcN/Oa5QSphmVvRigMS1pLjc6j730yAVyL6PDJ0U2Um4jE0SxOpXjhJk6MRUOSgEFdk73IQConkMoIBNxUtrCDZ75DDX58VEc7g9u5JWXkPCOwRhDY56HFF2byjKH1g57WY/RNc7nXUDM1T/w2qCZkPwaLMRbepe5q90zd0fsPI1zdWnSQXUheWoBH6/oNbd0QGUSXTohYRnax9iGPM6BAn1MPFsYdJKaOzrBz0NxKR+4DjBH0qDMD5FmNStqkZuZIOj1Vm4hJ1Q8ssI9Qyc6+uMv03cvDp3tyHterAJ4JplA1JDGVT8X/2ISoSD5EfjUAJw4WdgmQvdIDW
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 968fcb2a-7c97-4438-264a-08d76138f0e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2019 15:09:08.2502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xVdrMWFgYpaoC0hwIHBWhe/WY9ozEja5gfweYdTSNMjOaHAcHyxkh+HNxRHINo+6p12HB0VK4b3uW1R143bSuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1807
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.16, xch-rcd-006.cisco.com
X-Outbound-Node: alln-core-4.cisco.com
Cc: "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] archiver: avoid empty incfile in ar_recipe
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
X-List-Received-Date: Mon, 04 Nov 2019 15:16:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Andrei,=0A=
=0A=
From: Andrei Gherzan <andrei@gherzan.ro>=0A=
Sent: Friday, November 1, 2019 13:28=0A=
To: Grygorii Tertychnyi (gtertych); openembedded-core@lists.openembedded.or=
g=0A=
Cc: xe-linux-external(mailer list)=0A=
Subject: Re: [OE-core] [PATCH] archiver: avoid empty incfile in ar_recipe=
=0A=
=0A=
>> do_ar_recipe fails on perf recipe on line:=0A=
>>=0A=
>> include ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.in=
c', '', d)}=0A=
>>=0A=
>> 1. "${...}" part expands into empty string=0A=
>> 2. bb.utils.which() takes empty string and returns first directory name =
from bbpath=0A=
=0A=
> This doesn't sound sane. If the include directive has no argument,=0A=
> incfile should end up None. That's what the code "assumes" at this=0A=
=0A=
I agree.=0A=
=0A=
> point. I would fix it either at the regex expression level or=0A=
> stripping the matched string. I reckon the former makes more sense=0A=
> (.*).=0A=
=0A=
Not sure I understand. Archiver class does not interpret "include" directiv=
e.=0A=
It just parses text files. The regular expression looks correct:=0A=
=0A=
These lines:=0A=
=0A=
440         elif include_re.match(line):=0A=
441             incfile =3D include_re.match(line).group(1)=0A=
=0A=
put "${...}" _string_ into "incfile" variable. So, "incfile" is not None at=
 this stage.=0A=
Then, =0A=
=0A=
443             incfile =3D d.expand(incfile)=0A=
=0A=
Now "incfile" is empty and nobody checks it.=0A=
=0A=
444             incfile =3D bb.utils.which(bbpath, incfile)=0A=
=0A=
Now "incfile" is set to first directory name in BBPATH (wrong behavour?)=0A=
=0A=
445             if incfile:=0A=
446                 shutil.copy(incfile, outdir)=0A=
=0A=
Exception here: "incfile" is directory, not a file.=0A=
=0A=
-- =0A=
Grygorii=0A=

