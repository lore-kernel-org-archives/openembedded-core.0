Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451D5FA3758
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 06:41:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9349.1726641657518079579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 23:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9991138e0b=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48I50Nw2005366
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 06:40:56 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n1f9bt3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 06:40:55 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 23:40:52 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH v2] python3: Upgrade 3.10.14 -> 3.10.15
Date: Wed, 18 Sep 2024 06:40:30 +0000
Message-ID: <20240918064030.2778832-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: TI7ObI5-C8Mb78FDcW7-aSM0VQauKw3F
X-Authority-Analysis: v=2.4 cv=afUzngot c=1 sm=1 tr=0 ts=66ea75f8 cx=c_pps p=0DMlDUsRAAAA:8 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=8AHkEIZyAAAA:8
 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=fk1lIlRQAAAA:8 a=A1X0JdhQAAAA:8 a=QIhr-27iAAAA:8 a=OK-8mIdLAAAA:8 a=RgBw9RmQAAAA:8 a=OMKkimDRAAAA:8 a=Crg_IfaRAAAA:8 a=CqVxSF2spDrYHXSBxq8A:9 a=pgVgQ45geyvIt6ze:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=U75ogvRika4pmaD_UPO0:22 a=cgaYBWEFosGJW4rWv5Lf:22 a=bPPIUcp-n4lFe3GeRkWd:22 a=6rNxHmeHjkgHr7B4uqBA:22 a=WKt6puP8o2WZ-s9Jsdj1:22 a=168rQcPrDVj8xHztDHWJ:22
X-Proofpoint-GUID: TI7ObI5-C8Mb78FDcW7-aSM0VQauKw3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_05,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam authscore=99 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409180039
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48I50Nw2005366
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 06:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204634

From: Divya Chellam <divya.chellam@windriver.com>

Includes security fixes for CVE-2024-4030, CVE-2024-7592, CVE-2024-4032, =
CVE-2024-8088
CVE-2024-6232, CVE-2024-6923, CVE-2023-27043 and other bug fixes.

Removed below patches, as the fixes included in 3.10.15 upgrade:
1. CVE-2023-27043.patch
2. CVE-2024-6232.patch
3. CVE-2024-7592.patch
4. CVE-2024-8088.patch

Release Notes:
https://www.python.org/downloads/release/python-31015/

(LOCAL REV: NOT UPSTREAM) -- Will send to oe-core

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../python/python3/CVE-2023-27043.patch       | 510 ------------------
 .../python/python3/CVE-2024-6232.patch        | 251 ---------
 .../python/python3/CVE-2024-7592.patch        | 140 -----
 .../python/python3/CVE-2024-8088.patch        | 124 -----
 ...{python3_3.10.14.bb =3D> python3_3.10.15.bb} |   6 +-
 5 files changed, 1 insertion(+), 1030 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2023-27043.p=
atch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-6232.pa=
tch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-7592.pa=
tch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-8088.pa=
tch
 rename meta/recipes-devtools/python/{python3_3.10.14.bb =3D> python3_3.1=
0.15.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2023-27043.patch b/=
meta/recipes-devtools/python/python3/CVE-2023-27043.patch
deleted file mode 100644
index d27afc41a9..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2023-27043.patch
+++ /dev/null
@@ -1,510 +0,0 @@
-From 2a9273a0e4466e2f057f9ce6fe98cd8ce570331b Mon Sep 17 00:00:00 2001
-From: Petr Viktorin <encukou@gmail.com>
-Date: Fri, 6 Sep 2024 13:14:22 +0200
-Subject: [PATCH] [3.10] [CVE-2023-27043] gh-102988: Reject malformed add=
resses
- in email.parseaddr() (GH-111116) (#123768)
-
-Detect email address parsing errors and return empty tuple to
-indicate the parsing error (old API). Add an optional 'strict'
-parameter to getaddresses() and parseaddr() functions. Patch by
-Thomas Dwyer.
-
-(cherry picked from commit 4a153a1d3b18803a684cd1bcc2cdf3ede3dbae19)
-
-Co-authored-by: Victor Stinner <vstinner@python.org>
-Co-Authored-By: Thomas Dwyer <github@tomd.tel>
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/2a92=
73a0e4466e2f057f9ce6fe98cd8ce570331b]
-CVE: CVE-2023-27043
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- Doc/library/email.utils.rst                   |  19 +-
- Lib/email/utils.py                            | 151 ++++++++++++-
- Lib/test/test_email/test_email.py             | 204 +++++++++++++++++-
- ...-10-20-15-28-08.gh-issue-102988.dStNO7.rst |   8 +
- 4 files changed, 361 insertions(+), 21 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Library/2023-10-20-15-28-08.gh-issu=
e-102988.dStNO7.rst
-
-diff --git a/Doc/library/email.utils.rst b/Doc/library/email.utils.rst
-index 0e266b6..65948fb 100644
---- a/Doc/library/email.utils.rst
-+++ b/Doc/library/email.utils.rst
-@@ -60,13 +60,18 @@ of the new API.
-    begins with angle brackets, they are stripped off.
-=20
-=20
--.. function:: parseaddr(address)
-+.. function:: parseaddr(address, *, strict=3DTrue)
-=20
-    Parse address -- which should be the value of some address-containin=
g field such
-    as :mailheader:`To` or :mailheader:`Cc` -- into its constituent *rea=
lname* and
-    *email address* parts.  Returns a tuple of that information, unless =
the parse
-    fails, in which case a 2-tuple of ``('', '')`` is returned.
-=20
-+   If *strict* is true, use a strict parser which rejects malformed inp=
uts.
-+
-+   .. versionchanged:: 3.10.15
-+      Add *strict* optional parameter and reject malformed inputs by de=
fault.
-+
-=20
- .. function:: formataddr(pair, charset=3D'utf-8')
-=20
-@@ -84,12 +89,15 @@ of the new API.
-       Added the *charset* option.
-=20
-=20
--.. function:: getaddresses(fieldvalues)
-+.. function:: getaddresses(fieldvalues, *, strict=3DTrue)
-=20
-    This method returns a list of 2-tuples of the form returned by ``par=
seaddr()``.
-    *fieldvalues* is a sequence of header field values as might be retur=
ned by
--   :meth:`Message.get_all <email.message.Message.get_all>`.  Here's a s=
imple
--   example that gets all the recipients of a message::
-+   :meth:`Message.get_all <email.message.Message.get_all>`.
-+
-+   If *strict* is true, use a strict parser which rejects malformed inp=
uts.
-+
-+   Here's a simple example that gets all the recipients of a message::
-=20
-       from email.utils import getaddresses
-=20
-@@ -99,6 +107,9 @@ of the new API.
-       resent_ccs =3D msg.get_all('resent-cc', [])
-       all_recipients =3D getaddresses(tos + ccs + resent_tos + resent_c=
cs)
-=20
-+   .. versionchanged:: 3.10.15
-+      Add *strict* optional parameter and reject malformed inputs by de=
fault.
-+
-=20
- .. function:: parsedate(date)
-=20
-diff --git a/Lib/email/utils.py b/Lib/email/utils.py
-index cfdfeb3..9522341 100644
---- a/Lib/email/utils.py
-+++ b/Lib/email/utils.py
-@@ -48,6 +48,7 @@ TICK =3D "'"
- specialsre =3D re.compile(r'[][\\()<>@,:;".]')
- escapesre =3D re.compile(r'[\\"]')
-=20
-+
- def _has_surrogates(s):
-     """Return True if s contains surrogate-escaped binary data."""
-     # This check is based on the fact that unless there are surrogates,=
 utf8
-@@ -106,12 +107,127 @@ def formataddr(pair, charset=3D'utf-8'):
-     return address
-=20
-=20
-+def _iter_escaped_chars(addr):
-+    pos =3D 0
-+    escape =3D False
-+    for pos, ch in enumerate(addr):
-+        if escape:
-+            yield (pos, '\\' + ch)
-+            escape =3D False
-+        elif ch =3D=3D '\\':
-+            escape =3D True
-+        else:
-+            yield (pos, ch)
-+    if escape:
-+        yield (pos, '\\')
-+
-+
-+def _strip_quoted_realnames(addr):
-+    """Strip real names between quotes."""
-+    if '"' not in addr:
-+        # Fast path
-+        return addr
-+
-+    start =3D 0
-+    open_pos =3D None
-+    result =3D []
-+    for pos, ch in _iter_escaped_chars(addr):
-+        if ch =3D=3D '"':
-+            if open_pos is None:
-+                open_pos =3D pos
-+            else:
-+                if start !=3D open_pos:
-+                    result.append(addr[start:open_pos])
-+                start =3D pos + 1
-+                open_pos =3D None
-+
-+    if start < len(addr):
-+        result.append(addr[start:])
-+
-+    return ''.join(result)
-=20
--def getaddresses(fieldvalues):
--    """Return a list of (REALNAME, EMAIL) for each fieldvalue."""
--    all =3D COMMASPACE.join(str(v) for v in fieldvalues)
--    a =3D _AddressList(all)
--    return a.addresslist
-+
-+supports_strict_parsing =3D True
-+
-+def getaddresses(fieldvalues, *, strict=3DTrue):
-+    """Return a list of (REALNAME, EMAIL) or ('','') for each fieldvalu=
e.
-+
-+    When parsing fails for a fieldvalue, a 2-tuple of ('', '') is retur=
ned in
-+    its place.
-+
-+    If strict is true, use a strict parser which rejects malformed inpu=
ts.
-+    """
-+
-+    # If strict is true, if the resulting list of parsed addresses is g=
reater
-+    # than the number of fieldvalues in the input list, a parsing error=
 has
-+    # occurred and consequently a list containing a single empty 2-tupl=
e [('',
-+    # '')] is returned in its place. This is done to avoid invalid outp=
ut.
-+    #
-+    # Malformed input: getaddresses(['alice@example.com <bob@example.co=
m>'])
-+    # Invalid output: [('', 'alice@example.com'), ('', 'bob@example.com=
')]
-+    # Safe output: [('', '')]
-+
-+    if not strict:
-+        all =3D COMMASPACE.join(str(v) for v in fieldvalues)
-+        a =3D _AddressList(all)
-+        return a.addresslist
-+
-+    fieldvalues =3D [str(v) for v in fieldvalues]
-+    fieldvalues =3D _pre_parse_validation(fieldvalues)
-+    addr =3D COMMASPACE.join(fieldvalues)
-+    a =3D _AddressList(addr)
-+    result =3D _post_parse_validation(a.addresslist)
-+
-+    # Treat output as invalid if the number of addresses is not equal t=
o the
-+    # expected number of addresses.
-+    n =3D 0
-+    for v in fieldvalues:
-+        # When a comma is used in the Real Name part it is not a delimi=
nator.
-+        # So strip those out before counting the commas.
-+        v =3D _strip_quoted_realnames(v)
-+        # Expected number of addresses: 1 + number of commas
-+        n +=3D 1 + v.count(',')
-+    if len(result) !=3D n:
-+        return [('', '')]
-+
-+    return result
-+
-+
-+def _check_parenthesis(addr):
-+    # Ignore parenthesis in quoted real names.
-+    addr =3D _strip_quoted_realnames(addr)
-+
-+    opens =3D 0
-+    for pos, ch in _iter_escaped_chars(addr):
-+        if ch =3D=3D '(':
-+            opens +=3D 1
-+        elif ch =3D=3D ')':
-+            opens -=3D 1
-+            if opens < 0:
-+                return False
-+    return (opens =3D=3D 0)
-+
-+
-+def _pre_parse_validation(email_header_fields):
-+    accepted_values =3D []
-+    for v in email_header_fields:
-+        if not _check_parenthesis(v):
-+            v =3D "('', '')"
-+        accepted_values.append(v)
-+
-+    return accepted_values
-+
-+
-+def _post_parse_validation(parsed_email_header_tuples):
-+    accepted_values =3D []
-+    # The parser would have parsed a correctly formatted domain-literal
-+    # The existence of an [ after parsing indicates a parsing failure
-+    for v in parsed_email_header_tuples:
-+        if '[' in v[1]:
-+            v =3D ('', '')
-+        accepted_values.append(v)
-+
-+    return accepted_values
-=20
-=20
- def _format_timetuple_and_zone(timetuple, zone):
-@@ -205,16 +321,33 @@ def parsedate_to_datetime(data):
-             tzinfo=3Ddatetime.timezone(datetime.timedelta(seconds=3Dtz)=
))
-=20
-=20
--def parseaddr(addr):
-+def parseaddr(addr, *, strict=3DTrue):
-     """
-     Parse addr into its constituent realname and email address parts.
-=20
-     Return a tuple of realname and email address, unless the parse fail=
s, in
-     which case return a 2-tuple of ('', '').
-+
-+    If strict is True, use a strict parser which rejects malformed inpu=
ts.
-     """
--    addrs =3D _AddressList(addr).addresslist
--    if not addrs:
--        return '', ''
-+    if not strict:
-+        addrs =3D _AddressList(addr).addresslist
-+        if not addrs:
-+            return ('', '')
-+        return addrs[0]
-+
-+    if isinstance(addr, list):
-+        addr =3D addr[0]
-+
-+    if not isinstance(addr, str):
-+        return ('', '')
-+
-+    addr =3D _pre_parse_validation([addr])[0]
-+    addrs =3D _post_parse_validation(_AddressList(addr).addresslist)
-+
-+    if not addrs or len(addrs) > 1:
-+        return ('', '')
-+
-     return addrs[0]
-=20
-=20
-diff --git a/Lib/test/test_email/test_email.py b/Lib/test/test_email/tes=
t_email.py
-index 8b16cca..5b19bb3 100644
---- a/Lib/test/test_email/test_email.py
-+++ b/Lib/test/test_email/test_email.py
-@@ -16,6 +16,7 @@ from unittest.mock import patch
-=20
- import email
- import email.policy
-+import email.utils
-=20
- from email.charset import Charset
- from email.generator import Generator, DecodedGenerator, BytesGenerator
-@@ -3288,15 +3289,154 @@ Foo
-            [('Al Person', 'aperson@dom.ain'),
-             ('Bud Person', 'bperson@dom.ain')])
-=20
-+    def test_getaddresses_comma_in_name(self):
-+        """GH-106669 regression test."""
-+        self.assertEqual(
-+            utils.getaddresses(
-+                [
-+                    '"Bud, Person" <bperson@dom.ain>',
-+                    'aperson@dom.ain (Al Person)',
-+                    '"Mariusz Felisiak" <to@example.com>',
-+                ]
-+            ),
-+            [
-+                ('Bud, Person', 'bperson@dom.ain'),
-+                ('Al Person', 'aperson@dom.ain'),
-+                ('Mariusz Felisiak', 'to@example.com'),
-+            ],
-+        )
-+
-+    def test_parsing_errors(self):
-+        """Test for parsing errors from CVE-2023-27043 and CVE-2019-160=
56"""
-+        alice =3D 'alice@example.org'
-+        bob =3D 'bob@example.com'
-+        empty =3D ('', '')
-+
-+        # Test utils.getaddresses() and utils.parseaddr() on malformed =
email
-+        # addresses: default behavior (strict=3DTrue) rejects malformed=
 address,
-+        # and strict=3DFalse which tolerates malformed address.
-+        for invalid_separator, expected_non_strict in (
-+            ('(', [(f'<{bob}>', alice)]),
-+            (')', [('', alice), empty, ('', bob)]),
-+            ('<', [('', alice), empty, ('', bob), empty]),
-+            ('>', [('', alice), empty, ('', bob)]),
-+            ('[', [('', f'{alice}[<{bob}>]')]),
-+            (']', [('', alice), empty, ('', bob)]),
-+            ('@', [empty, empty, ('', bob)]),
-+            (';', [('', alice), empty, ('', bob)]),
-+            (':', [('', alice), ('', bob)]),
-+            ('.', [('', alice + '.'), ('', bob)]),
-+            ('"', [('', alice), ('', f'<{bob}>')]),
-+        ):
-+            address =3D f'{alice}{invalid_separator}<{bob}>'
-+            with self.subTest(address=3Daddress):
-+                self.assertEqual(utils.getaddresses([address]),
-+                                 [empty])
-+                self.assertEqual(utils.getaddresses([address], strict=3D=
False),
-+                                 expected_non_strict)
-+
-+                self.assertEqual(utils.parseaddr([address]),
-+                                 empty)
-+                self.assertEqual(utils.parseaddr([address], strict=3DFa=
lse),
-+                                 ('', address))
-+
-+        # Comma (',') is treated differently depending on strict parame=
ter.
-+        # Comma without quotes.
-+        address =3D f'{alice},<{bob}>'
-+        self.assertEqual(utils.getaddresses([address]),
-+                         [('', alice), ('', bob)])
-+        self.assertEqual(utils.getaddresses([address], strict=3DFalse),
-+                         [('', alice), ('', bob)])
-+        self.assertEqual(utils.parseaddr([address]),
-+                         empty)
-+        self.assertEqual(utils.parseaddr([address], strict=3DFalse),
-+                         ('', address))
-+
-+        # Real name between quotes containing comma.
-+        address =3D '"Alice, alice@example.org" <bob@example.com>'
-+        expected_strict =3D ('Alice, alice@example.org', 'bob@example.c=
om')
-+        self.assertEqual(utils.getaddresses([address]), [expected_stric=
t])
-+        self.assertEqual(utils.getaddresses([address], strict=3DFalse),=
 [expected_strict])
-+        self.assertEqual(utils.parseaddr([address]), expected_strict)
-+        self.assertEqual(utils.parseaddr([address], strict=3DFalse),
-+                         ('', address))
-+
-+        # Valid parenthesis in comments.
-+        address =3D 'alice@example.org (Alice)'
-+        expected_strict =3D ('Alice', 'alice@example.org')
-+        self.assertEqual(utils.getaddresses([address]), [expected_stric=
t])
-+        self.assertEqual(utils.getaddresses([address], strict=3DFalse),=
 [expected_strict])
-+        self.assertEqual(utils.parseaddr([address]), expected_strict)
-+        self.assertEqual(utils.parseaddr([address], strict=3DFalse),
-+                         ('', address))
-+
-+        # Invalid parenthesis in comments.
-+        address =3D 'alice@example.org )Alice('
-+        self.assertEqual(utils.getaddresses([address]), [empty])
-+        self.assertEqual(utils.getaddresses([address], strict=3DFalse),
-+                         [('', 'alice@example.org'), ('', ''), ('', 'Al=
ice')])
-+        self.assertEqual(utils.parseaddr([address]), empty)
-+        self.assertEqual(utils.parseaddr([address], strict=3DFalse),
-+                         ('', address))
-+
-+        # Two addresses with quotes separated by comma.
-+        address =3D '"Jane Doe" <jane@example.net>, "John Doe" <john@ex=
ample.net>'
-+        self.assertEqual(utils.getaddresses([address]),
-+                         [('Jane Doe', 'jane@example.net'),
-+                          ('John Doe', 'john@example.net')])
-+        self.assertEqual(utils.getaddresses([address], strict=3DFalse),
-+                         [('Jane Doe', 'jane@example.net'),
-+                          ('John Doe', 'john@example.net')])
-+        self.assertEqual(utils.parseaddr([address]), empty)
-+        self.assertEqual(utils.parseaddr([address], strict=3DFalse),
-+                         ('', address))
-+
-+        # Test email.utils.supports_strict_parsing attribute
-+        self.assertEqual(email.utils.supports_strict_parsing, True)
-+
-     def test_getaddresses_nasty(self):
--        eq =3D self.assertEqual
--        eq(utils.getaddresses(['foo: ;']), [('', '')])
--        eq(utils.getaddresses(
--           ['[]*-- =3D~$']),
--           [('', ''), ('', ''), ('', '*--')])
--        eq(utils.getaddresses(
--           ['foo: ;', '"Jason R. Mastaler" <jason@dom.ain>']),
--           [('', ''), ('Jason R. Mastaler', 'jason@dom.ain')])
-+        for addresses, expected in (
-+            (['"S=C3=BCrname, Firstname" <to@example.com>'],
-+             [('S=C3=BCrname, Firstname', 'to@example.com')]),
-+
-+            (['foo: ;'],
-+             [('', '')]),
-+
-+            (['foo: ;', '"Jason R. Mastaler" <jason@dom.ain>'],
-+             [('', ''), ('Jason R. Mastaler', 'jason@dom.ain')]),
-+
-+            ([r'Pete(A nice \) chap) <pete(his account)@silly.test(his =
host)>'],
-+             [('Pete (A nice ) chap his account his host)', 'pete@silly=
.test')]),
-+
-+            (['(Empty list)(start)Undisclosed recipients  :(nobody(I kn=
ow))'],
-+             [('', '')]),
-+
-+            (['Mary <@machine.tld:mary@example.net>, , jdoe@test   . ex=
ample'],
-+             [('Mary', 'mary@example.net'), ('', ''), ('', 'jdoe@test.e=
xample')]),
-+
-+            (['John Doe <jdoe@machine(comment).  example>'],
-+             [('John Doe (comment)', 'jdoe@machine.example')]),
-+
-+            (['"Mary Smith: Personal Account" <smith@home.example>'],
-+             [('Mary Smith: Personal Account', 'smith@home.example')]),
-+
-+            (['Undisclosed recipients:;'],
-+             [('', '')]),
-+
-+            ([r'<boss@nil.test>, "Giant; \"Big\" Box" <bob@example.net>=
'],
-+             [('', 'boss@nil.test'), ('Giant; "Big" Box', 'bob@example.=
net')]),
-+        ):
-+            with self.subTest(addresses=3Daddresses):
-+                self.assertEqual(utils.getaddresses(addresses),
-+                                 expected)
-+                self.assertEqual(utils.getaddresses(addresses, strict=3D=
False),
-+                                 expected)
-+
-+        addresses =3D ['[]*-- =3D~$']
-+        self.assertEqual(utils.getaddresses(addresses),
-+                         [('', '')])
-+        self.assertEqual(utils.getaddresses(addresses, strict=3DFalse),
-+                         [('', ''), ('', ''), ('', '*--')])
-=20
-     def test_getaddresses_embedded_comment(self):
-         """Test proper handling of a nested comment"""
-@@ -3485,6 +3625,54 @@ multipart/report
-                 m =3D cls(*constructor, policy=3Demail.policy.default)
-                 self.assertIs(m.policy, email.policy.default)
-=20
-+    def test_iter_escaped_chars(self):
-+        self.assertEqual(list(utils._iter_escaped_chars(r'a\\b\"c\\"d')=
),
-+                         [(0, 'a'),
-+                          (2, '\\\\'),
-+                          (3, 'b'),
-+                          (5, '\\"'),
-+                          (6, 'c'),
-+                          (8, '\\\\'),
-+                          (9, '"'),
-+                          (10, 'd')])
-+        self.assertEqual(list(utils._iter_escaped_chars('a\\')),
-+                         [(0, 'a'), (1, '\\')])
-+
-+    def test_strip_quoted_realnames(self):
-+        def check(addr, expected):
-+            self.assertEqual(utils._strip_quoted_realnames(addr), expec=
ted)
-+
-+        check('"Jane Doe" <jane@example.net>, "John Doe" <john@example.=
net>',
-+              ' <jane@example.net>,  <john@example.net>')
-+        check(r'"Jane \"Doe\"." <jane@example.net>',
-+              ' <jane@example.net>')
-+
-+        # special cases
-+        check(r'before"name"after', 'beforeafter')
-+        check(r'before"name"', 'before')
-+        check(r'b"name"', 'b')  # single char
-+        check(r'"name"after', 'after')
-+        check(r'"name"a', 'a')  # single char
-+        check(r'"name"', '')
-+
-+        # no change
-+        for addr in (
-+            'Jane Doe <jane@example.net>, John Doe <john@example.net>',
-+            'lone " quote',
-+        ):
-+            self.assertEqual(utils._strip_quoted_realnames(addr), addr)
-+
-+
-+    def test_check_parenthesis(self):
-+        addr =3D 'alice@example.net'
-+        self.assertTrue(utils._check_parenthesis(f'{addr} (Alice)'))
-+        self.assertFalse(utils._check_parenthesis(f'{addr} )Alice('))
-+        self.assertFalse(utils._check_parenthesis(f'{addr} (Alice))'))
-+        self.assertFalse(utils._check_parenthesis(f'{addr} ((Alice)'))
-+
-+        # Ignore real name between quotes
-+        self.assertTrue(utils._check_parenthesis(f'")Alice((" {addr}'))
-+
-=20
- # Test the iterator/generators
- class TestIterators(TestEmailBase):
-diff --git a/Misc/NEWS.d/next/Library/2023-10-20-15-28-08.gh-issue-10298=
8.dStNO7.rst b/Misc/NEWS.d/next/Library/2023-10-20-15-28-08.gh-issue-1029=
88.dStNO7.rst
-new file mode 100644
-index 0000000..3d0e9e4
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2023-10-20-15-28-08.gh-issue-102988.dStNO=
7.rst
-@@ -0,0 +1,8 @@
-+:func:`email.utils.getaddresses` and :func:`email.utils.parseaddr` now
-+return ``('', '')`` 2-tuples in more situations where invalid email
-+addresses are encountered instead of potentially inaccurate values. Add
-+optional *strict* parameter to these two functions: use ``strict=3DFals=
e`` to
-+get the old behavior, accept malformed inputs.
-+``getattr(email.utils, 'supports_strict_parsing', False)`` can be use t=
o check
-+if the *strict* paramater is available. Patch by Thomas Dwyer and Victo=
r
-+Stinner to improve the CVE-2023-27043 fix.
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2024-6232.patch b/m=
eta/recipes-devtools/python/python3/CVE-2024-6232.patch
deleted file mode 100644
index 874cbfe40c..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2024-6232.patch
+++ /dev/null
@@ -1,251 +0,0 @@
-From 3a22dc1079be5a75750d24dc6992956e7b84b5a0 Mon Sep 17 00:00:00 2001
-From: Seth Michael Larson <seth@python.org>
-Date: Tue, 3 Sep 2024 10:07:53 -0500
-Subject: [PATCH 2/2] [3.10] gh-121285: Remove backtracking when parsing
- tarfile headers (GH-121286) (#123640)
-
-* Remove backtracking when parsing tarfile headers
-* Rewrite PAX header parsing to be stricter
-* Optimize parsing of GNU extended sparse headers v0.0
-
-(cherry picked from commit 34ddb64d088dd7ccc321f6103d23153256caa5d4)
-
-Upstream-Status: Backport from https://github.com/python/cpython/commit/=
743acbe872485dc18df4d8ab2dc7895187f062c4
-CVE: CVE-2024-6232
-
-Co-authored-by: Kirill Podoprigora <kirill.bast9@mail.ru>
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
----
- Lib/tarfile.py                                | 105 +++++++++++-------
- Lib/test/test_tarfile.py                      |  42 +++++++
- ...-07-02-13-39-20.gh-issue-121285.hrl-yI.rst |   2 +
- 3 files changed, 111 insertions(+), 38 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-iss=
ue-121285.hrl-yI.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 495349f08f9..3ab6811d633 100755
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -841,6 +841,9 @@ def data_filter(member, dest_path):
- # Sentinel for replace() defaults, meaning "don't change the attribute"
- _KEEP =3D object()
-=20
-+# Header length is digits followed by a space.
-+_header_length_prefix_re =3D re.compile(br"([0-9]{1,20}) ")
-+
- class TarInfo(object):
-     """Informational class which holds the details about an
-        archive member given by a tar header block.
-@@ -1410,41 +1413,59 @@ def _proc_pax(self, tarfile):
-         else:
-             pax_headers =3D tarfile.pax_headers.copy()
-=20
--        # Check if the pax header contains a hdrcharset field. This tel=
ls us
--        # the encoding of the path, linkpath, uname and gname fields. N=
ormally,
--        # these fields are UTF-8 encoded but since POSIX.1-2008 tar
--        # implementations are allowed to store them as raw binary strin=
gs if
--        # the translation to UTF-8 fails.
--        match =3D re.search(br"\d+ hdrcharset=3D([^\n]+)\n", buf)
--        if match is not None:
--            pax_headers["hdrcharset"] =3D match.group(1).decode("utf-8"=
)
--
--        # For the time being, we don't care about anything other than "=
BINARY".
--        # The only other value that is currently allowed by the standar=
d is
--        # "ISO-IR 10646 2000 UTF-8" in other words UTF-8.
--        hdrcharset =3D pax_headers.get("hdrcharset")
--        if hdrcharset =3D=3D "BINARY":
--            encoding =3D tarfile.encoding
--        else:
--            encoding =3D "utf-8"
--
-         # Parse pax header information. A record looks like that:
-         # "%d %s=3D%s\n" % (length, keyword, value). length is the size
-         # of the complete record including the length field itself and
--        # the newline. keyword and value are both UTF-8 encoded strings.
--        regex =3D re.compile(br"(\d+) ([^=3D]+)=3D")
-+        # the newline.
-         pos =3D 0
--        while True:
--            match =3D regex.match(buf, pos)
--            if not match:
--                break
-+        encoding =3D None
-+        raw_headers =3D []
-+        while len(buf) > pos and buf[pos] !=3D 0x00:
-+            if not (match :=3D _header_length_prefix_re.match(buf, pos)=
):
-+                raise InvalidHeaderError("invalid header")
-+            try:
-+                length =3D int(match.group(1))
-+            except ValueError:
-+                raise InvalidHeaderError("invalid header")
-+            # Headers must be at least 5 bytes, shortest being '5 x=3D\=
n'.
-+            # Value is allowed to be empty.
-+            if length < 5:
-+                raise InvalidHeaderError("invalid header")
-+            if pos + length > len(buf):
-+                raise InvalidHeaderError("invalid header")
-=20
--            length, keyword =3D match.groups()
--            length =3D int(length)
--            if length =3D=3D 0:
-+            header_value_end_offset =3D match.start(1) + length - 1  # =
Last byte of the header
-+            keyword_and_value =3D buf[match.end(1) + 1:header_value_end=
_offset]
-+            raw_keyword, equals, raw_value =3D keyword_and_value.partit=
ion(b"=3D")
-+
-+            # Check the framing of the header. The last character must =
be '\n' (0x0A)
-+            if not raw_keyword or equals !=3D b"=3D" or buf[header_valu=
e_end_offset] !=3D 0x0A:
-                 raise InvalidHeaderError("invalid header")
--            value =3D buf[match.end(2) + 1:match.start(1) + length - 1]
-+            raw_headers.append((length, raw_keyword, raw_value))
-+
-+            # Check if the pax header contains a hdrcharset field. This=
 tells us
-+            # the encoding of the path, linkpath, uname and gname field=
s. Normally,
-+            # these fields are UTF-8 encoded but since POSIX.1-2008 tar
-+            # implementations are allowed to store them as raw binary s=
trings if
-+            # the translation to UTF-8 fails. For the time being, we do=
n't care about
-+            # anything other than "BINARY". The only other value that i=
s currently
-+            # allowed by the standard is "ISO-IR 10646 2000 UTF-8" in o=
ther words UTF-8.
-+            # Note that we only follow the initial 'hdrcharset' setting=
 to preserve
-+            # the initial behavior of the 'tarfile' module.
-+            if raw_keyword =3D=3D b"hdrcharset" and encoding is None:
-+                if raw_value =3D=3D b"BINARY":
-+                    encoding =3D tarfile.encoding
-+                else:  # This branch ensures only the first 'hdrcharset=
' header is used.
-+                    encoding =3D "utf-8"
-+
-+            pos +=3D length
-=20
-+        # If no explicit hdrcharset is set, we use UTF-8 as a default.
-+        if encoding is None:
-+            encoding =3D "utf-8"
-+
-+        # After parsing the raw headers we can decode them to text.
-+        for length, raw_keyword, raw_value in raw_headers:
-             # Normally, we could just use "utf-8" as the encoding and "=
strict"
-             # as the error handler, but we better not take the risk. Fo=
r
-             # example, GNU tar <=3D 1.23 is known to store filenames it=
 cannot
-@@ -1452,17 +1473,16 @@ def _proc_pax(self, tarfile):
-             # hdrcharset=3DBINARY header).
-             # We first try the strict standard encoding, and if that fa=
ils we
-             # fall back on the user's encoding and error handler.
--            keyword =3D self._decode_pax_field(keyword, "utf-8", "utf-8=
",
-+            keyword =3D self._decode_pax_field(raw_keyword, "utf-8", "u=
tf-8",
-                     tarfile.errors)
-             if keyword in PAX_NAME_FIELDS:
--                value =3D self._decode_pax_field(value, encoding, tarfi=
le.encoding,
-+                value =3D self._decode_pax_field(raw_value, encoding, t=
arfile.encoding,
-                         tarfile.errors)
-             else:
--                value =3D self._decode_pax_field(value, "utf-8", "utf-8=
",
-+                value =3D self._decode_pax_field(raw_value, "utf-8", "u=
tf-8",
-                         tarfile.errors)
-=20
-             pax_headers[keyword] =3D value
--            pos +=3D length
-=20
-         # Fetch the next header.
-         try:
-@@ -1477,7 +1497,7 @@ def _proc_pax(self, tarfile):
-=20
-         elif "GNU.sparse.size" in pax_headers:
-             # GNU extended sparse format version 0.0.
--            self._proc_gnusparse_00(next, pax_headers, buf)
-+            self._proc_gnusparse_00(next, raw_headers)
-=20
-         elif pax_headers.get("GNU.sparse.major") =3D=3D "1" and pax_hea=
ders.get("GNU.sparse.minor") =3D=3D "0":
-             # GNU extended sparse format version 1.0.
-@@ -1499,15 +1519,24 @@ def _proc_pax(self, tarfile):
-=20
-         return next
-=20
--    def _proc_gnusparse_00(self, next, pax_headers, buf):
-+    def _proc_gnusparse_00(self, next, raw_headers):
-         """Process a GNU tar extended sparse header, version 0.0.
-         """
-         offsets =3D []
--        for match in re.finditer(br"\d+ GNU.sparse.offset=3D(\d+)\n", b=
uf):
--            offsets.append(int(match.group(1)))
-         numbytes =3D []
--        for match in re.finditer(br"\d+ GNU.sparse.numbytes=3D(\d+)\n",=
 buf):
--            numbytes.append(int(match.group(1)))
-+        for _, keyword, value in raw_headers:
-+            if keyword =3D=3D b"GNU.sparse.offset":
-+                try:
-+                    offsets.append(int(value.decode()))
-+                except ValueError:
-+                    raise InvalidHeaderError("invalid header")
-+
-+            elif keyword =3D=3D b"GNU.sparse.numbytes":
-+                try:
-+                    numbytes.append(int(value.decode()))
-+                except ValueError:
-+                    raise InvalidHeaderError("invalid header")
-+
-         next.sparse =3D list(zip(offsets, numbytes))
-=20
-     def _proc_gnusparse_01(self, next, pax_headers):
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index cfc13bccb20..007c3e94acb 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -1139,6 +1139,48 @@ def test_pax_number_fields(self):
-         finally:
-             tar.close()
-=20
-+    def test_pax_header_bad_formats(self):
-+        # The fields from the pax header have priority over the
-+        # TarInfo.
-+        pax_header_replacements =3D (
-+            b" foo=3Dbar\n",
-+            b"0 \n",
-+            b"1 \n",
-+            b"2 \n",
-+            b"3 =3D\n",
-+            b"4 =3Da\n",
-+            b"1000000 foo=3Dbar\n",
-+            b"0 foo=3Dbar\n",
-+            b"-12 foo=3Dbar\n",
-+            b"000000000000000000000000036 foo=3Dbar\n",
-+        )
-+        pax_headers =3D {"foo": "bar"}
-+
-+        for replacement in pax_header_replacements:
-+            with self.subTest(header=3Dreplacement):
-+                tar =3D tarfile.open(tmpname, "w", format=3Dtarfile.PAX=
_FORMAT,
-+                                   encoding=3D"iso8859-1")
-+                try:
-+                    t =3D tarfile.TarInfo()
-+                    t.name =3D "pax"  # non-ASCII
-+                    t.uid =3D 1
-+                    t.pax_headers =3D pax_headers
-+                    tar.addfile(t)
-+                finally:
-+                    tar.close()
-+
-+                with open(tmpname, "rb") as f:
-+                    data =3D f.read()
-+                    self.assertIn(b"11 foo=3Dbar\n", data)
-+                    data =3D data.replace(b"11 foo=3Dbar\n", replacemen=
t)
-+
-+                with open(tmpname, "wb") as f:
-+                    f.truncate()
-+                    f.write(data)
-+
-+                with self.assertRaisesRegex(tarfile.ReadError, r"method=
 tar: ReadError\('invalid header'\)"):
-+                    tarfile.open(tmpname, encoding=3D"iso8859-1")
-+
-=20
- class WriteTestBase(TarTest):
-     # Put all write tests in here that are supposed to be tested
-diff --git a/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-1212=
85.hrl-yI.rst b/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-12=
1285.hrl-yI.rst
-new file mode 100644
-index 00000000000..81f918bfe2b
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-=
yI.rst
-@@ -0,0 +1,2 @@
-+Remove backtracking from tarfile header parsing for ``hdrcharset``, PAX=
, and
-+GNU sparse headers.
---=20
-2.46.0
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2024-7592.patch b/m=
eta/recipes-devtools/python/python3/CVE-2024-7592.patch
deleted file mode 100644
index 7303a41e20..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From 3c15b8437f57fe1027171b34af88bf791cf1868c Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Wed, 4 Sep 2024 17:50:36 +0200
-Subject: [PATCH 1/2] [3.10] gh-123067: Fix quadratic complexity in parsi=
ng
- "-quoted cookie values with backslashes (GH-123075) (#123106)
-
-This fixes CVE-2024-7592.
-(cherry picked from commit 44e458357fca05ca0ae2658d62c8c595b048b5ef)
-
-Upstream-Status: Backport from https://github.com/python/cpython/commit/=
b2f11ca7667e4d57c71c1c88b255115f16042d9a
-CVE: CVE-2024-7592
-
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
----
- Lib/http/cookies.py                           | 34 ++++-------------
- Lib/test/test_http_cookies.py                 | 38 +++++++++++++++++++
- ...-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst |  1 +
- 3 files changed, 47 insertions(+), 26 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issu=
e-123067.Nx9O4R.rst
-
-diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
-index 35ac2dc6ae2..2c1f021d0ab 100644
---- a/Lib/http/cookies.py
-+++ b/Lib/http/cookies.py
-@@ -184,8 +184,13 @@ def _quote(str):
-         return '"' + str.translate(_Translator) + '"'
-=20
-=20
--_OctalPatt =3D re.compile(r"\\[0-3][0-7][0-7]")
--_QuotePatt =3D re.compile(r"[\\].")
-+_unquote_sub =3D re.compile(r'\\(?:([0-3][0-7][0-7])|(.))').sub
-+
-+def _unquote_replace(m):
-+    if m[1]:
-+        return chr(int(m[1], 8))
-+    else:
-+        return m[2]
-=20
- def _unquote(str):
-     # If there aren't any doublequotes,
-@@ -205,30 +210,7 @@ def _unquote(str):
-     #    \012 --> \n
-     #    \"   --> "
-     #
--    i =3D 0
--    n =3D len(str)
--    res =3D []
--    while 0 <=3D i < n:
--        o_match =3D _OctalPatt.search(str, i)
--        q_match =3D _QuotePatt.search(str, i)
--        if not o_match and not q_match:              # Neither matched
--            res.append(str[i:])
--            break
--        # else:
--        j =3D k =3D -1
--        if o_match:
--            j =3D o_match.start(0)
--        if q_match:
--            k =3D q_match.start(0)
--        if q_match and (not o_match or k < j):     # QuotePatt matched
--            res.append(str[i:k])
--            res.append(str[k+1])
--            i =3D k + 2
--        else:                                      # OctalPatt matched
--            res.append(str[i:j])
--            res.append(chr(int(str[j+1:j+4], 8)))
--            i =3D j + 4
--    return _nulljoin(res)
-+    return _unquote_sub(_unquote_replace, str)
-=20
- # The _getdate() routine is used to set the expiration time in the cook=
ie's HTTP
- # header.  By default, _getdate() returns the current time in the appro=
priate
-diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.=
py
-index 6072c7e15e9..644e75cd5b7 100644
---- a/Lib/test/test_http_cookies.py
-+++ b/Lib/test/test_http_cookies.py
-@@ -5,6 +5,7 @@
- import unittest
- from http import cookies
- import pickle
-+from test import support
-=20
-=20
- class CookieTests(unittest.TestCase):
-@@ -58,6 +59,43 @@ def test_basic(self):
-             for k, v in sorted(case['dict'].items()):
-                 self.assertEqual(C[k].value, v)
-=20
-+    def test_unquote(self):
-+        cases =3D [
-+            (r'a=3D"b=3D\""', 'b=3D"'),
-+            (r'a=3D"b=3D\\"', 'b=3D\\'),
-+            (r'a=3D"b=3D\=3D"', 'b=3D=3D'),
-+            (r'a=3D"b=3D\n"', 'b=3Dn'),
-+            (r'a=3D"b=3D\042"', 'b=3D"'),
-+            (r'a=3D"b=3D\134"', 'b=3D\\'),
-+            (r'a=3D"b=3D\377"', 'b=3D\xff'),
-+            (r'a=3D"b=3D\400"', 'b=3D400'),
-+            (r'a=3D"b=3D\42"', 'b=3D42'),
-+            (r'a=3D"b=3D\\042"', 'b=3D\\042'),
-+            (r'a=3D"b=3D\\134"', 'b=3D\\134'),
-+            (r'a=3D"b=3D\\\""', 'b=3D\\"'),
-+            (r'a=3D"b=3D\\\042"', 'b=3D\\"'),
-+            (r'a=3D"b=3D\134\""', 'b=3D\\"'),
-+            (r'a=3D"b=3D\134\042"', 'b=3D\\"'),
-+        ]
-+        for encoded, decoded in cases:
-+            with self.subTest(encoded):
-+                C =3D cookies.SimpleCookie()
-+                C.load(encoded)
-+                self.assertEqual(C['a'].value, decoded)
-+
-+    @support.requires_resource('cpu')
-+    def test_unquote_large(self):
-+        n =3D 10**6
-+        for encoded in r'\\', r'\134':
-+            with self.subTest(encoded):
-+                data =3D 'a=3D"b=3D' + encoded*n + ';"'
-+                C =3D cookies.SimpleCookie()
-+                C.load(data)
-+                value =3D C['a'].value
-+                self.assertEqual(value[:3], 'b=3D\\')
-+                self.assertEqual(value[-2:], '\\;')
-+                self.assertEqual(len(value), n + 3)
-+
-     def test_load(self):
-         C =3D cookies.SimpleCookie()
-         C.load('Customer=3D"WILE_E_COYOTE"; Version=3D1; Path=3D/acme')
-diff --git a/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-12306=
7.Nx9O4R.rst b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-1230=
67.Nx9O4R.rst
-new file mode 100644
-index 00000000000..6a234561fe3
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4=
R.rst
-@@ -0,0 +1 @@
-+Fix quadratic complexity in parsing ``"``-quoted cookie values with bac=
kslashes by :mod:`http.cookies`.
---=20
-2.46.0
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2024-8088.patch b/m=
eta/recipes-devtools/python/python3/CVE-2024-8088.patch
deleted file mode 100644
index 10d28a9e65..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2024-8088.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From e0264a61119d551658d9445af38323ba94fc16db Mon Sep 17 00:00:00 2001
-From: "Jason R. Coombs" <jaraco@jaraco.com>
-Date: Thu, 22 Aug 2024 19:24:33 -0400
-Subject: [PATCH] CVE-2024-8088: Sanitize names in zipfile.Path. (GH-1229=
06)
-
-Upstream-Status: Backport from https://github.com/python/cpython/commit/=
e0264a61119d551658d9445af38323ba94fc16db
-CVE: CVE-2024-8088
-
-Signed-off-by: Rohini Sangam <rsangam@mvista.com>
----
- Lib/test/test_zipfile.py   | 17 ++++++
- Lib/zipfile.py             | 61 ++++++++++++++++++-
- 2 files changed, 77 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/test/test_zipfile.py b/Lib/test/test_zipfile.py
-index 32c0170..a60dc11 100644
---- a/Lib/test/test_zipfile.py
-+++ b/Lib/test/test_zipfile.py
-@@ -3280,6 +3280,23 @@ with zipfile.ZipFile(io.BytesIO(), "w") as zf:
-         zipfile.Path(zf)
-         zf.extractall(source_path.parent)
-=20
-+    def test_malformed_paths(self):
-+        """
-+        Path should handle malformed paths.
-+        """
-+        data =3D io.BytesIO()
-+        zf =3D zipfile.ZipFile(data, "w")
-+        zf.writestr("/one-slash.txt", b"content")
-+        zf.writestr("//two-slash.txt", b"content")
-+        zf.writestr("../parent.txt", b"content")
-+        zf.filename =3D ''
-+        root =3D zipfile.Path(zf)
-+        assert list(map(str, root.iterdir())) =3D=3D [
-+            'one-slash.txt',
-+            'two-slash.txt',
-+            'parent.txt',
-+        ]
-+
-=20
- class StripExtraTests(unittest.TestCase):
-     # Note: all of the "z" characters are technically invalid, but up
-diff --git a/Lib/zipfile.py b/Lib/zipfile.py
-index 7d18bc2..cbac8d9 100644
---- a/Lib/zipfile.py
-+++ b/Lib/zipfile.py
-@@ -9,6 +9,7 @@ import io
- import itertools
- import os
- import posixpath
-+import re
- import shutil
- import stat
- import struct
-@@ -2182,7 +2183,65 @@ def _difference(minuend, subtrahend):
-     return itertools.filterfalse(set(subtrahend).__contains__, minuend)
-=20
-=20
--class CompleteDirs(ZipFile):
-+class SanitizedNames:
-+    """
-+    ZipFile mix-in to ensure names are sanitized.
-+    """
-+
-+    def namelist(self):
-+        return list(map(self._sanitize, super().namelist()))
-+
-+    @staticmethod
-+    def _sanitize(name):
-+        r"""
-+        Ensure a relative path with posix separators and no dot names.
-+        Modeled after
-+        https://github.com/python/cpython/blob/bcc1be39cb1d04ad9fc0bd1b=
9193d3972835a57c/Lib/zipfile/__init__.py#L1799-L1813
-+        but provides consistent cross-platform behavior.
-+        >>> san =3D SanitizedNames._sanitize
-+        >>> san('/foo/bar')
-+        'foo/bar'
-+        >>> san('//foo.txt')
-+        'foo.txt'
-+        >>> san('foo/.././bar.txt')
-+        'foo/bar.txt'
-+        >>> san('foo../.bar.txt')
-+        'foo../.bar.txt'
-+        >>> san('\\foo\\bar.txt')
-+        'foo/bar.txt'
-+        >>> san('D:\\foo.txt')
-+        'D/foo.txt'
-+        >>> san('\\\\server\\share\\file.txt')
-+        'server/share/file.txt'
-+        >>> san('\\\\?\\GLOBALROOT\\Volume3')
-+        '?/GLOBALROOT/Volume3'
-+        >>> san('\\\\.\\PhysicalDrive1\\root')
-+        'PhysicalDrive1/root'
-+        Retain any trailing slash.
-+        >>> san('abc/')
-+        'abc/'
-+        Raises a ValueError if the result is empty.
-+        >>> san('../..')
-+        Traceback (most recent call last):
-+        ...
-+        ValueError: Empty filename
-+        """
-+
-+        def allowed(part):
-+            return part and part not in {'..', '.'}
-+
-+        # Remove the drive letter.
-+        # Don't use ntpath.splitdrive, because that also strips UNC pat=
hs
-+        bare =3D re.sub('^([A-Z]):', r'\1', name, flags=3Dre.IGNORECASE=
)
-+        clean =3D bare.replace('\\', '/')
-+        parts =3D clean.split('/')
-+        joined =3D '/'.join(filter(allowed, parts))
-+        if not joined:
-+            raise ValueError("Empty filename")
-+        return joined + '/' * name.endswith('/')
-+
-+
-+class CompleteDirs(SanitizedNames, ZipFile):
-     """
-     A ZipFile subclass that ensures that implied directories
-     are always included in the namelist.
---=20
-2.35.7
-
diff --git a/meta/recipes-devtools/python/python3_3.10.14.bb b/meta/recip=
es-devtools/python/python3_3.10.15.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.10.14.bb
rename to meta/recipes-devtools/python/python3_3.10.15.bb
index 8f6a15701f..4157b8cb83 100644
--- a/meta/recipes-devtools/python/python3_3.10.14.bb
+++ b/meta/recipes-devtools/python/python3_3.10.15.bb
@@ -36,10 +36,6 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Py=
thon-${PV}.tar.xz \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch =
\
            file://0001-test_storlines-skip-due-to-load-variability.patch=
 \
-	   file://CVE-2024-8088.patch \
-           file://CVE-2024-7592.patch \
-           file://CVE-2024-6232.patch \
-           file://CVE-2023-27043.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
@@ -48,7 +44,7 @@ SRC_URI:append:class-native =3D " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] =3D "9c50481faa8c2832329ba0fc8868d0a606a680fc4f60ec48=
d26ce8e076751fda"
+SRC_URI[sha256sum] =3D "aab0950817735172601879872d937c1e4928a57c409ae023=
69ec3d91dccebe79"
=20
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
--=20
2.40.0


