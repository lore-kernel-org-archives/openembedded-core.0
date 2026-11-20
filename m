Received: from mx-relay149-hz1-if1.hornetsecurity.com (mx-relay149-hz1-if1.hornetsecurity.com [94.100.128.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1431.1795159334084098712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=a17uPVeX;
 spf=permerror, err=parse error for token &{10 18 _spf.eolas-services.com}: parse error for token &{10 18 _spf-paas.eolas-services.com}: too many SPF records (domain: witekio.com, ip: 94.100.128.159, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate149-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.65.131, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=du2pr03cu002.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=pMZC7bW10QqINpKz9JgsA1BkmBitvXGZ9ZiyfDjyTf0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1795159330;
 b=jpeKfewVgZ3IUFdVSMKNz8R72e9cLKmNGQQdPdKPed1Tj8Ktvikz9yY2/P3rapDxsKPX4jvX
 VL1Haa8EyxKicFbj3JvAttrs2luhZrBsOTVf9xguB8RQrJyxF//GAxJEoDpjHoj6msW3n8z+Y7v
 /Vt2iE+rB+mO5lc1F7dq7Gjy2wT5PKRZQ89DIkrDJeEm9n8xhIa+1Oeos43HPoteR0AbQakEBLJ
 uzWLz0KMxyKMG3cmHJeJHsxddY842T0KSX3jyq4f62Rm908uqDdzALKWl2eiXvZa1HVTW3uXuUy
 UD4SiB+jsCwkNm3Q0g3mTPWlIi7QVGRD9e8THAN69zbqA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1795159330;
 b=Dn2hSL3iz45P/l3lUWqxF/5mpfUyWlUSmshgQv4pa4uZbKWpJhdlKMiiOPpoFH/AEowlNve7
 oegkHXUz6DE/OIhSyVyW+774TIt+Z6vhvJYGsEjqwZlFtjOCu2ga7Wb3L0z4Nechgz6VQdJRH/5
 f7/iRoVeMBytpQjRvZGz+MtBXZPsRM8+a2PtcIWzT+ZSPNdN5uCdA7z68YWl4exDRQwRlLqgxUQ
 ONWQsrYlZJ15DDWtMx9hJV3cf6aI0NVo8hSg9S+N4DwCEYvpxd1goiHBnF3NWRds7nG8kC7xf8L
 SIq+9my0UgGzjzqphP/8YZvnAHpox98UIAvU+2yq7+hMg==
Return-Path: <hsimeliere@witekio.com>
Received: from mail-northeuropeazon11021131.outbound.protection.outlook.com ([52.101.65.131]) by mx-gate149-hz1;
 Fri, 20 Nov 2026 08:22:10 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgWax2FPTUgHhh609B6CibcK4GH2NOw4x0mXdNtrAgaSzC5R21UghDY2w1NL2ot0yM0w+AadP4KiHgPcfEYFoMylKZ2bVfKCacpD5OAkH3BYkQMfA3VxvykVVq+usMFUT5/xZnBgBYJEiRYKHukKLfdmdzFT10jms0yLNs7vJtgW6in95BzTzfDilDkdBxbZ42wcn+QTiGqP9F9jaixViHf7j2W+9kqbHjSfYZ4HW3eZSv5mJ2Q12+ftFZnuVC0sAU3cd69s7rnGcm8ZbsS87XzGJ9VY4xzJKLegrWVdYlkyn1+WJaeZ3H+D1vLB0u6Qp8KUSEn2lly34a38cLLPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMZC7bW10QqINpKz9JgsA1BkmBitvXGZ9ZiyfDjyTf0=;
 b=Kx+O74XdeQfnbspatok+dk+U2ns4h9+uSQlOjd7X5png3dr32o/I7YncwhrhrxpYSBMLoirABT4dzJIfkYMHlNPfcmph3N4mGJUGVnu4edS81c8iOgOikUjHLn3YKJLboSaShCsZd65U3A16CsAIxYc54evQeFRnAW1NQwnkF5VoX3MASyCpg0IEs3Dzyx1yWDvFAh19bUc+HY8xzS2gGLeET5dloH55z/KlJlQgw3JXuifcDcOGSMfwAmNHPkWLBZKRELmQKUogyr/jG8a6cYkX3DLpkhfTwRihNPc2uWpcO1/68iMBcbg3GBXCcZnmhSfsZER0AMbIQH3hgSqIRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMZC7bW10QqINpKz9JgsA1BkmBitvXGZ9ZiyfDjyTf0=;
 b=a17uPVeX7LrPjEalLAOgQQhkfIhh4/SLF0kvsj2acxpbw9oJYgPE3RHBwzIkjS5W7yYiuQGVwJ+eBYHdG+Lhv3X+viX1+KQPlKWm8NL0CJ0NjwsjQDyJJ0oDcvGEdy07G9eEaHy8rlFHjKET1epoXE9nKlmReCAVF9H4sqVJn6FlYBo2BgeMo8HTfQYZf3YkKXSpgLzWmuTwn9QVcrRbBtT3u3NsjfQdnqbpqDpJFPSj1/nPbuQPHCTgbIQVdVbKlhh0aLfRMFMMbFAZX1glXpbkaPBitSycoxDwsuKP6lzuaH7Gyr/EVwKNSTxIAbk0WskryHT+93lKqtWfgWaQQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 GVXP192MB2401.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:1fb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Fri, 20 Nov 2026 07:21:59 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 07:21:59 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>
Subject: [blacksail][PATCH] image_types: keep the rootfs mtimes in ext2/3/4 images
Date: Fri, 20 Nov 2026 08:21:49 +0100
Message-ID: <20261120072149.2725461-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0186.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:376::8) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|GVXP192MB2401:EE_
X-MS-Office365-Filtering-Correlation-Id: 8132f101-9612-4ab8-8079-08df46d6f750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10070799003|260925021311599003|260925021911599003|260925022911599003|261009223027099003|18002099003|261021121427099003|261022115727099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|56012099006|10067099003|261102130727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: m/fdqc+A0d0Pu8t9h37L7wyw1sOzO/a5yp2ARi+PoXAiUvpCnlqM6lep5klIbtLDp52MOnyXE7QtHogrnYCR2NNE/nnn8MpQ2WluxVtRON3z+j/8ln1q4HcrmoI7mnOSLb3gcDJNJd8lniY1tae3VNIQwcwLhUMrPDPOjjNBW31I665Ld35mCRYf6nO8AEp9eStVaZiaFhgYtJSnjFH8tIrNA16FGh/wpiJ1a5v60FQ5KwzBdH6kL3qb+dZFRCRPy7qEPb+WdKb17JE7uvPztUEHd20YhqraRN3bZgbBka8Mb8gfqworxTju1a8BR9D3rXhX7cwQGTU4ckoUCGYL+z5TIv2NYaLYd8Qu78ulYB24rPDq7V1pIP2idA929hiAYcssltB+oMf2jnyN4cBBf+Fr5aXOJ1ZCgqm1YSjdR1zpDMz6v4lU/hoA408qjYRQY6bgo0oSG1vhgWxruRI/c6Y50xkgZua1QJGS6BhuWgOiUIzH9wdtiZxpLuGNwcmsTtzL0aubpuBc3mJy7uTgG6FiV3r3LuPq300i8mY9/POcBB80FXNpxpuDGwyi8fnFv2xagvtT/k6iecZCH1zd1G/FbB33T+ncorv71x1EqFzWj4vVl7NcrPZIO8x5LP3yN/ThJ6plIXBT4X/VJPmHdB0LXKNNJB1WIJnvhOWs2w8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10070799003)(260925021311599003)(260925021911599003)(260925022911599003)(261009223027099003)(18002099003)(261021121427099003)(261022115727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(56012099006)(10067099003)(261102130727099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dj+cPQlEZ4VA+ULMsQK5XCNUJBkfvU8zTRlDH7JjkBnsPZ9Y2464TQNXSb8n?=
 =?us-ascii?Q?WVsd82vxt+aluNiNwjljuFXqiSa+GeeQFh4MkwS9f7XJpEbdC+iNJobJa5Dq?=
 =?us-ascii?Q?Rof8rNOHxYkg4phztYUqtx5e4Rv88eCx/bMsosq1FkLRwhaa2RnPL5avO3Yr?=
 =?us-ascii?Q?Boflkmarj0ZdAResKJNTjYawT18DXXwSi/X4CDsMEeful79Dxnskyoogxdeq?=
 =?us-ascii?Q?dVo7XG3weOF52qOe9joeJpP1L1SWQTvtYufm+ynzjHt4F0GTupb2mxPrS/zp?=
 =?us-ascii?Q?ZOfcCzyda6Lw99xUbhvfpVWwhwJwYieSfMjteW3mPsK18sdJD8o5KiVj5PaK?=
 =?us-ascii?Q?YTxv8Qmk0upudo4fXq5vHioETpVAyK2Ar5vfptjLjMD+UWWeY1fqCBNUA5vr?=
 =?us-ascii?Q?HYHzMZSS6r8emr4PlLI7Kr5j2h73qWYMRe7RHrL2yaQ84rgfswWhjNhEXo+0?=
 =?us-ascii?Q?smWD0qly49m/xxWdoNWSH5cljm9EZZUudTcLcVE2zNwbsKkzsI4Mj9ikmW0v?=
 =?us-ascii?Q?Tbg96nbvELwIPIgPzRgkKK6CI3BD3iDXlbwK+GRi7BRqszHWlla2pNx3zbIF?=
 =?us-ascii?Q?T+FFN91c9LVbZBZEQJi/uSym79nXvEZbEVRKtFNGp5DY7IsCFzGY/8ow9dqN?=
 =?us-ascii?Q?E/RVuoariFrueqAlUrRTcVtmvs51o+lRs/GTnfIm1hVH5tDH07AWcY3ovaYv?=
 =?us-ascii?Q?PdZWTqybBVAp8VHicdxG18hBURz2ZcpALKyQPcERoFoqrcPNAnDHxPznpXZa?=
 =?us-ascii?Q?JBGci6QqK3lAruA9UpZBWwmSil3RNh5NPmgUWWAE5yQYsMeE0zHs7llt4fUs?=
 =?us-ascii?Q?HR0Ds9DsXDxo0Hmw9xkqD+w1HkSKjWie4dMftAaVYjW9jDgtiv0cUIAAdn/O?=
 =?us-ascii?Q?MMX8c2GbJwp8wUAbManuVaydu/hC/KOBkQrNxLMTp178GkZ7fFCoSQjlzVPW?=
 =?us-ascii?Q?iquwDU7R44z48sUDbz/ktxU7rGSqyyct03y3gRs+FN7b8jvwg0wfzSlcuDhJ?=
 =?us-ascii?Q?GIqog2x+hkobslw3b6rQxjAsr9zZk6IlYw2x3MVbfloCNMX7E5rQYjFQF+Dp?=
 =?us-ascii?Q?zZqGLV37nfluZgOkZZwXdBsvS4RJuxIJRPwErG/Ub7L8iAZK46aiBswKUhRE?=
 =?us-ascii?Q?tDC05c7ffnmyjl50DBL9UhS5Sr1kZ0nyynfK1rN1wkHpqOhg72VUr4IcVgEV?=
 =?us-ascii?Q?fAvfOmQN/EI5gI+mrKANWQ6+MUtKYsu+9R+cIovontNNjtLc/pMkJAreyCuZ?=
 =?us-ascii?Q?4drwDTleNgNiRqccMRN+d92kSEboPvgvJJvxwKSkBOEME0puH925+MjUiv6Q?=
 =?us-ascii?Q?nSj6k2f9Rw8eh0odFLgeZUQrXjMwV0eOkuwWx4vRBuNOBhqfT0RniHQGaP8/?=
 =?us-ascii?Q?X/IxAbI551n80f/BJP6klbi3SDYtpbQV04C2CCDSGQSwp5p/cB9zdGKIezmc?=
 =?us-ascii?Q?Ha5Y5OFm5I3s+n+lnG5ZGHVYauGWsg2I9mLdeduCx3jFo1jPLIyH6VP3xQfI?=
 =?us-ascii?Q?6pQ+SikkkF6B+25bL4BU1ZQ7O7qIJMb0EPCF5f1OTMdFpHzTh8dL2KuB7rUd?=
 =?us-ascii?Q?b7xFqWUbbMwhnxAG+oT4dqbaF3/AHx8za6jF4y3syFGHzuDbiGEmEEt4BSG0?=
 =?us-ascii?Q?XmGexwmICtaMWU+dkuX8ahyCpl9gZALexcurIKg4E9GJavp0E3b6Tvo/yzGN?=
 =?us-ascii?Q?VXyDLBjXuYEtkB0vVqE/GBwe72VKNtFqieNUaXXCVZymNbTL3Erdpbh7DIc/?=
 =?us-ascii?Q?izyzTDXjEoHbUfatTdLLymWLDNoc3HTnd3aA5lUtiZAyli70amsgkDuRjIAI?=
X-MS-Exchange-AntiSpam-MessageData-1: oshO39LNTBovZg==
X-Exchange-RoutingPolicyChecked: e0FPLP52gd2miVQP76BWKFP3+WHwg6voSLgAgIQ3tv5KVpj4qVR9G6HNqLDVbPoRTDvbEqkZdrMI4ED3n1BSZen/4q2EJ+KjN67SaTWfGSKa5iece8KYlOWY5sLAj295SVeZo9+Ki1GyoWvpQbLRrkhlBsw9yEZfTyX3GnHeIrLkMkgTNIbDDXc+rrOWbUhMNHv9YGnfnHXE1FZ8Ktczlpn7Cud6LUvC5ww7s8hvuwAECaGw8ilvHvwUXg6kKJtO8r0w1TeJGhqOKv3HJ7N+NHNNM7fCgijPT+Uyrmm4ZbmBrzZPL6yt6MghELPJtkgKb4UnIILm5zDZ7cDRMhAYqQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Qj01Y0CZ2A6qicsR3s+xA90E1GpB1L3Yej+cvJBM0fKO4vCPpjYpjj0dITGiwkEUUMAOTsjQO7b1+StPHSYSs6DDcg72CqKo4WPx5iNt213w37490+3vcMNrmK9kmM2tabw1B84mKji8YkZW4HGG4l4du6TdCnrJhU++ahDBoOHxbzk3E59F2EE77jkP/B7LnBm05JVXequjEUcs14gbjKeDgDSveNMk0+j603NRJfaUMKJ7jh3GtuGW8A9N31rns1Gmfmn2qc41FQcYOQmt0SjOFd5zkLSvOwRfr6niwtOm1d95acC58tg/ENY6PC2k0ayilhl0PJ76zlAJcEL2DfAYpzXtExyOVJqg0kaUJYYbmT/OMliTxmDEarcsSNYZcapFlvTT7PlVQnF6iUVysOh140SVBT0BU/HK9rDNT8HDYK5Axy2Sj2jaX6SA2Bnm+T/W88oU2A/TYLHTSFcb+vDLa26HDYIt8uaBJrGC0AIUeyMUJ0gYhbml3JCV4bOhEOgyzSb3hr1gnih59uUlP3YUWrSW6bEIqGdWzOa71hOUfeKPifEvj6MTztGsp+1jh3joruTHSmQEbs3Bc+0krnMyTre2dHYHK/40lzu+Q/08pAnfyQGKgB3Knmc7Mxeh
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8132f101-9612-4ab8-8079-08df46d6f750
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:21:59.6951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nn/v1BAnwDAzHSAKNXxTgwqHDy7fjmRH/GnLUb7sYfARnsNToOAVhYYcz8e3cMEWDOunsOxy/duN2AVNWH5D6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB2401
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate149-hz1 with 4jW6Gg3QZkz18PY3
X-cloud-security-connect: mail-northeuropeazon11021131.outbound.protection.outlook.com[52.101.65.131], TLS=1, IP=52.101.65.131
X-cloud-security-Digest: b00f77a7f5046d91338de4ea0ff318dd
X-cloud-security: scantime:1.599
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250740
Content-Type: text/plain; charset="utf-8"

From: Alex Kiernan <alex.kiernan@gmail.com>

mke2fs reads SOURCE_DATE_EPOCH from the environment and clamps the time
of every inode it creates to it. bitbake exports the image's
SOURCE_DATE_EPOCH, which is older than the REPRODUCIBLE_TIMESTAMP_ROOTFS
that reproducible_final_image_task gives every file, so an ext image
carries different mtimes from a tar or squashfs image of the same rootfs,
and anything recorded against the rootfs mtimes, such as the fontconfig
caches, is wrong in it.

Give mke2fs the rootfs mtime instead, as oe_mksquashfs does for
mksquashfs. It is just as fixed, so the image stays reproducible.

This changes the times stamped into an ext image. Every inode's atime,
ctime, mtime and crtime, and the superblock's created, last write and
last checked times, move from the image's SOURCE_DATE_EPOCH to
REPRODUCIBLE_TIMESTAMP_ROOTFS. An image recipe has no source of its own,
so its SOURCE_DATE_EPOCH is SOURCE_DATE_EPOCH_FALLBACK; with the
bitbake.conf defaults for that and REPRODUCIBLE_TIMESTAMP_ROOTFS, the
times move from 1302044400 (2011-04-05) to 1520598896 (2018-03-09).

Where a distro sets REPRODUCIBLE_TIMESTAMP_ROOTFS earlier than
SOURCE_DATE_EPOCH the inode times were not clamped and only the
superblock times change. The directory hash seed is still derived from
SOURCE_DATE_EPOCH and does not change. An ext image therefore differs
from one built before this change.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2096871145c16d3b534a252951b960f1306740c1)
Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
---
 meta/classes-recipe/image_types.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 326602d960..79b9ffb9dd 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -81,6 +81,12 @@ oe_mkext234fs () {
 		extra_imagecmd=$@
 	fi
 
+	# mke2fs reads SOURCE_DATE_EPOCH itself and clamps every inode time to it,
+	# so give it the time the rootfs files carry, as oe_mksquashfs does.
+	if [ -n "$SOURCE_DATE_EPOCH" ]; then
+		export SOURCE_DATE_EPOCH=$(stat -c '%Y' ${IMAGE_ROOTFS})
+	fi
+
 	# If generating an empty image the size of the sparse block should be large
 	# enough to allocate an ext4 filesystem using 4096 bytes per inode, this is
 	# about 60K, so dd needs a minimum count of 60, with bs=1024 (bytes per IO)
-- 
2.56.1

