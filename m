Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.87])
 by mx.groups.io with SMTP id smtpd.web12.2949.1596706673679321378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 02:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=d9sCWAz0;
 spf=pass (domain: kpit.com, ip: 40.107.138.87, mailfrom: amitanand.chikorde@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdQCzurZCMUqEgm2M51utLZG560daBY6gZIMY+EgIUoOLfL3P+wCBLpaHS3nsKk6PJxOp+sGryRm+v7FkRKO3TOFIXl1WJ45DUmttdvR/1MTCL+1zkg68yCwfiVAez1gwBS4LqyLWvGpIbE1CrfIBjqgs5CRAJl+sqX2CjGXMF/f5VtdVSvrxeE6yxDOOi1qlCHDyFlV5AzNVu3vi6AdaHOkUxApAON+bzmvXzRkmWiIvaUtX4h+qOiPYMauFx8RIp+R2DgK/f6Gd55hOS/VpEedNTgBBwzEVBiyI9G10WRI0GsKQqcOeW/gK7HwRlR8IPST2fd4jkFaMGggYLXVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpAGX4OFO4bTKJ0gKr7uWkS7S3S7D3dHdIbndZNyXUc=;
 b=EWCbRqriV6Q+PMOE30xSkAYS6T/NCyJFhKnSQEAyNaKHNURiyew6m9GbDutY+AMQ/19bzXFBgPpZXeD3MQAzwBj9n80nyd/GX/A09MJcwIeojTyJxMUkSHq7pN62ovleZS9aHDc/uSIQ+DgYVIlJgFKN+GCPT9jfkbwOIYorzKlhv9cXa3azEUG21iOTR1So0PcprHWX2+q0XWeF1pHIdhSj+JAPcrmFlEYWLXhcah44zvPIP66S4taWkTo/Aqzv5YD4m0nj7fO6BOCcK8YsCrfW4FJrb6ralX+82UuYmyfMGSCq9TKLorLajK8iTNe/yhHZEL7e6/gg5q9kxBNldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpAGX4OFO4bTKJ0gKr7uWkS7S3S7D3dHdIbndZNyXUc=;
 b=d9sCWAz0w6JkvvjJ1GHV2IS8i4BdEQkORlMggIm6e0SBKIoE40LyjCod0FDu4Pl9v2oX58SDeQmLjH/RbU1PpktT6wufuntE7yPsH87fbMkAciBH/qAQO+I047KS20KbtG/Rov5qZaOL1loRTJI3l0XRSodK0d+MbxEypPZLO7s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:57::22)
 by BMXPR01MB2326.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:39::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Thu, 6 Aug
 2020 09:37:39 +0000
Received: from BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::94b9:9645:e369:6d94]) by BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::94b9:9645:e369:6d94%6]) with mapi id 15.20.3239.022; Thu, 6 Aug 2020
 09:37:39 +0000
From: "Amitanand N Chikorde" <Amitanand.Chikorde@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: anuj.chougule@kpit.com,
	nisha.parrakat@kpit.com,
	"Amitanand.Chikorde" <amitanand.chikorde@kpit.com>
Subject: [meta-oe][sumo][PATCH] systemd: fix codesonar warnings
Date: Thu,  6 Aug 2020 15:07:21 +0530
Message-Id: <1596706641-5853-1-git-send-email-Amitanand.Chikorde@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BM1PR0101CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::21) To BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:57::22)
Return-Path: Amitanand.Chikorde@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2405:204:9595:d581:fdc7:bc14:ffdf:b60b) by BM1PR0101CA0011.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:18::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3261.18 via Frontend Transport; Thu, 6 Aug 2020 09:37:37 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2405:204:9595:d581:fdc7:bc14:ffdf:b60b]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f4339402-a05c-48d8-56bb-08d839ec5b5c
X-MS-TrafficTypeDiagnostic: BMXPR01MB2326:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB232679E6BF6DD805E9206A5BFD480@BMXPR01MB2326.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U7rXphai6sN6tfIIYhxIr+Tb6yS4w/HEj/hSZZH3yJNcjMa3WzNucTxYjrdrmeWW+hJpc+sGJ6JYZVPTdO5a5Q3mwnKSUUlaA3K+dpp1CubnSALXSjWoKjjcjmx4b46D6eWiNn+OcI0hLKjTnvOmRVznKDhxpUSUnv7ApPxwnmQVJVazV5kGDmSkMqR2ioGAShc617BhYl05/H0wcV5E3uHVCQ32n2+sITRixFHCAfNIgeWZNcF66ONLLN4oIItCwlZvmg9uTmsbxCtPPSbznOTnu3KgouR4EEe7Je8G8bDNrTCM247EjQU04/GuQ8ODUXOllxqYi2m1nLpg22zptxKeS2SjthiqbtwpPG9dkmzuBH6KmPYAXpCuOxDdaib0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(8936002)(316002)(2616005)(5660300002)(2906002)(36756003)(6666004)(66946007)(8676002)(66574015)(16526019)(186003)(6506007)(6512007)(4326008)(478600001)(69590400007)(66556008)(66476007)(107886003)(52116002)(86362001)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fklTD9NkiED8W3LWTWuQHGL/KBcinlsMTNMzKNYWeUhTPMQlB8sGjqrTJYJXJoQF+/y6+Z++94tymwaaxcCuTEml8oEkVQhdySqufzKQoK8isCAXqTWoX950IeG5sXz0KFd2/ty+K8ex8S9EWWN5rAm5tpqGiWJSjOwKn9lH00b95D/DoEk5zgtME+GSzZzTlB0RBmrz0BgkJV3AE/Ic8xhJ1PM340YYg9TMqKl2oDp8tt7EW/a6oLDQ0qpnYbIIVlu5ehKj4KYvEN06B7b8btmhnts8zmibsA6oGnoMD1qiseB1oOCTJVXHaZW3hPrYvHvqpf+8AccowXspLuEaOoEtVkb1x1Z9Gix0m8TNw3P6qLkcyi/9ww3gBKg7lRvYH5XVzyQusohS6XRxDHVFmpCCqbTt2o0J15JeKt4d/Zm0gP1vHiGvGr7wYdo8p4gETRCJZeWizW+819ttzU7u5MMh7N17khxhCkR0CZfj6wffjRxXdqBTKis7jrrQ0mzWv/NR+tzHVpTxR4fTzsv3d9Cc8Ajc8rYCSCnOI2CfUPQUiULGOYYABOupI25YgRr/ISl041vTDfzPEywLxoLaINYbtfkyPC3ARMoTzo6pT/eetmuV5HhB4MopJDPlTIpMVJPd2QnHqsFG2BitvUURt/7ck4Wq/sqC2VKqkPRVyW7X6hlg+Ko4t0YnIvgtF8SLpmal6RfHGWxWckcjtk6rJw==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4339402-a05c-48d8-56bb-08d839ec5b5c
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 09:37:38.7034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqzxz7QbPDf+qLMGyCSa/iqXWx6lVmSM2y55kkhjQSKYSn9k/14WOeq2pHGIbaOZ8Tkp4ohZxwxFupkrXYJByg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2326
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: "Amitanand.Chikorde" <amitanand.chikorde@kpit.com>

Fixed below systemd codesonar warnings.
1. isprint() and isspace() is invoked here with an argument of signed
type char, but only has defined behavior for int arguments that are
either representable as unsigned char or equal to the value
of macro EOF(-1).

As per codesonar report, in a number of libc implementations, isprint()
and isspace() functions implemented using lookup tables (arrays):
passing in a negative value can result in a read underrun.

To avoid this unexpected behaviour, typecasted char type argument to
unsigned char type.

2. "seqnum" defined, not initialized & used in device-private.c
Intialized "seqnum" at definition.

Signed-off-by: Amitanand <Amitanand.Chikorde@kpit.com>
---
 files/systemd_codesonar_warnings_fix.patch | 106 +++++++++++++++++++++++++=
++++
 1 file changed, 106 insertions(+)
 create mode 100644 files/systemd_codesonar_warnings_fix.patch

diff --git a/files/systemd_codesonar_warnings_fix.patch b/files/systemd_cod=
esonar_warnings_fix.patch
new file mode 100644
index 0000000..ce79eb2
--- /dev/null
+++ b/files/systemd_codesonar_warnings_fix.patch
@@ -0,0 +1,106 @@
+systemd: fix codesonar warnings
+
+Fixed below systemd codesonar warnings.
+1. isprint() and isspace() is invoked here with an argument of signed
+type char, but only has defined behavior for int arguments that are
+either representable as unsigned char or equal to the value
+of macro EOF(-1).
+
+As per codesonar report, in a number of libc implementations, isprint()
+and isspace() functions implemented using lookup tables (arrays):
+passing in a negative value can result in a read underrun.
+
+To avoid this unexpected behaviour, typecasted char type argument to
+unsigned char type.
+
+2. "seqnum" defined, not initialized & used in device-private.c
+Intialized "seqnum" at definition.
+
+Upstream-Status: Pending
+
+Signed-off-by: Amitanand N. Chikorde <Amitanand.Chikorde@kpit.com>
+
+--- origcode/src/libsystemd/sd-device/device-private.c 2020-07-09 18:05:13=
.744127907 +0530
++++ modifcode/src/libsystemd/sd-device/device-private.c        2020-07-09 =
18:01:56.494621945 +0530
+@@ -560,7 +560,7 @@
+         char **key;
+         const char *major =3D NULL, *minor =3D NULL;
+         DeviceAction action =3D _DEVICE_ACTION_INVALID;
+-        uint64_t seqnum;
++        uint64_t seqnum =3D 0;
+         int r;
+
+         assert(ret);
+--- origcode/src/libudev/libudev-util.c        2020-07-09 18:05:13.6560495=
15 +0530
++++ modifcode/src/libudev/libudev-util.c       2020-07-09 18:02:32.5633864=
14 +0530
+@@ -171,7 +171,7 @@
+
+         /* strip trailing whitespace */
+         len =3D strnlen(str, len);
+-        while (len && isspace(str[len-1]))
++        while (len && isspace((unsigned char) str[len-1]))
+                 len--;
+
+         /* strip leading whitespace */
+@@ -182,8 +182,8 @@
+         j =3D 0;
+         while (i < len) {
+                 /* substitute multiple whitespace with a single '_' */
+-                if (isspace(str[i])) {
+-                        while (isspace(str[i]))
++                if (isspace((unsigned char) str[i])) {
++                        while (isspace((unsigned char) str[i]))
+                                 i++;
+                         to[j++] =3D '_';
+                 }
+--- origcode/src/udev/udevadm-hwdb.c   2020-07-09 18:05:13.612010318 +0530
++++ modifcode/src/udev/udevadm-hwdb.c  2020-07-09 18:03:26.243530163 +0530
+@@ -487,7 +487,7 @@
+
+                 /* strip trailing whitespace */
+                 len =3D strlen(line);
+-                while (len > 0 && isspace(line[len-1]))
++                while (len > 0 && isspace((unsigned char) line[len-1]))
+                         len--;
+                 line[len] =3D '\0';
+
+--- origcode/src/udev/udevadm-info.c   2020-07-09 18:05:13.616013882 +0530
++++ modifcode/src/udev/udevadm-info.c  2020-07-09 18:03:41.621625782 +0530
+@@ -73,7 +73,7 @@
+
+                 /* skip nonprintable attributes */
+                 len =3D strlen(value);
+-                while (len > 0 && isprint(value[len-1]))
++                while (len > 0 && isprint((unsigned char) value[len-1]))
+                         len--;
+                 if (len > 0)
+                         continue;
+--- origcode/src/udev/udev-rules.c     2020-07-09 18:05:13.624021008 +0530
++++ modifcode/src/udev/udev-rules.c    2020-07-09 18:03:03.227995790 +0530
+@@ -726,7 +726,7 @@
+                 return -1;
+
+         /* skip whitespace */
+-        while (isspace(linepos[0]) || linepos[0] =3D=3D ',')
++        while (isspace((unsigned char) linepos[0]) || linepos[0] =3D=3D '=
,')
+                 linepos++;
+
+         /* get the key */
+@@ -738,7 +738,7 @@
+                 linepos++;
+                 if (linepos[0] =3D=3D '\0')
+                         return -1;
+-                if (isspace(linepos[0]))
++                if (isspace((unsigned char) linepos[0]))
+                         break;
+                 if (linepos[0] =3D=3D '=3D')
+                         break;
+@@ -751,7 +751,7 @@
+         temp =3D linepos;
+
+         /* skip whitespace after key */
+-        while (isspace(linepos[0]))
++        while (isspace((unsigned char) linepos[0]))
+                 linepos++;
+         if (linepos[0] =3D=3D '\0')
+                 return -1;
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
