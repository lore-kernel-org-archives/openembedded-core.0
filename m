Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13163.1795090707701103520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 04:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ih51Ko19;
 spf=pass (domain: siemens.com, ip: 52.101.69.4, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsytD56qh+r6v26uqPsmuj/m0IhOrYBBBTRO7wPLkeNj+y0srDrm+s5O1tjDnKQoyIu4CrNB+Gw25g8aHN2STIXwyP+WybjlAENSrLhG2WcaprGU3UP00R/fA6m2qIku7SynV3KPEAmxUal4H/LFaxUUtFi02JKlMQDYPBVhZKVcM+ecRc8JOIqzAqE9XS3t90jjNEsR4ErCGBrvWueufvg8PSEM0LTG1N25UgJKEWQ5Srfz8UzuJKuGRqrQNezEz89YAwhk6tS1c6qtrF1DTht7OkLzhkHL98N+zpqIu+OmKWc3fPRDf2BFKC9l60OYmj2JB3rOVQe2NuxxzR3fqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Mmk3GlVU5wDhwLF0cGeJS5AVZZfC/y7wzZ4XwnL6GE=;
 b=D7/tJBZsEnReDs8JHhvZQXscq1lOFTl3/HRLGV19Uso4+CLkWzCOc3cV5KjWiRUTHQ+6yf0uWvkDkt0kbVi5430k45LDTkDkyFo4q3tFv0r3vEY2w+J3ZGYNbPcthkIBB7yJ4MWt7cXUhlEQpPvbMFbgIpzVBOyXYsknD26eGfAKJAg40HwJ5wKEHdCA94Ja066jqUzMwposC5gnhz0mXz5IbWm3ycH95Grdzrfzj1A8OCG3zeY5tKZ0przSrVQ1QNpNOTY/Y0cu1NI+KilbUEeGStvY2uC8/UAjUWlZPtuem4jC7Jjq7NE5EPHrkZlvbHzADlawUKC4gABYW3brpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Mmk3GlVU5wDhwLF0cGeJS5AVZZfC/y7wzZ4XwnL6GE=;
 b=ih51Ko19fK/OMcZ99KCR3q3sG92ZLDrhuuVISHp1khCEChQg/dIgsKtMKTqxJAI205g10z2YFQo+EvaeuBKItqzPsw3EdfKUGxHWweW59qgKkvj12GkmINhqFttRxPFnHxu4V804E9mFAqAHiXXAV0ut75ipk1I+ZLmZac6Q/PCkAlW8TenG/QZl/bRA2dI50jquXVl58jiGiJ0ihbqLu/rHB5ewiMXILmScyBsQLpFcBQRgGNyWNpubmJxzyTDNvM90NCaEAe/nNqqgSP/D6/6kzzRciXGD/dhTB9e9BtzfGjpN9+1es6FDrKLGFLde6eQvuKCSK250LVGauS0nuQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PAWPR10MB8284.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Thu, 19 Nov
 2026 12:18:22 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0639.006; Thu, 19 Nov 2026
 12:18:22 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "deeratho@cisco.com" <deeratho@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH v2] ruby: Fix CVE-2026-97229
Thread-Topic: [OE-core][scarthgap][PATCH v2] ruby: Fix CVE-2026-97229
Thread-Index: AQHdeB5Jir8rlknjrkCAxjua8DG/Irc1T17w
Date: Thu, 19 Nov 2026 12:18:21 +0000
Message-ID: <AS8PR10MB5073D7299AE21DFCCCA60610FD792@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261111110448.3303353-1-deeratho@cisco.com>
 <20261119120513.2285226-1-deeratho@cisco.com>
In-Reply-To: <20261119120513.2285226-1-deeratho@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d172db35-ebaa-4328-990c-5e3a8ab70639;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-19T12:16:28Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PAWPR10MB8284:EE_
x-ms-office365-filtering-correlation-id: deebe23c-bdb5-4560-2605-08df4637341f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|6133799003|55112099003|3023799007|13003099007|261022105027099003|261021123027099003|11063799006|56012099006|4143699003|261028144727099003|261022075727099003|261102123227099003|261021121427099003|261009223027099003|10067099003|38070700021|261026121527099003|260925022911599003|260925021311599003|261026140227099003|260925021911599003;
x-microsoft-antispam-message-info: 2m4wPnHfGT9E7SixNj89KFA98oB2GuBcystDkhwpFyfzD53w9gsCXpbtwSsZmyHYpTe/DkxCB1EqWLYWhQPflrN3eOUC8K6mHeCnIUK/949cH/yMl6ifADKERwS4Yh/1iVXc9k3ozVykX+z4GIEpo+pUZ43dL+tHcrEZetrDn5pjf+uaGWIYugPAY+IOsxC5JZu25f6Gce7jL+Gkd+YEmjJuSqc6CPzYR0zUvKMpVpXwLyNHT+RtcrbyYWtg278+a5aJCjRzSmt7p1GbboF5p5aGN+zXLLQhpT7HMQPPMjdmAqkFxH0KhlA1myCB10EPxi9Ow97q1HrDQdrctBg+R6jOr+RJ2Gh+rNQXB8hVErB+6P7bvCSmGYTIFkDqUPv4jFYc7uV6PuSM0WPydYny3m+2h1ElHxD/OPW7IaNHONVHKq/lfayZwCVACi0zU64Nsc41xM2+Z9zPCtwHDTFlUi4Mp0sXT+Enorm/DyfLcV88DvlnA8c/ttVjJGajCgSsNXeH7Q4Z/9nzBnUO1A3w8rx0FCdzhW0mVa/hQkQv91v+0DzptFA6rBEU+XHdLIN1Ht06TF1w22KVSF4TCY9h02RnagPqxxglJxWDNm5IKXc8+miIhyybhQaNepEe/+xLjANnJ4kMcLkgQ220+ZuMhC6MRHyxsQvx8KdjEl2xMBg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(55112099003)(3023799007)(13003099007)(261022105027099003)(261021123027099003)(11063799006)(56012099006)(4143699003)(261028144727099003)(261022075727099003)(261102123227099003)(261021121427099003)(261009223027099003)(10067099003)(38070700021)(261026121527099003)(260925022911599003)(260925021311599003)(261026140227099003)(260925021911599003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aau40NtMmOHycQnX2j8eCIk675WVw45ZwZjO84vQi0ObBw77aF6LY7iL2k08?=
 =?us-ascii?Q?RG0tIPnsPgpKDVPUA3nogyADbOiBHHcMxipe6qlk9lSHZ7cTgIn+PMB5gDBB?=
 =?us-ascii?Q?LUNm8R1LeGV/K7lCYqt55z4zFUlrq2Ddc16wj/0bqDSBf3jjuhVUhDrAEMIy?=
 =?us-ascii?Q?lbd4bBhkGoax2kDjKJPdtCHJaBv3s0sAKxrLrRbA5uA3ja9JN/I0C/XYB93O?=
 =?us-ascii?Q?rIDrgHfzOVOBfA06lUHgNiglJjKeh1bR2cFYqTqZiI3Cqaxb0kH1ziJqkAgW?=
 =?us-ascii?Q?HeB4cV/ibVEcwpjzmGwyjn4U7p09m7EpNDj8XZAFEfAwJ/A4l//ZX5CgspsM?=
 =?us-ascii?Q?JSMp5dlgfzUU990UAGX0mx3nwt9UnOH/ViMbAjZJofUicVhq2CB1Kb1URNc0?=
 =?us-ascii?Q?wO5EpO9wGyA8/b+XwXzYRAT+1LAkrT9W2YvA+XQWvZ6ocrJES9jYxGgdGfgf?=
 =?us-ascii?Q?JoSTrHyZVPNSeegyeNJ06Ghj/ocPnaBikn1ZgZpPNcl+8VYZJoWnes3okvKA?=
 =?us-ascii?Q?CULp/sxi/AoEfkLPurd6tcOH17PzkFSIlGq4dPIJe8/Vbv6MGsg5s9dSXqGV?=
 =?us-ascii?Q?bKMkhYdWRF0jGrJfl04Sqzr3m+IK2K+yrlDNjistH7frAm4k5g6XTU+S5TTa?=
 =?us-ascii?Q?v0fMlJJGnZH4lP55wKD8BKu/Vs9bLFeOSezh7yZoj0NyszwVwuajzAtcnzWQ?=
 =?us-ascii?Q?cOo9dTFcTe9E6s6sj/2RkaY09BvOG0Nolfn/fXwv9jVwprl/dj6dlQADI+zK?=
 =?us-ascii?Q?cYEMPnSG1Fdqpl9Z6OA0FLce5+pqR1aMgKJiQ9Rn++dvyB+i+cSroGY2M1jJ?=
 =?us-ascii?Q?JxeE7ZiK6pNih5a/8tgSf5gBcACPiAiJjY4u9pIV/X8VcIXxLXO+NIzczlXQ?=
 =?us-ascii?Q?4nxh6TVRvVUkvIdVJiZxMHDKHuwbB6I/gqqWFxeuTTQEsSg/QJQI0ISxaGHp?=
 =?us-ascii?Q?DYZz82PBJRhkbAAed+T4utl2AN8wPMHJaqUXlXSltI6TIdYBDnaDY/gF1eHC?=
 =?us-ascii?Q?W0FiiNHRhSJ/yoXVHM8tIXohGb1Ojpv8d6W3y+byEUEcI3caL2WGv5DzdODj?=
 =?us-ascii?Q?qHiEVBTYjoB9KaL4L66+Y6AI1A/jGrQm/HdxSBKJftWYFuzpzBFvzdkCFGBl?=
 =?us-ascii?Q?pkd/RLb7lKoU2+hjc+FFKwsT1tgWMVhLD0YloqwWemg0bAIaYv8BINERd1AI?=
 =?us-ascii?Q?c/8Yvvd2Y/4l6frr6SbSt523nPqnM+q7UwhQxWKkkRqHNuSuRVtfezQ5nv6V?=
 =?us-ascii?Q?rNoiyjJe+a1K4IlD3frpCNZqMLK5VSe5mUVDsUEpXqLvIcjEqjdDvX4N5bWO?=
 =?us-ascii?Q?7SYOWYEfxhC+N+/isWl5ZfiSKEPbrEyTRvA7ikXxoOvelve2GvTZk3thItzs?=
 =?us-ascii?Q?eVL7N/egDhgFE48b4E19MNSowtP7ghcO8TPlRc4KiQVi6dYZ83RzdrIMJQLl?=
 =?us-ascii?Q?Ifw4OA1iJHevrbO+0ipO63+U3AHqBykY9E9SVKBfvrOmZzTgZ3WBsUkpUxso?=
 =?us-ascii?Q?A0YB4tppRmbuU+Oi9ivpaBe0E+QGnzYm38IIdALpqD1EO4O64QZauZYC+AMB?=
 =?us-ascii?Q?f9ONYH8VTAMsX3eo9GSlBa67Y+mKzm6G/ZYov31lv71FnCZ7W7Mbz/Md4WaE?=
 =?us-ascii?Q?yzjog35XDl9Vz9RX97Jg7giMkLfzODxTVO1jDSoxFHbF2nUu+QJX7/ZFR8S/?=
 =?us-ascii?Q?5/AhoKXe3l3T9fnG3L4SGAmVKOxJDhkWdxFzwkFlqsqinz5cjyI6oyiiMqSM?=
 =?us-ascii?Q?agwluotW+g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: deebe23c-bdb5-4560-2605-08df4637341f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 12:18:22.1480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xmtYU3y68d8VSBpLbAv8WaVgORXEk5cwyDS3//TM2nE3Z1+wQeOG820ay/hAJngX6i43awog/h/qRa6qcSC3qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8284
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 12:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250665

We should rather upgrade to stable 3.3.13 release, there are many more CVEs=
 fixed there (and in 3.13.11 and 3.13.12).
Peter

> -----Original Message-----
> From: Deepak Rathore via openembedded-core
> <deeratho=3Dcisco.com@lists.openembedded.org>
> Sent: Thursday, November 19, 2026 1:05 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][scarthgap][PATCH v2] ruby: Fix CVE-2026-97229
>=20
> From: Deepak Rathore <deeratho@cisco.com>
>=20
> This patch applies the upstream Ruby 3.3 fixes for
> CVE-2026-97229. The three backported commits are referenced in
> [1], [2], and [3]. The upstream fix discussion is referenced in
> [4], and the public CVE advisory is referenced in [5].
>=20
> [1]
> https://github.com/ruby/ruby/commit/fa98ef030a54595d4387998b2fb48a412fc5c=
6
> 3c
> [2]
> https://github.com/ruby/ruby/commit/b03e500193371ae87dc4536d855008b42a9
> cd1a7
> [3]
> https://github.com/ruby/ruby/commit/f6496bca68ca445bcc1ced04818bfa4220b2b
> c7f
> [4] https://github.com/ruby/ruby/pull/19020
> [5] https://www.ruby-lang.org/en/news/2026/10/23/regexp-fixes-for-gitlab-=
cves/
>=20
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>=20
> ---
> Changes since v1:
> - Restore the full upstream cherry-picked commit hashes in all three
>   embedded patch messages.
>  .../ruby/ruby/CVE-2026-97229_p1.patch         | 97 +++++++++++++++++++
>  .../ruby/ruby/CVE-2026-97229_p2.patch         | 79 +++++++++++++++
>  .../ruby/ruby/CVE-2026-97229_p3.patch         | 31 ++++++
>  meta/recipes-devtools/ruby/ruby_3.3.10.bb     |  5 +-
>  4 files changed, 211 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-
> 97229_p1.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-
> 97229_p2.patch
>  create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-
> 97229_p3.patch
>=20
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch
> b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch
> new file mode 100644
> index 0000000000..4f68c23671
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch
> @@ -0,0 +1,97 @@
> +From 59296a88f6d19fe07e1e0301fa4abeb53f89d117 Mon Sep 17 00:00:00
> 2001
> +From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
> +Date: Fri, 25 Sep 2026 11:44:12 +0900
> +Subject: [PATCH] Avoid overflow in the quantifier expansion size check
> +
> +Nested bounded repeats let the int product tlen * qn->lower overflow, so
> +the check that keeps the compiler from unrolling a large repeat could pa=
ss
> +for an enormous one, hanging the compile or emitting wrapped jump offset=
s.
> +Compare against the limit by division instead.
> +
> +CVE: CVE-2026-97229
> +Upstream-Status: Backport
> [https://github.com/ruby/ruby/commit/fa98ef030a54595d4387998b2fb48a412fc5=
c
> 63c]
> +
> +Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> +(cherry picked from commit 7cfe8dc82f9f1b3f9c37c78e362fcbdf3c0b84f4)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + regcomp.c                | 16 ++++++++++------
> + test/ruby/test_regexp.rb | 12 ++++++++++++
> + 2 files changed, 22 insertions(+), 6 deletions(-)
> +
> +diff --git a/regcomp.c b/regcomp.c
> +index 7bba1455e3..4eaccfaaa8 100644
> +--- a/regcomp.c
> ++++ b/regcomp.c
> +@@ -739,6 +739,10 @@ is_anychar_star_quantifier(QtfrNode* qn)
> + }
> +
> + #define QUANTIFIER_EXPAND_LIMIT_SIZE   50
> ++/* (tlen * n <=3D QUANTIFIER_EXPAND_LIMIT_SIZE) without overflowing int=
: tlen
> ++   and n are each bounded by ONIG_MAX_REPEAT_NUM, but their product is
> not. */
> ++#define IS_EXPAND_LIMIT_OK(tlen, n) \
> ++  ((n) <=3D 0 || (tlen) <=3D QUANTIFIER_EXPAND_LIMIT_SIZE / (n))
> + #define CKN_ON   (ckn > 0)
> +
> + #ifdef USE_COMBINATION_EXPLOSION_CHECK
> +@@ -1003,7 +1007,7 @@ compile_length_quantifier_node(QtfrNode* qn,
> regex_t* reg)
> +     mod_tlen =3D tlen;
> +
> +   if (infinite &&
> +-      (qn->lower <=3D 1 || tlen * qn->lower <=3D QUANTIFIER_EXPAND_LIMI=
T_SIZE))
> {
> ++      (qn->lower <=3D 1 || IS_EXPAND_LIMIT_OK(tlen, qn->lower))) {
> +     if (qn->lower =3D=3D 1 && tlen > QUANTIFIER_EXPAND_LIMIT_SIZE) {
> +       len =3D SIZE_OP_JUMP;
> +     }
> +@@ -1029,8 +1033,8 @@ compile_length_quantifier_node(QtfrNode* qn,
> regex_t* reg)
> +     len =3D SIZE_OP_JUMP + tlen;
> +   }
> +   else if (!infinite && qn->greedy &&
> +-           (qn->upper =3D=3D 1 || (tlen + SIZE_OP_PUSH) * qn->upper
> +-                                      <=3D QUANTIFIER_EXPAND_LIMIT_SIZE=
)) {
> ++           (qn->upper =3D=3D 1 ||
> ++            IS_EXPAND_LIMIT_OK(tlen + SIZE_OP_PUSH, qn->upper))) {
> +     len =3D tlen * qn->lower;
> +     len +=3D (SIZE_OP_PUSH + tlen) * (qn->upper - qn->lower);
> +   }
> +@@ -1080,7 +1084,7 @@ compile_quantifier_node(QtfrNode* qn, regex_t* reg=
)
> +     mod_tlen =3D tlen;
> +
> +   if (infinite &&
> +-      (qn->lower <=3D 1 || tlen * qn->lower <=3D QUANTIFIER_EXPAND_LIMI=
T_SIZE))
> {
> ++      (qn->lower <=3D 1 || IS_EXPAND_LIMIT_OK(tlen, qn->lower))) {
> +     if (qn->lower =3D=3D 1 && tlen > QUANTIFIER_EXPAND_LIMIT_SIZE) {
> +       if (qn->greedy) {
> + #ifdef USE_OP_PUSH_OR_JUMP_EXACT
> +@@ -1150,8 +1154,8 @@ compile_quantifier_node(QtfrNode* qn, regex_t* reg=
)
> +     r =3D compile_tree(qn->target, reg);
> +   }
> +   else if (!infinite && qn->greedy &&
> +-           (qn->upper =3D=3D 1 || (tlen + SIZE_OP_PUSH) * qn->upper
> +-                                  <=3D QUANTIFIER_EXPAND_LIMIT_SIZE)) {
> ++           (qn->upper =3D=3D 1 ||
> ++            IS_EXPAND_LIMIT_OK(tlen + SIZE_OP_PUSH, qn->upper))) {
> +     int n =3D qn->upper - qn->lower;
> +
> +     r =3D compile_tree_n_times(qn->target, qn->lower, reg);
> +diff --git a/test/ruby/test_regexp.rb b/test/ruby/test_regexp.rb
> +index 010be01960..debded0683 100644
> +--- a/test/ruby/test_regexp.rb
> ++++ b/test/ruby/test_regexp.rb
> +@@ -2107,4 +2107,16 @@ class TestRegexp < Test::Unit::TestCase
> +       re =3D~ s
> +     end
> +   end
> ++
> ++  def test_nested_repeat_expansion_overflow
> ++    assert_separately([], "#{<<-"begin;"}\n#{<<-'end;'}", timeout: 30)
> ++    begin;
> ++      # A nested repeat whose expanded size overflows int must not be
> ++      # unrolled: the compiler used to hang or emit wrapped jump offset=
s.
> ++      ["(?:.{90000,}){90000}", "(?:.{46341,}){46341}"].each do |src|
> ++        re =3D Regexp.new(src)
> ++        assert_nil(re.match("x" * 10), src)
> ++      end
> ++    end;
> ++  end
> + end
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch
> b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch
> new file mode 100644
> index 0000000000..a15e6964c4
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch
> @@ -0,0 +1,79 @@
> +From 83e9b083d47536b4e10f3e8685af5c89646efab9 Mon Sep 17 00:00:00
> 2001
> +From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
> +Date: Fri, 25 Sep 2026 12:10:25 +0900
> +Subject: [PATCH] Reject a compiled program too big for its offset type
> +
> +Concatenated large repeats reach a program past INT_MAX from a few hundr=
ed
> +kilobytes of source, and the offsets emitted into it wrap.  Cap the size
> +while the program is emitted, which does not depend on the length pass t=
hat
> +overflows along with it.
> +
> +CVE: CVE-2026-97229
> +Upstream-Status: Backport
> [https://github.com/ruby/ruby/commit/b03e500193371ae87dc4536d855008b42a9
> cd1a7]
> +
> +Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
> +(cherry picked from commit cf35145fc46bc278e0ab0003478fc4afe6564819)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + include/ruby/onigmo.h | 1 +
> + regcomp.c             | 4 ++++
> + regerror.c            | 2 ++
> + regint.h              | 5 +++++
> + 4 files changed, 12 insertions(+)
> +
> +diff --git a/include/ruby/onigmo.h b/include/ruby/onigmo.h
> +index db290cd47a..8c8ee5a7ea 100644
> +--- a/include/ruby/onigmo.h
> ++++ b/include/ruby/onigmo.h
> +@@ -687,6 +687,7 @@ ONIG_EXTERN const OnigSyntaxType*
> OnigDefaultSyntax;
> + #define ONIGERR_NEVER_ENDING_RECURSION                       -221
> + #define ONIGERR_GROUP_NUMBER_OVER_FOR_CAPTURE_HISTORY
> -222
> + #define ONIGERR_INVALID_CHAR_PROPERTY_NAME                   -223
> ++#define ONIGERR_TOO_BIG_COMPILED_PROGRAM                     -226
> + #define ONIGERR_INVALID_CODE_POINT_VALUE                     -400
> + #define ONIGERR_INVALID_WIDE_CHAR_VALUE                      -400
> + #define ONIGERR_TOO_BIG_WIDE_CHAR_VALUE                      -401
> +diff --git a/regcomp.c b/regcomp.c
> +index 4eaccfaaa8..986b53eb55 100644
> +--- a/regcomp.c
> ++++ b/regcomp.c
> +@@ -223,6 +223,10 @@ unset_addr_list_add(UnsetAddrList* uslist, int offs=
et,
> struct _Node* node)
> + static int
> + add_opcode(regex_t* reg, int opcode)
> + {
> ++  /* Every instruction passes here, so this is where a program that wou=
ld
> ++     outgrow its offset type is stopped, while it is still being emitte=
d. */
> ++  if (reg->used > MAX_COMPILED_PROGRAM_SIZE)
> ++    return ONIGERR_TOO_BIG_COMPILED_PROGRAM;
> +   BBUF_ADD1(reg, opcode);
> +   return 0;
> + }
> +diff --git a/regerror.c b/regerror.c
> +index b18fc2e88b..0ff581ad42 100644
> +--- a/regerror.c
> ++++ b/regerror.c
> +@@ -165,6 +165,8 @@ onig_error_code_to_format(OnigPosition code)
> +     p =3D "group number is too big for capture history"; break;
> +   case ONIGERR_INVALID_CHAR_PROPERTY_NAME:
> +     p =3D "invalid character property name {%n}"; break;
> ++  case ONIGERR_TOO_BIG_COMPILED_PROGRAM:
> ++    p =3D "too big compiled program"; break;
> +   case ONIGERR_TOO_MANY_CAPTURE_GROUPS:
> +     p =3D "too many capture groups are specified"; break;
> +   case ONIGERR_INVALID_CODE_POINT_VALUE:
> +diff --git a/regint.h b/regint.h
> +index 75abfba235..8de93f5bdf 100644
> +--- a/regint.h
> ++++ b/regint.h
> +@@ -394,6 +394,11 @@ typedef unsigned int  BitStatusType;
> + #define INT_MAX_LIMIT           ((1UL << (SIZEOF_INT * 8 - 1)) - 1)
> + #define LONG_MAX_LIMIT           ((1UL << (SIZEOF_LONG * 8 - 1)) - 1)
> +
> ++/* Program offsets are RelAddrType, and the compile_length_*() function=
s sum
> ++   into int, so a larger program would wrap both.  The quarter leaves r=
oom
> ++   for the sums the offset arithmetic makes out of those lengths. */
> ++#define MAX_COMPILED_PROGRAM_SIZE  ((unsigned int )(INT_MAX_LIMIT
> / 4))
> ++
> + #define DIGITVAL(code)    ((code) - '0')
> + #define ODIGITVAL(code)   DIGITVAL(code)
> + #define XDIGITVAL(enc,code) \
> diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch
> b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch
> new file mode 100644
> index 0000000000..d39bc52874
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch
> @@ -0,0 +1,31 @@
> +From 4cca9e5cadd7b56525d012ff783c6abcf52094ba Mon Sep 17 00:00:00
> 2001
> +From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
> +Date: Fri, 23 Oct 2026 10:22:03 +0900
> +Subject: [PATCH] Keep the program size error from OP_END with subexp cal=
ls
> +
> +With a subexp call, the result of unset_addr_list_fix overwrote the erro=
r, so a
> pattern over the limit compiled without raising RegexpError.
> +
> +Follow-up to cf35145fc46.
> +
> +CVE: CVE-2026-97229
> +Upstream-Status: Backport
> [https://github.com/ruby/ruby/commit/f6496bca68ca445bcc1ced04818bfa4220b2
> bc7f]
> +
> +Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> +(cherry picked from commit 16d8a554b2ad279e08128b5e1dc4b342fccd33d7)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + regcomp.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/regcomp.c b/regcomp.c
> +index 986b53eb55..b1f63e6534 100644
> +--- a/regcomp.c
> ++++ b/regcomp.c
> +@@ -5971,6 +5971,7 @@ onig_compile(regex_t* reg, const UChar* pattern,
> const UChar* pattern_end,
> +   r =3D compile_tree(root, reg);
> +   if (r =3D=3D 0) {
> +     r =3D add_opcode(reg, OP_END);
> ++    if (r !=3D 0) goto err_unset;
> + #ifdef USE_SUBEXP_CALL
> +     if (scan_env.num_call > 0) {
> +       r =3D unset_addr_list_fix(&uslist, reg);
> diff --git a/meta/recipes-devtools/ruby/ruby_3.3.10.bb b/meta/recipes-
> devtools/ruby/ruby_3.3.10.bb
> index 936bc73e32..0cd0822ac9 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.3.10.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.3.10.bb
> @@ -27,7 +27,10 @@ SRC_URI =3D "http://cache.ruby-
> lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
>             file://0006-Make-gemspecs-reproducible.patch \
>             file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv=
.patch \
>             file://0007-Skip-test_rm_r_no_permissions-test-under-root.pat=
ch \
> -          "
> +           file://CVE-2026-97229_p1.patch \
> +           file://CVE-2026-97229_p2.patch \
> +           file://CVE-2026-97229_p3.patch \
> +           "
>  UPSTREAM_CHECK_URI =3D "https://www.ruby-lang.org/en/downloads/"
>=20
>  inherit autotools ptest pkgconfig
> --
> 2.35.6

