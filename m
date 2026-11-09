Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6114.1794231641841910133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=B7rPz4MW;
 spf=pass (domain: est.tech, ip: 52.101.72.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYSp7pDH/ek4vPLvF3dKy9KAp81UTj8V0kz2YBjxJZKZCDq02ojOqR6RhiVbfeaEnaRN1x90xaxqkhR6lKKMIP2AGChPKRBhGPZaRmvnMzjzwodmcVXsl4gzjC14BxGViecKmJO7PwwtCHxlR9b9W87F5GXM0ofj6a5Vwn5v5wbI6ycP4NSfcUEu2AFcgKnvresZGDLOur92i0j9D1S+8277Zb5xCPRRdb2Cs7SmqScTohqyI9+pFHsQ+Stps4Lh27xCyMSM7wlNa2H7h/KFJgzv2uRf+6aQCvpfc5grfgc+5jbEyn8gKse6P6uflLvSQWiXVSliJDwuD9rEbOceZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EDiATZi1JO89FosG76Amt/j1MqhuZ2kIL6I10zjwAk=;
 b=m1btYIW/zwNn0gkCpeRMYYuC3gQuY+qYWoqH9G7FB+0IktxOG0UDSjE5iqddkrHbyhnOX9sCPbktCFBCEikSvY/8bclO7/zCO1vmEzEjXEuODN9dHuwIvcJ8I5UR4R5U+Ih2UwUftGwuGV/k/hbfoblH+8wkvxwDGs5bcNMcGm2cmjvqElcDm2TgRIYIcw+F6tT4qfEumqxfpKL5MexlL75/2XiHWGxOCPw72tn3WAROtTOEun143OJfx6z+2G7t4GG0qsqXgGZc+mrsq5LvjLf56b5+5XnqinV1elsvqXi48uah5bmmFJyVEAGHyPYg/XjJ3TzS32dbxhThpS7n9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EDiATZi1JO89FosG76Amt/j1MqhuZ2kIL6I10zjwAk=;
 b=B7rPz4MWlbriaReZwTHEAiY8LiHsBhRpP7fVs9cQvKkOIfcxMt5o40Ua2PI5xePyxjvvUvMW0omNXYPzcOCOBSBFCjpHAyRxCyBlpGtCOaip16CePQn2n5tdrsnHYb0dFvBBnJIvOgOLF6ZjsB9xyLPwY80Zlx9xz33hopadVjf00o4oFwFlhia11Kv72owDND5sy9Ynr2+VxlLMy1JY8Wlv/36bkNoijb1RhiI4gbL7amxufF88530wPXZKPj+tuEaXIpGY0/vovhzFwfsLKq7rISFOZmuAi75WwmPO2aHiZ6O5E4WeRpvEJiAgmTrEhWWEB3uLa04398pLR+r2jQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:36 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/21] Upgrades on 9th November 2026
Date: Mon,  9 Nov 2026 14:40:13 +0100
Message-ID: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0203.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f62383-0664-4aeb-9557-08df3e6708f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022075727099003|261022105027099003|261009221727099003|261009223027099003|261009223327099003|261009220027099003|261009221227099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: GZ/W6OkAR1L2qY8M+Lsocv7lxjBKIuP3BGPu1iDplqvOuzzC7UeqgOM8Fw1Ugj2P9NRzFwmKbhOP9BsVkvj3TLKygaodIjSQcEGuBohQRaSFKHd/whSPwulNLbJ0LNoR3RxDtDHrj5ug3OX8TRLicrQHmb+lpuvA1CYTSII3NdrWLXhL1kVMnxUnn+4U1vXAHpfD+FP8LB8/4PnnkeLQhJJoG9KOMpSwDxO5Nx0XnTIET3XZ0njTtJDmDiN7yWIMYLRkZrmrndjJeEeffKFJXjByzgwpHx8Ak+GDm4S3G4X341BmVMNJYXhS3pidTEY5GSWYBl6raU7Y/dTgOaO8Gebv07LRRBhzydoDeTnxqtZWzE9F7jfWv0O+3pXjEEvHHbSPQKbEdpHmqEu4S64+DIIuBWDHXwOQ8NYXZM6gQV2RSSk0OWdRhAku5POkcWbFvU79megn87BQhB4H4adVTjeG7wtIXJmMSKvM+6PflLgClo705ALwa0CdIJ9gN4CxLsunloTB/hwy8Rn8Pq+elyBGDUPF1yiow4uPSt4ctMS/m6KLkBCWVUvcrFEQ2QEshzf87l4xMAcmhNX5/TTJT2HLfmtP7QzriZY/J/JjYnO7aAagEaM+e7HDW/pjWv2Ga26Hsbce3zY4wQAzk5779HYu+H7XPkWS2MTKmGT9wt0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022075727099003)(261022105027099003)(261009221727099003)(261009223027099003)(261009223327099003)(261009220027099003)(261009221227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hktEpsAjzhFmEldg9TpP+CsBfDYbd2FBwe8cZXHcvEcNYQEwep/c5W0Qb03K?=
 =?us-ascii?Q?rjBYr+QMp2FBIZi0byUFkDG0TYVHobdchxWhcWUKoWahOsYKf9ckDUkqufBj?=
 =?us-ascii?Q?tjH3w7NsreMfWg+xfojded7jfU0cyHmX84CPUQUrKqM+plL+Pyj+RD6msrPB?=
 =?us-ascii?Q?74MDvLq+FixjaNViYpC+NzH7Mxn3qAfNCIe3LVQj686q38BnJXLhhJVYA3dp?=
 =?us-ascii?Q?Fog0BixuLID7ewwFmUUNNet+faD/xbjelxhg1Hx5f++NYq/VM/Ln+ibhlzVj?=
 =?us-ascii?Q?C0+E+U8xbWpxQnLXOphp55vNWps/SeYOgA7uMGHu8gFDFujC1+BFZuJqtJep?=
 =?us-ascii?Q?z0ROgX0A6N8Q2/dpuIoP4akYGOkCPVqG/4eByDo499JGeyAcXpMvMcX3FhMO?=
 =?us-ascii?Q?raO+xopxZqgNTkFMp7d2AUX/03KhqANsJzVdoM3par4nU3CAAHbzJWhnV1wA?=
 =?us-ascii?Q?KsZjH5iUF8jGhfR2NHZHSCP7aEUSX3auNHhGZ9Xsl+nLd8rni8JMynHnptjQ?=
 =?us-ascii?Q?DAnjSF5JUI3KsPsV2qamNmlUZsqtCnyeQmQEmMxaahmZopD9WFhMLrOQAS9L?=
 =?us-ascii?Q?wRqYQT0yo9kQy3tpdcBYMtwremYjuqZN39BT7jfRHJSYUDY+XfveCAbDgX1K?=
 =?us-ascii?Q?/0JWywFWgCm7wrLP7dj+2rD1tqTZEdn1yIMgzeeiksvUDHZOxfpodw++xjRc?=
 =?us-ascii?Q?Jy0lbwzhjn2CEAd8wP/zr2QAbWi0jzOqXfmvheRNt0TkMeQqVXvIxJh1nyoz?=
 =?us-ascii?Q?qT6BWXqIdOL5qh9kSg8pft4UKuluq/XPYloZcEOaD9yK3S9bYHw44p5h4Uzu?=
 =?us-ascii?Q?fyp6LCiV5QJVnKbylwaDHEeaf3PUL8xtsO8ovYx8E69CojHVtyEPcPemY5ob?=
 =?us-ascii?Q?/gWZnDUJaGZPXFI3AM93XmFiRwKhOQjCS8rU81XULRaX+HyXUMc2vWCP/Luw?=
 =?us-ascii?Q?+GHuVl42S8dfQ83H7UZAbiKf316Nt97qFFR4ktOKFL0wf9dlC1s7gWTOrr5M?=
 =?us-ascii?Q?P4eBlRTcx+gqzKR48zrGTeMtlhSJ3IP9OxLuI0VFfyJBl0XpwEXOXNyPT0nQ?=
 =?us-ascii?Q?ychwGDgofKvTN8vm8EPvzHBXID9v2A7wP9ErAU2GobibORll452vCKk88vHm?=
 =?us-ascii?Q?fjUAjpUoNHTPlt9QNZjEsDTAbS686sirY5l+Grr4PLyKyIM+kZEtFNShx5KZ?=
 =?us-ascii?Q?QhTQ2QZESgTSXYqI6TzHnpKAtLFgoQLNtxGPqDM2Mwaj74AnV01tsTLI5BZm?=
 =?us-ascii?Q?Freusi/QwII5OkvC/cNdjo1T+wuJBGsNp+rDWs7+TUvKfgFIqiQeDiZvdh12?=
 =?us-ascii?Q?NL6mOUZgbntJfYAPXf7ZbLGyBxB2lwxK1pU8Nkd5m9wS7BD1lMrB+rylRlnL?=
 =?us-ascii?Q?jt/e9V3Vcz93K2WC5oQKdHUdfZ9xcHqPlBZXe8CY0jLX8TCfRFwxxubVrgJB?=
 =?us-ascii?Q?HUYmIVDaYwJAqGfmmumSjCUB7k0ibOaMfR7xEg+Dy4BthNv0zQW3SdiyQqbi?=
 =?us-ascii?Q?1+d7+qxIsgWjeCce9BTPBiVYV8DklK6EaBJ5zBeQ+2xKVGXgsOsUqADei98G?=
 =?us-ascii?Q?6Ep/pJHstEM0WTMEGdUePy0N3E5+sEfsPb5OJBXuHw0qY59GCIF7Ubf2vfnM?=
 =?us-ascii?Q?YFxnYuN1zxRS4HLtteqbBDGrHiQuTS4O5iVQxNAZj0LnWmZO904AwYDfzb5Q?=
 =?us-ascii?Q?x3BAB1r9pk5WYvJ4fgdERHTHuPT9QA/g+0xQr9uryLj6Pnt1QmjsoZa/dWkV?=
 =?us-ascii?Q?vV0GfRZX4A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f62383-0664-4aeb-9557-08df3e6708f9
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:36.5218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Hs4ot6FYuH99MywlLEKleipjoN3/qufblDQ1hKk6I4o99qAk8UwE2gorsphRrTrDxqH9h3F75pSX+bUxpN3HsWOOoibejNvWkSB91AEbjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249805

Jaipaul Cheernam (21):
  python3-click: upgrade 8.5.0 -> 8.5.1
  libmodulemd: upgrade 2.15.3 -> 2.15.4
  xserver-xorg: upgrade 21.1.24 -> 21.1.25
  xwayland: upgrade 24.1.13 -> 24.1.14
  gst-devtools: upgrade 1.28.8 -> 1.28.9
  gstreamer1.0: upgrade 1.28.8 -> 1.28.9
  gstreamer1.0-python: upgrade 1.28.8 -> 1.28.9
  gst-examples: upgrade 1.28.8 -> 1.28.9
  gstreamer1.0-libav: upgrade 1.28.8 -> 1.28.9
  gstreamer1.0-plugins-good: Upgrade 1.28.8 -> 1.28.9
  gstreamer1.0-plugins-base: upgrade 1.28.8 -> 1.28.9
  gstreamer1.0-plugins-bad: upgrade 1.28.8 -> 1.28.9
  gstreamer1.0-plugins-ugly: Upgrade 1.28.8 -> 1.28.9
  gstreamer1.0-rtsp-server: Upgrade 1.28.8 -> 1.28.9
  fmt: upgrade 12.2.0 -> 12.2.1
  groff: Upgrade 1.24.2 -> 1.25.0
  desktop-file-utils: upgrade 0.28 -> 0.29
  python3-uritools: upgrade 6.1.3 -> 6.1.5
  python3-pbr: upgrade 7.1.0 -> 7.1.3
  python3-uritools: Upgrade 6.1.5 -> 7.0.0
  rpm-sequoia: Upgrade 1.10.2 -> 1.10.3

 ...ils_0.28.bb =3D> desktop-file-utils_0.29.bb} |   2 +-
 ...ix-fallback-uint128-bitwise-not-4813.patch |  10 +-
 ...01-Workaround-an-ABI-issue-in-spdlog.patch |   8 +-
 .../fmt/{fmt_12.2.0.bb =3D> fmt_12.2.1.bb}      |   4 +-
 ...dulemd_2.15.3.bb =3D> libmodulemd_2.15.4.bb} |   2 +-
 ...-click_8.5.0.bb =3D> python3-click_8.5.1.bb} |   2 +-
 ...hon3-pbr_7.1.0.bb =3D> python3-pbr_7.1.3.bb} |   2 +-
 ...ols_6.1.3.bb =3D> python3-uritools_7.0.0.bb} |   2 +-
 ...-vars-to-force-runtime-paths-in-test.patch |   2 +-
 .../rpm-sequoia/rpm-sequoia-crates.inc        | 418 ++++++++++--------
 ...equoia_1.10.2.bb =3D> rpm-sequoia_1.10.3.bb} |   9 +-
 ...001-Make-manpages-mulitlib-identical.patch |   7 +-
 ...groff-not-found-in-cross-compilation.patch |  15 +-
 ...E_DATE_EPOCH-for-reproducible-builds.patch |   7 +-
 .../groff/files/build-less.patch              |  22 +-
 .../groff/files/builddep.patch                |  33 --
 ...groff-not-search-fonts-on-build-host.patch |  13 +-
 .../{groff_1.24.2.bb =3D> groff_1.25.0.bb}      |   3 +-
 ...-Intel-ddx-only-for-pre-gen4-hardwar.patch |   2 +-
 ...org_21.1.24.bb =3D> xserver-xorg_21.1.25.bb} |   2 +-
 ...wayland_24.1.13.bb =3D> xwayland_24.1.14.bb} |   2 +-
 ...ct-has-a-different-signature-on-musl.patch |   2 +-
 ...tools_1.28.8.bb =3D> gst-devtools_1.28.9.bb} |   2 +-
 ...001-Make-player-examples-installable.patch |   2 +-
 ...show-player-warnings-in-a-dialog-box.patch |   2 +-
 ...mples_1.28.8.bb =3D> gst-examples_1.28.9.bb} |   2 +-
 ...1.28.8.bb =3D> gstreamer1.0-libav_1.28.9.bb} |   2 +-
 ...ialized-warnings-when-compiling-with.patch |   6 +-
 ...-avoid-including-sys-poll.h-directly.patch |   2 +-
 ...issing-opencv-data-dir-in-yocto-buil.patch |   2 +-
 ...added-buffers-in-wl_shm-buffer-creat.patch |   2 +-
 ....bb =3D> gstreamer1.0-plugins-bad_1.28.9.bb} |   2 +-
 ...et-caps-from-src-pad-when-query-caps.patch |   2 +-
 ...parse-enhance-SSA-text-lines-parsing.patch |   2 +-
 ...iv-fb-Make-sure-config.h-is-included.patch |   2 +-
 ...bb =3D> gstreamer1.0-plugins-base_1.28.9.bb} |   2 +-
 ...bb =3D> gstreamer1.0-plugins-good_1.28.9.bb} |   2 +-
 ...bb =3D> gstreamer1.0-plugins-ugly_1.28.9.bb} |   2 +-
 ....28.8.bb =3D> gstreamer1.0-python_1.28.9.bb} |   2 +-
 ....bb =3D> gstreamer1.0-rtsp-server_1.28.9.bb} |   2 +-
 ...spect-the-idententaion-used-in-meson.patch |   2 +-
 ...ts-add-support-for-install-the-tests.patch |   4 +-
 ...s-use-a-dictionaries-for-environment.patch |   2 +-
 ...er-script-to-run-the-installed_tests.patch |   2 +-
 ...er1.0_1.28.8.bb =3D> gstreamer1.0_1.28.9.bb} |   2 +-
 45 files changed, 327 insertions(+), 294 deletions(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils_0.28.b=
b =3D> desktop-file-utils_0.29.bb} (88%)
 rename meta/recipes-devtools/fmt/{fmt_12.2.0.bb =3D> fmt_12.2.1.bb} (88%)
 rename meta/recipes-devtools/libmodulemd/{libmodulemd_2.15.3.bb =3D> libmo=
dulemd_2.15.4.bb} (94%)
 rename meta/recipes-devtools/python/{python3-click_8.5.0.bb =3D> python3-c=
lick_8.5.1.bb} (91%)
 rename meta/recipes-devtools/python/{python3-pbr_7.1.0.bb =3D> python3-pbr=
_7.1.3.bb} (83%)
 rename meta/recipes-devtools/python/{python3-uritools_6.1.3.bb =3D> python=
3-uritools_7.0.0.bb} (79%)
 rename meta/recipes-devtools/rpm-sequoia/{rpm-sequoia_1.10.2.bb =3D> rpm-s=
equoia_1.10.3.bb} (90%)
 delete mode 100644 meta/recipes-extended/groff/files/builddep.patch
 rename meta/recipes-extended/groff/{groff_1.24.2.bb =3D> groff_1.25.0.bb} =
(95%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.24.bb =3D> xs=
erver-xorg_21.1.25.bb} (92%)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.13.bb =3D> xwayland_2=
4.1.14.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.8.bb =3D> gst-=
devtools_1.28.9.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.8.bb =3D> gst-=
examples_1.28.9.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.8.bb =3D=
> gstreamer1.0-libav_1.28.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.8.=
bb =3D> gstreamer1.0-plugins-bad_1.28.9.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.8=
.bb =3D> gstreamer1.0-plugins-base_1.28.9.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.8=
.bb =3D> gstreamer1.0-plugins-good_1.28.9.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.8=
.bb =3D> gstreamer1.0-plugins-ugly_1.28.9.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.8.bb =
=3D> gstreamer1.0-python_1.28.9.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.8.=
bb =3D> gstreamer1.0-rtsp-server_1.28.9.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.8.bb =3D> gstr=
eamer1.0_1.28.9.bb} (97%)

