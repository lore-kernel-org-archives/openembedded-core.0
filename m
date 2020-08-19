Received: from outbound-ip20a.ess.barracuda.com (outbound-ip20a.ess.barracuda.com [209.222.82.202])
 by mx.groups.io with SMTP id smtpd.web12.82964.1597817674875092309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 23:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@opengear.com header.s=selector1 header.b=egsB4frX;
 spf=pass (domain: digi.com, ip: 209.222.82.202, mailfrom: lachlan.archibald@digi.com)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170]) by mx5.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 19 Aug 2020 06:14:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4yGzOySvjBx6USy7HZaJmpIPJPxkXPvDuM4LNu9wVV+2BQjoAFDMDyTl5Y3OQoL238lThyP5PbCQbjYBPy6KHAb6QnGAY5VjfdTNrPZj3sI8VC2N0wC8/1tDGFfcsypeOSAOr4UxGCAOqKUIESZ5juWZMl0HsEfizezkpHom96JGc8WpdX/kqU22bPbQMyApnlYQ3Dj/MMAsF54UAnisnP2wzHWXe8B0O4AawoL1d/Qh8UQ9gk2CEqcblkoXrd49lqjDYciYPjtCcBCitg0yuSY+CxFstTGOywtBexweDiATCmIpi+dhYZi5pyEL/nwOVgWZ773SXWUo/r0Hv7XXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnWp1wJgKANBbdNRdFcNxTxJPzkiaWWloubQiH9Isdg=;
 b=NXRiw2AddEh6P369bBm20dH1oKyb+LBB0TwGBHC4rX8yoEnx3CVP9Zfvc92/2bSpsGiYoLcr4BiukSBjho6R5Q24HiUDPDzZcrZONnFg191Es6avZ2A5EsMQX78V99oiTYykFQjRqHxU+Nmo58PmfaJD0Um8fZQDZh3vea4jfTrfmXWxBQ3W++2G7lopYY+wHaWrBDedR9QepXpnIQmgQUmzn0rLAD+iwE6u3IL9kK2pu9qRMuKj35FVI8y7Wz5aLftozZm0Nu9iIRz//Pd9bVXFxES0yiggfQ+c2N2D2SrrmMG7XDYJ8XT58gM0/7zHmvGbGVU2E9w3PW5Lvybp3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=opengear.com;
 dkim=pass header.d=opengear.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnWp1wJgKANBbdNRdFcNxTxJPzkiaWWloubQiH9Isdg=;
 b=egsB4frXUENOMjFcLY7R1tsnYcDzQ3YfsdDXNH5u/5KikNQZYVz877qqThU5v8nPu3BvZaGBMlhvXeqGoTlEBCqxEq6xBohuCvQNPxdGGTsVYzHptu4UF1zq4sBgGSnPAwO5YKCBvnwxYrOg/Y5XeIGay2aC8hrQ9EWfBaK1h41m7wW38fiYmN6talgX1jXCOZqjwV1mifCmHFtoCfiSaUAjxU+eCDm8NAGmLtHuIdgJN7bTPTjYia1iSPvpx3IiEHs7mGBKzvy+Jvw7gvohjjDVBxOu6yg8mg4azxSRlmpqNtJBIPb3JlKKT5FR2yXWFai6n5uFALXKP+mA2RsLHw==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=opengear.com;
Received: from DM5PR10MB1641.namprd10.prod.outlook.com (2603:10b6:4:5::22) by
 DM6PR10MB4316.namprd10.prod.outlook.com (2603:10b6:5:21d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16; Wed, 19 Aug 2020 06:14:32 +0000
Received: from DM5PR10MB1641.namprd10.prod.outlook.com
 ([fe80::c0bb:a404:670f:c444]) by DM5PR10MB1641.namprd10.prod.outlook.com
 ([fe80::c0bb:a404:670f:c444%9]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 06:14:32 +0000
From: "Lachlan Archibald" <lachlan.archibald@opengear.com>
To: openembedded-core@lists.openembedded.org
CC: Lachlan Archibald <lachlan.archibald@opengear.com>
Subject: [PATCH v2] base-files: Add directory /var/empty
Date: Wed, 19 Aug 2020 16:13:24 +1000
Message-ID: <20200819061323.3247373-1-lachlan.archibald@opengear.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819053439.3241164-1-lachlan.archibald@opengear.com>
References: <20200819053439.3241164-1-lachlan.archibald@opengear.com>
X-ClientProxiedBy: SYYP282CA0014.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:b4::24) To DM5PR10MB1641.namprd10.prod.outlook.com
 (2603:10b6:4:5::22)
Return-Path: lachlan.archibald@opengear.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by SYYP282CA0014.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:b4::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Wed, 19 Aug 2020 06:14:30 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [2406:3400:40d:d2c0:3e3d:7ab7:b419:5ebd]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeb6376a-7f76-4de3-4727-08d844072327
X-MS-TrafficTypeDiagnostic: DM6PR10MB4316:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR10MB431698EF84732764003525F6875D0@DM6PR10MB4316.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iSZa5dy4tH/EZiqNu5M4cuUTnL50tScRyuKOgwMRJO1Kx68Tx8tuA6tVHHQkFlWCIYeb1Zuzt8Fcf+YYkiVCzIi9rf2FO2HujMXvN+6HFdbM0CSCgiXF2pR2NUw8t3Wkv9/8BLNxFFl8Zxg+cUIIbzgov4erTAnQ5HcRbhSHjPpIMRqat/cm+3PpMtEY4dfy46Q1gXHgn12IBj9ytpa7ZecJG0YX9dPA+G9i22WuxD5JGFePgvFJA+LkE50TRwSHJ1VG8y+VQm9Snl9VDZqoX682TSplZT3ZBKNQfloehJa7/wZ0GFZ4yj34OQUk03xLNCKbvocvgBCy8HI6thC8C9QadZQbEHq6MZfOOs7MxsqQv2wrZCbjIs8lvRzq87AX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR10MB1641.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39850400004)(366004)(8676002)(42882007)(2906002)(66556008)(44832011)(5660300002)(956004)(66946007)(66476007)(2616005)(16576012)(1076003)(6666004)(478600001)(316002)(6486002)(52116002)(6916009)(186003)(8936002)(83170400001)(107886003)(110011004)(36756003)(4326008)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	AewadDXFW/HyL4Q+ULssEHTVMFOVBSNc6V2FIKvttu+Ebm8GQN4cGAntYcNfSM2K3oR6uMe3Pzwvs8DYCQzF7K5MwWdSKf6aa1KfcIPlliDVF9BCTeEl43DcJEX2BjRAqwNh6zPknGqbIyDPlULeoeEZZi+nhUnnib4ScWZHOVMpsI/RZbmybftm7njS5LD9EkNi8O5Vsp310+nFTOMYb++6U8ZJB6FjvOcoQtEngmobuniAxFHK9Oju4JWJgjYhnkGb3ERFvUiY2MqUI6FoxwNujZ7G68oJqcHm4p5NO0SmeXWVJxr/oKg2c4VCWskQwB7fIUmDECQHMCiGmJkKxQMrxbYKVGhhKwZvp9itwGwn7CWJwWBHJM/6Oc2wfZmt5MS88U7lDe/HZtOV6NcyfAQXX4X67Zr22hvLKwMpbadox+xOM9VoHm2mD0iTRshKTqQ/+omkh1Ti8fIW+9iogPIfwEXAHBZI8oIzm1PzLSFwGMvtQH2hzQVCKLeX/TvwUTjLv8Y/9mLNl+llpKCac85yJITErw2QJPZ3kbut8s/sLaP0d6gvU0gQxtPdDkcfs2X/6RUTyJRgr5cbiprz2QzbmJ5i3WNPwl8huZPPpRRa4sE3q8whU44ewK1+6tJ4FYsZlMB+EwXhPQMOjDY6pGKPDHIEh+7ZtuHA5ZLvOPcYnOEy9k2e5BtlmBgQMyYHijBRy8iGd+0ZG/W0RMC7lw==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb6376a-7f76-4de3-4727-08d844072327
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1641.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 06:14:32.3909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFdv2OytVhslp4ZnQQqXpIWyQ0HrsGr5bXjRDVk7Tni9qtxz1BxG9xSDTZqgrW7N7iquqV0G5NYWp9vTlftp2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4316
X-BESS-ID: 1597817673-893008-16443-47781-1
X-BESS-VER: 2019.1_20200818.1820
X-BESS-Apparent-Source-IP: 104.47.55.170
X-BESS-Outbound-Spam-Score: 0.24
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.226270 [from 
	cloudscan9-56.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.23 RCVD_ILLEGAL_IP        HEADER: Received: contains illegal IP address 
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.00 RCVD_NUMERIC_HELO      HEADER: Received: contains an IP address used for HELO 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.24 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=RCVD_ILLEGAL_IP, MSGID_FROM_MTA_HEADER, RCVD_NUMERIC_HELO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

/var/empty is commonly used as the home directory for system users that do =
not
have any other dedicated directory.

Signed-off-by: Lachlan Archibald <lachlan.archibald@opengear.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recip=
es-core/base-files/base-files_3.0.14.bb
index 94299431f6..ff706637fa 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -39,7 +39,7 @@ dirs755 =3D "/boot /dev ${base_bindir} ${base_sbindir} ${=
base_libdir} \
            ${libdir} ${sbindir} ${datadir} \
            ${datadir}/common-licenses ${datadir}/dict ${infodir} \
            ${mandir} ${datadir}/misc ${localstatedir} \
-           ${localstatedir}/backups ${localstatedir}/lib \
+           ${localstatedir}/backups ${localstatedir}/empty ${localstatedir=
}/lib \
            ${localstatedir}/lib/misc ${localstatedir}/spool \
            ${localstatedir}/volatile \
            ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE=
_LOG_DIR}') else ''}log \
--=20
2.26.2

