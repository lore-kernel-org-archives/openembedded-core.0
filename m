Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.7854.1592401137831466111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 06:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,522,1583164800"; 
   d="scan'208,217";a="94744016"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Jun 2020 21:39:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 808E94CE30F6
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 21:39:00 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 17 Jun 2020 21:39:01 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([::1]) by
 G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::4086:9520:5ef9:407d%14]) with mapi
 id 15.00.1497.006; Wed, 17 Jun 2020 21:39:00 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] powertop: upgrade 2.12 -> 2.13
Thread-Topic: [OE-core] [PATCH] powertop: upgrade 2.12 -> 2.13
Thread-Index: AQHWRKujJEd4mO/cXki1NUWAKfNfTA==
Date: Wed, 17 Jun 2020 13:39:00 +0000
Message-ID: <1592401139618.63424@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.33.78]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 808E94CE30F6.A235C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_159240113961863424cnfujitsucom_"

--_000_159240113961863424cnfujitsucom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

P1NpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAY24uZnVqaXRz
dS5jb20+DQotLS0NCiAuLi4vcG93ZXJ0b3Ave3Bvd2VydG9wXzIuMTIuYmIg
PT4gcG93ZXJ0b3BfMi4xMy5iYn0gICAgICAgICAgICAgfCAyICstDQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3Ave3Bvd2VydG9w
XzIuMTIuYmIgPT4gcG93ZXJ0b3BfMi4xMy5iYn0gKDk1JSkNCg0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3AvcG93ZXJ0b3Bf
Mi4xMi5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3AvcG93ZXJ0
b3BfMi4xMy5iYg0Kc2ltaWxhcml0eSBpbmRleCA5NSUNCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3AvcG93ZXJ0b3BfMi4xMi5i
Yg0KcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3AvcG93
ZXJ0b3BfMi4xMy5iYg0KaW5kZXggZjA4NWQ5YjQ4Mi4uOGM3ZTc4ZmQ5NCAx
MDA2NDQNCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvcG93ZXJ0b3AvcG93
ZXJ0b3BfMi4xMi5iYg0KKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9wb3dl
cnRvcC9wb3dlcnRvcF8yLjEzLmJiDQpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MTJmODg0ZDJhZTFm
Zjg3YzA5ZTViN2NjYzJjNGNhN2UiDQogU1JDX1VSSSA9ICJnaXQ6Ly9naXRo
dWIuY29tL2ZlbnJ1czc1L3Bvd2VydG9wO3Byb3RvY29sPWh0dHBzIFwNCiAg
ICAgZmlsZTovLzAwMDEtd2FrZXVwX3h4eC5oLWluY2x1ZGUtbGltaXRzLmgu
cGF0Y2ggXA0KICINCi1TUkNSRVYgPSAiNjk4OGVhYWE1YmJjZmZmMWRkODZm
NzU3MDA2YzZjNDhjZWM5NjVjNSINCitTUkNSRVYgPSAiMTg0Y2VlMDZiMmQ2
NDY3OWJhZTVmODA2ZmUwYTIxODgyN2ZkZGU5OSINCg0KIFMgPSAiJHtXT1JL
RElSfS9naXQiDQoNCi0tDQoyLjE3LjE/DQoNCgoK

--_000_159240113961863424cnfujitsucom_
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
<div>&#8203;Signed-off-by: Wang Mingyu &lt;wangmy@cn.fujitsu.com&gt;</div>
<div>---</div>
<div>&nbsp;.../powertop/{powertop_2.12.bb =3D&gt; powertop_2.13.bb}&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)</div>
<div>&nbsp;rename meta/recipes-kernel/powertop/{powertop_2.12.bb =3D&gt; po=
wertop_2.13.bb} (95%)</div>
<div><br>
</div>
<div>diff --git a/meta/recipes-kernel/powertop/powertop_2.12.bb b/meta/reci=
pes-kernel/powertop/powertop_2.13.bb</div>
<div>similarity index 95%</div>
<div>rename from meta/recipes-kernel/powertop/powertop_2.12.bb</div>
<div>rename to meta/recipes-kernel/powertop/powertop_2.13.bb</div>
<div>index f085d9b482..8c7e78fd94 100644</div>
<div>--- a/meta/recipes-kernel/powertop/powertop_2.12.bb</div>
<div>&#43;&#43;&#43; b/meta/recipes-kernel/powertop/powertop_2.13.bb</div>
<div>@@ -9,7 &#43;9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D12=
f884d2ae1ff87c09e5b7ccc2c4ca7e&quot;</div>
<div>&nbsp;SRC_URI =3D &quot;git://github.com/fenrus75/powertop;protocol=3D=
https \</div>
<div>&nbsp; &nbsp; &nbsp;file://0001-wakeup_xxx.h-include-limits.h.patch \<=
/div>
<div>&nbsp;&quot;</div>
<div>-SRCREV =3D &quot;6988eaaa5bbcfff1dd86f757006c6c48cec965c5&quot;</div>
<div>&#43;SRCREV =3D &quot;184cee06b2d64679bae5f806fe0a218827fdde99&quot;</=
div>
<div><br>
</div>
<div>&nbsp;S =3D &quot;${WORKDIR}/git&quot;</div>
<div><br>
</div>
<div>--</div>
<div>2.17.1&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_159240113961863424cnfujitsucom_--
