Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.9765.1592990529802341234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 02:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,274,1589212800"; 
   d="scan'208,217";a="95222712"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jun 2020 17:22:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E592B4CE49B3
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 17:11:33 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Jun 2020 17:21:56 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([::1]) by
 G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::4086:9520:5ef9:407d%14]) with mapi
 id 15.00.1497.006; Wed, 24 Jun 2020 17:21:56 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] man-db: upgrade 2.9.2 -> 2.9.3
Thread-Topic: [OE-core] [PATCH] man-db: upgrade 2.9.2 -> 2.9.3
Thread-Index: AQHWSgXvJYL4bSaJgEm+VJfb41W9xg==
Date: Wed, 24 Jun 2020 09:21:56 +0000
Message-ID: <1592990515965.50599@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.33.78]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: E592B4CE49B3.A74C8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_159299051596550599cnfujitsucom_"

--_000_159299051596550599cnfujitsucom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

Pz9TaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGNuLmZ1aml0
c3UuY29tPg0KLS0tDQogLi4uL21hbi1kYi97bWFuLWRiXzIuOS4yLmJiID0+
IG1hbi1kYl8yLjkuMy5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLWRiL3ttYW4tZGJf
Mi45LjIuYmIgPT4gbWFuLWRiXzIuOS4zLmJifSAoOTUlKQ0KDQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1kYi9tYW4tZGJfMi45
LjIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLWRiL21hbi1kYl8y
LjkuMy5iYg0Kc2ltaWxhcml0eSBpbmRleCA5NSUNCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tZGIvbWFuLWRiXzIuOS4yLmJiDQpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1kYi9tYW4tZGJf
Mi45LjMuYmINCmluZGV4IDUzZWJjODU5MjIuLjBlNjAxNmE3M2MgMTAwNjQ0
DQotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLWRiL21hbi1kYl8y
LjkuMi5iYg0KKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1kYi9t
YW4tZGJfMi45LjMuYmINCkBAIC03LDcgKzcsNyBAQCBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9kb2NzL0NPUFlJTkcuTElCO21kNT1hNmY4OWUyMTAw
ZDliNmNkZmZjZWE0ZjM5OGUzNzM0Mw0KIFNSQ19VUkkgPSAiJHtTQVZBTk5B
SF9OT05HTlVfTUlSUk9SfS9tYW4tZGIvbWFuLWRiLSR7UFZ9LnRhci54eiBc
DQogICAgICAgICAgICBmaWxlOi8vOTlfbWFuZGIgXA0KICAgICAgICAgICAg
ZmlsZTovL21hbl9kYi5jb25mLWF2b2lkLW11bHRpbGliLWluc3RhbGwtZmls
ZS1jb25mbGljdC5wYXRjaCINCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2Iz
ODNmMjZjNjc1MjUyMDVmOTZhNGEzYmZiMjc5OTMzOTY5OTI3OTRhZGRhNmZl
MDVhZDU2NWYzNjlmMDQ3YyINCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmE1
YWExMWFiMDY5MmRhZjczN2U3Njk0N2Y0NTY2OTIyNWRiMzEwYjI4MDFhNTkx
MWJjZWI3NTUxYzU1OTdiOCINCg0KIERFUEVORFMgPSAibGlicGlwZWxpbmUg
Z2RibSBncm9mZi1uYXRpdmUgYmFzZS1wYXNzd2QiDQogUkRFUEVORFNfJHtQ
Tn0gKz0gImJhc2UtcGFzc3dkIg0KLS0NCjIuMTcuMT8NCg0KCgo=

--_000_159299051596550599cnfujitsucom_
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
<div>&nbsp;.../man-db/{man-db_2.9.2.bb =3D&gt; man-db_2.9.3.bb}&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;-</div>
<div>&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)</div>
<div>&nbsp;rename meta/recipes-extended/man-db/{man-db_2.9.2.bb =3D&gt; man=
-db_2.9.3.bb} (95%)</div>
<div><br>
</div>
<div>diff --git a/meta/recipes-extended/man-db/man-db_2.9.2.bb b/meta/recip=
es-extended/man-db/man-db_2.9.3.bb</div>
<div>similarity index 95%</div>
<div>rename from meta/recipes-extended/man-db/man-db_2.9.2.bb</div>
<div>rename to meta/recipes-extended/man-db/man-db_2.9.3.bb</div>
<div>index 53ebc85922..0e6016a73c 100644</div>
<div>--- a/meta/recipes-extended/man-db/man-db_2.9.2.bb</div>
<div>&#43;&#43;&#43; b/meta/recipes-extended/man-db/man-db_2.9.3.bb</div>
<div>@@ -7,7 &#43;7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://docs/COPYING.LIB=
;md5=3Da6f89e2100d9b6cdffcea4f398e37343</div>
<div>&nbsp;SRC_URI =3D &quot;${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.=
tar.xz \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://99_mandb \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://man_db.conf-avoid-mul=
tilib-install-file-conflict.patch&quot;</div>
<div>-SRC_URI[sha256sum] =3D &quot;7b383f26c67525205f96a4a3bfb2799339699279=
4adda6fe05ad565f369f047c&quot;</div>
<div>&#43;SRC_URI[sha256sum] =3D &quot;fa5aa11ab0692daf737e76947f45669225db=
310b2801a5911bceb7551c5597b8&quot;</div>
<div><br>
</div>
<div>&nbsp;DEPENDS =3D &quot;libpipeline gdbm groff-native base-passwd&quot=
;</div>
<div>&nbsp;RDEPENDS_${PN} &#43;=3D &quot;base-passwd&quot;</div>
<div>--</div>
<div>2.17.1&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_159299051596550599cnfujitsucom_--
