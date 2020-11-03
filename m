Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.113])
 by mx.groups.io with SMTP id smtpd.web12.5519.1604416436058895463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 07:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=ug1qll0+;
 spf=pass (domain: aerq.com, ip: 40.107.8.113, mailfrom: alban.bedel@aerq.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbobCzyHJLUv4OljbW+xiznufBzw4vXG6c08Ou1pDWs=;
 b=ug1qll0+HSkr+0DJ7E7YTw98vzwUKsB7oW6X5bez/4wTpvK4j4Cl6v8AFz9yJhoy2zp8sKxUwejZ+cbCA3vHlELEHpALhUlfcge7CQVNJn2H1y78EPhjyAL9QZVgUdX3fTVWDphgP7JNIiQ9XAmwglW/4csaAakpDYEp9TCOij4=
Received: from DBBPR09CA0020.eurprd09.prod.outlook.com (2603:10a6:10:c0::32)
 by DB6PR1001MB1109.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:63::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.32; Tue, 3 Nov
 2020 15:13:52 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::3) by DBBPR09CA0020.outlook.office365.com
 (2603:10a6:10:c0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 15:13:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.169.0.179)
 smtp.mailfrom=aerq.com; lists.openembedded.org; dkim=fail (body hash did not
 verify) header.d=l2task.onmicrosoft.com;lists.openembedded.org; dmarc=none
 action=none header.from=aerq.com;
Received-SPF: Fail (protection.outlook.com: domain of aerq.com does not
 designate 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3520.15 via Frontend Transport; Tue, 3 Nov 2020 15:13:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.59)
	 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 3 Nov 2020 15:13:52 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 9494873
X-ExclaimerImprintLatency: 721316
X-ExclaimerImprintAction: 1b9e3a9029a8402b838f4e0a8c6085e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAApAFRTd/H0uzBOIDhoiNgyqh35EUaUiLCfch7BdHUxNSAugkfRoFcRkerGrsd7NF7h2xiPqRQKdZHEBrPvNRY+8y77YnZpaIwSOf8b+hHTYWW6Bj+T/xyBLpJk1F53ETA5THproGOp+w58iYm+SnwJGFI3CmsHDv6Cz78rmJk8aXZkeWT4vhWuRx2ZcMwNX5sEa4ieKUAJhMEsfpD/FvVadIEb/RpNn/bSzmL2hIpEwW0h2UWBPiQPKyJmpTiLbpktr8aue6xkdXRTfOgpjoABNIdtg8weO01PpFTjdckHjZD/ec5bpeDea7a6/mIYhgeLP1DfgerEB2+3V/aiew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQavVLACut1+nQa3ZdM1LJ0QHjEvg3HBtkrRj0zs4bU=;
 b=LI5jxtDbZhauP3AlT29hjmN1Q00SMMVSvYI7rGgbYZM+Pe9NJ7GykqS7No6XbNA+RJVF6CwHw2n64t7dj2wcZwIXBo5DxfIrUpLy+f4T3nKkdMd+BAYc3TEuG3fo0+DYK4l4/NFGW5CNNZB2pC3xEN3rX0k243l8uJQG6qsGqskMjiTfwh9JWumh/VRZkkXkcTrWeZToqu1CMu8AMuRuRQ8SZNzb/hdpnyh2QJQ1qk6z5alS2hKG83IZP/7CcyTaZl2sipbsdS+zNzjBOQGYUaWIMirMMoZ+B5ubWmX0FxxcOK0DtzwKcueH3/PL/4ZT4QM6cAxY/aNqAhH+J7af5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQavVLACut1+nQa3ZdM1LJ0QHjEvg3HBtkrRj0zs4bU=;
 b=edjtbIG0g97cKmD7EQUfKUszMR1eyn5+ajpRH3iSpu0Ab2jf269pQkuyGpHulMJCkCXCT5R5+BWctZJOMiQmhNX9FTGZs3tf0H8qRp/bxy8QiCJX/J/vgM0FPGoUNFlNBvgoVF1lNfExh02MUrcmrxtAgcf7SKmQVDys+oMX/jE=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=aerq.com;
Received: from DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:e4::19)
 by DB7PR10MB2315.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.24; Tue, 3 Nov
 2020 15:13:47 +0000
Received: from DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b075:2cf7:67ef:c6f5]) by DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b075:2cf7:67ef:c6f5%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 15:13:47 +0000
From: "Alban Bedel" <alban.bedel@aerq.com>
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] systemd: Fix systemd when used with busybox less
Date: Tue,  3 Nov 2020 16:13:34 +0100
Message-ID: <20201103151334.1620137-1-alban.bedel@aerq.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [87.123.201.111]
X-ClientProxiedBy: AM6PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::16) To DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:e4::19)
Return-Path: alban.bedel@aerq.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from aerq-nb-1030.dotsec.gv (87.123.201.111) by AM6PR04CA0039.eurprd04.prod.outlook.com (2603:10a6:20b:f0::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Tue, 3 Nov 2020 15:13:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 156f1291-4fc2-4d38-833e-08d8800b131c
X-MS-TrafficTypeDiagnostic: DB7PR10MB2315:|DB6PR1001MB1109:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR1001MB11097D76E8C521E0AB11D20696110@DB6PR1001MB1109.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 b7OMLCIHNcDkrdLYFvx/8ZskAM9jRbsqKJTRoRzzMtQPCEjHC9zcVBJ9pGWi3pDaWSQ+kPPHXOPBFIDJJBX6cZ+2TED9uvHSKess3P4PCDzrQD4y85NhIzWtye6XfdFh7UoMfrjChfXiSwQpk34ptIWTBXluyIl5DwjuyGAlZbyrydnjHDzePap5DSFQz/0lLtFYrk6rtTdWq65V09Gkv1YeZYJny8Qb97lVckE+03YRlVPWBtWb7uoWrFl4oORtnmtuoC7+CPHtCMF4coVEHZQ5lLF2VhhM1r9tDS+OEUy1iQETGDI9e62B2bldDdMZqI9DHtOGB9ru9mbB+RmVmcLoKYdX4RuVxNm0hO3tFfE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3434.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(396003)(366004)(136003)(376002)(346002)(107886003)(956004)(52116002)(26005)(6486002)(186003)(8936002)(5660300002)(2906002)(1076003)(8676002)(6916009)(16526019)(2616005)(6506007)(6512007)(4326008)(66556008)(86362001)(66476007)(6666004)(83380400001)(44832011)(966005)(478600001)(66946007)(36756003)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
 weBugelkVUGOnLsl0DKCL6y+cB70BPmBms8cNdfX3yPnHC6kHjsDBE0r1ZJJ/53cfdweu7y+ue+SgTTss3BgFyHuBzAhZP9qGYpV0Vc6YNaiE8WbzpHMsnms2BYqNUfVZlQmwciF1IfXGKV4q8H7vs29IYuASGFTe64mKr721J8En3S3LY7MuHi5dCptk4lCWrGAbdWSYXmvG85fv3RfPaw1CWo2Vc9bPBdmhx7yGST1zx0+ssou5SM4fi3+GZzVCZA/AUZMoSp0OLGLUY70QgWDmGdJr9LVwX7BUtYg6jdriUpvnseFotOThd0sqcvkkBFZG/D1enevqxfOULB8xJiEfb9niBv6sR6dZV6OOl2zChFrk/ZRxExnz/EYSsjXSwryxvMCpeO0B71Zx88pcmmn7xeyyQpXrfH/iZNTIh4PK45Qe2xezo48V/Zmf+0s8UWA5q6dHxIVuIaxQUJr17bXjcL0hmCvQmyc+nfQYyp5mT3fbwL5Z6GVVZZwbuL7LcBAnUrTXJk47ZN3U+YCYK5dsnokvFz37S0gdng9cAxrYFBcYuQQDOOrT8Rx7YebAGqfSXCqgkBXYUyDVnUjcB61hI8Y+1/JuDNpcOl9TWJHobQqEkqcyZXxXvbFlbTZDRB6THHsrIwZXalhRA11OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2315
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fcfd052b-6caa-467a-73f6-08d8800b0fc8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QjVa7qwlu+8FwsPz4Z/XwGALZC7w8C4P8pQKaXozC+/+3FN82HmyqeOG2PGU8jyxdXa6vf1ltjGoMK3ooXyu1P5QEIfKPDs384f4ITAtwI/b46uXkonvJ2keJEkhTnvHH+7w4A2MtFE9QDZHhXWtnlxQ/rNkyHzrYJCL6Vjf1cuEySv7zjxCyC3OO+jT+hA4z3OMt+PuitHioaaWRQw991ARKSowq4r4vck5lz1bIoZzCUVkTUeR7kYqKKKijzSbHZSt7I8MOBHUY4lVDOXW5hrGnHq3fERq2nABZAFPdTu6dqAoox64tfQdP6YkkgOgik7OKJe4nzKlz5to0Ynr0DL/t+f2D7WZ5pVEkoip2igIuDR2JpIHKazhzM2H1Y9cLPU2pqlCWjniaHOLqKhpXX1yfmL4sojg5PITS2EadUluEjfcDwjZAczm2NVBET9Z+j+dNVt5XIljKSo/IysnCQ==
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(39830400003)(396003)(376002)(136003)(346002)(46966005)(6506007)(478600001)(186003)(6916009)(44832011)(8936002)(16526019)(336012)(966005)(8676002)(316002)(6512007)(6486002)(26005)(47076004)(5660300002)(356005)(7636003)(82310400003)(7596003)(4326008)(107886003)(33310700002)(86362001)(6666004)(70206006)(956004)(70586007)(2616005)(36756003)(2906002)(83380400001)(1076003);DIR:OUT;SFP:1102;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 15:13:52.5666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 156f1291-4fc2-4d38-833e-08d8800b131c
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1109
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Per default systemd use a pager for the output of most of its tools
and it expect this pager to be color capable. But that is not the case
when the busybox `less` is used, which lead to output garbled by color
escape sequences.

To fix this issue add a profile frament that disable the systemd pager
when busybox `less` is detected.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 meta/recipes-core/systemd/systemd/systemd-pager.sh | 7 +++++++
 meta/recipes-core/systemd/systemd_246.6.bb         | 5 +++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pager.sh

diff --git a/meta/recipes-core/systemd/systemd/systemd-pager.sh b/meta/reci=
pes-core/systemd/systemd/systemd-pager.sh
new file mode 100644
index 0000000000..86e3e0ab78
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-pager.sh
@@ -0,0 +1,7 @@
+# Systemd expect a color capable pager, however the less provided
+# by busybox is not. This make many interaction with systemd pretty
+# annoying. As a workaround we disable the systemd pager if less
+# is not the GNU version.
+if ! less -V > /dev/null 2>&1 ; then
+	export SYSTEMD_PAGER=3D
+fi
diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core=
/systemd/systemd_246.6.bb
index 9215adf8dc..4311ff21d6 100644
--- a/meta/recipes-core/systemd/systemd_246.6.bb
+++ b/meta/recipes-core/systemd/systemd_246.6.bb
@@ -18,6 +18,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
            file://99-default.preset \
+           file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash=
.patch \
@@ -305,6 +306,9 @@ do_install() {
 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
 	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/syst=
em-preset/99-default.preset
+
+	# add a profile fragment to disable systemd pager with busybox less
+	install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/=
systemd-pager.sh
 }
=20
 python populate_packages_prepend (){
@@ -538,6 +542,7 @@ FILES_${PN} =3D " ${base_bindir}/* \
                 ${sysconfdir}/dbus-1/ \
                 ${sysconfdir}/modules-load.d/ \
                 ${sysconfdir}/pam.d/ \
+                ${sysconfdir}/profile.d/ \
                 ${sysconfdir}/sysctl.d/ \
                 ${sysconfdir}/systemd/ \
                 ${sysconfdir}/tmpfiles.d/ \
--=20
2.25.1

