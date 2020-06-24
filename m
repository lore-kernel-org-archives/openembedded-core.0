Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.9758.1592990535071902623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 02:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,274,1589212800"; 
   d="scan'208,217";a="95222737"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jun 2020 17:22:06 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 494994CE3F1A
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 17:11:39 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Jun 2020 17:22:02 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([::1]) by
 G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::4086:9520:5ef9:407d%14]) with mapi
 id 15.00.1497.006; Wed, 24 Jun 2020 17:22:02 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 2.6.7 -> 2.6.8
Thread-Topic: [OE-core] [PATCH] harfbuzz: upgrade 2.6.7 -> 2.6.8
Thread-Index: AQHWSgH5AWkHddBRlEuSskFRKakTAA==
Date: Wed, 24 Jun 2020 09:22:02 +0000
Message-ID: <1592990521388.45790@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.33.78]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 494994CE3F1A.A706C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_159299052138845790cnfujitsucom_"

--_000_159299052138845790cnfujitsucom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

Pz9TaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGNuLmZ1aml0
c3UuY29tPg0KLS0tDQogLi4uL2hhcmZidXp6L3toYXJmYnV6el8yLjYuNy5i
YiA9PiBoYXJmYnV6el8yLjYuOC5iYn0gICAgICAgICB8IDQgKystLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei97aGFy
ZmJ1enpfMi42LjcuYmIgPT4gaGFyZmJ1enpfMi42LjguYmJ9ICg5MiUpDQoN
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enov
aGFyZmJ1enpfMi42LjcuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFy
ZmJ1enovaGFyZmJ1enpfMi42LjguYmINCnNpbWlsYXJpdHkgaW5kZXggOTIl
DQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enov
aGFyZmJ1enpfMi42LjcuYmINCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMi42LjguYmINCmluZGV4IDRmNzlk
YTQxNzAuLjNjNGE1YjVhMmIgMTAwNjQ0DQotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMi42LjcuYmINCisrKyBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8yLjYuOC5i
Yg0KQEAgLTExLDggKzExLDggQEAgVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0
dHBzOi8vZ2l0aHViLmNvbS8ke0JQTn0vJHtCUE59L3JlbGVhc2VzIg0KIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gImhhcmZidXp6LSg/UDxwdmVyPlxkKyhc
LlxkKykrKS50YXIiDQoNCiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNv
bS8ke0JQTn0vJHtCUE59L3JlbGVhc2VzL2Rvd25sb2FkLyR7UFZ9LyR7QlBO
fS0ke1BWfS50YXIueHoiDQotU1JDX1VSSVttZDVzdW1dID0gIjNiODg0NTg2
YTA5MzI4YzVmYWU3NmQ4YzIwMGIwZTFjIg0KLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI0OWU0ODFkMDZjZGZmOTdiZjY4ZDk5ZmEyNmJkZjc4NTMzMWY0MTE2
MTQ0ODVkODkyZWE0Yzc4ZWI0NzliMjE4Ig0KK1NSQ19VUklbbWQ1c3VtXSA9
ICJjOGQ0ZjJhZWVkNmU1NzZiZDQyZjlkYzZkZWYxYjFhZSINCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNjY0OGE1NzFhMjdmMTg2ZTQ3MDk0MTIxZjAwOTVl
MWI4MDllOTE4YjMwMzdjNjMwYzdmMzhmZmFkODZlMzAzNSINCg0KIGluaGVy
aXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBsaWJfcGFja2FnZSBndGstZG9jDQoN
Ci0tDQoyLjE3LjENCg0KPw0KDQoKCg==

--_000_159299052138845790cnfujitsucom_
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
<div>&nbsp;.../harfbuzz/{harfbuzz_2.6.7.bb =3D&gt; harfbuzz_2.6.8.bb}&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;| 4 &#43;&#43;--</div>
<div>&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)</div>
<div>&nbsp;rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.6.7.bb =3D&gt;=
 harfbuzz_2.6.8.bb} (92%)</div>
<div><br>
</div>
<div>diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.7.bb b/meta/r=
ecipes-graphics/harfbuzz/harfbuzz_2.6.8.bb</div>
<div>similarity index 92%</div>
<div>rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.6.7.bb</div>
<div>rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.6.8.bb</div>
<div>index 4f79da4170..3c4a5b5a2b 100644</div>
<div>--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.7.bb</div>
<div>&#43;&#43;&#43; b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.8.bb</di=
v>
<div>@@ -11,8 &#43;11,8 @@ UPSTREAM_CHECK_URI =3D &quot;https://github.com/=
${BPN}/${BPN}/releases&quot;</div>
<div>&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;harfbuzz-(?P&lt;pver&gt;\d&#43;(\=
.\d&#43;)&#43;).tar&quot;</div>
<div><br>
</div>
<div>&nbsp;SRC_URI =3D &quot;https://github.com/${BPN}/${BPN}/releases/down=
load/${PV}/${BPN}-${PV}.tar.xz&quot;</div>
<div>-SRC_URI[md5sum] =3D &quot;3b884586a09328c5fae76d8c200b0e1c&quot;</div>
<div>-SRC_URI[sha256sum] =3D &quot;49e481d06cdff97bf68d99fa26bdf785331f4116=
14485d892ea4c78eb479b218&quot;</div>
<div>&#43;SRC_URI[md5sum] =3D &quot;c8d4f2aeed6e576bd42f9dc6def1b1ae&quot;<=
/div>
<div>&#43;SRC_URI[sha256sum] =3D &quot;6648a571a27f186e47094121f0095e1b809e=
918b3037c630c7f38ffad86e3035&quot;</div>
<div><br>
</div>
<div>&nbsp;inherit autotools pkgconfig lib_package gtk-doc</div>
<div><br>
</div>
<div>--</div>
<div>2.17.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_159299052138845790cnfujitsucom_--
