Received: from outbound-ip20a.ess.barracuda.com (outbound-ip20a.ess.barracuda.com [209.222.82.202])
 by mx.groups.io with SMTP id smtpd.web10.83433.1597815363761433602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 22:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@opengear.com header.s=selector1 header.b=FUJrceU5;
 spf=pass (domain: digi.com, ip: 209.222.82.202, mailfrom: lachlan.archibald@digi.com)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41]) by mx5.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 19 Aug 2020 05:36:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA514tQnv7wl+XUA7CjDjiYdv1aW3nvhlSQARa/6zGX0dV9b5Q6fbskHEY1Dctpcm6wc9iRnuo4lmt4PaiexqCHstc5CwaAYfaWbgIcU3WqQ1EK1eFakhbNWpfRWCQNt9lR1UvZ6BrAj5cwAE0qrtnMk/Vv9tsovb88zd8H6Qsual+qkFHU/UVLUHvYJMlS0FIl4xI4rvm+wdgf3pcdJxMzSxaWYyf3fSNs95RiMhSTo6nU+8Iz8SICG+3e6a37jem4FE0IamB35X14SL2qFxtyru8HrL9mMvoyE88FobXECW0RUsz027yKcqjWVj9wohq+8ZjGn2qoOa5ESvNn1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnWp1wJgKANBbdNRdFcNxTxJPzkiaWWloubQiH9Isdg=;
 b=bhn5ZV7TNS7SMAWgWwNk05LJYGILv6LkA2HVMtp39/td5ynJ1ER1c9xCtIwdWQoQYFcGs2x9kbWJZsgeYpP0Nwr93W4P6b5wEgvCJymge+K/e77CzOCTee7KAEwGBTq+nDoqrAvX425Blf3dOey0Vbo7gZZNwsesAzPLr6QEbDOduqehtvh8GttFPE8ghzb7P/Ou0bBdejTivj7pFjD8m6eMqE93v62LgOOCtiCwDq5eR6IDVv6W1Y/uw9k29x8No5L52dz+3mStoCOmslQIiL08+/SCXkFpv3ifNcjlgKmgr74c9NqANd3cRRCCCkrEhooOekdKX+G3a41/9fS5MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=opengear.com;
 dkim=pass header.d=opengear.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnWp1wJgKANBbdNRdFcNxTxJPzkiaWWloubQiH9Isdg=;
 b=FUJrceU5pV6smjNYWuxSov8OdE0CfZlFIlgqVuEq1pL4rwIWRPnoZkZrikD5BcwO2YoPqBTkfkyik1v4ljYxpAeZ/Q+OoopZ2DFiOZKMPOzXgVYI/p3DH49N65FY2YtqCwl0RMRCPIhX9kZWioigAjowwu955VASYUAf/SlJuFMwgFZhoG4kd/rWk1dGog4g88jCz74nXimWxPKvBIzQvcIhfLsbGLaI2BDhNlNhs1joM4o02wO7/6OMuIMDfl31XKbrWTsGQYvjDu7NVTaaBgwnmYsauyxNLj8Q6/ToQqKJWvQKELz36p2F7MwLobfEpB2TofdBj0BXz0LzTKJuYQ==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=opengear.com;
Received: from DM5PR10MB1641.namprd10.prod.outlook.com (2603:10b6:4:5::22) by
 DM5PR10MB1580.namprd10.prod.outlook.com (2603:10b6:3:12::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15; Wed, 19 Aug 2020 05:36:01 +0000
Received: from DM5PR10MB1641.namprd10.prod.outlook.com
 ([fe80::c0bb:a404:670f:c444]) by DM5PR10MB1641.namprd10.prod.outlook.com
 ([fe80::c0bb:a404:670f:c444%9]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 05:36:01 +0000
From: lachlan.archibald@opengear.com
To: openembedded-core@lists.openembedded.org
CC: Lachlan Archibald <lachlan.archibald@opengear.com>
Subject: [PATCH] Add directory /var/empty in base-files
Date: Wed, 19 Aug 2020 15:34:39 +1000
Message-ID: <20200819053439.3241164-1-lachlan.archibald@opengear.com>
X-Mailer: git-send-email 2.26.2
X-ClientProxiedBy: SYCP282CA0021.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:80::33) To DM5PR10MB1641.namprd10.prod.outlook.com
 (2603:10b6:4:5::22)
Return-Path: lachlan.archibald@opengear.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by SYCP282CA0021.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:80::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 05:35:59 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [2406:3400:40d:d2c0:3e3d:7ab7:b419:5ebd]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 512ce63b-37a6-4542-422a-08d84401c194
X-MS-TrafficTypeDiagnostic: DM5PR10MB1580:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR10MB15802FAF247FF24A8C5D073F875D0@DM5PR10MB1580.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TrthpRKL1IhrHRn2nwvfR30B4cq4zJM3t8sL1lEMC4X+FPnCNEHJvhEyl/wuw1ADCQ2PJxLUcvBrm1H0A7dMMsvzKRvjzy2S6nuLoZghC39P064UQypn6gqUjZqlICuBRkZicw/4o4AaLg+vtpdb0ls1IM51j8+M9m9rhXhmK6d0AIdoF9METCKdU8O41RVdYrzZmEJ+4ZLZ7tztnF8CDWgei95Q9U+LBSkNXhzHX2VCUPXlgwV3ew0st3hnzRjtZQfrSE3MX94Ta8Y46KAI8au7D2GU5pUJWWGK1Oc3RoqS2Zg28WnlnJ11q9Sg1OsTM8Md6bknR1e1DAaWmn/rs2wC6efSBJjmPTDIn7dDleFFL7kQwrbknn/Y1Lp89IqZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR10MB1641.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(366004)(396003)(136003)(346002)(4326008)(956004)(44832011)(6666004)(186003)(6486002)(83380400001)(1076003)(478600001)(2616005)(8936002)(42882007)(83170400001)(110011004)(16576012)(66476007)(316002)(6916009)(2906002)(36756003)(52116002)(8676002)(66556008)(66946007)(5660300002)(107886003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	pEoCX/iOXvqMgamJgstSDPQvdgGqH2ydDuIG3RQt885SyTmZZHKnNdfV9CVx3bjpG/otR1R6sC0QMYes2f/N7W7/0qSniADTt0IdKJa5+PSWEduJldnr/e/o3BpnCtarvtAzVULfkBL6AtGGYJT+dyKeVjeMFA3dDU0wYa2bbVjyK28yVhccdB1CUP1Q9yyFqqbaqbwTptL1sTlFfYTjlz+hLPD5LiEl62VyGdzDeySYuFQMdb4JSi/0ExAraPGgW2pNmhCdxgKv1GxBqPmqeh6Jze3Vda3mUchOvgUyfGQFoYaxJwAGxBDH1qcPRANeEHjtw61cO09p0nmzl2akfirxAm0CQyM6LGFzzbzlQGXGtnI6xLKD4hABlmyvv6t6DLmZdkTMhqZSg1/F47EMZ5rLSjFPTxUt5IoMYros8A8JYCSXkVJ4DvhWr6vUXjk0OvonXynp2HUg4dvUgGChOFUro0Clqdwt4hyOWTrtr18lfWVKJbWUptMTRE9BTPagBK8Wdgg0XWL/Fh/u+pCRrE8f5uBvAnhXe/uzU+fpjDz326n2BPnujUPr98MoQ6bM77ONot9s/SEp3j1KATQGpmX2KuJiAQzz6vBNvGmO9Uyp8iuARI7eFWN94uImbOlAA+h5eHwAVuz9IXKwS+q4TN8To+bcWqO69waN9bjlWB16nizXSoGy+n8MdtDVRyv4NE77uWN88+561JqDyiXVDQ==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 512ce63b-37a6-4542-422a-08d84401c194
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1641.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 05:36:00.9988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQUgXAZVYZGb3bXayALadhLBFePE6o8bkaYOv7AUoKz5ry3zPac8oNSaHOX9m8mU8HbeSyi2z3piq2rZMHx4zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1580
X-BESS-ID: 1597815362-893008-16441-45249-1
X-BESS-VER: 2019.1_20200818.1820
X-BESS-Apparent-Source-IP: 104.47.51.41
X-BESS-Outbound-Spam-Score: 0.24
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.226269 [from 
	cloudscan20-132.us-east-2b.ess.aws.cudaops.com]
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

