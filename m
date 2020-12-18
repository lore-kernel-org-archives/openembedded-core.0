Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.51])
 by mx.groups.io with SMTP id smtpd.web09.5846.1608269826674947218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 21:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pwWJYG8z;
 spf=pass (domain: windriver.com, ip: 40.107.243.51, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/T6sP5c9QmYp7JNlzaujvoElbobeXc0Vay6FY+gXFRFOsvlUvWD3YAmQThK6n56okarAxSoi+OszonvxcVHSRGaupyN0LS7EPe3G6mRoURi42q5N6V1KfAoEVOoEX5CYvbniwQvOdgZ32wvixi4C2lDukTQsxbSr9dDyOOGH1p4pug20U9J3iS5q74C4woMEObzpETLyoA2+fN3Cf/jbouMr24cuIO5wgI9eKCoJK25Xy8TN0y044mWGDabo4s4djFwiKg80SYDS069yMw79LdlmN24BshgM2o/cCnr0O8shZ/sE8zFk3uhojOsksASEwoFwLbmSz+gD1yd7SNKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71LJpxu2nEzsVOr0zCoGBHx0A0CnuuUQC4zM/+EuAlY=;
 b=bAB63CXyV70s/QJsUXGT64+HAJrN6DqnjI69ZXzqIGqtd4V85hBqD6EC0ZAEBgzmjoQPxi1vQEuzRy7sTeYpPulQVc2KSwOt5K4/akNG8dyJITZX01SG4SUXIQ1HHZOThGTtdiDbUreOcQpAVO1F5qrrHoQSLLWfysaBszDVRWDiLHKzwSBv3+hOWksQjXRdqgyTI7jTm5dswHF4ueghlYgn/GxThoq+XEI7rZKQiu8HCE/jL2pQ8UlWvwzqty105Y6Se5hvwmOGt6D+RBfG3yhgRfR18N8pZ1r+G5HSup3yxX8/thSjP2lTVEj9SMcO3nd+5k7NV4hzR16RUfHF3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71LJpxu2nEzsVOr0zCoGBHx0A0CnuuUQC4zM/+EuAlY=;
 b=pwWJYG8zALSeD1QXhLrH9fxjl8r3rx9AisyjXyPHWNZo5hMqRvK7ohk/qZnh47JjoB+oK7Wqxqye4r7jiTQIac5i6t+3dm4edI+lkIUazT0D9yNP09KVcwgQRh2Wwhlrve6MeAM0vgx3px+L2frVS7Q4bJYHaMc115K4rO1j8Hw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1853.namprd11.prod.outlook.com (2603:10b6:300:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Fri, 18 Dec
 2020 05:37:04 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3676.025; Fri, 18 Dec 2020
 05:37:04 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] packagegroup-core-base-utils.bb: check the gplv3 license
Date: Fri, 18 Dec 2020 13:36:41 +0800
Message-ID: <20201218053641.17017-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0073.apcprd04.prod.outlook.com
 (2603:1096:202:15::17) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR04CA0073.apcprd04.prod.outlook.com (2603:1096:202:15::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 05:37:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe80fd6e-5bd9-4589-e675-08d8a316f37c
X-MS-TrafficTypeDiagnostic: MWHPR11MB1853:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB185337EB02A5082F883816DDF1C30@MWHPR11MB1853.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:226;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B+troBLmAsn5IUlTFEQbmmfxmkAgCnzzT/wdeIxytAOLVS6InZNECpxk/2mQjpGzkhm11C4pSJLpb8EcxNVZG5ZmH3lEszDkR3MjZ3VT0k1N4meosqgyC9eR9mDcDhvLzrif5Re6CbP+rWMHuX1/Hs8dApNFuAF2YgOvaKlhHdUhU8lxg7b3YAOFeFROp3t0HCmVwythEygH6PZ2f9IBO7mSYeIm92w8m5fcQj1yBmhY/mFq9SfiBOOdyXzmEuRVbCUiZPchDzHbq6X8gKBoi2YRVtmxJczsAdHaJrrn2Xa50HfipTBil39KULzGKhuu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(346002)(396003)(136003)(478600001)(186003)(66556008)(66476007)(6916009)(2616005)(26005)(1076003)(52116002)(6666004)(956004)(16526019)(8676002)(8936002)(83380400001)(6506007)(66946007)(6486002)(6512007)(86362001)(36756003)(5660300002)(2906002)(9686003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?24Cson6hoMxxhagsOn2MsKZQPhVECHe7zF4ZGBrlDRsE52fxQwVHzCDHXENK?=
 =?us-ascii?Q?pAaGsTfpiXlX+XPZo+5YdmP2K2RmEajbqpnJGJNxnfyj+PqvsPijilvsolFw?=
 =?us-ascii?Q?eun+OHQfP+4+dM3WUJ7uSrmXyJgAavYEr0uiSAiQtKNMnVbRv+ZEQ2omyw45?=
 =?us-ascii?Q?5OvHf66cogme4NTKPVu+HXPMz42caFXWEAkdnOKvaW84DM1DvjpCj09uqe+Q?=
 =?us-ascii?Q?DFHWgNE02rtXlucGaXuPqj4x+cNTSl3liU8dvBV04XcIWZRsyRV+P0dfTmbD?=
 =?us-ascii?Q?V1LXoYadCawOK7LNFRYQancWXu1kAnNMqeOznYTxzarcwoj35Db16T//HELU?=
 =?us-ascii?Q?YIzB0/hOmTF7xF5OClsnrZU7fnPo9RSQfos7EkBzFXpSHNOhwoKI22YXorXi?=
 =?us-ascii?Q?/FakQ8pP1KkmGUlmLmyMMx7d/HuktXu71+q9UZBtN6ulhaTe1E61QpZ6dbbx?=
 =?us-ascii?Q?SnHrzT0EjtJD1xHGwp2E1ElTsyuxAoBfjADbkg6d6DVMzzbSJ+e1vCpkPJ8f?=
 =?us-ascii?Q?f1BR7Me4F9TTz9RezaEYPwOBvtfopU80/XKxVZ9qfF0Ppp8ea3ebKYeoftyt?=
 =?us-ascii?Q?pqjnwSyfaxsxzOw+hZ9zdY+ck233CmnVWgOzmfV/Zy88YIrFI/IPig5GxKbI?=
 =?us-ascii?Q?2BtGfhowlQaCZfQiWhT8BNd33m3H+dcy7DFJqZJ1+ydP8Z6hV0asG0QO/smT?=
 =?us-ascii?Q?rdhZxoSpDnnXZ5m+CMkho7KVmSL6mJ+KZXk+QQRBuxgL3TxhbLx3QpBbBFzd?=
 =?us-ascii?Q?DduAaaexR8hXkMtEBFqsqxGc0td20Jl+wbXYl3teaopn1H3K1NuNAP9nXdn4?=
 =?us-ascii?Q?6UDtFAo40aAJlgjwU5UMIJgh5Gwjox7iKrpAkXU+NsQOHaaEEolH5vYdbeXc?=
 =?us-ascii?Q?LP81x0jh1m6N+pFQC4yUs9Zp4AfSfWx2RvlK7p3zsTXZmlaCR9muQ0VU+1MJ?=
 =?us-ascii?Q?iqgXOxbv6CY8QKMRG5o5MLUxYAZwkH0+1PC0xoc/51MZeUxJn+fpG2GF3fK2?=
 =?us-ascii?Q?pbZc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 05:37:04.1636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: fe80fd6e-5bd9-4589-e675-08d8a316f37c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OV5xp7EwEMhJj0dYc0UNJH9WnWm9GU/KFI7FB9grFJ4V7us0CdtxZJfcs4eajCHLaU01+e8CF6iRRKy00EzaTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1853
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

packagegroup-core-base-utils repends on some packages which are
gplv3 compatilbe.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../packagegroups/packagegroup-core-base-utils.bb  | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-base-uti=
ls.bb b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
index 1e63da7f16..0a3cb63bc2 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.bb
@@ -33,18 +33,18 @@ RDEPENDS_${PN} =3D "\
     grep \
     gzip \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "ifupdown", d)}=
 \
-    inetutils \
-    inetutils-ping \
-    inetutils-telnet \
-    inetutils-tftp \
-    inetutils-traceroute \
+    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'inetutils',=
 d)} \
+    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'inetutils-p=
ing', d)} \
+    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'inetutils-t=
elnet', d)} \
+    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'inetutils-t=
ftp', d)} \
+    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'inetutils-t=
raceroute', d)} \
     iproute2 \
     ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "kbd", "", d)} \
     kmod \
     less \
     ncurses-tools \
     net-tools \
-    parted \
+    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'parted', d)=
} \
     patch \
     procps \
     psmisc \
@@ -55,7 +55,7 @@ RDEPENDS_${PN} =3D "\
     unzip \
     util-linux \
     ${VIRTUAL-RUNTIME_vim} \
-    wget \
+    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'wget', d)} =
\
     which \
     xz \
     "
--=20
2.26.2

