Received: from relay-p03-hz12.hornetsecurity.com (relay-p03-hz12.hornetsecurity.com [94.100.139.203])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13593.1795699198093545647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 05:19:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=Mdk5sqwm;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.203, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate12-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.66.108, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=duzpr83cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=GfSv+Nd7yELCRgbZyOq6smOj/sEbEFqpWU8ZgiX2wd8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1795699195;
 b=hsXFqGrnvBUVwCldsbfuj09Dxedvk27W2b1ehjR2nWF3WRBeaw37Atn+wVhoUji+bEuOZxQY
 jeWac/ujYpeC9GnzSy5/tg4ZYi2Oslkd+xikWm7+BndwWFk4GeKdb+oph/yyFHkIDRIbIW54NVk
 rRxCCZjRQKod5Y5LZREcofNFfGJ7zL90ru8phV+kFKL5D6SByT4QehBwUsW6p+mXK4hMSOKpIXb
 n4frHr98ye+IsGPLkzrmyLlaIvKkPM8SQFHNhzNWqiJbY42zOQe3QEpcoPieFd1n28Mg4pwXNwn
 shYKOwi+U8DS72UGGEZirkBs3kA5i0je4N1qqoL1fJ4xg==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1795699195;
 b=qcORj0Umap5wHFGoSzoyykreEk/IvtoKP3Jd7gHR7d9Fnxs3Psn1CevtShnI4dV08y+g088a
 b9Y+ljeFizgv6fzQUlxVjynAfjNcRPsfc29R96nlrgPz1WDfeapMyeH/A5PvMs07b/m6nbwkCcl
 QWt4D81FrzB3Yddsi6CZJy3YxvxwLE7MazOPLPsj3dWq/DBmp6Xkj5DwAoy++WlK4FoM3pfSn+G
 833mTWjdlMgzdrxE/rkUcHQd4dDIMZhBYNdi5QZn5KoWuI8pBCGDr6EORHhom19vnozCGHRBKx6
 tQrL0yWnIlu9GpPyCCQE9JAUGxzplUfPhbGsQG+JH3XvA==
Return-Path: <hsimeliere@witekio.com>
Received: from mail-northeuropeazon11022108.outbound.protection.outlook.com ([52.101.66.108]) by mx-gate12-hz12;
 Thu, 26 Nov 2026 14:19:55 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSpVUA5c7JWoYsmmOy9iXl1HeDgA3jTasU/TsC+14tu19QBnmDicAgKMJigbKXkkBLzqNoOBWcyzdLsjvvuniMtk0ygKj8+ldJG4A8DixLdY0Tn0wtHPXO4/sP2DWmfQUwf2z7o7QDeswoWo4kjj0q17qfbNTAQ1+qr3xT52nWzFbCaDOT5XMwSmv60Q/g5cG4okvqFIOT0YOCF64JeOrsT/YOBKtFrwLYofB+3y4cP2ifSFGl7UWEDLXxnikM0SyBUNAlPTximHyoAv7LbTTY/7uWk/Pn/DN0t2rRd/5EWYfznEdH6ew2B+y026+/MsxvdkLhKOuZmkjrrIy+fS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfSv+Nd7yELCRgbZyOq6smOj/sEbEFqpWU8ZgiX2wd8=;
 b=exCkqj1V8st5LgYzFOwhQBWP720GL40TcAUUdbX5yPstmR6zU3STdE3YuAb5C+dPUoX7ymIIu2p7zVCnuVmOmS0rBNXJxirNaKEyK6O9eiRwBUG13RnwmweuBZzWesHf2hq8LliqaiKXQmEd6s6ay/jyBvWSIOf0ehm+VcNkEynvFpk0AeiEf/VjmhEnQOhCUUF6AgIdwtQriPoCZnsABhyuAY55IvoI76fffG+ZEQZMTCVca5w2EKmlHxovOqI0VAaDDKHRMEoM4x0AJzh+ePnzMDdZ7nUHe8baHmQCokzHXZwQWb4nRDBBB/04hqGq3GmKedDjutjPN9JQypAopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfSv+Nd7yELCRgbZyOq6smOj/sEbEFqpWU8ZgiX2wd8=;
 b=Mdk5sqwmnJazEWuuweWLeXKwi7lumKIAe3LvfzMFDel9j1PqJNA7a4upmUMztC2okqY2O4jae4YCg2YJMk0N6mufqHTFaXCLFz1hhoqfLQPwoVxIce+pbjPWN3u7YGufldF4+XCiQezPnEHhSkNWC6ZoBWexvcW8PDAK9GwakEZumtuY9qXsY2D366Im6U5XJ6r08A5jHgPeGHzjQUxy+TfiMAdB1DdkDVE6ttPR1BUcVP/0rqzpDxd8oVVzLRcUMY1lfJpME/4ot7R5rOGr7D0VeLxY38xikEqTh/Z0d0PmlWHR8zeQpn2dhETvK6Zs9f/1gkoUniRx17h3PErIQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 VE1P192MB0606.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:16a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 13:19:48 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:19:48 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>
Subject: [PATCH] efibootmgr: backport get_entry() fix to return entry once found
Date: Thu, 26 Nov 2026 14:19:20 +0100
Message-ID: <20261126131920.1325879-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0468.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::25) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|VE1P192MB0606:EE_
X-MS-Office365-Filtering-Correlation-Id: 924f80da-3b8b-4a57-df0e-08df4bbff1fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|1800799024|261022105027099003|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: KTe6YQcE0m+u92+o5xGPeu46OP/uvuIduBRCycOYJxqeZnzLct79FgsKzoeHeC0y4ij3fi8127WYdH2rkUpSJl4xVYCD4QZTOjjIj1nfynoWlm4YQAdkUeQhay19XplQ1ZAjN0TxK+yPmyDKqGahF6ut4THOvoiO2WRgi5GUA44+gSIs9DTbIP1PWMAFH2lHuFY1SKoeee4Nl1PZODItwILPiJhKm12NZ7pQC45J2jy2q6sYCgrY8Oxru4TBniIUulX2OIz29OfCVYCAVjShq6vlOgdSy5N+zK/9cn8uWvNWF40618JrcdNK8K6I19u224UCBrZBvge98y3YLyWoYd7i0cv+HaTzTn6qpzmk4cJTYqnE9JymqTTzwHsypmGnuR6OmIbZJmfo5+Zkbu/v6lB6r+oeE4jzlrTfyYPWbxdvu0vpyJS/PvPpMNou/FOJmsIgBAoloT3G9oJRnyE/H0SE+yqPELELg5B31qoCoR1vsCXhcI4omsd5kKnL3RWppOwK3exWN8VmpqIMr8G9geosHR7UTumIdliKAmchhIGZ8zMN0PW1f2aZYkl1HQaT5sw+q2AbkstCiEp1m8fRiqNDEhYaY5uhMYDnY/Sa0KDHOhvcUZmgdVmlA+BYB50Ps0g6YDX/DIrC1eEgNnithkRWxaM0PNh00SJC63l0rvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(1800799024)(261022105027099003)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YK7+5VMUony9yQP6YOYyhy6Zjghuq+2ao7ZkSFeKgDYrddubVuNb0ldRlA+2?=
 =?us-ascii?Q?BganVF7QnlAd7JyX6jNRRkGucWsv/0jrQLVazKAhZRBdTCz1wtNppC7CbzHJ?=
 =?us-ascii?Q?+Gll7tHbzqGm0HrCffa42Jel1i2m6cy3tv2TBOFALahKYQGBc9nwd5GKjCKW?=
 =?us-ascii?Q?DxLIoma0nWG+a00CV5ts4TUp6DqeTV7F1QE8JbbQWSflFZsuizQ2s6az2pHv?=
 =?us-ascii?Q?MM77Ln20kjY7Li61sAO+EF/6GlA9mR7HHDBhQeJETTbIl5IfigZsUJ5atc8j?=
 =?us-ascii?Q?a3u9Qoeny+wkUG8hySNVQtgV1HKOFAMxKFcyi5KzZkvPDYW8Ow0Ty61ttewX?=
 =?us-ascii?Q?Z1YlZ4bVyptDxaGS/sTrH+OfivlFHch6oxV1BSJuz4fRrb6aG9iKx99oIlEa?=
 =?us-ascii?Q?dKCNvUsbi1hvD4JKW5Q2FleghDmLPvLgTQfIAUIeRKy7Wppz/3RwaVEEO/6X?=
 =?us-ascii?Q?qVhVV1YwYVutxkac/++BcGwzqRSZrGl48NxHD0adWM/hDxjWHDN//l6KlhBc?=
 =?us-ascii?Q?jylrHEZ0IIJHvcgJVun4QFi2ET+xItA6QecJ8uAs+1bYOBbAYH1LsRYDSnP3?=
 =?us-ascii?Q?R/fmLfQEbQNSEoQnp2pth4zzk4mIAv6xpF2LuMRbaGr8OEmGbtqIiMabT6RX?=
 =?us-ascii?Q?NDwoSEfOS+JH9XMCg5KhG3eOXm/BsGzwcyW/+zj5FwimT0QOF50tw7ueO2Dp?=
 =?us-ascii?Q?iwY6uvTpEpkNkchWOpY/NPnB5aUqqs4WLKZmkJ8FxI+Q1Q1oh5I4/PC/GYyU?=
 =?us-ascii?Q?uXpNdgLJTiaHPQi7ZifoKQurXpPhtnMhfBPXbDXglKG+I4lDgag8nlBRFMaH?=
 =?us-ascii?Q?B2Pcj0DwGOOmnT1QdnNjFjaweW83fqbtSve4qcydeQSOpuMGYXfP+tyzlWK5?=
 =?us-ascii?Q?vE4C5F/FHSWyxitSZsSk9VxzHrwCQR5aXp+2HnQmK4sF7i252gF+X45ochBR?=
 =?us-ascii?Q?L0QZtVBdG/ofxuHd5rjSZRAOiQQNexfN1HWy+QkgFADZnhJ+jf7bU3IPGXSL?=
 =?us-ascii?Q?VyNNNIMijnes+7enD7Eg3IpflypCERLBn1nOJjLKBsBnGc1UdGlgd3mlOUeJ?=
 =?us-ascii?Q?gdTVUctNOvXKGinp8/zN6kQ+RGxV1BgeGna4RfpFyeYVlCPhg5wN5CnM5ucV?=
 =?us-ascii?Q?OeC3YffXNnItXzn4jHg3X508SPFpQuuCabDnDYC0b4jSf2I50UdWJmwqf62g?=
 =?us-ascii?Q?YtaPAj9M+wQgh3wn4zNTzJx23meZVLO7dlHYRCWxkdWgVRyJIX2Aovsp1P7c?=
 =?us-ascii?Q?vc385Bma/1pA8puJwjFQt+qCInY5tbbo+VIHi4G6/MNc6CCPbMRWlBJre4s9?=
 =?us-ascii?Q?/2/cGv9t3Nhv0F1x7zLxVl46y4hV5BQllAonXD+PuruWHX8+kG3yWdM1KSBO?=
 =?us-ascii?Q?7JQFwVh1xZL4WIrAoqGuZRZvqcr1ct82TWng+NJSAqVjLFD4TC6N99i80B0j?=
 =?us-ascii?Q?ijkt31FKFX/oBaoBgdB44hflc6Fh2hQby2IwmoUokQ/HXUQsiEa3m1kCCFDa?=
 =?us-ascii?Q?sEbgH/XCPGh+5fm+BKGj34c8DywAlouZWA+TtcguM/PorQp3eh1/j1h8fS9M?=
 =?us-ascii?Q?saRAPZwKV45PgOFiBvZ2D3+DiuIUussc0h68pqBfFx1qlIygI6VP86KqOEw+?=
 =?us-ascii?Q?Oy7EFWmpBrl2rdytAMl/nvVlFfaPJ4lpc87Pi4oBiH0idujL2o5Jh9tx7o4x?=
 =?us-ascii?Q?1cHx/tksly1RI2CzYAkT2dPidfvy2e5qVCO1agwm9bHGQRtL2REBctBRR+7X?=
 =?us-ascii?Q?pF5fug3WpZu2KXaSXoL09MGTSHgN02YbqPqS23n/NdzsCXIoP6rscIplDzYI?=
X-MS-Exchange-AntiSpam-MessageData-1: IePfEaUv7V2kRw==
X-Exchange-RoutingPolicyChecked: VSKdXPpRUWXIwDVob31iRbSrfT39dzMPX1Y61XWwUka/97j1Ux1r9QRJSzO+p1pH1dniEqlVyUzHNxbpvZ4KgW2Toyyjdz+rgg20mfeqTLsYfqWV/mgcc8y7HOEU9E0dt9avVNpcPtaPQA+HOfSNbQ7z8fSDPou9zKEFm53ce2p+I8UQfYKIXDnAA0H0KsApD/riD0+c5u3GpxpCNMNsY80OF7RSXMYYqoBFdUPzEYXaneJFJfY11JQT0j6wanil2ukBKp2FGT1E1418spzO016V1DcakH6DN7qJ9FT3eBeS5zO1OopMFfo207PAFsAfaMWrB5FwEsPs0FCLxcqBZA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DYj7PDWdFbtjFb4WSxU5QQzp08NZSd0+XbZYKBBzb9Vmc8wBSp3m/tDIOXSthGc6YpELBMNs1j9l/nsDP6vmEItWBb0P3xZqXaymDlUgwPHZMQBeofqSJ1ul9oGiqArybXbC00Eg0Bc653isPWdFwFHuqqBwXkhoJ3vfAeNPqAxarQR6jhGJcqbDS76vPqUdh7mUJKZFRgk9kmm4QCFufxw2ussJbPHiUG9w9akmiNDAVZhn6hWoOq1+hvKikPee0QSHVfGkqa3uBEf6+FPYjSPG7pJJph2BmMlPW3ib4RJyuH+Oi7hmg8P4AROXgpW1IPs0rMWGWxuaHVlMR4pEgClkl/I7Rz/A3avqjknwi2WPUue0GbXV0s37/GGOYGhupy9KUPeLVHU1QQBKIa5nwKLEnCdZ0/HM+c7Q4HhNvfNvyvkXtTmoBdBSq+JYiYgh/RfQxxT3Dzl536GHhNhnQpVpv/7vpI3+8tDKchCnEzXO6/LCRbT55svswClO4cOXJaQJAP2MAxs+cNCbkd+Dzqp9lCSwr7hpY/D7CuYpmGvlO/TneyoGPrJmNbsMAunlZD3k/C5dp7twcmq8rMYz2TWbprHPaIrM6vv75wBr1UZsDj6aodZzGcV/Sfvz+kEX
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924f80da-3b8b-4a57-df0e-08df4bbff1fd
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:19:48.1504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9C1eOHusgpK5GAZeTPVNk+JF61ync1ZPtvDe/Is7sivqPhfBuz2M7i0/LVWkh860o7GiDUxnOs5aBY1oIOURmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P192MB0606
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate12-hz12 with 4jZxwl0CMCz3cnJK
X-cloud-security-connect: mail-northeuropeazon11022108.outbound.protection.outlook.com[52.101.66.108], TLS=1, IP=52.101.66.108
X-cloud-security-Digest: 9aced3a8a8272df9efc11661ec27cdd7
X-cloud-security: scantime:1.976
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 13:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251299
Content-Type: text/plain; charset="utf-8"

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

get_entry() does not stop when the requested entry is found and keeps
iterating over the list, overwriting the result. It only returns a
valid entry when the requested one is the last of the list.

As a consequence, every command relying on it fails for the other
entries, e.g. activating or deactivating a boot entry:

  $ efibootmgr -A -b 0005
  efibootmgr: Boot entry 5 not found
  Could not set active state for Boot0005: No such file or directory

The fix was merged upstream in 2022 but is not part of any release yet,
so backport it.

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
---
 .../efibootmgr/0001-Update-efibootmgr.c.patch | 31 +++++++++++++++++++
 meta/recipes-bsp/efibootmgr/efibootmgr_18.bb  |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/efibootmgr/efibootmgr/0001-Update-efibootmgr.c.patch

diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr/0001-Update-efibootmgr.c.patch b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-Update-efibootmgr.c.patch
new file mode 100644
index 0000000000..6727498dd8
--- /dev/null
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr/0001-Update-efibootmgr.c.patch
@@ -0,0 +1,31 @@
+From 6e85adb6ac0dbab5e1aefe8e262c8260f60b2cd3 Mon Sep 17 00:00:00 2001
+From: kmicki <1463619+kmicki@users.noreply.github.com>
+Date: Tue, 15 Nov 2022 14:37:25 +0100
+Subject: [PATCH] Update efibootmgr.c
+
+get_entry: return entry if it was found before reaching the end of the list
+
+Upstream-Status: Backport [https://github.com/rhboot/efibootmgr/commit/3eac27c5fccf93d2d6e634d6fe2a76d06708ec6e]
+
+Signed-off-by: kmicki <1463619+kmicki@users.noreply.github.com>
+(cherry picked from commit 3eac27c5fccf93d2d6e634d6fe2a76d06708ec6e)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/efibootmgr.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/efibootmgr.c b/src/efibootmgr.c
+index b980bcd..4b15d6d 100644
+--- a/src/efibootmgr.c
++++ b/src/efibootmgr.c
+@@ -1192,6 +1192,7 @@ get_entry(list_t *entries, uint16_t num)
+ 			entry = NULL;
+ 			continue;
+ 		}
++		return entry;
+ 	}
+ 
+ 	return entry;
+-- 
+2.56.1
+
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
index 8001496fd0..8d580830c5 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_18.bb
@@ -10,7 +10,9 @@ DEPENDS = "efivar popt"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https;branch=main;tag=${PV}"
+SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https;branch=main;tag=${PV} \
+           file://0001-Update-efibootmgr.c.patch \
+           "
 SRCREV = "c3f9f0534e32158f62c43564036878b93b9e0fd6"
 
 inherit pkgconfig
-- 
2.56.1

