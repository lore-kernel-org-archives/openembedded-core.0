Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CFDC83F05
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 10:36:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9713.1751625365782377454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 03:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9280580a16=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5645bATH027817
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Jul 2025 10:36:05 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9en6r-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 10:36:04 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 4 Jul 2025 03:35:05 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 2/2] python3-urllib3: fix CVE-2025-50182
Date: Fri, 4 Jul 2025 16:05:39 +0530
Message-ID: <20250704103539.265785-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250704103539.265785-1-yogita.urade@windriver.com>
References: <20250704103539.265785-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: vFz7A6NiongFDCcgaSBErxo5dtlEHP5J
X-Proofpoint-GUID: vFz7A6NiongFDCcgaSBErxo5dtlEHP5J
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=6867ae94 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=uPZiAMpXAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=CrBjr2TvQOgN2kJT7MUA:9 a=s5zKW874KtQA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4MSBTYWx0ZWRfX7pwMlH2WCBQ2 fdEhBoEEPyT5muk5Dwl5FdDd6bJiYCAUiC3EHFZXdmiKhpR0hfG6v/p2s1H25xTCZya6R+2Xkwe vbW6+YcDci6r4P6zH+auyAckj8wJ6FjKBjlq57Et6mcgRKviCLrDCNAbEE5cFR5TmL2dX5w8IuW
 C8//3zLEpaU37YJM+1MZl8c1A31xMzctRDKMau6f/DTVKZd7RHWwQlugM/2zHvGDUtJxOmSNUcm Gl7NcWPlGAa68MedOQAXfCQZbdXPnonzntsQsu6FTY97qEd/T/LBDHHpoi4f5yIbg/D4N4Fx+WH AjKuZN2xwhUDZjyROBCKHu5lnr3nhPFZizGiMx16NRw/OvKPpkAIP9atdXyHvjarWbg3QzAPlvM
 hfsI4t+SGQVMkBfZNywHQqeqUuus6O+K5mll/kod1kL4R5UVlqhpzv7811WQGimKVawhFHBR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507040081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 10:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219915

From: Yogita Urade <yogita.urade@windriver.com>

urllib3 is a user-friendly HTTP client library for Python. Prior to
2.5.0, urllib3 does not control redirects in browsers and Node.js.
urllib3 supports being used in a Pyodide runtime utilizing the
JavaScript Fetch API or falling back on XMLHttpRequest. This means
Python libraries can be used to make HTTP requests from a browser or
Node.js. Additionally, urllib3 provides a mechanism to control redirects,
but the retries and redirect parameters are ignored with Pyodide; the
runtime itself determines redirect behavior. This issue has been
patched in version 2.5.0.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-50182

Upstream patch:
https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../python3-urllib3/CVE-2025-50182.patch      | 195 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   1 +
 2 files changed, 196 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
new file mode 100644
index 0000000000..d99e83a619
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
@@ -0,0 +1,195 @@
+From 7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Wed, 18 Jun 2025 16:30:35 +0300
+Subject: [PATCH] Merge commit from fork
+
+Changes:
+- Take only send_jspi_request API from commit
+https://github.com/urllib3/urllib3/commit/8b2474d32b57f096a815ab52f9b54a843d68c140
+
+CVE: CVE-2025-50182
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ docs/reference/contrib/emscripten.rst      |  2 +-
+ src/urllib3/contrib/emscripten/fetch.py    | 93 ++++++++++++++++++++++
+ test/contrib/emscripten/test_emscripten.py | 46 +++++++++++
+ 3 files changed, 140 insertions(+), 1 deletion(-)
+
+diff --git a/docs/reference/contrib/emscripten.rst b/docs/reference/contrib/emscripten.rst
+index c88e422..3ff9cdd 100644
+--- a/docs/reference/contrib/emscripten.rst
++++ b/docs/reference/contrib/emscripten.rst
+@@ -68,7 +68,7 @@ Features which are usable with Emscripten support are:
+ * Timeouts
+ * Retries
+ * Streaming (with Web Workers and Cross-Origin Isolation)
+-* Redirects (determined by browser/runtime, not restrictable with urllib3)
++* Redirects (urllib3 controls redirects in Node.js but not in browsers where behavior is determined by runtime)
+ * Decompressing response bodies
+
+ Features which don't work with Emscripten:
+diff --git a/src/urllib3/contrib/emscripten/fetch.py b/src/urllib3/contrib/emscripten/fetch.py
+index 8d197ea..539df99 100644
+--- a/src/urllib3/contrib/emscripten/fetch.py
++++ b/src/urllib3/contrib/emscripten/fetch.py
+@@ -403,6 +403,99 @@ def send_request(request: EmscriptenRequest) -> EmscriptenResponse:
+             raise _RequestError(err.message, request=request)
+
+
++def send_jspi_request(
++    request: EmscriptenRequest, streaming: bool
++) -> EmscriptenResponse:
++    """
++    Send a request using WebAssembly JavaScript Promise Integration
++    to wrap the asynchronous JavaScript fetch api (experimental).
++
++    :param request:
++        Request to send
++
++    :param streaming:
++        Whether to stream the response
++
++    :return: The response object
++    :rtype: EmscriptenResponse
++    """
++    timeout = request.timeout
++    js_abort_controller = js.AbortController.new()
++    headers = {k: v for k, v in request.headers.items() if k not in HEADERS_TO_IGNORE}
++    req_body = request.body
++    fetch_data = {
++        "headers": headers,
++        "body": to_js(req_body),
++        "method": request.method,
++        "signal": js_abort_controller.signal,
++    }
++    # Node.js returns the whole response (unlike opaqueredirect in browsers),
++    # so urllib3 can set `redirect: manual` to control redirects itself.
++    # https://stackoverflow.com/a/78524615
++    if _is_node_js():
++        fetch_data["redirect"] = "manual"
++    # Call JavaScript fetch (async api, returns a promise)
++    fetcher_promise_js = js.fetch(request.url, _obj_from_dict(fetch_data))
++    # Now suspend WebAssembly until we resolve that promise
++    # or time out.
++    response_js = _run_sync_with_timeout(
++        fetcher_promise_js,
++        timeout,
++        js_abort_controller,
++        request=request,
++        response=None,
++    )
++    headers = {}
++    header_iter = response_js.headers.entries()
++    while True:
++        iter_value_js = header_iter.next()
++        if getattr(iter_value_js, "done", False):
++            break
++        else:
++            headers[str(iter_value_js.value[0])] = str(iter_value_js.value[1])
++    status_code = response_js.status
++    body: bytes | io.RawIOBase = b""
++
++    response = EmscriptenResponse(
++        status_code=status_code, headers=headers, body=b"", request=request
++    )
++    if streaming:
++        # get via inputstream
++        if response_js.body is not None:
++            # get a reader from the fetch response
++            body_stream_js = response_js.body.getReader()
++            body = _JSPIReadStream(
++                body_stream_js, timeout, request, response, js_abort_controller
++            )
++    else:
++        # get directly via arraybuffer
++        # n.b. this is another async JavaScript call.
++        body = _run_sync_with_timeout(
++            response_js.arrayBuffer(),
++            timeout,
++            js_abort_controller,
++            request=request,
++            response=response,
++        ).to_py()
++    response.body = body
++    return response
++
++
++def _is_node_js() -> bool:
++    """
++    Check if we are in Node.js.
++
++    :return: True if we are in Node.js.
++    :rtype: bool
++    """
++    return (
++        hasattr(js, "process")
++        and hasattr(js.process, "release")
++        # According to the Node.js documentation, the release name is always "node".
++        and js.process.release.name == "node"
++    )
++
++
+ def streaming_ready() -> bool | None:
+     if _fetcher:
+         return _fetcher.streaming_ready
+diff --git a/test/contrib/emscripten/test_emscripten.py b/test/contrib/emscripten/test_emscripten.py
+index 0e107fa..d94eda5 100644
+--- a/test/contrib/emscripten/test_emscripten.py
++++ b/test/contrib/emscripten/test_emscripten.py
+@@ -965,6 +965,52 @@ def test_redirects(
+     )
+
+
++@pytest.mark.with_jspi
++def test_disabled_redirects(
++    selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
++) -> None:
++    """
++    Test that urllib3 can control redirects in Node.js.
++    """
++
++    @run_in_pyodide  # type: ignore[misc]
++    def pyodide_test(selenium_coverage: typing.Any, host: str, port: int) -> None:
++        import pytest
++
++        from urllib3 import PoolManager, request
++        from urllib3.contrib.emscripten.fetch import _is_node_js
++        from urllib3.exceptions import MaxRetryError
++
++        if not _is_node_js():
++            pytest.skip("urllib3 does not control redirects in browsers.")
++
++        redirect_url = f"http://{host}:{port}/redirect"
++
++        with PoolManager(retries=0) as http:
++            with pytest.raises(MaxRetryError):
++                http.request("GET", redirect_url)
++
++            response = http.request("GET", redirect_url, redirect=False)
++            assert response.status == 303
++
++        with PoolManager(retries=False) as http:
++            response = http.request("GET", redirect_url)
++            assert response.status == 303
++
++        with pytest.raises(MaxRetryError):
++            request("GET", redirect_url, retries=0)
++
++        response = request("GET", redirect_url, redirect=False)
++        assert response.status == 303
++
++        response = request("GET", redirect_url, retries=0, redirect=False)
++        assert response.status == 303
++
++    pyodide_test(
++        selenium_coverage, testserver_http.http_host, testserver_http.http_port
++    )
++
++
+ @install_urllib3_wheel()
+ def test_insecure_requests_warning(
+     selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
index bdb1c7ca8d..beb57010ac 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -9,6 +9,7 @@ inherit pypi python_hatchling
 
 SRC_URI += " \
     file://CVE-2025-50181.patch \
+    file://CVE-2025-50182.patch \
 "
 
 RDEPENDS:${PN} += "\
-- 
2.40.0


