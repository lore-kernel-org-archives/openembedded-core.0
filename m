Return-Path: <nageswaris1@verifone.com>
Received: from p02c11o143.mxlogic.net (p02c11o143.mxlogic.net [208.65.144.76])
	by mail.openembedded.org (Postfix) with ESMTP id 8D9B674242
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 10:26:25 +0000 (UTC)
Received: from unknown [192.30.113.167] (EHLO VF2LXSECMAIL1.verifone.com)
	by p02c11o143.mxlogic.net(mxl_mta-8.5.0-1) over TLS secured channel
	with ESMTP id f476a065.0.85439.00-324.146445.p02c11o143.mxlogic.net
	(envelope-from <nageswaris1@verifone.com>); 
	Tue, 29 Sep 2015 04:26:30 -0600 (MDT)
X-MXL-Hash: 560a675655307cb5-a27f90f7bb73c33c84411dd137f6798622905c5d
Received: from na01-by2-obe.outbound.protection.outlook.com (unknown
	[207.46.163.236]) by VF2LXSECMAIL1.verifone.com with smtp
	(TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	id 431f_3b2b_7d1c2275_25af_4fb1_9d5a_5d63291a3bb5;
	Tue, 29 Sep 2015 06:26:22 -0400
Received: from BY2PR03CA008.namprd03.prod.outlook.com (10.255.93.25) by
	BN1PR03MB155.namprd03.prod.outlook.com (10.255.201.24) with Microsoft
	SMTP Server (TLS) id 15.1.274.16; Tue, 29 Sep 2015 10:26:20 +0000
Received: from BY2FFO11FD024.protection.gbl (10.255.93.4) by
	BY2PR03CA008.outlook.office365.com (10.255.93.25) with Microsoft SMTP
	Server (TLS) id 15.1.274.16 via Frontend Transport;
	Tue, 29 Sep 2015 10:26:20 +0000
Received-SPF: Pass (protection.outlook.com: domain of VERIFONE.com designates
	209.198.197.22 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=209.198.197.22; helo=VF2WVEXET2.verifone.com;
Received: from VF2WVEXET2.verifone.com (209.198.197.22) by
	BY2FFO11FD024.mail.protection.outlook.com (10.1.15.213) with Microsoft
	SMTP Server (TLS) id 15.1.274.4 via Frontend Transport;
	Tue, 29 Sep 2015 10:26:20 +0000
Received: from vf2wvexcaht4.verifone.com (10.71.199.104) by
	VF2WVEXET2.verifone.com (10.71.128.101) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 29 Sep 2015 06:26:08 -0400
Received: from VF2WDEXMB3.verifone.com ([fe80::2d79:a18b:1d3d:af0c]) by
	VF2WVEXCAHT4.verifone.com ([::1]) with mapi id 14.03.0248.002;
	Tue, 29 Sep 2015 06:26:07 -0400
From: Nageswari Srinivasan <NageswariS1@VERIFONE.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: package_do_shlibs failure
Thread-Index: AdD6oUIpwhphwD7YQW2ORVoBBDzstg==
Date: Tue, 29 Sep 2015 10:26:10 +0000
Message-ID: <6CC83472A885EA4DB329C78841C5245913123EA2@VF2WDEXMB3.verifone.com>
Accept-Language: en-IE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.71.196.102]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD024;
	1:r4pEf8uwIiQnecXqIxjr/8+JLQghrJTBqB25I3M1xqNWWhPvRFMHKOTUeJ48arai8DvlxHjzYzc4zRZAJvrKADOBiXPkxR0ipWxoeZR6wFgk7emyVELWJgY3qSCewCp4AbxI3gVjwWd0ck3VemLFUowzB9WZuwy9ixtUxwaZk9gwaftNQok1XvC/kyQBqHH8IdRJtHgapllibzv+jJnkUeYUM0salTziJcgFmrd3JsCdpkAvHZZSYk0in+OhACqBY9xPUvlo0jM143tw2m71NEGOxg/UBMByMqQOGtYkf3c8nx0gpM/SwwrGjEqub9aokdrbbPY/zgiohkvy26wC3A==
X-Forefront-Antispam-Report: CIP:209.198.197.22; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(189002)(374574003)(199003)(87936001)(11100500001)(92566002)(102836002)(4001540100001)(5250100002)(5004730100002)(84326002)(19580395003)(189998001)(2501003)(5001860100001)(5890100001)(6806005)(5007970100001)(5003600100002)(64706001)(5001830100001)(5001970100001)(106466001)(512934002)(110136002)(107886002)(2920100001)(2900100001)(53416004)(229853001)(16796002)(26826002)(2351001)(77156002)(16236675004)(33656002)(86362001)(2930100002)(54356999)(50986999)(450100001)(55846006)(46102003)(62966003)(7099028);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR03MB155;
	H:VF2WVEXET2.verifone.com; FPR:; SPF:Pass;
	PTR:vf2wvexet2.verifone.com; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB155;
	2:MsiX6e/KmaGDt9rknDNA5aDb9NLHXUm4i6IsyRZ5lCdob6s+8gkCtHM1Vu+Twq3r3SyaXNjL31gK32uCj4hWwRhhu0bm/acPzYfl+FtvcJvRiRhUyigexFX/qvsjZW/nhtMO7x+qTPs0TsjCd7uIk35UtM0oeZT6mlmw2SP/cMc=;
	3:0k8+lp8a6Bg2tTRXubT9jW1/eBvzklkDpjceUhukT3+eabKX912+yCaZGmlqmrKT6wEasiZ28dPHLefHTEbiPYsC0Oe6/ZpEHu9r11Ky9xWekKDFyZpFFLAWiXYa//1cMHaaYFacWturwdW6hDW9usk99R3k2o74y0/MoeHyl/SmDH53RPgI4NbX/HEhtb39aiAjA7/mCtQ0g+rU6EpjqrbZZDNacS7C95eUdtv6js61PFAXb67sMBQRthI+T+/BOFMFNrfc7nAuqGza/hHSKw==;
	25:t82YIKUO9iVLpkP15SIsatOdwk6qEh551KAG+i/pZZmy92RcphXAMSpuq35S/BJI5RLYfDGJ7ksUW8V/amGpVW0ngVgUn8fixCrAsZaTDsOfJ7yQCbR8GtC83aYym3PtpMQ3KY1+y5dTqX0eQhOJ+J2B8PeDvsC6lxRxcmSshxiDclIEJL2fwFlu2V/I/EuERM1Gn5VNiSRoUg7s2zfJXnErVt+WxIv4fdZTdw9ZRZTaQiPHlBNRIXsiVw79NdKTvoIsnk0S4Kyj3JXyzEMwzQ==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501001);
	SRVR:BN1PR03MB155; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB155;
	20:BKkOYb+oaVym43pgl0z+YbjqOOI49JTIb+z8/Zf0l9PToGJYZde9aiiUjwqjMyHvfOS0QS0qwnb702tcZ6b7Fh7FPQFyoWDfTliJDn2lHZbbFQ/Xdj4SqVSbQUt4Qc4whIFDVxoTnF3JuEeYDWffa2a4NWV2+r7h8tEIW1VPkHZTs4MBppzp5nx3IpzhfBYL7pzU1kWScLBqya7jgb6n9798KXEs2QjW3YLShwPpsnJeDZCI0luXXcP5yAC6ZmLqj1XtB0BZ1JjanecAIwTjX0SZNgtThZ5Ff+Ud76huEOcF4sTk2gbRzt3oD/Sfog1wk49zuvLPm8Hl5d50q4WBvEj6H3MR1mIS4fk15ETxHjsg75Bj6GSOLUybZFhmBS+0gLCSpQHGnx5/SUnxCtg9RdZ6VUWQtozJvO/9bK8wxr27FZEUlv5JR+JbzAH8DimNLZJfrUYTJXqyQeFIngUdnQfhs6MTK6EPHXMp1e9LnmT3Egor2kOrMyS5W/7mUNyD;
	4:eGmYVkPlNv9NebHUuBj+RAWwi102fPlV1c8y69YkL1OEFcReCncPfwhJbnaay1lvr54C93gQBbLkFEKF4qVkbBJocTFqqOvpRMMiNdv89Uz9+pzO8h+iPnkFvBdxdUR3gjAEV8yy0PSABD7nQ3Xv2nFqzE99F6Resa2yy+8+tXKZi085er/9PG4u9Ej7jhmHKNDTS2FO5UtXHUjged2Wu2DBAFQbbiYzK+C36+fbbhqCTVP9/onIeoBQG6PkG+/WhOWFUHhhSiqjne2Qd4qXBlLAZlSwia3piveR4kvVXF1B16K5uzCgUu977jnqfF7soeLS4AQYuXqn5QW5tNwaGn3Tmp0dTzSKieKkV2HMVxA=
X-Microsoft-Antispam-PRVS: <BN1PR03MB155865530C1CA431B5F7A7F8E4E0@BN1PR03MB155.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001);
	SRVR:BN1PR03MB155; BCL:0; PCL:0; RULEID:; SRVR:BN1PR03MB155; 
X-Forefront-PRVS: 0714841678
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR03MB155;
	23:/8LLv7MJohOxJi5Xb8z1V78FE4lxOrX1w6o6qi7bjC?=
	=?us-ascii?Q?XXP3JYFSA3beEahTIDCF3BJbjZAFcKzIGUd51qw/elwOeYapyrIb8J7BFXwI?=
	=?us-ascii?Q?XbNs4pfmAFcULNyOmUksZd4zchk4c1ykXzQSE/M4xnM32KTmaTj05Gp+sUP0?=
	=?us-ascii?Q?8vtDCLlFJ0y3e72xlzzBiL2O1Ic9nmPLFAI8g3ScGE2ki4SV6bhuncQYgOD9?=
	=?us-ascii?Q?HyYkFg7nxkQws1tN/iQHxjZS1M8Y7dGXrOahS0CYuEE+EbBQx8M8hCTZQ+3F?=
	=?us-ascii?Q?8pzDXB3bSNAdoyBAwwr4mB9wdhE8KTsClkIVAcEW8055PuL+rgL2pUHTraJk?=
	=?us-ascii?Q?kq3Ix7PrSm/7Bq2Yz2MR67GYt3aLwEvPyQTpWqLFmoX1+7fLT6NCl0lczTgc?=
	=?us-ascii?Q?5do+9f1ptjb8jviPn2g/vOFG7iSUqQDhhhcSp6KcPxzyd+a9HphoZD89UW9Q?=
	=?us-ascii?Q?Q7Prpy8ThIDXSI67sagtIIicn9Zon0Bj8Mgs2ArZLs1w52TkEZJAIHEhsSUW?=
	=?us-ascii?Q?xV4XZGQCC9+Gy3eSKMc0PpVepIllN4NG6em7lHAvL/DewhB7fEY5DAS4bWS/?=
	=?us-ascii?Q?a9Xj1TtU0hdK2XKHLQnAo9qb+QhEcOY1Q640x385an2p8xIivD1ophAjV5rk?=
	=?us-ascii?Q?kflg/opxYRxyCE/m2osKifBv/2xfkjCb/Nq8nWFWMdvJMt5upEPmpVt9IWaj?=
	=?us-ascii?Q?0Hn+tRs2YRg+6vQd5XxxxYveLnqqdRjtrE1w6LSdw6HMV336Otks/rOfQj/4?=
	=?us-ascii?Q?9N4zriDQ5RseT0bclBsM+jCNLU8O8o31egFCOBAwHVu7oNmM4pzW6cQZ2LCP?=
	=?us-ascii?Q?kzP0oqViBFqaUrK7EfkjZmNQkNjH1YOQgOfioKj6H6MagQ4nWRkPcnA0M85W?=
	=?us-ascii?Q?BYCQvUe6xwoPRx3u7GGCcz0RnrA5T6kGOFsibYK+JR0v9s0C9yW7k3XdUOtt?=
	=?us-ascii?Q?SEtmRIyZL1GdVN4ENCHer8p/NRA/84vDoazJdpq+MyJOJA/TGdaEUmfoUWnk?=
	=?us-ascii?Q?69OUWC+Kk1ReZEemaDKUjtGLconIJCDRdj6NgCo/V+FE7Iu1BakyYGB6Vqa4?=
	=?us-ascii?Q?T3BhCscfwEqRGqOHf2gOMqjm+W/X3j8jqyfHvCOXSIdVRPtNRojBiZ3GVnxK?=
	=?us-ascii?Q?tGhSQfYlt3DbDpti8OvbRnG+rdma3i7ahV5++WXAkYKjfsMFOqYSl/OuXNkZ?=
	=?us-ascii?Q?6IQk71bCQcRt0DGXrRN4WLDAZw7x5QM2/ni/A6sWUyCzfyqG9qJyM00wCyWn?=
	=?us-ascii?Q?whpJunm2Cr+VUiw6303nly1IOyj2IGot8jJZSG2ML85VCUZpG9Kt4Yxcm8Ig?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB155;
	5:iuvnXyOsJ3cx1oGsi9+YcNAL2/D1s0xF8fRSPhFrBIuJaXLPx3QgMIaBD+ex/WCxuqQp2FrQ8V1/nmnA5mYC9+t4iUJ/Tp6IlA2rhhkPKD0D5dhPV3KDhWW/e9svMPbKeP+ICruiSO6Wd1l8tRaPhg==;
	24:HmcaI/FYDDf20sqC9YV+9SdSdzNj/MXQG7fy+7Hy4X5sdqade+5sVpJo+ls6j2rfnD1dDOW0OywQRespAAnf0gT9EQlNbGtikt7ISlsjhD4=;
	20:qEV1valHTIT212zkb7E/nCnYJC/GiYjiC8St0G931nIn2+53vNtwhq4q+ckYMKcKaRazxtz8Bm3cPKKE8Y/mXyxmQVIOKZ5MZhRG6hMWaHRVwCqx8yW+axU52i58U56HhE7Kgjp3qQZeTO8sjLpuZqzNV3rhtC2qPjDXYGKoQjo=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: verifone.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2015 10:26:20.1797 (UTC)
X-MS-Exchange-CrossTenant-Id: 611a22d6-8c40-4958-84e3-ce47d8205d98
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=611a22d6-8c40-4958-84e3-ce47d8205d98;
	Ip=[209.198.197.22]; Helo=[VF2WVEXET2.verifone.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR03MB155
X-NAI-Spam-Flag: NO
X-NAI-Spam-Level: 
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: 0.9
X-NAI-Spam-Rules: 9 Rules triggered
	THREAD_INDX_INVALD_VAL=0.3, BEC_TRC1=0.2, GEN_SPAM_FEATRE=0.2, 
	TRK_NCM1=0.2, EDT_SA_DN_PASS=0, EDT_SA_RB_PASS=0, EDT_SA_SP_NONE=0, 
	EDT_SA_TS_PASS=0, RV5443=0
X-NAI-Spam-Version: 2.3.0.9393 : core <5443> : inlines <3888> : streams
	<1513128> : uri <2051998>
X-AnalysisOut: [v=2.1 cv=KoZZ2AmN c=1 sm=1 tr=0 a=qV62VDZ6CwrtL+LhkMkwMA==]
X-AnalysisOut: [:117 a=qV62VDZ6CwrtL+LhkMkwMA==:17 a=NlxZLTYeAAAA:8 a=YlVT]
X-AnalysisOut: [AMxIAAAA:8 a=UqCG9HQmAAAA:8 a=IVvqCPU2AAAA:8 a=bgUvSE6vDrI]
X-AnalysisOut: [A:10 a=N6VC7YX0DecA:10 a=xqWC_Br6kY4A:10 a=ff-B7xzCdYMA:10]
X-AnalysisOut: [ a=zZFp6isHNCPpTrAL87kA:9 a=wPNLvfGTeEIA:10 a=x6ukzpZ_a_3x]
X-AnalysisOut: [B4TZ:21 a=_W_S_7VecoQA:10 a=frz4AuCg-hUA:10]
X-Spam: [F=0.6083111826; CM=0.500; MH=0.608(2015092905); S=0.200(2015072901)]
X-MAIL-FROM: <nageswaris1@verifone.com>
X-SOURCE-IP: [192.30.113.167]
Subject: package_do_shlibs failure
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
X-List-Received-Date: Tue, 29 Sep 2015 10:26:30 -0000
Content-Language: en-IE
Content-Type: multipart/alternative;
	boundary="_000_6CC83472A885EA4DB329C78841C5245913123EA2VF2WDEXMB3verif_"

--_000_6CC83472A885EA4DB329C78841C5245913123EA2VF2WDEXMB3verif_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

While using fido branch on custom SDK, hit this below problem was most of t=
he
recipes. The below error happened when trying to build directfb

Any pointer on the below error and how to resolve this.

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'package_do_shlibs', lineno: 249, function: <module>
     0245:                fd.write(dep + '\n')
     0246:            fd.close()
     0247:
     0248:
 *** 0249:package_do_shlibs(d)
     0250:
File: 'package_do_shlibs', lineno: 128, function: package_do_shlibs
     0124:    else:
     0125:        use_ldconfig =3D False
     0126:
     0127:    needed =3D {}
 *** 0128:    shlib_provider =3D oe.package.read_shlib_providers(d)
     0129:
     0130:    for pkg in packages.split():
     0131:        private_libs =3D d.getVar('PRIVATE_LIBS_' + pkg, True) or=
 d.getVar('PRIVATE_LIBS', True) or ""
     0132:        private_libs =3D private_libs.split()
File: '/home/../sources/oe-core/meta/lib/oe/package.py', lineno: 128, funct=
ion: read_shlib_providers
     0124:                    s =3D l.strip().split(":")
     0125:                    bb.note(" split value is %s" % s)
     0126:                    if s[0] not in shlib_provider:
     0127:                        shlib_provider[s[0]] =3D {}
 *** 0128:                    shlib_provider[s[0]][s[1]] =3D (dep_pkg, s[2]=
)
     0129:                    bb.note("shlib provider is %s" % shlib_provid=
er)
     0130:    return shlib_provider
Exception: IndexError: list index out of range

ERROR: Function failed: package_do_shlibs

Regards,
Nageswari
________________________________
This electronic message, including attachments, is intended only for the us=
e of the individual or company named above or to which it is addressed. The=
 information contained in this message shall be considered confidential and=
 proprietary, and may include confidential work product. If you are not the=
 intended recipient, please be aware that any unauthorized use, disseminati=
on, distribution or copying of this message is strictly prohibited. If you =
have received this email in error, please notify the sender by replying to =
this message and deleting this email immediately.

--_000_6CC83472A885EA4DB329C78841C5245913123EA2VF2WDEXMB3verif_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hi,<br>
<br>
While using fido branch on custom SDK, hit this below problem was most of t=
he <br>
recipes. The below error happened when trying to build directfb<br>
<br>
Any pointer on the below error and how to resolve this. <br>
<br>
The stack trace of python calls that resulted in this exception/failure was=
:<br>
File: 'package_do_shlibs', lineno: 249, function: &lt;module&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0245:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd.write(dep &#43; '\n')<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0246:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; fd.close()<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0247:<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0248:<br>
&nbsp;*** 0249:package_do_shlibs(d)<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0250:<br>
File: 'package_do_shlibs', lineno: 128, function: package_do_shlibs<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0124:&nbsp;&nbsp;&nbsp; else:<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0125:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; us=
e_ldconfig =3D False<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0126:<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0127:&nbsp;&nbsp;&nbsp; needed =3D {}<br>
&nbsp;*** 0128:&nbsp;&nbsp;&nbsp; shlib_provider =3D oe.package.read_shlib_=
providers(d)<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0129:<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0130:&nbsp;&nbsp;&nbsp; for pkg in packages.split(=
):<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0131:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr=
ivate_libs =3D d.getVar('PRIVATE_LIBS_' &#43; pkg, True) or d.getVar('PRIVA=
TE_LIBS', True) or &quot;&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0132:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr=
ivate_libs =3D private_libs.split()<br>
File: '/home/../sources/oe-core/meta/lib/oe/package.py', lineno: 128, funct=
ion: read_shlib_providers<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0124:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s =3D=
 l.strip().split(&quot;:&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0125:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.no=
te(&quot; split value is %s&quot; % s)<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0126:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if s[=
0] not in shlib_provider:<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0127:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; shlib_provider[s[0]] =3D {}<br>
&nbsp;*** 0128:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shlib_provider[s[0]]=
[s[1]] =3D (dep_pkg, s[2])<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0129:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.no=
te(&quot;shlib provider is %s&quot; % shlib_provider)<br>
&nbsp;&nbsp;&nbsp;&nbsp; 0130:&nbsp;&nbsp;&nbsp; return shlib_provider<br>
Exception: IndexError: list index out of range<br>
<br>
ERROR: Function failed: package_do_shlibs<br>
<br>
Regards,<br>
Nageswari<br>
</div>
<hr>
<font face=3D"VERDANA" color=3D"GRAY" size=3D"2">This electronic message, i=
ncluding attachments, is intended only for the use of the individual or com=
pany named above or to which it is addressed. The information contained in =
this message shall be considered confidential
 and proprietary, and may include confidential work product. If you are not=
 the intended recipient, please be aware that any unauthorized use, dissemi=
nation, distribution or copying of this message is strictly prohibited. If =
you have received this email in
 error, please notify the sender by replying to this message and deleting t=
his email immediately.</font>
</body>
</html>

--_000_6CC83472A885EA4DB329C78841C5245913123EA2VF2WDEXMB3verif_--
