Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6119.1794231652258866288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:40:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=K0NIvkdN;
 spf=pass (domain: est.tech, ip: 52.101.72.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzifJRCf18cGWHLlapheIWWi1ZN+g2a8C4yJx/uzDpXi6YG0LX7ses0buqynb+MdbQwMvCxe8xAw8crqkjGCvGqodZFuhHoRZLHBBv4+8Zy/fVGiWzywfPzOyiYR8BWV2RvrpLVoP+8lTqEoT+XZDzAQPAX/DkPLlS9W/fPK8Qa3tqVc+EMih0G7fMXhaEui1n1BfZq8O6FrOWw0X4Imj4J2eLqWxBr+fq9eLCsy11VhBg+taQ+egHdGR90VlNUCn/BgpWBPwoi3haVSGNnS2KzH6qWmCmiV183wIskjo1ZkDS9kMB2+pMNo+THwsikhJ6Gf5nwp6K6umokksY27fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CG4/R+gTcynjm9c7rJSOGGVJQw5YUBQUJACAfxMEB6A=;
 b=o++2VOi9G/f3VGBh/BjBE/K65xBW0Zc+RFOF4fSkScVFW+BH9uq9jtOjQLmRi7v47StLUJv959XN8G15QjM73GfvC9Ei0HohLQc0P+2b76R7SStLv2wUajOCdUuLzqmGYmY+diSyKzwahCfvnMEkrPlMh4977QYclOKpZAoYrjOYapNdJvUVYpmTx89CPJPJnbUj+Rq4hBQHk4LWPN+8KRT0LdGPqdx0hg0lRV8GExtq0GS57XZNkiR9rS1/oyalpWOIJGKojRuIMOB4QeifaCXeU4XiUlolOofa71Bdvq3Y/ItpPnz9ywCNjPZCY5EjlW8C4SYZGlp1fxAApza3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CG4/R+gTcynjm9c7rJSOGGVJQw5YUBQUJACAfxMEB6A=;
 b=K0NIvkdNwVMYIoHSNQUgZijc28yXVX44m6PyFlxCd8I8BPPxOxcoeiRaGq4zgbDKXR4znyJDImSRlHRp6gn3jzbrKGsdCtt1YXZMOb7N/m7qSc0oVURSiWtuAJ9ZaVCQNS5+OFFrB9janWmJ6OyK5Vv8YDK/5mSzFIDPuaq2XhEGCnIEbMCYCPMZBM2uiWxOKF7whl6YrbOkONyv2WaaxYgZA3gZsULkkwhBDtgqJhqwbjipvzW1nHEx0XwcbdwkBmALCjHew4+CJGgvqzlj8TSLXg07I8VI5x1HuzP7j0EOXxc8ROY+LgPrUmCebmOxdRccmPEBp5qeO4ABG6W8Pg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:51 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/21] gstreamer1.0-libav: upgrade 1.28.8 -> 1.28.9
Date: Mon,  9 Nov 2026 14:40:22 +0100
Message-ID: <20261109134034.74458-10-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0080.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: c31cd4a0-e1bc-451a-fdcd-08df3e6711e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aE097apzMcrKsihMM0ExN4vehKHoCHfvvMVCwOzVEQa6kENy77mcvgjEGmCjMXNF1ULwbCxxE5PojbFh7tApYAqVxF1n8n+orQwnFLa8jw3Kfo5EGLynZoAvRQ53M0hnWVXncWUcTiOxMDuHOQo/ogQ/QjG23VOxjzMt5Fo+JctwY40BP0ug0i9ylXLlgCHxcnW6K2apwVwORhpdGuTBcukGw+yBp7FMwapzbuciLL2SWfLJVFmO03/ZudQgJpD69jwV93+ZwCc6NdXUj34lSUOmi1D/nmF/kO5LtwF0LID4HzITOIgH2kw/4iCwsV2HVWviKk7GlxVx2LeSgHGT9/ljjP65OERw0nZ3AYiC3GZMLZ3EGWvCAlv+dzIazuL9UiZQp4sKiUqjFL7P/2ahqJnNsAZFs2O16bhDu4t7+Bg+c0r2criJvUPMtXsCtqufXJUbKnrnz17DahejC+yqWS124+jL25SLc4Mgo22kR1UzXlhxKdYY1ELyl2Xf3qZV5IzKKdWEgt5F1ykhegKqQitPFWTmpJnENCV0BEijTIL27LTM6c/VMxTm48hB8uxD5ZgACu+0ezebUZFbBR/uwVy6Gz+ONUSlKnNbe0HgfTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zD9ktnlSh/lkiio388IVdBvkyQIpflXOAgpDhgTOfF5GUnTNodWWBOq0qaa2?=
 =?us-ascii?Q?zlAY78a2lv0dh+ofDNClL5cLh3AxwrPS/jw3AwiAM142KzCunTxGu9/XK4Ec?=
 =?us-ascii?Q?/oVGJbBbNKaduDD9J2fQKMcIOF36lbq1W3NGtE2F/4NIMwp5fcUNFOKAlNT8?=
 =?us-ascii?Q?jYqsBLQUN/UvZEic3BM3WsqgI/dcVfJI87vYpCRp5RH+/Kq62uBn3ALbDZk+?=
 =?us-ascii?Q?mWybWmQZNdjQgkrQDqvEn1RR3HxILoYq/3dBJ2fo4LHohqacsd1tw4LiEaVz?=
 =?us-ascii?Q?ATmOYsa0PrOKxpr1OyTYN6Ipf+d+dl5qEa8SrG4sJqc/TsRDtfL+XwdVCykS?=
 =?us-ascii?Q?nRb5yHF0Nsi1a3Fbc6mtOQCLKlxyfONGzTgnaPDhifeYRGX4eOU6iMrAxOrL?=
 =?us-ascii?Q?i6Wn8ih/D5SoDusn/8MVgk2CP7Lu9HprDkyW4ojKlBUO9FvB1xzhr2V+/8Ob?=
 =?us-ascii?Q?YN8kCESCT2tuCpRJ3wq8wwoVOR5W0u+AGjRSYAYoTBs3tSOwbrCCI2Ebtmta?=
 =?us-ascii?Q?OqqwQ5OO6jVBoId1ZuTnqwUL1EW+X1HyrOYv/v4vuG/mVCe4fv6/WTHQTXCy?=
 =?us-ascii?Q?3vxD2GkV95sd6AxmP4XpObvTwN+MTEiEcrWAKAZALN+A6noRjuZS4ZKe72oX?=
 =?us-ascii?Q?n7xtTV+F2aa+29cVbNfLp9Zaqoo1XBRGNwMYNS4JnawkXcpWv4mJG7AA4z7f?=
 =?us-ascii?Q?ZUZ04p/yumIDtszDF92bwCgiWLPcjkbrZ4zCh98CoAfVUZ/Ep6BKdl8JXfik?=
 =?us-ascii?Q?xanylhSP7V2ijmFUlRbZ8EHp/K/YlsCKZ2c2uzbf8w6NzjgzMKIsroJT/gPw?=
 =?us-ascii?Q?z52ZNTKKCGw54wuF3YdhzM8C5rtucal3unlfvnH1mWqBb2TUXkXcc2xq0SaJ?=
 =?us-ascii?Q?RepSYpTqoRsiI7TOm4rfFOoAhOevrvgJPkEP/SZYuzWJX5ajTZ+xH/bdqP3x?=
 =?us-ascii?Q?blvvkO0CQzfobUxbdwpBC/iFliCWvoxOrTFjnyq2VxmQY+8JJIB9s5VeDtgW?=
 =?us-ascii?Q?/tPpGXAl7S/GalTWhNlykVBx53FAMX6KYtxT2eddDiHBrtdE3jREgX04R2RX?=
 =?us-ascii?Q?o0liVX0sf1oGlPLheW8csgKAxE15s17gB/r8B4GShWYfhTSOtYVIAwmhv8th?=
 =?us-ascii?Q?w6yNfn+pPTSA/PDaHOk61XAazGI1hyTk/zR4M4qYH8PxlaQ96R+rN6kpARyZ?=
 =?us-ascii?Q?vmaYPYLL5GrciF+BDfke4qzUuRyz6qqApeD/Fl9ulHuZ9La7r246hdv+xI7R?=
 =?us-ascii?Q?9ylqlM3rzSZM1TfNiUghxshvqnBu8ohZmbAp3Nw0KOiwuH18bILAF7nEVmZ8?=
 =?us-ascii?Q?+3nhYgjiCb/Y5zyssV1NsZf/mMTptv01XIVKn7bZBi2vOfn5acG8jWOa2GTw?=
 =?us-ascii?Q?fPLP31ePKIG2yF7sMwbdkxFnVDKktSXBDAlorfuuENFpEAX7O1vdQiqrTakk?=
 =?us-ascii?Q?Iw/mRIaqkyM845/EuU/K0+ihHXmkrzJVKeAG53bvbFBQzl2Y+OUOtkFAdFVu?=
 =?us-ascii?Q?O+R+l+ePgiPVXMj77RV84DwXz2PQHa3X/juU+b7VFK2zwbwiGSlB3jVXeAjv?=
 =?us-ascii?Q?CUBWZiBFrkic56lq1qOg/19rKp8ftkXFLAEUQoUD2s51mEHjhHUBRzBUKxg2?=
 =?us-ascii?Q?rhOoJas8oZsIQ0dgjdgM12bcFi78JpZPpvjLFr5GPEPjTqy+kUstBL+soXiz?=
 =?us-ascii?Q?x6jT1npdgTUlch49XRfbbEEp5gaXHBHff6Rmw3NsZsv7JbF7vTp3umafLy39?=
 =?us-ascii?Q?azTWGwd0Uw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c31cd4a0-e1bc-451a-fdcd-08df3e6711e9
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:51.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzUcKLNVD4Gae2w5EEP7pxQ5Bij/PNa6AXFCcNgMG5LunLDMU7cJIf+na9FIzPQUP8ZNLlwtiu4fxzn/4OWy/Cwr8aA1/tvdIwTKdaAh3JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249814
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...streamer1.0-libav_1.28.8.bb =3D> gstreamer1.0-libav_1.28.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.8.bb =3D=
> gstreamer1.0-libav_1.28.9.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.8.bb=
 b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.9.bb
index 22f071b17c7..bc4394acd46 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb7=
7e486cc36129f7a770 \
                     "
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${P=
V}.tar.xz"
-SRC_URI[sha256sum] =3D "98ad3d7f8932c495e268708903f1c3388d5f26a0db34727a9f=
861ee23b724177"
+SRC_URI[sha256sum] =3D "4b3df21fa70972a80891d2298cf32c14a62c3db4483d545c7a=
c018230399186b"
=20
 S =3D "${UNPACKDIR}/gst-libav-${PV}"
=20
