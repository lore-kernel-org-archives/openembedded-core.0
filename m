Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.89])
 by mx.groups.io with SMTP id smtpd.web11.9976.1612539770605342985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 07:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=jKUaxEW0;
 spf=pass (domain: kpit.com, ip: 40.107.138.89, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BboXx3wP02oWkDymIgTs0KFTQe5nBKn4J2DDSI9s2xksElBOdiJL64CBlDxfi+1B63FtzMmrGw414cFHurX5Y9+/n2H0rsmhM3Bv1Bn+O1VgJDgKWYef0zuN/1K4epQRyXL0kGZXTIElyJN23Cy5AZ32W2T3MoXLBLLwLhLukz4/QXqQO+DIhxAOpIoC/b4AkcnJcFaLyM/ajwKNgQUN+I6Mq33QY1s8MJHTmYJFLiXfCX3wqUbXHXDb7j0pL1lhSNZ7cKavSwxeBLNtxna+VSHWTQng8VLcZBVKxW4ikL1nADm8+ultJj1CU4haEJgcDIAl8jZz+ieH+ItUczU7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGl2x0fBPjpOH1/Stt9oObX3Y9NyUyxMzVZtsH32tYE=;
 b=QtbAa22vDgHOrUcRvmjQgPMi/f4ptxHZ4qMY1LYxn5MGYQaK8vhSmqbCx9tSb+vx0cajlJNkWcC//nbYPgdjn8GmVc6CeDhetXU+nLc1wEnAcy+5ULKUhS/B4N4/qeJqX+2PIvUmTTzBFgRDf6QpXN749L+5BSBN4UI7yWkS4uFwmbbKhXUPUTcQzjBLk8pXeMeFLxK3RvoZxGsf7bmiy3yI7/Cra+rl2vumEU4c/P0d2Lp0GnrLIkIDX9AIEn/yf3+0ra9fpTpPYGQAQbvte9fwNnL15gctYaJEJxTSwveG8xj0eNWTdM2wYvArPI0o88EKwaVhcIp6sksHmBWCrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGl2x0fBPjpOH1/Stt9oObX3Y9NyUyxMzVZtsH32tYE=;
 b=jKUaxEW0uxxmuSO0i6m61XyRU/SKmLud633yr0+iAgyY/J5Boytvhsu1RqlNbRuSyB1GQtuVqVfcsXnfWEwM5NdBEworJR0evFOw6wUNmQFd7Mx/EYvHee2hWDOM/XhtSGdgd6msPT3l03UhiUdqynuNI0qAZ2AKZ9/Oruyh6CA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BMXPR01MB0839.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 5 Feb
 2021 15:42:44 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868%7]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 15:42:44 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com
Subject: [poky][master][dunfell][gatesgarth][PATCH v2] libcroco: Added CVE
Date: Fri,  5 Feb 2021 21:12:34 +0530
Message-Id: <1612539754-5627-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:2e10:1952:e87b:d65:9b3f:2ae2]
X-ClientProxiedBy: PN1PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::15) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2e10:1952:e87b:d65:9b3f:2ae2) by PN1PR01CA0075.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 15:42:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 354d4720-d34d-4bd0-48dd-08d8c9ecadf6
X-MS-TrafficTypeDiagnostic: BMXPR01MB0839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB0839682AEED58833050BDC8587B29@BMXPR01MB0839.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jTm73BCB4gD5+8GLyPC05SVV3QbD4zvzhFlAX/U86lwh1zMwAOgzZU5+175fDBZWK6j25UKZBmoQKuNq/UVN8bWXRMX5CvP3TMRVpyESx0Pn0TDV8HMEbuTaj2tA8XRBpTApSRpN4ftzTgYaEeaabN4LQ08AtdjiejBSiu6AdedbJzlg8u7GDErq2DHhAC+0BoU9uJGnDcRFaIIMqdlbwa6DaSYCJwO+Qg5B+dpM/+oKRZZ4QFdm8wGhFoS6uazMwTlM0XzBl5S9EKbd+JESC3mZzcf6rG/wXUMtGgjtpdeuS7I+13V47MyUuvz+mf7MLaOjW7PH+sVC6+bZwtaJXt4Dnv7niGQ3nLhSVw7HBSyDIdtA35H3OWWw9e0BgpRl1cywdFB9hHMTjvIIOJraKZs4xHvAn/jlntz8fUu3KJECjFzGft2IWDOYFyJkaFYYihRsevNQPDIx124Jwxg2YdBmrkTTRJdggMrxycO14ZfqnFoBBWuZwxyjtBbZ1XcdznIgUD5tDYB+BuJLxUtzi3SDwI7yuJbOFp3A+sBSk/E2gCP8xdCo6nflWZOJD1/3UVwMfGwERvRZk/9s+EB8iTduYSMhdEKJ+w3c/sxcRpcocKwEXZd6QyXA4OdVBAwMDMAaso5I6thXRCKawgDk8YeUnU1uMzbmmyNbuibvdx4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(376002)(136003)(346002)(6506007)(2906002)(4326008)(36756003)(6666004)(2616005)(66574015)(478600001)(5660300002)(16526019)(186003)(86362001)(6486002)(52116002)(6512007)(66476007)(107886003)(966005)(66946007)(66556008)(69590400011)(316002)(83380400001)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?hKP/ovKsE9npPyNv75x/KEwyj++QiuugHdpNY20v7GpZSEVoutfQqVHdAhHe?=
 =?us-ascii?Q?ECcJTjFT3H/LozV0v5zJPDwpYUrnUjIRV65V2rERgmPqqbQAuSz1hsrXxBfH?=
 =?us-ascii?Q?UuDYA0Cx2NFcJnxaXLfw0DAcS735ynHRw1MNiXZruMEIQBwHB2X7VUZrIWdr?=
 =?us-ascii?Q?JHPyoMdBnC0DEez4aR/neQHZkRQul/RMe1h9RLV/Ws1KL72YiyfhiSH3N9ee?=
 =?us-ascii?Q?dgA9A9B9jNe4WyIGxvLXJlunDRdwKaJg2ay+rj5D74sh377C3nGK9AmYu6sy?=
 =?us-ascii?Q?siLei6gFr+8LBuyl/+rn6Irb0oLV61qFsHzOkioSzxRpCGzPMHPZfrn+YCEi?=
 =?us-ascii?Q?hzJnsLdM84ZRcEV8TFh66XQULsC35TRI/lm1/ghPKRgFjIh0sbkSmqmiZvcs?=
 =?us-ascii?Q?lN63B6uomz0s7qsBlE4IG9LyjgVwqiQs1mJqbHm1KmxE2ugAPuspAfwJ/gJU?=
 =?us-ascii?Q?ll5bUvrJmX2/MMA1c3jnifQHxZWzinxaSI+qA+nFAC7NycpiqckPjVKqH8+s?=
 =?us-ascii?Q?WpoJFD7sUjfu5E/V9AzZi+RUlfV7F6n8dLeBz3Mrh+klgRQz5GJ372P4yV/f?=
 =?us-ascii?Q?ySVCRliNC9DH1270l/VRnHunhOgJiaC3kGPAHdduzoIIWEp+rREXXb5xVX5V?=
 =?us-ascii?Q?+TPPjfWs9qldgfyg20rXh7aMqrhrkTyS643EMpawAZtrCWOcASNqPz7dgimB?=
 =?us-ascii?Q?im93GJzh5Q9Jcdwm5eDDrgIrqcQ4AGDVeanLemxiIbP+m2gh2xS6p2YlEFzs?=
 =?us-ascii?Q?jR1IW7es1sLOCh5vV5jNzOUzjCxPFNU461rqc1eoFaF0CeqmNt02sIhPmbHu?=
 =?us-ascii?Q?8XvOpzIIHf267MftM+ixVIl1FjetDd81hTwLjcJXGXvfdR8XdnOk0EYPBWnf?=
 =?us-ascii?Q?1K6ead25wgRM97Hp06Wk3TTI1reYvg4YwTfSlJYXXOdAHBFWnSD8dw7S4xWZ?=
 =?us-ascii?Q?adKikBDlyVMyZLFiLeRYQaAdkhLLnRzlhV0sRfvXI4yx5dArJOP2jBPOyUT1?=
 =?us-ascii?Q?JJipG752RjuSauVpKWBQQAk/sDRAYxOdaNTfDBhOWBBFSpRi551fHUhF3VUy?=
 =?us-ascii?Q?dbC6e4GcU9AuhRBvIb6HpcwDg6iU8JiarpPzcHtzuo3Py8Dge/aQ4tHnH38G?=
 =?us-ascii?Q?xkParDBubc4yA3hDUkXh4KdkfEUEmEEDPmfKLIf4vbY2iy3cuUFJLn2uDrkW?=
 =?us-ascii?Q?3642YJhYOf85RiGSk0J0WiQAr//mbufGw1kSPN+RZ7nnSV17b/zmxee/RXZ1?=
 =?us-ascii?Q?wSPVbJZ7cFB864PRLghRIybl9a8LK4FDQe7MOVQ5gwAq+Dt3sEFCmAqaCPsE?=
 =?us-ascii?Q?1P1YCaDays/liT46kR/HbZwPMZybJZ/s/6Y0a8c88lfi/yUgtux2Nc8rQ8Oa?=
 =?us-ascii?Q?EnlLysVj4cC1Pc9vnZqa3na66V5X?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354d4720-d34d-4bd0-48dd-08d8c9ecadf6
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 15:42:44.4466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJs2AAw6e6esN8eEmWQ3jFVywhspyqmKodGVTlywMj3Y3dzbxF65AmFfqhjGNrr66kxaz2j8JDuU5b5MHoWV9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0839
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Added below CVE:
CVE-2020-12825
Link: CVE-2020-12825 [https://gitlab.gnome.org/Archive/libcroco/-/commit/6e=
b257e5c731c691eb137fca94e916ca73941a5a]
Link: https://gitlab.gnome.org/Archive/libcroco/-/issues/8

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../libcroco/files/CVE-2020-12825.patch            | 193 +++++++++++++++++=
++++
 meta/recipes-support/libcroco/libcroco_0.6.13.bb   |   3 +
 2 files changed, 196 insertions(+)
 create mode 100644 meta/recipes-support/libcroco/files/CVE-2020-12825.patc=
h

diff --git a/meta/recipes-support/libcroco/files/CVE-2020-12825.patch b/met=
a/recipes-support/libcroco/files/CVE-2020-12825.patch
new file mode 100644
index 0000000..add6f84
--- /dev/null
+++ b/meta/recipes-support/libcroco/files/CVE-2020-12825.patch
@@ -0,0 +1,193 @@
+From 6eb257e5c731c691eb137fca94e916ca73941a5a Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@gnome.org>
+Date: Fri, 31 Jul 2020 15:21:53 -0500
+Subject: [PATCH] libcroco: Limit recursion in block and any productions
+ (CVE-2020-12825)
+
+If we don't have any limits, we can recurse forever and overflow the
+stack.
+
+Fixes #8
+This is per https://gitlab.gnome.org/Archive/libcroco/-/issues/8
+
+https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/1404
+
+CVE: CVE-2020-12825
+Upstream-Status: Backport [https://gitlab.gnome.org/Archive/libcroco/-/com=
mit/6eb257e5c731c691eb137fca94e916ca73941a5a]
+Comment: No refreshing changes done.
+Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
+---
+ src/cr-parser.c | 44 +++++++++++++++++++++++++++++---------------
+ 1 file changed, 29 insertions(+), 15 deletions(-)
+
+diff --git a/src/cr-parser.c b/src/cr-parser.c
+index 18c9a01..f4a62e3 100644
+--- a/src/cr-parser.c
++++ b/src/cr-parser.c
+@@ -136,6 +136,8 @@ struct _CRParserPriv {
+
+ #define CHARS_TAB_SIZE 12
+
++#define RECURSIVE_CALLERS_LIMIT 100
++
+ /**
+  * IS_NUM:
+  *@a_char: the char to test.
+@@ -344,9 +346,11 @@ static enum CRStatus cr_parser_parse_selector_core (C=
RParser * a_this);
+
+ static enum CRStatus cr_parser_parse_declaration_core (CRParser * a_this)=
;
+
+-static enum CRStatus cr_parser_parse_any_core (CRParser * a_this);
++static enum CRStatus cr_parser_parse_any_core (CRParser * a_this,
++                                               guint      n_calls);
+
+-static enum CRStatus cr_parser_parse_block_core (CRParser * a_this);
++static enum CRStatus cr_parser_parse_block_core (CRParser * a_this,
++                                                 guint      n_calls);
+
+ static enum CRStatus cr_parser_parse_value_core (CRParser * a_this);
+
+@@ -784,7 +788,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
+         cr_parser_try_to_skip_spaces_and_comments (a_this);
+
+         do {
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, 0);
+         } while (status =3D=3D CR_OK);
+
+         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
+@@ -795,7 +799,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                       token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_block_core (a_this);
++                status =3D cr_parser_parse_block_core (a_this, 0);
+                 CHECK_PARSING_STATUS (status,
+                                       FALSE);
+                 goto done;
+@@ -930,11 +934,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
+
+         RECORD_INITIAL_POS (a_this, &init_pos);
+
+-        status =3D cr_parser_parse_any_core (a_this);
++        status =3D cr_parser_parse_any_core (a_this, 0);
+         CHECK_PARSING_STATUS (status, FALSE);
+
+         do {
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, 0);
+
+         } while (status =3D=3D CR_OK);
+
+@@ -956,10 +960,12 @@ cr_parser_parse_selector_core (CRParser * a_this)
+  *in chapter 4.1 of the css2 spec.
+  *block ::=3D '{' S* [ any | block | ATKEYWORD S* | ';' ]* '}' S*;
+  *@param a_this the current instance of #CRParser.
++ *@param n_calls used to limit recursion depth
+  *FIXME: code this function.
+  */
+ static enum CRStatus
+-cr_parser_parse_block_core (CRParser * a_this)
++cr_parser_parse_block_core (CRParser * a_this,
++                            guint      n_calls)
+ {
+         CRToken *token =3D NULL;
+         CRInputPos init_pos;
+@@ -967,6 +973,9 @@ cr_parser_parse_block_core (CRParser * a_this)
+
+         g_return_val_if_fail (a_this && PRIVATE (a_this), CR_BAD_PARAM_ER=
ROR);
+
++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
++                return CR_ERROR;
++
+         RECORD_INITIAL_POS (a_this, &init_pos);
+
+         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &tok=
en);
+@@ -996,13 +1005,13 @@ cr_parser_parse_block_core (CRParser * a_this)
+         } else if (token->type =3D=3D CBO_TK) {
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_block_core (a_this);
++                status =3D cr_parser_parse_block_core (a_this, n_calls + =
1);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 goto parse_block_content;
+         } else {
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, n_calls + 1)=
;
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 goto parse_block_content;
+         }
+@@ -1109,7 +1118,7 @@ cr_parser_parse_value_core (CRParser * a_this)
+                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                                token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_block_core (a_this);
++                status =3D cr_parser_parse_block_core (a_this, 0);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 ref++;
+                 goto continue_parsing;
+@@ -1123,7 +1132,7 @@ cr_parser_parse_value_core (CRParser * a_this)
+                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                                token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, 0);
+                 if (status =3D=3D CR_OK) {
+                         ref++;
+                         goto continue_parsing;
+@@ -1162,10 +1171,12 @@ cr_parser_parse_value_core (CRParser * a_this)
+  *        | FUNCTION | DASHMATCH | '(' any* ')' | '[' any* ']' ] S*;
+  *
+  *@param a_this the current instance of #CRParser.
++ *@param n_calls used to limit recursion depth
+  *@return CR_OK upon successfull completion, an error code otherwise.
+  */
+ static enum CRStatus
+-cr_parser_parse_any_core (CRParser * a_this)
++cr_parser_parse_any_core (CRParser * a_this,
++                          guint      n_calls)
+ {
+         CRToken *token1 =3D NULL,
+                 *token2 =3D NULL;
+@@ -1174,6 +1185,9 @@ cr_parser_parse_any_core (CRParser * a_this)
+
+         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
+
++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
++                return CR_ERROR;
++
+         RECORD_INITIAL_POS (a_this, &init_pos);
+
+         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &tok=
en1);
+@@ -1212,7 +1226,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                  *We consider parameter as being an "any*" production.
+                  */
+                 do {
+-                        status =3D cr_parser_parse_any_core (a_this);
++                        status =3D cr_parser_parse_any_core (a_this, n_ca=
lls + 1);
+                 } while (status =3D=3D CR_OK);
+
+                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
+@@ -1237,7 +1251,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                 }
+
+                 do {
+-                        status =3D cr_parser_parse_any_core (a_this);
++                        status =3D cr_parser_parse_any_core (a_this, n_ca=
lls + 1);
+                 } while (status =3D=3D CR_OK);
+
+                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
+@@ -1265,7 +1279,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                 }
+
+                 do {
+-                        status =3D cr_parser_parse_any_core (a_this);
++                        status =3D cr_parser_parse_any_core (a_this, n_ca=
lls + 1);
+                 } while (status =3D=3D CR_OK);
+
+                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
+--
+GitLab
+
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/recipe=
s-support/libcroco/libcroco_0.6.13.bb
index 9171a9d..a443ff2 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
@@ -18,3 +18,6 @@ inherit gnomebase gtk-doc binconfig-disabled

 SRC_URI[archive.md5sum] =3D "c80c5a8385011a0260dce6bd0da93dce"
 SRC_URI[archive.sha256sum] =3D "767ec234ae7aa684695b3a735548224888132e063f=
92db585759b422570621d4"
+
+SRC_URI +=3D"file://CVE-2020-12825.patch \
+"
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
