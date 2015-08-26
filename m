Return-Path: <nageswaris1@verifone.com>
X-Greylist: delayed 431 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Aug 2015 11:41:04 UTC
Received: from s12p02o145.mxlogic.net (s12p02o145.mxlogic.net [208.65.145.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD08734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 11:41:04 +0000 (UTC)
Received: from unknown [192.30.113.167] (EHLO VF2LXSECMAIL1.verifone.com)
	by s12p02o145.mxlogic.net(mxl_mta-8.4.0-3) with ESMTP id
	1d5add55.7f20bf5fe700.42147.00-574.108485.s12p02o145.mxlogic.net
	(envelope-from <nageswaris1@verifone.com>); 
	Wed, 26 Aug 2015 05:41:05 -0600 (MDT)
X-MXL-Hash: 55dda5d11e19d2a9-fd2c06022e4d2ca6c0823ad742e042dc6046b760
Received: from unknown [192.30.113.167] (EHLO VF2LXSECMAIL1.verifone.com)
	by s12p02o145.mxlogic.net(mxl_mta-8.4.0-3) over TLS secured channel
	with ESMTP id 124add55.0.38338.00-307.98083.s12p02o145.mxlogic.net
	(envelope-from <nageswaris1@verifone.com>); 
	Wed, 26 Aug 2015 05:34:01 -0600 (MDT)
X-MXL-Hash: 55dda42943a4297a-3deb65c9e7714b7a728301fa04f4ad71d44b83fb
Received: from na01-by2-obe.outbound.protection.outlook.com (unknown
	[207.46.163.235]) by VF2LXSECMAIL1.verifone.com with smtp
	(TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	id 5cd3_2e92_dd4474c5_75e5_4d3c_aed9_d2f021048f6b;
	Wed, 26 Aug 2015 07:33:52 -0400
Received: from BN3PR0301CA0079.namprd03.prod.outlook.com (10.160.152.175) by
	BY2PR0301MB0774.namprd03.prod.outlook.com (10.160.63.28) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Wed, 26 Aug 2015 11:33:51 +0000
Received: from BN1BFFO11FD005.protection.gbl (2a01:111:f400:7c10::1:187) by
	BN3PR0301CA0079.outlook.office365.com (2a01:111:e400:401e::47) with
	Microsoft SMTP Server (TLS) id 15.1.256.15 via Frontend Transport;
	Wed, 26 Aug 2015 11:33:50 +0000
Received-SPF: Pass (protection.outlook.com: domain of VERIFONE.com designates
	209.198.197.21 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=209.198.197.21; helo=VF2WVEXET1.verifone.com;
Received: from VF2WVEXET1.verifone.com (209.198.197.21) by
	BN1BFFO11FD005.mail.protection.outlook.com (10.58.144.68) with
	Microsoft SMTP Server (TLS) id 15.1.256.10 via Frontend Transport;
	Wed, 26 Aug 2015 11:33:50 +0000
Received: from VF2WDEXCAHT1.verifone.com (10.71.199.101) by
	VF2WVEXET1.verifone.com (10.71.128.100) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 26 Aug 2015 07:33:56 -0400
Received: from VF2WDEXMB3.verifone.com ([fe80::2d79:a18b:1d3d:af0c]) by
	VF2WDEXCAHT1.verifone.com ([::1]) with mapi id 14.03.0248.002;
	Wed, 26 Aug 2015 07:33:41 -0400
From: Nageswari Srinivasan <NageswariS1@VERIFONE.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: STAGING_KERNEL_DIR not populated with kernel source
Thread-Index: AdDf8w5bQni01VBAS5WW1UvxBrHskw==
Date: Wed, 26 Aug 2015 11:33:40 +0000
Message-ID: <6CC83472A885EA4DB329C78841C52459131205DB@VF2WDEXMB3.verifone.com>
Accept-Language: en-IE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.71.196.102]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD005;
	1:9vVR1a880VW/g9xGTgv4L4Wr7ZH+WjFeTMWQym4hyAyUmQ2a129YlwUNHopYN6MBMf2F89zP7Mo+qlfS/Jwne7e0I605RQ9h9GsSb4EkATqijwi2qvXOFZXF/CbZm+O6JPf02K46ez7E7N214NGlDHJ+yichbAptdWv4aR9w2V4LXdGgG3enGpuErl8uLuVIltgcvCzGhnwu6ArNdNzI1hvnWOGuEBpXLpQH0YS/VpsyMk0OaK4/TSoSaF4rvWHmdX1X/30iyXCDt0PstaVcZo4AgWoqEgAUx3xCeJChcjbySsIVu5dbhJq/c73rO84P23VqtVisL7hRWQhU68ZNSg==
X-Forefront-Antispam-Report: CIP:209.198.197.21; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(3050300001)(374574003)(199003)(189002)(2656002)(5004730100002)(46102003)(53416004)(5003600100002)(84326002)(54356999)(64706001)(2351001)(16796002)(229853001)(102836002)(86362001)(5890100001)(50986999)(106466001)(87936001)(512934002)(26826002)(16236675004)(107886002)(189998001)(4001540100001)(55846006)(5001830100001)(62966003)(5001920100001)(5007970100001)(450100001)(110136002)(77156002)(2930100002)(2501003)(92566002)(2900100001)(33656002)(6806004)(2920100001)(5001970100001)(5001860100001)(5250100002)(7099028);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0301MB0774;
	H:VF2WVEXET1.verifone.com; FPR:; SPF:Pass;
	PTR:vf2wvexet1.verifone.com; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0774;
	2:HXBbiHPnozEjSPh85PCtYRjZAQmoeG2Ih7TxFnN47dmLV/hl/j/GkdDbCcBviHcp+lKk18UP+FmOwtOyYNUrkiZtj2j0r/iZcpXuk0Rdp3D5aenc+8BCbSsvb2A6CWB3sl/zkgxhXPYQvVOIFbLaSFFhmw98oWoLYfjn2QYo8cs=;
	3:nXPID5+oTL+CMYGNUp3CvSWlbydGxdGfNQM0yy1wQX62pVOQAgCi2aF/JkvpPakHXc35EyDZScYHNgRj5y9fIsfe6j1USrJI3AOTJmzbpYh1ayTjmP3vGXSsKifbeCMol3n+oKpM6749bhyIfkqRzGGSP9skvC/ECfLjfcEDuSlZy+7+QG0crVdgLOg2pXC14AoCyQyZqUKzwVrVKzgbYb8Z5Z2aZR4Wr7/nu28n0s6Nhw8fbFKlcmb7aM6s4xWg;
	25:Jlvq4fT3AukgYIlN6DzmG3GtoiGN0DtQhYmdJTEQ+aeN4QzsP/QjeW/HzJ35FRvwYiyy8BMxgDMenzaow7WQqTtSzHn2CGfnVuFTRqt3Usa/G+XEDcF2IcLgN/I5qVM3hzxNT+ghq2YzSxyYj2Tj6n2p0Cw5Xx9Qk2/eBC58PxuEvDlRHznyJdJTSa2yZSd8BDouQuU2kQKEVdWK6/jKUjZBFFXn/UyW+sjYH2ncNAZuqVgsr2GNeOoilF8juKKjeF0Zi39RYbyWVd7ok/X4Sg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR0301MB0774;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0774;
	20:vchM2b2BjvKoGExCjA23il1qx55ARxVlZF52mknmffovnhwBQflJHgyw26mym61tRZ2UMnD5daym7EGbBotBXc7qLe0QywbDvkHxhAAhRPGRagTBkSsu7Zs3Qt1QeqaldYCdvxcaiGNwtNFn0EeRQw4gAhQNjpFdbiWxsh7aq1LW7uHHrTHPMbDh5zNVVJrejEXCi/bTp2q5mSI/wLcFWsBc9mQADJxZ3pELoJXbshaGmwp/BsT1qWQFN7aYSyDKV/Ta86W11F15LiYZTFWG8Kj+WLbWym1ZIORxVBja5VTMoU39R+2tQmuWXcHfY1H8l7iiwn0hefvcTpvRiy2ySMWPdz8j9+wusKiMhkNegwajZjAmpPxCY1NrII4Qzl16A4LdDjYVO10sRFPX5ubTV7lcZ2DqgF1VhAd6O1dsVU/1VMI6kd2g5Ob5oE0uCZElAfmLTx8AUigilzdkeqNT01Jon762kYpn+flKKUoBgBTE17PdNNPRChYif4Rxrx2F;
	4:q/FfOCbQ0J44LaDF3aqKsE39rnnXwy1YIUGHgK6dlkwhNATy2bkXg6H30opfUrwa8xh1ScomwjKSBgEU7/0vRpdt7QMLGdIGFrQ8/LTugTeT1uB+4ETJTC5Eor1qRTKgL6n+ivs63fXMFKT9x0GSQvO+EotIJzCQVGC3jhKJHUiAxrkVI4WnrC8iybd2i0OcOfq/F51Zk7IVTR8OiwbEZ81VUmqfEkMQO9JbxGEeloCDoFCv3VWwxaIuwcrx5NcnUUUdopwoDisga94Ff9VWu5tBMYz1nTaR6PT+0e9BVyMvPhGZ7qMPFvETLPuS5ukI
X-Microsoft-Antispam-PRVS: <BY2PR0301MB07745F1505F008E89BCA71C38E600@BY2PR0301MB0774.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:BY2PR0301MB0774; BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0301MB0774; 
X-Forefront-PRVS: 0680FADD48
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB0774;
	23:go5N8rRxkPIS/rVpTcDBlgh110Ek7yh3ih9QKur?=
	=?us-ascii?Q?CZFWwqYqtyUor8dBaxE1I00sNS62ci7qul7N67EEXTvB9j2jTBWgrNz75Op1?=
	=?us-ascii?Q?6Sim5qFt3rHAw7SpnCiwtKH/St19bxALiB5Tg5t13MxxyiMW/txUnjsnw9Ln?=
	=?us-ascii?Q?Co/0/ELycK3CbjXsqjAvJ1hE98dvn5MO6Ycexnq9qJTZyDbJlPhZN7wB5Teh?=
	=?us-ascii?Q?HPEXZoDOuBoSDhNki6i6UClFckTQZDu4XoRTIqgRSZu7scLibNKuxuCwOp40?=
	=?us-ascii?Q?yJ3L9fAb2mRhrk5mBEhgPYzlbuEjs+QmrI/g97vmPqrejnuottnL6KvbSnqK?=
	=?us-ascii?Q?qmwldecTgUW6JHFzGaxUydRunLA7vCCGuOBkNWrarxgc2vNLiPEx0tR0k7P7?=
	=?us-ascii?Q?xUjLGIhmEzWo84iFwpaIBl/e3RpCScWK3Wlh5TOBfnEfQyJ7pNAOHbQSIKBu?=
	=?us-ascii?Q?dStSzHd0kVjh3WWEneKy5UckK/17Z0I/beB1/c72lRA5Ke1rSPbG8zDLliVa?=
	=?us-ascii?Q?lF0wUW0bjiJe355ANVndx6H7gPiHICbQmLvo2u0KhFNCLDmRdKp+iMNYrPl7?=
	=?us-ascii?Q?ZBLxnwjg3efupSUooROQUrRVi1wOCSAxmSve8dFd+UXmgjPHIi4MHAJrKWFD?=
	=?us-ascii?Q?aSygInV7WmRbNvCnv4cf2mL0ge4mRQQiQM4YMloDbV14cGqtYZLYhLGDlxD6?=
	=?us-ascii?Q?uDsQ2hEfFYXTaFQTogo9T4zR4i04/ZOGYIs3ckOZ0GqkxgZxJPZUDblnrcd0?=
	=?us-ascii?Q?4xLiMTYH7+ToYGh3YYSB5f5XqdvUx0u9XYTFnUHpjpbJjwdaG1POzEuDCmtg?=
	=?us-ascii?Q?tTmqu0o0mVQlN8mvml/vtM5YPCkgowNfOH5gYrtKHq4+fS4+2g1h6nHVqkG+?=
	=?us-ascii?Q?pPg1YM3tWM8U7hWZfVBVYcJHBGybol/fpRa9XnkGil7eLmn1hH9KsHWr29X1?=
	=?us-ascii?Q?lsA8h4KH+sfvL/el7ri696wi51SuHAVUXHCrUL8KRCAEQYS9k9b6rftLJuZ+?=
	=?us-ascii?Q?Ob/nCWKAV97EDumUESqEGrFqdFX/HLnN0jB1Pl8zs3FGfEfE7iBop2uRz1Q4?=
	=?us-ascii?Q?8ig0Fz2JMd6YdriIsG2SFYVBuodPCq9vPl9XMnxnu6L4AYdHw8x13mGt1aAI?=
	=?us-ascii?Q?Ik3cuJkKLIlGnbqvyAlQVSwKW4S5JpOVXHuEo25/RWmpTGSYWjqDFxKnNdgz?=
	=?us-ascii?Q?vJxEMhlklPhEiq2Ifc2A6ObuqiTzzGK2EFI1VJZzR7p68vt6MVVzcnarAIpG?=
	=?us-ascii?Q?CeVj0jgE66J+cajXlpmoSO/l44wqkQ9HbrzUTNxaWovKjmPp97u8oCJUQOg+?=
	=?us-ascii?Q?i6kOU7v+eDOWL2jHdEIQOiTU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0774;
	5:7ZxO1D6EOMlqfuAqbi0taI8h9xuxcwia7Jh/g4j7/8WBdcRmlwbwNzPx2ik5Kf3ZERWw5tg7kkK8V4oI1tLNnm4tjteIqb+89aMTHdqa+q8t55z/o3bRj1mI7vOx6KlazshVuvjoDRerIYvL/wlkyw==;
	24:hOI4+vUcGMEV1T5FaQ8S2vjG0MYobA0LDFdq7G4uYX/IiUCZj6OO/NLSvE0McrsnLWLZ8irAzoUPbmt3ngywxpkG15lD0+cqlu4DgQs/B8A=;
	20:ji/l1mrr4xUmaQiOQeFw0l7KdM5UGO7rCChvMidtKsjhJxAiGWVILCBCSgpVuuKgDqH9P8uvICW8odl5sX4FG3Zc8q5Ond6KmHWLAYggI0+VaX4GtKexlD/7SdHjfwd4oCQ0IJvXSrvOuBywvOtANpnifwcEpU8CAwVUTjdl1vc=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: verifone.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2015 11:33:50.0738 (UTC)
X-MS-Exchange-CrossTenant-Id: 611a22d6-8c40-4958-84e3-ce47d8205d98
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=611a22d6-8c40-4958-84e3-ce47d8205d98;
	Ip=[209.198.197.21]; Helo=[VF2WVEXET1.verifone.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB0774
X-NAI-Spam-Flag: NO
X-NAI-Spam-Level: 
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: 0.7
X-NAI-Spam-Rules: 8 Rules triggered
	THREAD_INDX_INVALD_VAL=0.3, BEC_TRC1=0.2, TRK_NCM1=0.2, EDT_SA_DN_PASS=0,
	EDT_SA_RB_PASS=0, EDT_SA_SP_NONE=0, EDT_SA_TS_PASS=0, RV5409=0
X-NAI-Spam-Version: 2.3.0.9393 : core <5409> : inlines <3702> : streams
	<1494784> : uri <2024779>
X-AnalysisOut: [v=2.1 cv=QYVyv6rv c=1 sm=1 tr=0 a=qV62VDZ6CwrtL+LhkMkwMA==]
X-AnalysisOut: [:117 a=qV62VDZ6CwrtL+LhkMkwMA==:17 a=NlxZLTYeAAAA:8 a=YlVT]
X-AnalysisOut: [AMxIAAAA:8 a=UqCG9HQmAAAA:8 a=IVvqCPU2AAAA:8 a=bgUvSE6vDrI]
X-AnalysisOut: [A:10 a=N6VC7YX0DecA:10 a=xqWC_Br6kY4A:10 a=uRRa74qj2VoA:10]
X-AnalysisOut: [ a=G_8WAc2BM_xmDuAVkScA:9 a=wPNLvfGTeEIA:10 a=eclb7OacaBqc]
X-AnalysisOut: [S-0BRncA:9 a=9JyxKcJp5D7zTQN8:21 a=_W_S_7VecoQA:10 a=frz4A]
X-AnalysisOut: [uCg-hUA:10]
X-Spam: [F=0.5299760192; CM=0.500; MH=0.529(2015082612); S=0.200(2015072901)]
X-MAIL-FROM: <nageswaris1@verifone.com>
X-SOURCE-IP: [192.30.113.167]
Subject: STAGING_KERNEL_DIR not populated with kernel source
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
X-List-Received-Date: Wed, 26 Aug 2015 11:41:05 -0000
Content-Language: en-IE
Content-Type: multipart/alternative;
	boundary="_000_6CC83472A885EA4DB329C78841C52459131205DBVF2WDEXMB3verif_"

--_000_6CC83472A885EA4DB329C78841C52459131205DBVF2WDEXMB3verif_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

While migrating my current build to fido,  STAGING_KERNEL_DIR  is not getti=
ng populated with kernel sources so  custom module builds are failing?

Any pointers here?

regards,
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

--_000_6CC83472A885EA4DB329C78841C52459131205DBVF2WDEXMB3verif_
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
While migrating my current build to fido,&nbsp; STAGING_KERNEL_DIR&nbsp; is=
 not getting populated with kernel sources so&nbsp; custom module builds ar=
e failing?<br>
<br>
Any pointers here?<br>
<br>
regards,<br>
Nageswari<br>
<br>
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

--_000_6CC83472A885EA4DB329C78841C52459131205DBVF2WDEXMB3verif_--
