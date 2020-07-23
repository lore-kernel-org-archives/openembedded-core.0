Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com [67.219.250.3])
 by mx.groups.io with SMTP id smtpd.web12.8187.1595494250131543261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 01:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@opengear.com header.s=selector1 header.b=gRIG8Poc;
 spf=pass (domain: digi.com, ip: 67.219.250.3, mailfrom: dan.callaghan@digi.com)
Return-Path: <Dan.Callaghan@digi.com>
Received: from [100.112.130.41] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.us-west-2.aws.symcld.net id 45/E5-20041-76F491F5; Thu, 23 Jul 2020 08:50:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEJsWRWlGSWpSXmKPExsWSoW++TjfdXzL
  eYMpcBYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaN/sWvBQvaKvZ9vMjYwrmPrYuTiYBRYyixx
  dHkHK4RzjEXi5cxTUM4mRolzP5cwgjgsAjtYJNbsvsYIkVnOKHHn8yegMk4OIYEFTBLz29lBE
  kIC9xklWt5MYQNJsAkYSKybOxXI5uAQEdCRePPRCyTMLKAn0XvwPztIWFjAWeLAWV8Qk0VAVe
  LEFV2QCl4BR4n98y4wgdgSAvIS17fvYgUp4RRwkji92hNiqaPE+v6tjBAD5SWat85mhrAlJA6
  +eMEMcoyEwBRGia7J25ggGtQlVq9+ygYxX1Di5MwnLBDzdST+Lmpkhbh+IZPE9rvzwZYJCdRL
  NPwMRneDhICSxM230hBhWYmjZ+dAjfGVmP1zNSuErSXR9P4lO0S5isTtJzYQ4RyJttWboUpUJ
  Z4+usIygVF/FpIPZiH5YBaSQxcwMq9itEgqykzPKMlNzMzRNTQw0DU0NNI1NDbQNTI10kus0k
  3UKy3WLU8tLtEFcsuL9Yorc5NzUvTyUks2MQKTR0pB058djH9ffdA7xCjJwaQkynvRXDJeiC8
  pP6UyI7E4I76oNCe1+BCjDAeHkgSvoB9QTrAoNT21Ii0zB5jIYNISHDxKIrysIGne4oLE3OLM
  dIjUKUZdjgkv5y5iFmLJy89LlRLn/eILVCQAUpRRmgc3ApZULzHKSgnzMjIwMAjxFKQW5WaWo
  Mq/YhTnYFQS5r0EsoonM68EbtMroCOYgI5QvisKckRJIkJKqoEp0i0nWXu1mDhX5huF36wdjB
  xXjrXs/LdqTkw4H2fOe5Hy668kY1k/n2HkWsvU0TFrRvUNtS2xM97ddPBw+zRj/pa9BZM4Lku
  z88hPkVB7dm3V+SO8nbdfqbjPVZq2e3+vQclW80oRgVubVE7OXJXHlPHoae7cSvMTp6KVenp2
  M5/3cXq1+vfureZ3/jEF8rd+2f7wxMJ+LotZEqd1FJhT75xZw5UlmChfHxIVdX0tt+8THqZbk
  xk9hZU6t8fZ+m16cvPSx5RfR63Ynj7R9N07RXregbpDIuuaVN+eS/m+f0vnTzH3o87tviY2B8
  51LeY+OJlXqvPDnZ5mH0u7EvvJAoaZ53dskub6fiK4rz1UiaU4I9FQi7moOBEAH7P6nSUEAAA
  =
X-Env-Sender: Dan.Callaghan@digi.com
X-Msg-Ref: server-19.tower-325.messagelabs.com!1595494245!210657!1
X-Originating-IP: [104.47.55.174]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9074 invoked from network); 23 Jul 2020 08:50:47 -0000
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) (104.47.55.174)
  by server-19.tower-325.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2020 08:50:47 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqfS/1n1ageb0gRbv3wjrd2YlfhRZ4FEO99jqQYzjYcm2dSLvRD5PzalvSx5Vh4jzA9BkdG8VBv68ULe3NU7GEohw/2uUCEyvvEtzwO1+GhJr6g5abfwIn6m6eiZ+35feYJTEDuo4oMWFcU9DRya5YhmO3BLTzLb9uydB/e0mn1oGMncNQyrrPbjVhBDl6+fPYuQjX7Uvzz5Clyx4CGy+yjXRXA5+wktN9Xo5SFNfc3JpUx+x4PXjZzrTPdrjGX5JiYhxOgA+jWVlvR1fn+EAQijH82v56kUc03G3H30tnT42kQr+LTjftxgILvR3h0f0DtS6INCKHyoelqn1l/EmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HdxK2pNbnb781SpjZ9pvKyAF8vcsUmgHQpKbEZqVg4=;
 b=i4/5oSD1jQnfSoKiXBNOpwJPK5LG9VHkpYG9PRmZJ3ckLb+FSShPGiEDYiM+n0Nr8pyk+d2OowwgRmirY0IOGyo2EN62hX8XAdBW4Cpp5oQmx2NPMj5RkwvFve9Tc5iyEOa9kabGcMEJ9HK2/JU0L1BcDb8OMK/5aCe8HD/gblITgkNAfCuvaxg/85a3HJkv6Zsfwt5EWJkiN/YezrGN04X9i1YLmeYUuHBcThKJM0xHn6WYO2nBuox4+qo8k4/n1mgkD8UsBllkq1pWWk050QEsU8E+111NjNCET3YXivUVnnYffIEsmK8QPfIBvr/hACxCOLt0Es2fWMk8QEXWbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=opengear.com;
 dkim=pass header.d=opengear.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HdxK2pNbnb781SpjZ9pvKyAF8vcsUmgHQpKbEZqVg4=;
 b=gRIG8PocTV83ord5wf3m5MASZgwXCqawghYPOJactNZiUC2h+1YHaZIRSB+tFB2xfFQC+86vlnSRwe+XvgSN1epJ+2BlffTK/eDRQTAhwG5bZA+FHBoBNOlwmhGD4ce/7EL5xK1JCVpvvV26bQ/Qjbbl8YuerSXoPD6JdZtpAcZ3DrEnOaf1+ZGzfFwVKybjSP1DJ19GsNXfCEoay+JYXpl6euzzDfz5GcpnXGIOSerwHzxEBy8BVBCUyCcgU6OVCLY3Tvim+V8tBzzG4aVLZrLT5+9ojXUH+UNI+RKFRhoSpbrWGKNSjCJ5aTkxxf56gTFXI+3Klp9lXpHlGKH9+A==
Received: from CY4PR10MB1944.namprd10.prod.outlook.com (2603:10b6:903:124::10)
 by CY4PR10MB1399.namprd10.prod.outlook.com (2603:10b6:903:29::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 08:50:44 +0000
Received: from CY4PR10MB1944.namprd10.prod.outlook.com
 ([fe80::c052:ad1d:f718:ee45]) by CY4PR10MB1944.namprd10.prod.outlook.com
 ([fe80::c052:ad1d:f718:ee45%7]) with mapi id 15.20.3216.021; Thu, 23 Jul 2020
 08:50:44 +0000
From: "Dan Callaghan" <dan.callaghan@opengear.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan Callaghan <dan.callaghan@opengear.com>
Subject: [PATCH v2] stress-ng: create a symlink for /usr/bin/stress
Date: Thu, 23 Jul 2020 18:50:31 +1000
Message-Id: <20200723085031.3042314-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200723043127.2821063-1-dan.callaghan@opengear.com>
References: <20200723043127.2821063-1-dan.callaghan@opengear.com>
X-ClientProxiedBy: SY4P282CA0001.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:a0::11) To CY4PR10MB1944.namprd10.prod.outlook.com
 (2603:10b6:903:124::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from galangal.danc.bne.opengear.com (59.167.222.237) by SY4P282CA0001.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:a0::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend Transport; Thu, 23 Jul 2020 08:50:43 +0000
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)	id 0EFC24219D48; Thu, 23 Jul 2020 18:50:34 +1000 (AEST)
X-Mailer: git-send-email 2.25.4
X-Originating-IP: [59.167.222.237]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90e88527-f28c-48a8-53ed-08d82ee57c38
X-MS-TrafficTypeDiagnostic: CY4PR10MB1399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR10MB1399BC289A623A6DBFB67AFB90760@CY4PR10MB1399.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WXjMJJXOPkWshwS+za58MFSwetERAxYyU+fHM0oB/sLqQlXrLrdBdW7WfAhLZDbluaRGbXlBQIxQJQox2kMQkC/iY8OfKRg9D4qVSJ9hfvrBb70vboNdzW908H7Zvmjd2xKlDIslRyb35E0Gxz8kPema4QLNFijoOgjBC1LF6rGo00E2XSKnYxaPydraSMYflhYA7QIAQIQQmxOJf7yglYKs7qSPS/uy24g4ZMYGtNh+hhIB20RNNVltEcQIYs0HUhtCPoOo/OZi6Y0Re0mJ28BEw7RXeyRE04kZ13rrhmi351po6eysuLqXfBbr1+R2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR10MB1944.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(396003)(346002)(136003)(366004)(376002)(26005)(1076003)(478600001)(316002)(4326008)(42882007)(186003)(6916009)(83170400001)(2616005)(6666004)(44832011)(36756003)(4744005)(8936002)(66946007)(2906002)(6266002)(42186006)(426003)(66556008)(66476007)(5660300002)(52116002)(107886003)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	ZfUR/VvCxi6CLuoh8qWrIWR9b+Z1xONQEZFN+UhpbKU6XXfbveQ/VI8N83CGHywM0GlT4S4gDRLOeC+VYcTdc4SChMo6XokKpP9hMjcsJW4SUfKb4HWRz9ZzP1TSY5CaxIal/dQp5WwVKEFzdYPVuwI+8YiWai9755CBibM7F7bbx49cb4PPYZUG34B0rwlQ2liJG3MXCjeuyTtFHMkemSOCA0uZuCETo7zFz8G0N3QNNvf1HUjHq20hjiTI91IqpDwemf1+rqGuWWFw1RBdkhPNromGj25lBXdYhQ2H//FCEeOWBK6WedmuyndeA/JqRANP6TlEP6EfpjRRbIOgVLI0jSbjbeeEuFaJoBGCPGFP334UOGepHjDyjHgSo5yzdobxO+gqy0bdnvMeRzXuUmPb10CyVw0/361sIjB4NpoP/4f3LfmENR7AK46jnhcGeG6FGAPkvty8D5V5e+XHjXdq1b20SuT8DMZrs8JOYuo=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e88527-f28c-48a8-53ed-08d82ee57c38
X-MS-Exchange-CrossTenant-AuthSource: CY4PR10MB1944.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 08:50:44.0609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1sMaxazhQPyhhA3Vb6DkCCXYg2s3UCWF2uoWKvJcgjIB2brpvNZn6HbgDM+FzJXJUZdzZqEIvx9V8uDEDAQfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1399
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In commit 72641004, stress-ng was made to provide the stress package,
because it's backwards compatible with the old stress command. But it
doesn't actually provide /usr/bin/stress which is what other recipes
depending on stress will expect.

Symlink /usr/bin/stress to stress-ng so that it actually becomes
a drop-in replacement for stress.

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
index 8ea0476db5..28bf9884cf 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.15.bb
@@ -22,5 +22,6 @@ inherit bash-completion
 
 do_install() {
     oe_runmake DESTDIR=${D} install
+    ln -s stress-ng ${D}${bindir}/stress
 }
 
-- 
2.25.4

