Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0118.outbound.protection.outlook.com [207.46.100.118])
	by mail.openembedded.org (Postfix) with ESMTP id 84E4F6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 22:48:11 +0000 (UTC)
Received: from DM2PR03CA0035.namprd03.prod.outlook.com (10.141.96.34) by
	BY1PR03MB1420.namprd03.prod.outlook.com (10.162.127.150) with Microsoft
	SMTP Server (TLS) id 15.1.365.19; Thu, 21 Jan 2016 22:48:09 +0000
Received: from BL2FFO11FD054.protection.gbl (2a01:111:f400:7c09::150) by
	DM2PR03CA0035.outlook.office365.com (2a01:111:e400:2428::34) with
	Microsoft SMTP Server (TLS) id 15.1.390.13 via Frontend Transport;
	Thu, 21 Jan 2016 22:48:09 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD054.mail.protection.outlook.com (10.173.161.182) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 21 Jan 2016 22:48:08 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0LMm655012064; Thu, 21 Jan 2016 15:48:07 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jan 2016 16:47:34 -0600
Message-ID: <1453416456-27728-3-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1453416456-27728-1-git-send-email-tom.hochstein@freescale.com>
References: <1453416456-27728-1-git-send-email-tom.hochstein@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD054;
	1:fJZ1a272RdkBmj+AMyLpokoEC+AVBezswqWbdBwvwgv0rZk09i0AXJSyXh3a0xCNn0l7pF0z3SscSzYrVaLc470firTWPS44GonWsvq2tkjl7P3fDqjBr/7//P+fUwlFtEgqm3V5bcKUi8FAqt5IImLDA98IKSGH4OovSOZ33zMbFdjLC/7Ohi7C+56bKwXKpFGQ/18J369nRbdHyvwXzH/xusNGTvQJXPbYWjniPJujfDXDsjZXNxrrAJyOoC4YOgpTy9q2/UIXNeg3luuOSjwepuFcsRYnrB2AdlZ4eFQ80WeqTm10f/Zw/5rCuNm6/NivHZG0qwTrMykIbyhYLpYb/TIk4p/MYJ+RzMCSYB7geDU5hZMgUfymCYcJjH8aNdkR1LXTVBw2i+Fl9eODvzFdQbtq6i5JIo0rixMu/HuayHFQVzF74urjYABRxzfXUXdHpSr5JmNSSAXTNv2Qo97WZbw+/RfS2BSGrfYvZy0=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(3190300001)(199003)(189002)(2351001)(229853001)(11100500001)(4326007)(2950100001)(48376002)(106466001)(87936001)(4001430100002)(76176999)(5001960100002)(19580405001)(50986999)(5008740100001)(85326001)(5003940100001)(47776003)(33646002)(53416004)(450100001)(1220700001)(97736004)(81156007)(189998001)(1096002)(50466002)(104016004)(77096005)(36756003)(19580395003)(107886002)(6806005)(92566002)(86362001)(50226001)(2906002)(586003)(110136002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR03MB1420;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 5481de62-a36b-4332-451f-08d322b4ef36
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	2:EXLENifefRgpaEKgQfiNgtoVKTeHgEofX7bit3cBchhOvPsNs55OCQgmjLBYNoz/tPCBi/KJfFzIHK7bgdXvR8VRzbZtMTko+PyNaKfz/s6EWz8MOHsmo7npSgqW4fXDJS3MeSj6QM29Mh93WN/W2lTuWjmCsF2TMIdZqWNitJtWxILUztqayOly84mcRbnU;
	3:yLEfzPq0QfJLeXNukgJNkrDS4VXTVPZYGX9nJXBCUxvhUtQ9t2XGPm1qE/EQ/YBG3TVNP85KITqNJpp4sbCNU51d6G9A6RGWp9gtQtNlOpHQsoNN+/hrxZte9Krrm8wyGthV/0j9MDdOXnbpqAFM3r1WZCJwH59BYnLd1tUk7doKknVVwYaJzHfLrLkWnVS2QxliedYuuJJKeZZLchUmEBDbdXBQckDbTdMG5IN2rf0=;
	25:jMeZ8cXjgAGUAaKZCFurw9jxx/YalZ59rh3yyDUP5DQcWpxrdj5dkiMli/75EtkfsMbBavY3ctEvdP2ouUbhGAtGWHVtmg2Ua6wvll+pXKi9U5GPv0Wtqg4anN8QViLGXd75p5cXGwZcU7OttCG+kgi4aDOUMc9RiYyP/orBi5vMcSpmy3BEbZ4vOED1uYJE0lOguKqL55Yhtgf7L/GXCuR1r0zBguti+avJXZhqq0qP9ngXSPgdUW6vx2P52I/p
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR03MB1420; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	20:EAuf2gssruRlMjSz+My6PrkHsNM+DTwFivDKe3mbs1IAIBv4KCWxw29XESclJ3RgmILylQoKqqnhR83y9pBD57RN1xCSfAqIpTFVKG5urxPeD4xW25dOKIA7RXT9tAzfsEy1m2Atbl6EgFnlZrcweeCDSrMmiam8J7KE7GI5lInh3Z/fXhdLsiZfAwGQaNW8ZFe5HJImN8rAXRghlTe3eHBjdT5e2yKYOOPCPozdUUbJWUCPok7aYyzeBjg4J5Au6LReRZsmdkex0A4rh1gqh9o/HDKrtLoOOeelLwKcMi6xjj36MwLSsTH12gAHS3r7FE1ABTm2+tqBD+yEqUG+9MHqKQpVmrpn5iZioxonTMoTngngGH1c3AaqqSeeJOJw6vdq0CVknaLBEjovWFXol3ZiMMC393X8VagWna05GTy+AtqIjK4qMltWMNfd7sLM
X-Microsoft-Antispam-PRVS: <BY1PR03MB1420918CC486246D8D9184F6E8C30@BY1PR03MB1420.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(13018025)(13015025)(13023025)(13017025)(520078)(13024025)(10201501046)(3002001);
	SRVR:BY1PR03MB1420; BCL:0; PCL:0; RULEID:; SRVR:BY1PR03MB1420; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	4:IzwiOFXbhwNrvwA/QB2LctxW9ab2g6GwDxIqBzgpjFQ4TpDaRMiZXanb2RIHVjrEkxj8yspn/4mYI29DRGd18yh1JLcC+5qDIApCh0UavuHIaScvtXaEvRW+1srX8EDhuDNRhJXI64g6cLS555iqST76jbVbY5+g7+z4jdNO/iR4b/BzY5BPWb3pGHygCCR0beLKJEOrEo9imatOoyToDlW1eqxGzvna3GXyPCKrHJJdYA6kQwcUXaFmiMdxsNQHUsaYACbin1fvFywruJ7i/F2eSD3lDMJrO8/WyDIgunOa1Ybggv3+LFvcZCBW23xayDcfpjQJaZl6Ed/Or2SzQnloVzhdEsUaESnGDKLK6K70QFfvXMsDV7l3Pp1ltheOuXMjl/Dn90vituyIgHA9WrgEFjXBot0gAJ5xWBrMd5uG20D0LG2CVYemM7UG1W+WvzFQoCZ0qiNwRkP7c74mpigGnSFJGJpSNn+okbrudSsAN6OenEpTamgKX/X3FTyavdF8VT22L6aiyBABhKLvtw==
X-Forefront-PRVS: 08286A0BE2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR03MB1420;
	23:i9kx4NfA5H+I0vOjbEcYAN5TWNuLk/kVVC1B+XMnr?=
	=?us-ascii?Q?eoSZTRQsjA6cAB1SvOuU+/wh36qWjfZoatadOSS/ugGYUpKqZ+dBbhBWAHdZ?=
	=?us-ascii?Q?7yncdKNrcp+yTov71VQqbEF0y2VhiUa5GuHfEELT5ai7u93v06Ou7FWrJtgN?=
	=?us-ascii?Q?FScJGW5AM9HBkLwV9VueVu38F4lK/kf4D4bM8qJRkaiiCyxurRlwL3o9nK5Z?=
	=?us-ascii?Q?+fMYAHWsIGvuPIE2Q1cH2lTylwRyvDma6Fqgl2hvCNEwl4qkrTV6Ff/ROZDi?=
	=?us-ascii?Q?OfaxU7vwcxPo8CEdwLNpDaROR/3ZM5FZN5TtNSyQAMz/u8KjZ6sY66KK3d2z?=
	=?us-ascii?Q?Jjod1qUlUkGOlYZqqtGqG5SbxLTHfFsfaMkQB7L2CjE30qnOeQfSCiQFvpPm?=
	=?us-ascii?Q?8tsNaDx/xuvtYfQovjLeSffKKygMugHdiQ92hLpI5RrUT/M8TjNWIuxUBbS2?=
	=?us-ascii?Q?UrYWDzbiNnrJjdV60kmFO/mQlToBnfmhGlSztoeygqwIsJAJijz7Idl07tIA?=
	=?us-ascii?Q?b0Qav0VDK5wrOJMvyu657xpkfUim888Zj2LrkE9sTfTjBlCfFmyNL7Jm8KnM?=
	=?us-ascii?Q?7kkTAzrchSNthRjWBTn2m+rrL1fllBJ7UyHnaR3926qnSN4j2jHqqfN1aAvq?=
	=?us-ascii?Q?y1Genbjcs4GreeW0TwM2KsH6uzKpP8uMWbOETUqMLt/1ezVCfYulbs6KKzcR?=
	=?us-ascii?Q?oSKd5png/3425jVjXZKKONKlFuBNe3QD/gKT1wBUPKL0r4C8EioiTH87YWRO?=
	=?us-ascii?Q?B82UceGzk0989Tt+KFEL9410ars9yA4eQq2pWcQT60K7MoCGIcNl583IoD38?=
	=?us-ascii?Q?RhXHx2vROnXTUg2d60wDnBsDBoZacAulSjZYCw9GswYp/7KztYigIkhFXrgS?=
	=?us-ascii?Q?uJFTBOqTbQNYIqc4o3yRO5HAowSjwSA6QFjg9twDKt8accdP7n/uG6GJhGad?=
	=?us-ascii?Q?/HNzYxWJCJwujrM1TBtLw4ytBmgzGjQVO8smS1klX5hvH2PFkGWkwdS5vRl1?=
	=?us-ascii?Q?3Vmc1wiE7teA6elsMZ7eaYsmredJJTdnEDqojes5u7c34+BOujr4yofxiz5z?=
	=?us-ascii?Q?ASC3XkoKPz5muNBU7aeckS3dqfPNyl5WNUZAAgYyQ/LEptQMeo3OHgVwbjUk?=
	=?us-ascii?Q?DIPDW2Ac/5oNg3SxJPqo7UCoD3+hrG4/hMj/ie/x5bt53Go0uZePQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	5:NNP3wZMJkhiw/r2xCVN0PJc//w301FGsH+Og30SMkzuDdpcq6leABmsE3+48OmfN8ov6gQm3ErNU7lwmd3uhx1pYA7p5UseHlA84sA4xoT4tuVUzo/J5SIgow0HmTJt6Z3qxUjInGjOOgrfKFv8RjA==;
	24:37nxLmBZ/81Cn84QWG8a0RuVD3UEaJCr+V7NuiRQjctZ/43Pw91A3ABIGOGbi86Utw/xtFDxMYAQTnbyARxEqZZOIv/ZTnc7CIAxxjL72WE=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2016 22:48:08.0128 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB1420
Subject: [PATCH v3 3/5] weston: Include weston-launch if Wayland is configured
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jan 2016 22:48:12 -0000
Content-Type: text/plain

When weston is started as the first windowing system (i.e. not under X
nor under another Wayland server), it should be done with the command
weston-launch to set up proper privileged access to devices.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-graphics/wayland/weston_1.8.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index aff9a12..fa6092b 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -20,7 +20,9 @@ SRC_URI[sha256sum] = "8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada
 
 inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
-REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES = "opengl \
+                            ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'pam', '', d)} \
+                            "
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland libinput virtual/egl pango"
@@ -39,9 +41,8 @@ EXTRA_OECONF_append_qemux86 = "\
 EXTRA_OECONF_append_qemux86-64 = "\
 		WESTON_NATIVE_BACKEND=fbdev-backend.so \
 		"
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                   "
 #
-- 
2.1.4


