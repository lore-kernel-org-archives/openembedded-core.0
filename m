Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.83])
 by mx.groups.io with SMTP id smtpd.web09.264.1603905634288789340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 10:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Pe81oNGv;
 spf=pass (domain: kpit.com, ip: 40.107.138.83, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pi75l5x/8I6NYlU4ZTp3aMoqkBpWvGtAwO1LQry/n7tcSlZ/cpXLEncAjLGDjEh4vw9E/KyMLRTS4Wxxp7xq35b4+Nsf/1I6PPZVXqtAWgHMSRPnQ6jOovPD2uIYRS6vWLukZKzVsEgkXXm1AD72itVRJLwTE8/R0xHmk8scbeAY2xPnzxRczk4c5uQ9gmM4bi4jprSW9n0avDpGa+mHn7Ahr0gOtherTG87Y/bL4NO+YFWYsklou5vMlbkHM0FK4t30ydezNcqvqWB19vBMHaL5S6ZizRWx7R3cbi1qbSToVjkOUd8nyGHNHWvjdH1+Zpycf95xJ6E3sHTORoMCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QbsIE5LIEwv9xg6eKqf3ecwhLZ84mwGGTG/guEmCjg=;
 b=Q5VKoUD/DIQsgnAMEM2Tsbm3UgRpF2adW/HbYOrCJwZVyftUtvgAOsdYHtF+GxZEYvR7oM+hMae5sEULogwHofyHmU4DSxvbICy+LMZSRXCZf7HTtJc8be5IcjNrZyjzIADYsn6Phl79wSmKPyjQOPFahZiCWah3H8uwuLuXHPV4rQMEuHm7NS1SexNFB4DZS/l/ni8BCLwBiH3aylcJA5shejbQiLwcNeHWTTcvT7g4LLJbki8rcBUbKzqGnI//SatQ2lp0/vIKi74os74pstMtmpmhmVkMojEPWQvDIafr7LUIQqzDTAKBXAVI7iuHT3r787G8v40XQ/t7luNBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QbsIE5LIEwv9xg6eKqf3ecwhLZ84mwGGTG/guEmCjg=;
 b=Pe81oNGvV1SrwgUdsnsC0g1y7eVWJPDfxzgpi+c1FkeYsV2+3xGW4Y2s9HUIG7dS0u5teSXUHna8MotcirYRxtfI03D5QNv4RL800yGLuzOgYjI9KGqd7PJmY5HEQ8LuAtgUsEFuvwRJZiJ48WFwQXvCTgsmixhEpADO78BBIk4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BMXPR01MB3797.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:5f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Wed, 28 Oct
 2020 17:20:30 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 17:20:30 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	Saloni Jain <Saloni.Jain@kpit.com>
Subject: [poky][dunfell][PATCH] gnutls: Whitelisted CVE patches
Date: Wed, 28 Oct 2020 22:50:21 +0530
Message-Id: <1603905621-21388-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:215:ea7d:104f:98c0:299:6b11]
X-ClientProxiedBy: BMXPR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::18) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:215:ea7d:104f:98c0:299:6b11) by BMXPR01CA0054.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 17:20:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5ebf613c-3580-45fc-1c8a-08d87b65c54e
X-MS-TrafficTypeDiagnostic: BMXPR01MB3797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB37972F4F6964AC765B85270F87170@BMXPR01MB3797.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:309;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	guFDrUhafTFrP80emg1CISVjEifLIPffMtk2BtIjOWrn7kJ2TFupXkfrIqPlLyL2YZRUybOQkOwY26OnMwRKneJnX22SYGB7vlpoMo6Aw+GzkMsB1vYLMj9Ir1xpz+BhfCDYbzoUGkMNyaOWl43JCTgc7u1hI+L6Sjl8WNjfx5ikbOA4EryZYzSyYpNncYcJcDkNFMMGMAPrWqSNt72kT4KYGcyzXn2WvGRoL+D3ArXfwikWgSTG+S99wS3vU8nyoX/S5E99EWVb3S7rVv0QtqaUNXzibW/EZ+O4RR6i0zOmJuM0BUrI3DXNrjnbjcQbtcm/KROrTYMSHvORbb9xBW4Oh0NVot/sLySAuNrY7My7UJ+Drv0Q2RS4DC7N8bGQVD667qNpLvnBaiVV6Scko1eA/r1cOFzlmLyzlJhYoDr0/kc+ZmqQ0jTIrUH7ShxVTzKfYtDnhQqZ4lLE2tqW6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(39850400004)(136003)(107886003)(66556008)(66476007)(4326008)(5660300002)(36756003)(86362001)(8676002)(66574015)(69590400008)(83380400001)(316002)(6506007)(6666004)(2616005)(966005)(16526019)(186003)(6486002)(52116002)(8936002)(2906002)(66946007)(478600001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	AfEhaphkOMfOLXsUH9AtKqIrfcx9EPuy3MkQkabxZjcCkF6DH3iv2y8/8kLbG89ITiv4vEFAUJg98A9+FqWtUF897pqsdP4kzQkTIuNpbxefArjcd6Ud0s+QyH03dD3DjUqWroRdtHOTy1JbWMlPfY1xi9SpgatbUJvz8vvs5LHEMOb3YFk7LaOZm5GC/TNqX/PfGmd4KGdHix5JPK1x6JUXoELmaIr0eCi3BcTcs9FqMAvhn2LrLOQAFc5u0nY7HFMji67rHf5EdJCwl36rcsszjFqyEJM9v9zYj+pMx2fjX/O+QvCKWBQVv5B/Xkrla3psbqegoLJuFWB5z9/t5/M5NwaTYlPKNB2hQBHOQiNbg7Bn/LaACZJsYhRa3Ic3vpDXdV+0N55O7hTlNhnDOvMBYuv+Y0YvItYWmfkKefRjExZsQYL1iv6sVkuMxs7KVhB43pv6UGx/cmBd9OGtpdkR0vGIqPH23IfjPGfS8KC3WIdvz3CedbVjud7P/0DIphNsbRcJSpkRF/dPlSCXmL2/OvR0Yod2RHsEnYyPim+l2rJUsa2o7ln0Pq8PMN6ffrhVtPpzty+mSP6gut4QzLxG7GYiko0sRN8GjurWyRaTLinifqHHCpnBMPr/CPBFrRahBKbhwSft1UPjE/dHawCNrZuF1+pwc6kP8VZa8z1W788exdd6I7D4LrLBaYkdQC1siTn4i+0MXXFXq3Ypbg==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebf613c-3580-45fc-1c8a-08d87b65c54e
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 17:20:30.7817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHlXG8LW3YJeoSzLzieysF8NkE6ZqAE+Mzl5PL0SMM+gBMUlBM284eveGw4xuRmAbpmjV77ZhuQt6lLpc1142g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3797
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Saloni Jain <Saloni.Jain@kpit.com>

Below CVE patches are whitelisted as changes
are already present in source code:
1. CVE-2018-10844
Link: https://security-tracker.debian.org/tracker/CVE-2018-10844
Link: https://gitlab.com/gnutls/gnutls/commit/c32a8690f9f9b05994078fe9d2e7a=
41b18da5b09
2. CVE-2018-10845
Link: https://security-tracker.debian.org/tracker/CVE-2018-10845
Link: https://gitlab.com/gnutls/gnutls/commit/cc14ec5ece856cb083d64e6a5a865=
7323da661cb
3. CVE-2018-10846
Link: https://security-tracker.debian.org/tracker/CVE-2018-10846
Link: https://gitlab.com/gnutls/gnutls/commit/ce671a6db9e47006cff152d485091=
141b1569f39
4. CVE-2018-16868
Link: https://gitlab.com/gnutls/gnutls/-/merge_requests/832
Link: https://gitlab.com/gnutls/gnutls/-/commit/4804febddc2ed958e5ae774de2a=
8f85edeeff538

Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
---
 meta/recipes-support/gnutls/gnutls_3.6.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-su=
pport/gnutls/gnutls_3.6.14.bb
index 51578b4..727a12f 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -17,6 +17,9 @@ DEPENDS_append_libc-musl =3D " argp-standalone"

 SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.'=
)[1]}"

+#Changes are already present in source-code, hence whitelisted.
+CVE_CHECK_WHITELIST +=3D "CVE-2018-16868 CVE-2018-10844 CVE-2018-10845 CVE=
-2018-10845"
+
 SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-$=
{PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-=
f.patch \
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
