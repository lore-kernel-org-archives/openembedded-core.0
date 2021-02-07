Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.79])
 by mx.groups.io with SMTP id smtpd.web10.22939.1612718745825983795
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 09:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=W2HUGWj1;
 spf=pass (domain: kpit.com, ip: 40.107.139.79, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fq7o9YxLfmWMP05Q7cIfvwrliVn8msLeW3FyJc1IuYPPA4BTQ9upvy5QPNR7leiR1cfg2XN55n3Bhz+ZhZ1wRR4XKXMhk34JSkqxXUCGETh5YbinBPBNgM4vq7OKAlj4k/3PRmLYHFXduHkyA66O8QL34y4RDTZrIHfBZcwYBuI/kiFg+EjAyr31nistmhYZ6mmPSLJvALmRVxbSf+SZTwLxERwKvx5roTVfIpaEiCFEsZ3Thx7ykXUAVpL9tORZBoC5/pyYb41aQGMlrjEX2BFsgGYX+fV4M2zBvRlGlg+3e1O5BhbShDP6ZeFqs+suIh6EsguGaZGo6bqkUFbxfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RK+toqLc6E8uW/wdNmGiAydzCkmQm1mKUVuu2cZW9U8=;
 b=JM2sRC6QmqD+Z89qWdN6CixFGSk9yJLjzEiJyQ5y/QJXk+WzilM6OMErWeMhtITMifhqbJ4/umJaEhf8MGs5kCGRJAhBp9p5NbikvMSZw+YgW4Ao4fUxKin0mlU7s+L/E6jD1iAkanFD/uvxquMH9W3mG1JeY40vszETHdNEab0I49SzZJlGwvTo4eL59m9y6/Oi+Q+tfPQ2utI5rT1q+cnsSBO3a04x4DFBqyuDfmT6PpQpPCH+QotzPaBDllw9cHusuBHH6aZU+P1hL2rYfjgJXUPaZ58goxPG+Ga560NDrE3kSeoxxZ9FTPtJ05dbdl2YC5VVZrnDO/KF0aPThQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RK+toqLc6E8uW/wdNmGiAydzCkmQm1mKUVuu2cZW9U8=;
 b=W2HUGWj1CPq7rEBZnfttgd8ETZ0S5U9IsoHGkOsrVDjVl4GRf9y4Ei+mxKXlWuJCtJW2Wnby7c1JnCiFZHdvOqyoi7GAYn+CLkwsojlMgPlP9Fj7gHtxrtdxmMJ5qFYqL8zpRLCj+evdtUopqKMsC3FIjZlYLwxREhkD3vpY5L0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR01MB2209.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:42::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Sun, 7 Feb
 2021 17:25:36 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868%7]) with mapi id 15.20.3825.030; Sun, 7 Feb 2021
 17:25:35 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Subject: [poky][master][dunfell][gatesgarth][PATCH] strace: Whitelisted CVE-2000-0006
Date: Sun,  7 Feb 2021 22:55:24 +0530
Message-Id: <1612718724-23317-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:2c8c:4e61:1d37:bcd0:cbb1:19ee]
X-ClientProxiedBy: PN0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::12) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2c8c:4e61:1d37:bcd0:cbb1:19ee) by PN0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:49::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Sun, 7 Feb 2021 17:25:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab33d767-411f-44c0-308e-08d8cb8d6095
X-MS-TrafficTypeDiagnostic: BM1PR01MB2209:
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB22090DBA028EF07BC1571FCF87B09@BM1PR01MB2209.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wKgq2J3MNW6C9kOMerBXhOYpSqA+L6T0mzg89oTWVtK4xYN2ksYmm/eTVxeeEAmM6zZdYj/bvYkct0yO7Kn6A/RSdCMI24DahqCUjhUYyIseD7sfYv+IF8vifSKziurM2v3T6Zuk8V36N4VdzkthaSM7bFfLEhU8xLTjieawrP8dmJVOsOtiZ1a5E+PtT00fXzsjdSosoxWUDDyevm2VjHRkfsBQAd+Ok2nWJnWtM11B9lLetBizabotIXsvFvXc6jg3nBHGxoeQWb8gJrLNPGNWZf13hBPpPB+/SxSIEkqKimeTfH/gXjBa+0UEzLmA86VyOZ18XUwLyuJJCxxCww9OTUF9EIS78r8MLR94tHHmm5GpwNYtYAnN2TzJaMNeHMMnjRsw2P0sKFtDeYaH7i6E8XeXrEJkG96G4XIyQ+0DgRr92arj9W3w7sfZa8Ge2G452Sr8WOglpM90n9EpLjd5WPzqDM7o/FVQdpeqQdWRJp600btb5x4wep8S+yHtc4lrMQPETPwb1vIHWh3E8mC25skepSOTaDbeD1A+jLpSMrNR3gho92C2FmuZpuLP0W6K//E5CvGF8DbVPO1sd40s7LK7Pb5ICGjnU42IJ09QlMwK3FD0e0fAFrQA110ftbZCllfA2NNEdIZsW6YJbUCG9Vt2Syv9hOIreNXOwDw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39850400004)(376002)(366004)(2906002)(6486002)(69590400011)(6512007)(5660300002)(52116002)(186003)(16526019)(8676002)(66574015)(83380400001)(6506007)(66556008)(66476007)(66946007)(8936002)(86362001)(2616005)(316002)(36756003)(6666004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?v4EoxasEQn4TekJLqBIDmiu+z3L3qxgol8Nsri7CBl3VJzUYH0GEbmXzSN8u?=
 =?us-ascii?Q?L3OAz2pG+q7jWHpj4Py0DEwf7G9KxgEbfL2gojE/FtNbPGkQZMl7g+9U/XQM?=
 =?us-ascii?Q?fPyuq9+Z0yfuJBSZxntQoaFAxfbMRWh8hpE8o3dDu/coRRjsn+zrHdgr8L1n?=
 =?us-ascii?Q?Jp/vjjdDIslJlFSgFtRzU/oUF6VULnS3rt/o9HYQBHz6oDmAkhQJ2ZeSUzKe?=
 =?us-ascii?Q?xX2ifFFuwoZDQ8WEGLRa8Ys7FsxptcWBk9o4hkg5lhPo0t3w3lEz9mSerH0/?=
 =?us-ascii?Q?vuzdEIPjNigZRH+EyrRFEO/EKgyEEr3nqwt7F/4fGAm65dm0F/BfxgVZaLhs?=
 =?us-ascii?Q?cLb73ZWx5C6+2fr3EoZwVbjqbTcuywOnGpeJ+Vpl8GaDORtYu9Ty+wcTKaN6?=
 =?us-ascii?Q?gMvJ5MxZZ1ae8RAn9FybGMQHPN9A60HUs0stvg6RCmd+NwCa/hrqbqez/tU3?=
 =?us-ascii?Q?M9fQKwtiATc3LZbg8eJwOaUrknYCebUa6/4GLNMyy58HWTxQxcz/YtnLW60S?=
 =?us-ascii?Q?qbMnwhYCjylsx+mbN8CrYfDlZTmL3O2/v10ZYSvYhO5BCCuxoKiBvOhrBuqA?=
 =?us-ascii?Q?wkEtjBLtGRxKn+PfUtz6acZ16TGtaYXPqzKrZLmCuZmS9LW2g7McrmQ5w/mP?=
 =?us-ascii?Q?zzTr9wi3hazDng/toTZysegO829siEh1mXw+dzlZU6Gcbjg4YB+KLvdAcx+w?=
 =?us-ascii?Q?8pT6HaFzZJACNChF2wfbW4DLNZZE5EJ2CJxbaF3vtqqP53g5Rmv9GFMeIHf/?=
 =?us-ascii?Q?Cu70tQq5UqbI9SReUX7x5t+IopAzwYTSJb155/pRzThJp4vWHb7pg4HQGblW?=
 =?us-ascii?Q?9EZaXGshU5aZe3F7j/0gJaqkxsutMYdQ6mZv8BufYLKKOsqa195S3yngSgCK?=
 =?us-ascii?Q?Y8UrKK0+9AUf8XN1GJzTN1i9q0tB01imWkjK597zEbJ+CMjIFBkJ1wiMOtlf?=
 =?us-ascii?Q?H62GTSE3RGBuFSORYQ6tg9qLesjSxY9hgAkRxUS6eKo2iiRoiUslFfxCinC7?=
 =?us-ascii?Q?itKjT/M1eGrV41+vpTV1XYv/0oPA15EfgVdF9bs9Y2FxxWVNd4b6OPPE08Ov?=
 =?us-ascii?Q?WY7DGu+Ye0TR8cUdqk4Q8xKaQzAMx5LRq4KShKwbL50WCCZqIPEDI+B65t+B?=
 =?us-ascii?Q?iqjNKSG6vn+xO4Vyy/BeyUiy7/V85yL8Zr/Lkv67hwqcGcwLd5cLOYSG9VTG?=
 =?us-ascii?Q?AqDsLVM5RoPMcqJ5WWItqFLW8p90l7MFaJLKJSaNPT21ITjxGYcanr3zDGWZ?=
 =?us-ascii?Q?Ze4Uavafk1+P3WLOvLeueO4r/IEV9Fz/Pi/XAcWXXpaZX6yugVDzGY9WMfer?=
 =?us-ascii?Q?TTErdDVfwcTH/eIfHW8tHVZHZi6S6QOqp2Fx5BUFYD2rNSZw4BqdfBbrcj2P?=
 =?us-ascii?Q?/rVPBmnZVz5yNs3dtn7RCG3Y2HSh?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab33d767-411f-44c0-308e-08d8cb8d6095
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2021 17:25:34.9999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbCncA3HS6MOvoxyJS4ZcBPX172U1KPnYy4GkUToPLTvgz0n6ntN3aL4eEWshx7RAOO+1aq932JCKHlsJ4gljA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2209
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

CVE-2000-0006 is not a valid bug number nor an alias to a bug
and no remedy for the CVE is available till now. Hence, can be
marked whitelisted.

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 meta/recipes-devtools/strace/strace_5.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace_5.10.bb b/meta/recipes-dev=
tools/strace/strace_5.10.bb
index 22572fb..87d1a9c 100644
--- a/meta/recipes-devtools/strace/strace_5.10.bb
+++ b/meta/recipes-devtools/strace/strace_5.10.bb
@@ -15,6 +15,9 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.t=
ar.xz \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
+#CVE-2000-0006 is not a valid bug number nor an alias to a bug, hence whit=
elisted.
+CVE_CHECK_WHITELIST +=3D "CVE-2000-0006"
+
 SRC_URI[sha256sum] =3D "fe3982ea4cd9aeb3b4ba35f6279f0b577a37175d3282be24b9=
a5537b56b8f01c"

 inherit autotools ptest
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
