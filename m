Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E18EC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:54:12 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1076.1787118847534806233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WqPkQaVZ;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=255549; q=dns/txt;
  s=iport01; t=1787118847; x=1788328447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FI/cryX/W4JoxJxi3VXEMAmMY8XXzFCC6F1o3Xdv4RM=;
  b=WqPkQaVZKQX+Ws9L6D4X8QdKF1eNbNLe3c1ZZUQ2ytHhIkc1FVl9381/
   kEDsX5/2aDEE9JkvN+R7rgWGHU2lTCpF/yQEVfwa8Dl29nw/gVWPerQVE
   dYQ/96fKzsW0VRW7JvcSuUPwTrRgS5x/3a3D81ANvbiN1OYV9RkcK+4Bv
   USAoiG8lPu6RQjvcPzIel5M7vKmwevQyclmhlEKUrOzB64k0UFDiYgK9v
   9XLRJajMdkxOgDyrpYjPI2DVG83y5KLXeiZkX631o03rpTOGCAZfJVrhP
   vRLx/KLej9JKRLKyYBl3DC65QgVdb2kaGcaVXif0ApqTey+yi/5Uzi5wv
   A==;
X-CSE-ConnectionGUID: nKmhZFRGQnyBZnkgSZ8T2g==
X-CSE-MsgGUID: WNGMvsDCTZiW/W8yx1u58g==
X-IPAS-Result: A0CiBAAXRIVq/5QQJK3AQJNsBgMCIwMHBZcegb8M
IronPort-Data: A9a23:8dfhjK6gD4ioT/wLiB2VYgxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jEfXm6EOP2NNmr2f9h+bNmy9UlTvZGAnINkSwo5rH0zZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNuvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eO64d+tRZO0538
 +0yGjYOYSux197sz+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP00n1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FYIOKJIDRG5wE9qqej
 l3g0EHnGT0xCO6e9n26omO83/KSzSyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXzFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:wNPLhqDOMo5W573lHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: 9a23:DJVYJG/Nci7vTd8usRKVv0g3H8AXXEfy9XHBCX2+CmlSeu2pE1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AfZ/lLgy4j5CHIWkzyEfojRN7DQeaqJuIJ2UTirk?=
 =?us-ascii?q?th/uFCmtPayaN1SnqEoByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="817643619"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 05:54:06 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 54A9F18000989;
	Wed, 19 Aug 2026 05:54:06 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id E58D2CCA79B; Tue, 18 Aug 2026 22:54:05 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH] python3-lxml: fix CVE-2026-41066
Date: Tue, 18 Aug 2026 22:54:03 -0700
Message-Id: <20260819055403.4036170-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 05:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243705

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/lxml/lxml/commit/ab431ea0b9a7357d968f1d1c5c614649e9a=
af358
[2] https://github.com/lxml/lxml/security/advisories/GHSA-vfmq-68hx-4jfw

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/python3-lxml/CVE-2026-41066.patch  | 4613 +++++++++++++++++
 .../python/python3-lxml_5.0.2.bb              |    4 +-
 2 files changed, 4616 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-lxml/CVE-2026-4106=
6.patch

diff --git a/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch=
 b/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
new file mode 100644
index 0000000000..9c333d7ef7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
@@ -0,0 +1,4613 @@
+From 4fe0735416504223919151aa43c8ccba4626597f Mon Sep 17 00:00:00 2001
+From: Stefan Behnel <stefan_ml@behnel.de>
+Date: Fri, 10 Apr 2026 10:13:03 +0200
+Subject: [PATCH] LP#2146291: Set "resolve_entities=3D'internal'" as defaul=
t for
+ all parser subclasses.
+
+CVE: CVE-2026-41066
+Upstream-Status: Backport [https://github.com/lxml/lxml/commit/ab431ea0b9a=
7357d968f1d1c5c614649e9aaf358]
+
+Backport Changes:
+- Keep the lxml 5.0.2 XMLParser signature without decompress.
+- Regenerate etree.c because Scarthgap builds without Cython.
+
+(cherry picked from commit ab431ea0b9a7357d968f1d1c5c614649e9aaf358)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/lxml/etree.c       | 1242 ++++++++++++++++++++--------------------
+ src/lxml/iterparse.pxi |    8 +-
+ src/lxml/parser.pxi    |    6 +-
+ 3 files changed, 629 insertions(+), 627 deletions(-)
+
+diff --git a/src/lxml/etree.c b/src/lxml/etree.c
+index 6012a1b..d3d1412 100644
+--- a/src/lxml/etree.c
++++ b/src/lxml/etree.c
+@@ -1931,7 +1931,7 @@ enum __pyx_t_4lxml_5etree__IncrementalFileWriterStat=
us {
+   __pyx_e_4lxml_5etree_WRITER_FINISHED =3D 4
+ };
+=20
+-/* "src/lxml/iterparse.pxi":234
++/* "src/lxml/iterparse.pxi":236
+  *=20
+  *=20
+  * cdef enum _IterwalkSkipStates:             # <<<<<<<<<<<<<<
+@@ -3146,7 +3146,7 @@ struct __pyx_obj_4lxml_5etree__FeedParser {
+  *     )
+  *=20
+  * cdef class XMLParser(_FeedParser):             # <<<<<<<<<<<<<<
+- *     u"""XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, d=
td_validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFals=
e, recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_bl=
ank_text=3DFalse, resolve_entities=3DTrue, remove_comments=3DFalse, remove_=
pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, compact=
=3DTrue)
++ *     u"""XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, d=
td_validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFals=
e, recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_bl=
ank_text=3DFalse, resolve_entities=3D'internal', remove_comments=3DFalse, r=
emove_pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, c=
ompact=3DTrue)
+  *=20
+  */
+ struct __pyx_obj_4lxml_5etree_XMLParser {
+@@ -3530,7 +3530,7 @@ struct __pyx_obj_4lxml_5etree_iterparse {
+ };
+=20
+=20
+-/* "src/lxml/iterparse.pxi":241
++/* "src/lxml/iterparse.pxi":243
+  *=20
+  *=20
+  * cdef class iterwalk:             # <<<<<<<<<<<<<<
+@@ -5424,7 +5424,7 @@ static struct __pyx_vtabstruct_4lxml_5etree__FeedPar=
ser *__pyx_vtabptr_4lxml_5et
+  *     )
+  *=20
+  * cdef class XMLParser(_FeedParser):             # <<<<<<<<<<<<<<
+- *     u"""XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, d=
td_validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFals=
e, recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_bl=
ank_text=3DFalse, resolve_entities=3DTrue, remove_comments=3DFalse, remove_=
pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, compact=
=3DTrue)
++ *     u"""XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, d=
td_validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFals=
e, recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_bl=
ank_text=3DFalse, resolve_entities=3D'internal', remove_comments=3DFalse, r=
emove_pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, c=
ompact=3DTrue)
+  *=20
+  */
+=20
+@@ -5695,7 +5695,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse__cl=
ose_source(struct __pyx_obj_
+ static int __pyx_f_4lxml_5etree_9iterparse__read_more_events(struct __pyx=
_obj_4lxml_5etree_iterparse *, struct __pyx_obj_4lxml_5etree__SaxParserCont=
ext *);
+=20
+=20
+-/* "src/lxml/iterparse.pxi":241
++/* "src/lxml/iterparse.pxi":243
+  *=20
+  *=20
+  * cdef class iterwalk:             # <<<<<<<<<<<<<<
+@@ -142620,7 +142620,7 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXMLPa=
rser_1__init__(PyObject *__pyx_v
+  *     def __init__(self, *, encoding=3DNone, attribute_defaults=3DFalse,
+  *                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue,             # <<<<<<<<<<<<<<
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  */
+     values[2] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+     values[3] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+@@ -142630,7 +142630,7 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXMLPa=
rser_1__init__(PyObject *__pyx_v
+  *     def __init__(self, *, encoding=3DNone, attribute_defaults=3DFalse,
+  *                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue,
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,    =
         # <<<<<<<<<<<<<<
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,
+  */
+     values[5] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+@@ -142640,17 +142640,17 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXML=
Parser_1__init__(PyObject *__pyx_v
+     /* "src/lxml/parser.pxi":1703
+  *                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue,
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,             # <<<<<<<<<<<<<<
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',             # <<<<<<<<<<<<<<
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,
+  *                  target=3DNone, compact=3DTrue):
+  */
+     values[8] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+     values[9] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+-    values[10] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_True));
++    values[10] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)__pyx_n_s_intern=
al));
+=20
+     /* "src/lxml/parser.pxi":1704
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,             # <<<<<<<<<<<<<<
+  *                  target=3DNone, compact=3DTrue):
+  *         XMLParser.__init__(self,
+@@ -142660,7 +142660,7 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXMLPa=
rser_1__init__(PyObject *__pyx_v
+     values[13] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_True));
+=20
+     /* "src/lxml/parser.pxi":1705
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,
+  *                  target=3DNone, compact=3DTrue):             # <<<<<<<=
<<<<<<<
+  *         XMLParser.__init__(self,
+@@ -191363,7 +191363,7 @@ static PyObject *__pyx_gb_4lxml_5etree_14_Method=
Changer_11generator12(__pyx_Coro
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":67
++/* "src/lxml/iterparse.pxi":69
+  *     cdef bint _close_source_after_read
+  *=20
+  *     def __init__(self, source, events=3D(u"end",), *, tag=3DNone,     =
        # <<<<<<<<<<<<<<
+@@ -191413,41 +191413,41 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1_=
_init__(PyObject *__pyx_v_self, Py
+     values[1] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)__pyx_tuple__91));
+     values[2] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_None));
+=20
+-    /* "src/lxml/iterparse.pxi":68
++    /* "src/lxml/iterparse.pxi":70
+  *=20
+  *     def __init__(self, source, events=3D(u"end",), *, tag=3DNone,
+  *                  attribute_defaults=3DFalse, dtd_validation=3DFalse,  =
           # <<<<<<<<<<<<<<
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  */
+     values[3] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+     values[4] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+=20
+-    /* "src/lxml/iterparse.pxi":69
++    /* "src/lxml/iterparse.pxi":71
+  *     def __init__(self, source, events=3D(u"end",), *, tag=3DNone,
+  *                  attribute_defaults=3DFalse, dtd_validation=3DFalse,
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,             # <<<<<<<<<<<<<<
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,
+  */
+     values[5] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+     values[6] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_True));
+     values[7] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+=20
+-    /* "src/lxml/iterparse.pxi":70
++    /* "src/lxml/iterparse.pxi":72
+  *                  attribute_defaults=3DFalse, dtd_validation=3DFalse,
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,             # <<<<<<<<<<<<<<
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,             # <<<<<<<<<<<<<<
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,
+  */
+     values[8] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_True));
+-    values[9] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_True));
++    values[9] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)__pyx_n_s_interna=
l));
+     values[10] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+=20
+-    /* "src/lxml/iterparse.pxi":71
++    /* "src/lxml/iterparse.pxi":73
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,             # <<<<<<<<<<<<<<
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,
+  *                  XMLSchema schema=3DNone):
+@@ -191456,8 +191456,8 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1__i=
nit__(PyObject *__pyx_v_self, Py
+     values[12] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_True));
+     values[13] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_None));
+=20
+-    /* "src/lxml/iterparse.pxi":72
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++    /* "src/lxml/iterparse.pxi":74
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,             # <<<<<<<<<<<<<<
+  *                  XMLSchema schema=3DNone):
+@@ -191468,7 +191468,7 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1__i=
nit__(PyObject *__pyx_v_self, Py
+     values[16] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+     values[17] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_True));
+=20
+-    /* "src/lxml/iterparse.pxi":73
++    /* "src/lxml/iterparse.pxi":75
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,
+  *                  XMLSchema schema=3DNone):             # <<<<<<<<<<<<<<
+@@ -191493,14 +191493,14 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1_=
_init__(PyObject *__pyx_v_self, Py
+           (void)__Pyx_Arg_NewRef_VARARGS(values[0]);
+           kw_args--;
+         }
+-        else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 67, __pyx_L3_e=
rror)
++        else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 69, __pyx_L3_e=
rror)
+         else goto __pyx_L5_argtuple_error;
+         CYTHON_FALLTHROUGH;
+         case  1:
+         if (kw_args > 0) {
+           PyObject* value =3D __Pyx_GetKwValue_VARARGS(__pyx_kwds, __pyx_=
kwvalues, __pyx_n_s_events);
+           if (value) { values[1] =3D __Pyx_Arg_NewRef_VARARGS(value); kw_=
args--; }
+-          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 67, __pyx_L3=
_error)
++          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 69, __pyx_L3=
_error)
+         }
+       }
+       if (kw_args > 0 && likely(kw_args <=3D 17)) {
+@@ -191508,12 +191508,12 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1_=
_init__(PyObject *__pyx_v_self, Py
+         for (index =3D 2; index < 19 && kw_args > 0; index++) {
+           PyObject* value =3D __Pyx_GetKwValue_VARARGS(__pyx_kwds, __pyx_=
kwvalues, *__pyx_pyargnames[index]);
+           if (value) { values[index] =3D __Pyx_Arg_NewRef_VARARGS(value);=
 kw_args--; }
+-          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 67, __pyx_L3=
_error)
++          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 69, __pyx_L3=
_error)
+         }
+       }
+       if (unlikely(kw_args > 0)) {
+         const Py_ssize_t kwd_pos_args =3D __pyx_nargs;
+-        if (unlikely(__Pyx_ParseOptionalKeywords(__pyx_kwds, __pyx_kwvalu=
es, __pyx_pyargnames, 0, values + 0, kwd_pos_args, "__init__") < 0)) __PYX_=
ERR(14, 67, __pyx_L3_error)
++        if (unlikely(__Pyx_ParseOptionalKeywords(__pyx_kwds, __pyx_kwvalu=
es, __pyx_pyargnames, 0, values + 0, kwd_pos_args, "__init__") < 0)) __PYX_=
ERR(14, 69, __pyx_L3_error)
+       }
+     } else {
+       switch (__pyx_nargs) {
+@@ -191546,7 +191546,7 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1__i=
nit__(PyObject *__pyx_v_self, Py
+   }
+   goto __pyx_L6_skip;
+   __pyx_L5_argtuple_error:;
+-  __Pyx_RaiseArgtupleInvalid("__init__", 0, 1, 2, __pyx_nargs); __PYX_ERR=
(14, 67, __pyx_L3_error)
++  __Pyx_RaiseArgtupleInvalid("__init__", 0, 1, 2, __pyx_nargs); __PYX_ERR=
(14, 69, __pyx_L3_error)
+   __pyx_L6_skip:;
+   goto __pyx_L4_argument_unpacking_done;
+   __pyx_L3_error:;
+@@ -191560,10 +191560,10 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1_=
_init__(PyObject *__pyx_v_self, Py
+   __Pyx_RefNannyFinishContext();
+   return -1;
+   __pyx_L4_argument_unpacking_done:;
+-  if (unlikely(!__Pyx_ArgTypeTest(((PyObject *)__pyx_v_schema), __pyx_pty=
pe_4lxml_5etree_XMLSchema, 1, "schema", 0))) __PYX_ERR(14, 73, __pyx_L1_err=
or)
++  if (unlikely(!__Pyx_ArgTypeTest(((PyObject *)__pyx_v_schema), __pyx_pty=
pe_4lxml_5etree_XMLSchema, 1, "schema", 0))) __PYX_ERR(14, 75, __pyx_L1_err=
or)
+   __pyx_r =3D __pyx_pf_4lxml_5etree_9iterparse___init__(((struct __pyx_ob=
j_4lxml_5etree_iterparse *)__pyx_v_self), __pyx_v_source, __pyx_v_events, _=
_pyx_v_tag, __pyx_v_attribute_defaults, __pyx_v_dtd_validation, __pyx_v_loa=
d_dtd, __pyx_v_no_network, __pyx_v_remove_blank_text, __pyx_v_compact, __py=
x_v_resolve_entities, __pyx_v_remove_comments, __pyx_v_remove_pis, __pyx_v_=
strip_cdata, __pyx_v_encoding, __pyx_v_html, __pyx_v_recover, __pyx_v_huge_=
tree, __pyx_v_collect_ids, __pyx_v_schema);
+=20
+-  /* "src/lxml/iterparse.pxi":67
++  /* "src/lxml/iterparse.pxi":69
+  *     cdef bint _close_source_after_read
+  *=20
+  *     def __init__(self, source, events=3D(u"end",), *, tag=3DNone,     =
        # <<<<<<<<<<<<<<
+@@ -191607,30 +191607,30 @@ static int __pyx_pf_4lxml_5etree_9iterparse___=
init__(struct __pyx_obj_4lxml_5etr
+   __Pyx_INCREF(__pyx_v_events);
+   __Pyx_INCREF(__pyx_v_recover);
+=20
+-  /* "src/lxml/iterparse.pxi":74
++  /* "src/lxml/iterparse.pxi":76
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,
+  *                  XMLSchema schema=3DNone):
+  *         if not hasattr(source, 'read'):             # <<<<<<<<<<<<<<
+  *             source =3D _getFSPathOrObject(source)
+  *             self._filename =3D source
+  */
+-  __pyx_t_1 =3D __Pyx_HasAttr(__pyx_v_source, __pyx_n_s_read); if (unlike=
ly(__pyx_t_1 =3D=3D ((int)-1))) __PYX_ERR(14, 74, __pyx_L1_error)
++  __pyx_t_1 =3D __Pyx_HasAttr(__pyx_v_source, __pyx_n_s_read); if (unlike=
ly(__pyx_t_1 =3D=3D ((int)-1))) __PYX_ERR(14, 76, __pyx_L1_error)
+   __pyx_t_2 =3D (!__pyx_t_1);
+   if (__pyx_t_2) {
+=20
+-    /* "src/lxml/iterparse.pxi":75
++    /* "src/lxml/iterparse.pxi":77
+  *                  XMLSchema schema=3DNone):
+  *         if not hasattr(source, 'read'):
+  *             source =3D _getFSPathOrObject(source)             # <<<<<<=
<<<<<<<<
+  *             self._filename =3D source
+  *             if python.IS_PYTHON2:
+  */
+-    __pyx_t_3 =3D __pyx_f_4lxml_5etree__getFSPathOrObject(__pyx_v_source)=
; if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 75, __pyx_L1_error)
++    __pyx_t_3 =3D __pyx_f_4lxml_5etree__getFSPathOrObject(__pyx_v_source)=
; if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 77, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_3);
+     __Pyx_DECREF_SET(__pyx_v_source, __pyx_t_3);
+     __pyx_t_3 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":76
++    /* "src/lxml/iterparse.pxi":78
+  *         if not hasattr(source, 'read'):
+  *             source =3D _getFSPathOrObject(source)
+  *             self._filename =3D source             # <<<<<<<<<<<<<<
+@@ -191643,7 +191643,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+     __Pyx_DECREF(__pyx_v_self->_filename);
+     __pyx_v_self->_filename =3D __pyx_v_source;
+=20
+-    /* "src/lxml/iterparse.pxi":77
++    /* "src/lxml/iterparse.pxi":79
+  *             source =3D _getFSPathOrObject(source)
+  *             self._filename =3D source
+  *             if python.IS_PYTHON2:             # <<<<<<<<<<<<<<
+@@ -191652,19 +191652,19 @@ static int __pyx_pf_4lxml_5etree_9iterparse___=
init__(struct __pyx_obj_4lxml_5etr
+  */
+     if (IS_PYTHON2) {
+=20
+-      /* "src/lxml/iterparse.pxi":78
++      /* "src/lxml/iterparse.pxi":80
+  *             self._filename =3D source
+  *             if python.IS_PYTHON2:
+  *                 source =3D _encodeFilename(source)             # <<<<<=
<<<<<<<<<
+  *             source =3D open(source, 'rb')
+  *             self._close_source_after_read =3D True
+  */
+-      __pyx_t_3 =3D __pyx_f_4lxml_5etree__encodeFilename(__pyx_v_source);=
 if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 78, __pyx_L1_error)
++      __pyx_t_3 =3D __pyx_f_4lxml_5etree__encodeFilename(__pyx_v_source);=
 if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 80, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_3);
+       __Pyx_DECREF_SET(__pyx_v_source, __pyx_t_3);
+       __pyx_t_3 =3D 0;
+=20
+-      /* "src/lxml/iterparse.pxi":77
++      /* "src/lxml/iterparse.pxi":79
+  *             source =3D _getFSPathOrObject(source)
+  *             self._filename =3D source
+  *             if python.IS_PYTHON2:             # <<<<<<<<<<<<<<
+@@ -191673,14 +191673,14 @@ static int __pyx_pf_4lxml_5etree_9iterparse___=
init__(struct __pyx_obj_4lxml_5etr
+  */
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":79
++    /* "src/lxml/iterparse.pxi":81
+  *             if python.IS_PYTHON2:
+  *                 source =3D _encodeFilename(source)
+  *             source =3D open(source, 'rb')             # <<<<<<<<<<<<<<
+  *             self._close_source_after_read =3D True
+  *         else:
+  */
+-    __Pyx_GetModuleGlobalName(__pyx_t_4, __pyx_n_s_open); if (unlikely(!_=
_pyx_t_4)) __PYX_ERR(14, 79, __pyx_L1_error)
++    __Pyx_GetModuleGlobalName(__pyx_t_4, __pyx_n_s_open); if (unlikely(!_=
_pyx_t_4)) __PYX_ERR(14, 81, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_4);
+     __pyx_t_5 =3D NULL;
+     __pyx_t_6 =3D 0;
+@@ -191700,14 +191700,14 @@ static int __pyx_pf_4lxml_5etree_9iterparse___=
init__(struct __pyx_obj_4lxml_5etr
+       PyObject *__pyx_callargs[3] =3D {__pyx_t_5, __pyx_v_source, __pyx_n=
_s_rb};
+       __pyx_t_3 =3D __Pyx_PyObject_FastCall(__pyx_t_4, __pyx_callargs+1-_=
_pyx_t_6, 2+__pyx_t_6);
+       __Pyx_XDECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+-      if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 79, __pyx_L1_error)
++      if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 81, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_3);
+       __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+     }
+     __Pyx_DECREF_SET(__pyx_v_source, __pyx_t_3);
+     __pyx_t_3 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":80
++    /* "src/lxml/iterparse.pxi":82
+  *                 source =3D _encodeFilename(source)
+  *             source =3D open(source, 'rb')
+  *             self._close_source_after_read =3D True             # <<<<<=
<<<<<<<<<
+@@ -191716,7 +191716,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+  */
+     __pyx_v_self->_close_source_after_read =3D 1;
+=20
+-    /* "src/lxml/iterparse.pxi":74
++    /* "src/lxml/iterparse.pxi":76
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,
+  *                  XMLSchema schema=3DNone):
+  *         if not hasattr(source, 'read'):             # <<<<<<<<<<<<<<
+@@ -191726,7 +191726,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+     goto __pyx_L3;
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":82
++  /* "src/lxml/iterparse.pxi":84
+  *             self._close_source_after_read =3D True
+  *         else:
+  *             self._filename =3D _getFilenameForFile(source)            =
 # <<<<<<<<<<<<<<
+@@ -191734,7 +191734,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+  *=20
+  */
+   /*else*/ {
+-    __pyx_t_3 =3D __pyx_f_4lxml_5etree__getFilenameForFile(__pyx_v_source=
); if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 82, __pyx_L1_error)
++    __pyx_t_3 =3D __pyx_f_4lxml_5etree__getFilenameForFile(__pyx_v_source=
); if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 84, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_3);
+     __Pyx_GIVEREF(__pyx_t_3);
+     __Pyx_GOTREF(__pyx_v_self->_filename);
+@@ -191742,7 +191742,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+     __pyx_v_self->_filename =3D __pyx_t_3;
+     __pyx_t_3 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":83
++    /* "src/lxml/iterparse.pxi":85
+  *         else:
+  *             self._filename =3D _getFilenameForFile(source)
+  *             self._close_source_after_read =3D False             # <<<<=
<<<<<<<<<<
+@@ -191753,7 +191753,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+   }
+   __pyx_L3:;
+=20
+-  /* "src/lxml/iterparse.pxi":85
++  /* "src/lxml/iterparse.pxi":87
+  *             self._close_source_after_read =3D False
+  *=20
+  *         if recover is None:             # <<<<<<<<<<<<<<
+@@ -191763,7 +191763,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+   __pyx_t_2 =3D (__pyx_v_recover =3D=3D Py_None);
+   if (__pyx_t_2) {
+=20
+-    /* "src/lxml/iterparse.pxi":86
++    /* "src/lxml/iterparse.pxi":88
+  *=20
+  *         if recover is None:
+  *             recover =3D html             # <<<<<<<<<<<<<<
+@@ -191773,7 +191773,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+     __Pyx_INCREF(__pyx_v_html);
+     __Pyx_DECREF_SET(__pyx_v_recover, __pyx_v_html);
+=20
+-    /* "src/lxml/iterparse.pxi":85
++    /* "src/lxml/iterparse.pxi":87
+  *             self._close_source_after_read =3D False
+  *=20
+  *         if recover is None:             # <<<<<<<<<<<<<<
+@@ -191782,33 +191782,33 @@ static int __pyx_pf_4lxml_5etree_9iterparse___=
init__(struct __pyx_obj_4lxml_5etr
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":88
++  /* "src/lxml/iterparse.pxi":90
+  *             recover =3D html
+  *=20
+  *         if html:             # <<<<<<<<<<<<<<
+  *             # make sure we're not looking for namespaces
+  *             events =3D [event for event in events
+  */
+-  __pyx_t_2 =3D __Pyx_PyObject_IsTrue(__pyx_v_html); if (unlikely((__pyx_=
t_2 < 0))) __PYX_ERR(14, 88, __pyx_L1_error)
++  __pyx_t_2 =3D __Pyx_PyObject_IsTrue(__pyx_v_html); if (unlikely((__pyx_=
t_2 < 0))) __PYX_ERR(14, 90, __pyx_L1_error)
+   if (__pyx_t_2) {
+=20
+-    /* "src/lxml/iterparse.pxi":90
++    /* "src/lxml/iterparse.pxi":92
+  *         if html:
+  *             # make sure we're not looking for namespaces
+  *             events =3D [event for event in events             # <<<<<<=
<<<<<<<<
+  *                       if event not in ('start-ns', 'end-ns')]
+  *             parser =3D HTMLPullParser(
+  */
+-    __pyx_t_3 =3D PyList_New(0); if (unlikely(!__pyx_t_3)) __PYX_ERR(14, =
90, __pyx_L1_error)
++    __pyx_t_3 =3D PyList_New(0); if (unlikely(!__pyx_t_3)) __PYX_ERR(14, =
92, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_3);
+     if (likely(PyList_CheckExact(__pyx_v_events)) || PyTuple_CheckExact(_=
_pyx_v_events)) {
+       __pyx_t_4 =3D __pyx_v_events; __Pyx_INCREF(__pyx_t_4);
+       __pyx_t_7 =3D 0;
+       __pyx_t_8 =3D NULL;
+     } else {
+-      __pyx_t_7 =3D -1; __pyx_t_4 =3D PyObject_GetIter(__pyx_v_events); i=
f (unlikely(!__pyx_t_4)) __PYX_ERR(14, 90, __pyx_L1_error)
++      __pyx_t_7 =3D -1; __pyx_t_4 =3D PyObject_GetIter(__pyx_v_events); i=
f (unlikely(!__pyx_t_4)) __PYX_ERR(14, 92, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_4);
+-      __pyx_t_8 =3D __Pyx_PyObject_GetIterNextFunc(__pyx_t_4); if (unlike=
ly(!__pyx_t_8)) __PYX_ERR(14, 90, __pyx_L1_error)
++      __pyx_t_8 =3D __Pyx_PyObject_GetIterNextFunc(__pyx_t_4); if (unlike=
ly(!__pyx_t_8)) __PYX_ERR(14, 92, __pyx_L1_error)
+     }
+     for (;;) {
+       if (likely(!__pyx_t_8)) {
+@@ -191816,28 +191816,28 @@ static int __pyx_pf_4lxml_5etree_9iterparse___=
init__(struct __pyx_obj_4lxml_5etr
+           {
+             Py_ssize_t __pyx_temp =3D __Pyx_PyList_GET_SIZE(__pyx_t_4);
+             #if !CYTHON_ASSUME_SAFE_MACROS
+-            if (unlikely((__pyx_temp < 0))) __PYX_ERR(14, 90, __pyx_L1_er=
ror)
++            if (unlikely((__pyx_temp < 0))) __PYX_ERR(14, 92, __pyx_L1_er=
ror)
+             #endif
+             if (__pyx_t_7 >=3D __pyx_temp) break;
+           }
+           #if CYTHON_ASSUME_SAFE_MACROS && !CYTHON_AVOID_BORROWED_REFS
+-          __pyx_t_5 =3D PyList_GET_ITEM(__pyx_t_4, __pyx_t_7); __Pyx_INCR=
EF(__pyx_t_5); __pyx_t_7++; if (unlikely((0 < 0))) __PYX_ERR(14, 90, __pyx_=
L1_error)
++          __pyx_t_5 =3D PyList_GET_ITEM(__pyx_t_4, __pyx_t_7); __Pyx_INCR=
EF(__pyx_t_5); __pyx_t_7++; if (unlikely((0 < 0))) __PYX_ERR(14, 92, __pyx_=
L1_error)
+           #else
+-          __pyx_t_5 =3D __Pyx_PySequence_ITEM(__pyx_t_4, __pyx_t_7); __py=
x_t_7++; if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 90, __pyx_L1_error)
++          __pyx_t_5 =3D __Pyx_PySequence_ITEM(__pyx_t_4, __pyx_t_7); __py=
x_t_7++; if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 92, __pyx_L1_error)
+           __Pyx_GOTREF(__pyx_t_5);
+           #endif
+         } else {
+           {
+             Py_ssize_t __pyx_temp =3D __Pyx_PyTuple_GET_SIZE(__pyx_t_4);
+             #if !CYTHON_ASSUME_SAFE_MACROS
+-            if (unlikely((__pyx_temp < 0))) __PYX_ERR(14, 90, __pyx_L1_er=
ror)
++            if (unlikely((__pyx_temp < 0))) __PYX_ERR(14, 92, __pyx_L1_er=
ror)
+             #endif
+             if (__pyx_t_7 >=3D __pyx_temp) break;
+           }
+           #if CYTHON_ASSUME_SAFE_MACROS && !CYTHON_AVOID_BORROWED_REFS
+-          __pyx_t_5 =3D PyTuple_GET_ITEM(__pyx_t_4, __pyx_t_7); __Pyx_INC=
REF(__pyx_t_5); __pyx_t_7++; if (unlikely((0 < 0))) __PYX_ERR(14, 90, __pyx=
_L1_error)
++          __pyx_t_5 =3D PyTuple_GET_ITEM(__pyx_t_4, __pyx_t_7); __Pyx_INC=
REF(__pyx_t_5); __pyx_t_7++; if (unlikely((0 < 0))) __PYX_ERR(14, 92, __pyx=
_L1_error)
+           #else
+-          __pyx_t_5 =3D __Pyx_PySequence_ITEM(__pyx_t_4, __pyx_t_7); __py=
x_t_7++; if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 90, __pyx_L1_error)
++          __pyx_t_5 =3D __Pyx_PySequence_ITEM(__pyx_t_4, __pyx_t_7); __py=
x_t_7++; if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 92, __pyx_L1_error)
+           __Pyx_GOTREF(__pyx_t_5);
+           #endif
+         }
+@@ -191847,7 +191847,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+           PyObject* exc_type =3D PyErr_Occurred();
+           if (exc_type) {
+             if (likely(__Pyx_PyErr_GivenExceptionMatches(exc_type, PyExc_=
StopIteration))) PyErr_Clear();
+-            else __PYX_ERR(14, 90, __pyx_L1_error)
++            else __PYX_ERR(14, 92, __pyx_L1_error)
+           }
+           break;
+         }
+@@ -191856,7 +191856,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+       __Pyx_XDECREF_SET(__pyx_v_event, __pyx_t_5);
+       __pyx_t_5 =3D 0;
+=20
+-      /* "src/lxml/iterparse.pxi":91
++      /* "src/lxml/iterparse.pxi":93
+  *             # make sure we're not looking for namespaces
+  *             events =3D [event for event in events
+  *                       if event not in ('start-ns', 'end-ns')]         =
    # <<<<<<<<<<<<<<
+@@ -191865,29 +191865,29 @@ static int __pyx_pf_4lxml_5etree_9iterparse___=
init__(struct __pyx_obj_4lxml_5etr
+  */
+       __Pyx_INCREF(__pyx_v_event);
+       __pyx_t_5 =3D __pyx_v_event;
+-      __pyx_t_1 =3D (__Pyx_PyString_Equals(__pyx_t_5, __pyx_kp_s_start_ns=
, Py_NE)); if (unlikely((__pyx_t_1 < 0))) __PYX_ERR(14, 91, __pyx_L1_error)
++      __pyx_t_1 =3D (__Pyx_PyString_Equals(__pyx_t_5, __pyx_kp_s_start_ns=
, Py_NE)); if (unlikely((__pyx_t_1 < 0))) __PYX_ERR(14, 93, __pyx_L1_error)
+       if (__pyx_t_1) {
+       } else {
+         __pyx_t_2 =3D __pyx_t_1;
+         goto __pyx_L10_bool_binop_done;
+       }
+-      __pyx_t_1 =3D (__Pyx_PyString_Equals(__pyx_t_5, __pyx_kp_s_end_ns, =
Py_NE)); if (unlikely((__pyx_t_1 < 0))) __PYX_ERR(14, 91, __pyx_L1_error)
++      __pyx_t_1 =3D (__Pyx_PyString_Equals(__pyx_t_5, __pyx_kp_s_end_ns, =
Py_NE)); if (unlikely((__pyx_t_1 < 0))) __PYX_ERR(14, 93, __pyx_L1_error)
+       __pyx_t_2 =3D __pyx_t_1;
+       __pyx_L10_bool_binop_done:;
+       __Pyx_DECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+       __pyx_t_1 =3D __pyx_t_2;
+       if (__pyx_t_1) {
+=20
+-        /* "src/lxml/iterparse.pxi":90
++        /* "src/lxml/iterparse.pxi":92
+  *         if html:
+  *             # make sure we're not looking for namespaces
+  *             events =3D [event for event in events             # <<<<<<=
<<<<<<<<
+  *                       if event not in ('start-ns', 'end-ns')]
+  *             parser =3D HTMLPullParser(
+  */
+-        if (unlikely(__Pyx_ListComp_Append(__pyx_t_3, (PyObject*)__pyx_v_=
event))) __PYX_ERR(14, 90, __pyx_L1_error)
++        if (unlikely(__Pyx_ListComp_Append(__pyx_t_3, (PyObject*)__pyx_v_=
event))) __PYX_ERR(14, 92, __pyx_L1_error)
+=20
+-        /* "src/lxml/iterparse.pxi":91
++        /* "src/lxml/iterparse.pxi":93
+  *             # make sure we're not looking for namespaces
+  *             events =3D [event for event in events
+  *                       if event not in ('start-ns', 'end-ns')]         =
    # <<<<<<<<<<<<<<
+@@ -191896,7 +191896,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+  */
+       }
+=20
+-      /* "src/lxml/iterparse.pxi":90
++      /* "src/lxml/iterparse.pxi":92
+  *         if html:
+  *             # make sure we're not looking for namespaces
+  *             events =3D [event for event in events             # <<<<<<=
<<<<<<<<
+@@ -191908,144 +191908,144 @@ static int __pyx_pf_4lxml_5etree_9iterparse_=
__init__(struct __pyx_obj_4lxml_5etr
+     __Pyx_DECREF_SET(__pyx_v_events, __pyx_t_3);
+     __pyx_t_3 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":92
++    /* "src/lxml/iterparse.pxi":94
+  *             events =3D [event for event in events
+  *                       if event not in ('start-ns', 'end-ns')]
+  *             parser =3D HTMLPullParser(             # <<<<<<<<<<<<<<
+  *                 events,
+  *                 tag=3Dtag,
+  */
+-    __pyx_t_3 =3D PyTuple_New(1); if (unlikely(!__pyx_t_3)) __PYX_ERR(14,=
 92, __pyx_L1_error)
++    __pyx_t_3 =3D PyTuple_New(1); if (unlikely(!__pyx_t_3)) __PYX_ERR(14,=
 94, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_3);
+     __Pyx_INCREF(__pyx_v_events);
+     __Pyx_GIVEREF(__pyx_v_events);
+-    if (__Pyx_PyTuple_SET_ITEM(__pyx_t_3, 0, __pyx_v_events)) __PYX_ERR(1=
4, 92, __pyx_L1_error);
++    if (__Pyx_PyTuple_SET_ITEM(__pyx_t_3, 0, __pyx_v_events)) __PYX_ERR(1=
4, 94, __pyx_L1_error);
+=20
+-    /* "src/lxml/iterparse.pxi":94
++    /* "src/lxml/iterparse.pxi":96
+  *             parser =3D HTMLPullParser(
+  *                 events,
+  *                 tag=3Dtag,             # <<<<<<<<<<<<<<
+  *                 recover=3Drecover,
+  *                 base_url=3Dself._filename,
+  */
+-    __pyx_t_4 =3D __Pyx_PyDict_NewPresized(12); if (unlikely(!__pyx_t_4))=
 __PYX_ERR(14, 94, __pyx_L1_error)
++    __pyx_t_4 =3D __Pyx_PyDict_NewPresized(12); if (unlikely(!__pyx_t_4))=
 __PYX_ERR(14, 96, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_4);
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_tag, __pyx_v_tag) < 0) __PYX_=
ERR(14, 94, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_tag, __pyx_v_tag) < 0) __PYX_=
ERR(14, 96, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":95
++    /* "src/lxml/iterparse.pxi":97
+  *                 events,
+  *                 tag=3Dtag,
+  *                 recover=3Drecover,             # <<<<<<<<<<<<<<
+  *                 base_url=3Dself._filename,
+  *                 encoding=3Dencoding,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_recover, __pyx_v_recover) < 0=
) __PYX_ERR(14, 94, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_recover, __pyx_v_recover) < 0=
) __PYX_ERR(14, 96, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":96
++    /* "src/lxml/iterparse.pxi":98
+  *                 tag=3Dtag,
+  *                 recover=3Drecover,
+  *                 base_url=3Dself._filename,             # <<<<<<<<<<<<<<
+  *                 encoding=3Dencoding,
+  *                 remove_blank_text=3Dremove_blank_text,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_base_url, __pyx_v_self->_file=
name) < 0) __PYX_ERR(14, 94, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_base_url, __pyx_v_self->_file=
name) < 0) __PYX_ERR(14, 96, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":97
++    /* "src/lxml/iterparse.pxi":99
+  *                 recover=3Drecover,
+  *                 base_url=3Dself._filename,
+  *                 encoding=3Dencoding,             # <<<<<<<<<<<<<<
+  *                 remove_blank_text=3Dremove_blank_text,
+  *                 remove_comments=3Dremove_comments,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_encoding, __pyx_v_encoding) <=
 0) __PYX_ERR(14, 94, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_encoding, __pyx_v_encoding) <=
 0) __PYX_ERR(14, 96, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":98
++    /* "src/lxml/iterparse.pxi":100
+  *                 base_url=3Dself._filename,
+  *                 encoding=3Dencoding,
+  *                 remove_blank_text=3Dremove_blank_text,             # <=
<<<<<<<<<<<<<
+  *                 remove_comments=3Dremove_comments,
+  *                 remove_pis=3Dremove_pis,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_remove_blank_text, __pyx_v_re=
move_blank_text) < 0) __PYX_ERR(14, 94, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_remove_blank_text, __pyx_v_re=
move_blank_text) < 0) __PYX_ERR(14, 96, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":99
++    /* "src/lxml/iterparse.pxi":101
+  *                 encoding=3Dencoding,
+  *                 remove_blank_text=3Dremove_blank_text,
+  *                 remove_comments=3Dremove_comments,             # <<<<<=
<<<<<<<<<
+  *                 remove_pis=3Dremove_pis,
+  *                 strip_cdata=3Dstrip_cdata,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_remove_comments, __pyx_v_remo=
ve_comments) < 0) __PYX_ERR(14, 94, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_remove_comments, __pyx_v_remo=
ve_comments) < 0) __PYX_ERR(14, 96, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":100
++    /* "src/lxml/iterparse.pxi":102
+  *                 remove_blank_text=3Dremove_blank_text,
+  *                 remove_comments=3Dremove_comments,
+  *                 remove_pis=3Dremove_pis,             # <<<<<<<<<<<<<<
+  *                 strip_cdata=3Dstrip_cdata,
+  *                 no_network=3Dno_network,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_remove_pis, __pyx_v_remove_pi=
s) < 0) __PYX_ERR(14, 94, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_remove_pis, __pyx_v_remove_pi=
s) < 0) __PYX_ERR(14, 96, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":101
++    /* "src/lxml/iterparse.pxi":103
+  *                 remove_comments=3Dremove_comments,
+  *                 remove_pis=3Dremove_pis,
+  *                 strip_cdata=3Dstrip_cdata,             # <<<<<<<<<<<<<<
+  *                 no_network=3Dno_network,
+  *                 target=3DNone,  # TODO
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_strip_cdata, __pyx_v_strip_cd=
ata) < 0) __PYX_ERR(14, 94, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_strip_cdata, __pyx_v_strip_cd=
ata) < 0) __PYX_ERR(14, 96, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":102
++    /* "src/lxml/iterparse.pxi":104
+  *                 remove_pis=3Dremove_pis,
+  *                 strip_cdata=3Dstrip_cdata,
+  *                 no_network=3Dno_network,             # <<<<<<<<<<<<<<
+  *                 target=3DNone,  # TODO
+  *                 schema=3Dschema,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_no_network, __pyx_v_no_networ=
k) < 0) __PYX_ERR(14, 94, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_no_network, __pyx_v_no_networ=
k) < 0) __PYX_ERR(14, 96, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":103
++    /* "src/lxml/iterparse.pxi":105
+  *                 strip_cdata=3Dstrip_cdata,
+  *                 no_network=3Dno_network,
+  *                 target=3DNone,  # TODO             # <<<<<<<<<<<<<<
+  *                 schema=3Dschema,
+  *                 compact=3Dcompact)
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_target, Py_None) < 0) __PYX_E=
RR(14, 94, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_target, Py_None) < 0) __PYX_E=
RR(14, 96, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":104
++    /* "src/lxml/iterparse.pxi":106
+  *                 no_network=3Dno_network,
+  *                 target=3DNone,  # TODO
+  *                 schema=3Dschema,             # <<<<<<<<<<<<<<
+  *                 compact=3Dcompact)
+  *         else:
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_schema, ((PyObject *)__pyx_v_=
schema)) < 0) __PYX_ERR(14, 94, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_schema, ((PyObject *)__pyx_v_=
schema)) < 0) __PYX_ERR(14, 96, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":105
++    /* "src/lxml/iterparse.pxi":107
+  *                 target=3DNone,  # TODO
+  *                 schema=3Dschema,
+  *                 compact=3Dcompact)             # <<<<<<<<<<<<<<
+  *         else:
+  *             parser =3D XMLPullParser(
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_compact, __pyx_v_compact) < 0=
) __PYX_ERR(14, 94, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_compact, __pyx_v_compact) < 0=
) __PYX_ERR(14, 96, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":92
++    /* "src/lxml/iterparse.pxi":94
+  *             events =3D [event for event in events
+  *                       if event not in ('start-ns', 'end-ns')]
+  *             parser =3D HTMLPullParser(             # <<<<<<<<<<<<<<
+  *                 events,
+  *                 tag=3Dtag,
+  */
+-    __pyx_t_5 =3D __Pyx_PyObject_Call(((PyObject *)__pyx_ptype_4lxml_5etr=
ee_HTMLPullParser), __pyx_t_3, __pyx_t_4); if (unlikely(!__pyx_t_5)) __PYX_=
ERR(14, 92, __pyx_L1_error)
++    __pyx_t_5 =3D __Pyx_PyObject_Call(((PyObject *)__pyx_ptype_4lxml_5etr=
ee_HTMLPullParser), __pyx_t_3, __pyx_t_4); if (unlikely(!__pyx_t_5)) __PYX_=
ERR(14, 94, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_5);
+     __Pyx_DECREF(__pyx_t_3); __pyx_t_3 =3D 0;
+     __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+     __pyx_v_parser =3D ((struct __pyx_obj_4lxml_5etree__FeedParser *)__py=
x_t_5);
+     __pyx_t_5 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":88
++    /* "src/lxml/iterparse.pxi":90
+  *             recover =3D html
+  *=20
+  *         if html:             # <<<<<<<<<<<<<<
+@@ -192055,7 +192055,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+     goto __pyx_L6;
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":107
++  /* "src/lxml/iterparse.pxi":109
+  *                 compact=3Dcompact)
+  *         else:
+  *             parser =3D XMLPullParser(             # <<<<<<<<<<<<<<
+@@ -192064,191 +192064,191 @@ static int __pyx_pf_4lxml_5etree_9iterparse_=
__init__(struct __pyx_obj_4lxml_5etr
+  */
+   /*else*/ {
+=20
+-    /* "src/lxml/iterparse.pxi":108
++    /* "src/lxml/iterparse.pxi":110
+  *         else:
+  *             parser =3D XMLPullParser(
+  *                 events,             # <<<<<<<<<<<<<<
+  *                 tag=3Dtag,
+  *                 recover=3Drecover,
+  */
+-    __pyx_t_5 =3D PyTuple_New(1); if (unlikely(!__pyx_t_5)) __PYX_ERR(14,=
 107, __pyx_L1_error)
++    __pyx_t_5 =3D PyTuple_New(1); if (unlikely(!__pyx_t_5)) __PYX_ERR(14,=
 109, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_5);
+     __Pyx_INCREF(__pyx_v_events);
+     __Pyx_GIVEREF(__pyx_v_events);
+-    if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 0, __pyx_v_events)) __PYX_ERR(1=
4, 107, __pyx_L1_error);
++    if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 0, __pyx_v_events)) __PYX_ERR(1=
4, 109, __pyx_L1_error);
+=20
+-    /* "src/lxml/iterparse.pxi":109
++    /* "src/lxml/iterparse.pxi":111
+  *             parser =3D XMLPullParser(
+  *                 events,
+  *                 tag=3Dtag,             # <<<<<<<<<<<<<<
+  *                 recover=3Drecover,
+  *                 base_url=3Dself._filename,
+  */
+-    __pyx_t_4 =3D __Pyx_PyDict_NewPresized(18); if (unlikely(!__pyx_t_4))=
 __PYX_ERR(14, 109, __pyx_L1_error)
++    __pyx_t_4 =3D __Pyx_PyDict_NewPresized(18); if (unlikely(!__pyx_t_4))=
 __PYX_ERR(14, 111, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_4);
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_tag, __pyx_v_tag) < 0) __PYX_=
ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_tag, __pyx_v_tag) < 0) __PYX_=
ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":110
++    /* "src/lxml/iterparse.pxi":112
+  *                 events,
+  *                 tag=3Dtag,
+  *                 recover=3Drecover,             # <<<<<<<<<<<<<<
+  *                 base_url=3Dself._filename,
+  *                 encoding=3Dencoding,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_recover, __pyx_v_recover) < 0=
) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_recover, __pyx_v_recover) < 0=
) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":111
++    /* "src/lxml/iterparse.pxi":113
+  *                 tag=3Dtag,
+  *                 recover=3Drecover,
+  *                 base_url=3Dself._filename,             # <<<<<<<<<<<<<<
+  *                 encoding=3Dencoding,
+  *                 attribute_defaults=3Dattribute_defaults,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_base_url, __pyx_v_self->_file=
name) < 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_base_url, __pyx_v_self->_file=
name) < 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":112
++    /* "src/lxml/iterparse.pxi":114
+  *                 recover=3Drecover,
+  *                 base_url=3Dself._filename,
+  *                 encoding=3Dencoding,             # <<<<<<<<<<<<<<
+  *                 attribute_defaults=3Dattribute_defaults,
+  *                 dtd_validation=3Ddtd_validation,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_encoding, __pyx_v_encoding) <=
 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_encoding, __pyx_v_encoding) <=
 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":113
++    /* "src/lxml/iterparse.pxi":115
+  *                 base_url=3Dself._filename,
+  *                 encoding=3Dencoding,
+  *                 attribute_defaults=3Dattribute_defaults,             #=
 <<<<<<<<<<<<<<
+  *                 dtd_validation=3Ddtd_validation,
+  *                 load_dtd=3Dload_dtd,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_attribute_defaults, __pyx_v_a=
ttribute_defaults) < 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_attribute_defaults, __pyx_v_a=
ttribute_defaults) < 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":114
++    /* "src/lxml/iterparse.pxi":116
+  *                 encoding=3Dencoding,
+  *                 attribute_defaults=3Dattribute_defaults,
+  *                 dtd_validation=3Ddtd_validation,             # <<<<<<<=
<<<<<<<
+  *                 load_dtd=3Dload_dtd,
+  *                 no_network=3Dno_network,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_dtd_validation, __pyx_v_dtd_v=
alidation) < 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_dtd_validation, __pyx_v_dtd_v=
alidation) < 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":115
++    /* "src/lxml/iterparse.pxi":117
+  *                 attribute_defaults=3Dattribute_defaults,
+  *                 dtd_validation=3Ddtd_validation,
+  *                 load_dtd=3Dload_dtd,             # <<<<<<<<<<<<<<
+  *                 no_network=3Dno_network,
+  *                 schema=3Dschema,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_load_dtd, __pyx_v_load_dtd) <=
 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_load_dtd, __pyx_v_load_dtd) <=
 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":116
++    /* "src/lxml/iterparse.pxi":118
+  *                 dtd_validation=3Ddtd_validation,
+  *                 load_dtd=3Dload_dtd,
+  *                 no_network=3Dno_network,             # <<<<<<<<<<<<<<
+  *                 schema=3Dschema,
+  *                 huge_tree=3Dhuge_tree,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_no_network, __pyx_v_no_networ=
k) < 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_no_network, __pyx_v_no_networ=
k) < 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":117
++    /* "src/lxml/iterparse.pxi":119
+  *                 load_dtd=3Dload_dtd,
+  *                 no_network=3Dno_network,
+  *                 schema=3Dschema,             # <<<<<<<<<<<<<<
+  *                 huge_tree=3Dhuge_tree,
+  *                 remove_blank_text=3Dremove_blank_text,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_schema, ((PyObject *)__pyx_v_=
schema)) < 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_schema, ((PyObject *)__pyx_v_=
schema)) < 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":118
++    /* "src/lxml/iterparse.pxi":120
+  *                 no_network=3Dno_network,
+  *                 schema=3Dschema,
+  *                 huge_tree=3Dhuge_tree,             # <<<<<<<<<<<<<<
+  *                 remove_blank_text=3Dremove_blank_text,
+  *                 resolve_entities=3Dresolve_entities,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_huge_tree, __pyx_v_huge_tree)=
 < 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_huge_tree, __pyx_v_huge_tree)=
 < 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":119
++    /* "src/lxml/iterparse.pxi":121
+  *                 schema=3Dschema,
+  *                 huge_tree=3Dhuge_tree,
+  *                 remove_blank_text=3Dremove_blank_text,             # <=
<<<<<<<<<<<<<
+  *                 resolve_entities=3Dresolve_entities,
+  *                 remove_comments=3Dremove_comments,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_remove_blank_text, __pyx_v_re=
move_blank_text) < 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_remove_blank_text, __pyx_v_re=
move_blank_text) < 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":120
++    /* "src/lxml/iterparse.pxi":122
+  *                 huge_tree=3Dhuge_tree,
+  *                 remove_blank_text=3Dremove_blank_text,
+  *                 resolve_entities=3Dresolve_entities,             # <<<=
<<<<<<<<<<<
+  *                 remove_comments=3Dremove_comments,
+  *                 remove_pis=3Dremove_pis,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_resolve_entities, __pyx_v_res=
olve_entities) < 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_resolve_entities, __pyx_v_res=
olve_entities) < 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":121
++    /* "src/lxml/iterparse.pxi":123
+  *                 remove_blank_text=3Dremove_blank_text,
+  *                 resolve_entities=3Dresolve_entities,
+  *                 remove_comments=3Dremove_comments,             # <<<<<=
<<<<<<<<<
+  *                 remove_pis=3Dremove_pis,
+  *                 strip_cdata=3Dstrip_cdata,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_remove_comments, __pyx_v_remo=
ve_comments) < 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_remove_comments, __pyx_v_remo=
ve_comments) < 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":122
++    /* "src/lxml/iterparse.pxi":124
+  *                 resolve_entities=3Dresolve_entities,
+  *                 remove_comments=3Dremove_comments,
+  *                 remove_pis=3Dremove_pis,             # <<<<<<<<<<<<<<
+  *                 strip_cdata=3Dstrip_cdata,
+  *                 collect_ids=3DTrue,
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_remove_pis, __pyx_v_remove_pi=
s) < 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_remove_pis, __pyx_v_remove_pi=
s) < 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":123
++    /* "src/lxml/iterparse.pxi":125
+  *                 remove_comments=3Dremove_comments,
+  *                 remove_pis=3Dremove_pis,
+  *                 strip_cdata=3Dstrip_cdata,             # <<<<<<<<<<<<<<
+  *                 collect_ids=3DTrue,
+  *                 target=3DNone,  # TODO
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_strip_cdata, __pyx_v_strip_cd=
ata) < 0) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_strip_cdata, __pyx_v_strip_cd=
ata) < 0) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":124
++    /* "src/lxml/iterparse.pxi":126
+  *                 remove_pis=3Dremove_pis,
+  *                 strip_cdata=3Dstrip_cdata,
+  *                 collect_ids=3DTrue,             # <<<<<<<<<<<<<<
+  *                 target=3DNone,  # TODO
+  *                 compact=3Dcompact)
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_collect_ids, Py_True) < 0) __=
PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_collect_ids, Py_True) < 0) __=
PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":125
++    /* "src/lxml/iterparse.pxi":127
+  *                 strip_cdata=3Dstrip_cdata,
+  *                 collect_ids=3DTrue,
+  *                 target=3DNone,  # TODO             # <<<<<<<<<<<<<<
+  *                 compact=3Dcompact)
+  *=20
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_target, Py_None) < 0) __PYX_E=
RR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_target, Py_None) < 0) __PYX_E=
RR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":126
++    /* "src/lxml/iterparse.pxi":128
+  *                 collect_ids=3DTrue,
+  *                 target=3DNone,  # TODO
+  *                 compact=3Dcompact)             # <<<<<<<<<<<<<<
+  *=20
+  *         self._events =3D parser.read_events()
+  */
+-    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_compact, __pyx_v_compact) < 0=
) __PYX_ERR(14, 109, __pyx_L1_error)
++    if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_compact, __pyx_v_compact) < 0=
) __PYX_ERR(14, 111, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":107
++    /* "src/lxml/iterparse.pxi":109
+  *                 compact=3Dcompact)
+  *         else:
+  *             parser =3D XMLPullParser(             # <<<<<<<<<<<<<<
+  *                 events,
+  *                 tag=3Dtag,
+  */
+-    __pyx_t_3 =3D __Pyx_PyObject_Call(((PyObject *)__pyx_ptype_4lxml_5etr=
ee_XMLPullParser), __pyx_t_5, __pyx_t_4); if (unlikely(!__pyx_t_3)) __PYX_E=
RR(14, 107, __pyx_L1_error)
++    __pyx_t_3 =3D __Pyx_PyObject_Call(((PyObject *)__pyx_ptype_4lxml_5etr=
ee_XMLPullParser), __pyx_t_5, __pyx_t_4); if (unlikely(!__pyx_t_3)) __PYX_E=
RR(14, 109, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_3);
+     __Pyx_DECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+     __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+@@ -192257,14 +192257,14 @@ static int __pyx_pf_4lxml_5etree_9iterparse___=
init__(struct __pyx_obj_4lxml_5etr
+   }
+   __pyx_L6:;
+=20
+-  /* "src/lxml/iterparse.pxi":128
++  /* "src/lxml/iterparse.pxi":130
+  *                 compact=3Dcompact)
+  *=20
+  *         self._events =3D parser.read_events()             # <<<<<<<<<<=
<<<<
+  *         self._parser =3D parser
+  *         self._source =3D source
+  */
+-  __pyx_t_4 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_parser), _=
_pyx_n_s_read_events); if (unlikely(!__pyx_t_4)) __PYX_ERR(14, 128, __pyx_L=
1_error)
++  __pyx_t_4 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_parser), _=
_pyx_n_s_read_events); if (unlikely(!__pyx_t_4)) __PYX_ERR(14, 130, __pyx_L=
1_error)
+   __Pyx_GOTREF(__pyx_t_4);
+   __pyx_t_5 =3D NULL;
+   __pyx_t_6 =3D 0;
+@@ -192284,7 +192284,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+     PyObject *__pyx_callargs[2] =3D {__pyx_t_5, NULL};
+     __pyx_t_3 =3D __Pyx_PyObject_FastCall(__pyx_t_4, __pyx_callargs+1-__p=
yx_t_6, 0+__pyx_t_6);
+     __Pyx_XDECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+-    if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 128, __pyx_L1_error)
++    if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 130, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_3);
+     __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+   }
+@@ -192294,7 +192294,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+   __pyx_v_self->_events =3D __pyx_t_3;
+   __pyx_t_3 =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":129
++  /* "src/lxml/iterparse.pxi":131
+  *=20
+  *         self._events =3D parser.read_events()
+  *         self._parser =3D parser             # <<<<<<<<<<<<<<
+@@ -192307,7 +192307,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+   __Pyx_DECREF((PyObject *)__pyx_v_self->_parser);
+   __pyx_v_self->_parser =3D __pyx_v_parser;
+=20
+-  /* "src/lxml/iterparse.pxi":130
++  /* "src/lxml/iterparse.pxi":132
+  *         self._events =3D parser.read_events()
+  *         self._parser =3D parser
+  *         self._source =3D source             # <<<<<<<<<<<<<<
+@@ -192320,7 +192320,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+   __Pyx_DECREF(__pyx_v_self->_source);
+   __pyx_v_self->_source =3D __pyx_v_source;
+=20
+-  /* "src/lxml/iterparse.pxi":67
++  /* "src/lxml/iterparse.pxi":69
+  *     cdef bint _close_source_after_read
+  *=20
+  *     def __init__(self, source, events=3D(u"end",), *, tag=3DNone,     =
        # <<<<<<<<<<<<<<
+@@ -192347,7 +192347,7 @@ static int __pyx_pf_4lxml_5etree_9iterparse___in=
it__(struct __pyx_obj_4lxml_5etr
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":132
++/* "src/lxml/iterparse.pxi":134
+  *         self._source =3D source
+  *=20
+  *     @property             # <<<<<<<<<<<<<<
+@@ -192379,7 +192379,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_9error_log___get__(struct __py
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("__get__", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":136
++  /* "src/lxml/iterparse.pxi":138
+  *         """The error log of the last (or current) parser run.
+  *         """
+  *         return self._parser.feed_error_log             # <<<<<<<<<<<<<<
+@@ -192387,13 +192387,13 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_9error_log___get__(struct __py
+  *     @property
+  */
+   __Pyx_XDECREF(__pyx_r);
+-  __pyx_t_1 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_self->_par=
ser), __pyx_n_s_feed_error_log); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 13=
6, __pyx_L1_error)
++  __pyx_t_1 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_self->_par=
ser), __pyx_n_s_feed_error_log); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 13=
8, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_1);
+   __pyx_r =3D __pyx_t_1;
+   __pyx_t_1 =3D 0;
+   goto __pyx_L0;
+=20
+-  /* "src/lxml/iterparse.pxi":132
++  /* "src/lxml/iterparse.pxi":134
+  *         self._source =3D source
+  *=20
+  *     @property             # <<<<<<<<<<<<<<
+@@ -192412,7 +192412,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_9error_log___get__(struct __py
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":138
++/* "src/lxml/iterparse.pxi":140
+  *         return self._parser.feed_error_log
+  *=20
+  *     @property             # <<<<<<<<<<<<<<
+@@ -192444,7 +192444,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_9resolvers___get__(struct __py
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("__get__", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":142
++  /* "src/lxml/iterparse.pxi":144
+  *         """The custom resolver registry of the last (or current) parse=
r run.
+  *         """
+  *         return self._parser.resolvers             # <<<<<<<<<<<<<<
+@@ -192452,13 +192452,13 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_9resolvers___get__(struct __py
+  *     @property
+  */
+   __Pyx_XDECREF(__pyx_r);
+-  __pyx_t_1 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_self->_par=
ser), __pyx_n_s_resolvers); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 142, __=
pyx_L1_error)
++  __pyx_t_1 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_self->_par=
ser), __pyx_n_s_resolvers); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 144, __=
pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_1);
+   __pyx_r =3D __pyx_t_1;
+   __pyx_t_1 =3D 0;
+   goto __pyx_L0;
+=20
+-  /* "src/lxml/iterparse.pxi":138
++  /* "src/lxml/iterparse.pxi":140
+  *         return self._parser.feed_error_log
+  *=20
+  *     @property             # <<<<<<<<<<<<<<
+@@ -192477,7 +192477,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_9resolvers___get__(struct __py
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":144
++/* "src/lxml/iterparse.pxi":146
+  *         return self._parser.resolvers
+  *=20
+  *     @property             # <<<<<<<<<<<<<<
+@@ -192509,7 +192509,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_7version___get__(struct __pyx_
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("__get__", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":147
++  /* "src/lxml/iterparse.pxi":149
+  *     def version(self):
+  *         """The version of the underlying XML parser."""
+  *         return self._parser.version             # <<<<<<<<<<<<<<
+@@ -192517,13 +192517,13 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_7version___get__(struct __pyx_
+  *     def set_element_class_lookup(self, ElementClassLookup lookup =3D N=
one):
+  */
+   __Pyx_XDECREF(__pyx_r);
+-  __pyx_t_1 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_self->_par=
ser), __pyx_n_s_version); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 147, __py=
x_L1_error)
++  __pyx_t_1 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_self->_par=
ser), __pyx_n_s_version); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 149, __py=
x_L1_error)
+   __Pyx_GOTREF(__pyx_t_1);
+   __pyx_r =3D __pyx_t_1;
+   __pyx_t_1 =3D 0;
+   goto __pyx_L0;
+=20
+-  /* "src/lxml/iterparse.pxi":144
++  /* "src/lxml/iterparse.pxi":146
+  *         return self._parser.resolvers
+  *=20
+  *     @property             # <<<<<<<<<<<<<<
+@@ -192542,7 +192542,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_7version___get__(struct __pyx_
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":149
++/* "src/lxml/iterparse.pxi":151
+  *         return self._parser.version
+  *=20
+  *     def set_element_class_lookup(self, ElementClassLookup lookup =3D N=
one):             # <<<<<<<<<<<<<<
+@@ -192604,12 +192604,12 @@ PyObject *__pyx_args, PyObject *__pyx_kwds
+         if (kw_args > 0) {
+           PyObject* value =3D __Pyx_GetKwValue_FASTCALL(__pyx_kwds, __pyx=
_kwvalues, __pyx_n_s_lookup);
+           if (value) { values[0] =3D __Pyx_Arg_NewRef_FASTCALL(value); kw=
_args--; }
+-          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 149, __pyx_L=
3_error)
++          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 151, __pyx_L=
3_error)
+         }
+       }
+       if (unlikely(kw_args > 0)) {
+         const Py_ssize_t kwd_pos_args =3D __pyx_nargs;
+-        if (unlikely(__Pyx_ParseOptionalKeywords(__pyx_kwds, __pyx_kwvalu=
es, __pyx_pyargnames, 0, values + 0, kwd_pos_args, "set_element_class_looku=
p") < 0)) __PYX_ERR(14, 149, __pyx_L3_error)
++        if (unlikely(__Pyx_ParseOptionalKeywords(__pyx_kwds, __pyx_kwvalu=
es, __pyx_pyargnames, 0, values + 0, kwd_pos_args, "set_element_class_looku=
p") < 0)) __PYX_ERR(14, 151, __pyx_L3_error)
+       }
+     } else {
+       switch (__pyx_nargs) {
+@@ -192623,7 +192623,7 @@ PyObject *__pyx_args, PyObject *__pyx_kwds
+   }
+   goto __pyx_L6_skip;
+   __pyx_L5_argtuple_error:;
+-  __Pyx_RaiseArgtupleInvalid("set_element_class_lookup", 0, 0, 1, __pyx_n=
args); __PYX_ERR(14, 149, __pyx_L3_error)
++  __Pyx_RaiseArgtupleInvalid("set_element_class_lookup", 0, 0, 1, __pyx_n=
args); __PYX_ERR(14, 151, __pyx_L3_error)
+   __pyx_L6_skip:;
+   goto __pyx_L4_argument_unpacking_done;
+   __pyx_L3_error:;
+@@ -192637,7 +192637,7 @@ PyObject *__pyx_args, PyObject *__pyx_kwds
+   __Pyx_RefNannyFinishContext();
+   return NULL;
+   __pyx_L4_argument_unpacking_done:;
+-  if (unlikely(!__Pyx_ArgTypeTest(((PyObject *)__pyx_v_lookup), __pyx_pty=
pe_4lxml_5etree_ElementClassLookup, 1, "lookup", 0))) __PYX_ERR(14, 149, __=
pyx_L1_error)
++  if (unlikely(!__Pyx_ArgTypeTest(((PyObject *)__pyx_v_lookup), __pyx_pty=
pe_4lxml_5etree_ElementClassLookup, 1, "lookup", 0))) __PYX_ERR(14, 151, __=
pyx_L1_error)
+   __pyx_r =3D __pyx_pf_4lxml_5etree_9iterparse_2set_element_class_lookup(=
((struct __pyx_obj_4lxml_5etree_iterparse *)__pyx_v_self), __pyx_v_lookup);
+=20
+   /* function exit code */
+@@ -192667,14 +192667,14 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_2set_element_class_lookup(stru
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("set_element_class_lookup", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":156
++  /* "src/lxml/iterparse.pxi":158
+  *         Reset it by passing None or nothing.
+  *         """
+  *         self._parser.set_element_class_lookup(lookup)             # <<=
<<<<<<<<<<<<
+  *=20
+  *     def makeelement(self, _tag, attrib=3DNone, nsmap=3DNone, **_extra):
+  */
+-  __pyx_t_2 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_self->_par=
ser), __pyx_n_s_set_element_class_lookup); if (unlikely(!__pyx_t_2)) __PYX_=
ERR(14, 156, __pyx_L1_error)
++  __pyx_t_2 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_self->_par=
ser), __pyx_n_s_set_element_class_lookup); if (unlikely(!__pyx_t_2)) __PYX_=
ERR(14, 158, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_2);
+   __pyx_t_3 =3D NULL;
+   __pyx_t_4 =3D 0;
+@@ -192694,13 +192694,13 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_2set_element_class_lookup(stru
+     PyObject *__pyx_callargs[2] =3D {__pyx_t_3, ((PyObject *)__pyx_v_look=
up)};
+     __pyx_t_1 =3D __Pyx_PyObject_FastCall(__pyx_t_2, __pyx_callargs+1-__p=
yx_t_4, 1+__pyx_t_4);
+     __Pyx_XDECREF(__pyx_t_3); __pyx_t_3 =3D 0;
+-    if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 156, __pyx_L1_error)
++    if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 158, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_1);
+     __Pyx_DECREF(__pyx_t_2); __pyx_t_2 =3D 0;
+   }
+   __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":149
++  /* "src/lxml/iterparse.pxi":151
+  *         return self._parser.version
+  *=20
+  *     def set_element_class_lookup(self, ElementClassLookup lookup =3D N=
one):             # <<<<<<<<<<<<<<
+@@ -192723,7 +192723,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_2set_element_class_lookup(stru
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":158
++/* "src/lxml/iterparse.pxi":160
+  *         self._parser.set_element_class_lookup(lookup)
+  *=20
+  *     def makeelement(self, _tag, attrib=3DNone, nsmap=3DNone, **_extra)=
:             # <<<<<<<<<<<<<<
+@@ -192796,26 +192796,26 @@ PyObject *__pyx_args, PyObject *__pyx_kwds
+           (void)__Pyx_Arg_NewRef_FASTCALL(values[0]);
+           kw_args--;
+         }
+-        else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 158, __pyx_L3_=
error)
++        else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 160, __pyx_L3_=
error)
+         else goto __pyx_L5_argtuple_error;
+         CYTHON_FALLTHROUGH;
+         case  1:
+         if (kw_args > 0) {
+           PyObject* value =3D __Pyx_GetKwValue_FASTCALL(__pyx_kwds, __pyx=
_kwvalues, __pyx_n_s_attrib);
+           if (value) { values[1] =3D __Pyx_Arg_NewRef_FASTCALL(value); kw=
_args--; }
+-          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 158, __pyx_L=
3_error)
++          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 160, __pyx_L=
3_error)
+         }
+         CYTHON_FALLTHROUGH;
+         case  2:
+         if (kw_args > 0) {
+           PyObject* value =3D __Pyx_GetKwValue_FASTCALL(__pyx_kwds, __pyx=
_kwvalues, __pyx_n_s_nsmap);
+           if (value) { values[2] =3D __Pyx_Arg_NewRef_FASTCALL(value); kw=
_args--; }
+-          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 158, __pyx_L=
3_error)
++          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 160, __pyx_L=
3_error)
+         }
+       }
+       if (unlikely(kw_args > 0)) {
+         const Py_ssize_t kwd_pos_args =3D __pyx_nargs;
+-        if (unlikely(__Pyx_ParseOptionalKeywords(__pyx_kwds, __pyx_kwvalu=
es, __pyx_pyargnames, __pyx_v__extra, values + 0, kwd_pos_args, "makeelemen=
t") < 0)) __PYX_ERR(14, 158, __pyx_L3_error)
++        if (unlikely(__Pyx_ParseOptionalKeywords(__pyx_kwds, __pyx_kwvalu=
es, __pyx_pyargnames, __pyx_v__extra, values + 0, kwd_pos_args, "makeelemen=
t") < 0)) __PYX_ERR(14, 160, __pyx_L3_error)
+       }
+     } else {
+       switch (__pyx_nargs) {
+@@ -192834,7 +192834,7 @@ PyObject *__pyx_args, PyObject *__pyx_kwds
+   }
+   goto __pyx_L6_skip;
+   __pyx_L5_argtuple_error:;
+-  __Pyx_RaiseArgtupleInvalid("makeelement", 0, 1, 3, __pyx_nargs); __PYX_=
ERR(14, 158, __pyx_L3_error)
++  __Pyx_RaiseArgtupleInvalid("makeelement", 0, 1, 3, __pyx_nargs); __PYX_=
ERR(14, 160, __pyx_L3_error)
+   __pyx_L6_skip:;
+   goto __pyx_L4_argument_unpacking_done;
+   __pyx_L3_error:;
+@@ -192875,67 +192875,67 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_4makeelement(struct __pyx_obj_
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("makeelement", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":163
++  /* "src/lxml/iterparse.pxi":165
+  *         Creates a new element associated with this parser.
+  *         """
+  *         self._parser.makeelement(             # <<<<<<<<<<<<<<
+  *             _tag, attrib=3DNone, nsmap=3DNone, **_extra)
+  *=20
+  */
+-  __pyx_t_1 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_self->_par=
ser), __pyx_n_s_makeelement); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 163, =
__pyx_L1_error)
++  __pyx_t_1 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_self->_par=
ser), __pyx_n_s_makeelement); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 165, =
__pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_1);
+=20
+-  /* "src/lxml/iterparse.pxi":164
++  /* "src/lxml/iterparse.pxi":166
+  *         """
+  *         self._parser.makeelement(
+  *             _tag, attrib=3DNone, nsmap=3DNone, **_extra)             #=
 <<<<<<<<<<<<<<
+  *=20
+  *     @cython.final
+  */
+-  __pyx_t_2 =3D PyTuple_New(1); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, 1=
63, __pyx_L1_error)
++  __pyx_t_2 =3D PyTuple_New(1); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, 1=
65, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_2);
+   __Pyx_INCREF(__pyx_v__tag);
+   __Pyx_GIVEREF(__pyx_v__tag);
+-  if (__Pyx_PyTuple_SET_ITEM(__pyx_t_2, 0, __pyx_v__tag)) __PYX_ERR(14, 1=
63, __pyx_L1_error);
++  if (__Pyx_PyTuple_SET_ITEM(__pyx_t_2, 0, __pyx_v__tag)) __PYX_ERR(14, 1=
65, __pyx_L1_error);
+=20
+-  /* "src/lxml/iterparse.pxi":163
++  /* "src/lxml/iterparse.pxi":165
+  *         Creates a new element associated with this parser.
+  *         """
+  *         self._parser.makeelement(             # <<<<<<<<<<<<<<
+  *             _tag, attrib=3DNone, nsmap=3DNone, **_extra)
+  *=20
+  */
+-  __pyx_t_4 =3D __Pyx_PyDict_NewPresized(2); if (unlikely(!__pyx_t_4)) __=
PYX_ERR(14, 164, __pyx_L1_error)
++  __pyx_t_4 =3D __Pyx_PyDict_NewPresized(2); if (unlikely(!__pyx_t_4)) __=
PYX_ERR(14, 166, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_4);
+=20
+-  /* "src/lxml/iterparse.pxi":164
++  /* "src/lxml/iterparse.pxi":166
+  *         """
+  *         self._parser.makeelement(
+  *             _tag, attrib=3DNone, nsmap=3DNone, **_extra)             #=
 <<<<<<<<<<<<<<
+  *=20
+  *     @cython.final
+  */
+-  if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_attrib, Py_None) < 0) __PYX_ERR=
(14, 164, __pyx_L1_error)
+-  if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_nsmap, Py_None) < 0) __PYX_ERR(=
14, 164, __pyx_L1_error)
++  if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_attrib, Py_None) < 0) __PYX_ERR=
(14, 166, __pyx_L1_error)
++  if (PyDict_SetItem(__pyx_t_4, __pyx_n_s_nsmap, Py_None) < 0) __PYX_ERR(=
14, 166, __pyx_L1_error)
+   __pyx_t_3 =3D __pyx_t_4;
+   __pyx_t_4 =3D 0;
+-  if (__Pyx_MergeKeywords(__pyx_t_3, __pyx_v__extra) < 0) __PYX_ERR(14, 1=
64, __pyx_L1_error)
++  if (__Pyx_MergeKeywords(__pyx_t_3, __pyx_v__extra) < 0) __PYX_ERR(14, 1=
66, __pyx_L1_error)
+=20
+-  /* "src/lxml/iterparse.pxi":163
++  /* "src/lxml/iterparse.pxi":165
+  *         Creates a new element associated with this parser.
+  *         """
+  *         self._parser.makeelement(             # <<<<<<<<<<<<<<
+  *             _tag, attrib=3DNone, nsmap=3DNone, **_extra)
+  *=20
+  */
+-  __pyx_t_4 =3D __Pyx_PyObject_Call(__pyx_t_1, __pyx_t_2, __pyx_t_3); if =
(unlikely(!__pyx_t_4)) __PYX_ERR(14, 163, __pyx_L1_error)
++  __pyx_t_4 =3D __Pyx_PyObject_Call(__pyx_t_1, __pyx_t_2, __pyx_t_3); if =
(unlikely(!__pyx_t_4)) __PYX_ERR(14, 165, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_4);
+   __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+   __Pyx_DECREF(__pyx_t_2); __pyx_t_2 =3D 0;
+   __Pyx_DECREF(__pyx_t_3); __pyx_t_3 =3D 0;
+   __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":158
++  /* "src/lxml/iterparse.pxi":160
+  *         self._parser.set_element_class_lookup(lookup)
+  *=20
+  *     def makeelement(self, _tag, attrib=3DNone, nsmap=3DNone, **_extra)=
:             # <<<<<<<<<<<<<<
+@@ -192959,7 +192959,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_4makeelement(struct __pyx_obj_
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":167
++/* "src/lxml/iterparse.pxi":169
+  *=20
+  *     @cython.final
+  *     cdef _close_source(self):             # <<<<<<<<<<<<<<
+@@ -192989,7 +192989,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("_close_source", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":168
++  /* "src/lxml/iterparse.pxi":170
+  *     @cython.final
+  *     cdef _close_source(self):
+  *         if self._source is None:             # <<<<<<<<<<<<<<
+@@ -192999,7 +192999,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+   __pyx_t_1 =3D (__pyx_v_self->_source =3D=3D Py_None);
+   if (__pyx_t_1) {
+=20
+-    /* "src/lxml/iterparse.pxi":169
++    /* "src/lxml/iterparse.pxi":171
+  *     cdef _close_source(self):
+  *         if self._source is None:
+  *             return             # <<<<<<<<<<<<<<
+@@ -193010,7 +193010,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+     __pyx_r =3D Py_None; __Pyx_INCREF(Py_None);
+     goto __pyx_L0;
+=20
+-    /* "src/lxml/iterparse.pxi":168
++    /* "src/lxml/iterparse.pxi":170
+  *     @cython.final
+  *     cdef _close_source(self):
+  *         if self._source is None:             # <<<<<<<<<<<<<<
+@@ -193019,7 +193019,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":170
++  /* "src/lxml/iterparse.pxi":172
+  *         if self._source is None:
+  *             return
+  *         if not self._close_source_after_read:             # <<<<<<<<<<=
<<<<
+@@ -193029,7 +193029,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+   __pyx_t_1 =3D (!__pyx_v_self->_close_source_after_read);
+   if (__pyx_t_1) {
+=20
+-    /* "src/lxml/iterparse.pxi":171
++    /* "src/lxml/iterparse.pxi":173
+  *             return
+  *         if not self._close_source_after_read:
+  *             self._source =3D None             # <<<<<<<<<<<<<<
+@@ -193042,7 +193042,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+     __Pyx_DECREF(__pyx_v_self->_source);
+     __pyx_v_self->_source =3D Py_None;
+=20
+-    /* "src/lxml/iterparse.pxi":172
++    /* "src/lxml/iterparse.pxi":174
+  *         if not self._close_source_after_read:
+  *             self._source =3D None
+  *             return             # <<<<<<<<<<<<<<
+@@ -193053,7 +193053,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+     __pyx_r =3D Py_None; __Pyx_INCREF(Py_None);
+     goto __pyx_L0;
+=20
+-    /* "src/lxml/iterparse.pxi":170
++    /* "src/lxml/iterparse.pxi":172
+  *         if self._source is None:
+  *             return
+  *         if not self._close_source_after_read:             # <<<<<<<<<<=
<<<<
+@@ -193062,7 +193062,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":173
++  /* "src/lxml/iterparse.pxi":175
+  *             self._source =3D None
+  *             return
+  *         try:             # <<<<<<<<<<<<<<
+@@ -193079,19 +193079,19 @@ static PyObject *__pyx_f_4lxml_5etree_9iterpar=
se__close_source(struct __pyx_obj_
+       __Pyx_XGOTREF(__pyx_t_4);
+       /*try:*/ {
+=20
+-        /* "src/lxml/iterparse.pxi":174
++        /* "src/lxml/iterparse.pxi":176
+  *             return
+  *         try:
+  *             close =3D self._source.close             # <<<<<<<<<<<<<<
+  *         except AttributeError:
+  *             close =3D None
+  */
+-        __pyx_t_5 =3D __Pyx_PyObject_GetAttrStr(__pyx_v_self->_source, __=
pyx_n_s_close); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 174, __pyx_L8_error)
++        __pyx_t_5 =3D __Pyx_PyObject_GetAttrStr(__pyx_v_self->_source, __=
pyx_n_s_close); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 176, __pyx_L8_error)
+         __Pyx_GOTREF(__pyx_t_5);
+         __pyx_v_close =3D __pyx_t_5;
+         __pyx_t_5 =3D 0;
+=20
+-        /* "src/lxml/iterparse.pxi":173
++        /* "src/lxml/iterparse.pxi":175
+  *             self._source =3D None
+  *             return
+  *         try:             # <<<<<<<<<<<<<<
+@@ -193106,7 +193106,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+       __pyx_L8_error:;
+       __Pyx_XDECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+=20
+-      /* "src/lxml/iterparse.pxi":175
++      /* "src/lxml/iterparse.pxi":177
+  *         try:
+  *             close =3D self._source.close
+  *         except AttributeError:             # <<<<<<<<<<<<<<
+@@ -193116,12 +193116,12 @@ static PyObject *__pyx_f_4lxml_5etree_9iterpar=
se__close_source(struct __pyx_obj_
+       __pyx_t_6 =3D __Pyx_PyErr_ExceptionMatches(__pyx_builtin_AttributeE=
rror);
+       if (__pyx_t_6) {
+         __Pyx_AddTraceback("lxml.etree.iterparse._close_source", __pyx_cl=
ineno, __pyx_lineno, __pyx_filename);
+-        if (__Pyx_GetException(&__pyx_t_5, &__pyx_t_7, &__pyx_t_8) < 0) _=
_PYX_ERR(14, 175, __pyx_L10_except_error)
++        if (__Pyx_GetException(&__pyx_t_5, &__pyx_t_7, &__pyx_t_8) < 0) _=
_PYX_ERR(14, 177, __pyx_L10_except_error)
+         __Pyx_XGOTREF(__pyx_t_5);
+         __Pyx_XGOTREF(__pyx_t_7);
+         __Pyx_XGOTREF(__pyx_t_8);
+=20
+-        /* "src/lxml/iterparse.pxi":176
++        /* "src/lxml/iterparse.pxi":178
+  *             close =3D self._source.close
+  *         except AttributeError:
+  *             close =3D None             # <<<<<<<<<<<<<<
+@@ -193137,7 +193137,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+       }
+       goto __pyx_L10_except_error;
+=20
+-      /* "src/lxml/iterparse.pxi":173
++      /* "src/lxml/iterparse.pxi":175
+  *             self._source =3D None
+  *             return
+  *         try:             # <<<<<<<<<<<<<<
+@@ -193159,7 +193159,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+     }
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":178
++  /* "src/lxml/iterparse.pxi":180
+  *             close =3D None
+  *         finally:
+  *             self._source =3D None             # <<<<<<<<<<<<<<
+@@ -193216,7 +193216,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+     __pyx_L7:;
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":179
++  /* "src/lxml/iterparse.pxi":181
+  *         finally:
+  *             self._source =3D None
+  *         if close is not None:             # <<<<<<<<<<<<<<
+@@ -193226,7 +193226,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+   __pyx_t_1 =3D (__pyx_v_close !=3D Py_None);
+   if (__pyx_t_1) {
+=20
+-    /* "src/lxml/iterparse.pxi":180
++    /* "src/lxml/iterparse.pxi":182
+  *             self._source =3D None
+  *         if close is not None:
+  *             close()             # <<<<<<<<<<<<<<
+@@ -193252,13 +193252,13 @@ static PyObject *__pyx_f_4lxml_5etree_9iterpar=
se__close_source(struct __pyx_obj_
+       PyObject *__pyx_callargs[2] =3D {__pyx_t_5, NULL};
+       __pyx_t_8 =3D __Pyx_PyObject_FastCall(__pyx_t_7, __pyx_callargs+1-_=
_pyx_t_9, 0+__pyx_t_9);
+       __Pyx_XDECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+-      if (unlikely(!__pyx_t_8)) __PYX_ERR(14, 180, __pyx_L1_error)
++      if (unlikely(!__pyx_t_8)) __PYX_ERR(14, 182, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_8);
+       __Pyx_DECREF(__pyx_t_7); __pyx_t_7 =3D 0;
+     }
+     __Pyx_DECREF(__pyx_t_8); __pyx_t_8 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":179
++    /* "src/lxml/iterparse.pxi":181
+  *         finally:
+  *             self._source =3D None
+  *         if close is not None:             # <<<<<<<<<<<<<<
+@@ -193267,7 +193267,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":167
++  /* "src/lxml/iterparse.pxi":169
+  *=20
+  *     @cython.final
+  *     cdef _close_source(self):             # <<<<<<<<<<<<<<
+@@ -193291,7 +193291,7 @@ static PyObject *__pyx_f_4lxml_5etree_9iterparse=
__close_source(struct __pyx_obj_
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":182
++/* "src/lxml/iterparse.pxi":184
+  *             close()
+  *=20
+  *     def __iter__(self):             # <<<<<<<<<<<<<<
+@@ -193319,7 +193319,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_6__iter__(struct __pyx_obj_4lx
+   __Pyx_RefNannyDeclarations
+   __Pyx_RefNannySetupContext("__iter__", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":183
++  /* "src/lxml/iterparse.pxi":185
+  *=20
+  *     def __iter__(self):
+  *         return self             # <<<<<<<<<<<<<<
+@@ -193331,7 +193331,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_6__iter__(struct __pyx_obj_4lx
+   __pyx_r =3D ((PyObject *)__pyx_v_self);
+   goto __pyx_L0;
+=20
+-  /* "src/lxml/iterparse.pxi":182
++  /* "src/lxml/iterparse.pxi":184
+  *             close()
+  *=20
+  *     def __iter__(self):             # <<<<<<<<<<<<<<
+@@ -193346,7 +193346,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_6__iter__(struct __pyx_obj_4lx
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":185
++/* "src/lxml/iterparse.pxi":187
+  *         return self
+  *=20
+  *     def __next__(self):             # <<<<<<<<<<<<<<
+@@ -193397,7 +193397,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("__next__", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":186
++  /* "src/lxml/iterparse.pxi":188
+  *=20
+  *     def __next__(self):
+  *         try:             # <<<<<<<<<<<<<<
+@@ -193413,7 +193413,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+     __Pyx_XGOTREF(__pyx_t_3);
+     /*try:*/ {
+=20
+-      /* "src/lxml/iterparse.pxi":187
++      /* "src/lxml/iterparse.pxi":189
+  *     def __next__(self):
+  *         try:
+  *             return next(self._events)             # <<<<<<<<<<<<<<
+@@ -193423,14 +193423,14 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_8__next__(struct __pyx_obj_4lx
+       __Pyx_XDECREF(__pyx_r);
+       __pyx_t_4 =3D __pyx_v_self->_events;
+       __Pyx_INCREF(__pyx_t_4);
+-      __pyx_t_5 =3D __Pyx_PyIter_Next(__pyx_t_4); if (unlikely(!__pyx_t_5=
)) __PYX_ERR(14, 187, __pyx_L3_error)
++      __pyx_t_5 =3D __Pyx_PyIter_Next(__pyx_t_4); if (unlikely(!__pyx_t_5=
)) __PYX_ERR(14, 189, __pyx_L3_error)
+       __Pyx_GOTREF(__pyx_t_5);
+       __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+       __pyx_r =3D __pyx_t_5;
+       __pyx_t_5 =3D 0;
+       goto __pyx_L7_try_return;
+=20
+-      /* "src/lxml/iterparse.pxi":186
++      /* "src/lxml/iterparse.pxi":188
+  *=20
+  *     def __next__(self):
+  *         try:             # <<<<<<<<<<<<<<
+@@ -193442,7 +193442,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+     __Pyx_XDECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+     __Pyx_XDECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":188
++    /* "src/lxml/iterparse.pxi":190
+  *         try:
+  *             return next(self._events)
+  *         except StopIteration:             # <<<<<<<<<<<<<<
+@@ -193456,7 +193456,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+     }
+     goto __pyx_L5_except_error;
+=20
+-    /* "src/lxml/iterparse.pxi":186
++    /* "src/lxml/iterparse.pxi":188
+  *=20
+  *     def __next__(self):
+  *         try:             # <<<<<<<<<<<<<<
+@@ -193482,14 +193482,14 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_8__next__(struct __pyx_obj_4lx
+     __Pyx_ExceptionReset(__pyx_t_1, __pyx_t_2, __pyx_t_3);
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":190
++  /* "src/lxml/iterparse.pxi":192
+  *         except StopIteration:
+  *             pass
+  *         context =3D <_SaxParserContext>self._parser._getPushParserCont=
ext()             # <<<<<<<<<<<<<<
+  *         if self._source is not None:
+  *             done =3D False
+  */
+-  __pyx_t_5 =3D ((PyObject *)((struct __pyx_vtabstruct_4lxml_5etree__Feed=
Parser *)__pyx_v_self->_parser->__pyx_base.__pyx_vtab)->__pyx_base._getPush=
ParserContext(((struct __pyx_obj_4lxml_5etree__BaseParser *)__pyx_v_self->_=
parser))); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 190, __pyx_L1_error)
++  __pyx_t_5 =3D ((PyObject *)((struct __pyx_vtabstruct_4lxml_5etree__Feed=
Parser *)__pyx_v_self->_parser->__pyx_base.__pyx_vtab)->__pyx_base._getPush=
ParserContext(((struct __pyx_obj_4lxml_5etree__BaseParser *)__pyx_v_self->_=
parser))); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 192, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_5);
+   __pyx_t_4 =3D __pyx_t_5;
+   __Pyx_INCREF(__pyx_t_4);
+@@ -193497,7 +193497,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+   __pyx_v_context =3D ((struct __pyx_obj_4lxml_5etree__SaxParserContext *=
)__pyx_t_4);
+   __pyx_t_4 =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":191
++  /* "src/lxml/iterparse.pxi":193
+  *             pass
+  *         context =3D <_SaxParserContext>self._parser._getPushParserCont=
ext()
+  *         if self._source is not None:             # <<<<<<<<<<<<<<
+@@ -193507,7 +193507,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+   __pyx_t_7 =3D (__pyx_v_self->_source !=3D Py_None);
+   if (__pyx_t_7) {
+=20
+-    /* "src/lxml/iterparse.pxi":192
++    /* "src/lxml/iterparse.pxi":194
+  *         context =3D <_SaxParserContext>self._parser._getPushParserCont=
ext()
+  *         if self._source is not None:
+  *             done =3D False             # <<<<<<<<<<<<<<
+@@ -193516,7 +193516,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+  */
+     __pyx_v_done =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":193
++    /* "src/lxml/iterparse.pxi":195
+  *         if self._source is not None:
+  *             done =3D False
+  *             while not done:             # <<<<<<<<<<<<<<
+@@ -193527,7 +193527,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+       __pyx_t_7 =3D (!__pyx_v_done);
+       if (!__pyx_t_7) break;
+=20
+-      /* "src/lxml/iterparse.pxi":194
++      /* "src/lxml/iterparse.pxi":196
+  *             done =3D False
+  *             while not done:
+  *                 try:             # <<<<<<<<<<<<<<
+@@ -193543,7 +193543,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+         __Pyx_XGOTREF(__pyx_t_1);
+         /*try:*/ {
+=20
+-          /* "src/lxml/iterparse.pxi":195
++          /* "src/lxml/iterparse.pxi":197
+  *             while not done:
+  *                 try:
+  *                     done =3D self._read_more_events(context)          =
   # <<<<<<<<<<<<<<
+@@ -193552,11 +193552,11 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_8__next__(struct __pyx_obj_4lx
+  */
+ #pragma GCC diagnostic push
+           #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-          __pyx_t_7 =3D __pyx_f_4lxml_5etree_9iterparse__read_more_events=
(__pyx_v_self, __pyx_v_context); if (unlikely(__pyx_t_7 =3D=3D ((int)-123))=
) __PYX_ERR(14, 195, __pyx_L12_error)
++          __pyx_t_7 =3D __pyx_f_4lxml_5etree_9iterparse__read_more_events=
(__pyx_v_self, __pyx_v_context); if (unlikely(__pyx_t_7 =3D=3D ((int)-123))=
) __PYX_ERR(14, 197, __pyx_L12_error)
+           #pragma GCC diagnostic pop
+           __pyx_v_done =3D __pyx_t_7;
+=20
+-          /* "src/lxml/iterparse.pxi":196
++          /* "src/lxml/iterparse.pxi":198
+  *                 try:
+  *                     done =3D self._read_more_events(context)
+  *                     return next(self._events)             # <<<<<<<<<<=
<<<<
+@@ -193566,14 +193566,14 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_8__next__(struct __pyx_obj_4lx
+           __Pyx_XDECREF(__pyx_r);
+           __pyx_t_4 =3D __pyx_v_self->_events;
+           __Pyx_INCREF(__pyx_t_4);
+-          __pyx_t_5 =3D __Pyx_PyIter_Next(__pyx_t_4); if (unlikely(!__pyx=
_t_5)) __PYX_ERR(14, 196, __pyx_L12_error)
++          __pyx_t_5 =3D __Pyx_PyIter_Next(__pyx_t_4); if (unlikely(!__pyx=
_t_5)) __PYX_ERR(14, 198, __pyx_L12_error)
+           __Pyx_GOTREF(__pyx_t_5);
+           __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+           __pyx_r =3D __pyx_t_5;
+           __pyx_t_5 =3D 0;
+           goto __pyx_L16_try_return;
+=20
+-          /* "src/lxml/iterparse.pxi":194
++          /* "src/lxml/iterparse.pxi":196
+  *             done =3D False
+  *             while not done:
+  *                 try:             # <<<<<<<<<<<<<<
+@@ -193585,7 +193585,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+         __Pyx_XDECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+         __Pyx_XDECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+=20
+-        /* "src/lxml/iterparse.pxi":197
++        /* "src/lxml/iterparse.pxi":199
+  *                     done =3D self._read_more_events(context)
+  *                     return next(self._events)
+  *                 except StopIteration:             # <<<<<<<<<<<<<<
+@@ -193598,7 +193598,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+           goto __pyx_L13_exception_handled;
+         }
+=20
+-        /* "src/lxml/iterparse.pxi":199
++        /* "src/lxml/iterparse.pxi":201
+  *                 except StopIteration:
+  *                     pass  # no events yet
+  *                 except Exception as e:             # <<<<<<<<<<<<<<
+@@ -193608,14 +193608,14 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_8__next__(struct __pyx_obj_4lx
+         __pyx_t_6 =3D __Pyx_PyErr_ExceptionMatches(((PyObject *)(&((PyTyp=
eObject*)PyExc_Exception)[0])));
+         if (__pyx_t_6) {
+           __Pyx_AddTraceback("lxml.etree.iterparse.__next__", __pyx_cline=
no, __pyx_lineno, __pyx_filename);
+-          if (__Pyx_GetException(&__pyx_t_5, &__pyx_t_4, &__pyx_t_8) < 0)=
 __PYX_ERR(14, 199, __pyx_L14_except_error)
++          if (__Pyx_GetException(&__pyx_t_5, &__pyx_t_4, &__pyx_t_8) < 0)=
 __PYX_ERR(14, 201, __pyx_L14_except_error)
+           __Pyx_XGOTREF(__pyx_t_5);
+           __Pyx_XGOTREF(__pyx_t_4);
+           __Pyx_XGOTREF(__pyx_t_8);
+           __Pyx_INCREF(__pyx_t_4);
+           __pyx_v_e =3D __pyx_t_4;
+=20
+-          /* "src/lxml/iterparse.pxi":200
++          /* "src/lxml/iterparse.pxi":202
+  *                     pass  # no events yet
+  *                 except Exception as e:
+  *                     self._error =3D e             # <<<<<<<<<<<<<<
+@@ -193628,7 +193628,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+           __Pyx_DECREF(__pyx_v_self->_error);
+           __pyx_v_self->_error =3D __pyx_v_e;
+=20
+-          /* "src/lxml/iterparse.pxi":201
++          /* "src/lxml/iterparse.pxi":203
+  *                 except Exception as e:
+  *                     self._error =3D e
+  *                     self._close_source()             # <<<<<<<<<<<<<<
+@@ -193637,12 +193637,12 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_8__next__(struct __pyx_obj_4lx
+  */
+ #pragma GCC diagnostic push
+           #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-          __pyx_t_9 =3D __pyx_f_4lxml_5etree_9iterparse__close_source(__p=
yx_v_self); if (unlikely(!__pyx_t_9)) __PYX_ERR(14, 201, __pyx_L14_except_e=
rror)
++          __pyx_t_9 =3D __pyx_f_4lxml_5etree_9iterparse__close_source(__p=
yx_v_self); if (unlikely(!__pyx_t_9)) __PYX_ERR(14, 203, __pyx_L14_except_e=
rror)
+           #pragma GCC diagnostic pop
+           __Pyx_GOTREF(__pyx_t_9);
+           __Pyx_DECREF(__pyx_t_9); __pyx_t_9 =3D 0;
+=20
+-          /* "src/lxml/iterparse.pxi":202
++          /* "src/lxml/iterparse.pxi":204
+  *                     self._error =3D e
+  *                     self._close_source()
+  *                     try:             # <<<<<<<<<<<<<<
+@@ -193658,7 +193658,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+             __Pyx_XGOTREF(__pyx_t_12);
+             /*try:*/ {
+=20
+-              /* "src/lxml/iterparse.pxi":203
++              /* "src/lxml/iterparse.pxi":205
+  *                     self._close_source()
+  *                     try:
+  *                         return next(self._events)             # <<<<<<=
<<<<<<<<
+@@ -193668,7 +193668,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+               __Pyx_XDECREF(__pyx_r);
+               __pyx_t_9 =3D __pyx_v_self->_events;
+               __Pyx_INCREF(__pyx_t_9);
+-              __pyx_t_13 =3D __Pyx_PyIter_Next(__pyx_t_9); if (unlikely(!=
__pyx_t_13)) __PYX_ERR(14, 203, __pyx_L22_error)
++              __pyx_t_13 =3D __Pyx_PyIter_Next(__pyx_t_9); if (unlikely(!=
__pyx_t_13)) __PYX_ERR(14, 205, __pyx_L22_error)
+               __Pyx_GOTREF(__pyx_t_13);
+               __Pyx_DECREF(__pyx_t_9); __pyx_t_9 =3D 0;
+               __pyx_r =3D __pyx_t_13;
+@@ -193678,7 +193678,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+               __Pyx_DECREF(__pyx_t_8); __pyx_t_8 =3D 0;
+               goto __pyx_L26_try_return;
+=20
+-              /* "src/lxml/iterparse.pxi":202
++              /* "src/lxml/iterparse.pxi":204
+  *                     self._error =3D e
+  *                     self._close_source()
+  *                     try:             # <<<<<<<<<<<<<<
+@@ -193690,7 +193690,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+             __Pyx_XDECREF(__pyx_t_13); __pyx_t_13 =3D 0;
+             __Pyx_XDECREF(__pyx_t_9); __pyx_t_9 =3D 0;
+=20
+-            /* "src/lxml/iterparse.pxi":204
++            /* "src/lxml/iterparse.pxi":206
+  *                     try:
+  *                         return next(self._events)
+  *                     except StopIteration:             # <<<<<<<<<<<<<<
+@@ -193700,12 +193700,12 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_8__next__(struct __pyx_obj_4lx
+             __pyx_t_6 =3D __Pyx_PyErr_ExceptionMatches(__pyx_builtin_Stop=
Iteration);
+             if (__pyx_t_6) {
+               __Pyx_AddTraceback("lxml.etree.iterparse.__next__", __pyx_c=
lineno, __pyx_lineno, __pyx_filename);
+-              if (__Pyx_GetException(&__pyx_t_13, &__pyx_t_9, &__pyx_t_14=
) < 0) __PYX_ERR(14, 204, __pyx_L24_except_error)
++              if (__Pyx_GetException(&__pyx_t_13, &__pyx_t_9, &__pyx_t_14=
) < 0) __PYX_ERR(14, 206, __pyx_L24_except_error)
+               __Pyx_XGOTREF(__pyx_t_13);
+               __Pyx_XGOTREF(__pyx_t_9);
+               __Pyx_XGOTREF(__pyx_t_14);
+=20
+-              /* "src/lxml/iterparse.pxi":205
++              /* "src/lxml/iterparse.pxi":207
+  *                         return next(self._events)
+  *                     except StopIteration:
+  *                         break             # <<<<<<<<<<<<<<
+@@ -193721,7 +193721,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+             }
+             goto __pyx_L24_except_error;
+=20
+-            /* "src/lxml/iterparse.pxi":202
++            /* "src/lxml/iterparse.pxi":204
+  *                     self._error =3D e
+  *                     self._close_source()
+  *                     try:             # <<<<<<<<<<<<<<
+@@ -193755,7 +193755,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+         }
+         goto __pyx_L14_except_error;
+=20
+-        /* "src/lxml/iterparse.pxi":194
++        /* "src/lxml/iterparse.pxi":196
+  *             done =3D False
+  *             while not done:
+  *                 try:             # <<<<<<<<<<<<<<
+@@ -193795,7 +193795,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+     }
+     __pyx_L11_break:;
+=20
+-    /* "src/lxml/iterparse.pxi":191
++    /* "src/lxml/iterparse.pxi":193
+  *             pass
+  *         context =3D <_SaxParserContext>self._parser._getPushParserCont=
ext()
+  *         if self._source is not None:             # <<<<<<<<<<<<<<
+@@ -193804,7 +193804,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":207
++  /* "src/lxml/iterparse.pxi":209
+  *                         break
+  *         # nothing left to read or return
+  *         if self._error is not None:             # <<<<<<<<<<<<<<
+@@ -193814,7 +193814,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+   __pyx_t_7 =3D (__pyx_v_self->_error !=3D Py_None);
+   if (unlikely(__pyx_t_7)) {
+=20
+-    /* "src/lxml/iterparse.pxi":208
++    /* "src/lxml/iterparse.pxi":210
+  *         # nothing left to read or return
+  *         if self._error is not None:
+  *             error =3D self._error             # <<<<<<<<<<<<<<
+@@ -193826,7 +193826,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+     __pyx_v_error =3D __pyx_t_8;
+     __pyx_t_8 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":209
++    /* "src/lxml/iterparse.pxi":211
+  *         if self._error is not None:
+  *             error =3D self._error
+  *             self._error =3D None             # <<<<<<<<<<<<<<
+@@ -193839,7 +193839,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+     __Pyx_DECREF(__pyx_v_self->_error);
+     __pyx_v_self->_error =3D Py_None;
+=20
+-    /* "src/lxml/iterparse.pxi":210
++    /* "src/lxml/iterparse.pxi":212
+  *             error =3D self._error
+  *             self._error =3D None
+  *             raise error             # <<<<<<<<<<<<<<
+@@ -193847,9 +193847,9 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+  *                 and not context._validator.isvalid()):
+  */
+     __Pyx_Raise(__pyx_v_error, 0, 0, 0);
+-    __PYX_ERR(14, 210, __pyx_L1_error)
++    __PYX_ERR(14, 212, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":207
++    /* "src/lxml/iterparse.pxi":209
+  *                         break
+  *         # nothing left to read or return
+  *         if self._error is not None:             # <<<<<<<<<<<<<<
+@@ -193858,7 +193858,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":211
++  /* "src/lxml/iterparse.pxi":213
+  *             self._error =3D None
+  *             raise error
+  *         if (context._validator is not None             # <<<<<<<<<<<<<<
+@@ -193872,7 +193872,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+     goto __pyx_L34_bool_binop_done;
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":212
++  /* "src/lxml/iterparse.pxi":214
+  *             raise error
+  *         if (context._validator is not None
+  *                 and not context._validator.isvalid()):             # <=
<<<<<<<<<<<<<
+@@ -193883,7 +193883,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+   __pyx_t_7 =3D __pyx_t_15;
+   __pyx_L34_bool_binop_done:;
+=20
+-  /* "src/lxml/iterparse.pxi":211
++  /* "src/lxml/iterparse.pxi":213
+  *             self._error =3D None
+  *             raise error
+  *         if (context._validator is not None             # <<<<<<<<<<<<<<
+@@ -193892,7 +193892,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+  */
+   if (__pyx_t_7) {
+=20
+-    /* "src/lxml/iterparse.pxi":213
++    /* "src/lxml/iterparse.pxi":215
+  *         if (context._validator is not None
+  *                 and not context._validator.isvalid()):
+  *             _raiseParseError(context._c_ctxt, self._filename,         =
    # <<<<<<<<<<<<<<
+@@ -193902,7 +193902,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+     __pyx_t_8 =3D __pyx_v_self->_filename;
+     __Pyx_INCREF(__pyx_t_8);
+=20
+-    /* "src/lxml/iterparse.pxi":214
++    /* "src/lxml/iterparse.pxi":216
+  *                 and not context._validator.isvalid()):
+  *             _raiseParseError(context._c_ctxt, self._filename,
+  *                              context._error_log)             # <<<<<<<=
<<<<<<<
+@@ -193912,18 +193912,18 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpa=
rse_8__next__(struct __pyx_obj_4lx
+     __pyx_t_4 =3D ((PyObject *)__pyx_v_context->__pyx_base._error_log);
+     __Pyx_INCREF(__pyx_t_4);
+=20
+-    /* "src/lxml/iterparse.pxi":213
++    /* "src/lxml/iterparse.pxi":215
+  *         if (context._validator is not None
+  *                 and not context._validator.isvalid()):
+  *             _raiseParseError(context._c_ctxt, self._filename,         =
    # <<<<<<<<<<<<<<
+  *                              context._error_log)
+  *         # no errors =3D> all done
+  */
+-    __pyx_t_6 =3D __pyx_f_4lxml_5etree__raiseParseError(__pyx_v_context->=
__pyx_base._c_ctxt, __pyx_t_8, ((struct __pyx_obj_4lxml_5etree__ErrorLog *)=
__pyx_t_4)); if (unlikely(__pyx_t_6 =3D=3D ((int)-1))) __PYX_ERR(14, 213, _=
_pyx_L1_error)
++    __pyx_t_6 =3D __pyx_f_4lxml_5etree__raiseParseError(__pyx_v_context->=
__pyx_base._c_ctxt, __pyx_t_8, ((struct __pyx_obj_4lxml_5etree__ErrorLog *)=
__pyx_t_4)); if (unlikely(__pyx_t_6 =3D=3D ((int)-1))) __PYX_ERR(14, 215, _=
_pyx_L1_error)
+     __Pyx_DECREF(__pyx_t_8); __pyx_t_8 =3D 0;
+     __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":211
++    /* "src/lxml/iterparse.pxi":213
+  *             self._error =3D None
+  *             raise error
+  *         if (context._validator is not None             # <<<<<<<<<<<<<<
+@@ -193932,7 +193932,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":216
++  /* "src/lxml/iterparse.pxi":218
+  *                              context._error_log)
+  *         # no errors =3D> all done
+  *         raise StopIteration             # <<<<<<<<<<<<<<
+@@ -193942,7 +193942,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+   __pyx_error_without_exception =3D 1;
+   goto __pyx_L1_error;;
+=20
+-  /* "src/lxml/iterparse.pxi":185
++  /* "src/lxml/iterparse.pxi":187
+  *         return self
+  *=20
+  *     def __next__(self):             # <<<<<<<<<<<<<<
+@@ -193971,7 +193971,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_8__next__(struct __pyx_obj_4lx
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":219
++/* "src/lxml/iterparse.pxi":221
+  *=20
+  *     @cython.final
+  *     cdef bint _read_more_events(self, _SaxParserContext context) excep=
t -123:             # <<<<<<<<<<<<<<
+@@ -194002,14 +194002,14 @@ static int __pyx_f_4lxml_5etree_9iterparse__re=
ad_more_events(struct __pyx_obj_4l
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("_read_more_events", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":220
++  /* "src/lxml/iterparse.pxi":222
+  *     @cython.final
+  *     cdef bint _read_more_events(self, _SaxParserContext context) excep=
t -123:
+  *         data =3D self._source.read(__ITERPARSE_CHUNK_SIZE)            =
 # <<<<<<<<<<<<<<
+  *         if not isinstance(data, bytes):
+  *             self._close_source()
+  */
+-  __pyx_t_2 =3D __Pyx_PyObject_GetAttrStr(__pyx_v_self->_source, __pyx_n_=
s_read); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, 220, __pyx_L1_error)
++  __pyx_t_2 =3D __Pyx_PyObject_GetAttrStr(__pyx_v_self->_source, __pyx_n_=
s_read); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, 222, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_2);
+   __pyx_t_3 =3D NULL;
+   __pyx_t_4 =3D 0;
+@@ -194029,14 +194029,14 @@ static int __pyx_f_4lxml_5etree_9iterparse__re=
ad_more_events(struct __pyx_obj_4l
+     PyObject *__pyx_callargs[2] =3D {__pyx_t_3, __pyx_int_32768};
+     __pyx_t_1 =3D __Pyx_PyObject_FastCall(__pyx_t_2, __pyx_callargs+1-__p=
yx_t_4, 1+__pyx_t_4);
+     __Pyx_XDECREF(__pyx_t_3); __pyx_t_3 =3D 0;
+-    if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 220, __pyx_L1_error)
++    if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 222, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_1);
+     __Pyx_DECREF(__pyx_t_2); __pyx_t_2 =3D 0;
+   }
+   __pyx_v_data =3D __pyx_t_1;
+   __pyx_t_1 =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":221
++  /* "src/lxml/iterparse.pxi":223
+  *     cdef bint _read_more_events(self, _SaxParserContext context) excep=
t -123:
+  *         data =3D self._source.read(__ITERPARSE_CHUNK_SIZE)
+  *         if not isinstance(data, bytes):             # <<<<<<<<<<<<<<
+@@ -194047,7 +194047,7 @@ static int __pyx_f_4lxml_5etree_9iterparse__read=
_more_events(struct __pyx_obj_4l
+   __pyx_t_6 =3D (!__pyx_t_5);
+   if (unlikely(__pyx_t_6)) {
+=20
+-    /* "src/lxml/iterparse.pxi":222
++    /* "src/lxml/iterparse.pxi":224
+  *         data =3D self._source.read(__ITERPARSE_CHUNK_SIZE)
+  *         if not isinstance(data, bytes):
+  *             self._close_source()             # <<<<<<<<<<<<<<
+@@ -194056,25 +194056,25 @@ static int __pyx_f_4lxml_5etree_9iterparse__re=
ad_more_events(struct __pyx_obj_4l
+  */
+ #pragma GCC diagnostic push
+     #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-    __pyx_t_1 =3D __pyx_f_4lxml_5etree_9iterparse__close_source(__pyx_v_s=
elf); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 222, __pyx_L1_error)
++    __pyx_t_1 =3D __pyx_f_4lxml_5etree_9iterparse__close_source(__pyx_v_s=
elf); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 224, __pyx_L1_error)
+     #pragma GCC diagnostic pop
+     __Pyx_GOTREF(__pyx_t_1);
+     __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":223
++    /* "src/lxml/iterparse.pxi":225
+  *         if not isinstance(data, bytes):
+  *             self._close_source()
+  *             raise TypeError("reading file objects must return bytes ob=
jects")             # <<<<<<<<<<<<<<
+  *         if not data:
+  *             try:
+  */
+-    __pyx_t_1 =3D __Pyx_PyObject_Call(__pyx_builtin_TypeError, __pyx_tupl=
e__92, NULL); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 223, __pyx_L1_error)
++    __pyx_t_1 =3D __Pyx_PyObject_Call(__pyx_builtin_TypeError, __pyx_tupl=
e__92, NULL); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 225, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_1);
+     __Pyx_Raise(__pyx_t_1, 0, 0, 0);
+     __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+-    __PYX_ERR(14, 223, __pyx_L1_error)
++    __PYX_ERR(14, 225, __pyx_L1_error)
+=20
+-    /* "src/lxml/iterparse.pxi":221
++    /* "src/lxml/iterparse.pxi":223
+  *     cdef bint _read_more_events(self, _SaxParserContext context) excep=
t -123:
+  *         data =3D self._source.read(__ITERPARSE_CHUNK_SIZE)
+  *         if not isinstance(data, bytes):             # <<<<<<<<<<<<<<
+@@ -194083,18 +194083,18 @@ static int __pyx_f_4lxml_5etree_9iterparse__re=
ad_more_events(struct __pyx_obj_4l
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":224
++  /* "src/lxml/iterparse.pxi":226
+  *             self._close_source()
+  *             raise TypeError("reading file objects must return bytes ob=
jects")
+  *         if not data:             # <<<<<<<<<<<<<<
+  *             try:
+  *                 self.root =3D self._parser.close()
+  */
+-  __pyx_t_6 =3D __Pyx_PyObject_IsTrue(__pyx_v_data); if (unlikely((__pyx_=
t_6 < 0))) __PYX_ERR(14, 224, __pyx_L1_error)
++  __pyx_t_6 =3D __Pyx_PyObject_IsTrue(__pyx_v_data); if (unlikely((__pyx_=
t_6 < 0))) __PYX_ERR(14, 226, __pyx_L1_error)
+   __pyx_t_5 =3D (!__pyx_t_6);
+   if (__pyx_t_5) {
+=20
+-    /* "src/lxml/iterparse.pxi":225
++    /* "src/lxml/iterparse.pxi":227
+  *             raise TypeError("reading file objects must return bytes ob=
jects")
+  *         if not data:
+  *             try:             # <<<<<<<<<<<<<<
+@@ -194103,14 +194103,14 @@ static int __pyx_f_4lxml_5etree_9iterparse__re=
ad_more_events(struct __pyx_obj_4l
+  */
+     /*try:*/ {
+=20
+-      /* "src/lxml/iterparse.pxi":226
++      /* "src/lxml/iterparse.pxi":228
+  *         if not data:
+  *             try:
+  *                 self.root =3D self._parser.close()             # <<<<<=
<<<<<<<<<
+  *             finally:
+  *                 self._close_source()
+  */
+-      __pyx_t_1 =3D ((struct __pyx_vtabstruct_4lxml_5etree__FeedParser *)=
__pyx_v_self->_parser->__pyx_base.__pyx_vtab)->close(__pyx_v_self->_parser,=
 0); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 226, __pyx_L6_error)
++      __pyx_t_1 =3D ((struct __pyx_vtabstruct_4lxml_5etree__FeedParser *)=
__pyx_v_self->_parser->__pyx_base.__pyx_vtab)->close(__pyx_v_self->_parser,=
 0); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 228, __pyx_L6_error)
+       __Pyx_GOTREF(__pyx_t_1);
+       __Pyx_GIVEREF(__pyx_t_1);
+       __Pyx_GOTREF(__pyx_v_self->root);
+@@ -194119,7 +194119,7 @@ static int __pyx_f_4lxml_5etree_9iterparse__read=
_more_events(struct __pyx_obj_4l
+       __pyx_t_1 =3D 0;
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":228
++    /* "src/lxml/iterparse.pxi":230
+  *                 self.root =3D self._parser.close()
+  *             finally:
+  *                 self._close_source()             # <<<<<<<<<<<<<<
+@@ -194130,7 +194130,7 @@ static int __pyx_f_4lxml_5etree_9iterparse__read=
_more_events(struct __pyx_obj_4l
+       /*normal exit:*/{
+ #pragma GCC diagnostic push
+         #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-        __pyx_t_1 =3D __pyx_f_4lxml_5etree_9iterparse__close_source(__pyx=
_v_self); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 228, __pyx_L1_error)
++        __pyx_t_1 =3D __pyx_f_4lxml_5etree_9iterparse__close_source(__pyx=
_v_self); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 230, __pyx_L1_error)
+         #pragma GCC diagnostic pop
+         __Pyx_GOTREF(__pyx_t_1);
+         __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+@@ -194156,7 +194156,7 @@ static int __pyx_f_4lxml_5etree_9iterparse__read=
_more_events(struct __pyx_obj_4l
+         {
+ #pragma GCC diagnostic push
+           #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-          __pyx_t_1 =3D __pyx_f_4lxml_5etree_9iterparse__close_source(__p=
yx_v_self); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 228, __pyx_L9_error)
++          __pyx_t_1 =3D __pyx_f_4lxml_5etree_9iterparse__close_source(__p=
yx_v_self); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 230, __pyx_L9_error)
+           #pragma GCC diagnostic pop
+           __Pyx_GOTREF(__pyx_t_1);
+           __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+@@ -194190,7 +194190,7 @@ static int __pyx_f_4lxml_5etree_9iterparse__read=
_more_events(struct __pyx_obj_4l
+       __pyx_L7:;
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":229
++    /* "src/lxml/iterparse.pxi":231
+  *             finally:
+  *                 self._close_source()
+  *             return True             # <<<<<<<<<<<<<<
+@@ -194200,7 +194200,7 @@ static int __pyx_f_4lxml_5etree_9iterparse__read=
_more_events(struct __pyx_obj_4l
+     __pyx_r =3D 1;
+     goto __pyx_L0;
+=20
+-    /* "src/lxml/iterparse.pxi":224
++    /* "src/lxml/iterparse.pxi":226
+  *             self._close_source()
+  *             raise TypeError("reading file objects must return bytes ob=
jects")
+  *         if not data:             # <<<<<<<<<<<<<<
+@@ -194209,18 +194209,18 @@ static int __pyx_f_4lxml_5etree_9iterparse__re=
ad_more_events(struct __pyx_obj_4l
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":230
++  /* "src/lxml/iterparse.pxi":232
+  *                 self._close_source()
+  *             return True
+  *         self._parser.feed(data)             # <<<<<<<<<<<<<<
+  *         return False
+  *=20
+  */
+-  __pyx_t_1 =3D ((struct __pyx_vtabstruct_4lxml_5etree__FeedParser *)__py=
x_v_self->_parser->__pyx_base.__pyx_vtab)->feed(__pyx_v_self->_parser, __py=
x_v_data, 0); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 230, __pyx_L1_error)
++  __pyx_t_1 =3D ((struct __pyx_vtabstruct_4lxml_5etree__FeedParser *)__py=
x_v_self->_parser->__pyx_base.__pyx_vtab)->feed(__pyx_v_self->_parser, __py=
x_v_data, 0); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 232, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_1);
+   __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":231
++  /* "src/lxml/iterparse.pxi":233
+  *             return True
+  *         self._parser.feed(data)
+  *         return False             # <<<<<<<<<<<<<<
+@@ -194230,7 +194230,7 @@ static int __pyx_f_4lxml_5etree_9iterparse__read=
_more_events(struct __pyx_obj_4l
+   __pyx_r =3D 0;
+   goto __pyx_L0;
+=20
+-  /* "src/lxml/iterparse.pxi":219
++  /* "src/lxml/iterparse.pxi":221
+  *=20
+  *     @cython.final
+  *     cdef bint _read_more_events(self, _SaxParserContext context) excep=
t -123:             # <<<<<<<<<<<<<<
+@@ -194251,7 +194251,7 @@ static int __pyx_f_4lxml_5etree_9iterparse__read=
_more_events(struct __pyx_obj_4l
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":61
++/* "src/lxml/iterparse.pxi":63
+  *     cdef object _tag
+  *     cdef object _events
+  *     cdef readonly object root             # <<<<<<<<<<<<<<
+@@ -194290,7 +194290,7 @@ static PyObject *__pyx_pf_4lxml_5etree_9iterpars=
e_4root___get__(struct __pyx_obj
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":263
++/* "src/lxml/iterparse.pxi":265
+  *     cdef _IterwalkSkipStates _skip_state
+  *=20
+  *     def __init__(self, element_or_tree, events=3D(u"end",), tag=3DNone=
):             # <<<<<<<<<<<<<<
+@@ -194342,26 +194342,26 @@ static int __pyx_pw_4lxml_5etree_8iterwalk_1__=
init__(PyObject *__pyx_v_self, PyO
+           (void)__Pyx_Arg_NewRef_VARARGS(values[0]);
+           kw_args--;
+         }
+-        else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 263, __pyx_L3_=
error)
++        else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 265, __pyx_L3_=
error)
+         else goto __pyx_L5_argtuple_error;
+         CYTHON_FALLTHROUGH;
+         case  1:
+         if (kw_args > 0) {
+           PyObject* value =3D __Pyx_GetKwValue_VARARGS(__pyx_kwds, __pyx_=
kwvalues, __pyx_n_s_events);
+           if (value) { values[1] =3D __Pyx_Arg_NewRef_VARARGS(value); kw_=
args--; }
+-          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 263, __pyx_L=
3_error)
++          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 265, __pyx_L=
3_error)
+         }
+         CYTHON_FALLTHROUGH;
+         case  2:
+         if (kw_args > 0) {
+           PyObject* value =3D __Pyx_GetKwValue_VARARGS(__pyx_kwds, __pyx_=
kwvalues, __pyx_n_s_tag);
+           if (value) { values[2] =3D __Pyx_Arg_NewRef_VARARGS(value); kw_=
args--; }
+-          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 263, __pyx_L=
3_error)
++          else if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 265, __pyx_L=
3_error)
+         }
+       }
+       if (unlikely(kw_args > 0)) {
+         const Py_ssize_t kwd_pos_args =3D __pyx_nargs;
+-        if (unlikely(__Pyx_ParseOptionalKeywords(__pyx_kwds, __pyx_kwvalu=
es, __pyx_pyargnames, 0, values + 0, kwd_pos_args, "__init__") < 0)) __PYX_=
ERR(14, 263, __pyx_L3_error)
++        if (unlikely(__Pyx_ParseOptionalKeywords(__pyx_kwds, __pyx_kwvalu=
es, __pyx_pyargnames, 0, values + 0, kwd_pos_args, "__init__") < 0)) __PYX_=
ERR(14, 265, __pyx_L3_error)
+       }
+     } else {
+       switch (__pyx_nargs) {
+@@ -194380,7 +194380,7 @@ static int __pyx_pw_4lxml_5etree_8iterwalk_1__in=
it__(PyObject *__pyx_v_self, PyO
+   }
+   goto __pyx_L6_skip;
+   __pyx_L5_argtuple_error:;
+-  __Pyx_RaiseArgtupleInvalid("__init__", 0, 1, 3, __pyx_nargs); __PYX_ERR=
(14, 263, __pyx_L3_error)
++  __Pyx_RaiseArgtupleInvalid("__init__", 0, 1, 3, __pyx_nargs); __PYX_ERR=
(14, 265, __pyx_L3_error)
+   __pyx_L6_skip:;
+   goto __pyx_L4_argument_unpacking_done;
+   __pyx_L3_error:;
+@@ -194426,29 +194426,29 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("__init__", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":266
++  /* "src/lxml/iterparse.pxi":268
+  *         cdef _Element root
+  *         cdef int ns_count
+  *         root =3D _rootNodeOrRaise(element_or_tree)             # <<<<<=
<<<<<<<<<
+  *         self._event_filter =3D _buildParseEventFilter(events)
+  *         if tag is None or tag =3D=3D '*':
+  */
+-  __pyx_t_1 =3D ((PyObject *)__pyx_f_4lxml_5etree__rootNodeOrRaise(__pyx_=
v_element_or_tree)); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 266, __pyx_L1_=
error)
++  __pyx_t_1 =3D ((PyObject *)__pyx_f_4lxml_5etree__rootNodeOrRaise(__pyx_=
v_element_or_tree)); if (unlikely(!__pyx_t_1)) __PYX_ERR(14, 268, __pyx_L1_=
error)
+   __Pyx_GOTREF(__pyx_t_1);
+   __pyx_v_root =3D ((struct LxmlElement *)__pyx_t_1);
+   __pyx_t_1 =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":267
++  /* "src/lxml/iterparse.pxi":269
+  *         cdef int ns_count
+  *         root =3D _rootNodeOrRaise(element_or_tree)
+  *         self._event_filter =3D _buildParseEventFilter(events)         =
    # <<<<<<<<<<<<<<
+  *         if tag is None or tag =3D=3D '*':
+  *             self._matcher =3D None
+  */
+-  __pyx_t_2 =3D __pyx_f_4lxml_5etree__buildParseEventFilter(__pyx_v_event=
s); if (unlikely(__pyx_t_2 =3D=3D ((int)-1))) __PYX_ERR(14, 267, __pyx_L1_e=
rror)
++  __pyx_t_2 =3D __pyx_f_4lxml_5etree__buildParseEventFilter(__pyx_v_event=
s); if (unlikely(__pyx_t_2 =3D=3D ((int)-1))) __PYX_ERR(14, 269, __pyx_L1_e=
rror)
+   __pyx_v_self->_event_filter =3D __pyx_t_2;
+=20
+-  /* "src/lxml/iterparse.pxi":268
++  /* "src/lxml/iterparse.pxi":270
+  *         root =3D _rootNodeOrRaise(element_or_tree)
+  *         self._event_filter =3D _buildParseEventFilter(events)
+  *         if tag is None or tag =3D=3D '*':             # <<<<<<<<<<<<<<
+@@ -194461,12 +194461,12 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+     __pyx_t_3 =3D __pyx_t_4;
+     goto __pyx_L4_bool_binop_done;
+   }
+-  __pyx_t_4 =3D (__Pyx_PyString_Equals(__pyx_v_tag, __pyx_n_s__20, Py_EQ)=
); if (unlikely((__pyx_t_4 < 0))) __PYX_ERR(14, 268, __pyx_L1_error)
++  __pyx_t_4 =3D (__Pyx_PyString_Equals(__pyx_v_tag, __pyx_n_s__20, Py_EQ)=
); if (unlikely((__pyx_t_4 < 0))) __PYX_ERR(14, 270, __pyx_L1_error)
+   __pyx_t_3 =3D __pyx_t_4;
+   __pyx_L4_bool_binop_done:;
+   if (__pyx_t_3) {
+=20
+-    /* "src/lxml/iterparse.pxi":269
++    /* "src/lxml/iterparse.pxi":271
+  *         self._event_filter =3D _buildParseEventFilter(events)
+  *         if tag is None or tag =3D=3D '*':
+  *             self._matcher =3D None             # <<<<<<<<<<<<<<
+@@ -194479,7 +194479,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+     __Pyx_DECREF((PyObject *)__pyx_v_self->_matcher);
+     __pyx_v_self->_matcher =3D ((struct __pyx_obj_4lxml_5etree__MultiTagM=
atcher *)Py_None);
+=20
+-    /* "src/lxml/iterparse.pxi":268
++    /* "src/lxml/iterparse.pxi":270
+  *         root =3D _rootNodeOrRaise(element_or_tree)
+  *         self._event_filter =3D _buildParseEventFilter(events)
+  *         if tag is None or tag =3D=3D '*':             # <<<<<<<<<<<<<<
+@@ -194489,7 +194489,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+     goto __pyx_L3;
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":271
++  /* "src/lxml/iterparse.pxi":273
+  *             self._matcher =3D None
+  *         else:
+  *             self._matcher =3D _MultiTagMatcher.__new__(_MultiTagMatche=
r, tag)             # <<<<<<<<<<<<<<
+@@ -194497,12 +194497,12 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+  *         self._events =3D []
+  */
+   /*else*/ {
+-    __pyx_t_1 =3D PyTuple_New(1); if (unlikely(!__pyx_t_1)) __PYX_ERR(14,=
 271, __pyx_L1_error)
++    __pyx_t_1 =3D PyTuple_New(1); if (unlikely(!__pyx_t_1)) __PYX_ERR(14,=
 273, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_1);
+     __Pyx_INCREF(__pyx_v_tag);
+     __Pyx_GIVEREF(__pyx_v_tag);
+-    if (__Pyx_PyTuple_SET_ITEM(__pyx_t_1, 0, __pyx_v_tag)) __PYX_ERR(14, =
271, __pyx_L1_error);
+-    __pyx_t_5 =3D ((PyObject *)__pyx_tp_new_4lxml_5etree__MultiTagMatcher=
(((PyTypeObject *)__pyx_ptype_4lxml_5etree__MultiTagMatcher), __pyx_t_1, NU=
LL)); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 271, __pyx_L1_error)
++    if (__Pyx_PyTuple_SET_ITEM(__pyx_t_1, 0, __pyx_v_tag)) __PYX_ERR(14, =
273, __pyx_L1_error);
++    __pyx_t_5 =3D ((PyObject *)__pyx_tp_new_4lxml_5etree__MultiTagMatcher=
(((PyTypeObject *)__pyx_ptype_4lxml_5etree__MultiTagMatcher), __pyx_t_1, NU=
LL)); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 273, __pyx_L1_error)
+     __Pyx_GOTREF((PyObject *)__pyx_t_5);
+     __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+     __Pyx_GIVEREF((PyObject *)__pyx_t_5);
+@@ -194513,14 +194513,14 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+   }
+   __pyx_L3:;
+=20
+-  /* "src/lxml/iterparse.pxi":272
++  /* "src/lxml/iterparse.pxi":274
+  *         else:
+  *             self._matcher =3D _MultiTagMatcher.__new__(_MultiTagMatche=
r, tag)
+  *         self._node_stack  =3D []             # <<<<<<<<<<<<<<
+  *         self._events =3D []
+  *         self._pop_event =3D self._events.pop
+  */
+-  __pyx_t_5 =3D PyList_New(0); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 27=
2, __pyx_L1_error)
++  __pyx_t_5 =3D PyList_New(0); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 27=
4, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_5);
+   __Pyx_GIVEREF(__pyx_t_5);
+   __Pyx_GOTREF(__pyx_v_self->_node_stack);
+@@ -194528,14 +194528,14 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+   __pyx_v_self->_node_stack =3D ((PyObject*)__pyx_t_5);
+   __pyx_t_5 =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":273
++  /* "src/lxml/iterparse.pxi":275
+  *             self._matcher =3D _MultiTagMatcher.__new__(_MultiTagMatche=
r, tag)
+  *         self._node_stack  =3D []
+  *         self._events =3D []             # <<<<<<<<<<<<<<
+  *         self._pop_event =3D self._events.pop
+  *         self._skip_state =3D IWSKIP_CANNOT_SKIP  # ignore all skip req=
uests by default
+  */
+-  __pyx_t_5 =3D PyList_New(0); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 27=
3, __pyx_L1_error)
++  __pyx_t_5 =3D PyList_New(0); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 27=
5, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_5);
+   __Pyx_GIVEREF(__pyx_t_5);
+   __Pyx_GOTREF(__pyx_v_self->_events);
+@@ -194543,14 +194543,14 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+   __pyx_v_self->_events =3D ((PyObject*)__pyx_t_5);
+   __pyx_t_5 =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":274
++  /* "src/lxml/iterparse.pxi":276
+  *         self._node_stack  =3D []
+  *         self._events =3D []
+  *         self._pop_event =3D self._events.pop             # <<<<<<<<<<<=
<<<
+  *         self._skip_state =3D IWSKIP_CANNOT_SKIP  # ignore all skip req=
uests by default
+  *=20
+  */
+-  __pyx_t_5 =3D __Pyx_PyObject_GetAttrStr(__pyx_v_self->_events, __pyx_n_=
s_pop); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 274, __pyx_L1_error)
++  __pyx_t_5 =3D __Pyx_PyObject_GetAttrStr(__pyx_v_self->_events, __pyx_n_=
s_pop); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 276, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_5);
+   __Pyx_GIVEREF(__pyx_t_5);
+   __Pyx_GOTREF(__pyx_v_self->_pop_event);
+@@ -194558,7 +194558,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+   __pyx_v_self->_pop_event =3D __pyx_t_5;
+   __pyx_t_5 =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":275
++  /* "src/lxml/iterparse.pxi":277
+  *         self._events =3D []
+  *         self._pop_event =3D self._events.pop
+  *         self._skip_state =3D IWSKIP_CANNOT_SKIP  # ignore all skip req=
uests by default             # <<<<<<<<<<<<<<
+@@ -194567,7 +194567,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+  */
+   __pyx_v_self->_skip_state =3D __pyx_e_4lxml_5etree_IWSKIP_CANNOT_SKIP;
+=20
+-  /* "src/lxml/iterparse.pxi":277
++  /* "src/lxml/iterparse.pxi":279
+  *         self._skip_state =3D IWSKIP_CANNOT_SKIP  # ignore all skip req=
uests by default
+  *=20
+  *         if self._event_filter:             # <<<<<<<<<<<<<<
+@@ -194577,7 +194577,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+   __pyx_t_3 =3D (__pyx_v_self->_event_filter !=3D 0);
+   if (__pyx_t_3) {
+=20
+-    /* "src/lxml/iterparse.pxi":278
++    /* "src/lxml/iterparse.pxi":280
+  *=20
+  *         if self._event_filter:
+  *             self._index =3D 0             # <<<<<<<<<<<<<<
+@@ -194586,7 +194586,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+  */
+     __pyx_v_self->_index =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":279
++    /* "src/lxml/iterparse.pxi":281
+  *         if self._event_filter:
+  *             self._index =3D 0
+  *             if self._matcher is not None and self._event_filter & PARS=
E_EVENT_FILTER_START:             # <<<<<<<<<<<<<<
+@@ -194604,7 +194604,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+     __pyx_L8_bool_binop_done:;
+     if (__pyx_t_3) {
+=20
+-      /* "src/lxml/iterparse.pxi":280
++      /* "src/lxml/iterparse.pxi":282
+  *             self._index =3D 0
+  *             if self._matcher is not None and self._event_filter & PARS=
E_EVENT_FILTER_START:
+  *                 self._matcher.cacheTags(root._doc)             # <<<<<=
<<<<<<<<<
+@@ -194615,11 +194615,11 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+       __Pyx_INCREF(__pyx_t_5);
+ #pragma GCC diagnostic push
+       #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-      __pyx_t_2 =3D __pyx_f_4lxml_5etree_16_MultiTagMatcher_cacheTags(__p=
yx_v_self->_matcher, ((struct LxmlDocument *)__pyx_t_5), NULL); if (unlikel=
y(__pyx_t_2 =3D=3D ((int)-1))) __PYX_ERR(14, 280, __pyx_L1_error)
++      __pyx_t_2 =3D __pyx_f_4lxml_5etree_16_MultiTagMatcher_cacheTags(__p=
yx_v_self->_matcher, ((struct LxmlDocument *)__pyx_t_5), NULL); if (unlikel=
y(__pyx_t_2 =3D=3D ((int)-1))) __PYX_ERR(14, 282, __pyx_L1_error)
+       #pragma GCC diagnostic pop
+       __Pyx_DECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+=20
+-      /* "src/lxml/iterparse.pxi":279
++      /* "src/lxml/iterparse.pxi":281
+  *         if self._event_filter:
+  *             self._index =3D 0
+  *             if self._matcher is not None and self._event_filter & PARS=
E_EVENT_FILTER_START:             # <<<<<<<<<<<<<<
+@@ -194628,7 +194628,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+  */
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":283
++    /* "src/lxml/iterparse.pxi":285
+  *=20
+  *             # When processing an ElementTree, add events for the prece=
ding comments/PIs.
+  *             if self._event_filter & (PARSE_EVENT_FILTER_COMMENT | PARS=
E_EVENT_FILTER_PI):             # <<<<<<<<<<<<<<
+@@ -194638,7 +194638,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+     __pyx_t_3 =3D ((__pyx_v_self->_event_filter & (__pyx_e_4lxml_5etree_P=
ARSE_EVENT_FILTER_COMMENT | __pyx_e_4lxml_5etree_PARSE_EVENT_FILTER_PI)) !=
=3D 0);
+     if (__pyx_t_3) {
+=20
+-      /* "src/lxml/iterparse.pxi":284
++      /* "src/lxml/iterparse.pxi":286
+  *             # When processing an ElementTree, add events for the prece=
ding comments/PIs.
+  *             if self._event_filter & (PARSE_EVENT_FILTER_COMMENT | PARS=
E_EVENT_FILTER_PI):
+  *                 if isinstance(element_or_tree, _ElementTree):         =
    # <<<<<<<<<<<<<<
+@@ -194648,7 +194648,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+       __pyx_t_3 =3D __Pyx_TypeCheck(__pyx_v_element_or_tree, __pyx_ptype_=
4lxml_5etree__ElementTree);=20
+       if (__pyx_t_3) {
+=20
+-        /* "src/lxml/iterparse.pxi":285
++        /* "src/lxml/iterparse.pxi":287
+  *             if self._event_filter & (PARSE_EVENT_FILTER_COMMENT | PARS=
E_EVENT_FILTER_PI):
+  *                 if isinstance(element_or_tree, _ElementTree):
+  *                     self._include_siblings =3D root             # <<<<=
<<<<<<<<<<
+@@ -194661,26 +194661,26 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+         __Pyx_DECREF(__pyx_v_self->_include_siblings);
+         __pyx_v_self->_include_siblings =3D ((PyObject *)__pyx_v_root);
+=20
+-        /* "src/lxml/iterparse.pxi":286
++        /* "src/lxml/iterparse.pxi":288
+  *                 if isinstance(element_or_tree, _ElementTree):
+  *                     self._include_siblings =3D root
+  *                     for elem in list(root.itersiblings(preceding=3DTru=
e))[::-1]:             # <<<<<<<<<<<<<<
+  *                         if self._event_filter & PARSE_EVENT_FILTER_COM=
MENT and elem.tag is Comment:
+  *                             self._events.append((u'comment', elem))
+  */
+-        __pyx_t_5 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_root=
), __pyx_n_s_itersiblings); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 286, __=
pyx_L1_error)
++        __pyx_t_5 =3D __Pyx_PyObject_GetAttrStr(((PyObject *)__pyx_v_root=
), __pyx_n_s_itersiblings); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 288, __=
pyx_L1_error)
+         __Pyx_GOTREF(__pyx_t_5);
+-        __pyx_t_1 =3D __Pyx_PyDict_NewPresized(1); if (unlikely(!__pyx_t_=
1)) __PYX_ERR(14, 286, __pyx_L1_error)
++        __pyx_t_1 =3D __Pyx_PyDict_NewPresized(1); if (unlikely(!__pyx_t_=
1)) __PYX_ERR(14, 288, __pyx_L1_error)
+         __Pyx_GOTREF(__pyx_t_1);
+-        if (PyDict_SetItem(__pyx_t_1, __pyx_n_s_preceding, Py_True) < 0) =
__PYX_ERR(14, 286, __pyx_L1_error)
+-        __pyx_t_6 =3D __Pyx_PyObject_Call(__pyx_t_5, __pyx_empty_tuple, _=
_pyx_t_1); if (unlikely(!__pyx_t_6)) __PYX_ERR(14, 286, __pyx_L1_error)
++        if (PyDict_SetItem(__pyx_t_1, __pyx_n_s_preceding, Py_True) < 0) =
__PYX_ERR(14, 288, __pyx_L1_error)
++        __pyx_t_6 =3D __Pyx_PyObject_Call(__pyx_t_5, __pyx_empty_tuple, _=
_pyx_t_1); if (unlikely(!__pyx_t_6)) __PYX_ERR(14, 288, __pyx_L1_error)
+         __Pyx_GOTREF(__pyx_t_6);
+         __Pyx_DECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+         __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+-        __pyx_t_1 =3D __Pyx_PySequence_ListKeepNew(__pyx_t_6); if (unlike=
ly(!__pyx_t_1)) __PYX_ERR(14, 286, __pyx_L1_error)
++        __pyx_t_1 =3D __Pyx_PySequence_ListKeepNew(__pyx_t_6); if (unlike=
ly(!__pyx_t_1)) __PYX_ERR(14, 288, __pyx_L1_error)
+         __Pyx_GOTREF(__pyx_t_1);
+         __Pyx_DECREF(__pyx_t_6); __pyx_t_6 =3D 0;
+-        __pyx_t_6 =3D __Pyx_PyObject_GetItem(__pyx_t_1, __pyx_slice__54);=
 if (unlikely(!__pyx_t_6)) __PYX_ERR(14, 286, __pyx_L1_error)
++        __pyx_t_6 =3D __Pyx_PyObject_GetItem(__pyx_t_1, __pyx_slice__54);=
 if (unlikely(!__pyx_t_6)) __PYX_ERR(14, 288, __pyx_L1_error)
+         __Pyx_GOTREF(__pyx_t_6);
+         __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+         __pyx_t_1 =3D __pyx_t_6; __Pyx_INCREF(__pyx_t_1);
+@@ -194690,20 +194690,20 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+           {
+             Py_ssize_t __pyx_temp =3D __Pyx_PyList_GET_SIZE(__pyx_t_1);
+             #if !CYTHON_ASSUME_SAFE_MACROS
+-            if (unlikely((__pyx_temp < 0))) __PYX_ERR(14, 286, __pyx_L1_e=
rror)
++            if (unlikely((__pyx_temp < 0))) __PYX_ERR(14, 288, __pyx_L1_e=
rror)
+             #endif
+             if (__pyx_t_7 >=3D __pyx_temp) break;
+           }
+           #if CYTHON_ASSUME_SAFE_MACROS && !CYTHON_AVOID_BORROWED_REFS
+-          __pyx_t_6 =3D PyList_GET_ITEM(__pyx_t_1, __pyx_t_7); __Pyx_INCR=
EF(__pyx_t_6); __pyx_t_7++; if (unlikely((0 < 0))) __PYX_ERR(14, 286, __pyx=
_L1_error)
++          __pyx_t_6 =3D PyList_GET_ITEM(__pyx_t_1, __pyx_t_7); __Pyx_INCR=
EF(__pyx_t_6); __pyx_t_7++; if (unlikely((0 < 0))) __PYX_ERR(14, 288, __pyx=
_L1_error)
+           #else
+-          __pyx_t_6 =3D __Pyx_PySequence_ITEM(__pyx_t_1, __pyx_t_7); __py=
x_t_7++; if (unlikely(!__pyx_t_6)) __PYX_ERR(14, 286, __pyx_L1_error)
++          __pyx_t_6 =3D __Pyx_PySequence_ITEM(__pyx_t_1, __pyx_t_7); __py=
x_t_7++; if (unlikely(!__pyx_t_6)) __PYX_ERR(14, 288, __pyx_L1_error)
+           __Pyx_GOTREF(__pyx_t_6);
+           #endif
+           __Pyx_XDECREF_SET(__pyx_v_elem, __pyx_t_6);
+           __pyx_t_6 =3D 0;
+=20
+-          /* "src/lxml/iterparse.pxi":287
++          /* "src/lxml/iterparse.pxi":289
+  *                     self._include_siblings =3D root
+  *                     for elem in list(root.itersiblings(preceding=3DTru=
e))[::-1]:
+  *                         if self._event_filter & PARSE_EVENT_FILTER_COM=
MENT and elem.tag is Comment:             # <<<<<<<<<<<<<<
+@@ -194716,9 +194716,9 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+             __pyx_t_3 =3D __pyx_t_4;
+             goto __pyx_L15_bool_binop_done;
+           }
+-          __pyx_t_6 =3D __Pyx_PyObject_GetAttrStr(__pyx_v_elem, __pyx_n_s=
_tag); if (unlikely(!__pyx_t_6)) __PYX_ERR(14, 287, __pyx_L1_error)
++          __pyx_t_6 =3D __Pyx_PyObject_GetAttrStr(__pyx_v_elem, __pyx_n_s=
_tag); if (unlikely(!__pyx_t_6)) __PYX_ERR(14, 289, __pyx_L1_error)
+           __Pyx_GOTREF(__pyx_t_6);
+-          __Pyx_GetModuleGlobalName(__pyx_t_5, __pyx_n_s_Comment); if (un=
likely(!__pyx_t_5)) __PYX_ERR(14, 287, __pyx_L1_error)
++          __Pyx_GetModuleGlobalName(__pyx_t_5, __pyx_n_s_Comment); if (un=
likely(!__pyx_t_5)) __PYX_ERR(14, 289, __pyx_L1_error)
+           __Pyx_GOTREF(__pyx_t_5);
+           __pyx_t_4 =3D (__pyx_t_6 =3D=3D __pyx_t_5);
+           __Pyx_DECREF(__pyx_t_6); __pyx_t_6 =3D 0;
+@@ -194727,7 +194727,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+           __pyx_L15_bool_binop_done:;
+           if (__pyx_t_3) {
+=20
+-            /* "src/lxml/iterparse.pxi":288
++            /* "src/lxml/iterparse.pxi":290
+  *                     for elem in list(root.itersiblings(preceding=3DTru=
e))[::-1]:
+  *                         if self._event_filter & PARSE_EVENT_FILTER_COM=
MENT and elem.tag is Comment:
+  *                             self._events.append((u'comment', elem))   =
          # <<<<<<<<<<<<<<
+@@ -194736,20 +194736,20 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+  */
+             if (unlikely(__pyx_v_self->_events =3D=3D Py_None)) {
+               PyErr_Format(PyExc_AttributeError, "'NoneType' object has n=
o attribute '%.30s'", "append");
+-              __PYX_ERR(14, 288, __pyx_L1_error)
++              __PYX_ERR(14, 290, __pyx_L1_error)
+             }
+-            __pyx_t_5 =3D PyTuple_New(2); if (unlikely(!__pyx_t_5)) __PYX=
_ERR(14, 288, __pyx_L1_error)
++            __pyx_t_5 =3D PyTuple_New(2); if (unlikely(!__pyx_t_5)) __PYX=
_ERR(14, 290, __pyx_L1_error)
+             __Pyx_GOTREF(__pyx_t_5);
+             __Pyx_INCREF(__pyx_n_u_comment);
+             __Pyx_GIVEREF(__pyx_n_u_comment);
+-            if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 0, __pyx_n_u_comment)) =
__PYX_ERR(14, 288, __pyx_L1_error);
++            if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 0, __pyx_n_u_comment)) =
__PYX_ERR(14, 290, __pyx_L1_error);
+             __Pyx_INCREF(__pyx_v_elem);
+             __Pyx_GIVEREF(__pyx_v_elem);
+-            if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 1, __pyx_v_elem)) __PYX=
_ERR(14, 288, __pyx_L1_error);
+-            __pyx_t_8 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __py=
x_t_5); if (unlikely(__pyx_t_8 =3D=3D ((int)-1))) __PYX_ERR(14, 288, __pyx_=
L1_error)
++            if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 1, __pyx_v_elem)) __PYX=
_ERR(14, 290, __pyx_L1_error);
++            __pyx_t_8 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __py=
x_t_5); if (unlikely(__pyx_t_8 =3D=3D ((int)-1))) __PYX_ERR(14, 290, __pyx_=
L1_error)
+             __Pyx_DECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+=20
+-            /* "src/lxml/iterparse.pxi":287
++            /* "src/lxml/iterparse.pxi":289
+  *                     self._include_siblings =3D root
+  *                     for elem in list(root.itersiblings(preceding=3DTru=
e))[::-1]:
+  *                         if self._event_filter & PARSE_EVENT_FILTER_COM=
MENT and elem.tag is Comment:             # <<<<<<<<<<<<<<
+@@ -194759,7 +194759,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+             goto __pyx_L14;
+           }
+=20
+-          /* "src/lxml/iterparse.pxi":289
++          /* "src/lxml/iterparse.pxi":291
+  *                         if self._event_filter & PARSE_EVENT_FILTER_COM=
MENT and elem.tag is Comment:
+  *                             self._events.append((u'comment', elem))
+  *                         elif self._event_filter & PARSE_EVENT_FILTER_P=
I and elem.tag is PI:             # <<<<<<<<<<<<<<
+@@ -194772,9 +194772,9 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+             __pyx_t_3 =3D __pyx_t_4;
+             goto __pyx_L17_bool_binop_done;
+           }
+-          __pyx_t_5 =3D __Pyx_PyObject_GetAttrStr(__pyx_v_elem, __pyx_n_s=
_tag); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 289, __pyx_L1_error)
++          __pyx_t_5 =3D __Pyx_PyObject_GetAttrStr(__pyx_v_elem, __pyx_n_s=
_tag); if (unlikely(!__pyx_t_5)) __PYX_ERR(14, 291, __pyx_L1_error)
+           __Pyx_GOTREF(__pyx_t_5);
+-          __Pyx_GetModuleGlobalName(__pyx_t_6, __pyx_n_s_PI); if (unlikel=
y(!__pyx_t_6)) __PYX_ERR(14, 289, __pyx_L1_error)
++          __Pyx_GetModuleGlobalName(__pyx_t_6, __pyx_n_s_PI); if (unlikel=
y(!__pyx_t_6)) __PYX_ERR(14, 291, __pyx_L1_error)
+           __Pyx_GOTREF(__pyx_t_6);
+           __pyx_t_4 =3D (__pyx_t_5 =3D=3D __pyx_t_6);
+           __Pyx_DECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+@@ -194783,7 +194783,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+           __pyx_L17_bool_binop_done:;
+           if (__pyx_t_3) {
+=20
+-            /* "src/lxml/iterparse.pxi":290
++            /* "src/lxml/iterparse.pxi":292
+  *                             self._events.append((u'comment', elem))
+  *                         elif self._event_filter & PARSE_EVENT_FILTER_P=
I and elem.tag is PI:
+  *                             self._events.append((u'pi', elem))        =
     # <<<<<<<<<<<<<<
+@@ -194792,20 +194792,20 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+  */
+             if (unlikely(__pyx_v_self->_events =3D=3D Py_None)) {
+               PyErr_Format(PyExc_AttributeError, "'NoneType' object has n=
o attribute '%.30s'", "append");
+-              __PYX_ERR(14, 290, __pyx_L1_error)
++              __PYX_ERR(14, 292, __pyx_L1_error)
+             }
+-            __pyx_t_6 =3D PyTuple_New(2); if (unlikely(!__pyx_t_6)) __PYX=
_ERR(14, 290, __pyx_L1_error)
++            __pyx_t_6 =3D PyTuple_New(2); if (unlikely(!__pyx_t_6)) __PYX=
_ERR(14, 292, __pyx_L1_error)
+             __Pyx_GOTREF(__pyx_t_6);
+             __Pyx_INCREF(__pyx_n_u_pi);
+             __Pyx_GIVEREF(__pyx_n_u_pi);
+-            if (__Pyx_PyTuple_SET_ITEM(__pyx_t_6, 0, __pyx_n_u_pi)) __PYX=
_ERR(14, 290, __pyx_L1_error);
++            if (__Pyx_PyTuple_SET_ITEM(__pyx_t_6, 0, __pyx_n_u_pi)) __PYX=
_ERR(14, 292, __pyx_L1_error);
+             __Pyx_INCREF(__pyx_v_elem);
+             __Pyx_GIVEREF(__pyx_v_elem);
+-            if (__Pyx_PyTuple_SET_ITEM(__pyx_t_6, 1, __pyx_v_elem)) __PYX=
_ERR(14, 290, __pyx_L1_error);
+-            __pyx_t_8 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __py=
x_t_6); if (unlikely(__pyx_t_8 =3D=3D ((int)-1))) __PYX_ERR(14, 290, __pyx_=
L1_error)
++            if (__Pyx_PyTuple_SET_ITEM(__pyx_t_6, 1, __pyx_v_elem)) __PYX=
_ERR(14, 292, __pyx_L1_error);
++            __pyx_t_8 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __py=
x_t_6); if (unlikely(__pyx_t_8 =3D=3D ((int)-1))) __PYX_ERR(14, 292, __pyx_=
L1_error)
+             __Pyx_DECREF(__pyx_t_6); __pyx_t_6 =3D 0;
+=20
+-            /* "src/lxml/iterparse.pxi":289
++            /* "src/lxml/iterparse.pxi":291
+  *                         if self._event_filter & PARSE_EVENT_FILTER_COM=
MENT and elem.tag is Comment:
+  *                             self._events.append((u'comment', elem))
+  *                         elif self._event_filter & PARSE_EVENT_FILTER_P=
I and elem.tag is PI:             # <<<<<<<<<<<<<<
+@@ -194815,7 +194815,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+           }
+           __pyx_L14:;
+=20
+-          /* "src/lxml/iterparse.pxi":286
++          /* "src/lxml/iterparse.pxi":288
+  *                 if isinstance(element_or_tree, _ElementTree):
+  *                     self._include_siblings =3D root
+  *                     for elem in list(root.itersiblings(preceding=3DTru=
e))[::-1]:             # <<<<<<<<<<<<<<
+@@ -194825,7 +194825,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+         }
+         __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+=20
+-        /* "src/lxml/iterparse.pxi":284
++        /* "src/lxml/iterparse.pxi":286
+  *             # When processing an ElementTree, add events for the prece=
ding comments/PIs.
+  *             if self._event_filter & (PARSE_EVENT_FILTER_COMMENT | PARS=
E_EVENT_FILTER_PI):
+  *                 if isinstance(element_or_tree, _ElementTree):         =
    # <<<<<<<<<<<<<<
+@@ -194834,7 +194834,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+  */
+       }
+=20
+-      /* "src/lxml/iterparse.pxi":283
++      /* "src/lxml/iterparse.pxi":285
+  *=20
+  *             # When processing an ElementTree, add events for the prece=
ding comments/PIs.
+  *             if self._event_filter & (PARSE_EVENT_FILTER_COMMENT | PARS=
E_EVENT_FILTER_PI):             # <<<<<<<<<<<<<<
+@@ -194843,7 +194843,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+  */
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":292
++    /* "src/lxml/iterparse.pxi":294
+  *                             self._events.append((u'pi', elem))
+  *=20
+  *             ns_count =3D self._start_node(root)             # <<<<<<<<=
<<<<<<
+@@ -194852,11 +194852,11 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+  */
+ #pragma GCC diagnostic push
+     #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-    __pyx_t_2 =3D __pyx_f_4lxml_5etree_8iterwalk__start_node(__pyx_v_self=
, __pyx_v_root); if (unlikely(__pyx_t_2 =3D=3D ((int)-1))) __PYX_ERR(14, 29=
2, __pyx_L1_error)
++    __pyx_t_2 =3D __pyx_f_4lxml_5etree_8iterwalk__start_node(__pyx_v_self=
, __pyx_v_root); if (unlikely(__pyx_t_2 =3D=3D ((int)-1))) __PYX_ERR(14, 29=
4, __pyx_L1_error)
+     #pragma GCC diagnostic pop
+     __pyx_v_ns_count =3D __pyx_t_2;
+=20
+-    /* "src/lxml/iterparse.pxi":293
++    /* "src/lxml/iterparse.pxi":295
+  *=20
+  *             ns_count =3D self._start_node(root)
+  *             self._node_stack.append( (root, ns_count) )             # =
<<<<<<<<<<<<<<
+@@ -194865,22 +194865,22 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___i=
nit__(struct __pyx_obj_4lxml_5etre
+  */
+     if (unlikely(__pyx_v_self->_node_stack =3D=3D Py_None)) {
+       PyErr_Format(PyExc_AttributeError, "'NoneType' object has no attrib=
ute '%.30s'", "append");
+-      __PYX_ERR(14, 293, __pyx_L1_error)
++      __PYX_ERR(14, 295, __pyx_L1_error)
+     }
+-    __pyx_t_1 =3D __Pyx_PyInt_From_int(__pyx_v_ns_count); if (unlikely(!_=
_pyx_t_1)) __PYX_ERR(14, 293, __pyx_L1_error)
++    __pyx_t_1 =3D __Pyx_PyInt_From_int(__pyx_v_ns_count); if (unlikely(!_=
_pyx_t_1)) __PYX_ERR(14, 295, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_1);
+-    __pyx_t_6 =3D PyTuple_New(2); if (unlikely(!__pyx_t_6)) __PYX_ERR(14,=
 293, __pyx_L1_error)
++    __pyx_t_6 =3D PyTuple_New(2); if (unlikely(!__pyx_t_6)) __PYX_ERR(14,=
 295, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_6);
+     __Pyx_INCREF((PyObject *)__pyx_v_root);
+     __Pyx_GIVEREF((PyObject *)__pyx_v_root);
+-    if (__Pyx_PyTuple_SET_ITEM(__pyx_t_6, 0, ((PyObject *)__pyx_v_root)))=
 __PYX_ERR(14, 293, __pyx_L1_error);
++    if (__Pyx_PyTuple_SET_ITEM(__pyx_t_6, 0, ((PyObject *)__pyx_v_root)))=
 __PYX_ERR(14, 295, __pyx_L1_error);
+     __Pyx_GIVEREF(__pyx_t_1);
+-    if (__Pyx_PyTuple_SET_ITEM(__pyx_t_6, 1, __pyx_t_1)) __PYX_ERR(14, 29=
3, __pyx_L1_error);
++    if (__Pyx_PyTuple_SET_ITEM(__pyx_t_6, 1, __pyx_t_1)) __PYX_ERR(14, 29=
5, __pyx_L1_error);
+     __pyx_t_1 =3D 0;
+-    __pyx_t_8 =3D __Pyx_PyList_Append(__pyx_v_self->_node_stack, __pyx_t_=
6); if (unlikely(__pyx_t_8 =3D=3D ((int)-1))) __PYX_ERR(14, 293, __pyx_L1_e=
rror)
++    __pyx_t_8 =3D __Pyx_PyList_Append(__pyx_v_self->_node_stack, __pyx_t_=
6); if (unlikely(__pyx_t_8 =3D=3D ((int)-1))) __PYX_ERR(14, 295, __pyx_L1_e=
rror)
+     __Pyx_DECREF(__pyx_t_6); __pyx_t_6 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":277
++    /* "src/lxml/iterparse.pxi":279
+  *         self._skip_state =3D IWSKIP_CANNOT_SKIP  # ignore all skip req=
uests by default
+  *=20
+  *         if self._event_filter:             # <<<<<<<<<<<<<<
+@@ -194890,7 +194890,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+     goto __pyx_L6;
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":295
++  /* "src/lxml/iterparse.pxi":297
+  *             self._node_stack.append( (root, ns_count) )
+  *         else:
+  *             self._index =3D -1             # <<<<<<<<<<<<<<
+@@ -194902,7 +194902,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+   }
+   __pyx_L6:;
+=20
+-  /* "src/lxml/iterparse.pxi":263
++  /* "src/lxml/iterparse.pxi":265
+  *     cdef _IterwalkSkipStates _skip_state
+  *=20
+  *     def __init__(self, element_or_tree, events=3D(u"end",), tag=3DNone=
):             # <<<<<<<<<<<<<<
+@@ -194926,7 +194926,7 @@ static int __pyx_pf_4lxml_5etree_8iterwalk___ini=
t__(struct __pyx_obj_4lxml_5etre
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":297
++/* "src/lxml/iterparse.pxi":299
+  *             self._index =3D -1
+  *=20
+  *     def __iter__(self):             # <<<<<<<<<<<<<<
+@@ -194954,7 +194954,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_2__iter__(struct __pyx_obj_4lxm
+   __Pyx_RefNannyDeclarations
+   __Pyx_RefNannySetupContext("__iter__", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":298
++  /* "src/lxml/iterparse.pxi":300
+  *=20
+  *     def __iter__(self):
+  *         return self             # <<<<<<<<<<<<<<
+@@ -194966,7 +194966,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_2__iter__(struct __pyx_obj_4lxm
+   __pyx_r =3D ((PyObject *)__pyx_v_self);
+   goto __pyx_L0;
+=20
+-  /* "src/lxml/iterparse.pxi":297
++  /* "src/lxml/iterparse.pxi":299
+  *             self._index =3D -1
+  *=20
+  *     def __iter__(self):             # <<<<<<<<<<<<<<
+@@ -194981,7 +194981,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_2__iter__(struct __pyx_obj_4lxm
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":300
++/* "src/lxml/iterparse.pxi":302
+  *         return self
+  *=20
+  *     def __next__(self):             # <<<<<<<<<<<<<<
+@@ -195024,7 +195024,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("__next__", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":304
++  /* "src/lxml/iterparse.pxi":306
+  *         cdef _Element node
+  *         cdef _Element next_node
+  *         cdef int ns_count =3D 0             # <<<<<<<<<<<<<<
+@@ -195033,7 +195033,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+   __pyx_v_ns_count =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":305
++  /* "src/lxml/iterparse.pxi":307
+  *         cdef _Element next_node
+  *         cdef int ns_count =3D 0
+  *         if self._events:             # <<<<<<<<<<<<<<
+@@ -195043,7 +195043,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+   __pyx_t_1 =3D (__pyx_v_self->_events !=3D Py_None)&&(PyList_GET_SIZE(__=
pyx_v_self->_events) !=3D 0);
+   if (__pyx_t_1) {
+=20
+-    /* "src/lxml/iterparse.pxi":306
++    /* "src/lxml/iterparse.pxi":308
+  *         cdef int ns_count =3D 0
+  *         if self._events:
+  *             return self._next_event()             # <<<<<<<<<<<<<<
+@@ -195053,14 +195053,14 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+     __Pyx_XDECREF(__pyx_r);
+ #pragma GCC diagnostic push
+     #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-    __pyx_t_2 =3D __pyx_f_4lxml_5etree_8iterwalk__next_event(__pyx_v_self=
); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, 306, __pyx_L1_error)
++    __pyx_t_2 =3D __pyx_f_4lxml_5etree_8iterwalk__next_event(__pyx_v_self=
); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, 308, __pyx_L1_error)
+     #pragma GCC diagnostic pop
+     __Pyx_GOTREF(__pyx_t_2);
+     __pyx_r =3D __pyx_t_2;
+     __pyx_t_2 =3D 0;
+     goto __pyx_L0;
+=20
+-    /* "src/lxml/iterparse.pxi":305
++    /* "src/lxml/iterparse.pxi":307
+  *         cdef _Element next_node
+  *         cdef int ns_count =3D 0
+  *         if self._events:             # <<<<<<<<<<<<<<
+@@ -195069,7 +195069,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":307
++  /* "src/lxml/iterparse.pxi":309
+  *         if self._events:
+  *             return self._next_event()
+  *         if self._matcher is not None and self._index >=3D 0:          =
   # <<<<<<<<<<<<<<
+@@ -195087,7 +195087,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+   __pyx_L5_bool_binop_done:;
+   if (__pyx_t_1) {
+=20
+-    /* "src/lxml/iterparse.pxi":308
++    /* "src/lxml/iterparse.pxi":310
+  *             return self._next_event()
+  *         if self._matcher is not None and self._index >=3D 0:
+  *             node =3D self._node_stack[self._index][0]             # <<=
<<<<<<<<<<<<
+@@ -195096,18 +195096,18 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+  */
+     if (unlikely(__pyx_v_self->_node_stack =3D=3D Py_None)) {
+       PyErr_SetString(PyExc_TypeError, "'NoneType' object is not subscrip=
table");
+-      __PYX_ERR(14, 308, __pyx_L1_error)
++      __PYX_ERR(14, 310, __pyx_L1_error)
+     }
+-    __pyx_t_2 =3D __Pyx_GetItemInt_List(__pyx_v_self->_node_stack, __pyx_=
v_self->_index, int, 1, __Pyx_PyInt_From_int, 1, 1, 1); if (unlikely(!__pyx=
_t_2)) __PYX_ERR(14, 308, __pyx_L1_error)
++    __pyx_t_2 =3D __Pyx_GetItemInt_List(__pyx_v_self->_node_stack, __pyx_=
v_self->_index, int, 1, __Pyx_PyInt_From_int, 1, 1, 1); if (unlikely(!__pyx=
_t_2)) __PYX_ERR(14, 310, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_2);
+-    __pyx_t_4 =3D __Pyx_GetItemInt(__pyx_t_2, 0, long, 1, __Pyx_PyInt_Fro=
m_long, 0, 0, 1); if (unlikely(!__pyx_t_4)) __PYX_ERR(14, 308, __pyx_L1_err=
or)
++    __pyx_t_4 =3D __Pyx_GetItemInt(__pyx_t_2, 0, long, 1, __Pyx_PyInt_Fro=
m_long, 0, 0, 1); if (unlikely(!__pyx_t_4)) __PYX_ERR(14, 310, __pyx_L1_err=
or)
+     __Pyx_GOTREF(__pyx_t_4);
+     __Pyx_DECREF(__pyx_t_2); __pyx_t_2 =3D 0;
+-    if (!(likely(((__pyx_t_4) =3D=3D Py_None) || likely(__Pyx_TypeTest(__=
pyx_t_4, __pyx_ptype_4lxml_5etree__Element))))) __PYX_ERR(14, 308, __pyx_L1=
_error)
++    if (!(likely(((__pyx_t_4) =3D=3D Py_None) || likely(__Pyx_TypeTest(__=
pyx_t_4, __pyx_ptype_4lxml_5etree__Element))))) __PYX_ERR(14, 310, __pyx_L1=
_error)
+     __pyx_v_node =3D ((struct LxmlElement *)__pyx_t_4);
+     __pyx_t_4 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":309
++    /* "src/lxml/iterparse.pxi":311
+  *         if self._matcher is not None and self._index >=3D 0:
+  *             node =3D self._node_stack[self._index][0]
+  *             self._matcher.cacheTags(node._doc)             # <<<<<<<<<=
<<<<<
+@@ -195118,11 +195118,11 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+     __Pyx_INCREF(__pyx_t_4);
+ #pragma GCC diagnostic push
+     #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-    __pyx_t_5 =3D __pyx_f_4lxml_5etree_16_MultiTagMatcher_cacheTags(__pyx=
_v_self->_matcher, ((struct LxmlDocument *)__pyx_t_4), NULL); if (unlikely(=
__pyx_t_5 =3D=3D ((int)-1))) __PYX_ERR(14, 309, __pyx_L1_error)
++    __pyx_t_5 =3D __pyx_f_4lxml_5etree_16_MultiTagMatcher_cacheTags(__pyx=
_v_self->_matcher, ((struct LxmlDocument *)__pyx_t_4), NULL); if (unlikely(=
__pyx_t_5 =3D=3D ((int)-1))) __PYX_ERR(14, 311, __pyx_L1_error)
+     #pragma GCC diagnostic pop
+     __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":307
++    /* "src/lxml/iterparse.pxi":309
+  *         if self._events:
+  *             return self._next_event()
+  *         if self._matcher is not None and self._index >=3D 0:          =
   # <<<<<<<<<<<<<<
+@@ -195131,7 +195131,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":312
++  /* "src/lxml/iterparse.pxi":314
+  *=20
+  *         # find next node
+  *         while self._index >=3D 0:             # <<<<<<<<<<<<<<
+@@ -195142,7 +195142,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+     __pyx_t_1 =3D (__pyx_v_self->_index >=3D 0);
+     if (!__pyx_t_1) break;
+=20
+-    /* "src/lxml/iterparse.pxi":313
++    /* "src/lxml/iterparse.pxi":315
+  *         # find next node
+  *         while self._index >=3D 0:
+  *             node =3D self._node_stack[self._index][0]             # <<=
<<<<<<<<<<<<
+@@ -195151,18 +195151,18 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+  */
+     if (unlikely(__pyx_v_self->_node_stack =3D=3D Py_None)) {
+       PyErr_SetString(PyExc_TypeError, "'NoneType' object is not subscrip=
table");
+-      __PYX_ERR(14, 313, __pyx_L1_error)
++      __PYX_ERR(14, 315, __pyx_L1_error)
+     }
+-    __pyx_t_4 =3D __Pyx_GetItemInt_List(__pyx_v_self->_node_stack, __pyx_=
v_self->_index, int, 1, __Pyx_PyInt_From_int, 1, 1, 1); if (unlikely(!__pyx=
_t_4)) __PYX_ERR(14, 313, __pyx_L1_error)
++    __pyx_t_4 =3D __Pyx_GetItemInt_List(__pyx_v_self->_node_stack, __pyx_=
v_self->_index, int, 1, __Pyx_PyInt_From_int, 1, 1, 1); if (unlikely(!__pyx=
_t_4)) __PYX_ERR(14, 315, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_4);
+-    __pyx_t_2 =3D __Pyx_GetItemInt(__pyx_t_4, 0, long, 1, __Pyx_PyInt_Fro=
m_long, 0, 0, 1); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, 313, __pyx_L1_err=
or)
++    __pyx_t_2 =3D __Pyx_GetItemInt(__pyx_t_4, 0, long, 1, __Pyx_PyInt_Fro=
m_long, 0, 0, 1); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, 315, __pyx_L1_err=
or)
+     __Pyx_GOTREF(__pyx_t_2);
+     __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+-    if (!(likely(((__pyx_t_2) =3D=3D Py_None) || likely(__Pyx_TypeTest(__=
pyx_t_2, __pyx_ptype_4lxml_5etree__Element))))) __PYX_ERR(14, 313, __pyx_L1=
_error)
++    if (!(likely(((__pyx_t_2) =3D=3D Py_None) || likely(__Pyx_TypeTest(__=
pyx_t_2, __pyx_ptype_4lxml_5etree__Element))))) __PYX_ERR(14, 315, __pyx_L1=
_error)
+     __Pyx_XDECREF_SET(__pyx_v_node, ((struct LxmlElement *)__pyx_t_2));
+     __pyx_t_2 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":315
++    /* "src/lxml/iterparse.pxi":317
+  *             node =3D self._node_stack[self._index][0]
+  *=20
+  *             if self._skip_state =3D=3D IWSKIP_SKIP_NEXT:             #=
 <<<<<<<<<<<<<<
+@@ -195172,7 +195172,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+     __pyx_t_1 =3D (__pyx_v_self->_skip_state =3D=3D __pyx_e_4lxml_5etree_=
IWSKIP_SKIP_NEXT);
+     if (__pyx_t_1) {
+=20
+-      /* "src/lxml/iterparse.pxi":316
++      /* "src/lxml/iterparse.pxi":318
+  *=20
+  *             if self._skip_state =3D=3D IWSKIP_SKIP_NEXT:
+  *                 c_child =3D NULL             # <<<<<<<<<<<<<<
+@@ -195181,7 +195181,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+       __pyx_v_c_child =3D NULL;
+=20
+-      /* "src/lxml/iterparse.pxi":315
++      /* "src/lxml/iterparse.pxi":317
+  *             node =3D self._node_stack[self._index][0]
+  *=20
+  *             if self._skip_state =3D=3D IWSKIP_SKIP_NEXT:             #=
 <<<<<<<<<<<<<<
+@@ -195191,7 +195191,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+       goto __pyx_L9;
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":318
++    /* "src/lxml/iterparse.pxi":320
+  *                 c_child =3D NULL
+  *             else:
+  *                 c_child =3D self._process_non_elements(             # =
<<<<<<<<<<<<<<
+@@ -195200,7 +195200,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+     /*else*/ {
+=20
+-      /* "src/lxml/iterparse.pxi":319
++      /* "src/lxml/iterparse.pxi":321
+  *             else:
+  *                 c_child =3D self._process_non_elements(
+  *                     node._doc, _findChildForwards(node._c_node, 0))   =
          # <<<<<<<<<<<<<<
+@@ -195210,7 +195210,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+       __pyx_t_2 =3D ((PyObject *)__pyx_v_node->_doc);
+       __Pyx_INCREF(__pyx_t_2);
+=20
+-      /* "src/lxml/iterparse.pxi":318
++      /* "src/lxml/iterparse.pxi":320
+  *                 c_child =3D NULL
+  *             else:
+  *                 c_child =3D self._process_non_elements(             # =
<<<<<<<<<<<<<<
+@@ -195219,14 +195219,14 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+  */
+ #pragma GCC diagnostic push
+       #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-      __pyx_t_6 =3D __pyx_f_4lxml_5etree_8iterwalk__process_non_elements(=
__pyx_v_self, ((struct LxmlDocument *)__pyx_t_2), __pyx_f_4lxml_5etree__fin=
dChildForwards(__pyx_v_node->_c_node, 0)); if (unlikely(PyErr_Occurred())) =
__PYX_ERR(14, 318, __pyx_L1_error)
++      __pyx_t_6 =3D __pyx_f_4lxml_5etree_8iterwalk__process_non_elements(=
__pyx_v_self, ((struct LxmlDocument *)__pyx_t_2), __pyx_f_4lxml_5etree__fin=
dChildForwards(__pyx_v_node->_c_node, 0)); if (unlikely(PyErr_Occurred())) =
__PYX_ERR(14, 320, __pyx_L1_error)
+       #pragma GCC diagnostic pop
+       __Pyx_DECREF(__pyx_t_2); __pyx_t_2 =3D 0;
+       __pyx_v_c_child =3D __pyx_t_6;
+     }
+     __pyx_L9:;
+=20
+-    /* "src/lxml/iterparse.pxi":320
++    /* "src/lxml/iterparse.pxi":322
+  *                 c_child =3D self._process_non_elements(
+  *                     node._doc, _findChildForwards(node._c_node, 0))
+  *             self._skip_state =3D IWSKIP_CANNOT_SKIP             # <<<<=
<<<<<<<<<<
+@@ -195235,7 +195235,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+     __pyx_v_self->_skip_state =3D __pyx_e_4lxml_5etree_IWSKIP_CANNOT_SKIP;
+=20
+-    /* "src/lxml/iterparse.pxi":322
++    /* "src/lxml/iterparse.pxi":324
+  *             self._skip_state =3D IWSKIP_CANNOT_SKIP
+  *=20
+  *             while c_child is NULL:             # <<<<<<<<<<<<<<
+@@ -195246,7 +195246,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+       __pyx_t_1 =3D (__pyx_v_c_child =3D=3D NULL);
+       if (!__pyx_t_1) break;
+=20
+-      /* "src/lxml/iterparse.pxi":324
++      /* "src/lxml/iterparse.pxi":326
+  *             while c_child is NULL:
+  *                 # back off through parents
+  *                 self._index -=3D 1             # <<<<<<<<<<<<<<
+@@ -195255,7 +195255,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+       __pyx_v_self->_index =3D (__pyx_v_self->_index - 1);
+=20
+-      /* "src/lxml/iterparse.pxi":325
++      /* "src/lxml/iterparse.pxi":327
+  *                 # back off through parents
+  *                 self._index -=3D 1
+  *                 node =3D self._end_node()             # <<<<<<<<<<<<<<
+@@ -195264,13 +195264,13 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+  */
+ #pragma GCC diagnostic push
+       #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-      __pyx_t_2 =3D ((PyObject *)__pyx_f_4lxml_5etree_8iterwalk__end_node=
(__pyx_v_self)); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, 325, __pyx_L1_erro=
r)
++      __pyx_t_2 =3D ((PyObject *)__pyx_f_4lxml_5etree_8iterwalk__end_node=
(__pyx_v_self)); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, 327, __pyx_L1_erro=
r)
+       #pragma GCC diagnostic pop
+       __Pyx_GOTREF(__pyx_t_2);
+       __Pyx_DECREF_SET(__pyx_v_node, ((struct LxmlElement *)__pyx_t_2));
+       __pyx_t_2 =3D 0;
+=20
+-      /* "src/lxml/iterparse.pxi":326
++      /* "src/lxml/iterparse.pxi":328
+  *                 self._index -=3D 1
+  *                 node =3D self._end_node()
+  *                 if self._index < 0:             # <<<<<<<<<<<<<<
+@@ -195280,7 +195280,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+       __pyx_t_1 =3D (__pyx_v_self->_index < 0);
+       if (__pyx_t_1) {
+=20
+-        /* "src/lxml/iterparse.pxi":327
++        /* "src/lxml/iterparse.pxi":329
+  *                 node =3D self._end_node()
+  *                 if self._index < 0:
+  *                     break             # <<<<<<<<<<<<<<
+@@ -195289,7 +195289,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+         goto __pyx_L11_break;
+=20
+-        /* "src/lxml/iterparse.pxi":326
++        /* "src/lxml/iterparse.pxi":328
+  *                 self._index -=3D 1
+  *                 node =3D self._end_node()
+  *                 if self._index < 0:             # <<<<<<<<<<<<<<
+@@ -195298,7 +195298,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+       }
+=20
+-      /* "src/lxml/iterparse.pxi":329
++      /* "src/lxml/iterparse.pxi":331
+  *                     break
+  *                 c_child =3D self._process_non_elements(
+  *                     node._doc, _nextElement(node._c_node))            =
 # <<<<<<<<<<<<<<
+@@ -195308,7 +195308,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+       __pyx_t_2 =3D ((PyObject *)__pyx_v_node->_doc);
+       __Pyx_INCREF(__pyx_t_2);
+=20
+-      /* "src/lxml/iterparse.pxi":328
++      /* "src/lxml/iterparse.pxi":330
+  *                 if self._index < 0:
+  *                     break
+  *                 c_child =3D self._process_non_elements(             # =
<<<<<<<<<<<<<<
+@@ -195317,14 +195317,14 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+  */
+ #pragma GCC diagnostic push
+       #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-      __pyx_t_6 =3D __pyx_f_4lxml_5etree_8iterwalk__process_non_elements(=
__pyx_v_self, ((struct LxmlDocument *)__pyx_t_2), __pyx_f_4lxml_5etree__nex=
tElement(__pyx_v_node->_c_node)); if (unlikely(PyErr_Occurred())) __PYX_ERR=
(14, 328, __pyx_L1_error)
++      __pyx_t_6 =3D __pyx_f_4lxml_5etree_8iterwalk__process_non_elements(=
__pyx_v_self, ((struct LxmlDocument *)__pyx_t_2), __pyx_f_4lxml_5etree__nex=
tElement(__pyx_v_node->_c_node)); if (unlikely(PyErr_Occurred())) __PYX_ERR=
(14, 330, __pyx_L1_error)
+       #pragma GCC diagnostic pop
+       __Pyx_DECREF(__pyx_t_2); __pyx_t_2 =3D 0;
+       __pyx_v_c_child =3D __pyx_t_6;
+     }
+     __pyx_L11_break:;
+=20
+-    /* "src/lxml/iterparse.pxi":331
++    /* "src/lxml/iterparse.pxi":333
+  *                     node._doc, _nextElement(node._c_node))
+  *=20
+  *             if c_child is not NULL:             # <<<<<<<<<<<<<<
+@@ -195334,7 +195334,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+     __pyx_t_1 =3D (__pyx_v_c_child !=3D NULL);
+     if (__pyx_t_1) {
+=20
+-      /* "src/lxml/iterparse.pxi":332
++      /* "src/lxml/iterparse.pxi":334
+  *=20
+  *             if c_child is not NULL:
+  *                 next_node =3D _elementFactory(node._doc, c_child)     =
        # <<<<<<<<<<<<<<
+@@ -195343,13 +195343,13 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+  */
+       __pyx_t_2 =3D ((PyObject *)__pyx_v_node->_doc);
+       __Pyx_INCREF(__pyx_t_2);
+-      __pyx_t_4 =3D ((PyObject *)__pyx_f_4lxml_5etree__elementFactory(((s=
truct LxmlDocument *)__pyx_t_2), __pyx_v_c_child)); if (unlikely(!__pyx_t_4=
)) __PYX_ERR(14, 332, __pyx_L1_error)
++      __pyx_t_4 =3D ((PyObject *)__pyx_f_4lxml_5etree__elementFactory(((s=
truct LxmlDocument *)__pyx_t_2), __pyx_v_c_child)); if (unlikely(!__pyx_t_4=
)) __PYX_ERR(14, 334, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_4);
+       __Pyx_DECREF(__pyx_t_2); __pyx_t_2 =3D 0;
+       __Pyx_XDECREF_SET(__pyx_v_next_node, ((struct LxmlElement *)__pyx_t=
_4));
+       __pyx_t_4 =3D 0;
+=20
+-      /* "src/lxml/iterparse.pxi":333
++      /* "src/lxml/iterparse.pxi":335
+  *             if c_child is not NULL:
+  *                 next_node =3D _elementFactory(node._doc, c_child)
+  *                 if self._event_filter & (PARSE_EVENT_FILTER_START |   =
          # <<<<<<<<<<<<<<
+@@ -195359,7 +195359,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+       __pyx_t_1 =3D ((__pyx_v_self->_event_filter & (__pyx_e_4lxml_5etree=
_PARSE_EVENT_FILTER_START | __pyx_e_4lxml_5etree_PARSE_EVENT_FILTER_START_N=
S)) !=3D 0);
+       if (__pyx_t_1) {
+=20
+-        /* "src/lxml/iterparse.pxi":335
++        /* "src/lxml/iterparse.pxi":337
+  *                 if self._event_filter & (PARSE_EVENT_FILTER_START |
+  *                                          PARSE_EVENT_FILTER_START_NS):
+  *                     ns_count =3D self._start_node(next_node)          =
   # <<<<<<<<<<<<<<
+@@ -195368,11 +195368,11 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+  */
+ #pragma GCC diagnostic push
+         #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-        __pyx_t_5 =3D __pyx_f_4lxml_5etree_8iterwalk__start_node(__pyx_v_=
self, __pyx_v_next_node); if (unlikely(__pyx_t_5 =3D=3D ((int)-1))) __PYX_E=
RR(14, 335, __pyx_L1_error)
++        __pyx_t_5 =3D __pyx_f_4lxml_5etree_8iterwalk__start_node(__pyx_v_=
self, __pyx_v_next_node); if (unlikely(__pyx_t_5 =3D=3D ((int)-1))) __PYX_E=
RR(14, 337, __pyx_L1_error)
+         #pragma GCC diagnostic pop
+         __pyx_v_ns_count =3D __pyx_t_5;
+=20
+-        /* "src/lxml/iterparse.pxi":333
++        /* "src/lxml/iterparse.pxi":335
+  *             if c_child is not NULL:
+  *                 next_node =3D _elementFactory(node._doc, c_child)
+  *                 if self._event_filter & (PARSE_EVENT_FILTER_START |   =
          # <<<<<<<<<<<<<<
+@@ -195382,7 +195382,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+         goto __pyx_L14;
+       }
+=20
+-      /* "src/lxml/iterparse.pxi":336
++      /* "src/lxml/iterparse.pxi":338
+  *                                          PARSE_EVENT_FILTER_START_NS):
+  *                     ns_count =3D self._start_node(next_node)
+  *                 elif self._event_filter & PARSE_EVENT_FILTER_END_NS:  =
           # <<<<<<<<<<<<<<
+@@ -195392,7 +195392,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+       __pyx_t_1 =3D ((__pyx_v_self->_event_filter & __pyx_e_4lxml_5etree_=
PARSE_EVENT_FILTER_END_NS) !=3D 0);
+       if (__pyx_t_1) {
+=20
+-        /* "src/lxml/iterparse.pxi":337
++        /* "src/lxml/iterparse.pxi":339
+  *                     ns_count =3D self._start_node(next_node)
+  *                 elif self._event_filter & PARSE_EVENT_FILTER_END_NS:
+  *                     ns_count =3D _countNsDefs(next_node._c_node)      =
       # <<<<<<<<<<<<<<
+@@ -195401,7 +195401,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+         __pyx_v_ns_count =3D __pyx_f_4lxml_5etree__countNsDefs(__pyx_v_ne=
xt_node->_c_node);
+=20
+-        /* "src/lxml/iterparse.pxi":336
++        /* "src/lxml/iterparse.pxi":338
+  *                                          PARSE_EVENT_FILTER_START_NS):
+  *                     ns_count =3D self._start_node(next_node)
+  *                 elif self._event_filter & PARSE_EVENT_FILTER_END_NS:  =
           # <<<<<<<<<<<<<<
+@@ -195411,7 +195411,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+       }
+       __pyx_L14:;
+=20
+-      /* "src/lxml/iterparse.pxi":338
++      /* "src/lxml/iterparse.pxi":340
+  *                 elif self._event_filter & PARSE_EVENT_FILTER_END_NS:
+  *                     ns_count =3D _countNsDefs(next_node._c_node)
+  *                 self._node_stack.append( (next_node, ns_count) )      =
       # <<<<<<<<<<<<<<
+@@ -195420,22 +195420,22 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+  */
+       if (unlikely(__pyx_v_self->_node_stack =3D=3D Py_None)) {
+         PyErr_Format(PyExc_AttributeError, "'NoneType' object has no attr=
ibute '%.30s'", "append");
+-        __PYX_ERR(14, 338, __pyx_L1_error)
++        __PYX_ERR(14, 340, __pyx_L1_error)
+       }
+-      __pyx_t_4 =3D __Pyx_PyInt_From_int(__pyx_v_ns_count); if (unlikely(=
!__pyx_t_4)) __PYX_ERR(14, 338, __pyx_L1_error)
++      __pyx_t_4 =3D __Pyx_PyInt_From_int(__pyx_v_ns_count); if (unlikely(=
!__pyx_t_4)) __PYX_ERR(14, 340, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_4);
+-      __pyx_t_2 =3D PyTuple_New(2); if (unlikely(!__pyx_t_2)) __PYX_ERR(1=
4, 338, __pyx_L1_error)
++      __pyx_t_2 =3D PyTuple_New(2); if (unlikely(!__pyx_t_2)) __PYX_ERR(1=
4, 340, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_2);
+       __Pyx_INCREF((PyObject *)__pyx_v_next_node);
+       __Pyx_GIVEREF((PyObject *)__pyx_v_next_node);
+-      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_2, 0, ((PyObject *)__pyx_v_next_=
node))) __PYX_ERR(14, 338, __pyx_L1_error);
++      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_2, 0, ((PyObject *)__pyx_v_next_=
node))) __PYX_ERR(14, 340, __pyx_L1_error);
+       __Pyx_GIVEREF(__pyx_t_4);
+-      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_2, 1, __pyx_t_4)) __PYX_ERR(14, =
338, __pyx_L1_error);
++      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_2, 1, __pyx_t_4)) __PYX_ERR(14, =
340, __pyx_L1_error);
+       __pyx_t_4 =3D 0;
+-      __pyx_t_7 =3D __Pyx_PyList_Append(__pyx_v_self->_node_stack, __pyx_=
t_2); if (unlikely(__pyx_t_7 =3D=3D ((int)-1))) __PYX_ERR(14, 338, __pyx_L1=
_error)
++      __pyx_t_7 =3D __Pyx_PyList_Append(__pyx_v_self->_node_stack, __pyx_=
t_2); if (unlikely(__pyx_t_7 =3D=3D ((int)-1))) __PYX_ERR(14, 340, __pyx_L1=
_error)
+       __Pyx_DECREF(__pyx_t_2); __pyx_t_2 =3D 0;
+=20
+-      /* "src/lxml/iterparse.pxi":339
++      /* "src/lxml/iterparse.pxi":341
+  *                     ns_count =3D _countNsDefs(next_node._c_node)
+  *                 self._node_stack.append( (next_node, ns_count) )
+  *                 self._index +=3D 1             # <<<<<<<<<<<<<<
+@@ -195444,7 +195444,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+       __pyx_v_self->_index =3D (__pyx_v_self->_index + 1);
+=20
+-      /* "src/lxml/iterparse.pxi":331
++      /* "src/lxml/iterparse.pxi":333
+  *                     node._doc, _nextElement(node._c_node))
+  *=20
+  *             if c_child is not NULL:             # <<<<<<<<<<<<<<
+@@ -195453,7 +195453,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":340
++    /* "src/lxml/iterparse.pxi":342
+  *                 self._node_stack.append( (next_node, ns_count) )
+  *                 self._index +=3D 1
+  *             if self._events:             # <<<<<<<<<<<<<<
+@@ -195463,7 +195463,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+     __pyx_t_1 =3D (__pyx_v_self->_events !=3D Py_None)&&(PyList_GET_SIZE(=
__pyx_v_self->_events) !=3D 0);
+     if (__pyx_t_1) {
+=20
+-      /* "src/lxml/iterparse.pxi":341
++      /* "src/lxml/iterparse.pxi":343
+  *                 self._index +=3D 1
+  *             if self._events:
+  *                 return self._next_event()             # <<<<<<<<<<<<<<
+@@ -195473,14 +195473,14 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+       __Pyx_XDECREF(__pyx_r);
+ #pragma GCC diagnostic push
+       #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-      __pyx_t_2 =3D __pyx_f_4lxml_5etree_8iterwalk__next_event(__pyx_v_se=
lf); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, 341, __pyx_L1_error)
++      __pyx_t_2 =3D __pyx_f_4lxml_5etree_8iterwalk__next_event(__pyx_v_se=
lf); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, 343, __pyx_L1_error)
+       #pragma GCC diagnostic pop
+       __Pyx_GOTREF(__pyx_t_2);
+       __pyx_r =3D __pyx_t_2;
+       __pyx_t_2 =3D 0;
+       goto __pyx_L0;
+=20
+-      /* "src/lxml/iterparse.pxi":340
++      /* "src/lxml/iterparse.pxi":342
+  *                 self._node_stack.append( (next_node, ns_count) )
+  *                 self._index +=3D 1
+  *             if self._events:             # <<<<<<<<<<<<<<
+@@ -195490,7 +195490,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+     }
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":343
++  /* "src/lxml/iterparse.pxi":345
+  *                 return self._next_event()
+  *=20
+  *         if self._include_siblings is not None:             # <<<<<<<<<=
<<<<<
+@@ -195500,14 +195500,14 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+   __pyx_t_1 =3D (__pyx_v_self->_include_siblings !=3D Py_None);
+   if (__pyx_t_1) {
+=20
+-    /* "src/lxml/iterparse.pxi":344
++    /* "src/lxml/iterparse.pxi":346
+  *=20
+  *         if self._include_siblings is not None:
+  *             node, self._include_siblings =3D self._include_siblings, N=
one             # <<<<<<<<<<<<<<
+  *             self._process_non_elements(node._doc, _nextElement(node._c=
_node))
+  *             if self._events:
+  */
+-    if (!(likely(((__pyx_v_self->_include_siblings) =3D=3D Py_None) || li=
kely(__Pyx_TypeTest(__pyx_v_self->_include_siblings, __pyx_ptype_4lxml_5etr=
ee__Element))))) __PYX_ERR(14, 344, __pyx_L1_error)
++    if (!(likely(((__pyx_v_self->_include_siblings) =3D=3D Py_None) || li=
kely(__Pyx_TypeTest(__pyx_v_self->_include_siblings, __pyx_ptype_4lxml_5etr=
ee__Element))))) __PYX_ERR(14, 346, __pyx_L1_error)
+     __pyx_t_2 =3D __pyx_v_self->_include_siblings;
+     __Pyx_INCREF(__pyx_t_2);
+     __pyx_t_4 =3D Py_None;
+@@ -195520,7 +195520,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+     __pyx_v_self->_include_siblings =3D __pyx_t_4;
+     __pyx_t_4 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":345
++    /* "src/lxml/iterparse.pxi":347
+  *         if self._include_siblings is not None:
+  *             node, self._include_siblings =3D self._include_siblings, N=
one
+  *             self._process_non_elements(node._doc, _nextElement(node._c=
_node))             # <<<<<<<<<<<<<<
+@@ -195531,11 +195531,11 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+     __Pyx_INCREF(__pyx_t_4);
+ #pragma GCC diagnostic push
+     #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-    __pyx_f_4lxml_5etree_8iterwalk__process_non_elements(__pyx_v_self, ((=
struct LxmlDocument *)__pyx_t_4), __pyx_f_4lxml_5etree__nextElement(__pyx_v=
_node->_c_node)); if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 345, __pyx_=
L1_error)
++    __pyx_f_4lxml_5etree_8iterwalk__process_non_elements(__pyx_v_self, ((=
struct LxmlDocument *)__pyx_t_4), __pyx_f_4lxml_5etree__nextElement(__pyx_v=
_node->_c_node)); if (unlikely(PyErr_Occurred())) __PYX_ERR(14, 347, __pyx_=
L1_error)
+     #pragma GCC diagnostic pop
+     __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+=20
+-    /* "src/lxml/iterparse.pxi":346
++    /* "src/lxml/iterparse.pxi":348
+  *             node, self._include_siblings =3D self._include_siblings, N=
one
+  *             self._process_non_elements(node._doc, _nextElement(node._c=
_node))
+  *             if self._events:             # <<<<<<<<<<<<<<
+@@ -195545,7 +195545,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+     __pyx_t_1 =3D (__pyx_v_self->_events !=3D Py_None)&&(PyList_GET_SIZE(=
__pyx_v_self->_events) !=3D 0);
+     if (__pyx_t_1) {
+=20
+-      /* "src/lxml/iterparse.pxi":347
++      /* "src/lxml/iterparse.pxi":349
+  *             self._process_non_elements(node._doc, _nextElement(node._c=
_node))
+  *             if self._events:
+  *                 return self._next_event()             # <<<<<<<<<<<<<<
+@@ -195555,14 +195555,14 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwa=
lk_4__next__(struct __pyx_obj_4lxm
+       __Pyx_XDECREF(__pyx_r);
+ #pragma GCC diagnostic push
+       #pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
+-      __pyx_t_4 =3D __pyx_f_4lxml_5etree_8iterwalk__next_event(__pyx_v_se=
lf); if (unlikely(!__pyx_t_4)) __PYX_ERR(14, 347, __pyx_L1_error)
++      __pyx_t_4 =3D __pyx_f_4lxml_5etree_8iterwalk__next_event(__pyx_v_se=
lf); if (unlikely(!__pyx_t_4)) __PYX_ERR(14, 349, __pyx_L1_error)
+       #pragma GCC diagnostic pop
+       __Pyx_GOTREF(__pyx_t_4);
+       __pyx_r =3D __pyx_t_4;
+       __pyx_t_4 =3D 0;
+       goto __pyx_L0;
+=20
+-      /* "src/lxml/iterparse.pxi":346
++      /* "src/lxml/iterparse.pxi":348
+  *             node, self._include_siblings =3D self._include_siblings, N=
one
+  *             self._process_non_elements(node._doc, _nextElement(node._c=
_node))
+  *             if self._events:             # <<<<<<<<<<<<<<
+@@ -195571,7 +195571,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":343
++    /* "src/lxml/iterparse.pxi":345
+  *                 return self._next_event()
+  *=20
+  *         if self._include_siblings is not None:             # <<<<<<<<<=
<<<<<
+@@ -195580,7 +195580,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":349
++  /* "src/lxml/iterparse.pxi":351
+  *                 return self._next_event()
+  *=20
+  *         raise StopIteration             # <<<<<<<<<<<<<<
+@@ -195590,7 +195590,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+   __pyx_error_without_exception =3D 1;
+   goto __pyx_L1_error;;
+=20
+-  /* "src/lxml/iterparse.pxi":300
++  /* "src/lxml/iterparse.pxi":302
+  *         return self
+  *=20
+  *     def __next__(self):             # <<<<<<<<<<<<<<
+@@ -195614,7 +195614,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_4__next__(struct __pyx_obj_4lxm
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":352
++/* "src/lxml/iterparse.pxi":354
+  *=20
+  *     @cython.final
+  *     cdef xmlNode* _process_non_elements(self, _Document doc, xmlNode* =
c_node):             # <<<<<<<<<<<<<<
+@@ -195635,7 +195635,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("_process_non_elements", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":353
++  /* "src/lxml/iterparse.pxi":355
+  *     @cython.final
+  *     cdef xmlNode* _process_non_elements(self, _Document doc, xmlNode* =
c_node):
+  *         while c_node is not NULL and c_node.type !=3D tree.XML_ELEMENT=
_NODE:             # <<<<<<<<<<<<<<
+@@ -195654,7 +195654,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+     __pyx_L5_bool_binop_done:;
+     if (!__pyx_t_1) break;
+=20
+-    /* "src/lxml/iterparse.pxi":354
++    /* "src/lxml/iterparse.pxi":356
+  *     cdef xmlNode* _process_non_elements(self, _Document doc, xmlNode* =
c_node):
+  *         while c_node is not NULL and c_node.type !=3D tree.XML_ELEMENT=
_NODE:
+  *             if c_node.type =3D=3D tree.XML_COMMENT_NODE:             #=
 <<<<<<<<<<<<<<
+@@ -195664,7 +195664,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+     switch (__pyx_v_c_node->type) {
+       case XML_COMMENT_NODE:
+=20
+-      /* "src/lxml/iterparse.pxi":355
++      /* "src/lxml/iterparse.pxi":357
+  *         while c_node is not NULL and c_node.type !=3D tree.XML_ELEMENT=
_NODE:
+  *             if c_node.type =3D=3D tree.XML_COMMENT_NODE:
+  *                 if self._event_filter & PARSE_EVENT_FILTER_COMMENT:   =
          # <<<<<<<<<<<<<<
+@@ -195674,7 +195674,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+       __pyx_t_1 =3D ((__pyx_v_self->_event_filter & __pyx_e_4lxml_5etree_=
PARSE_EVENT_FILTER_COMMENT) !=3D 0);
+       if (__pyx_t_1) {
+=20
+-        /* "src/lxml/iterparse.pxi":356
++        /* "src/lxml/iterparse.pxi":358
+  *             if c_node.type =3D=3D tree.XML_COMMENT_NODE:
+  *                 if self._event_filter & PARSE_EVENT_FILTER_COMMENT:
+  *                     self._events.append(             # <<<<<<<<<<<<<<
+@@ -195683,38 +195683,38 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk=
__process_non_elements(struct __py
+  */
+         if (unlikely(__pyx_v_self->_events =3D=3D Py_None)) {
+           PyErr_Format(PyExc_AttributeError, "'NoneType' object has no at=
tribute '%.30s'", "append");
+-          __PYX_ERR(14, 356, __pyx_L1_error)
++          __PYX_ERR(14, 358, __pyx_L1_error)
+         }
+=20
+-        /* "src/lxml/iterparse.pxi":357
++        /* "src/lxml/iterparse.pxi":359
+  *                 if self._event_filter & PARSE_EVENT_FILTER_COMMENT:
+  *                     self._events.append(
+  *                         (u"comment", _elementFactory(doc, c_node)))   =
          # <<<<<<<<<<<<<<
+  *                 c_node =3D _nextElement(c_node)
+  *             elif c_node.type =3D=3D tree.XML_PI_NODE:
+  */
+-        __pyx_t_3 =3D ((PyObject *)__pyx_f_4lxml_5etree__elementFactory(_=
_pyx_v_doc, __pyx_v_c_node)); if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 357, =
__pyx_L1_error)
++        __pyx_t_3 =3D ((PyObject *)__pyx_f_4lxml_5etree__elementFactory(_=
_pyx_v_doc, __pyx_v_c_node)); if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 359, =
__pyx_L1_error)
+         __Pyx_GOTREF(__pyx_t_3);
+-        __pyx_t_4 =3D PyTuple_New(2); if (unlikely(!__pyx_t_4)) __PYX_ERR=
(14, 357, __pyx_L1_error)
++        __pyx_t_4 =3D PyTuple_New(2); if (unlikely(!__pyx_t_4)) __PYX_ERR=
(14, 359, __pyx_L1_error)
+         __Pyx_GOTREF(__pyx_t_4);
+         __Pyx_INCREF(__pyx_n_u_comment);
+         __Pyx_GIVEREF(__pyx_n_u_comment);
+-        if (__Pyx_PyTuple_SET_ITEM(__pyx_t_4, 0, __pyx_n_u_comment)) __PY=
X_ERR(14, 357, __pyx_L1_error);
++        if (__Pyx_PyTuple_SET_ITEM(__pyx_t_4, 0, __pyx_n_u_comment)) __PY=
X_ERR(14, 359, __pyx_L1_error);
+         __Pyx_GIVEREF(__pyx_t_3);
+-        if (__Pyx_PyTuple_SET_ITEM(__pyx_t_4, 1, __pyx_t_3)) __PYX_ERR(14=
, 357, __pyx_L1_error);
++        if (__Pyx_PyTuple_SET_ITEM(__pyx_t_4, 1, __pyx_t_3)) __PYX_ERR(14=
, 359, __pyx_L1_error);
+         __pyx_t_3 =3D 0;
+=20
+-        /* "src/lxml/iterparse.pxi":356
++        /* "src/lxml/iterparse.pxi":358
+  *             if c_node.type =3D=3D tree.XML_COMMENT_NODE:
+  *                 if self._event_filter & PARSE_EVENT_FILTER_COMMENT:
+  *                     self._events.append(             # <<<<<<<<<<<<<<
+  *                         (u"comment", _elementFactory(doc, c_node)))
+  *                 c_node =3D _nextElement(c_node)
+  */
+-        __pyx_t_5 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __pyx_t_=
4); if (unlikely(__pyx_t_5 =3D=3D ((int)-1))) __PYX_ERR(14, 356, __pyx_L1_e=
rror)
++        __pyx_t_5 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __pyx_t_=
4); if (unlikely(__pyx_t_5 =3D=3D ((int)-1))) __PYX_ERR(14, 358, __pyx_L1_e=
rror)
+         __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+=20
+-        /* "src/lxml/iterparse.pxi":355
++        /* "src/lxml/iterparse.pxi":357
+  *         while c_node is not NULL and c_node.type !=3D tree.XML_ELEMENT=
_NODE:
+  *             if c_node.type =3D=3D tree.XML_COMMENT_NODE:
+  *                 if self._event_filter & PARSE_EVENT_FILTER_COMMENT:   =
          # <<<<<<<<<<<<<<
+@@ -195723,7 +195723,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+  */
+       }
+=20
+-      /* "src/lxml/iterparse.pxi":358
++      /* "src/lxml/iterparse.pxi":360
+  *                     self._events.append(
+  *                         (u"comment", _elementFactory(doc, c_node)))
+  *                 c_node =3D _nextElement(c_node)             # <<<<<<<<=
<<<<<<
+@@ -195732,7 +195732,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+  */
+       __pyx_v_c_node =3D __pyx_f_4lxml_5etree__nextElement(__pyx_v_c_node=
);
+=20
+-      /* "src/lxml/iterparse.pxi":354
++      /* "src/lxml/iterparse.pxi":356
+  *     cdef xmlNode* _process_non_elements(self, _Document doc, xmlNode* =
c_node):
+  *         while c_node is not NULL and c_node.type !=3D tree.XML_ELEMENT=
_NODE:
+  *             if c_node.type =3D=3D tree.XML_COMMENT_NODE:             #=
 <<<<<<<<<<<<<<
+@@ -195742,7 +195742,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+       break;
+       case XML_PI_NODE:
+=20
+-      /* "src/lxml/iterparse.pxi":360
++      /* "src/lxml/iterparse.pxi":362
+  *                 c_node =3D _nextElement(c_node)
+  *             elif c_node.type =3D=3D tree.XML_PI_NODE:
+  *                 if self._event_filter & PARSE_EVENT_FILTER_PI:        =
     # <<<<<<<<<<<<<<
+@@ -195752,7 +195752,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+       __pyx_t_1 =3D ((__pyx_v_self->_event_filter & __pyx_e_4lxml_5etree_=
PARSE_EVENT_FILTER_PI) !=3D 0);
+       if (__pyx_t_1) {
+=20
+-        /* "src/lxml/iterparse.pxi":361
++        /* "src/lxml/iterparse.pxi":363
+  *             elif c_node.type =3D=3D tree.XML_PI_NODE:
+  *                 if self._event_filter & PARSE_EVENT_FILTER_PI:
+  *                     self._events.append(             # <<<<<<<<<<<<<<
+@@ -195761,38 +195761,38 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk=
__process_non_elements(struct __py
+  */
+         if (unlikely(__pyx_v_self->_events =3D=3D Py_None)) {
+           PyErr_Format(PyExc_AttributeError, "'NoneType' object has no at=
tribute '%.30s'", "append");
+-          __PYX_ERR(14, 361, __pyx_L1_error)
++          __PYX_ERR(14, 363, __pyx_L1_error)
+         }
+=20
+-        /* "src/lxml/iterparse.pxi":362
++        /* "src/lxml/iterparse.pxi":364
+  *                 if self._event_filter & PARSE_EVENT_FILTER_PI:
+  *                     self._events.append(
+  *                         (u"pi", _elementFactory(doc, c_node)))        =
     # <<<<<<<<<<<<<<
+  *                 c_node =3D _nextElement(c_node)
+  *             else:
+  */
+-        __pyx_t_4 =3D ((PyObject *)__pyx_f_4lxml_5etree__elementFactory(_=
_pyx_v_doc, __pyx_v_c_node)); if (unlikely(!__pyx_t_4)) __PYX_ERR(14, 362, =
__pyx_L1_error)
++        __pyx_t_4 =3D ((PyObject *)__pyx_f_4lxml_5etree__elementFactory(_=
_pyx_v_doc, __pyx_v_c_node)); if (unlikely(!__pyx_t_4)) __PYX_ERR(14, 364, =
__pyx_L1_error)
+         __Pyx_GOTREF(__pyx_t_4);
+-        __pyx_t_3 =3D PyTuple_New(2); if (unlikely(!__pyx_t_3)) __PYX_ERR=
(14, 362, __pyx_L1_error)
++        __pyx_t_3 =3D PyTuple_New(2); if (unlikely(!__pyx_t_3)) __PYX_ERR=
(14, 364, __pyx_L1_error)
+         __Pyx_GOTREF(__pyx_t_3);
+         __Pyx_INCREF(__pyx_n_u_pi);
+         __Pyx_GIVEREF(__pyx_n_u_pi);
+-        if (__Pyx_PyTuple_SET_ITEM(__pyx_t_3, 0, __pyx_n_u_pi)) __PYX_ERR=
(14, 362, __pyx_L1_error);
++        if (__Pyx_PyTuple_SET_ITEM(__pyx_t_3, 0, __pyx_n_u_pi)) __PYX_ERR=
(14, 364, __pyx_L1_error);
+         __Pyx_GIVEREF(__pyx_t_4);
+-        if (__Pyx_PyTuple_SET_ITEM(__pyx_t_3, 1, __pyx_t_4)) __PYX_ERR(14=
, 362, __pyx_L1_error);
++        if (__Pyx_PyTuple_SET_ITEM(__pyx_t_3, 1, __pyx_t_4)) __PYX_ERR(14=
, 364, __pyx_L1_error);
+         __pyx_t_4 =3D 0;
+=20
+-        /* "src/lxml/iterparse.pxi":361
++        /* "src/lxml/iterparse.pxi":363
+  *             elif c_node.type =3D=3D tree.XML_PI_NODE:
+  *                 if self._event_filter & PARSE_EVENT_FILTER_PI:
+  *                     self._events.append(             # <<<<<<<<<<<<<<
+  *                         (u"pi", _elementFactory(doc, c_node)))
+  *                 c_node =3D _nextElement(c_node)
+  */
+-        __pyx_t_5 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __pyx_t_=
3); if (unlikely(__pyx_t_5 =3D=3D ((int)-1))) __PYX_ERR(14, 361, __pyx_L1_e=
rror)
++        __pyx_t_5 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __pyx_t_=
3); if (unlikely(__pyx_t_5 =3D=3D ((int)-1))) __PYX_ERR(14, 363, __pyx_L1_e=
rror)
+         __Pyx_DECREF(__pyx_t_3); __pyx_t_3 =3D 0;
+=20
+-        /* "src/lxml/iterparse.pxi":360
++        /* "src/lxml/iterparse.pxi":362
+  *                 c_node =3D _nextElement(c_node)
+  *             elif c_node.type =3D=3D tree.XML_PI_NODE:
+  *                 if self._event_filter & PARSE_EVENT_FILTER_PI:        =
     # <<<<<<<<<<<<<<
+@@ -195801,7 +195801,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+  */
+       }
+=20
+-      /* "src/lxml/iterparse.pxi":363
++      /* "src/lxml/iterparse.pxi":365
+  *                     self._events.append(
+  *                         (u"pi", _elementFactory(doc, c_node)))
+  *                 c_node =3D _nextElement(c_node)             # <<<<<<<<=
<<<<<<
+@@ -195810,7 +195810,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+  */
+       __pyx_v_c_node =3D __pyx_f_4lxml_5etree__nextElement(__pyx_v_c_node=
);
+=20
+-      /* "src/lxml/iterparse.pxi":359
++      /* "src/lxml/iterparse.pxi":361
+  *                         (u"comment", _elementFactory(doc, c_node)))
+  *                 c_node =3D _nextElement(c_node)
+  *             elif c_node.type =3D=3D tree.XML_PI_NODE:             # <<=
<<<<<<<<<<<<
+@@ -195820,7 +195820,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+       break;
+       default:
+=20
+-      /* "src/lxml/iterparse.pxi":365
++      /* "src/lxml/iterparse.pxi":367
+  *                 c_node =3D _nextElement(c_node)
+  *             else:
+  *                 break             # <<<<<<<<<<<<<<
+@@ -195833,7 +195833,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+   }
+   __pyx_L4_break:;
+=20
+-  /* "src/lxml/iterparse.pxi":366
++  /* "src/lxml/iterparse.pxi":368
+  *             else:
+  *                 break
+  *         return c_node             # <<<<<<<<<<<<<<
+@@ -195843,7 +195843,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+   __pyx_r =3D __pyx_v_c_node;
+   goto __pyx_L0;
+=20
+-  /* "src/lxml/iterparse.pxi":352
++  /* "src/lxml/iterparse.pxi":354
+  *=20
+  *     @cython.final
+  *     cdef xmlNode* _process_non_elements(self, _Document doc, xmlNode* =
c_node):             # <<<<<<<<<<<<<<
+@@ -195862,7 +195862,7 @@ static xmlNode *__pyx_f_4lxml_5etree_8iterwalk__=
process_non_elements(struct __py
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":369
++/* "src/lxml/iterparse.pxi":371
+  *=20
+  *     @cython.final
+  *     cdef _next_event(self):             # <<<<<<<<<<<<<<
+@@ -195884,7 +195884,7 @@ static PyObject *__pyx_f_4lxml_5etree_8iterwalk_=
_next_event(struct __pyx_obj_4lx
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("_next_event", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":370
++  /* "src/lxml/iterparse.pxi":372
+  *     @cython.final
+  *     cdef _next_event(self):
+  *         if self._skip_state =3D=3D IWSKIP_NEXT_IS_START:             #=
 <<<<<<<<<<<<<<
+@@ -195894,7 +195894,7 @@ static PyObject *__pyx_f_4lxml_5etree_8iterwalk_=
_next_event(struct __pyx_obj_4lx
+   __pyx_t_1 =3D (__pyx_v_self->_skip_state =3D=3D __pyx_e_4lxml_5etree_IW=
SKIP_NEXT_IS_START);
+   if (__pyx_t_1) {
+=20
+-    /* "src/lxml/iterparse.pxi":371
++    /* "src/lxml/iterparse.pxi":373
+  *     cdef _next_event(self):
+  *         if self._skip_state =3D=3D IWSKIP_NEXT_IS_START:
+  *             if self._events[0][0] in (u'start', u'start-ns'):         =
    # <<<<<<<<<<<<<<
+@@ -195903,27 +195903,27 @@ static PyObject *__pyx_f_4lxml_5etree_8iterwal=
k__next_event(struct __pyx_obj_4lx
+  */
+     if (unlikely(__pyx_v_self->_events =3D=3D Py_None)) {
+       PyErr_SetString(PyExc_TypeError, "'NoneType' object is not subscrip=
table");
+-      __PYX_ERR(14, 371, __pyx_L1_error)
++      __PYX_ERR(14, 373, __pyx_L1_error)
+     }
+-    __pyx_t_2 =3D __Pyx_GetItemInt_List(__pyx_v_self->_events, 0, long, 1=
, __Pyx_PyInt_From_long, 1, 0, 1); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, =
371, __pyx_L1_error)
++    __pyx_t_2 =3D __Pyx_GetItemInt_List(__pyx_v_self->_events, 0, long, 1=
, __Pyx_PyInt_From_long, 1, 0, 1); if (unlikely(!__pyx_t_2)) __PYX_ERR(14, =
373, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_2);
+-    __pyx_t_3 =3D __Pyx_GetItemInt(__pyx_t_2, 0, long, 1, __Pyx_PyInt_Fro=
m_long, 0, 0, 1); if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 371, __pyx_L1_err=
or)
++    __pyx_t_3 =3D __Pyx_GetItemInt(__pyx_t_2, 0, long, 1, __Pyx_PyInt_Fro=
m_long, 0, 0, 1); if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 373, __pyx_L1_err=
or)
+     __Pyx_GOTREF(__pyx_t_3);
+     __Pyx_DECREF(__pyx_t_2); __pyx_t_2 =3D 0;
+-    __pyx_t_4 =3D (__Pyx_PyUnicode_Equals(__pyx_t_3, __pyx_n_u_start, Py_=
EQ)); if (unlikely((__pyx_t_4 < 0))) __PYX_ERR(14, 371, __pyx_L1_error)
++    __pyx_t_4 =3D (__Pyx_PyUnicode_Equals(__pyx_t_3, __pyx_n_u_start, Py_=
EQ)); if (unlikely((__pyx_t_4 < 0))) __PYX_ERR(14, 373, __pyx_L1_error)
+     if (!__pyx_t_4) {
+     } else {
+       __pyx_t_1 =3D __pyx_t_4;
+       goto __pyx_L5_bool_binop_done;
+     }
+-    __pyx_t_4 =3D (__Pyx_PyUnicode_Equals(__pyx_t_3, __pyx_kp_u_start_ns,=
 Py_EQ)); if (unlikely((__pyx_t_4 < 0))) __PYX_ERR(14, 371, __pyx_L1_error)
++    __pyx_t_4 =3D (__Pyx_PyUnicode_Equals(__pyx_t_3, __pyx_kp_u_start_ns,=
 Py_EQ)); if (unlikely((__pyx_t_4 < 0))) __PYX_ERR(14, 373, __pyx_L1_error)
+     __pyx_t_1 =3D __pyx_t_4;
+     __pyx_L5_bool_binop_done:;
+     __Pyx_DECREF(__pyx_t_3); __pyx_t_3 =3D 0;
+     __pyx_t_4 =3D __pyx_t_1;
+     if (__pyx_t_4) {
+=20
+-      /* "src/lxml/iterparse.pxi":372
++      /* "src/lxml/iterparse.pxi":374
+  *         if self._skip_state =3D=3D IWSKIP_NEXT_IS_START:
+  *             if self._events[0][0] in (u'start', u'start-ns'):
+  *                 self._skip_state =3D IWSKIP_CAN_SKIP             # <<<=
<<<<<<<<<<<
+@@ -195932,7 +195932,7 @@ static PyObject *__pyx_f_4lxml_5etree_8iterwalk_=
_next_event(struct __pyx_obj_4lx
+  */
+       __pyx_v_self->_skip_state =3D __pyx_e_4lxml_5etree_IWSKIP_CAN_SKIP;
+=20
+-      /* "src/lxml/iterparse.pxi":371
++      /* "src/lxml/iterparse.pxi":373
+  *     cdef _next_event(self):
+  *         if self._skip_state =3D=3D IWSKIP_NEXT_IS_START:
+  *             if self._events[0][0] in (u'start', u'start-ns'):         =
    # <<<<<<<<<<<<<<
+@@ -195941,7 +195941,7 @@ static PyObject *__pyx_f_4lxml_5etree_8iterwalk_=
_next_event(struct __pyx_obj_4lx
+  */
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":370
++    /* "src/lxml/iterparse.pxi":372
+  *     @cython.final
+  *     cdef _next_event(self):
+  *         if self._skip_state =3D=3D IWSKIP_NEXT_IS_START:             #=
 <<<<<<<<<<<<<<
+@@ -195950,7 +195950,7 @@ static PyObject *__pyx_f_4lxml_5etree_8iterwalk_=
_next_event(struct __pyx_obj_4lx
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":373
++  /* "src/lxml/iterparse.pxi":375
+  *             if self._events[0][0] in (u'start', u'start-ns'):
+  *                 self._skip_state =3D IWSKIP_CAN_SKIP
+  *         return self._pop_event(0)             # <<<<<<<<<<<<<<
+@@ -195977,7 +195977,7 @@ static PyObject *__pyx_f_4lxml_5etree_8iterwalk_=
_next_event(struct __pyx_obj_4lx
+     PyObject *__pyx_callargs[2] =3D {__pyx_t_5, __pyx_int_0};
+     __pyx_t_3 =3D __Pyx_PyObject_FastCall(__pyx_t_2, __pyx_callargs+1-__p=
yx_t_6, 1+__pyx_t_6);
+     __Pyx_XDECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+-    if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 373, __pyx_L1_error)
++    if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 375, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_3);
+     __Pyx_DECREF(__pyx_t_2); __pyx_t_2 =3D 0;
+   }
+@@ -195985,7 +195985,7 @@ static PyObject *__pyx_f_4lxml_5etree_8iterwalk_=
_next_event(struct __pyx_obj_4lx
+   __pyx_t_3 =3D 0;
+   goto __pyx_L0;
+=20
+-  /* "src/lxml/iterparse.pxi":369
++  /* "src/lxml/iterparse.pxi":371
+  *=20
+  *     @cython.final
+  *     cdef _next_event(self):             # <<<<<<<<<<<<<<
+@@ -196006,7 +196006,7 @@ static PyObject *__pyx_f_4lxml_5etree_8iterwalk_=
_next_event(struct __pyx_obj_4lx
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":375
++/* "src/lxml/iterparse.pxi":377
+  *         return self._pop_event(0)
+  *=20
+  *     def skip_subtree(self):             # <<<<<<<<<<<<<<
+@@ -196062,7 +196062,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_6skip_subtree(struct __pyx_obj_
+   int __pyx_t_1;
+   __Pyx_RefNannySetupContext("skip_subtree", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":382
++  /* "src/lxml/iterparse.pxi":384
+  *         This has no effect right after an 'end' or 'end-ns' event.
+  *         """
+  *         if self._skip_state =3D=3D IWSKIP_CAN_SKIP:             # <<<<=
<<<<<<<<<<
+@@ -196072,7 +196072,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_6skip_subtree(struct __pyx_obj_
+   __pyx_t_1 =3D (__pyx_v_self->_skip_state =3D=3D __pyx_e_4lxml_5etree_IW=
SKIP_CAN_SKIP);
+   if (__pyx_t_1) {
+=20
+-    /* "src/lxml/iterparse.pxi":383
++    /* "src/lxml/iterparse.pxi":385
+  *         """
+  *         if self._skip_state =3D=3D IWSKIP_CAN_SKIP:
+  *             self._skip_state =3D IWSKIP_SKIP_NEXT             # <<<<<<=
<<<<<<<<
+@@ -196081,7 +196081,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_6skip_subtree(struct __pyx_obj_
+  */
+     __pyx_v_self->_skip_state =3D __pyx_e_4lxml_5etree_IWSKIP_SKIP_NEXT;
+=20
+-    /* "src/lxml/iterparse.pxi":382
++    /* "src/lxml/iterparse.pxi":384
+  *         This has no effect right after an 'end' or 'end-ns' event.
+  *         """
+  *         if self._skip_state =3D=3D IWSKIP_CAN_SKIP:             # <<<<=
<<<<<<<<<<
+@@ -196090,7 +196090,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_6skip_subtree(struct __pyx_obj_
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":375
++  /* "src/lxml/iterparse.pxi":377
+  *         return self._pop_event(0)
+  *=20
+  *     def skip_subtree(self):             # <<<<<<<<<<<<<<
+@@ -196105,7 +196105,7 @@ static PyObject *__pyx_pf_4lxml_5etree_8iterwalk=
_6skip_subtree(struct __pyx_obj_
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":386
++/* "src/lxml/iterparse.pxi":388
+  *=20
+  *     @cython.final
+  *     cdef int _start_node(self, _Element node) except -1:             #=
 <<<<<<<<<<<<<<
+@@ -196127,7 +196127,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("_start_node", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":388
++  /* "src/lxml/iterparse.pxi":390
+  *     cdef int _start_node(self, _Element node) except -1:
+  *         cdef int ns_count
+  *         if self._event_filter & PARSE_EVENT_FILTER_START_NS:          =
   # <<<<<<<<<<<<<<
+@@ -196137,7 +196137,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+   __pyx_t_1 =3D ((__pyx_v_self->_event_filter & __pyx_e_4lxml_5etree_PARS=
E_EVENT_FILTER_START_NS) !=3D 0);
+   if (__pyx_t_1) {
+=20
+-    /* "src/lxml/iterparse.pxi":389
++    /* "src/lxml/iterparse.pxi":391
+  *         cdef int ns_count
+  *         if self._event_filter & PARSE_EVENT_FILTER_START_NS:
+  *             ns_count =3D _appendStartNsEvents(node._c_node, self._even=
ts)             # <<<<<<<<<<<<<<
+@@ -196146,11 +196146,11 @@ static int __pyx_f_4lxml_5etree_8iterwalk__sta=
rt_node(struct __pyx_obj_4lxml_5et
+  */
+     __pyx_t_2 =3D __pyx_v_self->_events;
+     __Pyx_INCREF(__pyx_t_2);
+-    __pyx_t_3 =3D __pyx_f_4lxml_5etree__appendStartNsEvents(__pyx_v_node-=
>_c_node, ((PyObject*)__pyx_t_2)); if (unlikely(__pyx_t_3 =3D=3D ((int)-1))=
) __PYX_ERR(14, 389, __pyx_L1_error)
++    __pyx_t_3 =3D __pyx_f_4lxml_5etree__appendStartNsEvents(__pyx_v_node-=
>_c_node, ((PyObject*)__pyx_t_2)); if (unlikely(__pyx_t_3 =3D=3D ((int)-1))=
) __PYX_ERR(14, 391, __pyx_L1_error)
+     __Pyx_DECREF(__pyx_t_2); __pyx_t_2 =3D 0;
+     __pyx_v_ns_count =3D __pyx_t_3;
+=20
+-    /* "src/lxml/iterparse.pxi":390
++    /* "src/lxml/iterparse.pxi":392
+  *         if self._event_filter & PARSE_EVENT_FILTER_START_NS:
+  *             ns_count =3D _appendStartNsEvents(node._c_node, self._even=
ts)
+  *             if self._events:             # <<<<<<<<<<<<<<
+@@ -196160,7 +196160,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+     __pyx_t_1 =3D (__pyx_v_self->_events !=3D Py_None)&&(PyList_GET_SIZE(=
__pyx_v_self->_events) !=3D 0);
+     if (__pyx_t_1) {
+=20
+-      /* "src/lxml/iterparse.pxi":391
++      /* "src/lxml/iterparse.pxi":393
+  *             ns_count =3D _appendStartNsEvents(node._c_node, self._even=
ts)
+  *             if self._events:
+  *                 self._skip_state =3D IWSKIP_NEXT_IS_START             =
# <<<<<<<<<<<<<<
+@@ -196169,7 +196169,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+  */
+       __pyx_v_self->_skip_state =3D __pyx_e_4lxml_5etree_IWSKIP_NEXT_IS_S=
TART;
+=20
+-      /* "src/lxml/iterparse.pxi":390
++      /* "src/lxml/iterparse.pxi":392
+  *         if self._event_filter & PARSE_EVENT_FILTER_START_NS:
+  *             ns_count =3D _appendStartNsEvents(node._c_node, self._even=
ts)
+  *             if self._events:             # <<<<<<<<<<<<<<
+@@ -196178,7 +196178,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+  */
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":388
++    /* "src/lxml/iterparse.pxi":390
+  *     cdef int _start_node(self, _Element node) except -1:
+  *         cdef int ns_count
+  *         if self._event_filter & PARSE_EVENT_FILTER_START_NS:          =
   # <<<<<<<<<<<<<<
+@@ -196188,7 +196188,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+     goto __pyx_L3;
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":392
++  /* "src/lxml/iterparse.pxi":394
+  *             if self._events:
+  *                 self._skip_state =3D IWSKIP_NEXT_IS_START
+  *         elif self._event_filter & PARSE_EVENT_FILTER_END_NS:          =
   # <<<<<<<<<<<<<<
+@@ -196198,7 +196198,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+   __pyx_t_1 =3D ((__pyx_v_self->_event_filter & __pyx_e_4lxml_5etree_PARS=
E_EVENT_FILTER_END_NS) !=3D 0);
+   if (__pyx_t_1) {
+=20
+-    /* "src/lxml/iterparse.pxi":393
++    /* "src/lxml/iterparse.pxi":395
+  *                 self._skip_state =3D IWSKIP_NEXT_IS_START
+  *         elif self._event_filter & PARSE_EVENT_FILTER_END_NS:
+  *             ns_count =3D _countNsDefs(node._c_node)             # <<<<=
<<<<<<<<<<
+@@ -196207,7 +196207,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+  */
+     __pyx_v_ns_count =3D __pyx_f_4lxml_5etree__countNsDefs(__pyx_v_node->=
_c_node);
+=20
+-    /* "src/lxml/iterparse.pxi":392
++    /* "src/lxml/iterparse.pxi":394
+  *             if self._events:
+  *                 self._skip_state =3D IWSKIP_NEXT_IS_START
+  *         elif self._event_filter & PARSE_EVENT_FILTER_END_NS:          =
   # <<<<<<<<<<<<<<
+@@ -196217,7 +196217,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+     goto __pyx_L3;
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":395
++  /* "src/lxml/iterparse.pxi":397
+  *             ns_count =3D _countNsDefs(node._c_node)
+  *         else:
+  *             ns_count =3D 0             # <<<<<<<<<<<<<<
+@@ -196229,7 +196229,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+   }
+   __pyx_L3:;
+=20
+-  /* "src/lxml/iterparse.pxi":396
++  /* "src/lxml/iterparse.pxi":398
+  *         else:
+  *             ns_count =3D 0
+  *         if self._event_filter & PARSE_EVENT_FILTER_START:             =
# <<<<<<<<<<<<<<
+@@ -196239,7 +196239,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+   __pyx_t_1 =3D ((__pyx_v_self->_event_filter & __pyx_e_4lxml_5etree_PARS=
E_EVENT_FILTER_START) !=3D 0);
+   if (__pyx_t_1) {
+=20
+-    /* "src/lxml/iterparse.pxi":397
++    /* "src/lxml/iterparse.pxi":399
+  *             ns_count =3D 0
+  *         if self._event_filter & PARSE_EVENT_FILTER_START:
+  *             if self._matcher is None or self._matcher.matches(node._c_=
node):             # <<<<<<<<<<<<<<
+@@ -196257,7 +196257,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+     __pyx_L7_bool_binop_done:;
+     if (__pyx_t_1) {
+=20
+-      /* "src/lxml/iterparse.pxi":398
++      /* "src/lxml/iterparse.pxi":400
+  *         if self._event_filter & PARSE_EVENT_FILTER_START:
+  *             if self._matcher is None or self._matcher.matches(node._c_=
node):
+  *                 self._events.append( (u"start", node) )             # =
<<<<<<<<<<<<<<
+@@ -196266,20 +196266,20 @@ static int __pyx_f_4lxml_5etree_8iterwalk__sta=
rt_node(struct __pyx_obj_4lxml_5et
+  */
+       if (unlikely(__pyx_v_self->_events =3D=3D Py_None)) {
+         PyErr_Format(PyExc_AttributeError, "'NoneType' object has no attr=
ibute '%.30s'", "append");
+-        __PYX_ERR(14, 398, __pyx_L1_error)
++        __PYX_ERR(14, 400, __pyx_L1_error)
+       }
+-      __pyx_t_2 =3D PyTuple_New(2); if (unlikely(!__pyx_t_2)) __PYX_ERR(1=
4, 398, __pyx_L1_error)
++      __pyx_t_2 =3D PyTuple_New(2); if (unlikely(!__pyx_t_2)) __PYX_ERR(1=
4, 400, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_2);
+       __Pyx_INCREF(__pyx_n_u_start);
+       __Pyx_GIVEREF(__pyx_n_u_start);
+-      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_2, 0, __pyx_n_u_start)) __PYX_ER=
R(14, 398, __pyx_L1_error);
++      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_2, 0, __pyx_n_u_start)) __PYX_ER=
R(14, 400, __pyx_L1_error);
+       __Pyx_INCREF((PyObject *)__pyx_v_node);
+       __Pyx_GIVEREF((PyObject *)__pyx_v_node);
+-      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_2, 1, ((PyObject *)__pyx_v_node)=
)) __PYX_ERR(14, 398, __pyx_L1_error);
+-      __pyx_t_5 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __pyx_t_2)=
; if (unlikely(__pyx_t_5 =3D=3D ((int)-1))) __PYX_ERR(14, 398, __pyx_L1_err=
or)
++      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_2, 1, ((PyObject *)__pyx_v_node)=
)) __PYX_ERR(14, 400, __pyx_L1_error);
++      __pyx_t_5 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __pyx_t_2)=
; if (unlikely(__pyx_t_5 =3D=3D ((int)-1))) __PYX_ERR(14, 400, __pyx_L1_err=
or)
+       __Pyx_DECREF(__pyx_t_2); __pyx_t_2 =3D 0;
+=20
+-      /* "src/lxml/iterparse.pxi":399
++      /* "src/lxml/iterparse.pxi":401
+  *             if self._matcher is None or self._matcher.matches(node._c_=
node):
+  *                 self._events.append( (u"start", node) )
+  *                 self._skip_state =3D IWSKIP_NEXT_IS_START             =
# <<<<<<<<<<<<<<
+@@ -196288,7 +196288,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+  */
+       __pyx_v_self->_skip_state =3D __pyx_e_4lxml_5etree_IWSKIP_NEXT_IS_S=
TART;
+=20
+-      /* "src/lxml/iterparse.pxi":397
++      /* "src/lxml/iterparse.pxi":399
+  *             ns_count =3D 0
+  *         if self._event_filter & PARSE_EVENT_FILTER_START:
+  *             if self._matcher is None or self._matcher.matches(node._c_=
node):             # <<<<<<<<<<<<<<
+@@ -196297,7 +196297,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+  */
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":396
++    /* "src/lxml/iterparse.pxi":398
+  *         else:
+  *             ns_count =3D 0
+  *         if self._event_filter & PARSE_EVENT_FILTER_START:             =
# <<<<<<<<<<<<<<
+@@ -196306,7 +196306,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":400
++  /* "src/lxml/iterparse.pxi":402
+  *                 self._events.append( (u"start", node) )
+  *                 self._skip_state =3D IWSKIP_NEXT_IS_START
+  *         return ns_count             # <<<<<<<<<<<<<<
+@@ -196316,7 +196316,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+   __pyx_r =3D __pyx_v_ns_count;
+   goto __pyx_L0;
+=20
+-  /* "src/lxml/iterparse.pxi":386
++  /* "src/lxml/iterparse.pxi":388
+  *=20
+  *     @cython.final
+  *     cdef int _start_node(self, _Element node) except -1:             #=
 <<<<<<<<<<<<<<
+@@ -196334,7 +196334,7 @@ static int __pyx_f_4lxml_5etree_8iterwalk__start=
_node(struct __pyx_obj_4lxml_5et
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":403
++/* "src/lxml/iterparse.pxi":405
+  *=20
+  *     @cython.final
+  *     cdef _Element _end_node(self):             # <<<<<<<<<<<<<<
+@@ -196365,7 +196365,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("_end_node", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":406
++  /* "src/lxml/iterparse.pxi":408
+  *         cdef _Element node
+  *         cdef int i, ns_count
+  *         node, ns_count =3D self._node_stack.pop()             # <<<<<<=
<<<<<<<<
+@@ -196374,9 +196374,9 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+  */
+   if (unlikely(__pyx_v_self->_node_stack =3D=3D Py_None)) {
+     PyErr_Format(PyExc_AttributeError, "'NoneType' object has no attribut=
e '%.30s'", "pop");
+-    __PYX_ERR(14, 406, __pyx_L1_error)
++    __PYX_ERR(14, 408, __pyx_L1_error)
+   }
+-  __pyx_t_1 =3D __Pyx_PyList_Pop(__pyx_v_self->_node_stack); if (unlikely=
(!__pyx_t_1)) __PYX_ERR(14, 406, __pyx_L1_error)
++  __pyx_t_1 =3D __Pyx_PyList_Pop(__pyx_v_self->_node_stack); if (unlikely=
(!__pyx_t_1)) __PYX_ERR(14, 408, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_1);
+   if ((likely(PyTuple_CheckExact(__pyx_t_1))) || (PyList_CheckExact(__pyx=
_t_1))) {
+     PyObject* sequence =3D __pyx_t_1;
+@@ -196384,7 +196384,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+     if (unlikely(size !=3D 2)) {
+       if (size > 2) __Pyx_RaiseTooManyValuesError(2);
+       else if (size >=3D 0) __Pyx_RaiseNeedMoreValuesError(size);
+-      __PYX_ERR(14, 406, __pyx_L1_error)
++      __PYX_ERR(14, 408, __pyx_L1_error)
+     }
+     #if CYTHON_ASSUME_SAFE_MACROS && !CYTHON_AVOID_BORROWED_REFS
+     if (likely(PyTuple_CheckExact(sequence))) {
+@@ -196397,15 +196397,15 @@ static struct LxmlElement *__pyx_f_4lxml_5etre=
e_8iterwalk__end_node(struct __pyx
+     __Pyx_INCREF(__pyx_t_2);
+     __Pyx_INCREF(__pyx_t_3);
+     #else
+-    __pyx_t_2 =3D PySequence_ITEM(sequence, 0); if (unlikely(!__pyx_t_2))=
 __PYX_ERR(14, 406, __pyx_L1_error)
++    __pyx_t_2 =3D PySequence_ITEM(sequence, 0); if (unlikely(!__pyx_t_2))=
 __PYX_ERR(14, 408, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_2);
+-    __pyx_t_3 =3D PySequence_ITEM(sequence, 1); if (unlikely(!__pyx_t_3))=
 __PYX_ERR(14, 406, __pyx_L1_error)
++    __pyx_t_3 =3D PySequence_ITEM(sequence, 1); if (unlikely(!__pyx_t_3))=
 __PYX_ERR(14, 408, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_3);
+     #endif
+     __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+   } else {
+     Py_ssize_t index =3D -1;
+-    __pyx_t_4 =3D PyObject_GetIter(__pyx_t_1); if (unlikely(!__pyx_t_4)) =
__PYX_ERR(14, 406, __pyx_L1_error)
++    __pyx_t_4 =3D PyObject_GetIter(__pyx_t_1); if (unlikely(!__pyx_t_4)) =
__PYX_ERR(14, 408, __pyx_L1_error)
+     __Pyx_GOTREF(__pyx_t_4);
+     __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+     __pyx_t_5 =3D __Pyx_PyObject_GetIterNextFunc(__pyx_t_4);
+@@ -196413,7 +196413,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+     __Pyx_GOTREF(__pyx_t_2);
+     index =3D 1; __pyx_t_3 =3D __pyx_t_5(__pyx_t_4); if (unlikely(!__pyx_=
t_3)) goto __pyx_L3_unpacking_failed;
+     __Pyx_GOTREF(__pyx_t_3);
+-    if (__Pyx_IternextUnpackEndCheck(__pyx_t_5(__pyx_t_4), 2) < 0) __PYX_=
ERR(14, 406, __pyx_L1_error)
++    if (__Pyx_IternextUnpackEndCheck(__pyx_t_5(__pyx_t_4), 2) < 0) __PYX_=
ERR(14, 408, __pyx_L1_error)
+     __pyx_t_5 =3D NULL;
+     __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+     goto __pyx_L4_unpacking_done;
+@@ -196421,17 +196421,17 @@ static struct LxmlElement *__pyx_f_4lxml_5etre=
e_8iterwalk__end_node(struct __pyx
+     __Pyx_DECREF(__pyx_t_4); __pyx_t_4 =3D 0;
+     __pyx_t_5 =3D NULL;
+     if (__Pyx_IterFinish() =3D=3D 0) __Pyx_RaiseNeedMoreValuesError(index=
);
+-    __PYX_ERR(14, 406, __pyx_L1_error)
++    __PYX_ERR(14, 408, __pyx_L1_error)
+     __pyx_L4_unpacking_done:;
+   }
+-  if (!(likely(((__pyx_t_2) =3D=3D Py_None) || likely(__Pyx_TypeTest(__py=
x_t_2, __pyx_ptype_4lxml_5etree__Element))))) __PYX_ERR(14, 406, __pyx_L1_e=
rror)
+-  __pyx_t_6 =3D __Pyx_PyInt_As_int(__pyx_t_3); if (unlikely((__pyx_t_6 =
=3D=3D (int)-1) && PyErr_Occurred())) __PYX_ERR(14, 406, __pyx_L1_error)
++  if (!(likely(((__pyx_t_2) =3D=3D Py_None) || likely(__Pyx_TypeTest(__py=
x_t_2, __pyx_ptype_4lxml_5etree__Element))))) __PYX_ERR(14, 408, __pyx_L1_e=
rror)
++  __pyx_t_6 =3D __Pyx_PyInt_As_int(__pyx_t_3); if (unlikely((__pyx_t_6 =
=3D=3D (int)-1) && PyErr_Occurred())) __PYX_ERR(14, 408, __pyx_L1_error)
+   __Pyx_DECREF(__pyx_t_3); __pyx_t_3 =3D 0;
+   __pyx_v_node =3D ((struct LxmlElement *)__pyx_t_2);
+   __pyx_t_2 =3D 0;
+   __pyx_v_ns_count =3D __pyx_t_6;
+=20
+-  /* "src/lxml/iterparse.pxi":407
++  /* "src/lxml/iterparse.pxi":409
+  *         cdef int i, ns_count
+  *         node, ns_count =3D self._node_stack.pop()
+  *         if self._event_filter & PARSE_EVENT_FILTER_END:             # =
<<<<<<<<<<<<<<
+@@ -196441,7 +196441,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+   __pyx_t_7 =3D ((__pyx_v_self->_event_filter & __pyx_e_4lxml_5etree_PARS=
E_EVENT_FILTER_END) !=3D 0);
+   if (__pyx_t_7) {
+=20
+-    /* "src/lxml/iterparse.pxi":408
++    /* "src/lxml/iterparse.pxi":410
+  *         node, ns_count =3D self._node_stack.pop()
+  *         if self._event_filter & PARSE_EVENT_FILTER_END:
+  *             if self._matcher is None or self._matcher.matches(node._c_=
node):             # <<<<<<<<<<<<<<
+@@ -196459,7 +196459,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+     __pyx_L7_bool_binop_done:;
+     if (__pyx_t_7) {
+=20
+-      /* "src/lxml/iterparse.pxi":409
++      /* "src/lxml/iterparse.pxi":411
+  *         if self._event_filter & PARSE_EVENT_FILTER_END:
+  *             if self._matcher is None or self._matcher.matches(node._c_=
node):
+  *                 self._events.append( (u"end", node) )             # <<=
<<<<<<<<<<<<
+@@ -196468,20 +196468,20 @@ static struct LxmlElement *__pyx_f_4lxml_5etre=
e_8iterwalk__end_node(struct __pyx
+  */
+       if (unlikely(__pyx_v_self->_events =3D=3D Py_None)) {
+         PyErr_Format(PyExc_AttributeError, "'NoneType' object has no attr=
ibute '%.30s'", "append");
+-        __PYX_ERR(14, 409, __pyx_L1_error)
++        __PYX_ERR(14, 411, __pyx_L1_error)
+       }
+-      __pyx_t_1 =3D PyTuple_New(2); if (unlikely(!__pyx_t_1)) __PYX_ERR(1=
4, 409, __pyx_L1_error)
++      __pyx_t_1 =3D PyTuple_New(2); if (unlikely(!__pyx_t_1)) __PYX_ERR(1=
4, 411, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_1);
+       __Pyx_INCREF(__pyx_n_u_end);
+       __Pyx_GIVEREF(__pyx_n_u_end);
+-      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_1, 0, __pyx_n_u_end)) __PYX_ERR(=
14, 409, __pyx_L1_error);
++      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_1, 0, __pyx_n_u_end)) __PYX_ERR(=
14, 411, __pyx_L1_error);
+       __Pyx_INCREF((PyObject *)__pyx_v_node);
+       __Pyx_GIVEREF((PyObject *)__pyx_v_node);
+-      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_1, 1, ((PyObject *)__pyx_v_node)=
)) __PYX_ERR(14, 409, __pyx_L1_error);
+-      __pyx_t_9 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __pyx_t_1)=
; if (unlikely(__pyx_t_9 =3D=3D ((int)-1))) __PYX_ERR(14, 409, __pyx_L1_err=
or)
++      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_1, 1, ((PyObject *)__pyx_v_node)=
)) __PYX_ERR(14, 411, __pyx_L1_error);
++      __pyx_t_9 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __pyx_t_1)=
; if (unlikely(__pyx_t_9 =3D=3D ((int)-1))) __PYX_ERR(14, 411, __pyx_L1_err=
or)
+       __Pyx_DECREF(__pyx_t_1); __pyx_t_1 =3D 0;
+=20
+-      /* "src/lxml/iterparse.pxi":408
++      /* "src/lxml/iterparse.pxi":410
+  *         node, ns_count =3D self._node_stack.pop()
+  *         if self._event_filter & PARSE_EVENT_FILTER_END:
+  *             if self._matcher is None or self._matcher.matches(node._c_=
node):             # <<<<<<<<<<<<<<
+@@ -196490,7 +196490,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+  */
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":407
++    /* "src/lxml/iterparse.pxi":409
+  *         cdef int i, ns_count
+  *         node, ns_count =3D self._node_stack.pop()
+  *         if self._event_filter & PARSE_EVENT_FILTER_END:             # =
<<<<<<<<<<<<<<
+@@ -196499,7 +196499,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":410
++  /* "src/lxml/iterparse.pxi":412
+  *             if self._matcher is None or self._matcher.matches(node._c_=
node):
+  *                 self._events.append( (u"end", node) )
+  *         if self._event_filter & PARSE_EVENT_FILTER_END_NS and ns_count=
:             # <<<<<<<<<<<<<<
+@@ -196517,7 +196517,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+   __pyx_L10_bool_binop_done:;
+   if (__pyx_t_7) {
+=20
+-    /* "src/lxml/iterparse.pxi":411
++    /* "src/lxml/iterparse.pxi":413
+  *                 self._events.append( (u"end", node) )
+  *         if self._event_filter & PARSE_EVENT_FILTER_END_NS and ns_count:
+  *             event =3D (u"end-ns", None)             # <<<<<<<<<<<<<<
+@@ -196527,7 +196527,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+     __Pyx_INCREF(__pyx_tuple__93);
+     __pyx_v_event =3D __pyx_tuple__93;
+=20
+-    /* "src/lxml/iterparse.pxi":412
++    /* "src/lxml/iterparse.pxi":414
+  *         if self._event_filter & PARSE_EVENT_FILTER_END_NS and ns_count:
+  *             event =3D (u"end-ns", None)
+  *             for i in range(ns_count):             # <<<<<<<<<<<<<<
+@@ -196539,7 +196539,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+     for (__pyx_t_11 =3D 0; __pyx_t_11 < __pyx_t_10; __pyx_t_11+=3D1) {
+       __pyx_v_i =3D __pyx_t_11;
+=20
+-      /* "src/lxml/iterparse.pxi":413
++      /* "src/lxml/iterparse.pxi":415
+  *             event =3D (u"end-ns", None)
+  *             for i in range(ns_count):
+  *                 self._events.append(event)             # <<<<<<<<<<<<<<
+@@ -196548,12 +196548,12 @@ static struct LxmlElement *__pyx_f_4lxml_5etre=
e_8iterwalk__end_node(struct __pyx
+  */
+       if (unlikely(__pyx_v_self->_events =3D=3D Py_None)) {
+         PyErr_Format(PyExc_AttributeError, "'NoneType' object has no attr=
ibute '%.30s'", "append");
+-        __PYX_ERR(14, 413, __pyx_L1_error)
++        __PYX_ERR(14, 415, __pyx_L1_error)
+       }
+-      __pyx_t_9 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __pyx_v_ev=
ent); if (unlikely(__pyx_t_9 =3D=3D ((int)-1))) __PYX_ERR(14, 413, __pyx_L1=
_error)
++      __pyx_t_9 =3D __Pyx_PyList_Append(__pyx_v_self->_events, __pyx_v_ev=
ent); if (unlikely(__pyx_t_9 =3D=3D ((int)-1))) __PYX_ERR(14, 415, __pyx_L1=
_error)
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":410
++    /* "src/lxml/iterparse.pxi":412
+  *             if self._matcher is None or self._matcher.matches(node._c_=
node):
+  *                 self._events.append( (u"end", node) )
+  *         if self._event_filter & PARSE_EVENT_FILTER_END_NS and ns_count=
:             # <<<<<<<<<<<<<<
+@@ -196562,7 +196562,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+  */
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":414
++  /* "src/lxml/iterparse.pxi":416
+  *             for i in range(ns_count):
+  *                 self._events.append(event)
+  *         return node             # <<<<<<<<<<<<<<
+@@ -196574,7 +196574,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+   __pyx_r =3D __pyx_v_node;
+   goto __pyx_L0;
+=20
+-  /* "src/lxml/iterparse.pxi":403
++  /* "src/lxml/iterparse.pxi":405
+  *=20
+  *     @cython.final
+  *     cdef _Element _end_node(self):             # <<<<<<<<<<<<<<
+@@ -196598,7 +196598,7 @@ static struct LxmlElement *__pyx_f_4lxml_5etree_=
8iterwalk__end_node(struct __pyx
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":417
++/* "src/lxml/iterparse.pxi":419
+  *=20
+  *=20
+  * cdef int _countNsDefs(xmlNode* c_node) noexcept:             # <<<<<<<=
<<<<<<<
+@@ -196613,7 +196613,7 @@ static int __pyx_f_4lxml_5etree__countNsDefs(xml=
Node *__pyx_v_c_node) {
+   xmlNs *__pyx_t_1;
+   int __pyx_t_2;
+=20
+-  /* "src/lxml/iterparse.pxi":420
++  /* "src/lxml/iterparse.pxi":422
+  *     cdef xmlNs* c_ns
+  *     cdef int count
+  *     count =3D 0             # <<<<<<<<<<<<<<
+@@ -196622,7 +196622,7 @@ static int __pyx_f_4lxml_5etree__countNsDefs(xml=
Node *__pyx_v_c_node) {
+  */
+   __pyx_v_count =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":421
++  /* "src/lxml/iterparse.pxi":423
+  *     cdef int count
+  *     count =3D 0
+  *     c_ns =3D c_node.nsDef             # <<<<<<<<<<<<<<
+@@ -196632,7 +196632,7 @@ static int __pyx_f_4lxml_5etree__countNsDefs(xml=
Node *__pyx_v_c_node) {
+   __pyx_t_1 =3D __pyx_v_c_node->nsDef;
+   __pyx_v_c_ns =3D __pyx_t_1;
+=20
+-  /* "src/lxml/iterparse.pxi":422
++  /* "src/lxml/iterparse.pxi":424
+  *     count =3D 0
+  *     c_ns =3D c_node.nsDef
+  *     while c_ns is not NULL:             # <<<<<<<<<<<<<<
+@@ -196643,7 +196643,7 @@ static int __pyx_f_4lxml_5etree__countNsDefs(xml=
Node *__pyx_v_c_node) {
+     __pyx_t_2 =3D (__pyx_v_c_ns !=3D NULL);
+     if (!__pyx_t_2) break;
+=20
+-    /* "src/lxml/iterparse.pxi":423
++    /* "src/lxml/iterparse.pxi":425
+  *     c_ns =3D c_node.nsDef
+  *     while c_ns is not NULL:
+  *         count +=3D (c_ns.href is not NULL)             # <<<<<<<<<<<<<<
+@@ -196652,7 +196652,7 @@ static int __pyx_f_4lxml_5etree__countNsDefs(xml=
Node *__pyx_v_c_node) {
+  */
+     __pyx_v_count =3D (__pyx_v_count + (__pyx_v_c_ns->href !=3D NULL));
+=20
+-    /* "src/lxml/iterparse.pxi":424
++    /* "src/lxml/iterparse.pxi":426
+  *     while c_ns is not NULL:
+  *         count +=3D (c_ns.href is not NULL)
+  *         c_ns =3D c_ns.next             # <<<<<<<<<<<<<<
+@@ -196663,7 +196663,7 @@ static int __pyx_f_4lxml_5etree__countNsDefs(xml=
Node *__pyx_v_c_node) {
+     __pyx_v_c_ns =3D __pyx_t_1;
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":425
++  /* "src/lxml/iterparse.pxi":427
+  *         count +=3D (c_ns.href is not NULL)
+  *         c_ns =3D c_ns.next
+  *     return count             # <<<<<<<<<<<<<<
+@@ -196673,7 +196673,7 @@ static int __pyx_f_4lxml_5etree__countNsDefs(xml=
Node *__pyx_v_c_node) {
+   __pyx_r =3D __pyx_v_count;
+   goto __pyx_L0;
+=20
+-  /* "src/lxml/iterparse.pxi":417
++  /* "src/lxml/iterparse.pxi":419
+  *=20
+  *=20
+  * cdef int _countNsDefs(xmlNode* c_node) noexcept:             # <<<<<<<=
<<<<<<<
+@@ -196686,7 +196686,7 @@ static int __pyx_f_4lxml_5etree__countNsDefs(xml=
Node *__pyx_v_c_node) {
+   return __pyx_r;
+ }
+=20
+-/* "src/lxml/iterparse.pxi":428
++/* "src/lxml/iterparse.pxi":430
+  *=20
+  *=20
+  * cdef int _appendStartNsEvents(xmlNode* c_node, list event_list) except=
 -1:             # <<<<<<<<<<<<<<
+@@ -196711,7 +196711,7 @@ static int __pyx_f_4lxml_5etree__appendStartNsEv=
ents(xmlNode *__pyx_v_c_node, Py
+   int __pyx_clineno =3D 0;
+   __Pyx_RefNannySetupContext("_appendStartNsEvents", 1);
+=20
+-  /* "src/lxml/iterparse.pxi":431
++  /* "src/lxml/iterparse.pxi":433
+  *     cdef xmlNs* c_ns
+  *     cdef int count
+  *     count =3D 0             # <<<<<<<<<<<<<<
+@@ -196720,7 +196720,7 @@ static int __pyx_f_4lxml_5etree__appendStartNsEv=
ents(xmlNode *__pyx_v_c_node, Py
+  */
+   __pyx_v_count =3D 0;
+=20
+-  /* "src/lxml/iterparse.pxi":432
++  /* "src/lxml/iterparse.pxi":434
+  *     cdef int count
+  *     count =3D 0
+  *     c_ns =3D c_node.nsDef             # <<<<<<<<<<<<<<
+@@ -196730,7 +196730,7 @@ static int __pyx_f_4lxml_5etree__appendStartNsEv=
ents(xmlNode *__pyx_v_c_node, Py
+   __pyx_t_1 =3D __pyx_v_c_node->nsDef;
+   __pyx_v_c_ns =3D __pyx_t_1;
+=20
+-  /* "src/lxml/iterparse.pxi":433
++  /* "src/lxml/iterparse.pxi":435
+  *     count =3D 0
+  *     c_ns =3D c_node.nsDef
+  *     while c_ns is not NULL:             # <<<<<<<<<<<<<<
+@@ -196741,7 +196741,7 @@ static int __pyx_f_4lxml_5etree__appendStartNsEv=
ents(xmlNode *__pyx_v_c_node, Py
+     __pyx_t_2 =3D (__pyx_v_c_ns !=3D NULL);
+     if (!__pyx_t_2) break;
+=20
+-    /* "src/lxml/iterparse.pxi":434
++    /* "src/lxml/iterparse.pxi":436
+  *     c_ns =3D c_node.nsDef
+  *     while c_ns is not NULL:
+  *         if c_ns.href:             # <<<<<<<<<<<<<<
+@@ -196751,45 +196751,45 @@ static int __pyx_f_4lxml_5etree__appendStartNs=
Events(xmlNode *__pyx_v_c_node, Py
+     __pyx_t_2 =3D (__pyx_v_c_ns->href !=3D 0);
+     if (__pyx_t_2) {
+=20
+-      /* "src/lxml/iterparse.pxi":435
++      /* "src/lxml/iterparse.pxi":437
+  *     while c_ns is not NULL:
+  *         if c_ns.href:
+  *             ns_tuple =3D (funicodeOrEmpty(c_ns.prefix),             # =
<<<<<<<<<<<<<<
+  *                         funicode(c_ns.href))
+  *             event_list.append( (u"start-ns", ns_tuple) )
+  */
+-      __pyx_t_3 =3D __pyx_f_4lxml_5etree_funicodeOrEmpty(__pyx_v_c_ns->pr=
efix); if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 435, __pyx_L1_error)
++      __pyx_t_3 =3D __pyx_f_4lxml_5etree_funicodeOrEmpty(__pyx_v_c_ns->pr=
efix); if (unlikely(!__pyx_t_3)) __PYX_ERR(14, 437, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_3);
+=20
+-      /* "src/lxml/iterparse.pxi":436
++      /* "src/lxml/iterparse.pxi":438
+  *         if c_ns.href:
+  *             ns_tuple =3D (funicodeOrEmpty(c_ns.prefix),
+  *                         funicode(c_ns.href))             # <<<<<<<<<<<=
<<<
+  *             event_list.append( (u"start-ns", ns_tuple) )
+  *             count +=3D 1
+  */
+-      __pyx_t_4 =3D __pyx_f_4lxml_5etree_funicode(__pyx_v_c_ns->href); if=
 (unlikely(!__pyx_t_4)) __PYX_ERR(14, 436, __pyx_L1_error)
++      __pyx_t_4 =3D __pyx_f_4lxml_5etree_funicode(__pyx_v_c_ns->href); if=
 (unlikely(!__pyx_t_4)) __PYX_ERR(14, 438, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_4);
+=20
+-      /* "src/lxml/iterparse.pxi":435
++      /* "src/lxml/iterparse.pxi":437
+  *     while c_ns is not NULL:
+  *         if c_ns.href:
+  *             ns_tuple =3D (funicodeOrEmpty(c_ns.prefix),             # =
<<<<<<<<<<<<<<
+  *                         funicode(c_ns.href))
+  *             event_list.append( (u"start-ns", ns_tuple) )
+  */
+-      __pyx_t_5 =3D PyTuple_New(2); if (unlikely(!__pyx_t_5)) __PYX_ERR(1=
4, 435, __pyx_L1_error)
++      __pyx_t_5 =3D PyTuple_New(2); if (unlikely(!__pyx_t_5)) __PYX_ERR(1=
4, 437, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_5);
+       __Pyx_GIVEREF(__pyx_t_3);
+-      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 0, __pyx_t_3)) __PYX_ERR(14, =
435, __pyx_L1_error);
++      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 0, __pyx_t_3)) __PYX_ERR(14, =
437, __pyx_L1_error);
+       __Pyx_GIVEREF(__pyx_t_4);
+-      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 1, __pyx_t_4)) __PYX_ERR(14, =
435, __pyx_L1_error);
++      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 1, __pyx_t_4)) __PYX_ERR(14, =
437, __pyx_L1_error);
+       __pyx_t_3 =3D 0;
+       __pyx_t_4 =3D 0;
+       __Pyx_XDECREF_SET(__pyx_v_ns_tuple, ((PyObject*)__pyx_t_5));
+       __pyx_t_5 =3D 0;
+=20
+-      /* "src/lxml/iterparse.pxi":437
++      /* "src/lxml/iterparse.pxi":439
+  *             ns_tuple =3D (funicodeOrEmpty(c_ns.prefix),
+  *                         funicode(c_ns.href))
+  *             event_list.append( (u"start-ns", ns_tuple) )             #=
 <<<<<<<<<<<<<<
+@@ -196798,20 +196798,20 @@ static int __pyx_f_4lxml_5etree__appendStartNs=
Events(xmlNode *__pyx_v_c_node, Py
+  */
+       if (unlikely(__pyx_v_event_list =3D=3D Py_None)) {
+         PyErr_Format(PyExc_AttributeError, "'NoneType' object has no attr=
ibute '%.30s'", "append");
+-        __PYX_ERR(14, 437, __pyx_L1_error)
++        __PYX_ERR(14, 439, __pyx_L1_error)
+       }
+-      __pyx_t_5 =3D PyTuple_New(2); if (unlikely(!__pyx_t_5)) __PYX_ERR(1=
4, 437, __pyx_L1_error)
++      __pyx_t_5 =3D PyTuple_New(2); if (unlikely(!__pyx_t_5)) __PYX_ERR(1=
4, 439, __pyx_L1_error)
+       __Pyx_GOTREF(__pyx_t_5);
+       __Pyx_INCREF(__pyx_kp_u_start_ns);
+       __Pyx_GIVEREF(__pyx_kp_u_start_ns);
+-      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 0, __pyx_kp_u_start_ns)) __PY=
X_ERR(14, 437, __pyx_L1_error);
++      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 0, __pyx_kp_u_start_ns)) __PY=
X_ERR(14, 439, __pyx_L1_error);
+       __Pyx_INCREF(__pyx_v_ns_tuple);
+       __Pyx_GIVEREF(__pyx_v_ns_tuple);
+-      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 1, __pyx_v_ns_tuple)) __PYX_E=
RR(14, 437, __pyx_L1_error);
+-      __pyx_t_6 =3D __Pyx_PyList_Append(__pyx_v_event_list, __pyx_t_5); i=
f (unlikely(__pyx_t_6 =3D=3D ((int)-1))) __PYX_ERR(14, 437, __pyx_L1_error)
++      if (__Pyx_PyTuple_SET_ITEM(__pyx_t_5, 1, __pyx_v_ns_tuple)) __PYX_E=
RR(14, 439, __pyx_L1_error);
++      __pyx_t_6 =3D __Pyx_PyList_Append(__pyx_v_event_list, __pyx_t_5); i=
f (unlikely(__pyx_t_6 =3D=3D ((int)-1))) __PYX_ERR(14, 439, __pyx_L1_error)
+       __Pyx_DECREF(__pyx_t_5); __pyx_t_5 =3D 0;
+=20
+-      /* "src/lxml/iterparse.pxi":438
++      /* "src/lxml/iterparse.pxi":440
+  *                         funicode(c_ns.href))
+  *             event_list.append( (u"start-ns", ns_tuple) )
+  *             count +=3D 1             # <<<<<<<<<<<<<<
+@@ -196820,7 +196820,7 @@ static int __pyx_f_4lxml_5etree__appendStartNsEv=
ents(xmlNode *__pyx_v_c_node, Py
+  */
+       __pyx_v_count =3D (__pyx_v_count + 1);
+=20
+-      /* "src/lxml/iterparse.pxi":434
++      /* "src/lxml/iterparse.pxi":436
+  *     c_ns =3D c_node.nsDef
+  *     while c_ns is not NULL:
+  *         if c_ns.href:             # <<<<<<<<<<<<<<
+@@ -196829,7 +196829,7 @@ static int __pyx_f_4lxml_5etree__appendStartNsEv=
ents(xmlNode *__pyx_v_c_node, Py
+  */
+     }
+=20
+-    /* "src/lxml/iterparse.pxi":439
++    /* "src/lxml/iterparse.pxi":441
+  *             event_list.append( (u"start-ns", ns_tuple) )
+  *             count +=3D 1
+  *         c_ns =3D c_ns.next             # <<<<<<<<<<<<<<
+@@ -196839,7 +196839,7 @@ static int __pyx_f_4lxml_5etree__appendStartNsEv=
ents(xmlNode *__pyx_v_c_node, Py
+     __pyx_v_c_ns =3D __pyx_t_1;
+   }
+=20
+-  /* "src/lxml/iterparse.pxi":440
++  /* "src/lxml/iterparse.pxi":442
+  *             count +=3D 1
+  *         c_ns =3D c_ns.next
+  *     return count             # <<<<<<<<<<<<<<
+@@ -196847,7 +196847,7 @@ static int __pyx_f_4lxml_5etree__appendStartNsEv=
ents(xmlNode *__pyx_v_c_node, Py
+   __pyx_r =3D __pyx_v_count;
+   goto __pyx_L0;
+=20
+-  /* "src/lxml/iterparse.pxi":428
++  /* "src/lxml/iterparse.pxi":430
+  *=20
+  *=20
+  * cdef int _appendStartNsEvents(xmlNode* c_node, list event_list) except=
 -1:             # <<<<<<<<<<<<<<
+@@ -263534,7 +263534,7 @@ static PyMethodDef __pyx_methods_4lxml_5etree_XM=
LParser[] =3D {
+ };
+ #if CYTHON_USE_TYPE_SPECS
+ static PyType_Slot __pyx_type_4lxml_5etree_XMLParser_slots[] =3D {
+-  {Py_tp_doc, (void *)PyDoc_STR("XMLParser(self, encoding=3DNone, attribu=
te_defaults=3DFalse, dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue, ns_clean=3DFalse, recover=3DFalse, schema: XMLSchema =3DNone, huge=
_tree=3DFalse, remove_blank_text=3DFalse, resolve_entities=3DTrue, remove_c=
omments=3DFalse, remove_pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue=
, target=3DNone, compact=3DTrue)\n\n    The XML parser.\n\n    Parsers can =
be supplied as additional argument to various parse\n    functions of the l=
xml API.  A default parser is always available\n    and can be replaced by =
a call to the global function\n    'set_default_parser'.  New parsers can b=
e created at any time\n    without a major run-time overhead.\n\n    The ke=
yword arguments in the constructor are mainly based on the\n    libxml2 par=
ser configuration.  A DTD will also be loaded if DTD\n    validation or att=
ribute default values are requested (unless you\n    additionally provide a=
n XMLSchema from which the default\n    attributes can be read).\n\n    Ava=
ilable boolean keyword arguments:\n\n    - attribute_defaults - inject defa=
ult attributes from DTD or XMLSchema\n    - dtd_validation     - validate a=
gainst a DTD referenced by the document\n    - load_dtd           - use DTD=
 for parsing\n    - no_network         - prevent network access for related=
 files (default: True)\n    - ns_clean           - clean up redundant names=
pace declarations\n    - recover            - try hard to parse through bro=
ken XML\n    - remove_blank_text  - discard blank text nodes that appear ig=
norable\n    - remove_comments    - discard comments\n    - remove_pis     =
    - discard processing instructions\n    - strip_cdata        - replace C=
DATA sections by normal text content (default: True)\n    - compact        =
    - save memory for short text content (default: True)\n    - collect_ids=
        - use a hash table of XML IDs for fast access (default: True, alway=
s True with DTD validation)\n    - huge_tree          - disable security re=
strictions and support very deep trees\n      ""                     and ve=
ry long text content (only affects libxml2 2.7+)\n\n    Other keyword argum=
ents:\n\n    - resolve_entities - replace entities by their text value: Fal=
se for keeping the\n          entity references, True for resolving them, a=
nd 'internal' for resolving\n          internal definitions only (no extern=
al file/URL access).\n          The default used to be True and was changed=
 to 'internal' in lxml 5.0.\n    - encoding - override the document encodin=
g (note: libiconv encoding name)\n    - target   - a parser target object t=
hat will receive the parse events\n    - schema   - an XMLSchema to validat=
e against\n\n    Note that you should avoid sharing parsers between threads=
.  While this is\n    not harmful, it is more efficient to use separate par=
sers.  This does not\n    apply to the default parser.\n    ")},
++  {Py_tp_doc, (void *)PyDoc_STR("XMLParser(self, encoding=3DNone, attribu=
te_defaults=3DFalse, dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue, ns_clean=3DFalse, recover=3DFalse, schema: XMLSchema =3DNone, huge=
_tree=3DFalse, remove_blank_text=3DFalse, resolve_entities=3D'internal', re=
move_comments=3DFalse, remove_pis=3DFalse, strip_cdata=3DTrue, collect_ids=
=3DTrue, target=3DNone, compact=3DTrue)\n\n    The XML parser.\n\n    Parse=
rs can be supplied as additional argument to various parse\n    functions o=
f the lxml API.  A default parser is always available\n    and can be repla=
ced by a call to the global function\n    'set_default_parser'.  New parser=
s can be created at any time\n    without a major run-time overhead.\n\n   =
 The keyword arguments in the constructor are mainly based on the\n    libx=
ml2 parser configuration.  A DTD will also be loaded if DTD\n    validation=
 or attribute default values are requested (unless you\n    additionally pr=
ovide an XMLSchema from which the default\n    attributes can be read).\n\n=
    Available boolean keyword arguments:\n\n    - attribute_defaults - inje=
ct default attributes from DTD or XMLSchema\n    - dtd_validation     - val=
idate against a DTD referenced by the document\n    - load_dtd           - =
use DTD for parsing\n    - no_network         - prevent network access for =
related files (default: True)\n    - ns_clean           - clean up redundan=
t namespace declarations\n    - recover            - try hard to parse thro=
ugh broken XML\n    - remove_blank_text  - discard blank text nodes that ap=
pear ignorable\n    - remove_comments    - discard comments\n    - remove_p=
is         - discard processing instructions\n    - strip_cdata        - re=
place CDATA sections by normal text content (default: True)\n    - compact =
           - save memory for short text content (default: True)\n    - coll=
ect_ids        - use a hash table of XML IDs for fast access (default: True=
, always True with DTD validation)\n    - huge_tree          - disable secu=
rity restrictions and support very deep trees""\n                          =
 and very long text content (only affects libxml2 2.7+)\n\n    Other keywor=
d arguments:\n\n    - resolve_entities - replace entities by their text val=
ue: False for keeping the\n          entity references, True for resolving =
them, and 'internal' for resolving\n          internal definitions only (no=
 external file/URL access).\n          The default used to be True and was =
changed to 'internal' in lxml 5.0.\n    - encoding - override the document =
encoding (note: libiconv encoding name)\n    - target   - a parser target o=
bject that will receive the parse events\n    - schema   - an XMLSchema to =
validate against\n\n    Note that you should avoid sharing parsers between =
threads.  While this is\n    not harmful, it is more efficient to use separ=
ate parsers.  This does not\n    apply to the default parser.\n    ")},
+   {Py_tp_traverse, (void *)__pyx_tp_traverse_4lxml_5etree__BaseParser},
+   {Py_tp_clear, (void *)__pyx_tp_clear_4lxml_5etree__BaseParser},
+   {Py_tp_methods, (void *)__pyx_methods_4lxml_5etree_XMLParser},
+@@ -263582,7 +263582,7 @@ static PyTypeObject __pyx_type_4lxml_5etree_XMLP=
arser =3D {
+   0, /*tp_setattro*/
+   0, /*tp_as_buffer*/
+   Py_TPFLAGS_DEFAULT|Py_TPFLAGS_HAVE_VERSION_TAG|Py_TPFLAGS_CHECKTYPES|Py=
_TPFLAGS_HAVE_NEWBUFFER|Py_TPFLAGS_BASETYPE|Py_TPFLAGS_HAVE_GC, /*tp_flags*/
+-  PyDoc_STR("XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse,=
 dtd_validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFa=
lse, recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_=
blank_text=3DFalse, resolve_entities=3DTrue, remove_comments=3DFalse, remov=
e_pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, compa=
ct=3DTrue)\n\n    The XML parser.\n\n    Parsers can be supplied as additio=
nal argument to various parse\n    functions of the lxml API.  A default pa=
rser is always available\n    and can be replaced by a call to the global f=
unction\n    'set_default_parser'.  New parsers can be created at any time\=
n    without a major run-time overhead.\n\n    The keyword arguments in the=
 constructor are mainly based on the\n    libxml2 parser configuration.  A =
DTD will also be loaded if DTD\n    validation or attribute default values =
are requested (unless you\n    additionally provide an XMLSchema from which=
 the default\n    attributes can be read).\n\n    Available boolean keyword=
 arguments:\n\n    - attribute_defaults - inject default attributes from DT=
D or XMLSchema\n    - dtd_validation     - validate against a DTD reference=
d by the document\n    - load_dtd           - use DTD for parsing\n    - no=
_network         - prevent network access for related files (default: True)=
\n    - ns_clean           - clean up redundant namespace declarations\n   =
 - recover            - try hard to parse through broken XML\n    - remove_=
blank_text  - discard blank text nodes that appear ignorable\n    - remove_=
comments    - discard comments\n    - remove_pis         - discard processi=
ng instructions\n    - strip_cdata        - replace CDATA sections by norma=
l text content (default: True)\n    - compact            - save memory for =
short text content (default: True)\n    - collect_ids        - use a hash t=
able of XML IDs for fast access (default: True, always True with DTD valida=
tion)\n    - huge_tree          - disable security restrictions and support=
 very deep trees\n      ""                     and very long text content (=
only affects libxml2 2.7+)\n\n    Other keyword arguments:\n\n    - resolve=
_entities - replace entities by their text value: False for keeping the\n  =
        entity references, True for resolving them, and 'internal' for reso=
lving\n          internal definitions only (no external file/URL access).\n=
          The default used to be True and was changed to 'internal' in lxml=
 5.0.\n    - encoding - override the document encoding (note: libiconv enco=
ding name)\n    - target   - a parser target object that will receive the p=
arse events\n    - schema   - an XMLSchema to validate against\n\n    Note =
that you should avoid sharing parsers between threads.  While this is\n    =
not harmful, it is more efficient to use separate parsers.  This does not\n=
    apply to the default parser.\n    "), /*tp_doc*/
++  PyDoc_STR("XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse,=
 dtd_validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFa=
lse, recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_=
blank_text=3DFalse, resolve_entities=3D'internal', remove_comments=3DFalse,=
 remove_pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone,=
 compact=3DTrue)\n\n    The XML parser.\n\n    Parsers can be supplied as a=
dditional argument to various parse\n    functions of the lxml API.  A defa=
ult parser is always available\n    and can be replaced by a call to the gl=
obal function\n    'set_default_parser'.  New parsers can be created at any=
 time\n    without a major run-time overhead.\n\n    The keyword arguments =
in the constructor are mainly based on the\n    libxml2 parser configuratio=
n.  A DTD will also be loaded if DTD\n    validation or attribute default v=
alues are requested (unless you\n    additionally provide an XMLSchema from=
 which the default\n    attributes can be read).\n\n    Available boolean k=
eyword arguments:\n\n    - attribute_defaults - inject default attributes f=
rom DTD or XMLSchema\n    - dtd_validation     - validate against a DTD ref=
erenced by the document\n    - load_dtd           - use DTD for parsing\n  =
  - no_network         - prevent network access for related files (default:=
 True)\n    - ns_clean           - clean up redundant namespace declaration=
s\n    - recover            - try hard to parse through broken XML\n    - r=
emove_blank_text  - discard blank text nodes that appear ignorable\n    - r=
emove_comments    - discard comments\n    - remove_pis         - discard pr=
ocessing instructions\n    - strip_cdata        - replace CDATA sections by=
 normal text content (default: True)\n    - compact            - save memor=
y for short text content (default: True)\n    - collect_ids        - use a =
hash table of XML IDs for fast access (default: True, always True with DTD =
validation)\n    - huge_tree          - disable security restrictions and s=
upport very deep trees""\n                           and very long text con=
tent (only affects libxml2 2.7+)\n\n    Other keyword arguments:\n\n    - r=
esolve_entities - replace entities by their text value: False for keeping t=
he\n          entity references, True for resolving them, and 'internal' fo=
r resolving\n          internal definitions only (no external file/URL acce=
ss).\n          The default used to be True and was changed to 'internal' i=
n lxml 5.0.\n    - encoding - override the document encoding (note: libicon=
v encoding name)\n    - target   - a parser target object that will receive=
 the parse events\n    - schema   - an XMLSchema to validate against\n\n   =
 Note that you should avoid sharing parsers between threads.  While this is=
\n    not harmful, it is more efficient to use separate parsers.  This does=
 not\n    apply to the default parser.\n    "), /*tp_doc*/
+   __pyx_tp_traverse_4lxml_5etree__BaseParser, /*tp_traverse*/
+   __pyx_tp_clear_4lxml_5etree__BaseParser, /*tp_clear*/
+   0, /*tp_richcompare*/
+@@ -263763,7 +263763,7 @@ static PyMethodDef __pyx_methods_4lxml_5etree_ET=
CompatXMLParser[] =3D {
+ };
+ #if CYTHON_USE_TYPE_SPECS
+ static PyType_Slot __pyx_type_4lxml_5etree_ETCompatXMLParser_slots[] =3D {
+-  {Py_tp_doc, (void *)PyDoc_STR("ETCompatXMLParser(self, encoding=3DNone,=
 attribute_defaults=3DFalse,                  dtd_validation=3DFalse, load_=
dtd=3DFalse, no_network=3DTrue,                  ns_clean=3DFalse, recover=
=3DFalse, schema=3DNone,                  huge_tree=3DFalse, remove_blank_t=
ext=3DFalse, resolve_entities=3DTrue,                  remove_comments=3DTr=
ue, remove_pis=3DTrue, strip_cdata=3DTrue,                  target=3DNone, =
compact=3DTrue)\n\n    An XML parser with an ElementTree compatible default=
 setup.\n\n    See the XMLParser class for details.\n\n    This parser has =
``remove_comments`` and ``remove_pis`` enabled by default\n    and thus ign=
ores comments and processing instructions.\n    ")},
++  {Py_tp_doc, (void *)PyDoc_STR("ETCompatXMLParser(self, encoding=3DNone,=
 attribute_defaults=3DFalse,                  dtd_validation=3DFalse, load_=
dtd=3DFalse, no_network=3DTrue,                  ns_clean=3DFalse, recover=
=3DFalse, schema=3DNone,                  huge_tree=3DFalse, remove_blank_t=
ext=3DFalse, resolve_entities=3D'internal',                  remove_comment=
s=3DTrue, remove_pis=3DTrue, strip_cdata=3DTrue,                  target=3D=
None, compact=3DTrue)\n\n    An XML parser with an ElementTree compatible d=
efault setup.\n\n    See the XMLParser class for details.\n\n    This parse=
r has ``remove_comments`` and ``remove_pis`` enabled by default\n    and th=
us ignores comments and processing instructions.\n    ")},
+   {Py_tp_traverse, (void *)__pyx_tp_traverse_4lxml_5etree__BaseParser},
+   {Py_tp_clear, (void *)__pyx_tp_clear_4lxml_5etree__BaseParser},
+   {Py_tp_methods, (void *)__pyx_methods_4lxml_5etree_ETCompatXMLParser},
+@@ -263811,7 +263811,7 @@ static PyTypeObject __pyx_type_4lxml_5etree_ETCo=
mpatXMLParser =3D {
+   0, /*tp_setattro*/
+   0, /*tp_as_buffer*/
+   Py_TPFLAGS_DEFAULT|Py_TPFLAGS_HAVE_VERSION_TAG|Py_TPFLAGS_CHECKTYPES|Py=
_TPFLAGS_HAVE_NEWBUFFER|Py_TPFLAGS_BASETYPE|Py_TPFLAGS_HAVE_GC, /*tp_flags*/
+-  PyDoc_STR("ETCompatXMLParser(self, encoding=3DNone, attribute_defaults=
=3DFalse,                  dtd_validation=3DFalse, load_dtd=3DFalse, no_net=
work=3DTrue,                  ns_clean=3DFalse, recover=3DFalse, schema=3DN=
one,                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,                  remove_comments=3DTrue, remove_pis=3DTru=
e, strip_cdata=3DTrue,                  target=3DNone, compact=3DTrue)\n\n =
   An XML parser with an ElementTree compatible default setup.\n\n    See t=
he XMLParser class for details.\n\n    This parser has ``remove_comments`` =
and ``remove_pis`` enabled by default\n    and thus ignores comments and pr=
ocessing instructions.\n    "), /*tp_doc*/
++  PyDoc_STR("ETCompatXMLParser(self, encoding=3DNone, attribute_defaults=
=3DFalse,                  dtd_validation=3DFalse, load_dtd=3DFalse, no_net=
work=3DTrue,                  ns_clean=3DFalse, recover=3DFalse, schema=3DN=
one,                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',                  remove_comments=3DTrue, remove_pis=
=3DTrue, strip_cdata=3DTrue,                  target=3DNone, compact=3DTrue=
)\n\n    An XML parser with an ElementTree compatible default setup.\n\n   =
 See the XMLParser class for details.\n\n    This parser has ``remove_comme=
nts`` and ``remove_pis`` enabled by default\n    and thus ignores comments =
and processing instructions.\n    "), /*tp_doc*/
+   __pyx_tp_traverse_4lxml_5etree__BaseParser, /*tp_traverse*/
+   __pyx_tp_clear_4lxml_5etree__BaseParser, /*tp_clear*/
+   0, /*tp_richcompare*/
+@@ -267005,7 +267005,7 @@ static struct PyGetSetDef __pyx_getsets_4lxml_5e=
tree_iterparse[] =3D {
+ #if CYTHON_USE_TYPE_SPECS
+ static PyType_Slot __pyx_type_4lxml_5etree_iterparse_slots[] =3D {
+   {Py_tp_dealloc, (void *)__pyx_tp_dealloc_4lxml_5etree_iterparse},
+-  {Py_tp_doc, (void *)PyDoc_STR("iterparse(self, source, events=3D(\"end\=
",), tag=3DNone,                   attribute_defaults=3DFalse, dtd_validati=
on=3DFalse,                   load_dtd=3DFalse, no_network=3DTrue, remove_b=
lank_text=3DFalse,                   remove_comments=3DFalse, remove_pis=3D=
False, encoding=3DNone,                   html=3DFalse, recover=3DNone, hug=
e_tree=3DFalse, schema=3DNone)\n\n    Incremental parser.\n\n    Parses XML=
 into a tree and generates tuples (event, element) in a\n    SAX-like fashi=
on. ``event`` is any of 'start', 'end', 'start-ns',\n    'end-ns'.\n\n    F=
or 'start' and 'end', ``element`` is the Element that the parser just\n    =
found opening or closing.  For 'start-ns', it is a tuple (prefix, URI) of\n=
    a new namespace declaration.  For 'end-ns', it is simply None.  Note th=
at\n    all start and end events are guaranteed to be properly nested.\n\n =
   The keyword argument ``events`` specifies a sequence of event type names=
\n    that should be generated.  By default, only 'end' events will be\n   =
 generated.\n\n    The additional ``tag`` argument restricts the 'start' an=
d 'end' events to\n    those elements that match the given tag.  The ``tag`=
` argument can also be\n    a sequence of tags to allow matching more than =
one tag.  By default,\n    events are generated for all elements.  Note tha=
t the 'start-ns' and\n    'end-ns' events are not impacted by this restrict=
ion.\n\n    The other keyword arguments in the constructor are mainly based=
 on the\n    libxml2 parser configuration.  A DTD will also be loaded if va=
lidation or\n    attribute default values are requested.\n\n    Available b=
oolean keyword arguments:\n     - attribute_defaults: read default attribut=
es from DTD\n     - dtd_validation: validate (if DTD is available)\n     - =
load_dtd: use DTD for parsing\n     - no_network: prevent network access fo=
r related files\n     - remove_blank_text: discard blank text nodes\n     -=
 remove_comments: discard comments\n     - remove_pis: discard processing i=
nstructions\n     - strip_cdata: repla""ce CDATA sections by normal text co=
ntent (default: True)\n     - compact: safe memory for short text content (=
default: True)\n     - resolve_entities: replace entities by their text val=
ue (default: True)\n     - huge_tree: disable security restrictions and sup=
port very deep trees\n                  and very long text content (only af=
fects libxml2 2.7+)\n     - html: parse input as HTML (default: XML)\n     =
- recover: try hard to parse through broken input (default: True for HTML,\=
n                False otherwise)\n\n    Other keyword arguments:\n     - e=
ncoding: override the document encoding\n     - schema: an XMLSchema to val=
idate against\n    ")},
++  {Py_tp_doc, (void *)PyDoc_STR("iterparse(self, source, events=3D(\"end\=
",), tag=3DNone,                   attribute_defaults=3DFalse, dtd_validati=
on=3DFalse,                   load_dtd=3DFalse, no_network=3DTrue, remove_b=
lank_text=3DFalse,                   compact=3DTrue, resolve_entities=3D'in=
ternal', remove_comments=3DFalse,                   remove_pis=3DFalse, str=
ip_cdata=3DTrue, encoding=3DNone,                   html=3DFalse, recover=
=3DNone, huge_tree=3DFalse, schema=3DNone)\n\n    Incremental parser.\n\n  =
  Parses XML into a tree and generates tuples (event, element) in a\n    SA=
X-like fashion. ``event`` is any of 'start', 'end', 'start-ns',\n    'end-n=
s'.\n\n    For 'start' and 'end', ``element`` is the Element that the parse=
r just\n    found opening or closing.  For 'start-ns', it is a tuple (prefi=
x, URI) of\n    a new namespace declaration.  For 'end-ns', it is simply No=
ne.  Note that\n    all start and end events are guaranteed to be properly =
nested.\n\n    The keyword argument ``events`` specifies a sequence of even=
t type names\n    that should be generated.  By default, only 'end' events =
will be\n    generated.\n\n    The additional ``tag`` argument restricts th=
e 'start' and 'end' events to\n    those elements that match the given tag.=
  The ``tag`` argument can also be\n    a sequence of tags to allow matchin=
g more than one tag.  By default,\n    events are generated for all element=
s.  Note that the 'start-ns' and\n    'end-ns' events are not impacted by t=
his restriction.\n\n    The other keyword arguments in the constructor are =
mainly based on the\n    libxml2 parser configuration.  A DTD will also be =
loaded if validation or\n    attribute default values are requested.\n\n   =
 Available boolean keyword arguments:\n     - attribute_defaults: read defa=
ult attributes from DTD\n     - dtd_validation: validate (if DTD is availab=
le)\n     - load_dtd: use DTD for parsing\n     - no_network: prevent netwo=
rk access for related files\n     - remove_blank_text: discard blank text n=
odes\n     - remove_comments: discard comments""\n     - remove_pis: discar=
d processing instructions\n     - strip_cdata: replace CDATA sections by no=
rmal text content (default: True)\n     - compact: safe memory for short te=
xt content (default: True)\n     - resolve_entities: replace entities by th=
eir text value\n       (default: 'internal' only)\n     - huge_tree: disabl=
e security restrictions and support very deep trees\n                  and =
very long text content (only affects libxml2 2.7+)\n     - html: parse inpu=
t as HTML (default: XML)\n     - recover: try hard to parse through broken =
input (default: True for HTML,\n                False otherwise)\n\n    Oth=
er keyword arguments:\n     - encoding: override the document encoding\n   =
  - schema: an XMLSchema to validate against\n    ")},
+   {Py_tp_traverse, (void *)__pyx_tp_traverse_4lxml_5etree_iterparse},
+   {Py_tp_clear, (void *)__pyx_tp_clear_4lxml_5etree_iterparse},
+   {Py_tp_iter, (void *)__pyx_pw_4lxml_5etree_9iterparse_7__iter__},
+@@ -267056,7 +267056,7 @@ static PyTypeObject __pyx_type_4lxml_5etree_iter=
parse =3D {
+   0, /*tp_setattro*/
+   0, /*tp_as_buffer*/
+   Py_TPFLAGS_DEFAULT|Py_TPFLAGS_HAVE_VERSION_TAG|Py_TPFLAGS_CHECKTYPES|Py=
_TPFLAGS_HAVE_NEWBUFFER|Py_TPFLAGS_BASETYPE|Py_TPFLAGS_HAVE_GC, /*tp_flags*/
+-  PyDoc_STR("iterparse(self, source, events=3D(\"end\",), tag=3DNone,    =
               attribute_defaults=3DFalse, dtd_validation=3DFalse,         =
          load_dtd=3DFalse, no_network=3DTrue, remove_blank_text=3DFalse,  =
                 remove_comments=3DFalse, remove_pis=3DFalse, encoding=3DNo=
ne,                   html=3DFalse, recover=3DNone, huge_tree=3DFalse, sche=
ma=3DNone)\n\n    Incremental parser.\n\n    Parses XML into a tree and gen=
erates tuples (event, element) in a\n    SAX-like fashion. ``event`` is any=
 of 'start', 'end', 'start-ns',\n    'end-ns'.\n\n    For 'start' and 'end'=
, ``element`` is the Element that the parser just\n    found opening or clo=
sing.  For 'start-ns', it is a tuple (prefix, URI) of\n    a new namespace =
declaration.  For 'end-ns', it is simply None.  Note that\n    all start an=
d end events are guaranteed to be properly nested.\n\n    The keyword argum=
ent ``events`` specifies a sequence of event type names\n    that should be=
 generated.  By default, only 'end' events will be\n    generated.\n\n    T=
he additional ``tag`` argument restricts the 'start' and 'end' events to\n =
   those elements that match the given tag.  The ``tag`` argument can also =
be\n    a sequence of tags to allow matching more than one tag.  By default=
,\n    events are generated for all elements.  Note that the 'start-ns' and=
\n    'end-ns' events are not impacted by this restriction.\n\n    The othe=
r keyword arguments in the constructor are mainly based on the\n    libxml2=
 parser configuration.  A DTD will also be loaded if validation or\n    att=
ribute default values are requested.\n\n    Available boolean keyword argum=
ents:\n     - attribute_defaults: read default attributes from DTD\n     - =
dtd_validation: validate (if DTD is available)\n     - load_dtd: use DTD fo=
r parsing\n     - no_network: prevent network access for related files\n   =
  - remove_blank_text: discard blank text nodes\n     - remove_comments: di=
scard comments\n     - remove_pis: discard processing instructions\n     - =
strip_cdata: repla""ce CDATA sections by normal text content (default: True=
)\n     - compact: safe memory for short text content (default: True)\n    =
 - resolve_entities: replace entities by their text value (default: True)\n=
     - huge_tree: disable security restrictions and support very deep trees=
\n                  and very long text content (only affects libxml2 2.7+)\=
n     - html: parse input as HTML (default: XML)\n     - recover: try hard =
to parse through broken input (default: True for HTML,\n                Fal=
se otherwise)\n\n    Other keyword arguments:\n     - encoding: override th=
e document encoding\n     - schema: an XMLSchema to validate against\n    "=
), /*tp_doc*/
++  PyDoc_STR("iterparse(self, source, events=3D(\"end\",), tag=3DNone,    =
               attribute_defaults=3DFalse, dtd_validation=3DFalse,         =
          load_dtd=3DFalse, no_network=3DTrue, remove_blank_text=3DFalse,  =
                 compact=3DTrue, resolve_entities=3D'internal', remove_comm=
ents=3DFalse,                   remove_pis=3DFalse, strip_cdata=3DTrue, enc=
oding=3DNone,                   html=3DFalse, recover=3DNone, huge_tree=3DF=
alse, schema=3DNone)\n\n    Incremental parser.\n\n    Parses XML into a tr=
ee and generates tuples (event, element) in a\n    SAX-like fashion. ``even=
t`` is any of 'start', 'end', 'start-ns',\n    'end-ns'.\n\n    For 'start'=
 and 'end', ``element`` is the Element that the parser just\n    found open=
ing or closing.  For 'start-ns', it is a tuple (prefix, URI) of\n    a new =
namespace declaration.  For 'end-ns', it is simply None.  Note that\n    al=
l start and end events are guaranteed to be properly nested.\n\n    The key=
word argument ``events`` specifies a sequence of event type names\n    that=
 should be generated.  By default, only 'end' events will be\n    generated=
.\n\n    The additional ``tag`` argument restricts the 'start' and 'end' ev=
ents to\n    those elements that match the given tag.  The ``tag`` argument=
 can also be\n    a sequence of tags to allow matching more than one tag.  =
By default,\n    events are generated for all elements.  Note that the 'sta=
rt-ns' and\n    'end-ns' events are not impacted by this restriction.\n\n  =
  The other keyword arguments in the constructor are mainly based on the\n =
   libxml2 parser configuration.  A DTD will also be loaded if validation o=
r\n    attribute default values are requested.\n\n    Available boolean key=
word arguments:\n     - attribute_defaults: read default attributes from DT=
D\n     - dtd_validation: validate (if DTD is available)\n     - load_dtd: =
use DTD for parsing\n     - no_network: prevent network access for related =
files\n     - remove_blank_text: discard blank text nodes\n     - remove_co=
mments: discard comments""\n     - remove_pis: discard processing instructi=
ons\n     - strip_cdata: replace CDATA sections by normal text content (def=
ault: True)\n     - compact: safe memory for short text content (default: T=
rue)\n     - resolve_entities: replace entities by their text value\n      =
 (default: 'internal' only)\n     - huge_tree: disable security restriction=
s and support very deep trees\n                  and very long text content=
 (only affects libxml2 2.7+)\n     - html: parse input as HTML (default: XM=
L)\n     - recover: try hard to parse through broken input (default: True f=
or HTML,\n                False otherwise)\n\n    Other keyword arguments:\=
n     - encoding: override the document encoding\n     - schema: an XMLSche=
ma to validate against\n    "), /*tp_doc*/
+   __pyx_tp_traverse_4lxml_5etree_iterparse, /*tp_traverse*/
+   __pyx_tp_clear_4lxml_5etree_iterparse, /*tp_clear*/
+   0, /*tp_richcompare*/
+@@ -279350,36 +279350,36 @@ static CYTHON_SMALL_CODE int __Pyx_InitCachedC=
onstants(void) {
+   __Pyx_GOTREF(__pyx_slice__81);
+   __Pyx_GIVEREF(__pyx_slice__81);
+=20
+-  /* "src/lxml/iterparse.pxi":67
++  /* "src/lxml/iterparse.pxi":69
+  *     cdef bint _close_source_after_read
+  *=20
+  *     def __init__(self, source, events=3D(u"end",), *, tag=3DNone,     =
        # <<<<<<<<<<<<<<
+  *                  attribute_defaults=3DFalse, dtd_validation=3DFalse,
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,
+  */
+-  __pyx_tuple__91 =3D PyTuple_Pack(1, __pyx_n_u_end); if (unlikely(!__pyx=
_tuple__91)) __PYX_ERR(14, 67, __pyx_L1_error)
++  __pyx_tuple__91 =3D PyTuple_Pack(1, __pyx_n_u_end); if (unlikely(!__pyx=
_tuple__91)) __PYX_ERR(14, 69, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_tuple__91);
+   __Pyx_GIVEREF(__pyx_tuple__91);
+=20
+-  /* "src/lxml/iterparse.pxi":223
++  /* "src/lxml/iterparse.pxi":225
+  *         if not isinstance(data, bytes):
+  *             self._close_source()
+  *             raise TypeError("reading file objects must return bytes ob=
jects")             # <<<<<<<<<<<<<<
+  *         if not data:
+  *             try:
+  */
+-  __pyx_tuple__92 =3D PyTuple_Pack(1, __pyx_kp_s_reading_file_objects_mus=
t_return); if (unlikely(!__pyx_tuple__92)) __PYX_ERR(14, 223, __pyx_L1_erro=
r)
++  __pyx_tuple__92 =3D PyTuple_Pack(1, __pyx_kp_s_reading_file_objects_mus=
t_return); if (unlikely(!__pyx_tuple__92)) __PYX_ERR(14, 225, __pyx_L1_erro=
r)
+   __Pyx_GOTREF(__pyx_tuple__92);
+   __Pyx_GIVEREF(__pyx_tuple__92);
+=20
+-  /* "src/lxml/iterparse.pxi":411
++  /* "src/lxml/iterparse.pxi":413
+  *                 self._events.append( (u"end", node) )
+  *         if self._event_filter & PARSE_EVENT_FILTER_END_NS and ns_count:
+  *             event =3D (u"end-ns", None)             # <<<<<<<<<<<<<<
+  *             for i in range(ns_count):
+  *                 self._events.append(event)
+  */
+-  __pyx_tuple__93 =3D PyTuple_Pack(2, __pyx_kp_u_end_ns, Py_None); if (un=
likely(!__pyx_tuple__93)) __PYX_ERR(14, 411, __pyx_L1_error)
++  __pyx_tuple__93 =3D PyTuple_Pack(2, __pyx_kp_u_end_ns, Py_None); if (un=
likely(!__pyx_tuple__93)) __PYX_ERR(14, 413, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_tuple__93);
+   __Pyx_GIVEREF(__pyx_tuple__93);
+=20
+@@ -281898,32 +281898,32 @@ static CYTHON_SMALL_CODE int __Pyx_InitCachedC=
onstants(void) {
+  */
+   __pyx_codeobj__90 =3D (PyObject*)__Pyx_PyCode_New(1, 0, 0, 2, 0, CO_OPT=
IMIZED|CO_NEWLOCALS|CO_VARARGS|CO_COROUTINE, __pyx_empty_bytes, __pyx_empty=
_tuple, __pyx_empty_tuple, __pyx_tuple__139, __pyx_empty_tuple, __pyx_empty=
_tuple, __pyx_kp_s_src_lxml_serializer_pxi, __pyx_n_s_aexit, 1869, __pyx_em=
pty_bytes); if (unlikely(!__pyx_codeobj__90)) __PYX_ERR(9, 1869, __pyx_L1_e=
rror)
+=20
+-  /* "src/lxml/iterparse.pxi":149
++  /* "src/lxml/iterparse.pxi":151
+  *         return self._parser.version
+  *=20
+  *     def set_element_class_lookup(self, ElementClassLookup lookup =3D N=
one):             # <<<<<<<<<<<<<<
+  *         u"""set_element_class_lookup(self, lookup =3D None)
+  *=20
+  */
+-  __pyx_codeobj__447 =3D (PyObject*)__Pyx_PyCode_New(2, 0, 0, 2, 0, CO_OP=
TIMIZED|CO_NEWLOCALS, __pyx_empty_bytes, __pyx_empty_tuple, __pyx_empty_tup=
le, __pyx_tuple__336, __pyx_empty_tuple, __pyx_empty_tuple, __pyx_kp_s_src_=
lxml_iterparse_pxi, __pyx_n_s_set_element_class_lookup, 149, __pyx_empty_by=
tes); if (unlikely(!__pyx_codeobj__447)) __PYX_ERR(14, 149, __pyx_L1_error)
++  __pyx_codeobj__447 =3D (PyObject*)__Pyx_PyCode_New(2, 0, 0, 2, 0, CO_OP=
TIMIZED|CO_NEWLOCALS, __pyx_empty_bytes, __pyx_empty_tuple, __pyx_empty_tup=
le, __pyx_tuple__336, __pyx_empty_tuple, __pyx_empty_tuple, __pyx_kp_s_src_=
lxml_iterparse_pxi, __pyx_n_s_set_element_class_lookup, 151, __pyx_empty_by=
tes); if (unlikely(!__pyx_codeobj__447)) __PYX_ERR(14, 151, __pyx_L1_error)
+=20
+-  /* "src/lxml/iterparse.pxi":158
++  /* "src/lxml/iterparse.pxi":160
+  *         self._parser.set_element_class_lookup(lookup)
+  *=20
+  *     def makeelement(self, _tag, attrib=3DNone, nsmap=3DNone, **_extra)=
:             # <<<<<<<<<<<<<<
+  *         u"""makeelement(self, _tag, attrib=3DNone, nsmap=3DNone, **_ex=
tra)
+  *=20
+  */
+-  __pyx_codeobj__448 =3D (PyObject*)__Pyx_PyCode_New(4, 0, 0, 5, 0, CO_OP=
TIMIZED|CO_NEWLOCALS|CO_VARKEYWORDS, __pyx_empty_bytes, __pyx_empty_tuple, =
__pyx_empty_tuple, __pyx_tuple__212, __pyx_empty_tuple, __pyx_empty_tuple, =
__pyx_kp_s_src_lxml_iterparse_pxi, __pyx_n_s_makeelement, 158, __pyx_empty_=
bytes); if (unlikely(!__pyx_codeobj__448)) __PYX_ERR(14, 158, __pyx_L1_erro=
r)
++  __pyx_codeobj__448 =3D (PyObject*)__Pyx_PyCode_New(4, 0, 0, 5, 0, CO_OP=
TIMIZED|CO_NEWLOCALS|CO_VARKEYWORDS, __pyx_empty_bytes, __pyx_empty_tuple, =
__pyx_empty_tuple, __pyx_tuple__212, __pyx_empty_tuple, __pyx_empty_tuple, =
__pyx_kp_s_src_lxml_iterparse_pxi, __pyx_n_s_makeelement, 160, __pyx_empty_=
bytes); if (unlikely(!__pyx_codeobj__448)) __PYX_ERR(14, 160, __pyx_L1_erro=
r)
+=20
+-  /* "src/lxml/iterparse.pxi":375
++  /* "src/lxml/iterparse.pxi":377
+  *         return self._pop_event(0)
+  *=20
+  *     def skip_subtree(self):             # <<<<<<<<<<<<<<
+  *         """Prevent descending into the current subtree.
+  *         Instead, the next returned event will be the 'end' event of th=
e current element
+  */
+-  __pyx_codeobj__449 =3D (PyObject*)__Pyx_PyCode_New(1, 0, 0, 1, 0, CO_OP=
TIMIZED|CO_NEWLOCALS, __pyx_empty_bytes, __pyx_empty_tuple, __pyx_empty_tup=
le, __pyx_tuple__115, __pyx_empty_tuple, __pyx_empty_tuple, __pyx_kp_s_src_=
lxml_iterparse_pxi, __pyx_n_s_skip_subtree, 375, __pyx_empty_bytes); if (un=
likely(!__pyx_codeobj__449)) __PYX_ERR(14, 375, __pyx_L1_error)
++  __pyx_codeobj__449 =3D (PyObject*)__Pyx_PyCode_New(1, 0, 0, 1, 0, CO_OP=
TIMIZED|CO_NEWLOCALS, __pyx_empty_bytes, __pyx_empty_tuple, __pyx_empty_tup=
le, __pyx_tuple__115, __pyx_empty_tuple, __pyx_empty_tuple, __pyx_kp_s_src_=
lxml_iterparse_pxi, __pyx_n_s_skip_subtree, 377, __pyx_empty_bytes); if (un=
likely(!__pyx_codeobj__449)) __PYX_ERR(14, 377, __pyx_L1_error)
+=20
+   /* "src/lxml/xmlid.pxi":3
+  * cdef object _find_id_attributes
+@@ -285664,15 +285664,15 @@ static int __Pyx_modinit_type_init_code(void) {
+   __pyx_vtable_4lxml_5etree_iterwalk._start_node =3D (int (*)(struct __py=
x_obj_4lxml_5etree_iterwalk *, struct LxmlElement *))__pyx_f_4lxml_5etree_8=
iterwalk__start_node;
+   __pyx_vtable_4lxml_5etree_iterwalk._end_node =3D (struct LxmlElement *(=
*)(struct __pyx_obj_4lxml_5etree_iterwalk *))__pyx_f_4lxml_5etree_8iterwalk=
__end_node;
+   #if CYTHON_USE_TYPE_SPECS
+-  __pyx_ptype_4lxml_5etree_iterwalk =3D (PyTypeObject *) __Pyx_PyType_Fro=
mModuleAndSpec(__pyx_m, &__pyx_type_4lxml_5etree_iterwalk_spec, NULL); if (=
unlikely(!__pyx_ptype_4lxml_5etree_iterwalk)) __PYX_ERR(14, 241, __pyx_L1_e=
rror)
+-  if (__Pyx_fix_up_extension_type_from_spec(&__pyx_type_4lxml_5etree_iter=
walk_spec, __pyx_ptype_4lxml_5etree_iterwalk) < 0) __PYX_ERR(14, 241, __pyx=
_L1_error)
++  __pyx_ptype_4lxml_5etree_iterwalk =3D (PyTypeObject *) __Pyx_PyType_Fro=
mModuleAndSpec(__pyx_m, &__pyx_type_4lxml_5etree_iterwalk_spec, NULL); if (=
unlikely(!__pyx_ptype_4lxml_5etree_iterwalk)) __PYX_ERR(14, 243, __pyx_L1_e=
rror)
++  if (__Pyx_fix_up_extension_type_from_spec(&__pyx_type_4lxml_5etree_iter=
walk_spec, __pyx_ptype_4lxml_5etree_iterwalk) < 0) __PYX_ERR(14, 243, __pyx=
_L1_error)
+   #else
+   __pyx_ptype_4lxml_5etree_iterwalk =3D &__pyx_type_4lxml_5etree_iterwalk;
+   #endif
+   #if !CYTHON_COMPILING_IN_LIMITED_API
+   #endif
+   #if !CYTHON_USE_TYPE_SPECS
+-  if (__Pyx_PyType_Ready(__pyx_ptype_4lxml_5etree_iterwalk) < 0) __PYX_ER=
R(14, 241, __pyx_L1_error)
++  if (__Pyx_PyType_Ready(__pyx_ptype_4lxml_5etree_iterwalk) < 0) __PYX_ER=
R(14, 243, __pyx_L1_error)
+   #endif
+   #if PY_MAJOR_VERSION < 3
+   __pyx_ptype_4lxml_5etree_iterwalk->tp_print =3D 0;
+@@ -285682,11 +285682,11 @@ static int __Pyx_modinit_type_init_code(void) {
+     __pyx_ptype_4lxml_5etree_iterwalk->tp_getattro =3D __Pyx_PyObject_Gen=
ericGetAttr;
+   }
+   #endif
+-  if (__Pyx_SetVtable(__pyx_ptype_4lxml_5etree_iterwalk, __pyx_vtabptr_4l=
xml_5etree_iterwalk) < 0) __PYX_ERR(14, 241, __pyx_L1_error)
++  if (__Pyx_SetVtable(__pyx_ptype_4lxml_5etree_iterwalk, __pyx_vtabptr_4l=
xml_5etree_iterwalk) < 0) __PYX_ERR(14, 243, __pyx_L1_error)
+   #if !CYTHON_COMPILING_IN_LIMITED_API
+-  if (__Pyx_MergeVtables(__pyx_ptype_4lxml_5etree_iterwalk) < 0) __PYX_ER=
R(14, 241, __pyx_L1_error)
++  if (__Pyx_MergeVtables(__pyx_ptype_4lxml_5etree_iterwalk) < 0) __PYX_ER=
R(14, 243, __pyx_L1_error)
+   #endif
+-  if (PyObject_SetAttr(__pyx_m, __pyx_n_s_iterwalk, (PyObject *) __pyx_pt=
ype_4lxml_5etree_iterwalk) < 0) __PYX_ERR(14, 241, __pyx_L1_error)
++  if (PyObject_SetAttr(__pyx_m, __pyx_n_s_iterwalk, (PyObject *) __pyx_pt=
ype_4lxml_5etree_iterwalk) < 0) __PYX_ERR(14, 243, __pyx_L1_error)
+   __pyx_vtabptr_4lxml_5etree__IDDict =3D &__pyx_vtable_4lxml_5etree__IDDi=
ct;
+   __pyx_vtable_4lxml_5etree__IDDict._build_keys =3D (PyObject *(*)(struct=
 __pyx_obj_4lxml_5etree__IDDict *))__pyx_f_4lxml_5etree_7_IDDict__build_key=
s;
+   __pyx_vtable_4lxml_5etree__IDDict._build_items =3D (PyObject *(*)(struc=
t __pyx_obj_4lxml_5etree__IDDict *))__pyx_f_4lxml_5etree_7_IDDict__build_it=
ems;
+@@ -293339,44 +293339,44 @@ if (!__Pyx_RefNanny) {
+   __Pyx_DECREF(__pyx_t_13); __pyx_t_13 =3D 0;
+   PyType_Modified(__pyx_ptype_4lxml_5etree__MethodChanger);
+=20
+-  /* "src/lxml/iterparse.pxi":149
++  /* "src/lxml/iterparse.pxi":151
+  *         return self._parser.version
+  *=20
+  *     def set_element_class_lookup(self, ElementClassLookup lookup =3D N=
one):             # <<<<<<<<<<<<<<
+  *         u"""set_element_class_lookup(self, lookup =3D None)
+  *=20
+  */
+-  __pyx_t_13 =3D __Pyx_CyFunction_New(&__pyx_mdef_4lxml_5etree_9iterparse=
_3set_element_class_lookup, __Pyx_CYFUNCTION_CCLASS, __pyx_n_s_iterparse_se=
t_element_class_look, NULL, __pyx_n_s_lxml_etree, __pyx_d, ((PyObject *)__p=
yx_codeobj__447)); if (unlikely(!__pyx_t_13)) __PYX_ERR(14, 149, __pyx_L1_e=
rror)
++  __pyx_t_13 =3D __Pyx_CyFunction_New(&__pyx_mdef_4lxml_5etree_9iterparse=
_3set_element_class_lookup, __Pyx_CYFUNCTION_CCLASS, __pyx_n_s_iterparse_se=
t_element_class_look, NULL, __pyx_n_s_lxml_etree, __pyx_d, ((PyObject *)__p=
yx_codeobj__447)); if (unlikely(!__pyx_t_13)) __PYX_ERR(14, 151, __pyx_L1_e=
rror)
+   __Pyx_GOTREF(__pyx_t_13);
+   __Pyx_CyFunction_SetDefaultsTuple(__pyx_t_13, __pyx_tuple__191);
+-  if (__Pyx_SetItemOnTypeDict((PyObject *)__pyx_ptype_4lxml_5etree_iterpa=
rse, __pyx_n_s_set_element_class_lookup, __pyx_t_13) < 0) __PYX_ERR(14, 149=
, __pyx_L1_error)
++  if (__Pyx_SetItemOnTypeDict((PyObject *)__pyx_ptype_4lxml_5etree_iterpa=
rse, __pyx_n_s_set_element_class_lookup, __pyx_t_13) < 0) __PYX_ERR(14, 151=
, __pyx_L1_error)
+   __Pyx_DECREF(__pyx_t_13); __pyx_t_13 =3D 0;
+   PyType_Modified(__pyx_ptype_4lxml_5etree_iterparse);
+=20
+-  /* "src/lxml/iterparse.pxi":158
++  /* "src/lxml/iterparse.pxi":160
+  *         self._parser.set_element_class_lookup(lookup)
+  *=20
+  *     def makeelement(self, _tag, attrib=3DNone, nsmap=3DNone, **_extra)=
:             # <<<<<<<<<<<<<<
+  *         u"""makeelement(self, _tag, attrib=3DNone, nsmap=3DNone, **_ex=
tra)
+  *=20
+  */
+-  __pyx_t_13 =3D __Pyx_CyFunction_New(&__pyx_mdef_4lxml_5etree_9iterparse=
_5makeelement, __Pyx_CYFUNCTION_CCLASS, __pyx_n_s_iterparse_makeelement, NU=
LL, __pyx_n_s_lxml_etree, __pyx_d, ((PyObject *)__pyx_codeobj__448)); if (u=
nlikely(!__pyx_t_13)) __PYX_ERR(14, 158, __pyx_L1_error)
++  __pyx_t_13 =3D __Pyx_CyFunction_New(&__pyx_mdef_4lxml_5etree_9iterparse=
_5makeelement, __Pyx_CYFUNCTION_CCLASS, __pyx_n_s_iterparse_makeelement, NU=
LL, __pyx_n_s_lxml_etree, __pyx_d, ((PyObject *)__pyx_codeobj__448)); if (u=
nlikely(!__pyx_t_13)) __PYX_ERR(14, 160, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_13);
+   __Pyx_CyFunction_SetDefaultsTuple(__pyx_t_13, __pyx_tuple__188);
+-  if (__Pyx_SetItemOnTypeDict((PyObject *)__pyx_ptype_4lxml_5etree_iterpa=
rse, __pyx_n_s_makeelement, __pyx_t_13) < 0) __PYX_ERR(14, 158, __pyx_L1_er=
ror)
++  if (__Pyx_SetItemOnTypeDict((PyObject *)__pyx_ptype_4lxml_5etree_iterpa=
rse, __pyx_n_s_makeelement, __pyx_t_13) < 0) __PYX_ERR(14, 160, __pyx_L1_er=
ror)
+   __Pyx_DECREF(__pyx_t_13); __pyx_t_13 =3D 0;
+   PyType_Modified(__pyx_ptype_4lxml_5etree_iterparse);
+=20
+-  /* "src/lxml/iterparse.pxi":375
++  /* "src/lxml/iterparse.pxi":377
+  *         return self._pop_event(0)
+  *=20
+  *     def skip_subtree(self):             # <<<<<<<<<<<<<<
+  *         """Prevent descending into the current subtree.
+  *         Instead, the next returned event will be the 'end' event of th=
e current element
+  */
+-  __pyx_t_13 =3D __Pyx_CyFunction_New(&__pyx_mdef_4lxml_5etree_8iterwalk_=
7skip_subtree, __Pyx_CYFUNCTION_CCLASS, __pyx_n_s_iterwalk_skip_subtree, NU=
LL, __pyx_n_s_lxml_etree, __pyx_d, ((PyObject *)__pyx_codeobj__449)); if (u=
nlikely(!__pyx_t_13)) __PYX_ERR(14, 375, __pyx_L1_error)
++  __pyx_t_13 =3D __Pyx_CyFunction_New(&__pyx_mdef_4lxml_5etree_8iterwalk_=
7skip_subtree, __Pyx_CYFUNCTION_CCLASS, __pyx_n_s_iterwalk_skip_subtree, NU=
LL, __pyx_n_s_lxml_etree, __pyx_d, ((PyObject *)__pyx_codeobj__449)); if (u=
nlikely(!__pyx_t_13)) __PYX_ERR(14, 377, __pyx_L1_error)
+   __Pyx_GOTREF(__pyx_t_13);
+-  if (__Pyx_SetItemOnTypeDict((PyObject *)__pyx_ptype_4lxml_5etree_iterwa=
lk, __pyx_n_s_skip_subtree, __pyx_t_13) < 0) __PYX_ERR(14, 375, __pyx_L1_er=
ror)
++  if (__Pyx_SetItemOnTypeDict((PyObject *)__pyx_ptype_4lxml_5etree_iterwa=
lk, __pyx_n_s_skip_subtree, __pyx_t_13) < 0) __PYX_ERR(14, 377, __pyx_L1_er=
ror)
+   __Pyx_DECREF(__pyx_t_13); __pyx_t_13 =3D 0;
+   PyType_Modified(__pyx_ptype_4lxml_5etree_iterwalk);
+=20
+diff --git a/src/lxml/iterparse.pxi b/src/lxml/iterparse.pxi
+index 2758b14..42d0554 100644
+--- a/src/lxml/iterparse.pxi
++++ b/src/lxml/iterparse.pxi
+@@ -6,7 +6,8 @@ cdef class iterparse:
+     u"""iterparse(self, source, events=3D("end",), tag=3DNone, \
+                   attribute_defaults=3DFalse, dtd_validation=3DFalse, \
+                   load_dtd=3DFalse, no_network=3DTrue, remove_blank_text=
=3DFalse, \
+-                  remove_comments=3DFalse, remove_pis=3DFalse, encoding=
=3DNone, \
++                  compact=3DTrue, resolve_entities=3D'internal', remove_c=
omments=3DFalse, \
++                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNone=
, \
+                   html=3DFalse, recover=3DNone, huge_tree=3DFalse, schema=
=3DNone)
+=20
+     Incremental parser.
+@@ -44,7 +45,8 @@ cdef class iterparse:
+      - remove_pis: discard processing instructions
+      - strip_cdata: replace CDATA sections by normal text content (defaul=
t: True)
+      - compact: safe memory for short text content (default: True)
+-     - resolve_entities: replace entities by their text value (default: T=
rue)
++     - resolve_entities: replace entities by their text value
++       (default: 'internal' only)
+      - huge_tree: disable security restrictions and support very deep tre=
es
+                   and very long text content (only affects libxml2 2.7+)
+      - html: parse input as HTML (default: XML)
+@@ -67,7 +69,7 @@ cdef class iterparse:
+     def __init__(self, source, events=3D(u"end",), *, tag=3DNone,
+                  attribute_defaults=3DFalse, dtd_validation=3DFalse,
+                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_text=
=3DFalse,
+-                 compact=3DTrue, resolve_entities=3DTrue, remove_comments=
=3DFalse,
++                 compact=3DTrue, resolve_entities=3D'internal', remove_co=
mments=3DFalse,
+                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNone,
+                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, collect=
_ids=3DTrue,
+                  XMLSchema schema=3DNone):
+diff --git a/src/lxml/parser.pxi b/src/lxml/parser.pxi
+index e9f4bec..bded239 100644
+--- a/src/lxml/parser.pxi
++++ b/src/lxml/parser.pxi
+@@ -1564,7 +1564,7 @@ _XML_DEFAULT_PARSE_OPTIONS =3D (
+     )
+=20
+ cdef class XMLParser(_FeedParser):
+-    u"""XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, dtd_=
validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFalse, =
recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_blank=
_text=3DFalse, resolve_entities=3DTrue, remove_comments=3DFalse, remove_pis=
=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, compact=3D=
True)
++    u"""XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, dtd_=
validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFalse, =
recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_blank=
_text=3DFalse, resolve_entities=3D'internal', remove_comments=3DFalse, remo=
ve_pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, comp=
act=3DTrue)
+=20
+     The XML parser.
+=20
+@@ -1686,7 +1686,7 @@ cdef class ETCompatXMLParser(XMLParser):
+     u"""ETCompatXMLParser(self, encoding=3DNone, attribute_defaults=3DFal=
se, \
+                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=3DT=
rue, \
+                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone, \
+-                 huge_tree=3DFalse, remove_blank_text=3DFalse, resolve_en=
tities=3DTrue, \
++                 huge_tree=3DFalse, remove_blank_text=3DFalse, resolve_en=
tities=3D'internal', \
+                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdata=
=3DTrue, \
+                  target=3DNone, compact=3DTrue)
+=20
+@@ -1700,7 +1700,7 @@ cdef class ETCompatXMLParser(XMLParser):
+     def __init__(self, *, encoding=3DNone, attribute_defaults=3DFalse,
+                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=3DT=
rue,
+                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+-                 huge_tree=3DFalse, remove_blank_text=3DFalse, resolve_en=
tities=3DTrue,
++                 huge_tree=3DFalse, remove_blank_text=3DFalse, resolve_en=
tities=3D'internal',
+                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdata=
=3DTrue,
+                  target=3DNone, compact=3DTrue):
+         XMLParser.__init__(self,
diff --git a/meta/recipes-devtools/python/python3-lxml_5.0.2.bb b/meta/reci=
pes-devtools/python/python3-lxml_5.0.2.bb
index c0b385c7ea..2d2d55202c 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.0.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.0.2.bb
@@ -20,7 +20,9 @@ DEPENDS +=3D "libxml2 libxslt"
=20
 SRC_URI[sha256sum] =3D "6399703c40ba53e2c3b72fdb56cb908d2b83c08082ecf17de8=
39b27e68d1e598"
=20
-SRC_URI +=3D "${PYPI_SRC_URI}"
+SRC_URI +=3D "${PYPI_SRC_URI} \
+            file://CVE-2026-41066.patch \
+           "
 inherit pkgconfig pypi setuptools3
=20
 # {standard input}: Assembler messages:
--=20
2.35.6


