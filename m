Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0089.outbound.protection.outlook.com [104.47.34.89])
	by mail.openembedded.org (Postfix) with ESMTP id 373906093D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 23:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=y2uWwn7PtpoJ852nAIeoyyX/Fq4Aj26QMqYwsQHO2ZA=;
	b=dJI5jjkx3SAlMqBa7GAhxJzmEnlCiDMMie1Zcqmtxtd9aVtD7bdg28oFvHsDBKepLa5mtJ42PWdpAOwDqmEikxHmaqQKuQoIendg/kIWZ70XM+pTqkFORwgQ5NfWvZVOO2APoMLi3YntH7FTtW96S4aNKe7IqOtk3qB8R6c6np4=
Received: from CY4PR02CA0011.namprd02.prod.outlook.com (10.169.188.21) by
	SN1PR02MB1342.namprd02.prod.outlook.com (10.162.0.148) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Mon, 29 Jan 2018 23:54:49 +0000
Received: from SN1NAM02FT021.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by CY4PR02CA0011.outlook.office365.com
	(2603:10b6:903:18::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.444.14 via
	Frontend Transport; Mon, 29 Jan 2018 23:54:48 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT021.mail.protection.outlook.com (10.152.72.144) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.444.13
	via Frontend Transport; Mon, 29 Jan 2018 23:54:48 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:40856
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1egJGB-00069m-Tp; Mon, 29 Jan 2018 15:54:47 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1egJGB-0000PJ-QI; Mon, 29 Jan 2018 15:54:47 -0800
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1egJG1-0000Ns-LR; Mon, 29 Jan 2018 15:54:37 -0800
To: Derek Straka <derek@asterius.io>, Tim Orling <ticotimo@gmail.com>
References: <1516994731-20440-1-git-send-email-derek@asterius.io>
	<339ae59d-fd5e-47e1-9b4a-3fd9e5195877@xilinx.com>
	<CADNbA1pYtBP_HN--U3zNsVADeR-RW3+1cXhm+WGobRB6TuYv2g@mail.gmail.com>
	<CADNbA1rJZ0eZMcTBUdikdq854DP9GrmXZKum7p8YZZ8dk2sK8g@mail.gmail.com>
	<CANx9H-Cgi=3-NsB5yKsxpkxb6eH0_u527o2axo6-aij_qXdm9Q@mail.gmail.com>
	<CADNbA1p0mSiYKu62m7U1S4pq4kwL6cz05ToWs6z-q5WmZYUOqA@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <cc615b8f-a2e8-0746-f327-36a45b718031@xilinx.com>
Date: Mon, 29 Jan 2018 15:54:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CADNbA1p0mSiYKu62m7U1S4pq4kwL6cz05ToWs6z-q5WmZYUOqA@mail.gmail.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(346002)(376002)(39860400002)(39380400002)(2980300002)(438002)(189003)(199004)(5423002)(31686004)(8676002)(270700001)(93886005)(81166006)(31696002)(81156014)(65826007)(63266004)(8936002)(36756003)(575784001)(84326002)(1720100001)(5660300001)(2950100002)(2906002)(106002)(110136005)(16586007)(316002)(53386004)(65956001)(58126008)(966005)(54906003)(65806001)(37036004)(9786002)(53946003)(33964004)(64126003)(54896002)(236005)(53546011)(478600001)(16200700003)(336011)(606006)(76176011)(83506002)(229853002)(59450400001)(186003)(26005)(77096007)(106466001)(4326008)(39060400002)(36386004)(356003)(6246003)(6306002)(107986001)(5001870100001)(559001)(569006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1342; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT021;
	1:7BufDnzJ4j6GIHRg77t7Imz7vc6PFGsbhrz14Q/+hlmX83DGFGFBQlW54uDHt2oj7RzguRaVsOR0Iy67XFT2Pu6Bo2xo74rF58EW5DPOtrKUKoK11NRXPOwBBX+vDc71
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91809f25-4750-4c7f-8f2b-08d56773ae6b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:SN1PR02MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1342;
	3:iHIqZ+vPoZKtO3Qj9naVyImThwV9GePZei2IMXy6VUukrtt9OCoqYYu5ieMsxKFYtRDghS56gkFWTt7TOjOzYaAuXXr4EXAGFNKAYP8haFZkPnLkzKqXGu/szRbyj2QHFetiM2o/sTu9DQHLTR5hTmw5HnBbQpWeZ2yX6MPNtfRBpjsLOJgQ+vmgQqNotwdSSa0Absp+3lm9+ueMCj0cRIhJb5RaGPOO7+TdJjCYL+QlVoxs7zmMPkT9FNTwyBqHkELbAS5A9dYKE9fvdjO0uGytJsoaA9uXUWPZEPrrTgwooIidGbQ7kA8pF8IKTnpPyaeJrCvDaOd04309oAxw4EO/RBBXkMuVtVRS9Y5H4ic=;
	25:pFv9okYhsERQZlUMK1PB1jxbPGBkgi024uYsRtCku5hlbO3UG3qIW+hup3QTYMV/AnHOmRPfMLZ0kr7E+pieeN0BJ4fg3RGJq/kP83ub6SZh7NUqXDOtKUMrtcJHqO+/MmSRcd+oLxL3AEeA1XZKQyeF1ihP8rXuAmj6jHkXLcXvFuLqyZ4MRrMbfUq9MVUQ3eYGFQN5FI2a+clUJOZpqPOv+tgPRX/aFv+K2AsXt4A5AW5b2tWoP0qRXTrpkSidfiNMRfWNjC9F3HyWETLcsyYZNMJAJl4qhhNgMtj1I6oSg2I7mvxlATzcJuC3OiUPtP+WvZ5dFb+5pdTl8pAEvBz0xas+nF3715aGjgoHEVA=
X-MS-TrafficTypeDiagnostic: SN1PR02MB1342:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1342;
	31:pEjkLboJjUcB+tcmBxaTwu5pDzfs7f2tIwTr5f1tQWokulSn7rIrkcwOYU6/+/nnnnOK8My9YZPDZZ573q2F9/e4thk0jlskMQQdqGvBnkI7Av2SPys4HWnjL8pAsqA/u/2wWwehz4cL9GdyUNvYAzH1ExhmfNBMlosyfX0q2eJSjKisYW700gyb5pFOvOTXZh8s6lyO2w2Inv81Phc/Pz6v/Ib+ReWoAOkk95Gv75o=;
	20:eVcEeC5xVqmbPoX36Si+ELU6RWvlq821MVFeuDo6OMXMCKFd05b1p2FpfEtwFGsFVMnufwPzFD2M0nOS37luReevM7CuQbJ7phKD+BC01SN8myq48MDOyif81oOK/BITWdaZLWZLq4DZjAXYLD8GsNmeqf4sTpzhTPtElIaqI8maZTGSWcfs68v6aR6RJ73JIwn2WbF4JCOShuy7ZjkRtBmnIJLSr+Nebecj7Di3ipydvPz1/q13nptyeDAGLDOtoCDlOMpSBhuycahY53WBYUGcHH9Nuf8Cah/f4hxw+6HHGnNaF3aIh9kDlmvPOpXkzUOxMn42ZY7rPFDxLuEPglLmAX4DW2fkA1UkoB7YUKho42X5vhj5hwnt9mr7GTQSb7t8+RxeLXF+lyUMuzFLyQ5PxP5ONwCzqh4uzGmfv/sqGHVeFPkWCjTdiOIQyqHLWQWoyoG70MPmjdXMoGZSb9/udBF44W18fmLIycnCtg2besjj19iFMJ1vIbgFf2qh
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN1PR02MB1342B7F0A1D771612755600BACE50@SN1PR02MB1342.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(48706222282353)(85827821059158)(264703809997249)(192813158149592)(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(3231101)(944501161)(10201501046)(93006095)(93004095)(6055026)(6041288)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(6072148)(201708071742011);
	SRVR:SN1PR02MB1342; BCL:0; PCL:0; RULEID:; SRVR:SN1PR02MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1342;
	4:SG+VkbBSgc4PYtjy9IFSMcZjAb2V13KBp/OK+rNaG+SIxavZKLAlxi7vVykbmb+I8SCi5oIuJKDhzZn8kCEcFUcP8wIzhyI1GvZG1rq5mcYCgPXm4rJ4gItNymnPu72QGjTwbNlus8b9gNk+Xo6QSMnZnNfsIuRch12ocavTJ0oDe6EiLV99/AYF3CflKShpT0833Rri6/9mJPuMjS2r7dimLgui70ZCWMRc5NbbLTQwo+lSHd+nKEXwkUXByND/b7cj+2c8hkgh3jVSa55fQvD3D41PxJ7OvljiPTdR6QXQM5gomlL/r0s/8oEkSNIQF4AYmQg4oX7FrThYhhcDsCYz3UCW/semfBj1hUulguqQ7tCWgG6HAMvTorY6ZfNwZdMUQwkx9enazDjV1ph94631r8a+vpu6YIFFdq63xX9h8iRdoT/qY94T2RL8eIrPrW9Gq4dSceOi/8bCzTP8Pg==
X-Forefront-PRVS: 0567A15835
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1342;
	23:aZCe4s1F54SxkIT7JeHHn5vaD5uZrDBoXyxG6SYnj?=
	=?us-ascii?Q?SjERxF2TrwsseHBinN44okM2WO5+XbArxWwcJgcaqtdNoBjEaO96BG/qntfn?=
	=?us-ascii?Q?mbaZ0Z4I243bSTkX0xOKlTwmhYbDenJZJFj0PYM1dhUvtKzXM6a/cmLjsbRe?=
	=?us-ascii?Q?oIPyoMbt4KC4R0++S9rSyzYZCTI4bmrJPoAqg7ybxznmht7N0bCefYPBfaLP?=
	=?us-ascii?Q?P8MAbysv6SWzLpi43OPcOHqqi2irEpnWDS4XklOKv4ZPpI1Wt4lLA5OtocpN?=
	=?us-ascii?Q?HLElR1UFIsEeNvDVhnJqVi6F7/DviWKm3avAF61NgifaRu8Eiv46VrhXie3o?=
	=?us-ascii?Q?UdPZRYjcxmiSfnsPgF4s+n9m/stUidjzxAERG0o1q+gkwOOnq98Rt0F7jP77?=
	=?us-ascii?Q?Gy6ThNS41emQm07bCYBTQJq1X1I8oVo2Oa2qR6Y1e72ICo5wM1Po23ZRvbBG?=
	=?us-ascii?Q?clwpCZYy2vbmguqcyyWRa6LwHD19BeX4lmB3nm1rQ6UuKo1wvUDEBcngNm3I?=
	=?us-ascii?Q?jk1gaEJ58H7PTGpXGfIQajevfCPMHyU4N/zMZwWUmAXXW4SPCO8A78b1mehv?=
	=?us-ascii?Q?JDRtI6Zp2weYRzrB2ZDSPs+HJgprVlydhbdl/Z/pJlcNnAdoAejJrxfqG6cT?=
	=?us-ascii?Q?upTWZJcsTzVhv5CMDs0HLeWNdJ19LeKeMrW8K0DfqlsdfMVCSn4zuGTv9p7Y?=
	=?us-ascii?Q?QYkS7zaMorXufuRj8hOXZJMqA0lOJRpv+qfFNLIwf8a3V9/L875+uVYQ7K3M?=
	=?us-ascii?Q?XzhDF24MSiFIz1p0QIhlk87g2szFpKTC4Zj3h2X9EjzPFxMu0IljPLnaxLBH?=
	=?us-ascii?Q?vAhqhCWN3E30sCabkVK4ZCD3YjQZyEFOx6JIiJ8hekCqMxiz5Ppfmun58fUg?=
	=?us-ascii?Q?cKcGWz+K+4NYpDWL04PtSUmjg+ge1lsbajx7WKSLffIdkqgFnKJ++gQ2fkQZ?=
	=?us-ascii?Q?Jn91GXdtk1TiqWsHaJqJf3aM0CtFW6D0SNC7/rwI9L3ckJJMupK8gOVAqhD5?=
	=?us-ascii?Q?CJ0qNcW38i+Ynkpkoh3yukiENzKnG+kAsRTY+O3TQd650cbhOeNIU9Or0/ve?=
	=?us-ascii?Q?El8BjFtPrOHbGXTxcVOeR9FdrEDlyqsO37yrtvfzyvyKG541fOE1VqkAbkrJ?=
	=?us-ascii?Q?53nPxBk/NfkMjE6/pCwLy4tF/b9KT4+cyLyoh2+VA58ar8fJv27D0MzbcITv?=
	=?us-ascii?Q?cHpcB7f3HF43WyJtZ7kQFSszA1CryUnR0Ig9fYwE/Gh4cXL/kdY3i13vZyP9?=
	=?us-ascii?Q?j+UdaEEjIIRzJNsc5iJIkwLWWebUT1x/Lx+7M5quCpFJFxAa04ACJKP+fRtg?=
	=?us-ascii?Q?fHhkG1K03n5E9vo0Zk7r4w6D9eTBG2fi87SqoWNmffGp+S04VAVA0/5WD+CH?=
	=?us-ascii?Q?frj8TL9Ir9HTlieGxq3pWpaczUhjA++/IgGkkXLJgJfv0T/Y/g6XOAdmhB4X?=
	=?us-ascii?Q?m1HRU86Fv20pb0aNdsaPJmIJrzKPyQSdI4XOZc7YqU2ehADNpH3/GWwQmoFF?=
	=?us-ascii?Q?6SJKUoBPZ+2u+rSOKW4Ot0rxe2n1Cl1psYOVTRP9srSvwO6dL0ewnAr?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1342;
	6:qZx9bpsgtC+aA9zLw1MSONc1Rej6pHTW9vXZlPNFOP8+u0jrBnefPe5/fgfGiyR7Zp7CpwozmtqDcmBF2DlgdMVFxRQJkGsHVYXCDy8Qig9fNxfPZoQhFO5+6/pVAdVPGGF5J83LDdy1VtZ+qVQOfkW0rj7vSrs+dsjejThWMTR+ldCtiBdSsY3RTiRuEXuldF3a3kPM8szPMIY/K8SRTqoW/c4d8+zqWpIn7H9Xk9FRU8NdduzO3mFmHSih7tVBN3xSt2UP/R4L3GFn+uIZQg3Bm5l16rhMCyg00EbDzt7HkTfljHc6JVLW8HhGNosXxcv+NP8FBpdRdO99UZxkQt4jo/3RQhXebOpN6wIKXJY=;
	5:Jxli97dtyo72XSMsf0UAAtMtCsQVGLBxeU1IFfqFl9z2Go0b2Ph0MPmJwODkHW5aKTnNwlaV2uih6ZJpww9f6G202TZVFLaIgyKw9QpI8HLOA2AgLwN2ANnh7zP5dxoFJOS7cuiGdbvNmK/OLlwWMbfmglVXboJcXF1R6LYbyhI=;
	24:SjGLsEhukAimOmLIzW335cQ1xuSnwKd9+k0tnVQK9vASUeIZRWzyMa7kCKBDQ4M2uNVdh0rOXVRkpFXMZnb92KfFX4ZzLcMVwilhuFLi9Iw=;
	7:q55rf4SyINxzZy3GWyVrEj9EzbvPrIY3cDKkxzebV29d7ix8UkQci7xAPDS+fQp/NQNh5qmKH12jj7/NGBi/773jkKgR8a5dRvTaUYbu30UFPmSMEUU4fvQ0BAy26wAcWOm1jmUnd0jnlD4NpWND+1Fdkgegzx4MnOhAD9qq6e1jL3tAVsTo3kpuppyxmDx49v/ihydYL/JOzFUv/a6ENYSpWc7QnhwAE5OJdKPbqDb1nSyPGxKKf73IGLbZo2qF
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2018 23:54:48.5321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91809f25-4750-4c7f-8f2b-08d56773ae6b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1342
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python: Upgrade both python and python-native to 2.7.14
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
X-List-Received-Date: Mon, 29 Jan 2018 23:54:51 -0000
Content-Type: multipart/alternative;
	boundary="------------D756B8065D176580DAE3490C"
Content-Language: en-US

--------------D756B8065D176580DAE3490C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Derek,


Likely caused by an incomplete python-native build:


I did a quick build for python-native (2.7.14) and looking at do_compile 
I get:


Python build finished, but the necessary bits to build these modules 
were not found:
_bsddb             _tkinter           bsddb185
dbm                dl                 imageop
sunaudiodev
To find the necessary bits, look in setup.py in detect_modules() for the 
module's name.

Failed to build these modules:
gdbm


So whats happening is that python-native does not contain those files, 
and the script to create the manifest runs against python-native, hence 
why its dropping the files (it assumes they were dropped from the python 
release).

So we just need to make sure we have a complete python-native build and 
the script should run fine, the same goes for python3.


In gdbm's case, we had the same error for python3 and it was fixed here:


http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=2afde7e7bd866c4d3d059229c3c2201b7096e5e6


Cheers,


Alejandro


On 01/29/2018 12:32 PM, Derek Straka wrote:
> Nope.  I'm using Ubuntu 16.04.
>
> On Mon, Jan 29, 2018 at 3:17 PM, Tim Orling <ticotimo@gmail.com 
> <mailto:ticotimo@gmail.com>> wrote:
>
>
>     On Mon, Jan 29, 2018 at 12:02 PM Derek Straka <derek@asterius.io
>     <mailto:derek@asterius.io>> wrote:
>
>         It looks like the .so files (specifically gdbm and bsddb) are
>         getting dropped from the manifest when I run the create
>         manifest task.  I'll have to take a look at why those aren't
>         getting pulled into the dependency list.
>
>
>     Are you on Fedora-27 by any chance? It broke for me. Worked on
>     Fedora-26.
>
>
>         On Mon, Jan 29, 2018 at 2:49 PM, Derek Straka
>         <derek@asterius.io <mailto:derek@asterius.io>> wrote:
>
>             Oh no, I did not.  I will send a v2 with an updated
>             manifest.  Thanks for catching that.
>
>             -Derek
>
>             On Mon, Jan 29, 2018 at 2:23 PM, Alejandro Enedino
>             Hernandez Samaniego
>             <alejandro.enedino.hernandez-samaniego@xilinx.com
>             <mailto:alejandro.enedino.hernandez-samaniego@xilinx.com>>
>             wrote:
>
>                 Hey Derek,
>
>
>                 Just a quick question, did you run the create manifest
>                 task along with the upgrade?
>
>
>                 Cheers,
>
>
>                 Alejandro
>
>
>
>                 On 01/26/2018 11:25 AM, Derek Straka wrote:
>
>                     Rebased:
>                        - python/01-use-proper-tools-for-cross-build.patch
>                        - python/fix-makefile-for-ptest.patch
>                        - python/parallel-makeinst-create-bindir.patch
>
>                     Removed Upstreamed Patch:
>                        - python/Don-t-use-getentropy-on-Linux.patch
>
>                     Updated license checksum for changes in the
>                     copyright date.  The license
>                     terms remain unchanged
>
>                     Added an extra do_compile item to create the
>                     native pgen that no longer
>                     gets compiled by default
>
>                     Signed-off-by: Derek Straka <derek@asterius.io
>                     <mailto:derek@asterius.io>>
>                     ---
>                       ...on-native_2.7.13.bb
>                     <http://on-native_2.7.13.bb> =>
>                     python-native_2.7.14.bb
>                     <http://python-native_2.7.14.bb>} |  6 ++++
>                     meta/recipes-devtools/python/python.inc          
>                     |  6 ++--
>                     .../01-use-proper-tools-for-cross-build.patch    
>                     | 17 +++++----
>                       .../python/Don-t-use-getentropy-on-Linux.patch  
>                      | 41 ----------------------
>                       .../python/python/fix-makefile-for-ptest.patch  
>                      |  6 ++--
>                     .../python/parallel-makeinst-create-bindir.patch
>                      | 12 +++----
>                       .../python/{python_2.7.13.bb
>                     <http://python_2.7.13.bb> => python_2.7.14.bb
>                     <http://python_2.7.14.bb>} |  1 -
>                       7 files changed, 28 insertions(+), 61 deletions(-)
>                       rename
>                     meta/recipes-devtools/python/{python-native_2.7.13.bb
>                     <http://python-native_2.7.13.bb> =>
>                     python-native_2.7.14.bb
>                     <http://python-native_2.7.14.bb>} (94%)
>                       delete mode 100644
>                     meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
>                       rename
>                     meta/recipes-devtools/python/{python_2.7.13.bb
>                     <http://python_2.7.13.bb> => python_2.7.14.bb
>                     <http://python_2.7.14.bb>} (99%)
>
>                     diff --git
>                     a/meta/recipes-devtools/python/python-native_2.7.13.bb
>                     <http://python-native_2.7.13.bb>
>                     b/meta/recipes-devtools/python/python-native_2.7.14.bb
>                     <http://python-native_2.7.14.bb>
>                     similarity index 94%
>                     rename from
>                     meta/recipes-devtools/python/python-native_2.7.13.bb
>                     <http://python-native_2.7.13.bb>
>                     rename to
>                     meta/recipes-devtools/python/python-native_2.7.14.bb
>                     <http://python-native_2.7.14.bb>
>                     index 2b74003..622cb38 100644
>                     ---
>                     a/meta/recipes-devtools/python/python-native_2.7.13.bb
>                     <http://python-native_2.7.13.bb>
>                     +++
>                     b/meta/recipes-devtools/python/python-native_2.7.14.bb
>                     <http://python-native_2.7.14.bb>
>                     @@ -36,6 +36,12 @@ do_configure_append() {
>                             autoreconf --verbose --install --force
>                     --exclude=autopoint
>                     ../Python-${PV}/Modules/_ctypes/libffi
>                       }
>                       +# Regenerate all of the generated files
>                     +# This ensures that pgen and friends get created
>                     during the compile phase
>                     +do_compile_prepend() {
>                     +    oe_runmake regen-all
>                     +}
>                     +
>                       do_install() {
>                             oe_runmake 'DESTDIR=${D}' install
>                             install -d ${D}${bindir}/${PN}
>                     diff --git
>                     a/meta/recipes-devtools/python/python.inc
>                     b/meta/recipes-devtools/python/python.inc
>                     index b40f551..979b601 100644
>                     --- a/meta/recipes-devtools/python/python.inc
>                     +++ b/meta/recipes-devtools/python/python.inc
>                     @@ -5,12 +5,12 @@ SECTION = "devel/python"
>                       # bump this on every change in
>                     contrib/python/generate-manifest-2.7.py
>                     <http://generate-manifest-2.7.py>
>                       INC_PR = "r1"
>                       -LIC_FILES_CHKSUM =
>                     "file://LICENSE;md5=6b60258130e4ed10d3101517eb5b9385"
>                     +LIC_FILES_CHKSUM =
>                     "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
>                         SRC_URI =
>                     "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz
>                     <http://www.python.org/ftp/python/$%7BPV%7D/Python-$%7BPV%7D.tar.xz>"
>                       -SRC_URI[md5sum] =
>                     "53b43534153bb2a0363f08bae8b9d990"
>                     -SRC_URI[sha256sum] =
>                     "35d543986882f78261f97787fd3e06274bfa6df29fac9b4a94f73930ff98f731"
>                     +SRC_URI[md5sum] = "1f6db41ad91d9eb0a6f0c769b8613c5b"
>                     +SRC_URI[sha256sum] =
>                     "71ffb26e09e78650e424929b2b457b9c912ac216576e6bd9e7d204ed03296a66"
>                         # python recipe is actually python 2.x
>                       # also, exclude pre-releases for both python 2.x
>                     and 3.x
>                     diff --git
>                     a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
>                     b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
>                     index 366ce3e..e795a74 100644
>                     ---
>                     a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
>                     +++
>                     b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
>                     @@ -9,6 +9,9 @@ Signed-off-by: Paul Eggleton
>                     <paul.eggleton@linux.intel.com
>                     <mailto:paul.eggleton@linux.intel.com>>
>                       Rebased for python-2.7.9
>                       Signed-off-by: Alejandro Hernandez
>                     <alejandro.hernandez@linux.intel.com
>                     <mailto:alejandro.hernandez@linux.intel.com>>
>                       +Rebased for python-2.7.14
>                     +Signed-off-by: Derek Straka <derek@asterius.io
>                     <mailto:derek@asterius.io>>
>                     +
>                       Index: Python-2.7.13/Makefile.pre.in
>                     <http://Makefile.pre.in>
>                     ===================================================================
>                       --- Python-2.7.13.orig/Makefile.pre.in
>                     <http://Makefile.pre.in>
>                     @@ -30,14 +33,14 @@ Index:
>                     Python-2.7.13/Makefile.pre.in <http://Makefile.pre.in>
>                           # Create build directory and generate the
>                     sysconfig build-time data there.
>                        # pybuilddir.txt contains the name of the build
>                     dir and is used for
>                     -@@ -681,7 +682,7 @@ Modules/pwdmodule.o:
>                     $(srcdir)/Modules/p
>                     -
>                     - $(GRAMMAR_H): @GENERATED_COMMENT@
>                     $(GRAMMAR_INPUT) $(PGEN)
>                     +@@ -663,7 +663,7 @@
>                     +       # Regenerate Include/graminit.h and
>                     Python/graminit.c
>                     +       # from Grammar/Grammar using pgen
>                             @$(MKDIR_P) Include
>                     --      $(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H)
>                     $(GRAMMAR_C)
>                     -+      $(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H)
>                     $(GRAMMAR_C)
>                     - $(GRAMMAR_C): @GENERATED_COMMENT@ $(GRAMMAR_H)
>                     -       touch $(GRAMMAR_C)
>                     +-      $(PGEN) $(srcdir)/Grammar/Grammar \
>                     ++      $(HOSTPGEN) $(srcdir)/Grammar/Grammar \
>                     +  $(srcdir)/Include/graminit.h \
>                     +  $(srcdir)/Python/graminit.c
>                          @@ -1121,27 +1122,27 @@ libinstall:       
>                     build_all $(srcdir)/Lib/$(PL
>                     $(DESTDIR)$(LIBDEST)/distutils/tests ; \
>                     diff --git
>                     a/meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
>                     b/meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
>                     deleted file mode 100644
>                     index 38e5377..0000000
>                     ---
>                     a/meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
>                     +++ /dev/null
>                     @@ -1,41 +0,0 @@
>                     -Upstream-Status: Backport
>                     -
>                     -Signed-off-by: Andreas Oberritter
>                     <obi@opendreambox.org <mailto:obi@opendreambox.org>>
>                     -
>                     -From 905d1b30ac7cb0e31c57cec0533825c8f170b942 Mon
>                     Sep 17 00:00:00 2001
>                     -From: Victor Stinner <victor.stinner@gmail.com
>                     <mailto:victor.stinner@gmail.com>>
>                     -Date: Mon, 9 Jan 2017 11:10:41 +0100
>                     -Subject: [PATCH] Don't use getentropy() on Linux
>                     -
>                     -Issue #29188: Support glibc 2.24 on Linux: don't
>                     use getentropy() function but
>                     -read from /dev/urandom to get random bytes, for
>                     example in os.urandom().  On
>                     -Linux, getentropy() is implemented which
>                     getrandom() is blocking mode, whereas
>                     -os.urandom() should not block.
>                     -
>                     -(cherry picked from commit
>                     2687486756721e39164fa9f597e468c35d495227)
>                     ----
>                     - Python/random.c | 11 +++++++++--
>                     - 1 file changed, 9 insertions(+), 2 deletions(-)
>                     -
>                     -diff --git a/Python/random.c b/Python/random.c
>                     -index b4bc1f3..f3f5d14 100644
>                     ---- a/Python/random.c
>                     -+++ b/Python/random.c
>                     -@@ -94,8 +94,15 @@ win32_urandom(unsigned char
>                     *buffer, Py_ssize_t size, int raise)
>                     - }
>                     -
>                     - /* Issue #25003: Don't use getentropy() on
>                     Solaris (available since
>                     -- * Solaris 11.3), it is blocking whereas
>                     os.urandom() should not block. */
>                     --#elif defined(HAVE_GETENTROPY) && !defined(sun)
>                     -+   Solaris 11.3), it is blocking whereas
>                     os.urandom() should not block.
>                     -+
>                     -+   Issue #29188: Don't use getentropy() on Linux
>                     since the glibc 2.24
>                     -+   implements it with the getrandom() syscall
>                     which can fail with ENOSYS,
>                     -+   and this error is not supported in
>                     py_getentropy() and getrandom() is called
>                     -+   with flags=0 which blocks until system
>                     urandom is initialized, which is not
>                     -+   the desired behaviour to seed the Python hash
>                     secret nor for os.urandom():
>                     -+   see the PEP 524 which was only implemented in
>                     Python 3.6. */
>                     -+#elif defined(HAVE_GETENTROPY) && !defined(sun)
>                     && !defined(linux)
>                     - #define PY_GETENTROPY 1
>                     -
>                     - /* Fill buffer with size pseudo-random bytes
>                     generated by getentropy().
>                     diff --git
>                     a/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
>                     b/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
>                     index 669112d..90dcd57 100644
>                     ---
>                     a/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
>                     +++
>                     b/meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
>                     @@ -15,7 +15,7 @@ diff -ruN a/Makefile.pre.in
>                     <http://Makefile.pre.in> b/Makefile.pre.in
>                     <http://Makefile.pre.in>
>                       +TESTOPTS=    -l -v $(EXTRATESTOPTS)
>                        TESTPROG= $(srcdir)/Lib/test/regrtest.py
>                       -TESTPYTHON=  $(RUNSHARED) ./$(BUILDPYTHON) -Wd
>                     -3 -E -tt $(TESTPYTHONOPTS)
>                     --test:         all platform
>                     +-test:  @DEF_MAKE_RULE@ platform
>                       -             -find $(srcdir)/Lib -name
>                     '*.py[co]' -print | xargs rm -f
>                       +TESTPYTHON=  $(RUNSHARED) $(BUILDPYTHON) -Wd -3
>                     -E -tt $(TESTPYTHONOPTS)
>                       +test: build-test
>                     @@ -26,8 +26,8 @@ diff -ruN a/Makefile.pre.in
>                     <http://Makefile.pre.in> b/Makefile.pre.in
>                     <http://Makefile.pre.in>
>                     -$(TESTPYTHON) $(TESTPROG) $(TESTOPTS)
>                     $(TESTPYTHON) $(TESTPROG) $(TESTOPTS)
>                        -+build-test:        all platform
>                     ++build-test:  @DEF_MAKE_RULE@ platform
>                       +
>                     - testall:      all platform
>                     + testall: @DEF_MAKE_RULE@ platform
>                                     -find $(srcdir)/Lib -name
>                     '*.py[co]' -print | xargs rm -f
>                     $(TESTPYTHON) $(srcdir)/Lib/compileall.py
>                     diff --git
>                     a/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
>                     b/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
>                     index 951cb46..abab41e 100644
>                     ---
>                     a/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
>                     +++
>                     b/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
>                     @@ -8,12 +8,12 @@ Upstream-Status: Pending
>                         --- Python-2.7.3.orig/Makefile.pre.in
>                     <http://Makefile.pre.in>
>                       +++ Python-2.7.3/Makefile.pre.in
>                     <http://Makefile.pre.in>
>                     -@@ -1008,7 +1008,7 @@ LIBPL=  $(LIBP)/config
>                     +@@ -1187,7 +1187,7 @@
>                        LIBPC=  $(LIBDIR)/pkgconfig
>                     -
>                     - libainstall:  all python-config
>                     +
>                     + libainstall: @DEF_MAKE_RULE@ python-config
>                       -     @for i in $(LIBDIR) $(LIBP) $(LIBPL)
>                     $(LIBPC); \
>                       +     @for i in $(LIBDIR) $(LIBP) $(LIBPL)
>                     $(LIBPC) $(BINDIR); \
>                     -       do \
>                     -               if test ! -d $(DESTDIR)$$i; then \
>                     -                       echo "Creating directory
>                     $$i"; \
>                     +       do \
>                     +               if test ! -d $(DESTDIR)$$i; then \
>                     +                       echo "Creating directory
>                     $$i"; \
>                     diff --git
>                     a/meta/recipes-devtools/python/python_2.7.13.bb
>                     <http://python_2.7.13.bb>
>                     b/meta/recipes-devtools/python/python_2.7.14.bb
>                     <http://python_2.7.14.bb>
>                     similarity index 99%
>                     rename from
>                     meta/recipes-devtools/python/python_2.7.13.bb
>                     <http://python_2.7.13.bb>
>                     rename to
>                     meta/recipes-devtools/python/python_2.7.14.bb
>                     <http://python_2.7.14.bb>
>                     index dbafb95..13455ff 100644
>                     ---
>                     a/meta/recipes-devtools/python/python_2.7.13.bb
>                     <http://python_2.7.13.bb>
>                     +++
>                     b/meta/recipes-devtools/python/python_2.7.14.bb
>                     <http://python_2.7.14.bb>
>                     @@ -28,7 +28,6 @@ SRC_URI += "\
>                     file://parallel-makeinst-create-bindir.patch \
>                     file://use_sysroot_ncurses_instead_of_host.patch \
>                     file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
>                     \
>                     - file://Don-t-use-getentropy-on-Linux.patch \
>                     file://pass-missing-libraries-to-Extension-for-mul.patch
>                     \
>                     file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch
>                     \
>                       "
>
>
>
>         --
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>


--------------D756B8065D176580DAE3490C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hey Derek,</p>
    <p><br>
    </p>
    <p>Likely caused by an incomplete python-native build:</p>
    <p><br>
    </p>
    <p>I did a quick build for python-native (2.7.14) and looking at
      do_compile I get:</p>
    <p><br>
    </p>
    <p>Python build finished, but the necessary bits to build these
      modules were not found:<br>
      _bsddb             _tkinter           bsddb185    <br>
      dbm                dl                 imageop    <br>
      sunaudiodev    <br>
      To find the necessary bits, look in setup.py in detect_modules()
      for the module's name.<br>
      <br>
      Failed to build these modules:<br>
      gdbm  <br>
    </p>
    <p><br>
    </p>
    <p>So whats happening is that python-native does not contain those
      files, and the script to create the manifest runs against
      python-native, hence why its dropping the files (it assumes they
      were dropped from the python release).</p>
    <p>So we just need to make sure we have a complete python-native
      build and the script should run fine, the same goes for python3.</p>
    <p><br>
    </p>
    <p>In gdbm's case, we had the same error for python3 and it was
      fixed here:</p>
    <p><br>
    </p>
    <p><a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=2afde7e7bd866c4d3d059229c3c2201b7096e5e6">http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=2afde7e7bd866c4d3d059229c3c2201b7096e5e6</a><br>
    </p>
    <p><br>
    </p>
    <p>Cheers,</p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/29/2018 12:32 PM, Derek Straka
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADNbA1p0mSiYKu62m7U1S4pq4kwL6cz05ToWs6z-q5WmZYUOqA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Nope.  I'm using Ubuntu 16.04.</div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Mon, Jan 29, 2018 at 3:17 PM, Tim
          Orling <span dir="ltr">&lt;<a
              href="mailto:ticotimo@gmail.com" target="_blank"
              moz-do-not-send="true">ticotimo@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div><br>
              <div class="gmail_quote"><span class="">
                  <div dir="auto">On Mon, Jan 29, 2018 at 12:02 PM Derek
                    Straka &lt;<a href="mailto:derek@asterius.io"
                      target="_blank" moz-do-not-send="true">derek@asterius.io</a>&gt;
                    wrote:<br>
                  </div>
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    <div>It looks like the .so files (specifically gdbm
                      and bsddb) are getting dropped from the manifest
                      when I run the create manifest task.  I'll have to
                      take a look at why those aren't getting pulled
                      into the dependency list.</div>
                  </blockquote>
                  <div dir="auto"><br>
                  </div>
                </span>
                <div dir="auto">Are you on Fedora-27 by any chance? It
                  broke for me. Worked on Fedora-26.</div>
                <blockquote class="gmail_quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">
                  <div>
                    <div class="h5">
                      <div class="gmail_extra"><br>
                        <div class="gmail_quote">On Mon, Jan 29, 2018 at
                          2:49 PM, Derek Straka <span>&lt;<a
                              href="mailto:derek@asterius.io"
                              target="_blank" moz-do-not-send="true">derek@asterius.io</a>&gt;</span>
                          wrote:<br>
                          <blockquote class="gmail_quote"
                            style="margin:0 0 0 .8ex;border-left:1px
                            #ccc solid;padding-left:1ex">
                            <div>Oh no, I did not.  I will send a v2
                              with an updated manifest.  Thanks for
                              catching that.<span
                                class="m_-2297696840625107287m_-3505537724810913327HOEnZb"><font
                                  color="#888888">
                                  <div><br>
                                  </div>
                                  <div>-Derek</div>
                                </font></span></div>
                            <div
                              class="m_-2297696840625107287m_-3505537724810913327HOEnZb">
                              <div
                                class="m_-2297696840625107287m_-3505537724810913327h5">
                                <div class="gmail_extra"><br>
                                  <div class="gmail_quote">On Mon, Jan
                                    29, 2018 at 2:23 PM, Alejandro
                                    Enedino Hernandez Samaniego <span>&lt;<a
href="mailto:alejandro.enedino.hernandez-samaniego@xilinx.com"
                                        target="_blank"
                                        moz-do-not-send="true">alejandro.enedino.hernandez-<wbr>samaniego@xilinx.com</a>&gt;</span>
                                    wrote:<br>
                                    <blockquote class="gmail_quote"
                                      style="margin:0 0 0
                                      .8ex;border-left:1px #ccc
                                      solid;padding-left:1ex">Hey Derek,<br>
                                      <br>
                                      <br>
                                      Just a quick question, did you run
                                      the create manifest task along
                                      with the upgrade?<br>
                                      <br>
                                      <br>
                                      Cheers,<br>
                                      <br>
                                      <br>
                                      Alejandro
                                      <div
class="m_-2297696840625107287m_-3505537724810913327m_-808748226281533204HOEnZb">
                                        <div
class="m_-2297696840625107287m_-3505537724810913327m_-808748226281533204h5"><br>
                                          <br>
                                          <br>
                                          On 01/26/2018 11:25 AM, Derek
                                          Straka wrote:<br>
                                          <blockquote
                                            class="gmail_quote"
                                            style="margin:0 0 0
                                            .8ex;border-left:1px #ccc
                                            solid;padding-left:1ex">
                                            Rebased:<br>
                                               -
                                            python/01-use-proper-tools-<wbr>for-cross-build.patch<br>
                                               -
                                            python/fix-makefile-for-ptest.<wbr>patch<br>
                                               -
                                            python/parallel-makeinst-<wbr>create-bindir.patch<br>
                                            <br>
                                            Removed Upstreamed Patch:<br>
                                               -
                                            python/Don-t-use-getentropy-<wbr>on-Linux.patch<br>
                                            <br>
                                            Updated license checksum for
                                            changes in the copyright
                                            date.  The license<br>
                                            terms remain unchanged<br>
                                            <br>
                                            Added an extra do_compile
                                            item to create the native
                                            pgen that no longer<br>
                                            gets compiled by default<br>
                                            <br>
                                            Signed-off-by: Derek Straka
                                            &lt;<a
                                              href="mailto:derek@asterius.io"
                                              target="_blank"
                                              moz-do-not-send="true">derek@asterius.io</a>&gt;<br>
                                            ---<br>
                                              ...<a
                                              href="http://on-native_2.7.13.bb"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">on-native_2.7.13.bb</a>
                                            =&gt; <a
                                              href="http://python-native_2.7.14.bb"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">python-native_2.7.14.bb</a>}
                                            |  6 ++++<br>
                                             
                                            meta/recipes-devtools/python/<wbr>python.inc 
                                                      |  6 ++--<br>
                                             
                                            .../01-use-proper-tools-for-<wbr>cross-build.patch 
                                                | 17 +++++----<br>
                                              .../python/Don-t-use-<wbr>getentropy-on-Linux.patch 
                                               | 41
                                            ----------------------<br>
                                              .../python/python/fix-<wbr>makefile-for-ptest.patch 
                                               |  6 ++--<br>
                                             
                                            .../python/parallel-makeinst-<wbr>create-bindir.patch 
                                             | 12 +++----<br>
                                              .../python/{<a
                                              href="http://python_2.7.13.bb"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">python_2.7.13.bb</a>
                                            =&gt; <a
                                              href="http://python_2.7.14.bb"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">python_2.7.14.bb</a>} 
                                            |  1 -<br>
                                              7 files changed, 28
                                            insertions(+), 61
                                            deletions(-)<br>
                                              rename
                                            meta/recipes-devtools/python/{<a
href="http://python-native_2.7.13.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true"><wbr>python-native_2.7.13.bb</a>
                                            =&gt; <a
                                              href="http://python-native_2.7.14.bb"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">python-native_2.7.14.bb</a>}
                                            (94%)<br>
                                              delete mode 100644
                                            meta/recipes-devtools/python/<wbr>python/Don-t-use-getentropy-<wbr>on-Linux.patch<br>
                                              rename
                                            meta/recipes-devtools/python/{<a
href="http://python_2.7.13.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true"><wbr>python_2.7.13.bb</a>
                                            =&gt; <a
                                              href="http://python_2.7.14.bb"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">python_2.7.14.bb</a>}
                                            (99%)<br>
                                            <br>
                                            diff --git
                                            a/meta/recipes-devtools/<wbr>python/<a
href="http://python-native_2.7.13.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">python-native_2.7.13.bb</a>
                                            b/meta/recipes-devtools/<wbr>python/<a
href="http://python-native_2.7.14.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">python-native_2.7.14.bb</a><br>
                                            similarity index 94%<br>
                                            rename from
                                            meta/recipes-devtools/python/<a
href="http://python-native_2.7.13.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">p<wbr>ython-native_2.7.13.bb</a><br>
                                            rename to
                                            meta/recipes-devtools/python/<a
href="http://python-native_2.7.14.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">p<wbr>ython-native_2.7.14.bb</a><br>
                                            index 2b74003..622cb38
                                            100644<br>
                                            --- a/meta/recipes-devtools/<wbr>python/<a
href="http://python-native_2.7.13.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">python-native_2.7.13.bb</a><br>
                                            +++ b/meta/recipes-devtools/<wbr>python/<a
href="http://python-native_2.7.14.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">python-native_2.7.14.bb</a><br>
                                            @@ -36,6 +36,12 @@
                                            do_configure_append() {<br>
                                                    autoreconf --verbose
                                            --install --force
                                            --exclude=autopoint
                                            ../Python-${PV}/Modules/_<wbr>ctypes/libffi<br>
                                              }<br>
                                              +# Regenerate all of the
                                            generated files<br>
                                            +# This ensures that pgen
                                            and friends get created
                                            during the compile phase<br>
                                            +do_compile_prepend() {<br>
                                            +    oe_runmake regen-all<br>
                                            +}<br>
                                            +<br>
                                              do_install() {<br>
                                                    oe_runmake
                                            'DESTDIR=${D}' install<br>
                                                    install -d
                                            ${D}${bindir}/${PN}<br>
                                            diff --git
                                            a/meta/recipes-devtools/<wbr>python/python.inc
                                            b/meta/recipes-devtools/<wbr>python/python.inc<br>
                                            index b40f551..979b601
                                            100644<br>
                                            --- a/meta/recipes-devtools/<wbr>python/python.inc<br>
                                            +++ b/meta/recipes-devtools/<wbr>python/python.inc<br>
                                            @@ -5,12 +5,12 @@ SECTION =
                                            "devel/python"<br>
                                              # bump this on every
                                            change in contrib/python/<a
href="http://generate-manifest-2.7.py" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">generate-<wbr>manifest-2.7.py</a><br>
                                              INC_PR = "r1"<br>
                                              -LIC_FILES_CHKSUM =
                                            "<a class="moz-txt-link-freetext" href="file://LICENSE;md5=">file://LICENSE;md5=</a><wbr>6b60258130e4ed10d3101517eb5b93<wbr>85"<br>
                                            +LIC_FILES_CHKSUM =
                                            "<a class="moz-txt-link-freetext" href="file://LICENSE;md5=">file://LICENSE;md5=</a><wbr>f741e51de91d4eeea5930b9c3c7fa6<wbr>9d"<br>
                                                SRC_URI = "<a
href="http://www.python.org/ftp/python/$%7BPV%7D/Python-$%7BPV%7D.tar.xz"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">http://www.python.org/ftp/<wbr>python/${PV}/Python-${PV}.tar.<wbr>xz</a>"<br>
                                              -SRC_URI[md5sum] = "<wbr>53b43534153bb2a0363f08bae8b9d9<wbr>90"<br>
                                            -SRC_URI[sha256sum] = "<wbr>35d543986882f78261f97787fd3e06<wbr>274bfa6df29fac9b4a94f73930ff98<wbr>f731"<br>
                                            +SRC_URI[md5sum] = "<wbr>1f6db41ad91d9eb0a6f0c769b8613c<wbr>5b"<br>
                                            +SRC_URI[sha256sum] = "<wbr>71ffb26e09e78650e424929b2b457b<wbr>9c912ac216576e6bd9e7d204ed0329<wbr>6a66"<br>
                                                # python recipe is
                                            actually python 2.x<br>
                                              # also, exclude
                                            pre-releases for both python
                                            2.x and 3.x<br>
                                            diff --git
                                            a/meta/recipes-devtools/<wbr>python/python/01-use-proper-<wbr>tools-for-cross-build.patch
                                            b/meta/recipes-devtools/<wbr>python/python/01-use-proper-<wbr>tools-for-cross-build.patch<br>
                                            index 366ce3e..e795a74
                                            100644<br>
                                            --- a/meta/recipes-devtools/<wbr>python/python/01-use-proper-<wbr>tools-for-cross-build.patch<br>
                                            +++ b/meta/recipes-devtools/<wbr>python/python/01-use-proper-<wbr>tools-for-cross-build.patch<br>
                                            @@ -9,6 +9,9 @@
                                            Signed-off-by: Paul Eggleton
                                            &lt;<a
                                              href="mailto:paul.eggleton@linux.intel.com"
                                              target="_blank"
                                              moz-do-not-send="true">paul.eggleton@linux.intel.com</a><wbr>&gt;<br>
                                              Rebased for python-2.7.9<br>
                                              Signed-off-by: Alejandro
                                            Hernandez &lt;<a
                                              href="mailto:alejandro.hernandez@linux.intel.com"
                                              target="_blank"
                                              moz-do-not-send="true">alejandro.hernandez@linux.<wbr>intel.com</a>&gt;<br>
                                              +Rebased for python-2.7.14<br>
                                            +Signed-off-by: Derek Straka
                                            &lt;<a
                                              href="mailto:derek@asterius.io"
                                              target="_blank"
                                              moz-do-not-send="true">derek@asterius.io</a>&gt;<br>
                                            +<br>
                                              Index: Python-2.7.13/<a
                                              href="http://Makefile.pre.in"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">Makefile.pre.in</a><br>
                                             
                                            ==============================<wbr>==============================<wbr>=======<br>
                                              --- Python-2.7.13.orig/<a
href="http://Makefile.pre.in" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">Makefile.<wbr>pre.in</a><br>
                                            @@ -30,14 +33,14 @@ Index:
                                            Python-2.7.13/<a
                                              href="http://Makefile.pre.in"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">Makefile.pre.in</a><br>
                                                  # Create build
                                            directory and generate the
                                            sysconfig build-time data
                                            there.<br>
                                               # pybuilddir.txt contains
                                            the name of the build dir
                                            and is used for<br>
                                            -@@ -681,7 +682,7 @@
                                            Modules/pwdmodule.o:
                                            $(srcdir)/Modules/p<br>
                                            -<br>
                                            - $(GRAMMAR_H):
                                            @GENERATED_COMMENT@
                                            $(GRAMMAR_INPUT) $(PGEN)<br>
                                            +@@ -663,7 +663,7 @@<br>
                                            +       # Regenerate
                                            Include/graminit.h and
                                            Python/graminit.c<br>
                                            +       # from
                                            Grammar/Grammar using pgen<br>
                                                    @$(MKDIR_P) Include<br>
                                            --      $(PGEN)
                                            $(GRAMMAR_INPUT)
                                            $(GRAMMAR_H) $(GRAMMAR_C)<br>
                                            -+      $(HOSTPGEN)
                                            $(GRAMMAR_INPUT)
                                            $(GRAMMAR_H) $(GRAMMAR_C)<br>
                                            - $(GRAMMAR_C):
                                            @GENERATED_COMMENT@
                                            $(GRAMMAR_H)<br>
                                            -       touch $(GRAMMAR_C)<br>
                                            +-      $(PGEN)
                                            $(srcdir)/Grammar/Grammar \<br>
                                            ++      $(HOSTPGEN)
                                            $(srcdir)/Grammar/Grammar \<br>
                                            +             
                                             $(srcdir)/Include/graminit.h
                                            \<br>
                                            +             
                                             $(srcdir)/Python/graminit.c<br>
                                                 @@ -1121,27 +1122,27 @@
                                            libinstall:        build_all
                                            $(srcdir)/Lib/$(PL<br>
                                                                   
                                            $(DESTDIR)$(LIBDEST)/<wbr>distutils/tests
                                            ; \<br>
                                            diff --git
                                            a/meta/recipes-devtools/<wbr>python/python/Don-t-use-<wbr>getentropy-on-Linux.patch
                                            b/meta/recipes-devtools/<wbr>python/python/Don-t-use-<wbr>getentropy-on-Linux.patch<br>
                                            deleted file mode 100644<br>
                                            index 38e5377..0000000<br>
                                            --- a/meta/recipes-devtools/<wbr>python/python/Don-t-use-<wbr>getentropy-on-Linux.patch<br>
                                            +++ /dev/null<br>
                                            @@ -1,41 +0,0 @@<br>
                                            -Upstream-Status: Backport<br>
                                            -<br>
                                            -Signed-off-by: Andreas
                                            Oberritter &lt;<a
                                              href="mailto:obi@opendreambox.org"
                                              target="_blank"
                                              moz-do-not-send="true">obi@opendreambox.org</a>&gt;<br>
                                            -<br>
                                            -From
                                            905d1b30ac7cb0e31c57cec0533825<wbr>c8f170b942
                                            Mon Sep 17 00:00:00 2001<br>
                                            -From: Victor Stinner &lt;<a
href="mailto:victor.stinner@gmail.com" target="_blank"
                                              moz-do-not-send="true">victor.stinner@gmail.com</a>&gt;<br>
                                            -Date: Mon, 9 Jan 2017
                                            11:10:41 +0100<br>
                                            -Subject: [PATCH] Don't use
                                            getentropy() on Linux<br>
                                            -<br>
                                            -Issue #29188: Support glibc
                                            2.24 on Linux: don't use
                                            getentropy() function but<br>
                                            -read from /dev/urandom to
                                            get random bytes, for
                                            example in os.urandom().  On<br>
                                            -Linux, getentropy() is
                                            implemented which
                                            getrandom() is blocking
                                            mode, whereas<br>
                                            -os.urandom() should not
                                            block.<br>
                                            -<br>
                                            -(cherry picked from commit
2687486756721e39164fa9f597e468<wbr>c35d495227)<br>
                                            ----<br>
                                            - Python/random.c | 11
                                            +++++++++--<br>
                                            - 1 file changed, 9
                                            insertions(+), 2
                                            deletions(-)<br>
                                            -<br>
                                            -diff --git
                                            a/Python/random.c
                                            b/Python/random.c<br>
                                            -index b4bc1f3..f3f5d14
                                            100644<br>
                                            ---- a/Python/random.c<br>
                                            -+++ b/Python/random.c<br>
                                            -@@ -94,8 +94,15 @@
                                            win32_urandom(unsigned char
                                            *buffer, Py_ssize_t size,
                                            int raise)<br>
                                            - }<br>
                                            -<br>
                                            - /* Issue #25003: Don't use
                                            getentropy() on Solaris
                                            (available since<br>
                                            -- * Solaris 11.3), it is
                                            blocking whereas
                                            os.urandom() should not
                                            block. */<br>
                                            --#elif
                                            defined(HAVE_GETENTROPY)
                                            &amp;&amp; !defined(sun)<br>
                                            -+   Solaris 11.3), it is
                                            blocking whereas
                                            os.urandom() should not
                                            block.<br>
                                            -+<br>
                                            -+   Issue #29188: Don't use
                                            getentropy() on Linux since
                                            the glibc 2.24<br>
                                            -+   implements it with the
                                            getrandom() syscall which
                                            can fail with ENOSYS,<br>
                                            -+   and this error is not
                                            supported in py_getentropy()
                                            and getrandom() is called<br>
                                            -+   with flags=0 which
                                            blocks until system urandom
                                            is initialized, which is not<br>
                                            -+   the desired behaviour
                                            to seed the Python hash
                                            secret nor for os.urandom():<br>
                                            -+   see the PEP 524 which
                                            was only implemented in
                                            Python 3.6. */<br>
                                            -+#elif
                                            defined(HAVE_GETENTROPY)
                                            &amp;&amp; !defined(sun)
                                            &amp;&amp; !defined(linux)<br>
                                            - #define PY_GETENTROPY 1<br>
                                            -<br>
                                            - /* Fill buffer with size
                                            pseudo-random bytes
                                            generated by getentropy().<br>
                                            diff --git
                                            a/meta/recipes-devtools/<wbr>python/python/fix-makefile-<wbr>for-ptest.patch
                                            b/meta/recipes-devtools/<wbr>python/python/fix-makefile-<wbr>for-ptest.patch<br>
                                            index 669112d..90dcd57
                                            100644<br>
                                            --- a/meta/recipes-devtools/<wbr>python/python/fix-makefile-<wbr>for-ptest.patch<br>
                                            +++ b/meta/recipes-devtools/<wbr>python/python/fix-makefile-<wbr>for-ptest.patch<br>
                                            @@ -15,7 +15,7 @@ diff -ruN
                                            a/<a
                                              href="http://Makefile.pre.in"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">Makefile.pre.in</a>
                                            b/<a
                                              href="http://Makefile.pre.in"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">Makefile.pre.in</a><br>
                                              +TESTOPTS=    -l -v
                                            $(EXTRATESTOPTS)<br>
                                               TESTPROG=   
                                            $(srcdir)/Lib/test/regrtest.py<br>
                                              -TESTPYTHON=  $(RUNSHARED)
                                            ./$(BUILDPYTHON) -Wd -3 -E
                                            -tt $(TESTPYTHONOPTS)<br>
                                            --test:         all platform<br>
                                            +-test:       
                                             @DEF_MAKE_RULE@ platform<br>
                                              -             -find
                                            $(srcdir)/Lib -name
                                            '*.py[co]' -print | xargs rm
                                            -f<br>
                                              +TESTPYTHON=  $(RUNSHARED)
                                            $(BUILDPYTHON) -Wd -3 -E -tt
                                            $(TESTPYTHONOPTS)<br>
                                              +test:               
                                            build-test<br>
                                            @@ -26,8 +26,8 @@ diff -ruN
                                            a/<a
                                              href="http://Makefile.pre.in"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">Makefile.pre.in</a>
                                            b/<a
                                              href="http://Makefile.pre.in"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">Makefile.pre.in</a><br>
                                                           
                                            -$(TESTPYTHON) $(TESTPROG)
                                            $(TESTOPTS)<br>
                                                           
                                            $(TESTPYTHON) $(TESTPROG)
                                            $(TESTOPTS)<br>
                                               -+build-test:        all
                                            platform<br>
                                            ++build-test: 
                                             @DEF_MAKE_RULE@ platform<br>
                                              +<br>
                                            - testall:      all platform<br>
                                            + testall:     
                                            @DEF_MAKE_RULE@ platform<br>
                                                            -find
                                            $(srcdir)/Lib -name
                                            '*.py[co]' -print | xargs rm
                                            -f<br>
                                                           
                                            $(TESTPYTHON)
                                            $(srcdir)/Lib/compileall.py<br>
                                            diff --git
                                            a/meta/recipes-devtools/<wbr>python/python/parallel-<wbr>makeinst-create-bindir.patch
                                            b/meta/recipes-devtools/<wbr>python/python/parallel-<wbr>makeinst-create-bindir.patch<br>
                                            index 951cb46..abab41e
                                            100644<br>
                                            --- a/meta/recipes-devtools/<wbr>python/python/parallel-<wbr>makeinst-create-bindir.patch<br>
                                            +++ b/meta/recipes-devtools/<wbr>python/python/parallel-<wbr>makeinst-create-bindir.patch<br>
                                            @@ -8,12 +8,12 @@
                                            Upstream-Status: Pending<br>
                                                --- Python-2.7.3.orig/<a
href="http://Makefile.pre.in" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">Makefile.<wbr>pre.in</a><br>
                                              +++ Python-2.7.3/<a
                                              href="http://Makefile.pre.in"
                                              rel="noreferrer"
                                              target="_blank"
                                              moz-do-not-send="true">Makefile.pre.in</a><br>
                                            -@@ -1008,7 +1008,7 @@
                                            LIBPL=         
                                             $(LIBP)/config<br>
                                            +@@ -1187,7 +1187,7 @@<br>
                                               LIBPC=             
                                             $(LIBDIR)/pkgconfig<br>
                                            -<br>
                                            - libainstall:  all
                                            python-config<br>
                                            +<br>
                                            + libainstall: 
                                            @DEF_MAKE_RULE@
                                            python-config<br>
                                              -     @for i in $(LIBDIR)
                                            $(LIBP) $(LIBPL) $(LIBPC); \<br>
                                              +     @for i in $(LIBDIR)
                                            $(LIBP) $(LIBPL) $(LIBPC)
                                            $(BINDIR); \<br>
                                            -       do \<br>
                                            -               if test ! -d
                                            $(DESTDIR)$$i; then \<br>
                                            -                       echo
                                            "Creating directory $$i"; \<br>
                                            +       do \<br>
                                            +               if test ! -d
                                            $(DESTDIR)$$i; then \<br>
                                            +                       echo
                                            "Creating directory $$i"; \<br>
                                            diff --git
                                            a/meta/recipes-devtools/<wbr>python/<a
href="http://python_2.7.13.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">python_2.7.13.bb</a>
                                            b/meta/recipes-devtools/<wbr>python/<a
href="http://python_2.7.14.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">python_2.7.14.bb</a><br>
                                            similarity index 99%<br>
                                            rename from
                                            meta/recipes-devtools/python/<a
href="http://python_2.7.13.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">p<wbr>ython_2.7.13.bb</a><br>
                                            rename to
                                            meta/recipes-devtools/python/<a
href="http://python_2.7.14.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">p<wbr>ython_2.7.14.bb</a><br>
                                            index dbafb95..13455ff
                                            100644<br>
                                            --- a/meta/recipes-devtools/<wbr>python/<a
href="http://python_2.7.13.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">python_2.7.13.bb</a><br>
                                            +++ b/meta/recipes-devtools/<wbr>python/<a
href="http://python_2.7.14.bb" rel="noreferrer" target="_blank"
                                              moz-do-not-send="true">python_2.7.14.bb</a><br>
                                            @@ -28,7 +28,6 @@ SRC_URI +=
                                            "\<br>
                                               
                                            <a class="moz-txt-link-freetext" href="file://parallel-makeinst">file://parallel-makeinst</a>-<wbr>create-bindir.patch
                                            \<br>
                                               
                                            <a class="moz-txt-link-freetext" href="file://use_sysroot_ncurses_">file://use_sysroot_ncurses_</a><wbr>instead_of_host.patch
                                            \<br>
                                               
                                            <a class="moz-txt-link-freetext" href="file://add-CROSSPYTHONPATH">file://add-CROSSPYTHONPATH</a>-<wbr>for-PYTHON_FOR_BUILD.patch
                                            \<br>
                                            - 
                                            <a class="moz-txt-link-freetext" href="file://Don-t-use-getentropy">file://Don-t-use-getentropy</a>-<wbr>on-Linux.patch
                                            \<br>
                                               
                                            <a class="moz-txt-link-freetext" href="file://pass-missing-libraries">file://pass-missing-libraries</a>-<wbr>to-Extension-for-mul.patch
                                            \<br>
                                               
                                            <a class="moz-txt-link-freetext" href="file://support_SOURCE_DATE_">file://support_SOURCE_DATE_</a><wbr>EPOCH_in_py_compile_2.7.patch
                                            \<br>
                                              "<br>
                                          </blockquote>
                                        </div>
                                      </div>
                                    </blockquote>
                                  </div>
                                  <br>
                                </div>
                              </div>
                            </div>
                          </blockquote>
                        </div>
                        <br>
                      </div>
                    </div>
                  </div>
                  <span class="HOEnZb"><font color="#888888">
                      --<br>
                      ______________________________<wbr>_________________<br>
                      Openembedded-core mailing list<br>
                      <a
                        href="mailto:Openembedded-core@lists.openembedded.org"
                        target="_blank" moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                      <a
                        href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                        rel="noreferrer" target="_blank"
                        moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                    </font></span></blockquote>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------D756B8065D176580DAE3490C--
