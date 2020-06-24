Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.9829.1592990533945896398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 02:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,274,1589212800"; 
   d="scan'208,217";a="95222716"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jun 2020 17:22:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id EB1C94CE49C9
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 17:11:36 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Jun 2020 17:21:59 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([::1]) by
 G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::4086:9520:5ef9:407d%14]) with mapi
 id 15.00.1497.006; Wed, 24 Jun 2020 17:21:59 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] valgrind: upgrade 3.16.0 -> 3.16.1
Thread-Topic: [OE-core] [PATCH] valgrind: upgrade 3.16.0 -> 3.16.1
Thread-Index: AQHWSgJGFjpLZlOwZ0+YjqGb9hJFlA==
Date: Wed, 24 Jun 2020 09:21:59 +0000
Message-ID: <1592990518861.84235@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.33.78]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: EB1C94CE49C9.AA260
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_159299051886184235cnfujitsucom_"

--_000_159299051886184235cnfujitsucom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

Pz9TaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGNuLmZ1aml0
c3UuY29tPg0KLS0tDQogLi4uL3ZhbGdyaW5kL3t2YWxncmluZF8zLjE2LjAu
YmIgPT4gdmFsZ3JpbmRfMy4xNi4xLmJifSAgICAgICB8IDQgKystLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC97dmFs
Z3JpbmRfMy4xNi4wLmJiID0+IHZhbGdyaW5kXzMuMTYuMS5iYn0gKDk4JSkN
Cg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmlu
ZC92YWxncmluZF8zLjE2LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dmFsZ3JpbmQvdmFsZ3JpbmRfMy4xNi4xLmJiDQpzaW1pbGFyaXR5IGluZGV4
IDk4JQ0KcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdy
aW5kL3ZhbGdyaW5kXzMuMTYuMC5iYg0KcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy92YWxncmluZC92YWxncmluZF8zLjE2LjEuYmINCmluZGV4
IDRiNmY1OTQ5ZGQuLjQ4NGEyMjlhMWEgMTAwNjQ0DQotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRfMy4xNi4wLmJiDQor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRf
My4xNi4xLmJiDQpAQCAtNDEsOCArNDEsOCBAQCBTUkNfVVJJID0gImh0dHBz
Oi8vc291cmNld2FyZS5vcmcvcHViL3ZhbGdyaW5kL3ZhbGdyaW5kLSR7UFZ9
LnRhci5iejIgXA0KICAgICAgICAgICAgZmlsZTovLzAwMDEtbm9uZS10ZXN0
cy1mZGxlYWtfY21zZy5zdGRlcnIuZXhwLWFkanVzdC10bXAtcGF0aHMucGF0
Y2ggXA0KICAgICAgICAgICAgZmlsZTovLzAwMDEtbWVtY2hlY2stdGVzdHMt
Rml4LXRpbWVyZmQtc3lzY2FsbC10ZXN0LnBhdGNoIFwNCiAgICAgICAgICAg
ICINCi1TUkNfVVJJW21kNXN1bV0gPSAiNDk1YjMwYWY1ZTVlZDYyZWJiOWJi
Nzc3ZWUxOWIyN2YiDQotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU4MmQ1MTI3
YmE1NmRmZWFhYjRjNmNlZDkyYTc0MmIyOTIxMTQ4ZTI4YTVkNTUwNTVhZWRk
OGY3NWYxY2Y2MzMiDQorU1JDX1VSSVttZDVzdW1dID0gImQxYjE1M2YxYWIx
N2NmMWYzMTE3MDVlN2E4M2VmNTg5Ig0KK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJjOTFmM2EyZjdiMDJkYjBmM2JjOTk0Nzk4NjE2NTYxNTRkMjQxZDJmZGIy
NjU2MTRiYTkxOGNjNjcyMGEzM2NhIg0KIFVQU1RSRUFNX0NIRUNLX1JFR0VY
ID0gInZhbGdyaW5kLSg/UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIg0KDQog
Q09NUEFUSUJMRV9IT1NUID0gJyhpLjg2fHg4Nl82NHxhcm18YWFyY2g2NHxt
aXBzfHBvd2VycGN8cG93ZXJwYzY0KS4qLWxpbnV4Jw0KLS0NCjIuMTcuMQ0K
DQo/Pw0KDQoKCg==

--_000_159299051886184235cnfujitsucom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none"><!-- p { margin-top: 0px; m=
argin-bottom: 0px; }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<div>&#8203;&#8203;Signed-off-by: Wang Mingyu &lt;wangmy@cn.fujitsu.com&gt;=
</div>
<div>---</div>
<div>&nbsp;.../valgrind/{valgrind_3.16.0.bb =3D&gt; valgrind_3.16.1.bb}&nbs=
p; &nbsp; &nbsp; &nbsp;| 4 &#43;&#43;--</div>
<div>&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)</div>
<div>&nbsp;rename meta/recipes-devtools/valgrind/{valgrind_3.16.0.bb =3D&gt=
; valgrind_3.16.1.bb} (98%)</div>
<div><br>
</div>
<div>diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.0.bb b/meta/=
recipes-devtools/valgrind/valgrind_3.16.1.bb</div>
<div>similarity index 98%</div>
<div>rename from meta/recipes-devtools/valgrind/valgrind_3.16.0.bb</div>
<div>rename to meta/recipes-devtools/valgrind/valgrind_3.16.1.bb</div>
<div>index 4b6f5949dd..484a229a1a 100644</div>
<div>--- a/meta/recipes-devtools/valgrind/valgrind_3.16.0.bb</div>
<div>&#43;&#43;&#43; b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb</d=
iv>
<div>@@ -41,8 &#43;41,8 @@ SRC_URI =3D &quot;https://sourceware.org/pub/val=
grind/valgrind-${PV}.tar.bz2 \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-none-tests-fdlea=
k_cmsg.stderr.exp-adjust-tmp-paths.patch \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-memcheck-tests-F=
ix-timerfd-syscall-test.patch \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;</div>
<div>-SRC_URI[md5sum] =3D &quot;495b30af5e5ed62ebb9bb777ee19b27f&quot;</div>
<div>-SRC_URI[sha256sum] =3D &quot;582d5127ba56dfeaab4c6ced92a742b2921148e2=
8a5d55055aedd8f75f1cf633&quot;</div>
<div>&#43;SRC_URI[md5sum] =3D &quot;d1b153f1ab17cf1f311705e7a83ef589&quot;<=
/div>
<div>&#43;SRC_URI[sha256sum] =3D &quot;c91f3a2f7b02db0f3bc99479861656154d24=
1d2fdb265614ba918cc6720a33ca&quot;</div>
<div>&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;valgrind-(?P&lt;pver&gt;\d&#43;(\=
.\d&#43;)&#43;)\.tar&quot;</div>
<div><br>
</div>
<div>&nbsp;COMPATIBLE_HOST =3D '(i.86|x86_64|arm|aarch64|mips|powerpc|power=
pc64).*-linux'</div>
<div>--</div>
<div>2.17.1</div>
<div><br>
&#8203;&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_159299051886184235cnfujitsucom_--
