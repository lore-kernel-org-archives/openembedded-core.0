Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7335.1794396272438301399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 03:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xgjsUDAP;
 spf=pass (domain: est.tech, ip: 40.107.162.11, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWkkqCbwOZHo4GuGm9/FjcQrJylBYQvAnYhmHbAI9VhGxo/rbv0HCnMVUvEclN7eGe4jmZNMkUk/97Yx9AYvhLewUYQBQWkSUfrImYUWJYNJqpBgM4pLuTtF22ErSxSVO1QZANKqs1X3V2Hj3u6ZhlS99o6j8nEXbD2nv2P4+6XFUSh6NMi1mVHE8yqCBEoLW1fSipXPivhU42Ns35j/JtRSuelN69aumWne/f4A3CR7mRHiuu6CZGa2BAi6SdkhSzPkmcE6a0d1nOiCpYKBVsdoqbNx9liHqhJM0CBXB09WUBBcrNXVn+aqifv3B5VzFw+kzp1zxDDbRkTA6+MBlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ei4JYW6V8yIhow+mLiy9c3/YTGgObDpI5TDZ2WjyEE=;
 b=UDgdqMyqlK4pV/sKhhHCQ5tt0iu7R0zonF1l5rgGjEZadqiJVIqavFTY9tWRBznHRb9OPzkjZBKdhbh+yZaw1JLZgTVNv4CTAMbhgxR5ojcvp3IKWhft2lG0WAq2jf8nHyHPJ/Vpn0+WNE4/jarhNZPGeiBsg/wmwt6ooYSK7D8cvlJOhzABUNn/HnVrhRQyVWXyX5E6+iljRIKBCrWNxdl2IW26blZYCRuL3TtyNqEA+xMfQ7hyt7icgrQkEhSiFJIaWyuShJRa6X0CxqQJjrhUX2VBTS95xvaccixTXT/k5ISS06M6B4wRGgPoY7O+pVpgEUQ36R2UYmPe0RDVvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ei4JYW6V8yIhow+mLiy9c3/YTGgObDpI5TDZ2WjyEE=;
 b=xgjsUDAP2lokzfo/8IaNF/zNq+/EFebwpDhdxzX0RUZJke3qj55hN6JDkqFxq30Gw2v/Np5IUPTmg5SW8dzfLNh7nD/NIWgqodTrJrzoluM8R6+D9ry4HigQpchORCwN9SiXBJKvo6ejah8I3XZkZ+anEQu0MuqP5C+gRJ/SH2bm/MNjHVaZmCY6+xknnNEkvc02ahfhVh2Jz8zU2IPQwTmofS25culRJ8o8/Pt9UW6ORWTisizmKNp88sh01XguSpVBRenGAuwKP2yHYRO1CVsWCfqQ6UPW7CYGMNIIeHdh8fKDhnpg1FvWl9/0pyiLvX7qYBeNBQ4zAq55MvJynA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3204.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 11:24:31 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 11:24:31 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] repo: upgrade 2.72 -> 2.73
Date: Wed, 11 Nov 2026 12:24:23 +0100
Message-ID: <20261111112426.85977-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111112426.85977-1-jaipaul.cheernam@est.tech>
References: <20261111112426.85977-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB8PR06CA0046.eurprd06.prod.outlook.com
 (2603:10a6:10:120::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3204:EE_
X-MS-Office365-Filtering-Correlation-Id: 722456fd-41bc-4b32-a17e-08df3fe65b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|261102123227099003|261022105027099003|11063799006|56012099006|261021121427099003|10067099003|261022075727099003|261026135527099003|261022113327099003|261021123027099003|261021135927099003|261028144727099003|261026130827099003|261026140227099003|261026121527099003|261021130227099003|261021133027099003|261009223027099003|261022115727099003|261009221227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: /NsHEgwA2OJEfSuQD53oYHJrM/d5avgbxT5eJTNQCzjwEjysJBylwf6rfxSBW6D53I+0J64EBk2D8ckXaL/xOgNXu5wO8/xww7XmAYMTfQJYBCu5rLTpKDflQ/C1TOXRX43Z+9WrEcyb2VUJXRjQAGhafgyF2DJEY/OCi7s7XZa+N4xTCuPMZG/sdx5/G88kBGBIQdm5W6YpoQzalnYtK2DcKsHp3+PwoUKMbWeLczcIcjo2KEop0gGt5FMDWU1NSKBC6Fg4Bm3uCETwI/p02PikGdV0PTusVr5IY2BGSvwOovskcgPQ1/9Dn9ofVB11lQ6tCowPbSH8CwzLQn5eC1Adodof6sWIRQDrjYQyUgzv97iwiPPmGMo8X9Sw1Ueede7gaSVTEW13V6wcjnAiwSfVu6KFcRky10FJTw8lQGF4W/Hz3VcbeBZPJD6OVY1OgsvALNTi+5oMLF395/kBxQDTSvo6tkwq6tdmR82NDLVJls/G/dpu2BTme8thnDcgoR9ddN5yiE7nAGZguh2erOtT4rhA+0cicvQQMCy1ElAUsW66ShjskzkjV6TS8qBIEwim4YSz5FfosO9t1YK5Vq1MvtJexzxjlfoBz7zWpNhXfapjRc/rj4RN4Mf0Vfe9aPJTQHi8MgikZXzW/5kQ96LfOlof+oov0LF9+y+ncf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261102123227099003)(261022105027099003)(11063799006)(56012099006)(261021121427099003)(10067099003)(261022075727099003)(261026135527099003)(261022113327099003)(261021123027099003)(261021135927099003)(261028144727099003)(261026130827099003)(261026140227099003)(261026121527099003)(261021130227099003)(261021133027099003)(261009223027099003)(261022115727099003)(261009221227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OD29R9EHEgGlRInxUCse3lJLb4TW7DF2CHtb5plLKjYh518mS+cVAo7vf5tZ?=
 =?us-ascii?Q?MOddFENg4stTV3qz0hlb4d1vqm6XBnTLSSEYO5Ox8b1Clv1Se8yawFdgcVgM?=
 =?us-ascii?Q?Nsd4lfXyD1tU1k7dJfrf2QZmwvn5o4sYQRyMxUL0QfI8y1SOE4VJNxiX/eCU?=
 =?us-ascii?Q?SHZX6N0XIRDN69OukjfbwIH21SwnOY+QYjOwTa/fCXwYO6MFQ3/d2VuBIUop?=
 =?us-ascii?Q?w37ZbupRopbZaOXhYkI1oMv33GUisWIE6M4VUvyP5LFofO6xYG8bDaCiWhUd?=
 =?us-ascii?Q?OkC7kT7EuYKXtNFU0YJYMtHdCbgXiSHIoMTmA1A6Zu0o6dxQO/3nRo3/O9wC?=
 =?us-ascii?Q?3FfLmL7uqkRN6LfaRi3y2OHRuvjESMdw/655HicEVK4GbwBiJ/q4uFfxhJFT?=
 =?us-ascii?Q?KhUiptteCQtn9THTiuCSonJB2oYOsPJykBLruONob4cyJqscu+of2arixtQo?=
 =?us-ascii?Q?xjto1ArP0cVvh7TAfOuDi/jn22MCTwtrb0x2vQicV6Pd735Sb9ywE+pT46K5?=
 =?us-ascii?Q?Gz/uJfrknexKI53QAa7KBA3aJzhsvwmoXaXpzVLH+YnkKltYMsAbtYZ2eVPI?=
 =?us-ascii?Q?xlCRC3pLvHZxGNeD/7jqT8qzrnZrMyUN1YqEsta98iGXLCM/ppqUg5BAxNCj?=
 =?us-ascii?Q?FdjCVmHUD8FQxJqzYCqOejUQcAcoyDK0/yviC7k0tGb65H6q236dDUSzAnMP?=
 =?us-ascii?Q?ZSYe6Yqo4VkhVvXmu2grG5Yzc5JNNA6B6fCHID7Ps4sg56OtU7pxKYpix3h7?=
 =?us-ascii?Q?w3GLiccEQ93eyIYS2W8WElBOZgQuwkFlo+XDAMuuJSGJFg/skXNBnca5Pd6m?=
 =?us-ascii?Q?WlkDeKTCN20IIyhRK+riyKzauepSXLc2ODQi93ljUs2j/Uj3Bj8ZC7QNMC2Z?=
 =?us-ascii?Q?uLIPUY+noqx92yf7tNZjORoUA1q9URxJlrkBdUrZYyYV5ImqyzucpWp7h3FI?=
 =?us-ascii?Q?khgBqI8uD8r5YB5W/6gyVUXzdXOKszSZhuT7NChmAONw9ju17Lz3YoxjAraY?=
 =?us-ascii?Q?PCQ5xD6iKf2jkUW1Svu/gav/tOG7L1XBPF3QueFN7vxz3ceHa1/HWjIZw4wY?=
 =?us-ascii?Q?2DFTvbGhbkyyPVlggC1DZwNXMNjGZUCNJPTiaQh4KmDVDRrixRJGQkC6FygC?=
 =?us-ascii?Q?Edfs1z2HkfeUlXiR3m2bfCkcTxk+SEOQ6UMxA4+pjjF0SS04wDuFq88vRFsg?=
 =?us-ascii?Q?V40gWAcWr5/EAMY0pltLqM/ptT/1LoOxbkMiKoCyWjeh3ayzFf1c2lYKhFIV?=
 =?us-ascii?Q?g7iaK8WemWplNzlMcQIkBAqZHGNpQHzeyBuknlWLm07j6GaZTgq5sHBq++DN?=
 =?us-ascii?Q?rPIp/IYmfHfL+3Z2y7f4yzpkUIOeqgqdjtRljnYxpwCwniPwyTS5GWSc+eT4?=
 =?us-ascii?Q?2HSQtzYtu4Prx/5DrRG5LIhAsMCGeq0NmuKNBft6I5FPDVmPaQF11jAO8ASe?=
 =?us-ascii?Q?xkRI8xuqfPj10nX9/TLkYLbzmJ3A3fpOVtF7xX77Uksm15L+SeUpQYO1kwTJ?=
 =?us-ascii?Q?BfJKeFl/9Avtgik7rylNxhDgyXx+imdaADn+xRcujuCk99aIWY8zl0xyJh3m?=
 =?us-ascii?Q?6txwXz67xkH5nNIQl67ZsRdmoA7LHuElLx91JSMFhamUl9c8GHnKxeN6koti?=
 =?us-ascii?Q?dN7pUf9UfVVbxndpQLPPQfYteIzwU4LK0mxVvmyvsAQ18CbJ/QPHETqqZFh7?=
 =?us-ascii?Q?WAl2+X3wVeav1yuIo+BRtiDANnsMtFwyykGw5BcVejqsAo/65JtanxkO1Ihl?=
 =?us-ascii?Q?UAAfQxXD0g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 722456fd-41bc-4b32-a17e-08df3fe65b3f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 11:24:31.6945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gy8JxtZIk3HBD/WmVyKEoylwuZ/oknRFzdSq7Ti4jpFCTv0LJx0HQMKCg3LCRJ0wvcU9L4p7dZDGu+S3CViv+f92Jc9Fpl7rjgekwgV0eA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 11:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250018
Content-Type: text/plain; charset="utf-8"

style: use `import progress` everywhere
style: use `import wrapper` everywhere
style: use `import git_trace2_event_log_base` everywhere
style: use `import git_trace2_event_log` everywhere
style: use `import git_superproject` everywhere
style: use `import event_log` everywhere
style: use `import manifest_xml` everywhere
sync: don't read target tree after reprojectcmd
sync: verify fetchcmd postconditions without reading objects
sync: skip shallow bloat check when using fetchcmd
style: use `import git_config` everywhere
Adding sparse checkout functionality
style: use `import color` everywhere
style: use `import test_manifest_xml` everywhere
style: use `import pager` everywhere
style: use `import editor` everywhere
style: use `import io` everywhere
style: use `import collections` everywhere
style: use `import urllib.xxx` everywhere
style: use `import types` everywhere
flake8: enable flake8-import-restrictions
flake8: fix nested import checks
event_log: only record events when --event-log is specified
git_refs, project: skip redundant git calls on unborn HEAD and warm refs
git_config, project: keep config cache coherent and skip init templates
project: trace fetchcmd and reprojectcmd executions

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/repo/{repo_2.72.bb =3D> repo_2.73.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.72.bb =3D> repo_2.73.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.72.bb b/meta/recipes-devtool=
s/repo/repo_2.73.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.72.bb
rename to meta/recipes-devtools/repo/repo_2.73.bb
index 10e9208ebfb..3b5ff064f78 100644
--- a/meta/recipes-devtools/repo/repo_2.72.bb
+++ b/meta/recipes-devtools/repo/repo_2.73.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
=20
 SRC_URI =3D "git://gerrit.googlesource.com/git-repo.git;protocol=3Dhttps;b=
ranch=3Dmain;tag=3Dv${PV} \
            "
-SRCREV =3D "365629015667e04739f59070e745548a728549c8"
+SRCREV =3D "d7c431b9968d928373fe9b463a51d304d3b2c48a"
=20
 MIRRORS +=3D "git://gerrit.googlesource.com/git-repo.git git://github.com/=
GerritCodeReview/git-repo.git"
=20
