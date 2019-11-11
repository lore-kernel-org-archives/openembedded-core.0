Return-Path: <gtertych@cisco.com>
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	by mail.openembedded.org (Postfix) with ESMTP id CCCAD7ED7E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 12:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2023; q=dns/txt; s=iport;
	t=1573475387; x=1574684987;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=TXAyhK+vK2oRiUTJInUypB2ERaUfn3xAZOlh424VdL0=;
	b=BygsxhLn27iWn3MtugzAkEMSFdU3O9SxYgbNBlOVWkSSON9GMsQQG4t9
	Inbu00MHnmVxBwQtwQLVLwSaZLv75INeYb+WXFcf19Zre6TsC0Zl+QEiw
	+qoOb3laAXjx56MLie4aeyr/bSlAHOWOqs9l8617X7Dt2gi1upEn0iojD Q=;
IronPort-PHdr: =?us-ascii?q?9a23=3AGaWavBzz8uvdUijXCy+N+z0EezQntrPoPwUc9p?=
	=?us-ascii?q?sgjfdUf7+++4j5YhWN/u1j2VnOW4iTq+lJjebbqejBYSQB+t7A1RJKa5lQT1?=
	=?us-ascii?q?kAgMQSkRYnBZuKFUDhMO/hbwQxHd9JUxlu+HToeUU=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AJAAB7U8ld/5JdJa1lGgEBAQEBAQE?=
	=?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFqBQEBAQELAYFKUAWBRCAECyqHbwOEWoYPgl6?=
	=?us-ascii?q?YAIEugSQDVAkBAQEMAQEtAgEBhEAChBQkNAkOAgMLAQEEAQEBAgEFBG2FNwy?=
	=?us-ascii?q?FUQEBAQECARIuAQEyBQEECwIBCBEEAQEvMh0IAgQBDQUIGoVHAw4gAaEdAoE?=
	=?us-ascii?q?4iGCCJ4J+AQEFhQcYghcJFIEiAYwTGIFAP4FXgkw+hEUCg0CCCiKNAYhyYJd?=
	=?us-ascii?q?BCoIllV+ZeS2OGpl2AgQCBAUCDgEBBYFSOYFYcBWDJ1ARFJA2g3OKU3SBKI1?=
	=?us-ascii?q?pAQE?=
X-IronPort-AV: E=Sophos;i="5.68,293,1569283200"; d="scan'208";a="370047436"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
	by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	11 Nov 2019 12:29:46 +0000
Received: from XCH-RCD-003.cisco.com (xch-rcd-003.cisco.com [173.37.102.13])
	by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id xABCTkWX004479
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 11 Nov 2019 12:29:46 GMT
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by XCH-RCD-003.cisco.com
	(173.37.102.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 11 Nov 2019 06:29:45 -0600
Received: from xhs-rcd-001.cisco.com (173.37.227.246) by xhs-rtp-003.cisco.com
	(64.101.210.230) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 11 Nov 2019 07:29:44 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (72.163.14.9) by
	xhs-rcd-001.cisco.com (173.37.227.246) with Microsoft SMTP Server
	(TLS) id
	15.0.1473.3 via Frontend Transport; Mon, 11 Nov 2019 06:29:44 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=G9OoV0pmfykbmPSo/TzA4EX6CxkOAMvhJb9ZdzT44UIZUEmM/dxxFBWal1SqVzc7gDALaisGp/KRKG4auQsBXRiKXJ/TGQSu7QQ4NV6HX7EpwBwSfEuPDEnT7u8Ra8+FbMEPD3sp4Rq4UuoTN6JdgNvtQX3qka5eQk7hgheFJm37HZbpR3wa6xwPRsUlvyhGYiN+wf/sJFliDlDmsD5+P0Au9OWvokjEsgcOHn2DMPZLVdZnJ8mXVq7lVx5XewNzDZyo0QzBu4vop9JJbysiRbeEPuO0zas0hBYOK+BOESZLvlM5E2SKTncpeaq+PsoqVgJ03CMtlMcHzD65BITxAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XlZHmgMsf6qP0idahQ9L0o1awVeIbud/vkdTiZERQtg=;
	b=dtL/jgnBzwVMsKtW5mEIFBkJH0BQHKFbz/gJYmq6al/2EHoQnnDFc2vVmqItpxPzHq1NNvZx9adJiXrkvEB9hT5j4z1P5hei1+qyfG0cdSjvtDmKvDvqDmwM47QV8iio1hNpGCc6VxEJxbEAyowkp+QLg78Fr4qE+7MnKSFYLSN33N0f6iixKzKuquepNAxkpxpPLXJKuk/ieVJksp31XvaPYt+GAmMJt+BStgKHumhFvazn7WyeryLnXG49d7UPh1nH5q+qpnx8WXCqHV6AsTCdcU8xmguOzY7+WvjK0uhQ9GBMR8veQqbExAGOTKxr72NALzRPU2dBNJMf+YtiOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com; 
	dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
	s=selector2-cisco-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XlZHmgMsf6qP0idahQ9L0o1awVeIbud/vkdTiZERQtg=;
	b=uvgL0GlRA2Cv/arEx0XWXhVUoZaMhA9xvK6iBrg2niLxBF05w++5MBwILxQ3YwFMUlOTUsj0cgknc/JMvlvnBuTTyrhTkSKHpkwGqDoz/nsYf6E4F2+SBrCAG6w/bYMbLsvpUygM/xFD3u+DTd0KiXiEtkVbI8LEtilxu0IDB1c=
Received: from MWHPR11MB1918.namprd11.prod.outlook.com (10.175.54.17) by
	MWHPR11MB1806.namprd11.prod.outlook.com (10.175.53.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2430.20; Mon, 11 Nov 2019 12:29:42 +0000
Received: from MWHPR11MB1918.namprd11.prod.outlook.com
	([fe80::cd30:1483:29a0:2ee4]) by
	MWHPR11MB1918.namprd11.prod.outlook.com
	([fe80::cd30:1483:29a0:2ee4%11]) with mapi id 15.20.2430.027;
	Mon, 11 Nov 2019 12:29:42 +0000
From: "Grygorii Tertychnyi (gtertych)" <gtertych@cisco.com>
To: Andrei Gherzan <andrei@gherzan.ro>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] archiver: avoid empty incfile in ar_recipe
Thread-Index: AQHVkINrSPE3wsUkS0qsZp7uiCiFxqd2LdcAgATq/miACsm8AIAADyr1
Date: Mon, 11 Nov 2019 12:29:42 +0000
Message-ID: <MWHPR11MB191859E56C1EFF2D300698FCC2740@MWHPR11MB1918.namprd11.prod.outlook.com>
References: <20191101071043.16558-1-gtertych@cisco.com>
	<CAK18fxFVpCbD38Y3FK2XMfvK_+pZF2-usf1xC5P2oR5FQhQC-Q@mail.gmail.com>
	<MWHPR11MB1918D426CB1703852C320064C27F0@MWHPR11MB1918.namprd11.prod.outlook.com>,
	<8903613c-b2ea-f9f1-9e68-feb5302184d7@gherzan.ro>
In-Reply-To: <8903613c-b2ea-f9f1-9e68-feb5302184d7@gherzan.ro>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=gtertych@cisco.com; 
x-originating-ip: [2001:420:c0c0:1001::3f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f50bf948-4c90-4309-e919-08d766a2d40c
x-ms-traffictypediagnostic: MWHPR11MB1806:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1806551E5D4AC96E4AEA427FC2740@MWHPR11MB1806.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(199004)(189003)(5660300002)(14444005)(33656002)(7696005)(52536014)(256004)(76116006)(91956017)(8936002)(2906002)(8676002)(6116002)(66946007)(66476007)(64756008)(66556008)(81156014)(81166006)(2501003)(71200400001)(71190400001)(66446008)(9686003)(53546011)(107886003)(6436002)(6246003)(6506007)(25786009)(99286004)(478600001)(4326008)(186003)(102836004)(86362001)(55016002)(76176011)(316002)(110136005)(14454004)(229853002)(11346002)(7736002)(446003)(305945005)(486006)(74316002)(476003)(46003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR11MB1806;
	H:MWHPR11MB1918.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qfDr4RwYJ9xhbwCDWpLTJInmOGHzQBBHSYyii6lqOiGaJG1nu2MmT7FBISN9tOYViFwI2HpmqFUkxiSs471a4kIdEYXxY+wDmB7+fXKSlp9bNYNMVypUaXPwzEdRghW7l+OQa7lkbyTQCjDfwv0CJFpbm1sJOhP2kgchhGU4fcdupgI8L6u8GK7Igz8n4TxOXgL315+clFUVCU1PgA1aY8n5apOVcYdUdlsyk/TGHHpTWJnpNxrBjhG1K0ORKXHih870y3/WZPI8UfZy6K2sndN7tJr2OnTCl8sLyY/SbK8zY5bgmSQlkP6jnA13lQ8UMBi1EP9l/7Tets4avnhJESxYSxwDUBuW4KZf0P74p0nsmjlozTytsWn3yyzCecOaiJl/Ya7C5uuQ1ltw5kXPw469WabkHi5aVUYofPbHWpJBRoyLMnWtVFROl5RP6YrF
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f50bf948-4c90-4309-e919-08d766a2d40c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 12:29:42.3176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fvBRKssVk0Xb8Qv7CNqDxf5yBgREVTfY/hiE0E2QRKjtrHOXPo+WQvAi/0/VP8WknsXZzLOyzW2ZVbXXMPZnOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1806
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.13, xch-rcd-003.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com
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
X-List-Received-Date: Mon, 11 Nov 2019 12:29:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Andrei,=0A=
=0A=
From: Andrei Gherzan <andrei@gherzan.ro>=0A=
Sent: Monday, November 11, 2019 13:18=0A=
Subject: Re: [OE-core] [PATCH] archiver: avoid empty incfile in ar_recipe=
=0A=
=0A=
>> Not sure I understand. Archiver class does not interpret "include" direc=
tive.=0A=
>> It just parses text files. The regular expression looks correct:=0A=
>>=0A=
>> These lines:=0A=
>>=0A=
>> 440         elif include_re.match(line):=0A=
>> 441             incfile =3D include_re.match(line).group(1)=0A=
>>=0A=
>> put "${...}" _string_ into "incfile" variable. So, "incfile" is not None=
 at "this stage.=0A=
=0A=
> "${...}" it's already expanded to a white-space. So in that case it=0A=
> matches "include  ".=0A=
=0A=
No. "incfile" is not expanded here, it actually contains "${...}", e.g.=0A=
${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.inc', '', d)}=
=0A=
=0A=
>> Then,=0A=
>>=0A=
>> 443             incfile =3D d.expand(incfile)=0A=
>>=0A=
>> Now "incfile" is empty and nobody checks it.=0A=
=0A=
> incfile is not empty. It's actually a string containing one white-space.=
=0A=
=0A=
It is actually empty, e.g. "".=0A=
=0A=
>>=0A=
>> 444             incfile =3D bb.utils.which(bbpath, incfile)=0A=
>>=0A=
>> Now "incfile" is set to first directory name in BBPATH (wrong behavour?)=
=0A=
>>=0A=
>> 445             if incfile:=0A=
>> 446                 shutil.copy(incfile, outdir)=0A=
>>=0A=
>> Exception here: "incfile" is directory, not a file.=0A=
>>=0A=
=0A=
> The include regex is the following:=0A=
> =0A=
> include_re =3D re.compile( r"include\s+(.+)" )=0A=
> =0A=
> The issue is that when this is matched on a string suffixed with only=0A=
> spaces, it will match the last space as group(1). This is because ".+"=0A=
> forces to match the last white-space. Changing that to ".*" will make=0A=
> the group(1) be an empty string and later the if will evaluate False.=0A=
=0A=
I don't see how it helps here.=0A=
=0A=
-- =0A=
Grygorii=0A=

