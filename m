Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.49])
 by mx.groups.io with SMTP id smtpd.web09.8469.1621942498627668173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 04:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=srNdjHoY;
 spf=pass (domain: kpit.com, ip: 40.107.139.49, mailfrom: nisha.parrakat@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZpjVqqMxQ98YyeFYXcR/qP458KjeiUKpqhoAXH46KMWmHp2E90C1d4cPnp4pvNSzVzC2TUxt+eLqaU/cDGLrY6ndLuWJCZEiOVnU3oDc9VDF2i5SMjOuVTJzS/9MrmEa4VazU6Ab8P8hmlfbAVTwm4Ej96jLhfnZaBQM3jCnfv0cyEYR6IKzhPxhCnq6VfVZ+c7h1yK1L/AZwbWz0MM8CEHev9+OaYK0yOvYQcka46t7NXHWyA5actdWhXL+ohOnEkUT3bQYT3U1TAWXWNPhvH51PCXToLKG+3z7UwfNVe1cY2QZzi6LK/tyfhANBscIc9DfppoDuZ7UUOL/yoVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilwMf+rIuLcsxZQQnd1UZDMFu+tbO3eT6CHXzOIs70E=;
 b=cB9u2g99PCzOeGRYp9ui+CVVACKHAqCqMTFwxWdB12s/PtkGRdTflDQfyR70qO4Lu0dl5MWUgtEnscJ6MTrZLN814QizwMpvludd3kvS0D12gmah/jjAcCT40WvhQXH56a6aZ8qIPNh3HoUAoFZ5Zc0lLvl0uYvY+pLPZeQZizttHxGeNbdLvlBEPOKNqnRv6MCxqhM6jBtjbBXtaSNYDx0FbVZTl2GoV4tDPiS7fHKMejQRWBKaIV4raENk6Qi/PqwtkwqpAE9g73j+GdF5YEXpDXAzN7tuI4uPHlMm6AInYN6QaAFi4hLk+eRnt9lymfv3FCh4kstSjxjypd4/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilwMf+rIuLcsxZQQnd1UZDMFu+tbO3eT6CHXzOIs70E=;
 b=srNdjHoYxDmsu00neoSt28iadxw6kdGTu8ukPqvVUbOT6a/MrK/8CJIkn2WpRWK7KYbonqxmqnqTxvVv+FxL0+6CsDT4yDGLK67rgWwQqL7OEWjNuw6L+cJgmW00nXKI6grSdn2GmegP2Y9IWb8uSvflAEJpfmTIz3efFOxMtWI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:36::6)
 by PN0PR01MB5139.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:46::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Tue, 25 May
 2021 11:34:48 +0000
Received: from PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8d5b:7904:5e3b:7167]) by PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8d5b:7904:5e3b:7167%3]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 11:34:47 +0000
From: "Nisha Parrakat" <Nisha.Parrakat@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com
Subject: [poky][master][PATCH] squashfs-tools: package squashfs-fs.h
Date: Tue, 25 May 2021 11:34:11 +0000
Message-Id: <20210525113411.29822-1-Nisha.Parrakat@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2003:c0:f3b:b062:3a22:e2ff:fe1a:a816]
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:36::6)
Return-Path: Nisha.Parrakat@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bsys_traas.speedport.ip (2003:c0:f3b:b062:3a22:e2ff:fe1a:a816) by FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend Transport; Tue, 25 May 2021 11:34:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faed2db9-12d4-42e5-5e3a-08d91f711972
X-MS-TrafficTypeDiagnostic: PN0PR01MB5139:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN0PR01MB5139AFEA371E835231B79E85EE259@PN0PR01MB5139.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/dMhJAhIWZ4M8iNFgwbOSpB0WpF19Gn1y11Uzn671nWL3/uNHvL14+T9xbrUkkIBgxsiOxdL2XSTL5BgpaLIYh4+whhc5I/GIjrBPKdgFEmHBpqvejyGcEaf+sn1llpTp9wweIozSSywjoCaHmq4wHVggB1geF6uoTuYuKNx4BuLRrf9ScBYytTj9HkAr8Sjnp5g8h9K5IkIn9vb0CbVLu8qkxbaCAACKAg+eksk9ELidzfNTxwWu+mWfWmm+pmVDkDg3xIHlBvXwIxLvmQsdcP1TiyBABTlJeyO0K//1uvVmX0WeKTLZfGaNAYKCYDvsDgsyvOut6QHvaOn6E0KEqxGsxb0Nbt83uXaYOr0ZkZvZ5rwsnGsj/uJhys8MdWztniKzgta7GzVGpryfZd36PsAf3ATRgA4gx3MVSUv1Fo22QtDtG59X+lTE8I+692olyOvHnPIF7UJoBMmLVFibiJi6JyAkanODdOVEsAAwUT++Xbv24qOX4QMsCXQHXhDhu2ik2udePGQmcRbmggUTa2NHl94j87Yf8Dabo2tTOt3BJVOf6OBMB+YhpVlK7GpGvyZmqtUZw+LhhjNsoNExtLP+CcJKj50UDQCkrDQjVI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39850400004)(366004)(376002)(36756003)(6506007)(2906002)(186003)(66574015)(38100700002)(16526019)(66556008)(86362001)(6486002)(66946007)(478600001)(2616005)(8936002)(83380400001)(316002)(66476007)(52116002)(6666004)(6512007)(4326008)(5660300002)(8676002)(107886003)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ThBzkKO3f/vRqXMym/FMzLkOWuzrBbxWZr1tu2YrEE/c7kS8gD2l+iOwLe7u?=
 =?us-ascii?Q?dnvBXXSWqMVjBF25lks1EiOJFii1qK3AcAc5YcuNcxrIhqQ4nvnUNfIT3oam?=
 =?us-ascii?Q?kjDlqC2msyTYjExrJLiG/GN7NMlIjzv+F6wp+VwGnBiHDP/XOUgAgo5NZhPI?=
 =?us-ascii?Q?lkIM++U/3iX0yKEXzwqhnTU982fcUcZOMbPM0ZaYLk1VWhuGJUkNglgR5Gt2?=
 =?us-ascii?Q?75eNVVSPfdPlxAlOUPYjkswcrx5wQedkH5Tmxm9ym937VDNNkkbBUWG+1cGa?=
 =?us-ascii?Q?aj24zIwltb/fJmVw3SDavh3DQns04pw/8IM6u/j8eVaVE8nYtXiJ8QoO67a2?=
 =?us-ascii?Q?AhyhROuV/+UbK+e33qR9BjG7B3mESV+fnS+bjpABLX/ZwLUhzbITFEyza+/o?=
 =?us-ascii?Q?xAhX40YesOfgw1mEmphgYJmW4F3n8+2fYO69ST0C+pk19UDly7xDwJzkpYMq?=
 =?us-ascii?Q?MgDQt1WaQUcQjSLtUwwx+y5tegac/sM19ZrpOUJK5K+XlYxVdFtK/yCMbWcr?=
 =?us-ascii?Q?hr5nwtXjWI3rEEjDC7OIKKxXgyc7UXgmVJwb3WNeBzCQ9aO6uQeW/ec86Nmz?=
 =?us-ascii?Q?mcBZczosrqlALoJfYUFzSV4/hYUmME7pZlyGUvyIZGfCDZnyDtmAiEqJ1oFv?=
 =?us-ascii?Q?TOXvTbfE0yajD9ElaDs3AyiK8Q3TPZ9k6b0l4GzYV/AytRvKBVrxzrY8n7Ow?=
 =?us-ascii?Q?B796hp+UuMEaTlUkkKfMDeaX2XjaPSgGBR2dBHj2qu2Dy9eJ0b2qScQva7n6?=
 =?us-ascii?Q?KwG8qxsb0pqZZR1bc1ApWXgzmP4sxBr7+0N7KiswHJqXA2zDWrSMZu9lUpqL?=
 =?us-ascii?Q?7qhCkS49DyL/JVt9i7eBGl47D+S8taVQy109onNDIh1z18dPN931twg/NFNm?=
 =?us-ascii?Q?R2T7wz8IW03/CIpfBpPXiILRz1IuD1Ntw60bHBwDZksVvKHm9687h1aMd/lA?=
 =?us-ascii?Q?KDASYOEXHNrVLVo87cOz7sRy/OF9oKBrsuJfhu/pJi1yQmyGq2nkmnjHZA1T?=
 =?us-ascii?Q?DJLOaJXNqjzqvLhKDGkUravHMtg0c8fpRWpS9fiH3gxypALr4OBeiem3RB12?=
 =?us-ascii?Q?8II5/np27+trQRygSTvUYSuhTvrJPajT5uKQ5xe2JbHihIJgy3PMh+rfeLy0?=
 =?us-ascii?Q?fTiYMIIvmpKNzlJ8vymeig3YhZtrhDzdhJ71k8WUVZrojrYBR2ZaXGJrCsC5?=
 =?us-ascii?Q?YiAzQ49hyut8p3Ib2BgpM5O8YDVenzXZTArBBOKIpjq37dYswpqr8W234HYA?=
 =?us-ascii?Q?ryb5WDg+JC+HwggQixaCg/mMpFcS1lqqzi4HGSWL3L6i8q80v5HeeQgJLG+e?=
 =?us-ascii?Q?80BU4chLT06v+jintLjGvODP3BYG6c0K5jkfWfuQB9OOhLkXYHW4x1TCpwc6?=
 =?us-ascii?Q?f80qfHg3mEY4P0K40MlKiW5Jz9za?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faed2db9-12d4-42e5-5e3a-08d91f711972
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 11:34:47.1821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFO8N1ChUc3D8wUbc5yDSI1cJ9QO/Dh4daRUhdfYwjAaJdlNPq5YkiwD0awfZ9hX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5139
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Nisha Parrakat <nisha.parrakat@kpit.com>

Needed to build the latest debian version
of android-tools
Fixes below error while building android-tools libext4_utils.mk
| squashfs_utils/squashfs_utils.c:27:10: fatal error: 'squashfs_fs.h' file =
not found
| #include "squashfs_fs.h"
|          ^~~~~~~~~~~~~~~
| 1 error generated.
| core2-64-poky-linux/android-tools/10.0.0.r36-r0/git/system/extras/debian/=
libext4_utils.mk:29: recipe for target 'build' failed
| make: *** [build] Error 1

Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/m=
eta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 2b1409d78d..137e5097fa 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -32,7 +32,9 @@ do_compile() {
 }

 do_install() {
+       install -d "${D}${includedir}"
        oe_runmake install INSTALL_DIR=3D${D}${sbindir}
+       install -m 0644 "${S}"/squashfs_fs.h "${D}${includedir}"
 }

 ARM_INSTRUCTION_SET_armv4 =3D "arm"
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
