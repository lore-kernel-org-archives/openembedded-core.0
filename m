Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.95])
 by mx.groups.io with SMTP id smtpd.web09.4358.1604411662026396625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 05:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=agNzSV+4;
 spf=pass (domain: aerq.com, ip: 40.107.8.95, mailfrom: alban.bedel@aerq.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dN8xSSshBTPYi80PM8xW8XxmB+3S9/4FSwDKUxJtigs=;
 b=agNzSV+4F1MnE6gbgQDVaQlUXiC14PqIIIrd0RQQ+Id+JJVFlVq4LNpHbgL0MdfJSWwTAjjCgzEAX28vaqElyNVX4eIu7tX7YbAKTjaPGaqcxbunRn2HaQjRZv1dRyYHLJKWT7uPQ9LKAj7VbI+i0s18BGktq0g+Xledd7aFxJo=
Received: from DB9PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:10:1d9::27)
 by AM9PR10MB3990.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1cf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Tue, 3 Nov
 2020 13:54:19 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::8c) by DB9PR02CA0022.outlook.office365.com
 (2603:10a6:10:1d9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 13:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 104.40.229.156)
 smtp.mailfrom=aerq.com; lists.openembedded.org; dkim=fail (body hash did not
 verify) header.d=l2task.onmicrosoft.com;lists.openembedded.org; dmarc=none
 action=none header.from=aerq.com;
Received-SPF: Fail (protection.outlook.com: domain of aerq.com does not
 designate 104.40.229.156 as permitted sender)
 receiver=protection.outlook.com; client-ip=104.40.229.156;
 helo=eu1.smtp.exclaimer.net;
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3520.15 via Frontend Transport; Tue, 3 Nov 2020 13:54:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.50)
	 by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 3 Nov 2020 13:54:18 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 35276062
X-ExclaimerImprintLatency: 5085176
X-ExclaimerImprintAction: efa131d06d144949bcd52a44fda66310
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLyhoz6xhYhnPhmaSjHmX2fIb/dN1WHVyA5RwaxCHwonzgWvsMDUWE9f3zlU1MMrKhzzqVzZwMUSVqktJYogNVcJit+XBusa6mtaQt8i9/CP0ebi5gQdipA4/GrdxILTbxu7uvNdRUK/wN0MzUTJWsnA4H/iZ8wIbZ+CMIaKVQ/fvZ/YgiljM1Zc3qNujkLVAOXt/1mvd5MMbufFQorh+k9tWSlx5MQ4AB5Jb1MFT9YhbIidYkT01nOMxFo8WSVCiUfnVvQ5fAOOTtl2QSVoYOwebTC8R5nBNjALLP/jwMCB7SUqB0HUB5X/CYscg+5mRc9hLX+D+JH+A03BUZP53g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4fLCPK+k2jcgBxxD168ECHA6EtXehK5JfLcApmv0cM=;
 b=mnMZ9E9G/ZSFgN/ySHhUAzm8ie9FXbnn3rraL/MvcbndyYLG7jTtvNvX5plAF1udgnHAM32ZGTdyXhihl7kQKYt6AZ6XVZqES2wB9LjutcG1tin8xBqekR5eOKKvPCO4UZ8REASqglTyiVH0SzZli/dpPNiGIsjUAI0kXvbxThbYJvlkVjcyLjbde6BLTR7DD37OIX8gfZ6GSB3AOEDevLymgqu6sEWCYvolhX+3dnkJ5XaLw4rUEPr1pUig76Ad0NIZLOUKY7ttPuYhYsUtBeUgSS99RXTd8kHtKI+dnSlZODqsZg3xeiBITxARabbyGZ/e6VsqdhGfzkDhmc4ATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4fLCPK+k2jcgBxxD168ECHA6EtXehK5JfLcApmv0cM=;
 b=uHrMNsJoOBq2OM/i/LDnP9XsHJMPfvwCx8XSPhg1gYeS5s/r8FTJhgyHQxDV9QIGaodftSn/wMzNzzA8Y58ZAh/a8QXN7Oe+BiIUIxzJZ7w5xEJGE/zLhzBYV59jqVPlgJ8WBaI0eEDXARLPRmL2NpDyDckwDRMCpKfvPFSy7DE=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=aerq.com;
Received: from DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:e4::19)
 by DB7PR10MB2444.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 13:54:13 +0000
Received: from DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b075:2cf7:67ef:c6f5]) by DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b075:2cf7:67ef:c6f5%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 13:54:13 +0000
From: "Alban Bedel" <alban.bedel@aerq.com>
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] rootfs-postcommands: Add a few debug tweaks for systemd
Date: Tue,  3 Nov 2020 14:53:51 +0100
Message-ID: <20201103135351.1581925-1-alban.bedel@aerq.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [87.123.201.111]
X-ClientProxiedBy: AM4PR0902CA0011.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::21) To DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:e4::19)
Return-Path: alban.bedel@aerq.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from aerq-nb-1030.dotsec.gv (87.123.201.111) by AM4PR0902CA0011.eurprd09.prod.outlook.com (2603:10a6:200:9b::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Tue, 3 Nov 2020 13:54:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a72d8a1a-a0fd-4829-3d4b-08d87ffff577
X-MS-TrafficTypeDiagnostic: DB7PR10MB2444:|AM9PR10MB3990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM9PR10MB3990821D41786F5CC8A3448D96110@AM9PR10MB3990.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 M5CIzYmrfTLRYjGHTBAMp8s7HIfDoMA9K4F48T9xpwX+EC3N/hXtixekWmlPFWe5JMrQrOtIRfzQrP1oXc5528ojidqjtQH69eFZBW581WFnHEh5ytJiTkqSMJBtVq6PTnJGDz5ahJYOiEyMCRmFe2gEVtZg5fwOId5ftoqyoW6QUhrQVzGWb5RVRiWDungiRETfJjREwoMg0sRGr9GvTiU9YfetvUp006CmrtAbnf1TdeOj8YvjKwTaQZ5+4gfQ8fnbDSEsVs1noL1kF3z8wDKKUB6NT6pevvu9Uck+pmsa+pb22Q2uCxFi3CLZtwVidhkTZ+8fFK+fRnqhegHDbQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(39830400003)(376002)(366004)(136003)(346002)(26005)(186003)(107886003)(16526019)(36756003)(2906002)(44832011)(478600001)(6512007)(6506007)(6486002)(6666004)(5660300002)(52116002)(6916009)(8676002)(86362001)(66946007)(8936002)(66556008)(66476007)(956004)(4326008)(83380400001)(2616005)(1076003)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
 xeVwb49gAkDGLpZJmQ5yARb9IFe9tnj9fV51LV3D3eQoyUlynL4GpTskp1KwFqn4g/rxhP805Cee9zUE7REUxuh21t85HMfKOum4vZeLVfO6pLZFmxi+Fw+gqXRICrexVkiAaJVXgYepcLzMI3OLGkij54goPQIAlRUVc/BSBAQy1Mm6hfMtHGYkWZnWUe0gbjZFTrtK0LQGbBQxr3WX81pfmE6W1juE4FJKJFEl7WXDuNnXn0lt40QgP6kWR+1AuP1jUhrmsZearx2GW6/jLyik1UYkYNA/DIbw/4e0v01Mnwrk6R/e6u/9Dd2l96tEnpnCyBWnJDLF0iLNrFkHCCo/tFm+tKXzoUzpaeLEnL2xXsZ3ck7NnD8a/oOudDZ1tPfnqkShcRcUy+zppx8lNp6L9dCa2HRI1Pifvf/gqABbVtefU068ys2HxJt3Gym4E7tkvYGmpjki6e/AeX4lAgyDsAqGZHrM+rT8Xfut+McsobaosVpHk83bnHB8aeCbql8e+3QmmnIW1t7tnKIucrL9RfiX7ppRf1BC/N0Txb/1qo3xZn+dvHIDy82Po2YfxN1xS4Rvoi7wkMBoQwHZ7neSB0/NgSnBSyBci9XymYfEnI3teicagLxk+e8X4dTqao+/rmIn0fH6aU/aem4BWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2444
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	af716a56-7291-47c7-414d-08d87ffff202
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I++dAU9TAl1/iXsBxB8m9To3k/YjGjY2NQe79ix7+AklHJzIXz7xyMw6e1OxBpZ0u3nxWl0H+Yx6ck3faPckErZICU1CsxP/JB/C497o40VgP6xX1G9C7bdFu+cEOIRwl/0ks2o4U0/01e3TsX25Cm/Ff7PDIx72zSQ2ZdP9KlnRDmdijJHK9zoDCWh3Rgi8he9uKYYwO/5OJK7bvmrg2bCLhfZAwC/oBivIITWjJZ8ecxZDfEjk1Ox9TO+OX3BrCkQ6Jo7wS+9Y7wVdkNx8uT757Kb9l9zAQEXUF2leaCJaG8/OVomuvKLefrRwrWeFKmWpw7IudvnkP2nWqKf1HAhvjH3YWflUm57YysEk0dvWKwIU7aSRfGT1a5v+blGLF9ZiG2a5BpbO0r37N5Mnvuh2ZLDIOEEdOvLCe0NjDZuiBXSwK9vbfWeiypmwoETu
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(396003)(136003)(346002)(376002)(39830400003)(46966005)(6486002)(2906002)(6506007)(86362001)(956004)(2616005)(186003)(16526019)(44832011)(336012)(107886003)(478600001)(4326008)(26005)(6916009)(316002)(7596003)(8936002)(356005)(33310700002)(7636003)(82310400003)(83380400001)(1076003)(8676002)(70586007)(70206006)(47076004)(5660300002)(6512007)(6666004)(36756003);DIR:OUT;SFP:1102;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 13:54:17.8248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a72d8a1a-a0fd-4829-3d4b-08d87ffff577
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB3990
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Configure the systemd emergency service to not ask for a password when
the debug-tweaks or empty-root-password image feature are enabled.
Also enable all the sysrq commands when debug-tweaks is set as systemd
only allow the sync command per default.

To avoid the need for over complex expressions when adding systemd
specific tweak a new variable called SYSTEMD_ROOTFS_POSTPROCESS_COMMAND,
is introduced to collect the systemd specific post commands.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 meta/classes/rootfs-postcommands.bbclass | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass
index 1f27a3d07a..3b4e600d3c 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -17,6 +17,15 @@ ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp=
; "
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is =
enabled
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", "r=
ead-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
=20
+# Disable password in systemd emergency mode if debug-tweaks or empty-root=
-password is enabled
+SYSTEMD_ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_F=
EATURES", [ 'debug-tweaks', 'empty-root-password' ], "systemd_emergency_no_=
password; ", "",d)}'
+
+# Enable sysrq on systemd distro if debug-tweaks is enabled
+SYSTEMD_ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATU=
RES", 'debug-tweaks', "systemd_enable_sysrq; ", "",d)}'
+
+# Add the systemd specific post process commands
+ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("DISTRO_FEATURES", "=
systemd", "${SYSTEMD_ROOTFS_POSTPROCESS_COMMAND}", "",d)}'
+
 # We also need to do the same for the kernel boot parameters,
 # otherwise kernel or initramfs end up mounting the rootfs read/write
 # (the default) if supported by the underlying storage.
@@ -153,6 +162,17 @@ zap_empty_root_password () {
 	fi
 }
=20
+#
+# Add a systemd config fragment to disable password for the emergency mode
+#
+systemd_emergency_no_password () {
+	mkdir -p ${IMAGE_ROOTFS}${systemd_unitdir}/system/emergency.service.d
+	cat > ${IMAGE_ROOTFS}${systemd_unitdir}/system/emergency.service.d/no-pas=
sword.conf <<EOF
+[Service]
+Environment=3DSYSTEMD_SULOGIN_FORCE=3D1
+EOF
+}
+
 #
 # allow dropbear/openssh to accept logins from accounts with an empty pass=
word string
 #
@@ -221,6 +241,17 @@ set_systemd_default_target () {
 	fi
 }
=20
+#
+# Enable sysrq on systemd distro
+#
+systemd_enable_sysrq () {
+	mkdir -p ${IMAGE_ROOTFS}${libdir}/sysctl.d
+	cat > ${IMAGE_ROOTFS}${libdir}/sysctl.d/90-enable-sysrq.conf <<EOF
+# Allow all sysrq when debugging is enabled
+kernel.sysrq =3D 1
+EOF
+}
+
 # If /var/volatile is not empty, we have seen problems where programs such=
 as the
 # journal make assumptions based on the contents of /var/volatile. The jou=
rnal
 # would then write to /var/volatile before it was mounted, thus hiding the
--=20
2.25.1

