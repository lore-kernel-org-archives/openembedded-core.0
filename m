Return-Path: <gtertych@cisco.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Nov 2019 05:42:49 UTC
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8717FC46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 05:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1550; q=dns/txt; s=iport;
	t=1573537371; x=1574746971;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=KpoxQowY2x345Uohel71rnw68WWRQUdS8/uBQ03T+W0=;
	b=mCxUMQXRPlB/r2X6E82hjFFyesE8KqtlzOOK34upUsa+vlymqnpB78qM
	qKrQEnXLLjh5PwyJFAcC5BJVuIJH5jrDsf3LYZj0AeaR4v4xP1zXAlIp+
	kJHkfJcn7CVW7VZajpC2+WlruGRwFtBiwmqR9hNCJSQZHTQqKV53zJZca c=;
IronPort-PHdr: =?us-ascii?q?9a23=3A4L6VFxV8YydJ9x4X5KfBiMEZqOjV8LGuZFwc94?=
	=?us-ascii?q?YnhrRSc6+q45XlOgnF6O5wiEPSA9yJ8OpK3uzRta2oGXcN55qMqjgjSNRNTF?=
	=?us-ascii?q?dE7KdehAk8GIiAAEz/IuTtank1AMlYSE5u/1mwMFNeH4D1YFiB6nA=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ApAADiQ8pd/5NdJa1lGgEBAQEBAQE?=
	=?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFtAgEBAQELAYFKUAWBRCAECyqHbwOKaoJemAC?=
	=?us-ascii?q?CUgNUCQEBAQwBAS0CAQGEQAKEFCQ3Bg4CAwsBAQQBAQECAQUEbYU3DIVRAQE?=
	=?us-ascii?q?BAQIBEi4BATIFAQQLAgEIEQQBAQEuMh0IAgQBDQUIGoVHAw4gAaJ8AoE4iGC?=
	=?us-ascii?q?CJ4J+AQEFhQwYghcJFIEiAYwTGIFAP4ERRoJMPoRFAoNAggoijQGJUpdBCoI?=
	=?us-ascii?q?llV+ZeS2OGpl2AgQCBAUCDgEBBYFoI4FYcBWDJ1ARFJA2g3OKU3SBKI1BAQE?=
X-IronPort-AV: E=Sophos;i="5.68,295,1569283200"; d="scan'208";a="657055143"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
	by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	12 Nov 2019 05:35:42 +0000
Received: from XCH-ALN-005.cisco.com (xch-aln-005.cisco.com [173.36.7.15])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id xAC5Zgvp023174
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 12 Nov 2019 05:35:42 GMT
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by XCH-ALN-005.cisco.com
	(173.36.7.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 11 Nov 2019 23:35:42 -0600
Received: from xhs-rcd-002.cisco.com (173.37.227.247) by xhs-rtp-001.cisco.com
	(64.101.210.228) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 12 Nov 2019 00:35:41 -0500
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (72.163.14.9) by
	xhs-rcd-002.cisco.com (173.37.227.247) with Microsoft SMTP Server
	(TLS) id
	15.0.1473.3 via Frontend Transport; Mon, 11 Nov 2019 23:35:41 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=TVaudWZhOd7zTn88KVg9mViJA80uDTr9bAWCUDV5PBTtM1TjRgGB8hQxlkXUkgGZSksyEf2K8QFfF5g6vCJNQELEVnPRxCwHDbv5/APCaM6RYZ4prysnYYP6NX7CRJy3IQYS5mNzMKcOmKjKGL33vm0XjSi0vOISlQXiLf8W4+A6bKLi/eV/W1uAhiuCKfg387JM6fU8NNdhXqOkaXOg900zIpElU/XU6CeU4fX6XacECtXeaUnByxz52h/zRvpwRHudq122E30FImHmoA9EJHy27aaJOgX2uXRI1ft+uce9wdXDakIASygA+/kLrmbh5xTL26Nptst6FUR4/oVkTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zhjQWMGGogc4PSLPI4W/I9u+FXs2hZqr4DVQzNmft+A=;
	b=SkuqtPQGNRvP1j5zLPztHQxK8hnrCInZm44lBhRF9kIihv56O3ZJEAeqdtZMHaqh+LZRY3t2mZIBPZ9zekTV+MYhQ4MILu+zgWSo9O2iIUjF8THw9jBKn0b4tdTdgP1n0/M3UJaDMPN8WeksKR8mnLTTv5gh41dTRqcP7VYbgfaJKCKNCANcCcUDBqF5XEvpzGwyblmPMwC5A/prMFOA1QU5oJGTPSaThoST8SyTF8V23qS4ld4XFbebY4lR9E31TE/+X4c8yol9DcAW7Quj6vsNYoy5d0kNNFxg6l0BWBgVLXWG4PychwkJhiEHMsoMo1ZzwU4AMkauzHh4Npx2PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com; 
	dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
	s=selector2-cisco-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zhjQWMGGogc4PSLPI4W/I9u+FXs2hZqr4DVQzNmft+A=;
	b=xwLKjawHu5bGoIAac8kk08v7gwqJUjOl+eqfBYOvsvFALZhqUU5KhhKh26NCLBY9rZhTMYD8iOmfZtXwWRWEnUUfQpf9qSeIr6NcH9MAMxK40OlVI6FE/7vz8vqHYWc4PIAmFKgetrVMlpZ5z2e/1aok+7H9o74tahUUkMuVrtk=
Received: from MWHPR11MB1918.namprd11.prod.outlook.com (10.175.54.17) by
	MWHPR11MB1469.namprd11.prod.outlook.com (10.172.54.16) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2430.20; Tue, 12 Nov 2019 05:35:39 +0000
Received: from MWHPR11MB1918.namprd11.prod.outlook.com
	([fe80::cd30:1483:29a0:2ee4]) by
	MWHPR11MB1918.namprd11.prod.outlook.com
	([fe80::cd30:1483:29a0:2ee4%11]) with mapi id 15.20.2430.027;
	Tue, 12 Nov 2019 05:35:39 +0000
From: "Grygorii Tertychnyi (gtertych)" <gtertych@cisco.com>
To: Andrei Gherzan <andrei@gherzan.ro>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] archiver: avoid empty incfile in ar_recipe
Thread-Index: AQHVkINrSPE3wsUkS0qsZp7uiCiFxqd2LdcAgATq/miACsm8AIAADyr1gABb1gCAAMVkOA==
Date: Tue, 12 Nov 2019 05:35:39 +0000
Message-ID: <MWHPR11MB191824A2595CC0FB519BEE55C2770@MWHPR11MB1918.namprd11.prod.outlook.com>
References: <20191101071043.16558-1-gtertych@cisco.com>
	<CAK18fxFVpCbD38Y3FK2XMfvK_+pZF2-usf1xC5P2oR5FQhQC-Q@mail.gmail.com>
	<MWHPR11MB1918D426CB1703852C320064C27F0@MWHPR11MB1918.namprd11.prod.outlook.com>
	<8903613c-b2ea-f9f1-9e68-feb5302184d7@gherzan.ro>
	<MWHPR11MB191859E56C1EFF2D300698FCC2740@MWHPR11MB1918.namprd11.prod.outlook.com>,
	<a3087f36-4cfd-de8d-948f-7e3c56b7cfc8@gherzan.ro>
In-Reply-To: <a3087f36-4cfd-de8d-948f-7e3c56b7cfc8@gherzan.ro>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=gtertych@cisco.com; 
x-originating-ip: [2001:420:c0c0:1001::18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb6451b5-a54e-4b76-8286-08d76732270b
x-ms-traffictypediagnostic: MWHPR11MB1469:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1469E8831AD27D3033374582C2770@MWHPR11MB1469.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(189003)(199004)(478600001)(74316002)(229853002)(102836004)(305945005)(110136005)(8936002)(186003)(6436002)(14454004)(99286004)(76176011)(5660300002)(7696005)(9686003)(476003)(46003)(53546011)(52536014)(4326008)(6506007)(7736002)(316002)(446003)(86362001)(11346002)(25786009)(486006)(2501003)(8676002)(107886003)(71190400001)(71200400001)(6246003)(66446008)(6116002)(55016002)(256004)(2906002)(66946007)(76116006)(91956017)(64756008)(66556008)(66476007)(81156014)(81166006)(33656002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR11MB1469;
	H:MWHPR11MB1918.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZD1XqpGckTcIP/+uKt3v32vK5H/ICQ7BXbqtBmkg4jwQJ3hD/cIhX2r1fSraH4N0t1/STW21ulxqdyC/YmsbiVPPxsUTRFkjlpFNMgYrgPphtjxGTrSEx93Y650QNK+eRNPJbTlTabysDGpQa0w4am0x2SXtqw8v+xxmzu0Cat0pXbDzx8QIQwEUS9ZjNxR0KbSXsKxXE8WYysoA6K/ZNoEgJtGP0dFkf5Q0g3AFaXY7RlYe0SiLGaLaYU29qQ2YGZM+aHehi9adqiFghmZ/F/eSmpIDJkrdfFC3jmr97sT6zsEUjriD3+8ttNslnvnOQMQCLY0ZeXX3huhGGLWd7MKiqkiVQf3G4aDJ1uVm9fPdehz+/OZSNKjDqwyQkVdi8FC6ZDAPSbjT7AkqA+3G78UMr/VsW0fsEpCphkfk2e6RoBgIwqc8M67EMmH6JW8U
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6451b5-a54e-4b76-8286-08d76732270b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 05:35:39.5466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kh2IgQPun8BMGTo8Qr2N/A6OI3EMYl1o5LTK/oz8OqiF58VJKj7ZCRTuWi/eLiRhF1iV68289MSSQQvR9JuLBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1469
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.15, xch-aln-005.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
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
X-List-Received-Date: Tue, 12 Nov 2019 05:42:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Andrei,=0A=
=0A=
On Monday, November 11, 2019 19:41, Andrei Gherzan wrote:=0A=
=0A=
> Hi,=0A=
>=0A=
> On 11/11/2019 12:29, Grygorii Tertychnyi (gtertych) wrote:=0A=
>> Hi Andrei,=0A=
>>=0A=
>> From: Andrei Gherzan <andrei@gherzan.ro>=0A=
>> Sent: Monday, November 11, 2019 13:18=0A=
>> Subject: Re: [OE-core] [PATCH] archiver: avoid empty incfile in ar_recip=
e=0A=
>>=0A=
>>>> Not sure I understand. Archiver class does not interpret "include" dir=
ective.=0A=
>>>> It just parses text files. The regular expression looks correct:=0A=
>>>>=0A=
>>>> These lines:=0A=
>>>>=0A=
>>>> 440         elif include_re.match(line):=0A=
>>>> 441             incfile =3D include_re.match(line).group(1)=0A=
>>>>=0A=
>>>> put "${...}" _string_ into "incfile" variable. So, "incfile" is not No=
ne at "this stage.=0A=
>>=0A=
>>> "${...}" it's already expanded to a white-space. So in that case it=0A=
>>> matches "include  ".=0A=
>>=0A=
>> No. "incfile" is not expanded here, it actually contains "${...}", e.g.=
=0A=
>> ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.inc', '', =
d)}=0A=
>=0A=
> Give me a simple way to reproduce this.=0A=
=0A=
1. Put two lines to local.conf=0A=
% cat <<CONF >> conf/local.conf=0A=
PACKAGECONFIG_remove_pn-perf =3D "scripting"=0A=
INHERIT +=3D "archiver"=0A=
CONF=0A=
=0A=
2. Run do_ar_recipe for perf=0A=
% bitbake -c ar_recipe perf=0A=
=0A=
3. Observe the output error:=0A=
Exception: IsADirectoryError: [Errno 21] Is a directory=0A=
=0A=
-- =0A=
Grygorii=0A=

