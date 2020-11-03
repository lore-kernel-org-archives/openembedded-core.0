Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web12.4244.1604411120225856314
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 05:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=QvoNoUkw;
 spf=permerror, err=parse error for token &{10 18 _spf4.garmin.com}: limit exceeded (domain: garmin.com, ip: 205.220.165.212, mailfrom: nate.karstens@garmin.com)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A3DcoNH019998
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Nov 2020 07:45:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pps1;
 bh=Oc6W5jRXCQ6IltnWIOK1VmJV/vFLHN09ZTyw3/fDr60=;
 b=QvoNoUkwCDlvAKDIqfxcF5qsDdYrYZwSOkqBPzu7T2G7wkftcglNz/4cFbbF0Lr4QnB+
 qrUDWQJnktZERk56G25BlviXFgu076t/g7AV8gLerkZ9pVVsNM2XiWsSvoudixw2OvGF
 reVrHeqh9+JtgUSbx3fbEGZfiT+BLE3dA7K2r10vcIQ38pxQE/yR64cnCo+UkWF3uSVR
 xKb4XgEbHk5PMXW7JAW18cTezpWTdu2UXJtil3k58guNpxM++5Tj6xaVQX4uqP11rz1W
 omfPRtWd6saJquMxNM4aWB6GlYtKIN5uMNrrKDcg0hawTCu9LJBST3jwOt69wOysAbN/ sw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-000eb902.pphosted.com with ESMTP id 34jkmb1qe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 07:45:19 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJn5zocjymaOKtpjDvHQklVbVfrqwYKTRMrFgTF9jZp1VgfPDVoN9bhJ3YDLkL2PAyN5ByvFVsOH9t4b2wheFzir4ENurqQh0qK7MGrGnxo0iaTHUe9LxQBARf44iXn5VEqcYWzYjIxRcprXSUzqPOyYNHxfOwFHnjC8g2zZQzLEKOfsallMmTZx21UrFPY+CQmMTzMpvwCtX94sJfQ2AtqfKrIimnNtkYLFE9oJO20NR8XDtsM1iFeLx2B4IsP0W0m6YxJFpQImlidsUkWBE4mRa8TuT8YMiPH12zXBTbNsDzfB8LHKCREfeuoUyvBX/JVo5MCnPazx735g9TUeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oc6W5jRXCQ6IltnWIOK1VmJV/vFLHN09ZTyw3/fDr60=;
 b=UWCLa29zgGXHwD9AG/IPMdrbTdIsgs7FSC/+SZ4hB/baqHspLJg5q8jnxz5XWlucyFsAO7tFcrUK/ZJuB4Lf/4rResiYorNr9/VMroeLbwB3JWju0ED7KFSEnaT6vxFSBJxqU4HEgXKN7IXCc4fd5N9UHB1gPtpGAH7mk7n1SiNDxwRfFcVcnkNUe916VP+pp2IjEcy6KejrNxc7Au0ppIkm8kkaINZtCX8wXXE30LuAaBQu+MD1xmloR7iR8IaySNhNIIwXjJ5Sb+3MzyCiuaQI7wYgwUQgHUCvWNEsknF7j4RXR/vRA1T2BL18gRtOIEekzZD4n/5/Q4sTWldCAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oc6W5jRXCQ6IltnWIOK1VmJV/vFLHN09ZTyw3/fDr60=;
 b=0SF/DSK5JGqBCg0ohS/BHvDkb2KLhzklevKLCCKLy4RG8y9AWoZgI7uTX6mLMAhDah6JSdQs2d0SPU1SHfYiuSg0vTBclxSzgI0TqvaqZLOoMjNKBnnR1zQJ1lh9TgVxdHL2QmtL4CWFqUaRYYhGoSFHRY++DkUlZVLd8Zu//abHSHVCr6aIGawhkk16Wf+JiCqVC4ZE7IylpAY598CDvjwL6zfmXrcJnmQ8AsLsToOqVhulEI0TohfH0niX1yJ7fgmZRuhbHgzPj1YUcsExW0UF2/rHPTABz6M5jLRNc7T4eJDjo2OPpRbYAhSm+lrQ2nhSL3JFWPQnqAhsW4J8HQ==
Received: from MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30)
 by DM6PR04MB6043.namprd04.prod.outlook.com (2603:10b6:5:12d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 13:45:18 +0000
Received: from MW2NAM10FT047.eop-nam10.prod.protection.outlook.com
 (2603:10b6:300:12a:cafe::1e) by MWHPR22CA0068.outlook.office365.com
 (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 13:45:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
 MW2NAM10FT047.mail.protection.outlook.com (10.13.155.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.17 via Frontend Transport; Tue, 3 Nov 2020 13:45:17 +0000
Received: from OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) by
 olawpa-edge1.garmin.com (10.60.4.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Tue, 3 Nov 2020 07:45:05 -0600
Received: from ola-d01c000-vm.ad.garmin.com (10.5.84.15) by
 OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 3 Nov 2020 07:45:15 -0600
From: "Nate Karstens" <nate.karstens@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Nate Karstens <nate.karstens@garmin.com>
Subject: [OE-core][PATCH] openssl: Do not create /etc/ssl/certs
Date: Tue, 3 Nov 2020 07:44:11 -0600
Message-ID: <20201103134411.118217-2-nate.karstens@garmin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103134411.118217-1-nate.karstens@garmin.com>
References: <20201103134411.118217-1-nate.karstens@garmin.com>
MIME-Version: 1.0
X-ClientProxiedBy: OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) To
 OLAWPA-EXMB7.ad.garmin.com (10.5.144.21)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 746f803a-fe5c-440f-096f-08d87ffeb2de
X-MS-TrafficTypeDiagnostic: DM6PR04MB6043:
X-Microsoft-Antispam-PRVS: 
	<DM6PR04MB604354AA0883AA24DA9517839C110@DM6PR04MB6043.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lHZk4JHtqMFo1WCN/B8g0/VHsqolVzo+qh+Tx4mQYs/8RSvrhUCD8MbGJJTOQMS2cHT/n6TVQIiyUG+5rCbU54pKRh6HtYmKBzoi1XirZDTSpsOYNuYDCfoPO4sXnFoDPrFyAiJD+U1aPmiH16/MMcxn/WpD9FJ+IehJGAVWwVWfaZa4E7L65b0SEiOPYUSpgFNNkcVp7gt+z3lT5wV4NoAvygfQq3thffpF1VtLduWpBJ5BqxyD755KCtNMSHJVwaGFztYEa0LXJ6hwVyTktY08Vq8IiSdDEN6tE6Xv7j211VvqgDPenIf93YCjfQ4IOLF5OXF6AJBFq0PEydbF/bApG/74zy/GoSOqStRIBG2Xv7U8iddXbKEqwt4rMlBCuM+p7D04wMfS2SksHZsXqw==
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(376002)(346002)(396003)(39860400002)(136003)(46966005)(70206006)(70586007)(86362001)(1076003)(47076004)(478600001)(5660300002)(83380400001)(356005)(7636003)(82310400003)(8676002)(7696005)(82740400003)(316002)(44832011)(4326008)(6666004)(8936002)(2906002)(107886003)(186003)(6916009)(426003)(336012)(36756003)(26005)(2616005);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 13:45:17.0892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746f803a-fe5c-440f-096f-08d87ffeb2de
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW2NAM10FT047.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6043
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-03_08:2020-11-03,2020-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxlogscore=713 lowpriorityscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 suspectscore=1 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030094
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The openssl package previously created an empty folder for
CA certificates at /etc/ssl/certs. Other packages, like
ca-certificates, would then populate this folder.

Certain systems need more flexibility with how this folder
is created and populated (e.g., a symlink is needed). To
accommodate this, the openssl recipe no longer creates the
empty folder. Instead, the folder will only be created by
packages that populate it.

Signed-off-by: Nate Karstens <nate.karstens@garmin.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1h.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
index eb11fe3960..5723d19dbf 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
@@ -134,14 +134,12 @@ do_install () {
 	# Create SSL structure for packages such as ca-certificates which
 	# contain hard-coded paths to /etc/ssl. Debian does the same.
 	install -d ${D}${sysconfdir}/ssl
-	mv ${D}${libdir}/ssl-1.1/certs \
-	   ${D}${libdir}/ssl-1.1/private \
+	mv ${D}${libdir}/ssl-1.1/private \
 	   ${D}${libdir}/ssl-1.1/openssl.cnf \
 	   ${D}${sysconfdir}/ssl/
 
 	# Although absolute symlinks would be OK for the target, they become
 	# invalid if native or nativesdk are relocated from sstate.
-	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-1.1/certs
 	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-1.1/private
 	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-1.1/openssl.cnf
 }
-- 
2.28.0

