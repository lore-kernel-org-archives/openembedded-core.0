Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.81])
 by mx.groups.io with SMTP id smtpd.web10.7314.1596810747266819823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 07:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=NxPLArv1;
 spf=pass (domain: kpit.com, ip: 40.107.139.81, mailfrom: amitanand.chikorde@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A02blBsy46aVm4oio8bwnzRVPcVk38qxu3+ZUIu1fbGKNjWkmKGkWJC50Kdr7fUwi49qbn2aLO1YS0G7Hp+hDQC22reKDwYthCY8m9gjNZeYW+oRcLjFtOMPulsOSGN4bP7mpf7arhrLQZJEjVUhFmv3dqkkYcJkywYgj7mQHX8V+fEmsxAgZdc7Pg3iTBGaie/hXmPtuZr9+Rz0CJlgidJ0rRiqrmbs8xuVCEi1FOdgt3E3sNUaK5dfplxVUOT8hGTkPgaUd0511L40X7kjn8Vuo1DcUjUk12jrgBKlWgLiIOTy/HZGiTHimKndIC+EKlAvFWeeA/4UOGVfyZ7efw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udQYKZGdYwBOCsr8j2ayPDcs5OV5HGNTIH+H/DN+UBs=;
 b=fyhVq6PUpRtkjvM/v1VUq0d5/9jFsr1z6dbFfEJckcy9DHbOiyRUzZDyq2lLAcMeyQGb+EbNn071CGjCop50+T9lCiiyOtbF+VwQ7vkUfMhBO5P1eguS14FwRA+q+fjaRpSe411P9rUmzXmfoTc26xuvaDHfEnSOxXy4+gpUMVb6gTTFH+ahM/+XD7mU8D548JY+8QAHnc3OjmN+RZjG2twEFjBnfh3/AMYn4Y5cH6ObD/PnNr844Jwdc1ASZD6Yr/9une7LwWA71v1oO6TVnRxY2K3PBjf6z1E8vFnIYKkCMbSAQqIPZneF/c+axcztTPMvfFfdErf1+4naQLi7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udQYKZGdYwBOCsr8j2ayPDcs5OV5HGNTIH+H/DN+UBs=;
 b=NxPLArv1obI5LDt2zoBrc67g7uSVDihdtDef2eLAtXZQG1Poo8tb+yG68sZUdYlJkgXeuxtrBzGbfoWOkhIHWybl2Gsovfo15YrbHngOS2V/A/ovqcvjwl5Z+HHYSWJUMSDcRUou/M+JR8gWM9JGmXMcVv0UYSj2EK8VjX3+xrY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:63::10)
 by MAXPR01MB2285.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:57::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 7 Aug
 2020 14:31:59 +0000
Received: from MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::211f:4e7e:e90d:8928]) by MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::211f:4e7e:e90d:8928%4]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 14:31:59 +0000
From: "Amitanand N Chikorde" <Amitanand.Chikorde@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	amitanand.chikorde@kpit.com
Subject: [meta-oe][sumo][PATCH] systemd: fix codesonar warnings
Date: Fri,  7 Aug 2020 20:01:47 +0530
Message-Id: <1596810707-16909-1-git-send-email-Amitanand.Chikorde@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BMXPR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::11) To MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:63::10)
Return-Path: Amitanand.Chikorde@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4042:261c:cec0:10e1:ffc8:3f09:9f09) by BMXPR01CA0001.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 14:31:57 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4042:261c:cec0:10e1:ffc8:3f09:9f09]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 743b8d0f-d2bb-422c-d91a-08d83adea3fc
X-MS-TrafficTypeDiagnostic: MAXPR01MB2285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MAXPR01MB22852FE6E48B621698CBEE4AFD490@MAXPR01MB2285.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wx5Ejc4ZRv+mPfojYcsjovv2y4AZhRxRgSwy3ZvDkS1ijDmCTLLMADvilLfw3v7ZiWVhi5c3+j/EYXljRouz8KHzZ5ZXHWm+4Wm02DuMhidO4KEkGnox/IxAIF+Q9Ygl1is0LaPExvRmhjveUgj8em/w5JBlwNk1cVA/wmQuw23oihlmi9DM22EjRZFH7QaNn6ST20xZ0W5+8xmSmdvZr6DEi+fFGty+C9rlVQANPH+FXOQDAmH/UdmipQwpETgGdCb7uYFAMI/huNNnzmmFdj0HNG+5O57I+5Nh++MXD/TF9JhFH6fl5+zkWsEUPZvqdM3yTYDHSOsLFUZakvXngcfTmqv5x2+f6qz4XbV4ejvj2nROab9fOY+XqnGfn9hy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(346002)(396003)(39850400004)(376002)(36756003)(8936002)(66946007)(86362001)(66476007)(66556008)(186003)(6666004)(16526019)(52116002)(6506007)(5660300002)(4326008)(83380400001)(478600001)(6512007)(2906002)(316002)(6486002)(8676002)(2616005)(107886003)(66574015)(69590400007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	L/sJGx8ozRFzkENNZMBgz22vV6PTa+VVphGNoN4RI+ucovdXR5iNCtZr13D5BDxuirKgUTO2/W4+DZWbScQ5/iP9s7Onzj5hMGTUuEEO1/dQvyfTbqpUHHqJJx0f1bU/iG0miAoy+8ihuGoydAgRQBKcc3HP7pN+nzVm/i30pa5b5+T/FNA6sUyyObVyV9+CZkxZBJyKtTDdmXVfDmTgQ/7N0XTmNBz4XcHdaczBZz5flQ3tbeU+032KFQv/cmWPlg3EPyNTxWcyrxHqIsNLYODArRIVLLmBnrxMO0lKLsDL8Q+YR8vQf0MlDMdup3fzSwaHwlHcrxrwToLUBEa+f8HqHk9A4afUPx5waHVVxTFRPyKBPYSny+7NeUYnMFcqE5dfE+xR3fvEMNXjXomFtkafmexikt3if2S61+ZzpOZP+bSqnYEetrqj8J/+M9BijhPUt+pvXD2jWSCm4OYccGPFA7Vtzs2C5H+Y1/w4A2o0a1W/hoV6zg8wtsJ+BF5PRXtwXlZMSwLGK+PmnzVEZvv/tvNZkuZh05jbLZiT6IHHWUTxJnUntEJI/FAxewYUrrkAam43wRb1kFfaSHajHb7JwbABbIaQyvDm5CA6umSXjb0re44ihNpFKcIHcvYz97Z4ocS54miy52SLJ2nKH1QUOJBqE88gqS4symNOXRpowCJ0djqig4iE6/tRy1aQl52V7EydqOxqo2vR4FUjMA==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 743b8d0f-d2bb-422c-d91a-08d83adea3fc
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB3408.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 14:31:59.4574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JU55wlp9CAVuw5fohg0AuKSSVjocPk9MyM7dnDEQzvE66EXkpa6MpsQs3CyudOkHasnEwJ+UWvYk0m80a5e70w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB2285
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

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
 .../systemd/systemd_codesonar_warnings_fix.patch   | 105 +++++++++++++++++=
++++
 meta/recipes-core/systemd/systemd_245.6.bb         |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd_codesonar_war=
nings_fix.patch

diff --git a/meta/recipes-core/systemd/systemd/systemd_codesonar_warnings_f=
ix.patch b/meta/recipes-core/systemd/systemd/systemd_codesonar_warnings_fix=
.patch
new file mode 100644
index 0000000..a62f968
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd_codesonar_warnings_fix.patc=
h
@@ -0,0 +1,105 @@
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
diff --git a/meta/recipes-core/systemd/systemd_245.6.bb b/meta/recipes-core=
/systemd/systemd_245.6.bb
index cdafb98..63c58e1 100644
--- a/meta/recipes-core/systemd/systemd_245.6.bb
+++ b/meta/recipes-core/systemd/systemd_245.6.bb
@@ -21,6 +21,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://CVE-2020-13776.patch \
+           file://systemd_codesonar_warnings_fix.patch \
            "

 # patches needed by musl
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
