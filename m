Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.83])
 by mx.groups.io with SMTP id smtpd.web11.24953.1602877639922712962
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 12:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=ooDzVbHx;
 spf=pass (domain: outlook.com, ip: 40.92.89.83, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPZaSYOmeG9EOmaHS46J/GbJ8b02B77EAySpYx/oTCBpi1DfPxOMVERX4ymnasHyrmxdHtw2vAkZCg+1O9W1t/Gw2wC+Zbzu1oViTaEehpbBSnjxC9vo/pH+zvX4/kFA0O4HXnyS6MXEAAV4D9evYsG2Afl+Wh3v5iph4pZePPI+Q4XTJdVhKVhVx0TJ0xNddmBfjcPtKok42J9iFA4ZAEFz/suVNTXbkHbXSD3jV6U9CySPwvvwHbQ5G+8L7osioHiFSoUpTGTYvPYEqMS7FdG80s0vfX0N0a6+0xUokFuyJTsyq4giHIYYPYtQ9QLQbDQLXH4mCrquU7Tpu2Vnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3CZqDf/0HpxzwQuJu9k8cpNg299T6TPJD6BQlhx8Uw=;
 b=fuGqyOQD7sGU96GBrc4TxsUE3MdlnpDHk234ErTZEDpLoJWvBijV/YbaG4LqKm+Y4UoPlsodNYcm9qtDF94L0wSwRTgz3ylxrUBT/2MUtDMNSueOEty+zAvxFBQ8cl5iXjiqBE9wEJ0kY8WYV7sYiircZCsHw6xSSB2orqskHcxjXrsFXVY5MI+7GglVluAjkaRggEvWBExG//XNJhoS6Z3+AixzLx0fQrCplZtk+r2x/uawpQXOCQwv1B0QnP5ZxrFoES0dCAktC14OLil+Vv2GVkf+8v7NivpfQv6syRMvkeqrGp8hiAHJYfpR4/nVt/foZ8+6TR1kDoYxmlgAJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3CZqDf/0HpxzwQuJu9k8cpNg299T6TPJD6BQlhx8Uw=;
 b=ooDzVbHxgfMv8biFgbCzIx6/BBLudeD50UI9SxE7imtN7ENJyUJvFib8bdAsIHEKKz50kkSTFMtdIKUbeQ7psE+bbvQxgVxVKVZFpunaOOWdJN8+PqpA24PfZaV2AyibS4BIHPkQe2C0MUSjSTftlgO7/rD2xboQ5Y/boQpggDpuOLQ5sMu01jQTNzZB3IebPl5XgbcFdNBlQbH9j/4shkB3B00IUf68/P/PG2DUsipXmlHJyzBnEB9HxG/zAwS8N1pnQG3AYVzQi9rLz34SZ9IpEErhYZnUws6dK0GmqpPkR086s3r1ZK6lzrldu004IBGCk7n+hw2aB8YyGC3+jA==
Received: from AM6EUR05FT065.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::44) by
 AM6EUR05HT056.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::156)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 16 Oct
 2020 19:46:55 +0000
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:fc11::4f) by AM6EUR05FT065.mail.protection.outlook.com
 (2a01:111:e400:fc11::106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Fri, 16 Oct 2020 19:46:55 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:45027F06E518EE948DEB4A30F31F7792F8CEBAB4B08399C4C81A352541BC5013;UpperCasedChecksum:47C8A34F14C6CF0F76DEF3F6B2D9EFA5A85F34FA4E7E48F09BC29D3004C43344;SizeAsReceived:7329;Count:45
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::a1a8:ed42:7e0f:10dc]) by VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::a1a8:ed42:7e0f:10dc%8]) with mapi id 15.20.3455.030; Fri, 16 Oct 2020
 19:46:55 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] lib/oe/rootfs: introduce IMAGE_LOG_CHECK_EXCLUDES
Date: Fri, 16 Oct 2020 21:46:23 +0200
Message-ID: <VI1PR01MB6462473C3C85401339E4EDEAA8030@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [uOSeU0F/Wd1iifO7M6RgZS2j9ZNjpI+b]
X-ClientProxiedBy: AM5PR0601CA0076.eurprd06.prod.outlook.com
 (2603:10a6:206::41) To VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:154::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20201016194623.2965167-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.90.153) by AM5PR0601CA0076.eurprd06.prod.outlook.com (2603:10a6:206::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Fri, 16 Oct 2020 19:46:53 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e214fa55-d96e-4f05-1503-08d8720c3bbb
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyLDUsNGcq+XggyIPB5dZzupf4gDAMVpQmrtb2ucvq9piNBy/DeTxJZRY8whA1CB6aAc0c1tEB/g6F36cwiWpTCyUFpVcqJSS+iALfva+ti/PbhXJOK5mK9Md/N7ApzoMmN8r7kYN243Bo9+89pwQ6UXLj4rL2JQsvKx6y2UpVw3x68PINz0AgVyFcddEtVb9qSpKp9q8munDKE/b9zQYxpqMTbNEV3E7pr9kcihYrc6H6xroWqR3dLyxjatFn2XIJJYI34Eu/9mmEeOsgIJKjZGmD9aKnd4tHeEf3UH9+HzVm5fFimIeX0Xpwhty+sDyaZlTwu8fHUgYB26fwGLBMDrd4yQXrTssZRbOsXKSuFN6j/MEkV72TNkuF4wiefUDlyqjYieMbQgwKg3Cqpsu02mn5UAzxeCdgpo+fZqpCH8xtOfxW+1OJKDUUeymKLRbz6V5GKLM5hg4wC7Ia7RZmp/1sPfhFmjSxmjgK2Nn6qbH1lOY9is72q5t7otytm3H7daMF+jgEyL1obWu9P8RtkS8zrrOIwbLmbInGe8VkWsgTwsPgVdruc3GaZD0AyG+i/CHz5e1A3pJnO8jXeV/rDRmM3XizpWS4t98Tfb8nCj/bfBSpt85jJ57C7RM4yGe19iXnsC8u8fhysBZKFCQ+sFDD7kyRCK0b92+FvFSMg4cLHY2r0NJxUaFt3ZPurzZUuCKlsh7CHDjqRIPeSDtp3oFYev5Jnok2Uxx+0yqchjVGT9CBERRyIKQ4cJxfKXp+M=
X-MS-TrafficTypeDiagnostic: AM6EUR05HT056:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MFrpg57FxquGLjLgKmg0/IZR1tz/Os0hZTUpaGfQxeHGcp5ewWNMruj0yGRGuLHgnzwrLqdzVGwlOih4veLQ81hWi8Hvxc+w+kIlWvVFy5SEpbbt3QC91seDqKjvkc4jwEvNZ4Ny4W10fpK0/bBo9/D7Z65h4tBicft4mstfm92W02JI+MlunJvT2N3oNQsP9cEwBbdlpzkE0qhfy3GXDg==
X-MS-Exchange-AntiSpam-MessageData: 
	WGUL7CUON3v6uX+omCPEA5FLS96iBpeDc95lYBiYg4rPWa5mKMrr9q8gPejRCO2z07LjEegGIcAjwMTQ5khWRmWQpIqQfuMacnKeJn3Gxivzuc6FHaJcOrb3XeQKeT3G5W1q7LSYhGnu3CfZyRO14g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e214fa55-d96e-4f05-1503-08d8720c3bbb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 19:46:55.2720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM6EUR05FT065.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT056
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

When using rpm as package manager and trying to install a file called
'/usr/share/doc/What to when an Error occurs.txt'
log_check falsely errors out on the build, because used regex match on
'DEBUG:  Removing manifest: /path/usr/share/doc/What
to when an Error occurs.txt'.
To handle such cases introduce IMAGE_LOG_CHECK_EXCLUDES, to allow
user to add custom exclude regex to log_check exclude list

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/lib/oe/rootfs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 3813f68e8b..4e09eae6b9 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -55,6 +55,8 @@ class Rootfs(object, metaclass=3DABCMeta):
         excludes =3D [ 'log_check', r'^\+' ]
         if hasattr(self, 'log_check_expected_regexes'):
             excludes.extend(self.log_check_expected_regexes)
+        # Insert custom log_check excludes
+        excludes +=3D [x for x in (self.d.getVar("IMAGE_LOG_CHECK_EXCLUDES=
") or "").split(" ") if x]
         excludes =3D [re.compile(x) for x in excludes]
         r =3D re.compile(match)
         log_path =3D self.d.expand("${T}/log.do_rootfs")
--=20
2.25.1

