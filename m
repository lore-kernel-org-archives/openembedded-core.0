Return-Path: <sorenb@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0058.outbound.protection.outlook.com [104.47.32.58])
	by mail.openembedded.org (Postfix) with ESMTP id 3A43F7822A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 03:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=lMmKjmbrDC9RIxgdXdspbwDImWTMUIMhsRxYIE/jyeA=;
	b=ddCzvWzuJw//o2hl31G82pi0fLzTf8rUG1WTVPwKp1DH31iz4GiSM1wGRDuS5KKNAocnrPiG0Dkokx7w6OrlVf+J5qN5i4Km2lxykb2Ue3B7Hr/Gnsrv0Ix4oaLudoYD/Izvfqta2hL1/cPHWsNJfognDWwP1ugCX6i8mYC7bGk=
Received: from BN6PR02CA0042.namprd02.prod.outlook.com (10.173.146.156) by
	SN1PR02MB1648.namprd02.prod.outlook.com (10.162.129.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 30 Jun 2017 02:56:28 +0000
Received: from CY1NAM02FT044.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by BN6PR02CA0042.outlook.office365.com
	(2603:10b6:404:5f::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1220.11 via
	Frontend Transport; Fri, 30 Jun 2017 02:56:28 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT044.mail.protection.outlook.com (10.152.75.137) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1199.9
	via Frontend Transport; Fri, 30 Jun 2017 02:56:28 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1dQm6d-0005ZK-G0
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Jun 2017 19:56:27 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1dQm6d-0003OU-DE
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Jun 2017 19:56:27 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v5U2uKH4024697; Thu, 29 Jun 2017 19:56:21 -0700
Received: from [172.19.2.241] (helo=xsjveena50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1dQm6W-0003Ns-Ph; Thu, 29 Jun 2017 19:56:20 -0700
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Jun 2017 19:58:18 -0700
Message-ID: <1498791499-10658-1-git-send-email-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23164.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39840400002)(39400400002)(39410400002)(39850400002)(39860400002)(39450400003)(2980300002)(438002)(199003)(189002)(9170700003)(36756003)(356003)(50986999)(305945005)(47776003)(2906002)(5660300001)(53376002)(110136004)(77096006)(107886003)(38730400002)(8676002)(1720100001)(33646002)(4326008)(50466002)(1860700003)(48376002)(2351001)(6916009)(478600001)(19273905006)(36386004)(9786002)(63266004)(966005)(6306002)(91966014)(81166006)(5003940100001)(50226002)(189998001)(8936002)(107986001)(562404015)(563064011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1648; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT044;
	1:kNqOaJDeOfB1+JXiXF5QJr8Jqa9yjwtpHqzyUOjp8/yC/STK+5+I6VFWPTebCfW4tpAVCGNG5X1YMxgeTIKowXLSTky5YP5y6FPmTPmYYn3X7BzJ3nG1TPUEyQY2V/h7zVnT9bthSMH6MebDQXNK7g0uvxSZwzeMBVTU0fLlBNC3CWXPBNXJCS+V4X8BdjTtRz9qdig5BId61zVXFF+B3UQH794bYN8XuAY+luxpmV7Odxcf9ZEEDW/Q+q94z4pNW7n5lVk79p5/Sz8lSVKq8glQpsE917w3franGoMG8P29ELKOMKaSdE3VhJKDv1mkE7ifYrRPJkdR+JETvVd3877n5Db9MohaSiV2S2ctriBDtpbohjQ4HxdXPO0VcANGcYAvVSV/mkgondDbaCTY+OaGER3iWlbDNo8TUCNv2Aj6x1/UQdjfc6wYeMoOMJirZjEjxg+4rTLTOx9p4h15YVKeP+fL2TeHgh4LpeUw2RLTEqZBqN9Tpeq4zhRwgNMKhHHOZKj0wyli3EAaenslcGohfZ9lNT2+fa/kQjHy0sPlu7xLilG9nacgvgMLzVo0m7ZNy6s2JM5mEFNOjKwERqD8IvRl0vyaKqkR/J2jSfKxhPZWziV/rpT6M+8tGYCwoC7BUGmqjeBNHea1fbtmtqapU9kN/QJM20k3JTaOqDn3+dBZemo/BKDwxmEbzik2+P+T6+AtUEyieQzWLk/YUJy4dAGrLW6/t840zFRyG2PWMN0czr33lig56GMpSA9z2jGcgZ2bFj5UdL47nC3EgT+oSeYUuoJAQchS+PBbF+g1jRBBs2QKYD4AatloSDugKn6MelTB3L2e51y7W4RIx9SybDw5xNAID+oY9QD3tQAPJuo2W1xLlTJrfGyE9FHs
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 385d1ba1-5ca8-4a5a-03a8-08d4bf639a94
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(8251501002)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:SN1PR02MB1648; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1648;
	3:K7eeRV7H+QI1shAiCttxGLu+lS2uLAnJrVUwnVIXa5?=
	=?us-ascii?Q?YpylyrT0uu7osRUMy8uM2bwCp1zemto0AcqfWmm8hJJ2b13RYyM4ES1+jJdm?=
	=?us-ascii?Q?H0YfV3mw3bSv+MMb5x2GqSVIJ+h4JuBcye31T57zqBtkKxQzLRI27ddr8iB0?=
	=?us-ascii?Q?qtEVwrGW3v1XzOTsLj1amBwIyojcfHPBrOCaR1WjJjNKP7zW6gyjUeyynNmV?=
	=?us-ascii?Q?5PxYi9AHzHNdZNKOOcFVfm7+2stllvhEXzrMR8Txd0dg59KQx38YAXfw/vFS?=
	=?us-ascii?Q?j/ihC3Cf067M6SnqIi//ZVQqah/v+84B6OjOFK6LO94+bo9rJu0Tn5rX61XX?=
	=?us-ascii?Q?DEkmU0EK7Q8vzbkjlny3yQsCeeNj3GyQvs28rDzV7ybg3cFRJqxmjchixkS7?=
	=?us-ascii?Q?i7Rf/vZY2CXor3STQsAElkjh1iJ8IlODwSBXE6Bi69Km+VM/t5MmE8G3rZJO?=
	=?us-ascii?Q?VlyL7ydeuuMBaDLL901XKR9dG7qW+gy6beJcVJTmYVFZ3jhNm9J/E+DHTH16?=
	=?us-ascii?Q?vvMY1fgXVsCFKk5F4wgDj4Fuxh7/kFLyLh76pqOdbM0yoCzVSMtsYGV1vRnb?=
	=?us-ascii?Q?61nBQBbTadXjqDAcUMIimbj0pymA9uMcKPBgTfoNalMYIZUw5VJkboVE9y0F?=
	=?us-ascii?Q?4/Ihnb/KjTdS45th9bzw/XxZmPr15w0eak7MlAGPetaUlwN4iftJHfdQC+WT?=
	=?us-ascii?Q?l3VxZcoeGEqKYJG9bp8cL9MH7CbbWAtAz36HvU2U4gj6JzjH5zCfvX29FQ9o?=
	=?us-ascii?Q?+YxWkzqqPWGKZjEZIrKCD+uZU4DcjHLJxsJdkM2hMq7TctcZV0uZKdOyxWqX?=
	=?us-ascii?Q?KS3+kFvGdYHEgp0AzGdt1OBUkzH31gljhCoqa1l5wl5hJ028YvuNZhdy+fVb?=
	=?us-ascii?Q?iUSg6uf5a5aL8XwCHF4F9nGHvmJvy0yaPtktPnd1qDn+cFIi5qlI8BgJZygn?=
	=?us-ascii?Q?+XMTaxdD/5Y32VCYhq8kxZ9oASJ4vWq4ohebsP6A=3D=3D?=
X-MS-TrafficTypeDiagnostic: SN1PR02MB1648:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1648;
	25:zFSuv2NjM9pObc2QnoQ/q2uKYTidkxGljGIhhK4yINHQ4Av1kamYq6LFDjIpayzjLh1fekKGRQLn41+x+bBjgSfs0oplf0SPGis+3fVv0Iyu3enTPzdpbaJTP9dFalMJSHGB38rervLY2Qq1kwMQ8HTbG6KjOQ7FxXcSFXk+lVHgaQ4Gyu9H9+03s7l68TfDiL0za36Xn7MvzhUQZUNOSpo9WyvbkrXwtx9CPvyAxV6niErgrcXj2aYcimqCekR71yzIEMaC6ma8C8YuniroX90ZItCtKpkZIw98d2VeEK8yUZ/6o7UXl4u1zzQiD+/cDMgyECsXQJ8ZUYS00vKAauSN9PbpDgRLsyXFq9oXdVioArabpWUy/aXOz+lQlK1bKzGtjtgt24oir64XbqWqdGXzlsBsmJCTMFivE/ttAhlIqIMy8dwV81VRjEmvSv0u6PPCTTDJh2+VARC7dTiVQ3WADmjhfeHb6cZhhpDZRwCV8+GyXo7bdN/x1uogQZYFrtnCUZJDVzT88nEVDT9/THAOYyAYo+/CvFyKVT6n2P0sUGsaIGFyjQKaN9AdEB1zURNxYBm87E40sHpJSplmtUh0g/7VweUCAJ3xgzeavJkdOkSmsRASN4TMCN35eiffnVINUxuv/ZQzhwoqlmZEX1DJ6p4wXeGYwELPm9OjIOWqx7ksTMrC14VILez+86E5kNQ4ZlaUuBLsdOkALj3uprlKhII7BNbQMEinXnZ5yHM+O+TN2cbUV1TCIv2hjKCljSDI4QdBfX/Uh0FU6xzj0ZBJJrqwKzi208NkLWPD8JVVZMg9hkUsE9CYG6xZTR+X3neV5Km3btO4fdBa4IaVh12LPfPUZom40/PEdguaJSsYEiLoOtsqlVcNEtlJNP/oOrOf57ZxbSVni1mpUvBSVe62o6IsDfGNWF54i5mi3Fw=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1648;
	31:k6I93a+ykkSLU0wU51U8zVAzdPNQxylKY+sAoall8nmwhaVaCHzsJbdPpoK7hUUhi70mZ62CA1umvfG3FTugmf76+rLiS17e+76uMm07Nazt4KFzwEIVb0YHfsgvz99AXlD8V2NCX1IJqU2UfvEykCq77skPnnx1jH/G4n+8T7bDIP89IBW5ClADUocmpiwZhiv+6Dn+/epR7qnY+l9J6DaiPzClLqCUQFB6bHcAEO4EomaGkbar1buy/IFfdf97qMqAsllGn4VsAMHuAQBUyLrxUythhlMAzXEIEOobWQS290xSfAQ67IBCGqqcprHyPYFE2djIZl+bMRr7aeYwD6VY9JPaJPoEhQ5zhcBa48p5xQ+c3G7/8YkHOkmHXOamVpS1K4JGjr3FjMX88T4y1EdnwsazpW7j0Nd8OK8es1EHJlUMdF2EgWnr2uikixPfqNfyU4gBXnRpe7UPvMxKtoloCp++0loBCHt7wSffkAGLXLkmcqVXjhHTMBKAoEiR3YUsH20q5+A5334BOQreq/pHCrBuMykp57sFEOecXYOZKPlP7hW+uvsHFbfu8Zy1xHHpONNAYWVCBjqKWvOcovOMdSir87f/EGlnGaPGUQ3eKP7/8AJHxt9l8ECHrtxLT3TUKAB8BqupiG/I92JdBnmM+uBK/V9b9r/FONV3u8jQtjZJVbELV/Knm0f0+RvNO7gkV5Pv80ZaKG6UxwVeKQ==
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1648;
	20:J5AnRLHKbkJkxd8DqCHrd1xwS9qHcFhENDyLV7kgJzPGsRFgYwRkjhj4alL9i//2rtashzCncyzINJtKI+Zr/10iRBHHTXncB5LrS6SFAnil0z4bPi6qp1CIrN5eqY8+C/8DRMjVCNs3qkUCJW7+aVV088LAhuvUSOsATKA78BZ8xxFxpL2HWWNajEBdEE3r0kS6rg5CVI8KLEN629Q7kqv+rk92yOZrBrGs11StX17dLfcXgN5z5cLyT3Xs3tgBYpYzhPRD5Uw9E3CSjl6oxV2JzBsU9DKMnDZYTSnNkDjDBVmONjU07P1EzSH6tuxOVPtDn6HjbL1C3xhdJmB2ROKZPQtg88+Z3OfXlKN8vw+kDMpzq3z3a2hgywPA9Ra2A2HWfL2ceoFZTq3CL8O9M7Znk9dQzDQcXHwZ7EXToJMwNWiWmHEqGxPVE9/vBNaKLnrEWQbFSDojBTnrQ72BV7hIRQ809gTqrIPLriWgsHQvmhgJE0nEyND10FLRMsRV
X-Microsoft-Antispam-PRVS: <SN1PR02MB1648D700ABEA2F2725C23464B0D30@SN1PR02MB1648.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(22074186197030)(192813158149592)(42262312472803); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(13016025)(13018025)(3002001)(93006095)(93004095)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN1PR02MB1648; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN1PR02MB1648; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1648;
	4:DbSGDCL3Bf0DOpshTyUjnHJUuLPr8nV23360onLx3k?=
	=?us-ascii?Q?D6+vu/rL7BpNvNcIys8Z7dLp97bZD981fWvhsdhHAdRK4UA5kQ4m2duNubqg?=
	=?us-ascii?Q?Lg2I/5Gu7B1lwOkqJggc16W0rBEKSN2jwtc7G4IcS+2gqtehLcKrXXoo6m4a?=
	=?us-ascii?Q?KoTseIBfoToaoukqfopgeH6d7SrPXtvAJCcxVnEWrIotckx/mPOM8NsIGbd2?=
	=?us-ascii?Q?WZ9qxOnkR3gWsgYprcLGoT4AiEqCVnypzPAV4v0RcXztsiB1lnVSzZBioTFH?=
	=?us-ascii?Q?b41cnuxtAWuLjKfJo8kg86mx0gA1fzTh2F55c0zSkag84cngpVvkjBvaj14w?=
	=?us-ascii?Q?yoDxnGj8lHr2BQ76fTeLS3UnDlw+fdVkQ7Y/qjT4Kz5yJgH/zxmSAGsL7GMi?=
	=?us-ascii?Q?jT7C2otbu8ukN9FUxT0tPBXXdJbQtzrJuzdHIkxwQsyGkck8eUUvJGW5rPed?=
	=?us-ascii?Q?mQ6U2jN/xblsNc7PDBBW9KXbya5VrS4gElPXte4jnGTvPlnJ/7UljMrqCpMk?=
	=?us-ascii?Q?qVFbc/YCgrtjpVdP9SVpEx3vG8QmGn6+d+n/G8FMBmu8B+XRVrxmtg9I1P61?=
	=?us-ascii?Q?zbUuLG9lFhWVavtvsLHmIdD3mk/GLSyOgtWU04f6XoqVeG7dPXCDAM4yRuhg?=
	=?us-ascii?Q?AO5n4ygSiBtPq7M/qDBu2mKnM0zNqnejO+/PuNevADPsJcPHy2ULjpv3ZQhW?=
	=?us-ascii?Q?ezcrTwI2UDsXGiV82cmxjasxgpgWGhoQqNS33HKEJV47OTJbaDm+l9qv1FZD?=
	=?us-ascii?Q?TotoHlaVuY3gqGI6448UThgFrRLSm+y3CRwvZMv98jVofhfCdjfWBZLQ9h8k?=
	=?us-ascii?Q?gjAoTWsZik8h2gz/ShuzhcFmQyfieDYWrM3wW5LwBaXb0E1L6YFmVxplEUNj?=
	=?us-ascii?Q?p7+bOHxV3DMNaEDq6955hM/y6++0MEAgSZn3nlHziv52x014/gAgFWlaEWq2?=
	=?us-ascii?Q?RNRhtC6sXMW9sZYkm3eedilreSO2J29hFp6EnK6oNfF0OQbM87hmiLfnH4Ob?=
	=?us-ascii?Q?wlNIL6Efu89praf93hK2Tb3jUet42uLO1+1zAMorHzArkIx1y1MXCw8Nj8cd?=
	=?us-ascii?Q?5XaeXtj2s2kNVQ/gR/GGg5cEK5id1FA1Yny2ANtS08rhDCadDMmFWsBDAWJC?=
	=?us-ascii?Q?4YipfI9mt/KJ5ndznB1KEP+5D8wqLDFtym3JxRFXDXnItTWyUt8VQwaj4w0n?=
	=?us-ascii?Q?CMqF7iWcCecvtu5fKW32OIGNqbWFht4qKdSsfjMKSx6SfoifoxjBfeGD8oQz?=
	=?us-ascii?Q?bcvIiZcl4H9whvDbDxNCob4qhUUmob/j64ysTNqiK1mfYI3jfmHK9xHZK9Ri?=
	=?us-ascii?Q?//yTGQa08DS4pCWvH7MsQ=3D?=
X-Forefront-PRVS: 0354B4BED2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1648;
	23:5IxOfikhoZuVZHSD4VZcFc6XJWRLjEBvFhYKUO77S?=
	=?us-ascii?Q?KkkatE6h/+WBRbg6WMMo0gVkaerjs2zjG0RsbKqqWzapD/qT88tljlhMvoSi?=
	=?us-ascii?Q?1eQeTlvtyL0vB7XWzef/brhBZsTE6yFwmfAN0pytWLG2KN1JeVcuSkAGzB/o?=
	=?us-ascii?Q?3Y9wc+A1APUYlEez655l2khZwMqWz9IHHnJdXr+UJrTd+hOrfhvuSkY+8hAZ?=
	=?us-ascii?Q?kE8b2NwmEONSFmcvZi7FCWOR2NgTlVkWsFYz+3NKFru5F1Nhm237OWmTxlyS?=
	=?us-ascii?Q?q+KmMZP5zVq69CtNAeuyrVkQxBVB6oUYNu92gBJny6Cj7knadOCs0P+XzGTC?=
	=?us-ascii?Q?4RRG90l9M/GqLozovaeGdzB6bU80rZutMyM8B42ImsSCMK79m/sCZzuIEfCt?=
	=?us-ascii?Q?srgxgSECrv+DrBM5WEYNTau4irOFCBIEEBPtY67N10hYOifcPb+wBUe2xzwn?=
	=?us-ascii?Q?Eg7t2r+si1+/8MyNR5TQBiCZb5wC/nRxq9/t3bAFKkVDG/z5cYC42I2U1J9y?=
	=?us-ascii?Q?H8+HcYXPz51/5Lq9pAS94DFHrmARtFzF+dv6SQffojv9VQTnprh9Kyn4C1Nm?=
	=?us-ascii?Q?pPcyWF0U92JmEfCilEkUPGy/OicHh1Ki6X3tJRW7WBF+YDKoSlNZCp45Jmua?=
	=?us-ascii?Q?hoPXSoKA1aZwB3/8xrfOT4NgME/qPh8Mz7w7DydTqguXiQLCYT+os9eYilXD?=
	=?us-ascii?Q?PYHoxOXVH7z3ZCjM3oUoMf2AFSEr0+LxktvA6MhAbJIJd9rndsyswA7NwZmV?=
	=?us-ascii?Q?t8i3JYpRvKrWfxoXjZRFdxaEgi/1w36GAPB6j6PjvrnnYp+iftkSYgKhvOr3?=
	=?us-ascii?Q?l4ZUN/MIggLEdCIviyP/5PFoYf7FbYF1FbGLh2R/+PJUGlIh90XBz8/VHPzd?=
	=?us-ascii?Q?1zyQ7yh4u2NRJ7vGX2K0XASY/BkJcPT3saPg6urOW8eCWPxJH8p0ipMXh7Vb?=
	=?us-ascii?Q?CkP6N173MJfcHJM+kM3cJ5ZH61o7h4ev7ZgR/kOgHuo2Al8hQmxWElnHFWgQ?=
	=?us-ascii?Q?f9fmUnSHNsV4zrD+dit/4xTHgZnWM+s+NJvIJW50p86uECDk2tpIxp5ooMKt?=
	=?us-ascii?Q?sGkXgAUy4uF9achcyRgyqVuGjgG2iNiW7XSOjQXkhqmc3gJHl8EGvnJ9aO2Y?=
	=?us-ascii?Q?VKngjMsxTpi1yDttn96BkhzwOgR5i4Y/nrIEM5PMLm/h/OTr7w2Xhs8xhy8t?=
	=?us-ascii?Q?e5UzO4BOoPGglhOBoLP1g6ZjgPMPAYsUc3Gb8VpoJ/oCCFbRtLqgos0og=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1648;
	6:8F2zhrEEDls+ChRrYgOdV6UNJ3sKu7LC0Kkn/iEaZm?=
	=?us-ascii?Q?54pRjJp6t3c5tn57lrtAQUsvu0iTmSCkr31BQZLHNNhATEodHg3gue9bKuJW?=
	=?us-ascii?Q?8pXG5FZLFT9+ufCuR+8qRwqa10Mc6xkVzhWNrgTo8MgXWPpchGQbPkN13/Ck?=
	=?us-ascii?Q?J2HbhspAV0gFq+7HbID6ou0RepYNSnTU19hhbrLnqI9lAQD81pP3EHfQ5+Ov?=
	=?us-ascii?Q?/Xh2XmlgUwsXCxRaDwa2OFDnUvm/t+ZGHFK/t6mPL9qSCY9Tn7I9a4YnAoNW?=
	=?us-ascii?Q?5q5gFfTZ7N5hrPEslfnPR8NuxXgW8Xmgda7HghvBz55zLz7CHZAOhXFRcguU?=
	=?us-ascii?Q?G9qebNlYanNiMtzD56lGOiWsPZ4eyUAXyk7QFc4nKne96IUBKfSgz9GpUHYv?=
	=?us-ascii?Q?fvgk4EXhsmf8A/qh9culBwNgk7BSM5Me6hPkZIPgHC7xSoHL/qLX08FVetb3?=
	=?us-ascii?Q?2E2ejE2XT3lg+wovwoZiEaXikt1DldsBcGA1s6Yv/cvx9w8mzzamJmIa4zTW?=
	=?us-ascii?Q?TLgbBMUikdfCyIAdeHKGbC+CIi94MGjV4Cu9E7+3Tdls/iT6XXfkrwpIfkGa?=
	=?us-ascii?Q?kEl1jFsUFJamkMdwvhs4E68JtiCOi69CQt5yi2QocI1iknEZ8DZs/oE/pcsy?=
	=?us-ascii?Q?RazQ762WlZ14C2Xm+rnzeSYrQ7qeqDMOlonNluIutDw/Obq5noBm8apVQe9X?=
	=?us-ascii?Q?LIaDqU2KHpJOm86jj0HgvBF3O+A3iFzzfzp1j77LeLhx1rwSCDm5ffAydjYe?=
	=?us-ascii?Q?tK1lIJlGgfsmJrEuPQE8cljkAKL34cWevFMRveTBUp/1biQmorGCJdLm2S87?=
	=?us-ascii?Q?fpNUjtQkZhLkdGQzKhUD7il4XfAPXVg/od14prLzuupmKzqAescbR17PMbzs?=
	=?us-ascii?Q?BPtOFIm9e1RJb4M0t5Mkh20Zjo47lEgHVrQ2HEClCf7wdTwXCeyAAOKELV7Z?=
	=?us-ascii?Q?bfuzKIRgee5IBhVDsGwP3ASFytxmRWBiAl8FGiWimjDwNqIZgiw4gWm1PH2z?=
	=?us-ascii?Q?17EDmPVrKpnWK51CIsV+TX?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1648;
	5:A8HEQ/M+8xaqPD6Vm9bYMO0l9E7wBPiZtvxd/dSuzW0FezLuKGnXTQfk3hduKuNFrnckLvgDxFJgjhHRhj0AVtNH/ev81RbtAuXzXnkUgsHUzB3XiUM3ydw/oHU8ExUogAu88BykSdGGYr7ZmpKfQqP5cp56YPvRjkUd1iVYeyUeH3yLW2kTCuYtArpetFqX024WzuDkj9Coq+t+uL/I+sFx3JCY0KVsTb22QClBwg4rqRB320ZduopltF3SB+5LCWGXx2F+lVCLx5epG/aBe/VHRvqYHzYvNyVAxCQoMbiWhMjBRDY1w7CVPCKzTTT7OUa+5a6PH6r34IVKLQTJElKX8YzeHJfgQQjc715MmG80triOVvJFqT94Zpt+u8oK7I3o+5R7Ja3TSB9iMIlWjJHUrkvhdTccoBdvs7r+9oZI40Ww1z9vgZL09fzduocENPRx103/85Ru6cdylqnXVxqGd5CnSb/Pbx/9YlSsdwQwCXQfOKBMB5BQQjPNiqgz;
	24:nJl/thSbKEVp7FYmfY8YJ1mHOmNDyFi96CgJzFW4zotXMX3fe+wql7vQC7EQpImnjtpJ5lxeRe2g2r15vWmFfETu6hj+HEskGVdluw7frLs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1648;
	7:ZriCBcDHY6B3BEw8Kjz/BNq+zjLo7jx8FfVzDA78yHGdURKcDWD+DCIm4EPmqFr3SpoEiLWxSpeo6n8PgWaQdjiw7SVhjv0jGXWLmpslF7JTMAVYoMr0xIlY377ENQB7Tx29zhlg8Cy5lbaFId/THiR77zS2H357HDSr90Rz3mGpVqtBKP2EQ8PKqnmAYRz4hg56peCWjuO/oYSr+ArwvPMYduTOaonBbGJl+mlvB3FsCPvERJCS1nN9Pm9P3HKB8fLeGgDWHu7utiTS3Ebj26pVBJ84Btzy43UkTvO3mrnM3/6ai4nLCWhYuZLkO+EkotCTkLl5v3gvuSUzYdCvhqf+bm6AFgogFdcAs3sAbq1tONC3HInLO6LUydoJDfpRTrgqjXFk9843zaLGF6WCxQTbECH4RofwvsasRVFNoYkFSHxFdA+HJ2SfrfeBR7KuhZsfV/S9Q5Uc/EiHd4ekE4x1XEDpavTmObzOpzxIj4Hl6HPjuY7VvRkM7JYKAKSOLumeSjGRTjZR5bszYQB7v28GH4dj/7hVnsnhTNH10wGsuHd0ZTSYOJdY2atIfafC21pN3jEJ9UbR3WyMvn8wXnIu1FwwCNL8WdFe3t1B0DVkfErFGF5MgNzLftuWp0l1dEruipYirAp6guvKfbR8vUJ4b2E1Go+qCNjAjxS/dftQzfZ7hTMOv7cgyQuPvUu4jxt/Ol2zOiF094JIocON9lrKVN3MKLBKkq1I3FkJ5xHCxENfxg4q6Dd0WYT1mwfo9VA9hkqytoNJbPYEd4ctePHuz/X5gx7Tt1qQR9rdQxg=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2017 02:56:28.0579 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1648
Subject: [PATCH 1/2] mirrors: Add HTTP mirrors for ftp://sourceware.org
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
X-List-Received-Date: Fri, 30 Jun 2017 03:30:58 -0000
Content-Type: text/plain

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 meta/classes/mirrors.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index b7c20b6cf5a2..8cc1a315c480 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -45,6 +45,9 @@ ${APACHE_MIRROR}  http://archive.apache.org/dist \n \
 http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n \
 ${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases \n \
 ${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \n \
+ftp://sourceware.org http://mirrors.kernel.org/sourceware \n \
+ftp://sourceware.org http://gd.tuwien.ac.at/gnu/sourceware \n \
+ftp://sourceware.org http://ftp.gwdg.de/pub/linux/sources.redhat.com/sourceware \n \
 cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
-- 
2.13.2.3.g44cd85c14


