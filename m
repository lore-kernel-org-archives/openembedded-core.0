Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.62])
 by mx.groups.io with SMTP id smtpd.web10.14576.1601359577330074906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 23:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VvuKLPkF;
 spf=pass (domain: windriver.com, ip: 40.107.237.62, mailfrom: li.zhou@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWsa/3eC0NNkbcvD3aHK5f37b0Hau6GtQI0tMCsFLv2BSLAynMaGKYhhmfiA6hg2fw7QoymDH0x21xWRkZ+Fe9558QL0Ozs7Oyf4oU5zfBJ2wZKYd9ujXt3G1ABmqslJirgmK+o+AKrHBRKTsRsMLl35Vsp8mIUuXyN+S3anj6PGsi5oZYw2xCZQaMTsQAQoCkG5ugcmFWJ1QiKzBXB4++bHrQoM7IHP1NwTtU1+KrJAUKgNTgM6RR6GGhoZMVDhp0WrE4/kMbqah4h4R3naH45I1vG9VmFR4VfyjLQ5opr06gnlb6MhWjJSzbszSbDBoF9qP5IPuPo3U4kiLHhedA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbyNOyvXfSraN5RQVC+oRCWpCN1lJK9I7/1ghTqp7sM=;
 b=kCUzn0q4wAE8k5DHWssR1v9nbF9oPm1wwocYmgzWnwAWcJaiyzPGBJZw9eLB+tdbpvykKsbLUaTLqdZrEqADSs037Btt4Iq/Gpyo2I+zDpJN1Z7LmCjzyOvBkm6ODITpP/Xk0SAhya7sH7tvs70de3ZSVg/CNiecMYQfkic7/Lh+JSUTOyvc7I9ViVA/YpDcN7yJi7qwaosr1zyjae4PtRGL4HSJTXZQ8E434YTFngMklZ3hXXH2A141DdDXQsHTSMqP6vniuxmGFWzC/8NmT/+PY1Oep1waInhiodB1g0hdAZeDu7oeBBQKFLn4ajffNRSH8t0yOUm6K0wYhjaPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbyNOyvXfSraN5RQVC+oRCWpCN1lJK9I7/1ghTqp7sM=;
 b=VvuKLPkFJQ7XGVEU7WUUfCjWos6FYoWPZJjTyD+7AZY/rVeMdIi/svtvGTFEzWc1/07sDOHtCkOXDXryReGTBloBIPQR1sRKdxRCPY0Yi5m3Cvb79hXSGOjhwHPkNJw/A3PFvMmjjmgZEo7Tek/1R8mlXuKG2i1ffXX4XXmdYz8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MWHPR1101MB2318.namprd11.prod.outlook.com (10.174.255.14) by
 MWHPR11MB1533.namprd11.prod.outlook.com (10.172.55.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.25; Tue, 29 Sep 2020 06:06:13 +0000
Received: from MWHPR1101MB2318.namprd11.prod.outlook.com
 ([fe80::f44f:12f4:ecff:1400]) by MWHPR1101MB2318.namprd11.prod.outlook.com
 ([fe80::f44f:12f4:ecff:1400%12]) with mapi id 15.20.3412.029; Tue, 29 Sep
 2020 06:06:13 +0000
Subject: Re: [OE-core][PATCH] python3: Security Advisory - python - CVE-2020-26116
From: "Li Zhou" <li.zhou@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <16392BC9332F69E3.19426@lists.openembedded.org>
Message-ID: <3cc3d920-7b6a-f6a1-da0b-6f78c4368289@windriver.com>
Date: Tue, 29 Sep 2020 14:06:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
In-Reply-To: <16392BC9332F69E3.19426@lists.openembedded.org>
X-Originating-IP: [147.11.103.217]
X-ClientProxiedBy: HK2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:202:2e::20) To MWHPR1101MB2318.namprd11.prod.outlook.com
 (2603:10b6:301:4e::14)
Return-Path: li.zhou@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [0.0.0.0] (147.11.103.217) by HK2PR06CA0008.apcprd06.prod.outlook.com (2603:1096:202:2e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Tue, 29 Sep 2020 06:06:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c27cf30-6b2b-42f7-d364-08d8643dc4cb
X-MS-TrafficTypeDiagnostic: MWHPR11MB1533:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1533E6A942D37F18E9E2E02BF8320@MWHPR11MB1533.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W+ovj9INVLokO35qyNh6Xzxhgs0Amui3HY2JEICMXynDCNcIEHVQ5Xbs5NWwc+p3jojy4mGYb05kGIvtltyes0Bc2/eC/ieGKZ56PZmJUfI0b9TrBHt7fd9Kn+51rvLPgQZlfhQDNM1kyIjZ8uaEPeaIl+XAl2ltF3H3mhsvtw5XX1UJMAxGF9ZXaOQoTxsQ74BCsyoTs2IQ48qbxGCb0BcxKYP8N7v9/Up8v85Gbkbys7KjOqEH9+r5XIicbJkX3B7DrKLpRAE1af9OMzA+9D326YoBCp1yOFxTMaVCNT0f/6+FqnIMrzyx4FiMynSSPIUusDViQ3sW00Jv8oOGKwzcREEZGcPgDJaiXE74EVcVs00pg/6fEXWjaq8s9dh/AesiZ5oQ6gfczDXZneZ0LNjkWIxd5kBJBB4i+vZcz8Ladn/SzlA9ZIqsHk/7iLEj1PAFQPWXIDjUVOmU6TpsRr9YPO9/hvdUmLhlQjiSQp0KR9+XPGKt6hPBa/PpVzSeUhyLPLbx/pAZYe7iSvfAGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39850400004)(376002)(8676002)(2906002)(26005)(52116002)(8936002)(2616005)(15650500001)(16576012)(30864003)(83380400001)(6486002)(316002)(16526019)(66946007)(186003)(31686004)(33964004)(36756003)(53546011)(6706004)(31696002)(6916009)(166002)(5660300002)(66476007)(66556008)(478600001)(86362001)(6666004)(19627235002)(956004)(966005)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	o0p0NTxxokhacmJk+v4lzck9tKVC/TltxuI9AayLraTX1sxCpNicO3p7X20LgFVfWXTleAEaqDznfOH10Ja9xIuRDMc6A7hHKWMIW55pcJ2s36zWNUpSKE/8OefLjz6PIsdXYiK14vtGKgdcMK+CivGw76TqT9yuQSdsnAhLsMpLrFLXCKIOU5Yxvb6kaKf1Isjw4VSXDR9+mMGoHjojwazfhcbP3MraRWVMSkdRMJYIW88uxaT5e40Cdam0VxvUDwUp8zM6m9ekKyAk6Jtn/+wvNp/sbKrHXrvUi0DRMKAthprFfl2Fss1UA1q3eMEkpSDjWFxryQrNYIsdobP4YUfhNNR5uSxRF0YPjbIAg5JAHAVjlSq+CYTyaSubw4d8LA3YOAAQNaw6psQ4gQLqE6v+kdM+KF9czVXFG04tjiYNxH8UZnWSV8/WT3n8iN1HsIjwAispnZmcJfdcAqf5kzffAU5rXHQEWeGaWd4M17EbCNG2WRdi0Y6n16zVHOomLav0q0PbsXjRPUPANw0a0wX7YwK/gk82AmJK+DnAIvVLRGezn5zQaR+R31if9e9qHolbB6bKLyZSdR9Ny8PEvT/fE1PYsagrwRYBeoR8nw2tlI7rUREOevwfhVeP+R8a7VCcSTp8GUP83gHjn7M9eA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c27cf30-6b2b-42f7-d364-08d8643dc4cb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 06:06:13.3588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlFHZomCTPVXkfl2wCLoeDl5cWtgSaQQselMc9ewruTaPJ46Tkzt14hsP0eKYQlhbIxICeU4WiZKrRYYzILjpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1533
Content-Type: multipart/alternative;
 boundary="------------29041434C0941BA5B70B3FDD"
Content-Language: en-US

--------------29041434C0941BA5B70B3FDD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, I recall this mail because I meant to send it to zeus branch.

On 9/29/20 2:00 PM, Li Zhou wrote:
> Backport patch from <https://github.com/python/cpython/commit/
> ca75fec1ed358f7324272608ca952b2d8226d11a> to solve CVE-2020-26116.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>   .../python/python3/CVE-2020-26116.patch            | 106 +++++++++++++++++++++
>   meta/recipes-devtools/python/python3_3.7.8.bb      |   1 +
>   2 files changed, 107 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-26116.patch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2020-26116.patch b/meta/recipes-devtools/python/python3/CVE-2020-26116.patch
> new file mode 100644
> index 0000000..2820999
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2020-26116.patch
> @@ -0,0 +1,106 @@
> +From ca75fec1ed358f7324272608ca952b2d8226d11a Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Sun, 19 Jul 2020 02:27:35 -0700
> +Subject: [PATCH] bpo-39603: Prevent header injection in http methods
> + (GH-18485) (GH-21538)
> +
> +reject control chars in http method in http.client.putrequest to prevent http header injection
> +(cherry picked from commit 8ca8a2e8fb068863c1138f07e3098478ef8be12e)
> +
> +Co-authored-by: AMIR <31338382+amiremohamadi@users.noreply.github.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2020-26116
> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
> +---
> + Lib/http/client.py                            | 15 +++++++++++++
> + Lib/test/test_httplib.py                      | 22 +++++++++++++++++++
> + .../2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst  |  2 ++
> + 3 files changed, 39 insertions(+)
> + create mode 100644 Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
> +
> +diff --git a/Lib/http/client.py b/Lib/http/client.py
> +index 09c57af865..04cd8f7d84 100644
> +--- a/Lib/http/client.py
> ++++ b/Lib/http/client.py
> +@@ -150,6 +150,10 @@ _contains_disallowed_url_pchar_re = re.compile('[\x00-\x20\x7f]')
> + #  _is_allowed_url_pchars_re = re.compile(r"^[/!$&'()*+,;=:@%a-zA-Z0-9._~-]+$")
> + # We are more lenient for assumed real world compatibility purposes.
> +
> ++# These characters are not allowed within HTTP method names
> ++# to prevent http header injection.
> ++_contains_disallowed_method_pchar_re = re.compile('[\x00-\x1f]')
> ++
> + # We always set the Content-Length header for these methods because some
> + # servers will otherwise respond with a 411
> + _METHODS_EXPECTING_BODY = {'PATCH', 'POST', 'PUT'}
> +@@ -1109,6 +1113,8 @@ class HTTPConnection:
> +         else:
> +             raise CannotSendRequest(self.__state)
> +
> ++        self._validate_method(method)
> ++
> +         # Save the method for use later in the response phase
> +         self._method = method
> +
> +@@ -1199,6 +1205,15 @@ class HTTPConnection:
> +         # ASCII also helps prevent CVE-2019-9740.
> +         return request.encode('ascii')
> +
> ++    def _validate_method(self, method):
> ++        """Validate a method name for putrequest."""
> ++        # prevent http header injection
> ++        match = _contains_disallowed_method_pchar_re.search(method)
> ++        if match:
> ++            raise ValueError(
> ++                    f"method can't contain control characters. {method!r} "
> ++                    f"(found at least {match.group()!r})")
> ++
> +     def _validate_path(self, url):
> +         """Validate a url for putrequest."""
> +         # Prevent CVE-2019-9740.
> +diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py
> +index 891393ab86..3fa0691d3a 100644
> +--- a/Lib/test/test_httplib.py
> ++++ b/Lib/test/test_httplib.py
> +@@ -363,6 +363,28 @@ class HeaderTests(TestCase):
> +         self.assertEqual(lines[3], "header: Second: val2")
> +
> +
> ++class HttpMethodTests(TestCase):
> ++    def test_invalid_method_names(self):
> ++        methods = (
> ++            'GET\r',
> ++            'POST\n',
> ++            'PUT\n\r',
> ++            'POST\nValue',
> ++            'POST\nHOST:abc',
> ++            'GET\nrHost:abc\n',
> ++            'POST\rRemainder:\r',
> ++            'GET\rHOST:\n',
> ++            '\nPUT'
> ++        )
> ++
> ++        for method in methods:
> ++            with self.assertRaisesRegex(
> ++                    ValueError, "method can't contain control characters"):
> ++                conn = client.HTTPConnection('example.com')
> ++                conn.sock = FakeSocket(None)
> ++                conn.request(method=method, url="/")
> ++
> ++
> + class TransferEncodingTest(TestCase):
> +     expected_body = b"It's just a flesh wound"
> +
> +diff --git a/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst b/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
> +new file mode 100644
> +index 0000000000..990affc3ed
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
> +@@ -0,0 +1,2 @@
> ++Prevent http header injection by rejecting control characters in
> ++http.client.putrequest(...).
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/python/python3_3.7.8.bb b/meta/recipes-devtools/python/python3_3.7.8.bb
> index b18b3cd..cd4bee5 100644
> --- a/meta/recipes-devtools/python/python3_3.7.8.bb
> +++ b/meta/recipes-devtools/python/python3_3.7.8.bb
> @@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>              file://0001-test_locale.py-correct-the-test-output-format.patch \
>              file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
>              file://CVE-2020-14422.patch \
> +           file://CVE-2020-26116.patch \
>              "
>   
>   SRC_URI_append_class-native = " \
>
> 
>
-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


--------------29041434C0941BA5B70B3FDD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Sorry, I recall this mail because I meant to send it to zeus
      branch.<br>
    </p>
    <div class="moz-cite-prefix">On 9/29/20 2:00 PM, Li Zhou wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16392BC9332F69E3.19426@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Backport patch from <a class="moz-txt-link-rfc2396E" href="https://github.com/python/cpython/commit/ca75fec1ed358f7324272608ca952b2d8226d11a">&lt;https://github.com/python/cpython/commit/
ca75fec1ed358f7324272608ca952b2d8226d11a&gt;</a> to solve CVE-2020-26116.

Signed-off-by: Li Zhou <a class="moz-txt-link-rfc2396E" href="mailto:li.zhou@windriver.com">&lt;li.zhou@windriver.com&gt;</a>
---
 .../python/python3/CVE-2020-26116.patch            | 106 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.8.bb      |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-26116.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-26116.patch b/meta/recipes-devtools/python/python3/CVE-2020-26116.patch
new file mode 100644
index 0000000..2820999
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2020-26116.patch
@@ -0,0 +1,106 @@
+From ca75fec1ed358f7324272608ca952b2d8226d11a Mon Sep 17 00:00:00 2001
+From: &quot;Miss Islington (bot)&quot;
+ <a class="moz-txt-link-rfc2396E" href="mailto:31488909+miss-islington@users.noreply.github.com">&lt;31488909+miss-islington@users.noreply.github.com&gt;</a>
+Date: Sun, 19 Jul 2020 02:27:35 -0700
+Subject: [PATCH] bpo-39603: Prevent header injection in http methods
+ (GH-18485) (GH-21538)
+
+reject control chars in http method in http.client.putrequest to prevent http header injection
+(cherry picked from commit 8ca8a2e8fb068863c1138f07e3098478ef8be12e)
+
+Co-authored-by: AMIR <a class="moz-txt-link-rfc2396E" href="mailto:31338382+amiremohamadi@users.noreply.github.com">&lt;31338382+amiremohamadi@users.noreply.github.com&gt;</a>
+
+Upstream-Status: Backport
+CVE: CVE-2020-26116
+Signed-off-by: Li Zhou <a class="moz-txt-link-rfc2396E" href="mailto:li.zhou@windriver.com">&lt;li.zhou@windriver.com&gt;</a>
+---
+ Lib/http/client.py                            | 15 +++++++++++++
+ Lib/test/test_httplib.py                      | 22 +++++++++++++++++++
+ .../2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst  |  2 ++
+ 3 files changed, 39 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
+
+diff --git a/Lib/http/client.py b/Lib/http/client.py
+index 09c57af865..04cd8f7d84 100644
+--- a/Lib/http/client.py
++++ b/Lib/http/client.py
+@@ -150,6 +150,10 @@ _contains_disallowed_url_pchar_re = re.compile('[\x00-\x20\x7f]')
+ #  _is_allowed_url_pchars_re = re.compile(r<a class="moz-txt-link-rfc2396E" href="mailto:^[/!$&amp;'()*+,;=:@%a-zA-Z0-9._~-]+$">&quot;^[/!$&amp;'()*+,;=:@%a-zA-Z0-9._~-]+$&quot;</a>)
+ # We are more lenient for assumed real world compatibility purposes.
+ 
++# These characters are not allowed within HTTP method names
++# to prevent http header injection.
++_contains_disallowed_method_pchar_re = re.compile('[\x00-\x1f]')
++
+ # We always set the Content-Length header for these methods because some
+ # servers will otherwise respond with a 411
+ _METHODS_EXPECTING_BODY = {'PATCH', 'POST', 'PUT'}
+@@ -1109,6 +1113,8 @@ class HTTPConnection:
+         else:
+             raise CannotSendRequest(self.__state)
+ 
++        self._validate_method(method)
++
+         # Save the method for use later in the response phase
+         self._method = method
+ 
+@@ -1199,6 +1205,15 @@ class HTTPConnection:
+         # ASCII also helps prevent CVE-2019-9740.
+         return request.encode('ascii')
+ 
++    def _validate_method(self, method):
++        &quot;&quot;&quot;Validate a method name for putrequest.&quot;&quot;&quot;
++        # prevent http header injection
++        match = _contains_disallowed_method_pchar_re.search(method)
++        if match:
++            raise ValueError(
++                    f&quot;method can't contain control characters. {method!r} &quot;
++                    f&quot;(found at least {match.group()!r})&quot;)
++
+     def _validate_path(self, url):
+         &quot;&quot;&quot;Validate a url for putrequest.&quot;&quot;&quot;
+         # Prevent CVE-2019-9740.
+diff --git a/Lib/test/test_httplib.py b/Lib/test/test_httplib.py
+index 891393ab86..3fa0691d3a 100644
+--- a/Lib/test/test_httplib.py
++++ b/Lib/test/test_httplib.py
+@@ -363,6 +363,28 @@ class HeaderTests(TestCase):
+         self.assertEqual(lines[3], &quot;header: Second: val2&quot;)
+ 
+ 
++class HttpMethodTests(TestCase):
++    def test_invalid_method_names(self):
++        methods = (
++            'GET\r',
++            'POST\n',
++            'PUT\n\r',
++            'POST\nValue',
++            'POST\nHOST:abc',
++            'GET\nrHost:abc\n',
++            'POST\rRemainder:\r',
++            'GET\rHOST:\n',
++            '\nPUT'
++        )
++
++        for method in methods:
++            with self.assertRaisesRegex(
++                    ValueError, &quot;method can't contain control characters&quot;):
++                conn = client.HTTPConnection('example.com')
++                conn.sock = FakeSocket(None)
++                conn.request(method=method, url=&quot;/&quot;)
++
++
+ class TransferEncodingTest(TestCase):
+     expected_body = b&quot;It's just a flesh wound&quot;
+ 
+diff --git a/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst b/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
+new file mode 100644
+index 0000000000..990affc3ed
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2020-02-12-14-17-39.bpo-39603.Gt3RSg.rst
+@@ -0,0 +1,2 @@
++Prevent http header injection by rejecting control characters in
++http.client.putrequest(...).
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3_3.7.8.bb b/meta/recipes-devtools/python/python3_3.7.8.bb
index b18b3cd..cd4bee5 100644
--- a/meta/recipes-devtools/python/python3_3.7.8.bb
+++ b/meta/recipes-devtools/python/python3_3.7.8.bb
@@ -30,6 +30,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz\file://0001-test_locale.py-correct-the-test-output-format.patch\file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch\file://CVE-2020-14422.patch\+file://CVE-2020-26116.patch\">&quot;http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
            file://CVE-2020-14422.patch \
+           file://CVE-2020-26116.patch \
            &quot;</a>
 
 SRC_URI_append_class-native = &quot; \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">
-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511</pre>
  </body>
</html>

--------------29041434C0941BA5B70B3FDD--
