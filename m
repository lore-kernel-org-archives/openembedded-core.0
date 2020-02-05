Return-Path: <takondra@cisco.com>
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
	by mail.openembedded.org (Postfix) with ESMTP id B973B610B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 01:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=368; q=dns/txt; s=iport;
	t=1580865945; x=1582075545;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=ICZ4kjNV9rUOff4ro21vP3aW9upiXCjKfQD05Q8Co8Q=;
	b=J+05zV7hV245LUEenWW/ZEwiwMccgQ3pqKzEWmPxwghLIJt64OVMFWtq
	qgyqVIc2SrgcDlvglSq8pPJ5GaJfk3WZTNKXoXo51lr5iVJcyUPFFOL65
	cUiZJuj0osChUOuo3wPogyok9dIGA5VL6qQMX3sagacSG0AreTlQHDxDe A=;
IronPort-PHdr: =?us-ascii?q?9a23=3AqyS9VhQYpojVH7uXgUr77s5PJNpsv++ubAcI9p?=
	=?us-ascii?q?oqja5Pea2//pPkeVbS/uhpkESXBNfA8/wRje3QvuigQmEG7Zub+FE6OJ1XH1?=
	=?us-ascii?q?5g640NmhA4RsuMCEn1NvnvOjAzH8NEWEVs13q6KkNSXs35Yg6arw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CBBQBAGTpe/51dJa1lHAEBAQEBBwE?=
	=?us-ascii?q?BEQEEBAEBgXuBVFAFgUQgBAsqh1sDiwKCX5gPglIDVAkBAQEMAQEtAgEBhEA?=
	=?us-ascii?q?CgjckOBMCAw0BAQQBAQECAQUEbYU3DIVmAQEBAQIBEi4BATcBDwIBCBguMiU?=
	=?us-ascii?q?CBAENDRqFTwMOIAECoUACgTmIYoIngn8BAQWFMRiCDAkUgSSMIhqBQT+BWIJ?=
	=?us-ascii?q?MPoRLAoNAgiyXPJgrCoI7ll6COAEPiA6QMosAg2GbGgIEAgQFAg4BAQWBaSK?=
	=?us-ascii?q?BWHAVgydQGA2OHTiDO4pTdIEpjRIBAQ?=
X-IronPort-AV: E=Sophos;i="5.70,403,1574121600"; d="scan'208";a="443981358"
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
	by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	05 Feb 2020 01:25:36 +0000
Received: from XCH-ALN-008.cisco.com (xch-aln-008.cisco.com [173.36.7.18])
	by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 0151PasI020025
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 5 Feb 2020 01:25:36 GMT
Received: from xhs-rcd-001.cisco.com (173.37.227.246) by XCH-ALN-008.cisco.com
	(173.36.7.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 4 Feb 2020 19:25:35 -0600
Received: from xhs-rcd-001.cisco.com (173.37.227.246) by xhs-rcd-001.cisco.com
	(173.37.227.246) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 4 Feb 2020 19:25:35 -0600
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (72.163.14.9) by
	xhs-rcd-001.cisco.com (173.37.227.246) with Microsoft SMTP Server
	(TLS) id
	15.0.1473.3 via Frontend Transport; Tue, 4 Feb 2020 19:25:35 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=SbkmiZiAqWOjwfM/f3KBUAmH7/pUaZAPu4rvQR+4BEKlUA1NsjMfTDGwBmuiLIkr2yHjXhr4UKw7mR1xtyEhgTJk44MPhiloPYIbh8OvHfkIV4zCLICOi5SC0uUWA88fSyvOXlP+ihP+ptecCNSJxqyzvX27j2isit4Jh5oC0I8YJDGjECcpwXE4PVO3b9KBAoq82H4RXnitT/bzMOouzcDy09uOMSQ+/iSHvq8/4Y/8CI5JLJ0SiYWusWNrU81LW/OyV4Uaa0fYdyPhquYRanYmexA3v1/dQnItPp79K1Rmmx86i0bFTE3VN+aZzVZIMs7QTvd7+Pw723tXC8IgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ICZ4kjNV9rUOff4ro21vP3aW9upiXCjKfQD05Q8Co8Q=;
	b=QpRdxIqpA/BwyPbo7oNtHhM23d1ymltWjTG/pXvixUGImBRuZaVn2n5Vk8BPkxBkEdw+9glnuWeQG2fvmj4aKT9+XJDojzyBEs0S9ulX+XgAzT0iitffrBpBJQTvsvBWghH6hhrwiqjdtUVxZQ14O+nXe6cE2B+7ee9TPLXts4ezqGn+QXPC4KTTkhIGmN+LErM4fepxvwlPNdC40SBWl32Nh88ipi4G0ulXXSpZZQ2uWA+GeX4LbRaC2+UtJR290esdr3pgAgX/KEZfla0eaGhEsxJYApWgmKBnJGsd0FTp6OZPU77lLsTK9SRxcgbt2+WMZYJOZmTSvAS6guAdYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com; 
	dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
	s=selector2-cisco-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ICZ4kjNV9rUOff4ro21vP3aW9upiXCjKfQD05Q8Co8Q=;
	b=dLSDzngL7+p9h/Pyex2LxoNRnSXD+g5byJDV0Pee5no+U9YFrNWOYJMfv2YTtXI9zlg4uxKDCBJsEICHiOUKj0TzF6uQGa45twWbm5AikSEMr7y1IpqYZFgboLUhuxUhK+L89mnk1L1L58wycV0MhwV2idnVK/PRII2PHKfnvVU=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (20.177.185.84) by
	BYAPR11MB2821.namprd11.prod.outlook.com (52.135.228.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2686.27; Wed, 5 Feb 2020 01:25:32 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
	([fe80::2168:ae72:cbd4:6677]) by
	BYAPR11MB3366.namprd11.prod.outlook.com
	([fe80::2168:ae72:cbd4:6677%4]) with mapi id 15.20.2686.031;
	Wed, 5 Feb 2020 01:25:32 +0000
From: "Taras Kondratiuk (takondra)" <takondra@cisco.com>
To: akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] gcc-9.2: fix bug #91102 'aarch64 ICE on Linux
	kernel with -Os'
Thread-Index: AQHV2wHK+0HXUzgSKka/cbotSYXTGKgKaGEAgAAFsQCAAV9Hwg==
Date: Wed, 5 Feb 2020 01:25:32 +0000
Message-ID: <BYAPR11MB336694DBBD57A81DD1F1F76BC8020@BYAPR11MB3366.namprd11.prod.outlook.com>
References: <20200204022006.714-1-takondra@cisco.com>
	<CAMKF1sqmKCwbdE1uncP+k+7OQGrHawJ3dTM1h1_yO9EJuV00iQ@mail.gmail.com>,
	<baf2b1ab-bc63-c350-4956-000c64d4b51d@gmail.com>
In-Reply-To: <baf2b1ab-bc63-c350-4956-000c64d4b51d@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=takondra@cisco.com; 
x-originating-ip: [2001:420:302:1320:4cd6:d27:b3db:1f59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9cf6a83-8c05-4a84-0a5d-08d7a9da4b57
x-ms-traffictypediagnostic: BYAPR11MB2821:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2821D3A69756753295BA0192C8020@BYAPR11MB2821.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0304E36CA3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(199004)(189003)(66946007)(64756008)(66446008)(76116006)(66476007)(66556008)(5660300002)(52536014)(71200400001)(55016002)(9686003)(4744005)(4326008)(8676002)(8936002)(2906002)(478600001)(81156014)(81166006)(54906003)(186003)(86362001)(33656002)(7696005)(110136005)(316002)(53546011)(6506007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR11MB2821;
	H:BYAPR11MB3366.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QGi9FZxQ/PHuIJZazXiyfKuFUcdYXLm9tgTXM99lI8ekd4k/mLOmiQm+XEV7QWklY/XxqDrx44MKdUJIyQjA/7otoiJ0H7yQA+776qRvHzoqF336PGkeWRYWWrvVnEMnsQmefEXfslwwKus9S924+Of3m9ma6d1NzMapZZEwH5F42d6dGWY+wgd3RA3mPwSU4y9YA9Z94zs9MsBZGf5BxEvG3qoBYG2PHe/BqHZLQMlswuwUJJ5ckpAVoHPppfHBZmhufKtkKlzzcEsGaRVioqU4alKJrwTH9d+bbdBCgmWJ32B4+1AuN/4R3NNS1MT5RCLQUdD2SHL7oMno2P0G7pvREWvOZeI/evy2FL4uWbtsfGxr2JGmsP/TUrHMMbdkyeKtC6Fce0Yn2Y95YYV/XHV3z+UPNWfSxywySR11VWApQKfriGpDsQtDUZ/iW+nR
x-ms-exchange-antispam-messagedata: SWn0iakWaauYZ1WQznRBhsmEz7GCDOyypeMV+yT5rPZCJxiSQwf0R/hdV6U5SyVtKKhhvWAAs6IybxgpznxZ/mo5F6H1yWWWMmAX4EkXqTzqwEcdJqIR7E6bl9uJ9r28bZ7uMJBjMjfg4OBtW+3Sdrw3w+WJP5/mOBEK2w4v3lF203piGEAbqrKfnOqF5eCInsNG4gWFsKg99EQ1nYAdAw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a9cf6a83-8c05-4a84-0a5d-08d7a9da4b57
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2020 01:25:32.6376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: To39TwAiuS0HxfzAA5PUqThRT9pv0LqJTs/62w4XWW2hvrN9HJVvYorF5Hns4CmF4+mM8l2RkysKnaSDxHlKRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2821
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.18, xch-aln-008.cisco.com
X-Outbound-Node: rcdn-core-6.cisco.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] gcc-9.2: fix bug #91102 'aarch64 ICE on Linux kernel with -Os'
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
X-List-Received-Date: Wed, 05 Feb 2020 01:25:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon 2/3/20 20:17 akuster808 wrote:=0A=
> On 2/3/20 7:57 PM, Khem Raj wrote:=0A=
> > this is ok. Also please ask it to be backported to 9.3 on gcc bugzilla=
=0A=
=0A=
Asked to add it to 9.3 in the bugzilla.=0A=
=0A=
> =0A=
> And zeus : )=0A=
=0A=
The patch applies to zeus branch as is without conflicts.=0A=
Should still resend it separately for Zeus?=

