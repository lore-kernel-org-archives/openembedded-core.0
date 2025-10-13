Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99A8CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:45:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.41390.1760355902991394980
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 04:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IqS6NzeD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2381f1bef8=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59D6JVfZ3930735
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 04:45:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=0Qu08q1UORnKKFd0U8HI
	OfxGCBb1nVJnP8HWNqIo5Ow=; b=IqS6NzeD55OESp7qV/4vpMMiHXKaPqTm03FS
	pkEGSrdKwCrac2+R0ARJd8X4Ebv6abG6jMl2Q++jyR50kMDktPUCzRXe+6HaRyX4
	94+lM7wR7Qhg8iKGydxj6Wgltt4QyJcqAPPVWPR8q6GGmdMlTvS2lgSfRpEeaYs/
	BvqPhUe5cQK6JQ83KtOwCD+xStiM65jA0omqcwuKSWCiGNoyFd/v31lPTbodguHm
	Rj5nLqI3Q09AamopQtvbD1wkjTbRp3+8kbrZAG2TrU5HkW4W5ofbzAnQomkynA/b
	bHWCr5bnGVRt+ngIRA4NS9xRjb36F7sFIszQQo/+lFPJ+7hUuw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdse8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 04:45:02 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 13 Oct 2025 04:45:01 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 13 Oct 2025 04:45:00 -0700
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH V2 1/1] python3-xmltodict: fix CVE-2025-9375
Date: Mon, 13 Oct 2025 17:14:54 +0530
Message-ID: <20251013114454.2265433-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA1MyBTYWx0ZWRfX6roSOSD7u4he
 PbN9asZIcqHG6gJ8n1uiO/CYgnDOPxi31asPU2t9X8JWvEIFklS71U4FZ1a2vOroIByz9sBCJ3i
 0cjhTxMpSOhYmoyK4D1zF/KLrYCtYUUXwsM/pH8ErbZOqC2XB1nSZCh26EOxP5QqDD5jFAYaRdS
 ASfO2YK/nfP7J2UU0i4vCgG6PRmQ9gZhz+euHBNvxyRuPqjvV64wFRfTcXzyMcXpDLz68NOz72n
 Xu35d7YUCul1psTYPgQVQo/Zc+v4FY5GHHAQINqtsqsGqXCc1uh3GLGydntlDwl4lmf6gqzrcty
 iGHS0a0CRN+qzN670MLzNzGBK4Y1H46Po6rpEGju/T+ZK6tPGHVtoF46llwuFJylq1ZOk5+aU8k
 sNdJX8ZlCrZ67Zst9RBtcTqTdW+IVQ==
X-Proofpoint-GUID: _z6Egf5EpWftpzgrZPZHNvCFSY_0xvIl
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68ece63e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8
 a=yEquWHxyAAAA:8 a=A1X0JdhQAAAA:8 a=t7CeM3EgAAAA:8 a=d8oaZizm7QLjo4qtjSwA:9
 a=s5zKW874KtQA:10 a=_j3XSMEICZ-j_p4bQif0:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Soy3cZ2v3rD3IzUh-QDm:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-ORIG-GUID: _z6Egf5EpWftpzgrZPZHNvCFSY_0xvIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510130053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224778

Reference:
	https://nvd.nist.gov/vuln/detail/CVE-2025-9375
	https://security-tracker.debian.org/tracker/CVE-2025-9375

Upstream-patch:
	https://github.com/martinblech/xmltodict/commit/ecd456ab88d379514b116ef9293318b74e5ed3ee
	https://github.com/martinblech/xmltodict/commit/f98c90f071228ed73df997807298e1df4f790c33

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../python3-xmltodict/CVE-2025-9375-01.patch  | 113 +++++++++++
 .../python3-xmltodict/CVE-2025-9375-02.patch  | 178 ++++++++++++++++++
 .../python/python3-xmltodict_0.14.2.bb        |   4 +
 3 files changed, 295 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-01.patch
 create mode 100644 meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-02.patch

diff --git a/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-01.patch b/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-01.patch
new file mode 100644
index 0000000000..7835dc9f51
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-01.patch
@@ -0,0 +1,113 @@
+From ecd456ab88d379514b116ef9293318b74e5ed3ee Mon Sep 17 00:00:00 2001
+From: Martin Blech <78768+martinblech@users.noreply.github.com>
+Date: Thu, 4 Sep 2025 17:25:39 -0700
+Subject: [PATCH] Prevent XML injection: reject '<'/'>' in element/attr names
+ (incl. @xmlns)
+
+* Add tests for tag names, attribute names, and @xmlns prefixes; confirm attr values are escaped.
+
+CVE: CVE-2025-9375
+
+Upstream-Status: Backport
+https://github.com/martinblech/xmltodict/commit/ecd456ab88d379514b116ef9293318b74e5ed3ee
+
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+
+---
+ tests/test_dicttoxml.py | 32 ++++++++++++++++++++++++++++++++
+ xmltodict.py            | 20 +++++++++++++++++++-
+ 2 files changed, 51 insertions(+), 1 deletion(-)
+
+diff --git a/tests/test_dicttoxml.py b/tests/test_dicttoxml.py
+index 470aca9..67e3a88 100644
+--- a/tests/test_dicttoxml.py
++++ b/tests/test_dicttoxml.py
+@@ -231,3 +231,35 @@ xmlns:b="http://b.com/"><x a:attr="val">1</x><a:y>2</a:y><b:z>3</b:z></root>'''
+         expected_xml = '<?xml version="1.0" encoding="utf-8"?>\n<x>false</x>'
+         xml = unparse(dict(x=False))
+         self.assertEqual(xml, expected_xml)
++
++    def test_rejects_tag_name_with_angle_brackets(self):
++        # Minimal guard: disallow '<' or '>' to prevent breaking tag context
++        with self.assertRaises(ValueError):
++            unparse({"m><tag>content</tag": "unsafe"}, full_document=False)
++
++    def test_rejects_attribute_name_with_angle_brackets(self):
++        # Now we expect bad attribute names to be rejected
++        with self.assertRaises(ValueError):
++            unparse(
++                {"a": {"@m><tag>content</tag": "unsafe", "#text": "x"}},
++                full_document=False,
++            )
++
++    def test_rejects_malicious_xmlns_prefix(self):
++        # xmlns prefixes go under @xmlns mapping; reject angle brackets in prefix
++        with self.assertRaises(ValueError):
++            unparse(
++                {
++                    "a": {
++                        "@xmlns": {"m><bad": "http://example.com/"},
++                        "#text": "x",
++                    }
++                },
++                full_document=False,
++            )
++
++    def test_attribute_values_with_angle_brackets_are_escaped(self):
++        # Attribute values should be escaped by XMLGenerator
++        xml = unparse({"a": {"@attr": "1<middle>2", "#text": "x"}}, full_document=False)
++        # The generated XML should contain escaped '<' and '>' within the attribute value
++        self.assertIn('attr="1&lt;middle&gt;2"', xml)
+diff --git a/xmltodict.py b/xmltodict.py
+index 098f627..9fb249d 100755
+--- a/xmltodict.py
++++ b/xmltodict.py
+@@ -360,6 +360,14 @@ def parse(xml_input, encoding=None, expat=expat, process_namespaces=False,
+     return handler.item
+ 
+ 
++def _has_angle_brackets(value):
++    """Return True if value (a str) contains '<' or '>'.
++
++    Non-string values return False. Uses fast substring checks implemented in C.
++    """
++    return isinstance(value, str) and ("<" in value or ">" in value)
++
++
+ def _process_namespace(name, namespaces, ns_sep=':', attr_prefix='@'):
+     if not namespaces:
+         return name
+@@ -393,6 +401,9 @@ def _emit(key, value, content_handler,
+         if result is None:
+             return
+         key, value = result
++    # Minimal validation to avoid breaking out of tag context
++    if _has_angle_brackets(key):
++        raise ValueError('Invalid element name: "<" or ">" not allowed')
+     if not hasattr(value, '__iter__') or isinstance(value, (str, dict)):
+         value = [value]
+     for index, v in enumerate(value):
+@@ -421,12 +432,19 @@ def _emit(key, value, content_handler,
+                                         attr_prefix)
+                 if ik == '@xmlns' and isinstance(iv, dict):
+                     for k, v in iv.items():
++                        if _has_angle_brackets(k):
++                            raise ValueError(
++                                'Invalid attribute name: "<" or ">" not allowed'
++                            )
+                         attr = 'xmlns{}'.format(f':{k}' if k else '')
+                         attrs[attr] = str(v)
+                     continue
+                 if not isinstance(iv, str):
+                     iv = str(iv)
+-                attrs[ik[len(attr_prefix):]] = iv
++                attr_name = ik[len(attr_prefix) :]
++                if _has_angle_brackets(attr_name):
++                    raise ValueError('Invalid attribute name: "<" or ">" not allowed')
++                attrs[attr_name] = iv
+                 continue
+             children.append((ik, iv))
+         if isinstance(indent, int):
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-02.patch b/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-02.patch
new file mode 100644
index 0000000000..d8cd83469a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-02.patch
@@ -0,0 +1,178 @@
+From f98c90f071228ed73df997807298e1df4f790c33 Mon Sep 17 00:00:00 2001
+From: Martin Blech <78768+martinblech@users.noreply.github.com>
+Date: Mon, 8 Sep 2025 11:18:33 -0700
+Subject: [PATCH] Enhance unparse() XML name validation with stricter rules and
+ tests
+
+Extend existing validation (previously only for "<" and ">") to also
+reject element, attribute, and xmlns prefix names that are non-string,
+start with "?" or "!", or contain "/", spaces, tabs, or newlines.
+Update _emit and namespace handling to use _validate_name. Add tests
+covering these new invalid name cases.
+
+CVE: CVE-2025-9375
+
+Upstream-Status: Backport
+https://github.com/martinblech/xmltodict/commit/f98c90f071228ed73df997807298e1df4f790c33
+
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ tests/test_dicttoxml.py | 60 +++++++++++++++++++++++++++++++++++++++++
+ xmltodict.py            | 48 ++++++++++++++++++++++++++-------
+ 2 files changed, 99 insertions(+), 9 deletions(-)
+
+diff --git a/tests/test_dicttoxml.py b/tests/test_dicttoxml.py
+index 67e3a88..180d767 100644
+--- a/tests/test_dicttoxml.py
++++ b/tests/test_dicttoxml.py
+@@ -263,3 +263,63 @@ xmlns:b="http://b.com/"><x a:attr="val">1</x><a:y>2</a:y><b:z>3</b:z></root>'''
+         xml = unparse({"a": {"@attr": "1<middle>2", "#text": "x"}}, full_document=False)
+         # The generated XML should contain escaped '<' and '>' within the attribute value
+         self.assertIn('attr="1&lt;middle&gt;2"', xml)
++
++    def test_rejects_tag_name_starting_with_question(self):
++        with self.assertRaises(ValueError):
++            unparse({"?pi": "data"}, full_document=False)
++
++    def test_rejects_tag_name_starting_with_bang(self):
++        with self.assertRaises(ValueError):
++            unparse({"!decl": "data"}, full_document=False)
++
++    def test_rejects_attribute_name_starting_with_question(self):
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@?weird": "x"}}, full_document=False)
++
++    def test_rejects_attribute_name_starting_with_bang(self):
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@!weird": "x"}}, full_document=False)
++
++    def test_rejects_xmlns_prefix_starting_with_question_or_bang(self):
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@xmlns": {"?p": "http://e/"}}}, full_document=False)
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@xmlns": {"!p": "http://e/"}}}, full_document=False)
++
++    def test_rejects_non_string_names(self):
++        class Weird:
++            def __str__(self):
++                return "bad>name"
++
++        # Non-string element key
++        with self.assertRaises(ValueError):
++            unparse({Weird(): "x"}, full_document=False)
++        # Non-string attribute key
++        with self.assertRaises(ValueError):
++            unparse({"a": {Weird(): "x"}}, full_document=False)
++
++    def test_rejects_tag_name_with_slash(self):
++        with self.assertRaises(ValueError):
++            unparse({"bad/name": "x"}, full_document=False)
++
++    def test_rejects_tag_name_with_whitespace(self):
++        for name in ["bad name", "bad\tname", "bad\nname"]:
++            with self.assertRaises(ValueError):
++                unparse({name: "x"}, full_document=False)
++
++    def test_rejects_attribute_name_with_slash(self):
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@bad/name": "x"}}, full_document=False)
++
++    def test_rejects_attribute_name_with_whitespace(self):
++        for name in ["@bad name", "@bad\tname", "@bad\nname"]:
++            with self.assertRaises(ValueError):
++                unparse({"a": {name: "x"}}, full_document=False)
++
++    def test_rejects_xmlns_prefix_with_slash_or_whitespace(self):
++        # Slash
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@xmlns": {"bad/prefix": "http://e/"}}}, full_document=False)
++        # Whitespace
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@xmlns": {"bad prefix": "http://e/"}}}, full_document=False)
+diff --git a/xmltodict.py b/xmltodict.py
+index c8491b3..7b7f8a8 100755
+--- a/xmltodict.py
++++ b/xmltodict.py
+@@ -368,7 +368,42 @@ def _has_angle_brackets(value):
+     return isinstance(value, str) and ("<" in value or ">" in value)
+ 
+ 
++def _has_invalid_name_chars(value):
++    """Return True if value (a str) contains any disallowed name characters.
++
++    Disallowed: '<', '>', '/', or any whitespace character.
++    Non-string values return False.
++    """
++    if not isinstance(value, str):
++        return False
++    if "<" in value or ">" in value or "/" in value:
++        return True
++    # Check for any whitespace (spaces, tabs, newlines, etc.)
++    return any(ch.isspace() for ch in value)
++
++
++def _validate_name(value, kind):
++    """Validate an element/attribute name for XML safety.
++
++    Raises ValueError with a specific reason when invalid.
++
++    kind: 'element' or 'attribute' (used in error messages)
++    """
++    if not isinstance(value, str):
++        raise ValueError(f"{kind} name must be a string")
++    if value.startswith("?") or value.startswith("!"):
++        raise ValueError(f'Invalid {kind} name: cannot start with "?" or "!"')
++    if "<" in value or ">" in value:
++        raise ValueError(f'Invalid {kind} name: "<" or ">" not allowed')
++    if "/" in value:
++        raise ValueError(f'Invalid {kind} name: "/" not allowed')
++    if any(ch.isspace() for ch in value):
++        raise ValueError(f"Invalid {kind} name: whitespace not allowed")
++
++
+ def _process_namespace(name, namespaces, ns_sep=':', attr_prefix='@'):
++    if not isinstance(name, str):
++        return name
+     if not namespaces:
+         return name
+     try:
+@@ -402,8 +437,7 @@ def _emit(key, value, content_handler,
+             return
+         key, value = result
+     # Minimal validation to avoid breaking out of tag context
+-    if _has_angle_brackets(key):
+-        raise ValueError('Invalid element name: "<" or ">" not allowed')
++    _validate_name(key, "element")
+     if not hasattr(value, '__iter__') or isinstance(value, (str, dict)):
+         value = [value]
+     for index, v in enumerate(value):
+@@ -427,23 +461,19 @@ def _emit(key, value, content_handler,
+             if ik == cdata_key:
+                 cdata = iv
+                 continue
+-            if ik.startswith(attr_prefix):
++            if isinstance(ik, str) and ik.startswith(attr_prefix):
+                 ik = _process_namespace(ik, namespaces, namespace_separator,
+                                         attr_prefix)
+                 if ik == '@xmlns' and isinstance(iv, dict):
+                     for k, v in iv.items():
+-                        if _has_angle_brackets(k):
+-                            raise ValueError(
+-                                'Invalid attribute name: "<" or ">" not allowed'
+-                            )
++                        _validate_name(k, "attribute")
+                         attr = 'xmlns{}'.format(f':{k}' if k else '')
+                         attrs[attr] = str(v)
+                     continue
+                 if not isinstance(iv, str):
+                     iv = str(iv)
+                 attr_name = ik[len(attr_prefix) :]
+-                if _has_angle_brackets(attr_name):
+-                    raise ValueError('Invalid attribute name: "<" or ">" not allowed')
++                _validate_name(attr_name, "attribute")
+                 attrs[attr_name] = iv
+                 continue
+             children.append((ik, iv))
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb b/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
index 56cdf6ff4a..3cacb72f26 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
@@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
 SRC_URI[sha256sum] = "201e7c28bb210e374999d1dde6382923ab0ed1a8a5faeece48ab525b7810a553"
 
+SRC_URI += " \
+	file://CVE-2025-9375-01.patch \
+	file://CVE-2025-9375-02.patch"
+
 PYPI_PACKAGE = "xmltodict"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.49.1


