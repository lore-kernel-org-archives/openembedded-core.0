Return-Path: <zhenhua.luo@nxp.com>
X-Greylist: delayed 870 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 Jun 2016 07:39:41 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0070.outbound.protection.outlook.com [157.56.111.70])
	by mail.openembedded.org (Postfix) with ESMTP id ED1DC601A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 07:39:41 +0000 (UTC)
Received: from BN3PR0301CA0054.namprd03.prod.outlook.com (10.160.152.150) by
	SN2PR03MB1933.namprd03.prod.outlook.com (10.164.114.157) with Microsoft
	SMTP Server (TLS) id 15.1.447.15; Tue, 28 Jun 2016 07:25:11 +0000
Received: from BL2FFO11FD051.protection.gbl (2a01:111:f400:7c09::115) by
	BN3PR0301CA0054.outlook.office365.com (2a01:111:e400:401e::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.528.16 via
	Frontend Transport; Tue, 28 Jun 2016 07:25:12 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD051.mail.protection.outlook.com (10.173.161.213) with
	Microsoft
	SMTP Server (TLS) id 15.1.523.9 via Frontend Transport; Tue, 28 Jun 2016
	07:25:11 +0000
Received: from sweet.ap.freescale.net (sweet.ap.freescale.net [10.193.20.55])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u5S7P8op012052; Tue, 28 Jun 2016 00:25:09 -0700
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2016 15:25:07 +0800
Message-ID: <1467098707-15737-1-git-send-email-zhenhua.luo@nxp.com>
X-Mailer: git-send-email 2.4.11
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131115723113550946;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(2351001)(575784001)(36756003)(86362001)(50226002)(229853001)(68736007)(97736004)(110136002)(33646002)(6806005)(189998001)(356003)(8676002)(48376002)(81156014)(81166006)(50986999)(5003940100001)(586003)(2906002)(8666005)(47776003)(19580405001)(77096005)(4326007)(106466001)(85426001)(8936002)(19580395003)(92566002)(305945005)(87936001)(105606002)(7846002)(104016004)(50466002)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN2PR03MB1933;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD051;
	1:PCqfi5Cf318K55lEAXioLvG5fGoM6+BBKk+4APb1/vr7/FRQqahVHvfLMRiL5DCpLSV0NMZyrFVEq/2bJFd8x733E8x9tsbmk+EkcT3pf7nwKW3K9SIi4s73BwJShwnlqjAAhtiNf7Qz0xDBPVcRvU/APigTS9MBFpOS43cGgyzaEp+FG/Qjps4VOQA9w8ZwfAcjPEf1VwhL3RvThzBSguw8+RM3iiax/ZgbdxrpLwCxDUfWBAOQOgwzH1kLS0EcSUlUZTmewMdrbYbL7Bv8OTEwp7f9vPp+egSh68Yu10LvgRZJQVrzbShRHi5RReRhU/j4kdDbBxZdezkf2GBuIxrBVKQ2uLGZVvUEZhSuQPRTek5kIndblX1odpXVxT4n3ILOj++xe+A3xbVcuqlaI8YUxt5Ys0B3FqVKVSAGGXAb3tu9JqdHQGtPvt/8V+NuYzcBQYSLMvd/+GLXp/FRO6acafBu+dRflKEBPSdVrGS4xzkJXE/Cqm4qUE5jD07Hs2x6Jmtzq99FehQdVscWSY9q6oPpHMmzYKf60ezGkVuMddup3/uJW2dgkGfbdCMnYETpQbGzBBJasZVw7AcDPjC4nubYHUOAg6HfKl6yakRHhHp6KYvTMfsuLCE+lF/TA63MbaypX/pifiAUL1PUmrOG8hiwJe50X5zLifj85mw1varMDe164SMlv4hvBWP2wP9hpzVn655uLaPsF5e+BqtG2Ryy9QDXy50pVYpb/6g=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 5941e2f3-a5fa-4a12-6814-08d39f255708
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB1933;
	2:Yl/UxboXRZl/HUubjVw0mHYyvc7Uo/0PS6kYZRligEZkEUyfURmO3lNrffnFhqPRYcRg+8Yve2wFzMeNOpDGX+VyOhPMTufJB801z+KuP5kGwlpey0WpL6PCKtAZRdQ/4Uc1V1mEbzcngds/RQUgGYm2LUypo8NSUpobGuTZNIy2QLyWgunxa1gZZzzHW5bU;
	3:g3/4sVSNU3Z0OGxeo73JDo1+gsBcZj730YC0bWDqhY1Yg+T83OlyocEb2Fm+ax70+35eArCLarYgbK8j33+Nfw4gnarBIp6eLkqDvJuBJn3YBQHM2WQGqpuMPSHOfD7qU/2hauheGU9Y1Og/jEulHTVPrM+s6HZsWlQVstMNXLMLPK3fPySvO7VLDf13UU3DdgC/Wp/1iDm+NjgmUY3Jk6NkuoIkmAydoODMYvzGR4w=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN2PR03MB1933;
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB1933;
	25:NvZjc6iqfChRjILkpjB9NMIwBxWsfbVZN87T8n6SuY80bw6xCIl4TyQy3gkTZ2dzXvyVeDpIkZWz/ZYJAZhrFqbOsw77w2vZOLaHJ/FQydaCtrIR/NEUhTQwmJhle47U6LArwgffUEK+P5knwmUYPxRmcvKmZ5uyZdzRt3h6DeokMePtP7+aU6d3BYpCk09xDqEpXaDOu4xuY91KNPf4d/luvMct8bBhoVy7el6PTuF6h0B2j1hU/7SBmlEC6Mn7GqTiIcsI+XYp4VIPwuQe9BkRB7j7TJGRq9+8gpIdTdvGsP4uYbs05iWu7B+YLQGOwWZlEGiEF4OPuc7StMCdjJFgNo64lemryIkFOS1I10b7olJVQ8So0uUj/gwvmuz7HrVNftp47qTD6FUsIaFgDlGqY2P49ZlZ0pQfSQWdG8bwaL5U43HurJCMgusMhoZ/8nY7VUrMc0pmJ7BjaK1kC/liidXWDaQhkr+HEbgUxVdQd2K0EsTGLqiMISOxqkYEBwNWG86oM2KpbzzAF9WKg5amOGAl65kw+ttiP6TigS+FRgFrfsbnijj6AVzg5be+x+1V0L1tOgKO854I69vl+g==
X-Microsoft-Antispam-PRVS: <SN2PR03MB1933F6BD5035168FABEE84D5EE220@SN2PR03MB1933.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(158342451672863);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13017025)(8121501046)(13018025)(13023025)(13024025)(13015025)(5005006)(3002001)(10201501046)(6055026);
	SRVR:SN2PR03MB1933; BCL:0; PCL:0; RULEID:(400006);
	SRVR:SN2PR03MB1933; 
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB1933;
	4:5dswgRXCRX4+g+XqsCHYxM+Dllf3g0FoddcbmdZomYYvS42TPvTiz5KEGMLVN07Z4I4xuAo47oyrUsVG6kPNIrybsubix1EILrK1kGycDj62/aDs6MsQRYN2p8/D5QweE3ud/E0NzQ141NJcdvRLJz2dYB+pjMkhsj5BEV6RA0GM8tn9Tt68dARJD5+R/P4z6MOOzAynJZIN3v3VVuboky76T9mbAlaFsr9NNggcxjmDaof5IIuzo5pd8agXFWpUPdVvg8ILgW3Oy9+1uGQPlFK706K1ZIYb+t14Qub2Vs1lsZrmUGsKEJaA9mA1+nLhghRxu7qDOSrHETDZ7uou39wpdNU0n70/9hnXMrL68xmGwCkY0W5YgKVWJ8Oxnjg3lB6EaLwrYMJHNO12AScecSnWMO2zg4gQdw8rTLEmtRIcnitUUO/+1FfUPB/DmD43If2jJKhvM/GhTPNKcHYEjAhds/wQuBvhDX3cgOZ6VYdt8LYxhFzLFGICRIz2iNExi6F1k3m9IZnB0iHxI0DNAvtaGtKS/hAkUwhV8GUc4332zwiEZ+8e5sd2RhNE3PI+
X-Forefront-PRVS: 0987ACA2E2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN2PR03MB1933;
	23:N7zSaFR+dQNQLGU96CENKSU29ejgYX+dc0Xwt6Gex?=
	=?us-ascii?Q?MlQ49i05jexhww3lPy88RHB4ajK6ER+TJUpZcJg0JmDpSZaLEreRuy9xPBn2?=
	=?us-ascii?Q?vNwr6KYeUhya4XGzYFUv4N7WqbFJHkolq7d4tLmx0aoPw2WU1Fhy447qB9X0?=
	=?us-ascii?Q?eDB8jiV0vv2QzBAq2eWZTpw6d53LI1+/eE4amE+dJJfFndPDUXfU2JBmkt7l?=
	=?us-ascii?Q?pTlmeuOsQWPh/dzISfcvAgHZuLbLF5p14GLPTHWnQb4bfCpKIF5EsE1zyNCQ?=
	=?us-ascii?Q?BEszTeefv7ukvy1RYE+/uwvMOrpGq+Z4Lle/xrNDdMv8vGCiBE9pJDWClQl6?=
	=?us-ascii?Q?2gawsXpS/Xy620JQYKPePlKPzribEVKAyK4d3zk5f9EdS/acWWbhUtdf1sQa?=
	=?us-ascii?Q?JZMvyL9lTTITuVyg+3ge5b1OYs9juwEe/crU0gvu4KvvvxbhM2JyUND46IEq?=
	=?us-ascii?Q?NvXlDEHH1Q8NwGEOar4XjyAA5caYxE4eS/oyElDMx7KFUA2ti+OHRDcVNVcG?=
	=?us-ascii?Q?yXatHzDNudnL5Qwftz2WJgYRTVi8U394u8OT9afZROkOCQwXctFTYKdAaIY0?=
	=?us-ascii?Q?EbvqW5CuK5heiR1s/TvAWu7ZBaLqfFoBnADXcrqb0gHuaLAiKMYh9WgdHdSu?=
	=?us-ascii?Q?3sP1cbs8OLhVYaD64O/0MWdCkzym/sqCkyznSk/x/Le3OIFVfN3VQRlDj/8C?=
	=?us-ascii?Q?VHOBNk9iUR2JYoTx5Hp2ycDNB0CL3NR4gIJQm0TXk+nOg++o5fXzR6todEKS?=
	=?us-ascii?Q?ZGsqywfZZrsIdP43Um4FA/H+fODrHjmp8TBdrlwnv3mKKyyvjMgR1IguLJ+n?=
	=?us-ascii?Q?r2Qu6INVYZwWdG3gM8Blme8i1e2KNQ3/fMrJ6SgynW54/30WczEJB4yk58rV?=
	=?us-ascii?Q?AkE9DE4fEINX8AY0n1ps97zWwvarsDtHWdA0CnEgJJqb/0o9quWcm1WaazxX?=
	=?us-ascii?Q?VAzAynzm5p8oe228ISvnSGV9VTO1tIzd7ygJMEdd07t60bQrvKCiDCK/uK5r?=
	=?us-ascii?Q?WWa+YxRObb9cUsmCfbhqF9LZ1HwI2Ag4PpaCTWVsQtuyIV9u1r2ng21/SGZi?=
	=?us-ascii?Q?+OQRSSlfYYCeFw1z9E4jWaSfajbmmYwikhiUb2+N7HXj9lDU0+fgSczH//Xp?=
	=?us-ascii?Q?DqsmDVf29bNaJnuTdj3FuCPjrvRpVHS?=
X-Microsoft-Exchange-Diagnostics: 1; SN2PR03MB1933;
	5:INzCNT0Utmv5/YJFctNSqiQlxNd4ixAXpDueo3Ukf+jyzeF1i7Gkr3Xo+WGCfsl4c0yZnVCVuC2EhWdRenl1AXAN0RqsUyujCH4SJS2UNRkejfXtPdiAX/oqya+5q3TDgkzciI3n78+eB05EP/f5zpWRk9qmxBviBxDfXkPDkUA=;
	24:WnqB6JTKLK5Uve2itkOAGL1lPXHLa9TEwRVC6eGp/xYIOlqVHJc5eD61bdeiN7sk0fmdCOCb2FEr+SvwsTGQ6shnLK4rqpCarjADGjEUbAA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2016 07:25:11.0586 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB1933
Subject: [PATCH] tune-ppce500mc.inc: pass -mcpu=e500mc for ppce500mc kernel compile
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
X-List-Received-Date: Tue, 28 Jun 2016 07:39:43 -0000
Content-Type: text/plain

Currently the -mcpu parameter is not passed to cross gcc when assembling
kernel .S file, the implicit -mcpu option that defaults to the latest
server cpu might casuse incorrect assembling.

A existent case is that wait instruction of ppce500mc is incorrectly assembled
to power9 version with default -mcpu setting, accordingly kernel boot calltrace
happend when wait instruction is executed on ppce500mc targets.

Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
---
 meta/conf/machine/include/tune-ppce500mc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index a1ca9be..bc26a0f 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -12,3 +12,6 @@ PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce50
 
 # glibc configure options to get e500mc specific library (for sqrt)
 GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppce500mc', '-with-cpu=e500mc', '', d)}"
+
+# pass -mcpu=e500mc for ppce500mc kernel cross compile
+TARGET_CC_KERNEL_ARCH = "-mcpu=e500mc"
-- 
2.4.11


