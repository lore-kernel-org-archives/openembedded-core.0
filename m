Return-Path: <bartlomiej.kucharczyk@nokia.com>
X-Greylist: delayed 10796 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 May 2016 22:20:27 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0142.outbound.protection.outlook.com [157.56.112.142])
	by mail.openembedded.org (Postfix) with ESMTP id 78FD9731E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=1qnTg2H5WuEAy1oB5g0ZZ9apH8I7kCGk0eFedq+gXJc=;
	b=OJY7FFSEGnAVzhqxVs6GhN1T+IcXVx3Zn1cmD60PHBsw54BSbhs56N6LMFjf9VZTlPjAPCH9HxyBRn31t4WPRXmg9hQ6urTpRxIgVMywe7Ll5GWgjaFpqct4PnCgejzx7tjLId28MLp9MnFRW8D5DgQUD4QXRLVSn4ps6v8DXGo=
Received: from DBXPR07MB239.eurprd07.prod.outlook.com (10.141.11.18) by
	DBXPR07MB239.eurprd07.prod.outlook.com (10.141.11.18) with Microsoft
	SMTP Server (TLS) id 15.1.466.12; Thu, 5 May 2016 18:48:34 +0000
Received: from DBXPR07MB239.eurprd07.prod.outlook.com ([10.141.11.18]) by
	DBXPR07MB239.eurprd07.prod.outlook.com ([10.141.11.18]) with mapi id
	15.01.0466.029; Thu, 5 May 2016 18:48:34 +0000
From: "Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw)"
	<bartlomiej.kucharczyk@nokia.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: How to force BitBake to track dependency to METADATA_REVISION?
Thread-Index: AdGm/HmzYSUtO8YdRD+Yb3Ba5Zji7A==
Date: Thu, 5 May 2016 18:48:34 +0000
Message-ID: <DBXPR07MB23993DC9B9946851B629E21F97C0@DBXPR07MB239.eurprd07.prod.outlook.com>
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nokia.com;
x-originating-ip: [131.228.2.18]
x-ms-office365-filtering-correlation-id: a69bf1b9-9598-4651-79d4-08d37515dcbc
x-microsoft-exchange-diagnostics: 1; DBXPR07MB239;
	5:5Ozrlpum9ch5XNk2YBHKLs1NxrgEGWWYXvCOey5BWGL7XDaefqnOVe1K3UwEYK39bvXBQCSIvnrH048rrUo8YDXJGBFSWy/ZQ/om5kzRtcFzv0wwgAWh9KVfLX9WpZYiIEVRpk+dJXgQyx1rySyMHVOaHzQZz68wQbQd6eon7FccD+0VVvR+5DuCxZ5WXSX5;
	24:vdz4Y/bCrHpOnl6ziLwCUNH29VIEkBpvLCqTyin7nPjuU5kxIveEtSiWvIk7UfUIzIxd8wgNKKBUGyUMTKkCpVXKjE24oW3ql7cEVsFI1k4=;
	7:CmgLIFJvRsNTYy8BFZTGDJGHPL1HeTrHBGi590N6KHsl4XrBNwLjO6O0aE8Ehj66hXJYI061fOG3M/5RupFp926sCbZ534AfxYodU/kBCyqSA8eJ2H4Rb1r9N4tETdV/XilDOJjJ1Fq7+atyEWABYyXNWKXM8x9bybeQdPuWT8Ly1hvH5scPZO24w5OQXycpTISf5shda5rQLq07F1/rc8+XLCbZd4gmnwCQMPPsT9k=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DBXPR07MB239;
x-microsoft-antispam-prvs: <DBXPR07MB2396BEB6D8CFFBE04241390F97C0@DBXPR07MB239.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(9101521098)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:DBXPR07MB239; BCL:0; PCL:0; RULEID:; SRVR:DBXPR07MB239; 
x-forefront-prvs: 0933E9FD8D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(1220700001)(3280700002)(5002640100001)(6116002)(2906002)(189998001)(3846002)(92566002)(11100500001)(3660700001)(229853001)(74316001)(86362001)(5004730100002)(102836003)(450100001)(33656002)(586003)(81166005)(5008740100001)(122556002)(54356999)(66066001)(50986999)(110136002)(107886002)(77096005)(87936001)(5003600100002)(19580395003)(10400500002)(76576001)(9686002)(8936002)(2900100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DBXPR07MB239;
	H:DBXPR07MB239.eurprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2016 18:48:34.5599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBXPR07MB239
Subject: How to force BitBake to track dependency to METADATA_REVISION?
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
X-List-Received-Date: Thu, 05 May 2016 22:20:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello!

I am trying to use METADATA_REVISION variable (defined in metadata_scm.bbcl=
ass) in my recipe, but BitBake does not rebuild the task when git revision =
of the repository changes.
Setting [vardeps] does not help.

I suspect this may be related to the fact that METADATA_REVISION is defined=
 this way:
	METADATA_REVISION ?=3D "${@base_detect_revision(d)}"
And BitBake does not expand this to the proper value, thus does not see any=
 difference.

Does anyone have any suggestion how to tackle this issue, and force BitBake=
 to properly track dependency to METADATA_REVISION value?

My original task is:
Package feeds/SDK installers are versioned (git metadata revision). I am tr=
ying to create an opkg.conf file which will contain such versioned package =
feeds URL in SDK installer. For build reproducibility, and user convenience=
.

Thanks in advance!
Bartek

