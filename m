Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.43])
 by mx.groups.io with SMTP id smtpd.web12.7817.1622810745587944699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 05:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector1 header.b=YfQWTZMw;
 spf=pass (domain: de.bosch.com, ip: 40.107.20.43, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ8twyVzWfNzQIWf4Mxvp4gwgu/ciTuDtF8hvmvfQZzUiy2F/nFBSroSMmGUaWh63ypq1ZGVhVUI24SNzSosJELOpGRqnqf+b2lq2YY3CHBwx645m3w4VPk7x4NNScWypbMh6cA1pdxG+/tTbl3KlYmIRXp3psbCL//9noqwI15okrE4+MhK14GBD6nU5ks+5WwhQBsz4PPVPq7CEgJKwSyCy1U4OWupJodSzitWGpRDoMjZe7Wsc3FZFrTCFIyN6i7yah5tmxW7zBLhXnBK/MbidYsywP4t1OlzVXduBlKDhu9KrYZ31ZKsPdxYfzhbDH5FYTMNcy061NwBRA1hlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rufk9v5Rc3U0rtnUUnwnwO41O/qh4fLXMtMj/7gl5Mk=;
 b=AWxFq6+jt/LxxFWsNBNYakN4bTCt2IzA/8xm9rv78+a7cp7XRMZZ8UL86/k4SkVM/OSSxUd5MTp6g1CcrDrGlKizKQ8Qd9inkrMFtByQ/DFeEZHIC+vFm7/LP1tzN2LAu0pM0GCzn+MfiJpb6oLEP7xuza7ioE4VmKr78eOFQiwXN6W27DV3NSkL0UL90JnhfFV7HlgT5uTtLvbZtfDz4IPmvkd9Tw2Sg2db9MTFW+Dgh0ZjQYaJhKr7AUpBVBHQEFbFuv94Bd/UaMLN1zmrW+5TMkwBWAagAgAzcExiG5QB34oITOmQRh7kdJjY+I2bIffpdSVAj+iLrF4beWkbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.199) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rufk9v5Rc3U0rtnUUnwnwO41O/qh4fLXMtMj/7gl5Mk=;
 b=YfQWTZMw8VOw8+A/s2Pf23A9B1vSWu3aa1MndvZDd0j9KkLqdh1L4ueiX5NQKWliviPQeIfoG1t9SQFmV0/QAVBVJZdz7GG5tjXHFFtcGNSmA0Suik/mxXIRk721GmIyzSdWBaM7NcQ8AUJGY6eoA/WlobC8CYxRevFrLEJls24=
Received: from AM6P191CA0095.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::36)
 by DB8PR10MB3323.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:11c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 12:45:43 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::48) by AM6P191CA0095.outlook.office365.com
 (2603:10a6:209:8a::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Fri, 4 Jun 2021 12:45:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.199)
 smtp.mailfrom=de.bosch.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.199 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.199; helo=eop.bosch-org.com;
Received: from eop.bosch-org.com (139.15.153.199) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Fri, 4 Jun 2021 12:45:42 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.14; Fri, 4 Jun
 2021 14:45:27 +0200
Received: from SGPMBX2032.APAC.bosch.com (10.187.83.46) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Fri, 4 Jun 2021 14:45:26 +0200
Received: from FE-MBX2051.de.bosch.com (10.3.231.61) by
 SGPMBX2032.APAC.bosch.com (10.187.83.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Fri, 4 Jun 2021 20:45:24 +0800
Received: from FE-MBX2051.de.bosch.com ([fe80::ec4d:8bf1:e4f9:e31b]) by
 FE-MBX2051.de.bosch.com ([fe80::ec4d:8bf1:e4f9:e31b%6]) with mapi id
 15.01.2176.014; Fri, 4 Jun 2021 14:45:22 +0200
From: "Mark Jonas" <mark.jonas@de.bosch.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>
CC: "ovidiu.panait@windriver.com" <ovidiu.panait@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"toertel@gmail.com" <toertel@gmail.com>, "RUAN Tingquan (BT-FIR/ENG1-Zhu)"
	<Tingquan.Ruan@cn.bosch.com>
Subject: Request to backport KERNEL_DTC_FLAGS to Dunfell
Thread-Topic: Request to backport KERNEL_DTC_FLAGS to Dunfell
Thread-Index: AddZPHjUNiLGiOl4SkO6mJBwBSv0IA==
Date: Fri, 4 Jun 2021 12:45:22 +0000
Message-ID: <d8dac798fed14554b0bfb5b7ea2daf12@de.bosch.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.142.29.144]
MIME-Version: 1.0
Return-Path: Mark.Jonas@de.bosch.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b89c555-947f-44ee-ae9c-08d92756aa46
X-MS-TrafficTypeDiagnostic: DB8PR10MB3323:
X-Microsoft-Antispam-PRVS: 
	<DB8PR10MB3323358A0B42BB6F480731A9AD3B9@DB8PR10MB3323.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aOzaBdV/5wgJDpK2K9Wi+lDJGl31K2hWSViMAVD+Rgi+6y6Aq5Yp2mbEFR9VLs9mc8VBqkxEeZl/hmgOFeaIIr2f6znfyD2yuZ2jLNp2JXVuH2HfHeNV4BhewjOPMMquq09Sg9uTCJ0VQp0gSK2LDLIIuhzCFqLFew1WRPTKwfuvXbzRW2WiUXaMzg/T4keQPjr9+Dz/VPlu/zbmGjLoCJQOvnElP3DFtpaBNRyIxuRAqrIz0YFe8n0hk5q1BY++6vpEdC6v0hkQHQdbDp+TTvC4blpe9u/C1JMm1E+WihVJk/0RibdTLcDJ3StJMWwA4A0eTYig7L6L8JHA9nBkhsVl2s+65haxqOP8PW8nCjRzuSB8JiiT0Rc3HfDf40uUeFfGP5c0R6wNB5rK9Y5anDlWnR8S26yAph0s0zNgAnPR9eMCSONW5SJlnVHKubEeQxqtu7j0EYR9RsFeZkavP3PGR4Y6jbbaX9eIJjP8nGdv2J2U/pnpQNqwZSveUc8zuAH+Me4aB2wr6I0v72qDWZ4iYr7RKHURddtUCE8EvdEHx+hGpuQQ6pEpJkV9BTqTOu7Ma0s9g56xiFwSDrkE753GfKX5R8f87vVfMhdIzVu/iPb+9qjcmSExvZA1OpWyB3tSfTBcW4wBLRPGL9/AukPeW3EYxjiXmFde2r4QZ4pilDm7egLAyoyltoANqwTyZ9ZOSiRmipT1FzE2cY3LVwm53oRPNbVEeGNzMSH1u3JBTeF20nKQq1iwBdSIoA1Ttb2XPIl2azpRWoBX9oFvEgCcbG/K9gk9t9CuQuPa7fIp3LoUwXAKP0hYM6h3U8pr
X-Forefront-Antispam-Report: 
	CIP:139.15.153.199;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(108616005)(7696005)(24736004)(47076005)(2906002)(82310400003)(426003)(70586007)(70206006)(2616005)(107886003)(83380400001)(15974865002)(110136005)(54906003)(336012)(66574015)(356005)(186003)(8936002)(4744005)(8676002)(26005)(36860700001)(498600001)(966005)(86362001)(5660300002)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 12:45:42.6215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b89c555-947f-44ee-ae9c-08d92756aa46
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.199];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3323
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

We are using DT overlays and have the need to pass the -@ parameter in DTC_=
FLAGS to Linux' make. The patch

"kernel-devicetree: Introduce KERNEL_DTC_FLAGS to pass dtc flags"
https://git.openembedded.org/openembedded-core/commit/?h=3Dhardknott&id=3D0=
63b5de86624a42b0aa784db6dddc7552a6dee7f

makes that possible in a nice way. Would it be reasonable to request backpo=
rting of this patch to Dunfell?

We were also wondering what could be an alternative approach for getting th=
is or a similar functionality. Patching a bbclass using a bbappend is not p=
ossible, is it?

Cheers,
Mark

 Mark Jonas

Building Technologies, Panel Software Fire (BT-FIR/ENG1-Grb)
Bosch Sicherheitssysteme=A0GmbH | Postfach 11 11 | 85626 Grasbrunn | GERMAN=
Y | www.boschsecurity.com
Tel. +49 89 6290-1105 | Telefax +49 89 6290-281105 | Mark.Jonas@de.bosch.co=
m

Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118
Aufsichtsratsvorsitzender: Christian Fischer; Gesch=E4ftsf=FChrung: Thomas =
Quante, Andreas Bartz

