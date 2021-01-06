Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.50])
 by mx.groups.io with SMTP id smtpd.web12.6113.1609929116534775202
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 02:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=ex1MmoKz;
 spf=pass (domain: kpit.com, ip: 40.107.138.50, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOVHndL6kUmz4hIcXk3wN9yPOIx6z7uZeMSHYVjwiq2nkRM++kuO/KHm+SpteNuWrmNkUL/N5Cj8L1neSh1W/BfXGfRunGBdw340/ODcSRLMQt1j08r8MkRpWDQ+LZJCGXxoohwcHOIkkfIp0ljDkyj6Og1arg8f12sXvgmZ0UoVFp9Z+F9pQCXzMXs3/kK4xIDsTVeDNHl7DjBF9W/oc6fsLIIUzXGfiEjEW0lnRgJmbNiDrDdfMzXlJ8UNZmvwlPQ30Bq3PqMVvrYExFo43AgX4fSkP44uMNdNGzo5MVQtZXT9VFO3A+lwv97MBb8pUoMF+XOcQsczPpVfkT28Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmoUnHqLnl7AgD+CAmvehaGe96oxVQs0T/X/xWoAE/0=;
 b=TkDmNUFyzd4wyAza5GnBm6dbuIKq2ANWdeB/ecinebBluQKQRko4UWvYcyTIoGAEBzecD3ICaNlT540OMO3BLmayo/I5kp3c2fcKOH2YloHTeUvnwm52LfXUMZqVtQkeXUndisTe+veyAViZtcHCgGlGW6DkENk+xO6bi+z6v6sDIQvtPPdcZOiPYsb90wjw+a1SpDshnRlZkLJNTFWAuQjIu0f4F2BLodSbO+krj4uG4siG///B+60WK1bDDmk9SSBHLszPhokPqs67HijNHmPumKBX21OlWoMLKeymKoskkf/UTinB1o09KkrtWDw3rfYNURJWUTsAFzSYZxQfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmoUnHqLnl7AgD+CAmvehaGe96oxVQs0T/X/xWoAE/0=;
 b=ex1MmoKzGlaaH7zDyefGsBORw+zsQCZ6BqpgZFIJknlusyppJCvSGHdwuBFWRkERjVAki8o94aFUYAod3bdvkDQXGQH/7ZACXYmz3dfW1b+RXAmXC9UoNdOpyyQAP6Me33JyoUfLkVBBqG14pxiiLaMJwXn1d1nNnjbztiuX/eI=
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BM1PR01MB2482.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:44::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 6 Jan
 2021 10:31:46 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::68af:77fc:86a1:7a9d]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::68af:77fc:86a1:7a9d%5]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 10:31:46 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [poky][sumo][PATCH] ncurses: fix CVE-2019-17594, CVE-2019-17595
Thread-Topic: [poky][sumo][PATCH] ncurses: fix CVE-2019-17594, CVE-2019-17595
Thread-Index: AQHW5AuqslSc6KCNq0CZxW7x2Y3DUKoaZhgV
Date: Wed, 6 Jan 2021 10:31:45 +0000
Message-ID: 
 <BMXPR01MB3221900D1371DCF958666F8199D00@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
References: <20210106090924.8204-1-sanak@kpit.com>
In-Reply-To: <20210106090924.8204-1-sanak@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [2401:4900:1ff7:321a:8d2f:524c:b2dc:b8ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 19d0dd27-812d-4c5b-72be-08d8b22e4499
x-ms-traffictypediagnostic: BM1PR01MB2482:
x-microsoft-antispam-prvs: 
 <BM1PR01MB24825D6F7378981A23B85C2299D00@BM1PR01MB2482.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:107;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7h3sW0cmOAy8g3aQGOW7VmY3xQSC899+yDUDFHwl4UBfch/WrQ9X3XUDLh2OP7xjV98ZkcZFWNoMw2bI/03s8vTHIgmuwB+hu25LSQTAraQBpFwkWZr4tpqL8nIKV+kXtFoJmgezuUTwTEYF4khYUxaV9ma9bYhJAIYJXtoOzHQCFpoFDQHKuE45WyiIXfZ5L82heDi1jw3jWWQxJyOeiUHCVvZtsu46Sq9zQJZY0SA5j6hPGMZR7HDOuzi8YUDBOoS2tzmacvWv2txCCvA30K8CfHhmTWfYIip9ZTfHv0ISMMaRIvtwL8yYzbIHoOmBY89y8wWvWM8+kbPyQSfBCRlvUUNXhzl34HKpVD/xNy1mQXpvQStRxayxyfT79CIjScEu8Vb/l1fw1EooGwAh4J/YMqpp25agBpmod4Nk9sMRE/enEiiN/dYdglyjQxnnv/OtbYEvee35lSNhFG1EywqI+aXb7Pn0aHALVK8I+WAOXVa6W3OcZbAzNa2MaOlLQT9bR915szALeJQ7GcQyqw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(366004)(376002)(396003)(33656002)(86362001)(316002)(53546011)(7696005)(18265965003)(66574015)(166002)(83380400001)(66446008)(6916009)(52536014)(186003)(6506007)(45080400002)(66476007)(66556008)(478600001)(64756008)(55016002)(19627405001)(66946007)(8676002)(8936002)(76116006)(71200400001)(2906002)(9686003)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?Ejv6bRSjI2D4m/pDAjYkeR3rSxL3DqYkUxIYBoWHbtFWIdzKZgW/zcVYMv?=
 =?iso-8859-1?Q?7UK7Pse77cAlrqzCiyQ2P0dADH+ncBsOGJj1dwLOzv2OAzoNcmP6wlzYbM?=
 =?iso-8859-1?Q?rjp4InpSLzWOyoHCeSEPlSKZ+NkfMJoQkj4A1DmE9fNOuKbFFAgKe4Lizg?=
 =?iso-8859-1?Q?4nm2Psr4yqzwg4jElnk28AWssgyNodsAeWuKt3elPbjzMTqTHZwEDGsgib?=
 =?iso-8859-1?Q?8GxWwHu1fv12fxXEdxghJwVW4zrcr8wvP2Bc9NQMme+fPxvlL17epdtGY4?=
 =?iso-8859-1?Q?2jlG44V69wkrjQ1HdYsj8SlhCDbxGzSCl8udlr0iBV3TdLqZH6rWHoFWEY?=
 =?iso-8859-1?Q?l8LEFBBBTQCL1ZMZ/ZXpuJjy9c6hojbjfqhRwAKaF0TmaV8eRiwd1iaG6e?=
 =?iso-8859-1?Q?PnwMHgpND+ZOWag12pZ4W5/kthNZtYCUZr+4aRkrhV2xJorA7WmMKE2GhX?=
 =?iso-8859-1?Q?UIrRKf3/CbquuQ+A7y2T0IvIJKM1f9Z/BTBf5h/X1z6ZrT4kvS5377nxi1?=
 =?iso-8859-1?Q?sS/mZ3/E+q2M0Ix9BOmev4oyj4L3ZkCOb9Vl97o/VOs6142j+TB6ZE01Aa?=
 =?iso-8859-1?Q?FVTwYGXM10xw/mdwCcvzizUJ97QF+SaQrjNF+GzaJSY4UEG9+V7ljoV9AQ?=
 =?iso-8859-1?Q?ogaS+34GkF3w2JgIZ5xE3kGT6gWfzAW3iTEHqEz7ijIxptg0dJq9fXTn0M?=
 =?iso-8859-1?Q?mTdFaBmvVqWpTg+rxy70F8JJIKEl6jICPf9ZvmQf6n+gAKaZ4N6BKxLLRU?=
 =?iso-8859-1?Q?g404ZZUfrTyjQ39AVjZ1d5ndM4krAILsKBG8BSiPQQQcvapAzlvDRDw//8?=
 =?iso-8859-1?Q?R0GbUdPBrMpjL8/HiN+Rbf48LgX1wRNyo1IMR389RuzdemPBSLsR60uTd+?=
 =?iso-8859-1?Q?8P4FdT7ytl6Tl0CdeesTjSaJdmp9vmQBjJBhL+hIYe2T3XXrMBBa8aDVTW?=
 =?iso-8859-1?Q?wAUTkAmXs4tKInaeevmw6a7gs1gPonsEf0vjbETLYLPb+Q3uWmbYyGcuBD?=
 =?iso-8859-1?Q?XrzHkaAXkqg6VpT2joY7PQ28K8umKdlR6Mb3AqdmsLOFgB9tmdAadVbJPP?=
 =?iso-8859-1?Q?xE3O3LVMIAG3SGKqDVQqWZw=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d0dd27-812d-4c5b-72be-08d8b22e4499
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 10:31:45.9623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gcdGpyIb6qQ35TvnQu/9l8BqTRdgRGodcfPpdvghdc/YgKpdzVUhKuTRMxMb01oi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2482
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB3221900D1371DCF958666F8199D00BMXPR01MB3221INDP_"

--_000_BMXPR01MB3221900D1371DCF958666F8199D00BMXPR01MB3221INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




Regards,
Sana Kazi

________________________________
From: Sana Kazi <Sana.Kazi@kpit.com>
Sent: Wednesday, January 6, 2021 2:39 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Aditya Tayade <Aditya.Tayade@=
kpit.com>; Trevor Gamblin <trevor.gamblin@windriver.com>; Armin Kuster <aku=
ster808@gmail.com>; Richard Purdie <richard.purdie@linuxfoundation.org>; Sa=
na Kazi <Sana.Kazi@kpit.com>
Subject: [poky][sumo][PATCH] ncurses: fix CVE-2019-17594, CVE-2019-17595

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport changes to tinfo/comp_hash.c, tinfo/parse_entry.c,
and progs/dump_entry.c from upstream to fix CVEs.

(From OE-Core rev: 7ec70aeb0c6f6080523efa0f983fa36b92cb5558)

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 ...selective-backport-of-20191012-patch.patch | 158 ++++++++++++++++++
 .../ncurses/ncurses_6.0+20171125.bb           |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/0001-ncurses-selective-=
backport-of-20191012-patch.patch

diff --git a/meta/recipes-core/ncurses/files/0001-ncurses-selective-backpor=
t-of-20191012-patch.patch b/meta/recipes-core/ncurses/files/0001-ncurses-se=
lective-backport-of-20191012-patch.patch
new file mode 100644
index 0000000000..989a8ccd4e
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/0001-ncurses-selective-backport-of-20=
191012-patch.patch
@@ -0,0 +1,158 @@
+From 064b77f173337aa790f1cec0d741bfbc61a33d31 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Fri, 18 Oct 2019 09:57:43 -0400
+Subject: [PATCH] ncurses: selective backport of 20191012 patch
+
+Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fsalsa.debian.org%2Fdebian%2Fncurses%2Fcommit%2F243908b=
1e3d81&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7C80550d084ab7442c06d508d8=
b222cd4c%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637455209903558555%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;sdata=3DJ%2FrCRcik47L1Q0BQfVRWutz%2FObINAgtgrEv4sI=
YVj%2FM%3D&amp;reserved=3D0]
+
+Contents of the upstream patch that are not applied to comp_hash.c,
+parse_entry.c, or dump_entry.c have been omitted.
+
+CVE: CVE-2019-17594
+CVE: CVE-2019-17595
+
+Signed-off-by: Trevor Gamblin  <trevor.gamblin@windriver.com>
+
+---
+ ncurses/tinfo/comp_hash.c   | 14 ++++++++++----
+ ncurses/tinfo/parse_entry.c | 32 ++++++++++++++++----------------
+ progs/dump_entry.c          |  7 ++++---
+ 3 files changed, 30 insertions(+), 23 deletions(-)
+
+diff --git a/ncurses/tinfo/comp_hash.c b/ncurses/tinfo/comp_hash.c
+index 21f165ca..a62d38f9 100644
+--- a/ncurses/tinfo/comp_hash.c
++++ b/ncurses/tinfo/comp_hash.c
+@@ -44,7 +44,7 @@
+ #include <tic.h>
+ #include <hashsize.h>
+
+-MODULE_ID("$Id: comp_hash.c,v 1.48 2009/08/08 17:36:21 tom Exp $")
++MODULE_ID("$Id: comp_hash.c,v 1.51 2019/10/12 16:32:13 tom Exp $")
+
+ /*
+  * Finds the entry for the given string in the hash table if present.
+@@ -63,7 +63,9 @@ _nc_find_entry(const char *string,
+
+     hashvalue =3D data->hash_of(string);
+
+-    if (data->table_data[hashvalue] >=3D 0) {
++    if (hashvalue >=3D 0
++      && (unsigned) hashvalue < data->table_size
++      && data->table_data[hashvalue] >=3D 0) {
+
+        real_table =3D _nc_get_table(termcap);
+        ptr =3D real_table + data->table_data[hashvalue];
+@@ -96,7 +98,9 @@ _nc_find_type_entry(const char *string,
+     const HashData *data =3D _nc_get_hash_info(termcap);
+     int hashvalue =3D data->hash_of(string);
+
+-    if (data->table_data[hashvalue] >=3D 0) {
++    if (hashvalue >=3D 0
++      && (unsigned) hashvalue < data->table_size
++      && data->table_data[hashvalue] >=3D 0) {
+        const struct name_table_entry *const table =3D _nc_get_table(termc=
ap);
+
+        ptr =3D table + data->table_data[hashvalue];
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
+index f8cca8b5..064376c5 100644
+--- a/ncurses/tinfo/parse_entry.c
++++ b/ncurses/tinfo/parse_entry.c
+@@ -47,7 +47,7 @@
+ #include <ctype.h>
+ #include <tic.h>
+
+-MODULE_ID("$Id: parse_entry.c,v 1.91 2017/08/26 16:13:34 tom Exp $")
++MODULE_ID("$Id: parse_entry.c,v 1.98 2019/10/12 00:50:31 tom Exp $")
+
+ #ifdef LINT
+ static short const parametrized[] =3D
+@@ -654,12 +654,12 @@ _nc_capcmp(const char *s, const char *t)
+ }
+
+ static void
+-append_acs0(string_desc * dst, int code, int src)
++append_acs0(string_desc * dst, int code, char *src, size_t off)
+ {
+-    if (src !=3D 0) {
++    if (src !=3D 0 && off < strlen(src)) {
+        char temp[3];
+        temp[0] =3D (char) code;
+-      temp[1] =3D (char) src;
++      temp[1] =3D src[off];
+        temp[2] =3D 0;
+        _nc_safe_strcat(dst, temp);
+     }
+@@ -669,7 +669,7 @@ static void
+ append_acs(string_desc * dst, int code, char *src)
+ {
+     if (VALID_STRING(src) && strlen(src) =3D=3D 1) {
+-      append_acs0(dst, code, *src);
++      append_acs0(dst, code, src, 0);
+     }
+ }
+
+@@ -1038,17 +1038,17 @@ postprocess_terminfo(TERMTYPE2 *tp)
+        _nc_str_init(&result, buf2, sizeof(buf2));
+        _nc_safe_strcat(&result, acs_chars);
+
+-      append_acs0(&result, 'l', box_chars_1[0]);      /* ACS_ULCORNER */
+-      append_acs0(&result, 'q', box_chars_1[1]);      /* ACS_HLINE */
+-      append_acs0(&result, 'k', box_chars_1[2]);      /* ACS_URCORNER */
+-      append_acs0(&result, 'x', box_chars_1[3]);      /* ACS_VLINE */
+-      append_acs0(&result, 'j', box_chars_1[4]);      /* ACS_LRCORNER */
+-      append_acs0(&result, 'm', box_chars_1[5]);      /* ACS_LLCORNER */
+-      append_acs0(&result, 'w', box_chars_1[6]);      /* ACS_TTEE */
+-      append_acs0(&result, 'u', box_chars_1[7]);      /* ACS_RTEE */
+-      append_acs0(&result, 'v', box_chars_1[8]);      /* ACS_BTEE */
+-      append_acs0(&result, 't', box_chars_1[9]);      /* ACS_LTEE */
+-      append_acs0(&result, 'n', box_chars_1[10]);     /* ACS_PLUS */
++      append_acs0(&result, 'l', box_chars_1, 0);      /* ACS_ULCORNER */
++      append_acs0(&result, 'q', box_chars_1, 1);      /* ACS_HLINE */
++      append_acs0(&result, 'k', box_chars_1, 2);      /* ACS_URCORNER */
++      append_acs0(&result, 'x', box_chars_1, 3);      /* ACS_VLINE */
++      append_acs0(&result, 'j', box_chars_1, 4);      /* ACS_LRCORNER */
++      append_acs0(&result, 'm', box_chars_1, 5);      /* ACS_LLCORNER */
++      append_acs0(&result, 'w', box_chars_1, 6);      /* ACS_TTEE */
++      append_acs0(&result, 'u', box_chars_1, 7);      /* ACS_RTEE */
++      append_acs0(&result, 'v', box_chars_1, 8);      /* ACS_BTEE */
++      append_acs0(&result, 't', box_chars_1, 9);      /* ACS_LTEE */
++      append_acs0(&result, 'n', box_chars_1, 10);     /* ACS_PLUS */
+
+        if (buf2[0]) {
+            acs_chars =3D _nc_save_str(buf2);
+diff --git a/progs/dump_entry.c b/progs/dump_entry.c
+index d0e420ec..8a47084a 100644
+--- a/progs/dump_entry.c
++++ b/progs/dump_entry.c
+@@ -39,7 +39,7 @@
+ #include "termsort.c"         /* this C file is generated */
+ #include <parametrized.h>     /* so is this */
+
+-MODULE_ID("$Id: dump_entry.c,v 1.168 2017/09/02 21:01:54 tom Exp $")
++MODULE_ID("$Id: dump_entry.c,v 1.175 2019/10/12 15:59:07 tom Exp $")
+
+ #define DISCARD(string) string =3D ABSENT_STRING
+ #define PRINTF (void) printf
+@@ -1136,7 +1136,8 @@ fmt_entry(TERMTYPE2 *tterm,
+                                *d++ =3D '\\';
+                                *d =3D ':';
+                            } else if (*d =3D=3D '\\') {
+-                              *++d =3D *s++;
++                              if ((*++d =3D *s++) =3D=3D '\0')
++                                  break;
+                            }
+                            d++;
+                            *d =3D '\0';
+@@ -1396,7 +1397,7 @@ one_one_mapping(const char *mapping)
+
+     if (VALID_STRING(mapping)) {
+        int n =3D 0;
+-      while (mapping[n] !=3D '\0') {
++      while (mapping[n] !=3D '\0' && mapping[n + 1] !=3D '\0') {
+            if (isLine(mapping[n]) &&
+                mapping[n] !=3D mapping[n + 1]) {
+                result =3D FALSE;
+--
+2.17.1
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb b/meta/recip=
es-core/ncurses/ncurses_6.0+20171125.bb
index 6c4b96f428..ed5181f74f 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb
@@ -3,6 +3,7 @@ require ncurses.inc
 SRC_URI +=3D "file://0001-tic-hang.patch \
             file://0002-configure-reproducible.patch \
             file://config.cache \
+            file://0001-ncurses-selective-backport-of-20191012-patch.patch=
 \
 "
 # commit id corresponds to the revision in package version
 SRCREV =3D "5d849e836052459901cfe0b85a0b2939ff8d2b2a"
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

--_000_BMXPR01MB3221900D1371DCF958666F8199D00BMXPR01MB3221INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><br>
</div>
<div>Regards,</div>
<div>Sana Kazi<br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Sana Kazi &lt;Sana.=
Kazi@kpit.com&gt;<br>
<b>Sent:</b> Wednesday, January 6, 2021 2:39 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br=
>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Aditya Tayade &l=
t;Aditya.Tayade@kpit.com&gt;; Trevor Gamblin &lt;trevor.gamblin@windriver.c=
om&gt;; Armin Kuster &lt;akuster808@gmail.com&gt;; Richard Purdie &lt;richa=
rd.purdie@linuxfoundation.org&gt;; Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
<b>Subject:</b> [poky][sumo][PATCH] ncurses: fix CVE-2019-17594, CVE-2019-1=
7595</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">From: Trevor Gamblin &lt;trevor.gamblin@windriver.=
com&gt;<br>
<br>
Backport changes to tinfo/comp_hash.c, tinfo/parse_entry.c,<br>
and progs/dump_entry.c from upstream to fix CVEs.<br>
<br>
(From OE-Core rev: 7ec70aeb0c6f6080523efa0f983fa36b92cb5558)<br>
<br>
Signed-off-by: Trevor Gamblin &lt;trevor.gamblin@windriver.com&gt;<br>
Signed-off-by: Armin Kuster &lt;akuster808@gmail.com&gt;<br>
Signed-off-by: Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br=
>
Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
---<br>
&nbsp;...selective-backport-of-20191012-patch.patch | 158 +++++++++++++++++=
+<br>
&nbsp;.../ncurses/ncurses_6.0+20171125.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 159 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-core/ncurses/files/0001-ncurses-selec=
tive-backport-of-20191012-patch.patch<br>
<br>
diff --git a/meta/recipes-core/ncurses/files/0001-ncurses-selective-backpor=
t-of-20191012-patch.patch b/meta/recipes-core/ncurses/files/0001-ncurses-se=
lective-backport-of-20191012-patch.patch<br>
new file mode 100644<br>
index 0000000000..989a8ccd4e<br>
--- /dev/null<br>
+++ b/meta/recipes-core/ncurses/files/0001-ncurses-selective-backport-of-20=
191012-patch.patch<br>
@@ -0,0 +1,158 @@<br>
+From 064b77f173337aa790f1cec0d741bfbc61a33d31 Mon Sep 17 00:00:00 2001<br>
+From: Trevor Gamblin &lt;trevor.gamblin@windriver.com&gt;<br>
+Date: Fri, 18 Oct 2019 09:57:43 -0400<br>
+Subject: [PATCH] ncurses: selective backport of 20191012 patch<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fsalsa.debian.org%2Fdebian%2Fncurses%2Fcommi=
t%2F243908b1e3d81&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7C80550d084=
ab7442c06d508d8b222cd4c%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637455=
209903558555%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DJ%2FrCRcik47L1Q0BQfVRWu=
tz%2FObINAgtgrEv4sIYVj%2FM%3D&amp;amp;reserved=3D0">https://apc01.safelinks=
.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsalsa.debian.org%2Fdebian%2Fnc=
urses%2Fcommit%2F243908b1e3d81&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.co=
m%7C80550d084ab7442c06d508d8b222cd4c%7C3539451eb46e4a26a242ff61502855c7%7C0=
%7C0%7C637455209903558555%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DJ%2FrCRcik=
47L1Q0BQfVRWutz%2FObINAgtgrEv4sIYVj%2FM%3D&amp;amp;reserved=3D0</a>]<br>
+<br>
+Contents of the upstream patch that are not applied to comp_hash.c, <br>
+parse_entry.c, or dump_entry.c have been omitted.<br>
+<br>
+CVE: CVE-2019-17594<br>
+CVE: CVE-2019-17595<br>
+<br>
+Signed-off-by: Trevor Gamblin&nbsp; &lt;trevor.gamblin@windriver.com&gt;<b=
r>
+<br>
+---<br>
+ ncurses/tinfo/comp_hash.c&nbsp;&nbsp; | 14 ++++++++++----<br>
+ ncurses/tinfo/parse_entry.c | 32 ++++++++++++++++----------------<br>
+ progs/dump_entry.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp; 7 ++++---<br>
+ 3 files changed, 30 insertions(+), 23 deletions(-)<br>
+<br>
+diff --git a/ncurses/tinfo/comp_hash.c b/ncurses/tinfo/comp_hash.c<br>
+index 21f165ca..a62d38f9 100644<br>
+--- a/ncurses/tinfo/comp_hash.c<br>
++++ b/ncurses/tinfo/comp_hash.c<br>
+@@ -44,7 +44,7 @@<br>
+ #include &lt;tic.h&gt;<br>
+ #include &lt;hashsize.h&gt;<br>
+ <br>
+-MODULE_ID(&quot;$Id: comp_hash.c,v 1.48 2009/08/08 17:36:21 tom Exp $&quo=
t;)<br>
++MODULE_ID(&quot;$Id: comp_hash.c,v 1.51 2019/10/12 16:32:13 tom Exp $&quo=
t;)<br>
+ <br>
+ /*<br>
+&nbsp; * Finds the entry for the given string in the hash table if present=
.<br>
+@@ -63,7 +63,9 @@ _nc_find_entry(const char *string,<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; hashvalue =3D data-&gt;hash_of(string);<br>
+ <br>
+-&nbsp;&nbsp;&nbsp; if (data-&gt;table_data[hashvalue] &gt;=3D 0) {<br>
++&nbsp;&nbsp;&nbsp; if (hashvalue &gt;=3D 0<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; (unsigned) hashvalue &lt; data-=
&gt;table_size<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; data-&gt;table_data[hashvalue] =
&gt;=3D 0) {<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; real_table =3D _nc_get_table(te=
rmcap);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr =3D real_table + data-&gt;t=
able_data[hashvalue];<br>
+@@ -96,7 +98,9 @@ _nc_find_type_entry(const char *string,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; const HashData *data =3D _nc_get_hash_info(termca=
p);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; int hashvalue =3D data-&gt;hash_of(string);<br>
+ <br>
+-&nbsp;&nbsp;&nbsp; if (data-&gt;table_data[hashvalue] &gt;=3D 0) {<br>
++&nbsp;&nbsp;&nbsp; if (hashvalue &gt;=3D 0<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; (unsigned) hashvalue &lt; data-=
&gt;table_size<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; data-&gt;table_data[hashvalue] =
&gt;=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct name_table_entry *=
const table =3D _nc_get_table(termcap);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ptr =3D table + data-&gt;table_=
data[hashvalue];<br>
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c<br>
+index f8cca8b5..064376c5 100644<br>
+--- a/ncurses/tinfo/parse_entry.c<br>
++++ b/ncurses/tinfo/parse_entry.c<br>
+@@ -47,7 +47,7 @@<br>
+ #include &lt;ctype.h&gt;<br>
+ #include &lt;tic.h&gt;<br>
+ <br>
+-MODULE_ID(&quot;$Id: parse_entry.c,v 1.91 2017/08/26 16:13:34 tom Exp $&q=
uot;)<br>
++MODULE_ID(&quot;$Id: parse_entry.c,v 1.98 2019/10/12 00:50:31 tom Exp $&q=
uot;)<br>
+ <br>
+ #ifdef LINT<br>
+ static short const parametrized[] =3D<br>
+@@ -654,12 +654,12 @@ _nc_capcmp(const char *s, const char *t)<br>
+ }<br>
+ <br>
+ static void<br>
+-append_acs0(string_desc * dst, int code, int src)<br>
++append_acs0(string_desc * dst, int code, char *src, size_t off)<br>
+ {<br>
+-&nbsp;&nbsp;&nbsp; if (src !=3D 0) {<br>
++&nbsp;&nbsp;&nbsp; if (src !=3D 0 &amp;&amp; off &lt; strlen(src)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char temp[3];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp[0] =3D (char) code;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp[1] =3D (char) src;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp[1] =3D src[off];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp[2] =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _nc_safe_strcat(dst, temp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+@@ -669,7 +669,7 @@ static void<br>
+ append_acs(string_desc * dst, int code, char *src)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (VALID_STRING(src) &amp;&amp; strlen(src) =3D=
=3D 1) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(dst, code, *src);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(dst, code, src, 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ }<br>
+ <br>
+@@ -1038,17 +1038,17 @@ postprocess_terminfo(TERMTYPE2 *tp)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _nc_str_init(&amp;result, buf2,=
 sizeof(buf2));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _nc_safe_strcat(&amp;result, ac=
s_chars);<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'l', box_chars_1[=
0]);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_ULCORNER */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'q', box_chars_1[=
1]);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_HLINE */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'k', box_chars_1[=
2]);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_URCORNER */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'x', box_chars_1[=
3]);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_VLINE */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'j', box_chars_1[=
4]);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_LRCORNER */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'm', box_chars_1[=
5]);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_LLCORNER */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'w', box_chars_1[=
6]);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_TTEE */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'u', box_chars_1[=
7]);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_RTEE */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'v', box_chars_1[=
8]);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_BTEE */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 't', box_chars_1[=
9]);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_LTEE */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'n', box_chars_1[=
10]);&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_PLUS */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'l', box_chars_1,=
 0);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_ULCORNER */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'q', box_chars_1,=
 1);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_HLINE */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'k', box_chars_1,=
 2);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_URCORNER */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'x', box_chars_1,=
 3);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_VLINE */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'j', box_chars_1,=
 4);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_LRCORNER */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'm', box_chars_1,=
 5);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_LLCORNER */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'w', box_chars_1,=
 6);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_TTEE */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'u', box_chars_1,=
 7);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_RTEE */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'v', box_chars_1,=
 8);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_BTEE */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 't', box_chars_1,=
 9);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_LTEE */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; append_acs0(&amp;result, 'n', box_chars_1,=
 10);&nbsp;&nbsp;&nbsp;&nbsp; /* ACS_PLUS */<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (buf2[0]) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acs_cha=
rs =3D _nc_save_str(buf2);<br>
+diff --git a/progs/dump_entry.c b/progs/dump_entry.c<br>
+index d0e420ec..8a47084a 100644<br>
+--- a/progs/dump_entry.c<br>
++++ b/progs/dump_entry.c<br>
+@@ -39,7 +39,7 @@<br>
+ #include &quot;termsort.c&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; /* this C file is generated */<br>
+ #include &lt;parametrized.h&gt;&nbsp;&nbsp;&nbsp;&nbsp; /* so is this */<=
br>
+ <br>
+-MODULE_ID(&quot;$Id: dump_entry.c,v 1.168 2017/09/02 21:01:54 tom Exp $&q=
uot;)<br>
++MODULE_ID(&quot;$Id: dump_entry.c,v 1.175 2019/10/12 15:59:07 tom Exp $&q=
uot;)<br>
+ <br>
+ #define DISCARD(string) string =3D ABSENT_STRING<br>
+ #define PRINTF (void) printf<br>
+@@ -1136,7 +1136,8 @@ fmt_entry(TERMTYPE2 *tterm,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *d++ =3D '\\';<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *d =3D ':';<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; } else if (*d =3D=3D '\\') {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; *++d =3D *s++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if ((*++d =3D *s++) =3D=3D '\0')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; d++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; *d =3D '\0';<br>
+@@ -1396,7 +1397,7 @@ one_one_mapping(const char *mapping)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (VALID_STRING(mapping)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int n =3D 0;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (mapping[n] !=3D '\0') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (mapping[n] !=3D '\0' &amp;&amp; map=
ping[n + 1] !=3D '\0') {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (isL=
ine(mapping[n]) &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; mapping[n] !=3D mapping[n + 1]) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; result =3D FALSE;<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb b/meta/recip=
es-core/ncurses/ncurses_6.0+20171125.bb<br>
index 6c4b96f428..ed5181f74f 100644<br>
--- a/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb<br>
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20171125.bb<br>
@@ -3,6 +3,7 @@ require ncurses.inc<br>
&nbsp;SRC_URI +=3D &quot;<a href=3D""></a>file://0001-tic-hang.patch \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://0002-configure-reproducible.patch">file://0002-configure-re=
producible.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://config.cache">file://config.cache</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-ncurses-selective-backport-of-20191012-patch.patch">
file://0001-ncurses-selective-backport-of-20191012-patch.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;# commit id corresponds to the revision in package version<br>
&nbsp;SRCREV =3D &quot;5d849e836052459901cfe0b85a0b2939ff8d2b2a&quot;<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_BMXPR01MB3221900D1371DCF958666F8199D00BMXPR01MB3221INDP_--
