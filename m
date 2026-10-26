Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40069.1793010707782988464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qtfDDr8u;
 spf=pass (domain: est.tech, ip: 52.101.69.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcTVN9jraSfAFhLbhgf0sqdYzhXaIP4S5ep8IVsZVkTi45iuva5QE9CB7qRi3EEF5BB52y4iCO30pnhzoZuH9wzIbKER4xsp42n7i0a8Rvt0ibC5PaKIYeiPLhwR07vfefVromNgCPPj/XOv2s43bno9AH+aR0L4XSlXPuUjGGN/hTMV+2+HEJrzy7Rx6PbCwYWyw1NWoHvK1wv5gqm+AS9zKru0x4wlyhn2//Au/TJ7N44cR/6kuUqrRDTocV7daUrjOTzUGKR7xxrlO/vj7tu4EIs0WW5EIVAVdCJQggKLvXXTYsE9tyZqy4qixBCAGmaje6ZAviHht+Dy6sETSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIZ2hvPx+ZKhv5ZxqXO//zMgWZ4xG103PI4RoH7/nWI=;
 b=CCovb4/6KVM2ZfGefRxOIrC0hejsvIt2GAYKqyGp+22CcHlQEQoSs0rVQ8ldA0wBtN5fYQdLvtZaDCrgR8GbTNbw5TC0q2EQQY09CQIS+tuMUT6w1jw2OedGmqfBes72Ywf7Jgen3utqI/VScMHZvyPJujoPG7XxtyfPRoCrfLoVRRlVh5So0T1OtzVd+pOeHHor+nTntQALH3NPvlY3WJcK9EOJ6LNVPDWcO78WMzMHGj++kDsGU8LzrdTVnhuC7UBK1oV1T+KC08rqnzX33vP7upJxXcIhKLHl0uwc8wudr7wsPUNQVLIXCN3sz+OmW6dhk3j578QiiZwBjOABXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIZ2hvPx+ZKhv5ZxqXO//zMgWZ4xG103PI4RoH7/nWI=;
 b=qtfDDr8upp9Evu7ZTerfHPGlptmd+wSoOt/BPgvRtp24xkUOWwwzKSV6TffWOjn0U+bTVjrACZnWQa05EmMK9JMS2vxtq5bbdqn7AqCZVghZWxb6VJsws2hTjwbSoC4A435IkzM83otMRaE73Zont1ZOOvzmCVC00JgDusa6gP4Et/xOG+pHdHIjgZYXoYIkxOpYxnTsvaAkyMSdCVoXLUB6uuMfQg8jMExA38tAA7SDpvxFdRJeSmQdUf1FKL9y9EXk1m+0tXdfY3LYrBYI/Zp5eZ0fHCZve+eeWuN5cRH7Dn8bs8TrM4l0OmmC/YpeByUwcYV2JYOu299UwSLfbw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2020.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:31:43 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:31:43 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/12] libsolv: upgrade 0.7.40 -> 0.7.41
Date: Mon, 26 Oct 2026 11:31:28 +0100
Message-ID: <20261026103138.3137-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0505.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2020:EE_
X-MS-Office365-Filtering-Correlation-Id: bd58a301-cb79-4b2a-9987-08df334c53d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|3023799007|56012099006|11063799006|261021123027099003|10067099003|261021121427099003|261009223027099003|261022105027099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: r8/FYRVMXDRn7jM559I4gT23BArYYO3Dd0Co9KLtp38qTYNiRZKhMDoPSZeHte5ujS/eMwzw8I4wR/oEryvAtg9e1BIZaliF82U5E2AmSo0+1S2NzkkJe2gc5usM+GpRjXqFKopDCpQzoGGikWvHUUEZNOogdqkJDxwrL8ZoTkxE8AjGfqJ3jjbTQ/sLhrNEVo0Tj3DlEisf+OHTJ+Y9cXsqWYazwjtKUXslqfXO78mUjQ1rpF0jgm7lhpRllH0t/Ti/r72u5yjZIEhZDcc9zAnqJ9s2CbAXeQAu6o22S8BvL9/ScyuESotceS0WZBCD+3ymWxAlCamGVYXa0OnNw9s1/yNdcWnnJjZEMjoiXuV7oP41sy/v/YLmVsXSXz9y62C2vaRX0K+ZuHpdswaykCPUIEkjh/FT8Qe4Id1CGzhIA4Ij+ckSHIiuqNSZj8ciXIwsHtF9VqxnuvDJ9fvDxVAema4Dm5+1dj1FxUyid8ud3a6uI0HdLALrOc8wYk7bNy36Vc1y+kEEhO1fZkexzzc2p2NDhdo98h37IyGXzN3WTfdfUITUCNfGYqVQyAeV+kNk7FJYfdfLefhyoEbZV4DX9II0HiRNDeu8458qDL1qluPPYYRiIqoMdZ7T77n/htPiC8tcS2aSgvv3MUqZMvZE1stdDC2A3LqbtuaIbus=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(261021123027099003)(10067099003)(261021121427099003)(261009223027099003)(261022105027099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yahZV/l+yy6MYpuioS5Jm00mL3bxPy/VwYOeJt0nMsGuJXdGChf2Gyy1j7yq?=
 =?us-ascii?Q?Uug5FKiMn59S8RHQxqYJnFAXlkbCNklSyOHGjHw4MwvsOb0xJABql6DfaRdm?=
 =?us-ascii?Q?3TGcwftAZLp9wwDVcB+vb3vstWi+CGCsBfA7cHGbyBFOxDxxMJathls0u6dG?=
 =?us-ascii?Q?g0s32WhchFM7KRY6U78V5VSmXFh3Y0bA4JoOQyxatqhtPTNHzvAfDxv7kVR3?=
 =?us-ascii?Q?t97pMqFrjLKpARRjLskX/GIzDwsCbg9u59P2LgRTCrJogGQrXDOKk/Of3xLl?=
 =?us-ascii?Q?q6TV98H1HmPst6hq65SWFrN3kq3J0kYFfoeqxhByDwAs1hOJvt8s4TSpXCpg?=
 =?us-ascii?Q?gBACkqOrt/kpT8hkXl68SvQzhpSFuH/dCJJzdMsAOv3UhnFfXIe/Voe/RdNn?=
 =?us-ascii?Q?fW9nHJwYUzev8hY2kDFe+Iisx9R7l8YuTKJwpPuj2TP50iSqdxGwLlwuam5M?=
 =?us-ascii?Q?AS6r8YYp7VmZCswwSqbQsLAEJxOHCOhCFsWnJQ+Ba+ffbvEuL0xo4Pxr9UHX?=
 =?us-ascii?Q?O8iXn7CL4hNsbuHqP8ak03II1TTIJFL6p+51Pc6jdDavH8uFqOu1iV7u6VR0?=
 =?us-ascii?Q?TZGpVhArLoynNpAQaVXWIP+2HBNnBPeG3IsxJtuUp7zBgGIOABwdRU6FpTSW?=
 =?us-ascii?Q?vz1Fqy+Nqje2QYJmo1WNl1GGa50rIKKPAbnBKtJECeuS7tSCw/m3FRT1K6yH?=
 =?us-ascii?Q?W6anaWqSAsStPPrTeI2C06l6MnXFH0HBtqXtJ9jEul2eFs89MZ3cxPg7r1qQ?=
 =?us-ascii?Q?FTuJSsPg5tO5Oq6/9pDECHvqo++TWHNicMmvkthtqVDlpix8La9nXYRPaIbu?=
 =?us-ascii?Q?A4Eozm46r/bVfuI9V9GQgtU3E6VDDXSiGKQuAPeH1C93lpGJnMYrH/BRca9p?=
 =?us-ascii?Q?kGiZjPJneVzufNQB/DWUOYtjSGzfTUHcHrCj3fUxb4vNmlw2xaCe2/B8CFFD?=
 =?us-ascii?Q?0FT+cNMfUpNrI/yv95H8AZTkIrA9ReKkSItDXVemlUSd/5vnE//+FRYL8ntO?=
 =?us-ascii?Q?xISwzyZo8xLrFDhCORjPxYdz7QZt+gR6Dx6CTwMmfdQ6ZOP70JB7BCH2Gubr?=
 =?us-ascii?Q?/U9vcc55rXL+qwg7w/Ggoh6P9FcNbnSVShpHudl5MTuvhCi+kNhs97LdAFRE?=
 =?us-ascii?Q?PSw9bBKTgwT6A3fFvyGXEgg35jR+Vvt2ON8G/MPldzDzOHAxTlNNBFWFaZLU?=
 =?us-ascii?Q?s9E2h+g4N4sMaAD5h1FNtOZIW+Dwm2PvRL+mLQDNJ8fKwz/phbj/oj3slukY?=
 =?us-ascii?Q?M3TS1XlNFTYL2zDpH/KGSNt5kXAL8eKJNOZ1P/oS2KLcsd8eWjf3v0McOFi6?=
 =?us-ascii?Q?XjLm7pPzp2oMyfNzfkdLqQsDY948AgtNOdU85QsfpJCEjdT87ol0TXtBKZQ2?=
 =?us-ascii?Q?NSnxIECTxrk1J6ubSivQIxQYN28/IySCyuPLK1Jl0TKyuC9gMEjAYYX1AOOL?=
 =?us-ascii?Q?yMDjQmhfbOrNFzc81TxSpvjKQldAgSBr3e8kWqCYqjjk8WxkXnGuutm/jT3O?=
 =?us-ascii?Q?2fk0wDrdh0iKRJIDnnXt6k4do3adUaU57o8lQDJJADIqtQb0+st9JlELBliD?=
 =?us-ascii?Q?/KqhAzoQGyle9Ve0vFGY860Gz4ZR2izUyqZP+WKuj20zptQkAQLV35W9lYaw?=
 =?us-ascii?Q?t902d/F5GLVJFvV2gwQJT7E53WJD19gTAIxkXJ9Bq8v/CoalwC1tnx155ksW?=
 =?us-ascii?Q?ywtd/GyzqV0zLBQ2V34S1qpYQcIoZCS+gn5IzlpHOr3mOK5gS5fXxU0SHn1U?=
 =?us-ascii?Q?iNfMQJZXlw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bd58a301-cb79-4b2a-9987-08df334c53d0
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:31:42.9185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOSp/mrVm/ZMpBW2I3R+DTmxnYDtxtgSd3IKWNT7EMprm7dOjR3yBYqA77on6fZ//62ugzhRUSAo1uQA7ZIu4LnPcreYKagGgpXcyo+vD7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248661
Content-Type: text/plain; charset="utf-8"

NEWS: https://github.com/openSUSE/libsolv/blob/0.7.41/NEWS

Version 0.7.41
- selected bug fixes:
  * improved speed of repo_add_solv, should now be more that 20%
    faster in many cases
  * repo_add_solv hardening to catch corrupt solv files earlier
  * hardened apkv3 code (CVE-2026-104622, CVE-2026-104624)
  * fixed repo_conda xml parsing (CVE-2026-104621)
- new features:
  * support pre-sizing of id hashes (pool_presize_idhashes,
    pool_get_idcounts solv_read_idcounts)
  * new POOL_FLAG_NOWHATPROVIDESSHRINK pool flag to disable
    shrinking if speed matters more then memory usage

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libsolv/{libsolv_0.7.40.bb =3D> libsolv_0.7.41.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.40.bb =3D> libsolv_0.7.4=
1.bb} (96%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.40.bb b/meta/recipes=
-extended/libsolv/libsolv_0.7.41.bb
similarity index 96%
rename from meta/recipes-extended/libsolv/libsolv_0.7.40.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.41.bb
index 96b889d6cd9..bc866725ece 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.40.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.41.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "git://github.com/openSUSE/libsolv.git;branch=
=3Dmaster;protocol=3Dhttps;ta
            file://run-ptest \
 "
=20
-SRCREV =3D "0e6eea45c9ffc7dd0756060f2b0f5527df02efa7"
+SRCREV =3D "fa356d93545033a9962dfa99c4685e6299932922"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
