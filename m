Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.48])
 by mx.groups.io with SMTP id smtpd.web11.4671.1617629421552365789
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 06:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=w9e1WoEH;
 spf=pass (domain: kpit.com, ip: 40.107.138.48, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6y4bSsORS0jiDtnSdOCvLvWQrSf2xB7G7RY6G+xcBSaaWxCVEQ6i/1kR23Bm/7IZsOhY58bLjvi9d+N6k9oFKkMMgNO3omfEh4fyeXpgVnXv0TxuzuZVifGkTjQXbJ74/jjQck3x3fN3VggzZsJU7muWiP2ImI2M3vD1wq4M1QLA3RabtD5Y8pBjJL12ZrfLcEQjbbI6KQw8sDTMfyxLd9MmWOCP6Orl30DhIihsJSdKlg4PGu8cvki9N3sUxBpg25bmioHMI9YxoOUKnX4j7Jsm0KnB5XhzRwAXMGbK8BeU/e6lOqW1QZdXOVcYl7hCaHFQI+HLN/XBAze3RxS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fDrkCDVPBMqLteF/D8gdhzMvPwbFTB8KRTt/ZIQu5U=;
 b=ei/1aTHuH9gbeSxEvXncow3CXSc1Pot6dAv7iSi55mB7hEAeGd93rqWxYu9lv0rm2hG+pNRq4szbFmu/iV/vrQ68a4knQtLi00yl8YC6iVaX8P3gBDwPg29LzzTUuflyh5Gc0ITbPFvukjvWtjD6D3hYR4ZFS9AJCYJrmY/dwojqOovX3g0MZye/YjeNxN+ij4AzGK26BskPTyB9EscmOrpJjgEo0vIn/xnyzxHZTJ0jfFcO/PUbWCiaORVU9l6xEHmQMgMWq64qYrdEncCjw3dM5AgIVacTJHtjJ8tHRUGirrso2Q+yhXrW4SYSXEnnLIZRNC1clSwG6pv5h8E1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fDrkCDVPBMqLteF/D8gdhzMvPwbFTB8KRTt/ZIQu5U=;
 b=w9e1WoEHS3hxF7QX7DzYRMbqX6dAH0vcO9+vItsEb7IVyeaA9tNvqmoG8dHSIwao9yYdermQsHoZ/aLUseRuplEdSnttAziz8Boqli256r8NvUY6WPqTGdrAIvSHImZkmixGtQOe+BvzrVzKTj6ASDNkcAnsBd3VWzM/wgmm1o8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Mon, 5 Apr
 2021 13:30:09 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 13:30:08 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Purushottam.Choudhary@kpit.com,
	Harpritkaur.Bhandari@kpit.com
Subject: [poky][dunfell][PATCH] openssh: Whitelist CVE-2008-3844 and CVE-2020-15778
Date: Mon,  5 Apr 2021 18:59:46 +0530
Message-Id: <20210405132946.22548-1-Sana.Kazi@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:5039:900f:75d5:b37f:f0b:e573]
X-ClientProxiedBy: BM1PR0101CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::16) To BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::17)
Return-Path: Sana.Kazi@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:5039:900f:75d5:b37f:f0b:e573) by BM1PR0101CA0006.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:18::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29 via Frontend Transport; Mon, 5 Apr 2021 13:30:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d273271-4812-4de3-962b-08d8f836edde
X-MS-TrafficTypeDiagnostic: BMXPR01MB3221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB3221FA3CF588EA8D914EB82099779@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CKGEQCAp4qydC77d9FgefxTUIMBmCMR0abQWmKEG5SGnIsLmupX6aZxjCqhzv2jrzVTekLzdrxV5XEjz8I7XJH6GvHzYpaS2PkJEcE8cWHfwxLEev1bIKMchIDSUPw6CH1JH4KSsx8W5sIj9ulyYwx6E+CPDcLt/2AV07Gl61+5U8PfvecyzvwrR/5Kjo80ODlJTWwfPNPqPweQiYr22ayzf7Q2fk8WNsuVXH+PAjwuP6pYIr6Oyh3yJ+Wl5BnVr054prhHXE/Vps/GeaS6XBl9yeC/SdwF6OIrajw7uuLjtXjitNPxTkkg9h+fD0dCebCuNA47ihqhBrcgADF0qk5jWttVYdbltQ0Rghsgl8Cv3C+7PEHEpanSM4HXG2VW57rfnfn4srmkHK7ZD3LL6qAfkScq08VviuLKjTZwDUwoSTmOqsPXakPiAoLtdZ6l0aBO1ZjlPMVvCeP1wblYy3qrPdI0AbVxqXj+8AzZGJut+92JN27wRqO8M9a/Kyw/laJQJKIZAiE5AMghM/51hq/tbDMh/bAcgYgAPSQdv0iJyfMs6pYuf++hnRH0Zla/4PGW/holx1hzQHLF6ALrojcdItu03L0osx+wCElcrrgoFb1Vnbrk1cnX23Xaae/Igmltl15zU+vFuoNQByFV9C0nKdx1/C7uSFqq8ogQarZIhvNwTfvqa6jYgpev7lK9leJTfJgUjrS/04mTQ1fDhryYwNszpnVIPg7mYDtR4Qt77v5uHcjone72JC6MFS2hdtvesLP5msvX9Khhk9hpl0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(69590400012)(86362001)(66574015)(478600001)(66476007)(2616005)(66556008)(2906002)(966005)(83380400001)(36756003)(38100700001)(186003)(6512007)(4326008)(8676002)(316002)(52116002)(6506007)(16526019)(66946007)(6666004)(6486002)(107886003)(1076003)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?cooPd8+l7OabJ4aVk0NZ/6z8oHULWr5OgwQHKaQx5e39EQnMdqiM/Gf3XYQc?=
 =?us-ascii?Q?qMtU1HjSKSS4XfHnNB4+6C3wv2ihemwkT3NoRMXugsT1pgXcBY8EhfXhkXcH?=
 =?us-ascii?Q?3Czqhb5VC3iiVjQ0fa/+Y2AVGQFyZ+bD5fgyEmh2dcHugLD8deK64moV7S/z?=
 =?us-ascii?Q?M8qc5mfES9Mft1hxggYrEDOijSnIhBF/vnEtZItCjOky/5XWwq3yKb+HyhRe?=
 =?us-ascii?Q?+79h7j36vXdgG1EV5+3ornauoPSRI3VLmWcYkwLExb2B/T/cNV7Q0kw/UABX?=
 =?us-ascii?Q?xI3WNdKsPwpp/C2sM0fJTvujhBJ+H/Wx44b1e5FjY/cmpWb6J9zfYGckw6CT?=
 =?us-ascii?Q?JerAWKgrRV0pJQzfdxZ1/43kSDI8k6bm2O2OPAfgccuvv9L4yIcUwOBExi8J?=
 =?us-ascii?Q?RI4r1/+hRQPWvRRiZOkAMTK3BwOn0QkSmVx9xx99JmxJZ48l8vEY6mJcJABj?=
 =?us-ascii?Q?VLgvnSrhlvuK2NQuV1HiulkptvrpjbZSkxm0rttboby6/jQRrVqeBAZU+Exc?=
 =?us-ascii?Q?epfHgcktF7PRZUwN/6JHAuULcYUCGOIbA0HxOYoNT3QswifnHXFtoLn6T+Be?=
 =?us-ascii?Q?AaTiGfxVNuawBcD/BoIbgUdk9/rhegOsas5V6hu1h7j1hRtJFZw2DmX6B9S2?=
 =?us-ascii?Q?dffI6boEob5tc6qVoe6xEQEv+DF7577R73TyIBEWS3g9G42WrfxPJSaLzJVC?=
 =?us-ascii?Q?BtqqJcSUJKb/xQQVBaFtSPH/bm4cUigSx+XegHEgWsk+NbGCFtNrXzd5yxqD?=
 =?us-ascii?Q?aUUkIIXaG9F/EGR7rG/SbsjdvKwIVLqO1x0T9wgL8EN/letHfZ6nDUdYHM/9?=
 =?us-ascii?Q?LsW61hv0RiUdkKwAmkab91li7cq6Z7UHzNiHdK26V8cddqatM7cWf4Yx1Ug9?=
 =?us-ascii?Q?hbkFA1DzJbiJGXaXWV8HYZ67XjbwqyfSqzu0MNRd4kk/KilBrvJ4YMgn4GU0?=
 =?us-ascii?Q?zCSVjr68JPGLmjTJ5QbVJ2G5FLlootIQ+yPorfAklDfzGxZ19dpTrzIt4IkW?=
 =?us-ascii?Q?HnHG5iQnmgBHPhM7KQdMComOpEgsG7VcJHOzbiWtdSMklIJONrz4wWPsmcAo?=
 =?us-ascii?Q?cwmPLF7qtvUz9DiuubsKzJQCzshjFSy84kjdvHWok9asxrEgb1/e7UIqnxHG?=
 =?us-ascii?Q?l+ryIx9YzGv/orU8uZV/jWIpX4qoC0V8o/ppuLteJ4QZnnMpMyfwFoEZ4X0z?=
 =?us-ascii?Q?+dHGdDzYuURXtIulBlYHvEEXdlDu5uDOr9WDbdOalkh30hpOOvsTR2/N+in8?=
 =?us-ascii?Q?a9tLsWdHUVYRkZGRSgryBoPvziqJxfd0MZy5f5SbCW/8+iO9kIZHGNWOup/R?=
 =?us-ascii?Q?Yo3U5/o8acGQMXt1mEz3OhsSNBwtWiq6HK27IPzRYrF2pWyUYZmJHxlIxsTe?=
 =?us-ascii?Q?EYAw0FO+ecB1rM/Gzab/Agt/nmf0?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d273271-4812-4de3-962b-08d8f836edde
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2021 13:30:07.8973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hwa/+B+77JKFkmIYmqdqjyFs66eb7df1t9xDIyLrJ/LaGtv6AYIAruGBGTFW1SZd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB3221
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Whitelisted below CVEs reported for openssh:

CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux
and certain packages may have been compromised and has been fixed
by Red Hat. This CVE is not applicable as our source is OpenBSD.
Hence, this CVE  is not reported for other distros and
can be whitelisted.
Links:
https://securitytracker.com/id?1020730
https://www.securityfocus.com/bid/30794

For CVE-2020-15778 OpenSSH through 8.3p1 is affected.
Hence, it can be whitelisted for 8.2p1
https://nvd.nist.gov/vuln/detail/CVE-2020-15778

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_8.2p1.bb
index fe94f30503..f8037db986 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -32,6 +32,20 @@ SRC_URI[sha256sum] =3D "43925151e6cf6cee1450190c0e9af4dc=
36b41c12737619edff8bcebdff
 # and when running in a Kerberos environment. As such it is not relevant t=
o OpenEmbedded
 CVE_CHECK_WHITELIST +=3D "CVE-2014-9278"

+# CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux
+# and certain packages may have been compromised and has been fixed
+# by Red Hat. This CVE is not applicable as our source is OpenBSD.
+# Hence, this CVE  is not reported for other distros
+# and can be marked whitelisted.
+# https://securitytracker.com/id?1020730
+# https://www.securityfocus.com/bid/30794
+CVE_CHECK_WHITELIST +=3D "CVE-2008-3844"
+
+# For CVE-2020-15778 OpenSSH through 8.3p1 is affected.
+# Hence, it can be whitelisted for 8.2p1
+# https://nvd.nist.gov/vuln/detail/CVE-2020-15778
+CVE_CHECK_WHITELIST +=3D "CVE-2020-15778"
+
 PAM_SRC_URI =3D "file://sshd"

 inherit manpages useradd update-rc.d update-alternatives systemd
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
