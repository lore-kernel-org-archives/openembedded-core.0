Return-Path: <Shilong.Jiao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFEDCD8C9D
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 01:41:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70121.1780969273393026058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 18:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EjiGCpg8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0620ffd7d6=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659109IA1214843
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jun 2026 01:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=QRvKpu8F5viRSudyQdJM
	MMOc7Usuqsw7XSYjOYhTsns=; b=EjiGCpg8c8tUwBIzunC3ZT3O9DYbNTtu3Gyt
	g7eumozuna05haB8OdqE1KwV/Tb+UoKkjXWYZ7gfDZ+FYNj0QDG/GrwjVjZ9tlhb
	SHUzQ2+oYzFY+Qy0wqyxdMO4CJ6foiepPMuKi/3hbCyN9TU4ws6h3oSRCcpg58R/
	DxLjri4N6RKd1oQHz0dnNjkNNmC/Gbfrar/200nNckOOaDeLR5BbCJTGvbe72pos
	smhd5APl/17K9A9erCrEkHh9IszprO9RL8BcToqh3GQF771N32LWyQZCsa095ux2
	nYQVzdPpifsu80Szi4158WFwvuBbyrNgbck9BqW/NrjgdNcH8w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4emah7bsx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 01:41:12 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 8 Jun 2026 18:41:11 -0700
Received: from pek-lpgtest26.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 8 Jun 2026 18:41:10 -0700
From: <Shilong.Jiao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-six: Add ptest support
Date: Tue, 9 Jun 2026 09:41:10 +0800
Message-ID: <20260609014110.3859502-1-Shilong.Jiao@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDAxMyBTYWx0ZWRfX2M5ZmUlpfISL
 O0Tyc83wQB3ZXgwqOxKmuJEtNaj2zm+oTz4mWcZdnf+Ja60um141uErOHXdC2ahK/G2MnOWbvvS
 y4qOUy8btpSmknxePYeMdZ4ha5c0nhDa3gmfQ+wjVygxoa6rOwqOjlHQBfNQM2SKBz84RyYih9T
 70dN5Qrx1H7aeoEnBIBkYTHN9C4sPdl4CWiKO6qhra0lxx/zfqrZY+pWowAsULYQbX20mM4GnGg
 nKfxu9UH8o1/4bNB5n+gH/QXHuNnZuGcO5f+gbkdzRxNCa+I02heyrMR3fZhtipQTh8kdeaabgH
 W+vN6Hz3XO00pYBl/oU/0h4rKMErHXZcZVxCH0oZWNYOgHkKKOehB+cdwygxh4KWRzRF/c8b660
 B9VQVZxiI4Iymq1Od6h0kiPC3mK5ZWTQ51I/Hvg8toND4B6VEqWyQcU1coTd434MP3PbycA+y8z
 wsqk6Pstorj+/pSrB7w==
X-Proofpoint-GUID: _lTaWi_D0a7OWzopaBgeMLJ0MjfnGBuD
X-Authority-Analysis: v=2.4 cv=NbDWEWD4 c=1 sm=1 tr=0 ts=6a276f38 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=MDoa-FnJYf_EGW8AL4kA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _lTaWi_D0a7OWzopaBgeMLJ0MjfnGBuD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 01:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238265

From: Shilong Jiao <Shilong.Jiao@windriver.com>

Add ptest for python3-six using pytest to run the test_six.py
test suite included in the source package.

PASS: test_six.py::test_add_doc
PASS: test_six.py::test_import_module
PASS: test_six.py::test_integer_types
PASS: test_six.py::test_string_types
PASS: test_six.py::test_class_types
PASS: test_six.py::test_text_type
PASS: test_six.py::test_binary_type
PASS: test_six.py::test_MAXSIZE
PASS: test_six.py::test_lazy
PASS: test_six.py::test_move_items[cStringIO]
PASS: test_six.py::test_move_items[filter]
PASS: test_six.py::test_move_items[filterfalse]
PASS: test_six.py::test_move_items[input]
PASS: test_six.py::test_move_items[intern]
PASS: test_six.py::test_move_items[map]
PASS: test_six.py::test_move_items[getcwd]
PASS: test_six.py::test_move_items[getcwdb]
PASS: test_six.py::test_move_items[getoutput]
PASS: test_six.py::test_move_items[range]
PASS: test_six.py::test_move_items[reload_module]
PASS: test_six.py::test_move_items[reduce]
PASS: test_six.py::test_move_items[shlex_quote]
PASS: test_six.py::test_move_items[StringIO]
PASS: test_six.py::test_move_items[UserDict]
PASS: test_six.py::test_move_items[UserList]
PASS: test_six.py::test_move_items[UserString]
PASS: test_six.py::test_move_items[xrange]
PASS: test_six.py::test_move_items[zip]
PASS: test_six.py::test_move_items[zip_longest]
PASS: test_six.py::test_move_items[builtins]
PASS: test_six.py::test_move_items[configparser]
PASS: test_six.py::test_move_items[collections_abc]
PASS: test_six.py::test_move_items[copyreg]
PASS: test_six.py::test_move_items[dbm_gnu]
PASS: test_six.py::test_move_items[dbm_ndbm]
PASS: test_six.py::test_move_items[_dummy_thread]
PASS: test_six.py::test_move_items[http_cookiejar]
PASS: test_six.py::test_move_items[http_cookies]
PASS: test_six.py::test_move_items[html_entities]
PASS: test_six.py::test_move_items[html_parser]
PASS: test_six.py::test_move_items[http_client]
PASS: test_six.py::test_move_items[email_mime_base]
PASS: test_six.py::test_move_items[email_mime_image]
PASS: test_six.py::test_move_items[email_mime_multipart]
PASS: test_six.py::test_move_items[email_mime_nonmultipart]
PASS: test_six.py::test_move_items[email_mime_text]
PASS: test_six.py::test_move_items[BaseHTTPServer]
PASS: test_six.py::test_move_items[CGIHTTPServer]
PASS: test_six.py::test_move_items[SimpleHTTPServer]
PASS: test_six.py::test_move_items[cPickle]
PASS: test_six.py::test_move_items[queue]
PASS: test_six.py::test_move_items[reprlib]
PASS: test_six.py::test_move_items[socketserver]
PASS: test_six.py::test_move_items[_thread]
SKIP: test_six.py::test_move_items[tkinter]
SKIP: test_six.py::test_move_items[tkinter_dialog]
SKIP: test_six.py::test_move_items[tkinter_filedialog]
SKIP: test_six.py::test_move_items[tkinter_scrolledtext]
SKIP: test_six.py::test_move_items[tkinter_simpledialog]
SKIP: test_six.py::test_move_items[tkinter_tix]
SKIP: test_six.py::test_move_items[tkinter_ttk]
SKIP: test_six.py::test_move_items[tkinter_constants]
SKIP: test_six.py::test_move_items[tkinter_dnd]
SKIP: test_six.py::test_move_items[tkinter_colorchooser]
SKIP: test_six.py::test_move_items[tkinter_commondialog]
SKIP: test_six.py::test_move_items[tkinter_tkfiledialog]
SKIP: test_six.py::test_move_items[tkinter_font]
SKIP: test_six.py::test_move_items[tkinter_messagebox]
SKIP: test_six.py::test_move_items[tkinter_tksimpledialog]
PASS: test_six.py::test_move_items[urllib_parse]
PASS: test_six.py::test_move_items[urllib_error]
PASS: test_six.py::test_move_items[urllib]
PASS: test_six.py::test_move_items[urllib_robotparser]
PASS: test_six.py::test_move_items[xmlrpc_client]
PASS: test_six.py::test_move_items[xmlrpc_server]
PASS: test_six.py::test_move_items_urllib_parse[ParseResult]
PASS: test_six.py::test_move_items_urllib_parse[SplitResult]
PASS: test_six.py::test_move_items_urllib_parse[parse_qs]
PASS: test_six.py::test_move_items_urllib_parse[parse_qsl]
PASS: test_six.py::test_move_items_urllib_parse[urldefrag]
PASS: test_six.py::test_move_items_urllib_parse[urljoin]
PASS: test_six.py::test_move_items_urllib_parse[urlparse]
PASS: test_six.py::test_move_items_urllib_parse[urlsplit]
PASS: test_six.py::test_move_items_urllib_parse[urlunparse]
PASS: test_six.py::test_move_items_urllib_parse[urlunsplit]
PASS: test_six.py::test_move_items_urllib_parse[quote]
PASS: test_six.py::test_move_items_urllib_parse[quote_plus]
PASS: test_six.py::test_move_items_urllib_parse[unquote]
PASS: test_six.py::test_move_items_urllib_parse[unquote_plus]
PASS: test_six.py::test_move_items_urllib_parse[unquote_to_bytes]
PASS: test_six.py::test_move_items_urllib_parse[urlencode]
PASS: test_six.py::test_move_items_urllib_parse[splitquery]
PASS: test_six.py::test_move_items_urllib_parse[splittag]
PASS: test_six.py::test_move_items_urllib_parse[splituser]
PASS: test_six.py::test_move_items_urllib_parse[splitvalue]
PASS: test_six.py::test_move_items_urllib_parse[uses_fragment]
PASS: test_six.py::test_move_items_urllib_parse[uses_netloc]
PASS: test_six.py::test_move_items_urllib_parse[uses_params]
PASS: test_six.py::test_move_items_urllib_parse[uses_query]
PASS: test_six.py::test_move_items_urllib_parse[uses_relative]
PASS: test_six.py::test_move_items_urllib_error[URLError]
PASS: test_six.py::test_move_items_urllib_error[HTTPError]
PASS: test_six.py::test_move_items_urllib_error[ContentTooShortError]
PASS: test_six.py::test_move_items_urllib_request[urlopen]
PASS: test_six.py::test_move_items_urllib_request[install_opener]
PASS: test_six.py::test_move_items_urllib_request[build_opener]
PASS: test_six.py::test_move_items_urllib_request[pathname2url]
PASS: test_six.py::test_move_items_urllib_request[url2pathname]
PASS: test_six.py::test_move_items_urllib_request[getproxies]
PASS: test_six.py::test_move_items_urllib_request[Request]
PASS: test_six.py::test_move_items_urllib_request[OpenerDirector]
PASS: test_six.py::test_move_items_urllib_request[HTTPDefaultErrorHandler]
PASS: test_six.py::test_move_items_urllib_request[HTTPRedirectHandler]
PASS: test_six.py::test_move_items_urllib_request[HTTPCookieProcessor]
PASS: test_six.py::test_move_items_urllib_request[ProxyHandler]
PASS: test_six.py::test_move_items_urllib_request[BaseHandler]
PASS: test_six.py::test_move_items_urllib_request[HTTPPasswordMgr]
PASS: test_six.py::test_move_items_urllib_request[HTTPPasswordMgrWithDefaultRealm]
PASS: test_six.py::test_move_items_urllib_request[AbstractBasicAuthHandler]
PASS: test_six.py::test_move_items_urllib_request[HTTPBasicAuthHandler]
PASS: test_six.py::test_move_items_urllib_request[ProxyBasicAuthHandler]
PASS: test_six.py::test_move_items_urllib_request[AbstractDigestAuthHandler]
PASS: test_six.py::test_move_items_urllib_request[HTTPDigestAuthHandler]
PASS: test_six.py::test_move_items_urllib_request[ProxyDigestAuthHandler]
PASS: test_six.py::test_move_items_urllib_request[HTTPHandler]
PASS: test_six.py::test_move_items_urllib_request[HTTPSHandler]
PASS: test_six.py::test_move_items_urllib_request[FileHandler]
PASS: test_six.py::test_move_items_urllib_request[FTPHandler]
PASS: test_six.py::test_move_items_urllib_request[CacheFTPHandler]
PASS: test_six.py::test_move_items_urllib_request[UnknownHandler]
PASS: test_six.py::test_move_items_urllib_request[HTTPErrorProcessor]
PASS: test_six.py::test_move_items_urllib_request[urlretrieve]
PASS: test_six.py::test_move_items_urllib_request[urlcleanup]
PASS: test_six.py::test_move_items_urllib_request[proxy_bypass]
PASS: test_six.py::test_move_items_urllib_request[parse_http_list]
PASS: test_six.py::test_move_items_urllib_request[parse_keqv_list]
PASS: test_six.py::test_move_items_urllib_response[addbase]
PASS: test_six.py::test_move_items_urllib_response[addclosehook]
PASS: test_six.py::test_move_items_urllib_response[addinfo]
PASS: test_six.py::test_move_items_urllib_response[addinfourl]
PASS: test_six.py::test_move_items_urllib_robotparser[RobotFileParser]
PASS: test_six.py::test_import_moves_error_1
PASS: test_six.py::test_import_moves_error_2
PASS: test_six.py::test_import_moves_error_3
PASS: test_six.py::test_from_imports
PASS: test_six.py::test_filter
PASS: test_six.py::test_filter_false
PASS: test_six.py::test_map
PASS: test_six.py::test_getoutput
PASS: test_six.py::test_zip
PASS: test_six.py::test_zip_longest
PASS: test_six.py::TestCustomizedMoves::test_moved_attribute
PASS: test_six.py::TestCustomizedMoves::test_moved_module
PASS: test_six.py::TestCustomizedMoves::test_custom_move_module
PASS: test_six.py::TestCustomizedMoves::test_custom_move_attribute
PASS: test_six.py::TestCustomizedMoves::test_empty_remove
PASS: test_six.py::test_get_unbound_function
PASS: test_six.py::test_get_method_self
PASS: test_six.py::test_get_method_function
PASS: test_six.py::test_get_function_closure
PASS: test_six.py::test_get_function_code
PASS: test_six.py::test_get_function_defaults
PASS: test_six.py::test_get_function_globals
PASS: test_six.py::test_dictionary_iterators
PASS: test_six.py::test_dictionary_views
PASS: test_six.py::test_advance_iterator
PASS: test_six.py::test_iterator
PASS: test_six.py::test_callable
PASS: test_six.py::test_create_bound_method
PASS: test_six.py::test_create_unbound_method
PASS: test_six.py::test_b
PASS: test_six.py::test_u
PASS: test_six.py::test_u_escapes
PASS: test_six.py::test_unichr
PASS: test_six.py::test_int2byte
PASS: test_six.py::test_byte2int
PASS: test_six.py::test_bytesindex
PASS: test_six.py::test_bytesiter
PASS: test_six.py::test_StringIO
PASS: test_six.py::test_BytesIO
PASS: test_six.py::test_exec_
PASS: test_six.py::test_reraise
PASS: test_six.py::test_raise_from
PASS: test_six.py::test_print_
PASS: test_six.py::test_print_exceptions
PASS: test_six.py::test_with_metaclass
PASS: test_six.py::test_with_metaclass_typing
PASS: test_six.py::test_with_metaclass_pep_560
PASS: test_six.py::test_with_metaclass_prepare
PASS: test_six.py::test_wraps
PASS: test_six.py::test_wraps_raises_on_missing_updated_field_on_wrapper
PASS: test_six.py::test_add_metaclass
PASS: test_six.py::test_add_metaclass_nested
PASS: test_six.py::test_assertCountEqual
PASS: test_six.py::test_assertRegex
PASS: test_six.py::test_assertNotRegex
PASS: test_six.py::test_assertRaisesRegex
PASS: test_six.py::test_python_2_unicode_compatible

DURATION: 2
TOTAL: 1 FAIL: 0

Signed-off-by: Shilong Jiao <Shilong.Jiao@windriver.com>
---
 meta/conf/distro/include/ptest-packagelists.inc   |  1 +
 .../recipes-devtools/python/python3-six/run-ptest |  8 ++++++++
 .../recipes-devtools/python/python3-six_1.17.0.bb | 15 ++++++++++++++-
 3 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-devtools/python/python3-six/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 0eaa09eb33..a340418211 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -88,6 +88,7 @@ PTESTS_FAST = "\
     python3-pytz \
     python3-pyyaml \
     python3-rpds-py \
+    python3-six \
     python3-trove-classifiers \
     python3-vcs-versioning \
     python3-uritools \
diff --git a/meta/recipes-devtools/python/python3-six/run-ptest b/meta/recipes-devtools/python/python3-six/run-ptest
new file mode 100755
index 0000000000..285c442b3c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-six/run-ptest
@@ -0,0 +1,8 @@
+#!/bin/bash
+
+PTEST_DIR=$(dirname $(readlink -f $0))
+python3 -m pytest -v --tb=short $PTEST_DIR/test_six.py 2>&1 | \
+    sed -n -e 's/^\(.*::[^ ]*\) PASSED.*/PASS: \1/p' \
+           -e 's/^\(.*::[^ ]*\) FAILED.*/FAIL: \1/p' \
+           -e 's/^\(.*::[^ ]*\) SKIPPED.*/SKIP: \1/p' \
+           -e 's/^\(.*::[^ ]*\) ERROR.*/FAIL: \1/p'
diff --git a/meta/recipes-devtools/python/python3-six_1.17.0.bb b/meta/recipes-devtools/python/python3-six_1.17.0.bb
index 693f1818d3..213b3dc593 100644
--- a/meta/recipes-devtools/python/python3-six_1.17.0.bb
+++ b/meta/recipes-devtools/python/python3-six_1.17.0.bb
@@ -1,4 +1,17 @@
-inherit setuptools3
+inherit setuptools3 ptest
 require python-six.inc
 
 SRC_URI[sha256sum] = "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
+
+SRC_URI += "file://run-ptest"
+
+RDEPENDS:${PN}-ptest += " \
+    bash \
+    python3-pytest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    install -m 0644 ${S}/test_six.py ${D}${PTEST_PATH}/
+}
-- 
2.34.1


