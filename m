Return-Path: <nageswaris1@verifone.com>
X-Greylist: delayed 484 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Aug 2015 11:58:28 UTC
Received: from p01c11o149.mxlogic.net (p01c11o149.mxlogic.net [208.65.144.72])
	by mail.openembedded.org (Postfix) with ESMTP id D333F73DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:58:28 +0000 (UTC)
Received: from unknown [192.30.113.167] (EHLO VF2LXSECMAIL1.verifone.com)
	by p01c11o149.mxlogic.net(mxl_mta-8.4.0-3) with ESMTP id
	8685cd55.2b546b204940.3424016.00-544.9186984.p01c11o149.mxlogic.net
	(envelope-from <nageswaris1@verifone.com>); 
	Tue, 25 Aug 2015 05:58:32 -0600 (MDT)
X-MXL-Hash: 55dc58682e087fe3-26ce17a2056d3d750b65141eb6e96ae6076fa16f
Received: from unknown [192.30.113.167] (EHLO VF2LXSECMAIL1.verifone.com)
	by p01c11o149.mxlogic.net(mxl_mta-8.4.0-3) over TLS secured channel
	with ESMTP id e765cd55.0.3420994.00-245.9178489.p01c11o149.mxlogic.net
	(envelope-from <nageswaris1@verifone.com>); 
	Tue, 25 Aug 2015 05:50:26 -0600 (MDT)
X-MXL-Hash: 55dc56825a423dd4-c21c72fdd12e7ad07f7f15896acb9b2b4d3b989b
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0244.outbound.protection.outlook.com
	[207.46.163.244]) by VF2LXSECMAIL1.verifone.com with smtp
	(TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	id 5118_1f9b_dcf80cef_623e_45d4_a292_353887b77b0c;
	Tue, 25 Aug 2015 07:50:21 -0400
Received: from BY2PR03CA005.namprd03.prod.outlook.com (10.255.93.22) by
	BN1PR03MB154.namprd03.prod.outlook.com (10.255.201.18) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:50:13 +0000
Received: from BY2FFO11FD052.protection.gbl (10.255.93.4) by
	BY2PR03CA005.outlook.office365.com (10.255.93.22) with Microsoft SMTP
	Server (TLS) id 15.1.243.23 via Frontend Transport;
	Tue, 25 Aug 2015 11:50:12 +0000
Received-SPF: Pass (protection.outlook.com: domain of VERIFONE.com designates
	209.198.197.22 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=209.198.197.22; helo=VF2WVEXET2.verifone.com;
Received: from VF2WVEXET2.verifone.com (209.198.197.22) by
	BY2FFO11FD052.mail.protection.outlook.com (10.1.15.189) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Tue, 25 Aug 2015 11:50:12 +0000
Received: from vf2wvexcaht4.verifone.com (10.71.199.104) by
	VF2WVEXET2.verifone.com (10.71.128.101) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 25 Aug 2015 07:50:18 -0400
Received: from VF2WDEXMB3.verifone.com ([fe80::2d79:a18b:1d3d:af0c]) by
	VF2WVEXCAHT4.verifone.com ([::1]) with mapi id 14.03.0248.002;
	Tue, 25 Aug 2015 07:50:11 -0400
From: Nageswari Srinivasan <NageswariS1@VERIFONE.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: two versions of xlibrary in the same target image
Thread-Index: AdDfLDJ6a9P10oInSCOmRC/EWsBMwQ==
Date: Tue, 25 Aug 2015 11:50:11 +0000
Message-ID: <6CC83472A885EA4DB329C78841C52459131202C4@VF2WDEXMB3.verifone.com>
Accept-Language: en-IE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.71.196.102]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD052;
	1:5z4OyVdIXQ5C7PvpTgLoVNOJVL+ZusLRpFNK/S8TVa3eJWiCRyq5w5zmCndcPIHCS+EOhAIJNttsWBLWNwfjkkmzAYPwlbZELDrRRViN+QO0k2Fvi2aOya34AyU8q4qcoXkkCZ8cU+eyHbbs3FnldppxXc4nreMk+qbwqy1HdmqbpsI+X1beLiyn3z1ud8LUS7WU2Y0a1kjK5KC8KK07BknPOrOWYB5Lwm+ckaLAfC6DQl8E2+JV2h0seye8qVvM7e79YBhyD0gfYflwLx13HVD+b1RgkMca5eSGqtxGEkei5lRqoUabcDenUXD+qHm1WLKwevLgydQ3YoPX+gLsuA==
X-Forefront-Antispam-Report: CIP:209.198.197.22; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(3050300001)(199003)(189002)(374574003)(5004730100002)(2900100001)(84326002)(5001830100001)(86362001)(189998001)(2930100002)(107886002)(5001860100001)(2656002)(5001970100001)(53416004)(110136002)(87936001)(229853001)(46102003)(4001540100001)(5007970100001)(55846006)(50986999)(6806004)(102836002)(54356999)(2351001)(64706001)(2920100001)(16796002)(5250100002)(77156002)(450100001)(5890100001)(512934002)(16236675004)(5003600100002)(26826002)(2501003)(33656002)(92566002)(62966003)(106466001)(7099028);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR03MB154;
	H:VF2WVEXET2.verifone.com; FPR:; SPF:Pass;
	PTR:vf2wvexet2.verifone.com; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB154;
	2:wiFK92K60tM5jiO5UXLDwOEEP46yrUfVdp7V4i59PeFGpVCHLeLGl0+GDKlCkTu2IuqUDicNHGUmqL0jl5pKasvbOD9IQYWp1ckPYXjbeDf2lRuAsuLK/VZYVEhZbtR1xRLkISKdUkxNXebJRBr+XkPNRbNFBZsTOUWerKZUM2Y=;
	3:EwgtVfdBdi8YhB5JAYsR77QXo8RiUJLtj7sYm4K8T755J2RcG6t4TYpC9L54ANYmhZlPjno9PM+xFM/YbKpBsne3Fo2rb6Ry9YELGuMZSSdJ9RdXvjgj3AUVXDBaP0JrOStq6uH8TE+lTnor5W5nP7yZjUW1ju5mYZWJ3ndkf1Qk3j5eabMJskcahnZuOMLmPx/Hqh96IzbtMaY1iiFjay3DcNb/+B/TONmzyzhFW13wpyTTtVpv/eMXK1LpL6Kx;
	25:0ZivS8W17/Tqq497vJ5oXt/vXWOynrlhPX5U2fq0+ND6lGvm+T5Zmih6WiaGAqXT76hbITSUFaZ/mePDBxMxt4o9mOhzlnbe/yj74eS3WPpE3cqrePCmeJRoswkYE6Hf42Oe4+Xj2G/JFR0Aft5E/OUCdvkOjai7B7teBgMzk0O3n2drjJO0T9g5/3WCHOGjAcwXKFufqfREK+z7qG/2CeIBE14rvwdc+UMm98J43lN4T9YY8l00qm54FiHp4aHpJSdyXvCWmD0RkVfas7xM4A==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1PR03MB154;
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB154;
	20:x7OcX2SrThEetvdja+PslaBKLHJrP1FXe7rSHkv2QeuhYvnebKZvTOO2967ieuqRBr99UhTnmhXpfQodjCFFCcOeb1HZNLal1MfCJJZ+FSOV5cXOsHWUAhOFK9eikB0Koi3QlEKdEpw8d6KfUlWZJWC2m9/ObdqUKOGbboSibPI5R0R4Ef5TELgW7gOrvAlSdkxg0pPBkPb70Fp+WIfBsTIo7sGzFfucb4frskVm/Jm65wDo8/OOooWtav4nh4DO4LMNLJHw2ekT9vphZRglqwY2y2/LIBj0miBxaGQojzqhXIIz/nuljpXIebj14kIbpxnE3U9TzsBbFyBAGDQzpUqcVk3O1U8N7OIb/mdUayhiZ7L3ekbTYpFsuSAh93VI7QoHDBLw+hqPab1pEChzjW7IIyo1nWzvThAl/EJESI8qJMLMCpSAEKV7JYi9I3uTD0f9Jcjwi9echxJHXST4Zs3sDZfJzDS9zBVtdB9kLsRltmLECCc3q+5pYSVH8Pqu;
	4:jw6EAbnt2f73m5gFhKkUmm80huiPcN2SjLiMLzH9u/+lgsh2kXUlXuwLRprQVG6Og4d/xo+tBMg2gZAGGZ7x7iyFf6twMZnSzH8jOaCbt2Q2duf4C6X+zlmYdojrwjCX83qmA3KqtzXRvA2Njvk7N0iQB/wt+0CLQNks4BYO83jC60e+3KmV7WAi9CSCmrypGpMU2ZCdiYbT01fqA5CaFfYPgZbuXE+s8x3kw7++Yg1iIKuB5J4cSdp2KNforUqagbrbg2HgeRlBHz3n9Rot4zMT3er69xpV8H7P6UIuN8ePKGAeNtEiYQNsucCD0SDG
X-Microsoft-Antispam-PRVS: <BN1PR03MB154A86DDFF567F29DB347FF8E610@BN1PR03MB154.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001); SRVR:BN1PR03MB154;
	BCL:0; PCL:0; RULEID:; SRVR:BN1PR03MB154; 
X-Forefront-PRVS: 06793E740F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR03MB154;
	23:Okm5RLJNHxvxWaONpuqcbx9jYEO/aORD0JRuBUkIYe?=
	=?us-ascii?Q?GaWHUj3kflwZ0tzY4o+PrxpgGz8EKuu4IQF8VR+0rVSMGeEuqH2hQBlolTh6?=
	=?us-ascii?Q?cxxYdV9Lwul8cm/ZLpKXWS6p2kZ6/+CPa1wlrFgXp6VGZmOQoSCNXSYx8sSR?=
	=?us-ascii?Q?ueM4+ao5NZWAU8A2qQX+u9UOn0i1yQME0Jacrw7gEiHmJQgz/Md9rAjyB8Ru?=
	=?us-ascii?Q?SZQ+LqmZqvpAcZdoIvr80KNozkbHOeNUsbl6pqTeq4JhLO6cImNlwqrM2SQq?=
	=?us-ascii?Q?FhLeiY+9knTtnTE4NwVTPn+z0urorH1PEWyLwvpnhlRvc/SNcIzhKS7vw4Fq?=
	=?us-ascii?Q?OLcC4sAyBF64PkJXzNj37Uylt8yrTfXzn7aEQENgU8XexmAGc8ho/fie1+Eu?=
	=?us-ascii?Q?J6cZnjtxV5iKTEPdFfYk7vSIZjbpcY9+FfEKpLrTDRevlOlq29ZsRi2VSmMu?=
	=?us-ascii?Q?odD6dk+H7irRAj6OI5zCD1qLTQuz8cbcDDcKaFyIAK6Rsd8cEegib6gXPIMI?=
	=?us-ascii?Q?stKeK49MRCfU9Z2H7ZXkmkePFnVMbtiLZtZ2Lzh26QzpUuMVpHDlX/ixBfGd?=
	=?us-ascii?Q?B89S/5W/RlOnFQP8ZxuJPGnJZA2FOx/8YFqqqrQ4aI+AUP9xp2QaNJeySFW0?=
	=?us-ascii?Q?D6/NP7DrjBR1RLmpLcZS+CcB5KEgbRo1rA8NhBmBEDKH6nifiY7gSbDegHeV?=
	=?us-ascii?Q?+9M5Dr/QzwAlnPdmyQhoGwdqjeY4LV2WVdCdujCPNEHPjOtAFKHpuDZ7Q8fL?=
	=?us-ascii?Q?yL+Enii6cOECBMgE7vQFjeLZXhv7aaczwMAp3tW+C3EHXNW+44DBswG7tWcE?=
	=?us-ascii?Q?QmRWkpdvDv5cE/RxcGnxHhz+rrvIREHTn5sCtXQfvSbMSgwArWfeLPScSfYD?=
	=?us-ascii?Q?bDAtbfBfcx7bqfO2rLIzTdnO1ESxzvEf6F/5+DSMtvx/ZP6HG6yTXWjWe7gj?=
	=?us-ascii?Q?RfR3dAj4DRfWlBUQIQStx8qcP53heRy6kRzKcgNT5SAbNQBkH7LqYdezpeIS?=
	=?us-ascii?Q?sKgQ0/3lMrNLeBKRKejE0fZrSCNv9OaBRi4QQ3jrjv4oHBJ3POki/esGsuFe?=
	=?us-ascii?Q?HbKZl/P3RhQs2fvWgipN0omVVr9CGxntixrVkWfMa4O8gFDDPOnWnkDP7qIx?=
	=?us-ascii?Q?gliEBZolMAnFnVsquGtHqUpdGN7AqBXeMSGXtiOta+LOMZY7dxDa+gCq2ZXJ?=
	=?us-ascii?Q?O062YUf3BmeCNqsF9LDy0L2wu6zfgDRcuILggsEOzTe+jHn2pRtoKhXa5r97?=
	=?us-ascii?Q?nQzbp6WHqX9FvBksWPZR/8jZlXv/fI9SZeb6XASdxTv/nkUR7TWcM73GGhUA?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB154;
	5:+VwsoQqJK/j57eP/YITOkdNCZ4PY8kKGx1J1llSFfcRZ1FqIB6Z64YeRxHQEDU+R46kfYPT7r4Li/IoztD/E8O2MEQhmbq312ZArsaMW6CcWhlb/1I+PYPxQolHhfQhKPEM9VlFJuHEMEy8UG2VlPg==;
	24:EO4HADr8cEgSlye++mh71QHdWTiBRDDLXfMh560l8XmkMNCBZWc+Ml5uf1YszC+JN5Vetf7BTuS4fsoHnLrOtOTG3PZaLrXeP8Kz3TJKnDQ=;
	20:3iIW7KtuKYJ7zMPiwWv2Er/FhOBWw+MWGIbFjtIckm1uqL9p4OXo+NDRBnPBfCIcUSI9yHXLHlOjnLuNa2tDJk+m/6dXwlOf5KSw3B8E4iji96arPOdDZPOXsbiQkRFROHx3PzcDn40FBMVlKMVinx9AVwesTpEjcdTRvF4Cx3c=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: verifone.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:50:12.4356 (UTC)
X-MS-Exchange-CrossTenant-Id: 611a22d6-8c40-4958-84e3-ce47d8205d98
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=611a22d6-8c40-4958-84e3-ce47d8205d98;
	Ip=[209.198.197.22]; Helo=[VF2WVEXET2.verifone.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR03MB154
X-NAI-Spam-Flag: NO
X-NAI-Spam-Level: 
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: 0.4
X-NAI-Spam-Rules: 7 Rules triggered
	BEC_TRC1=0.2, TRK_NCM1=0.2, EDT_SA_DN_PASS=0, EDT_SA_RB_PASS=0, 
	EDT_SA_SP_NONE=0, EDT_SA_TS_PASS=0, RV5408=0
X-NAI-Spam-Version: 2.3.0.9393 : core <5408> : inlines <3693> : streams
	<1494237> : uri <2023850>
X-AnalysisOut: [v=2.1 cv=IrQKcdPg c=1 sm=1 tr=0 a=qV62VDZ6CwrtL+LhkMkwMA==]
X-AnalysisOut: [:117 a=qV62VDZ6CwrtL+LhkMkwMA==:17 a=NlxZLTYeAAAA:8 a=YlVT]
X-AnalysisOut: [AMxIAAAA:8 a=UqCG9HQmAAAA:8 a=IVvqCPU2AAAA:8 a=bgUvSE6vDrI]
X-AnalysisOut: [A:10 a=N6VC7YX0DecA:10 a=xqWC_Br6kY4A:10 a=uRRa74qj2VoA:10]
X-AnalysisOut: [ a=4ilGa_Me5McYyedc2tcA:9 a=wPNLvfGTeEIA:10 a=_W_S_7VecoQA]
X-AnalysisOut: [:10 a=frz4AuCg-hUA:10]
X-Spam: [F=0.5299760192; CM=0.500; MH=0.529(2015082504); S=0.200(2015072901)]
X-MAIL-FROM: <nageswaris1@verifone.com>
X-SOURCE-IP: [192.30.113.167]
Subject: two versions of xlibrary in the same target image
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
X-List-Received-Date: Tue, 25 Aug 2015 11:58:33 -0000
Content-Language: en-IE
Content-Type: multipart/alternative;
	boundary="_000_6CC83472A885EA4DB329C78841C52459131202C4VF2WDEXMB3verif_"

--_000_6CC83472A885EA4DB329C78841C52459131202C4VF2WDEXMB3verif_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Can we have two versions of xlibary installed in the same target image? For=
 example, can we have both xlib and nanox in one target file system? Will t=
here be an issues due to same header file names?

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

--_000_6CC83472A885EA4DB329C78841C52459131202C4VF2WDEXMB3verif_
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
Can we have two versions of xlibary installed in the same target image? For=
 example, can we have both xlib and nanox in one target file system? Will t=
here be an issues due to same header file names?<br>
<br>
Regards,<br>
Nageswari<br>
<br>
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

--_000_6CC83472A885EA4DB329C78841C52459131202C4VF2WDEXMB3verif_--
