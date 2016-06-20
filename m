Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0694770034
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 09:36:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208,217";a="7871732"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jun 2016 17:36:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 56846498F58C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 17:36:11 +0800 (CST)
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0279.002; Mon, 20 Jun 2016 17:36:11 +0800
From: "Dai, Caiyun" <daicy.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] openssh: add systemd service file sshd.service
Thread-Index: AdHK1yWXvZjhbmmhQd2Tt6f5F6eaiA==
Date: Mon, 20 Jun 2016 09:36:10 +0000
Message-ID: <F96CF52C4114D94498E9D1443A2CDDE2CDA30BED@G08CNEXMBPEKD02.g08.fujitsu.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.68]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 56846498F58C.AF3E2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] openssh: add systemd service file sshd.service
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jun 2016 09:36:17 -0000
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_F96CF52C4114D94498E9D1443A2CDDE2CDA30BEDG08CNEXMBPEKD02_"

--_000_F96CF52C4114D94498E9D1443A2CDDE2CDA30BEDG08CNEXMBPEKD02_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UGluZw0KDQoNCg0KSWYgc3lzdmluaXQgaXMgZGlzYWJsZWQgZnJvbSBESVNU
Uk9fRkVBVFVSRVMsdGhlbiAvZXRjL2luaXQuZC9zc2hkIHdpbGwgYmUgcmVt
b3ZlZCxhbmQgdGhpcyB3aWxsIGNhdXNlIHNzaGQgZGFlbW9uIGZhaWxlZCB0
byBzdGFydCBieSBzeXN0ZW1kLCBTbyBhZGQgaXQuDQoNCg0KDQpTaWduZWQt
b2ZmLWJ5OiBMaSBYaW4gPGxpeGluLmZuc3RAY24uZnVqaXRzdS5jb208bWFp
bHRvOmxpeGluLmZuc3RAY24uZnVqaXRzdS5jb20+Pg0KDQotLS0NCg0KLi4u
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9zc2hkLnNl
cnZpY2UgfCAxOSArKysrKysrKysrKysrKysrKysrDQoNCm1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzcuMXAyLmJiICAgIHwg
IDkgKysrKysrKy0tDQoNCjIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9zc2hkLnNl
cnZpY2UNCg0KDQoNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L29wZW5zc2gvb3BlbnNzaC9zc2hkLnNlcnZpY2UgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9zc2hkLnNlcnZp
Y2UNCg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCg0KaW5kZXggMDAwMDAwMC4u
NmMwNWYyMw0KDQotLS0gL2Rldi9udWxsDQoNCisrKyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3NzaGQuc2VydmljZQ0K
DQpAQCAtMCwwICsxLDE5IEBADQoNCitbVW5pdF0NCg0KK0Rlc2NyaXB0aW9u
PU9wZW5TU0ggc2VydmVyIGRhZW1vbg0KDQorRG9jdW1lbnRhdGlvbj1tYW46
c3NoZCg4KSBtYW46c3NoZF9jb25maWcoNSkgQWZ0ZXI9bmV0d29yay50YXJn
ZXQNCg0KK3NzaGQta2V5Z2VuLnNlcnZpY2UgV2FudHM9c3NoZC1rZXlnZW4u
c2VydmljZQ0KDQorDQoNCitbU2VydmljZV0NCg0KK1R5cGU9Zm9ya2luZw0K
DQorUElERmlsZT1AbG9jYWxzdGF0ZWRpckAvcnVuL3NzaGQucGlkPG1haWx0
bzorUElERmlsZT1AbG9jYWxzdGF0ZWRpckAvcnVuL3NzaGQucGlkPg0KDQor
RW52aXJvbm1lbnRGaWxlPS1AU1lTQ09ORkRJUkAvc3lzY29uZmlnL3NzaGQN
Cg0KK0V4ZWNTdGFydD1AU0JJTkRJUkAvc3NoZCAkT1BUSU9OUw0KDQorRXhl
Y1JlbG9hZD1AQkFTRV9CSU5ESVJAL2tpbGwgLUhVUCAkTUFJTlBJRCBLaWxs
TW9kZT1wcm9jZXNzDQoNCitSZXN0YXJ0PW9uLWZhaWx1cmUgUmVzdGFydFNl
Yz00MnMNCg0KKw0KDQorW0luc3RhbGxdDQoNCitXYW50ZWRCeT1tdWx0aS11
c2VyLnRhcmdldA0KDQorDQoNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF83LjFwMi5iYiBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzcuMXAyLmJi
DQoNCmluZGV4IDNiNWUyOGEuLjhiMzFiNDAgMTAwNjQ0DQoNCi0tLSBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzcuMXAy
LmJiDQoNCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9vcGVuc3NoXzcuMXAyLmJiDQoNCkBAIC0yMyw3ICsyMyw5IEBAIFNSQ19V
UkkgPSAiZnRwOi8vZnRwLm9wZW5ic2Qub3JnL3B1Yi9PcGVuQlNEL09wZW5T
U0gvcG9ydGFibGUvb3BlbnNzaC0ke1BWfS50YXIuDQoNCiAgICAgICAgICAg
IGZpbGU6Ly9ydW4tcHRlc3Q8ZmlsZTovLy9cXHJ1bi1wdGVzdD4gXA0KDQog
ICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMTYtMTkwN191cHN0cmVhbV9jb21t
aXQucGF0Y2g8ZmlsZTovLy9cXENWRS0yMDE2LTE5MDdfdXBzdHJlYW1fY29t
bWl0LnBhdGNoPiBcDQoNCiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAxNi0x
OTA3XzIucGF0Y2g8ZmlsZTovLy9cXENWRS0yMDE2LTE5MDdfMi5wYXRjaD4g
XA0KDQotICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMTYtMTkwN18zLnBhdGNo
PGZpbGU6Ly8vXFxDVkUtMjAxNi0xOTA3XzMucGF0Y2g+ICINCg0KKyAgICAg
ICAgICAgZmlsZTovL0NWRS0yMDE2LTE5MDdfMy5wYXRjaDxmaWxlOi8vL1xc
Q1ZFLTIwMTYtMTkwN18zLnBhdGNoPiBcDQoNCisgICAgICAgICAgIGZpbGU6
Ly9zc2hkLnNlcnZpY2U8ZmlsZTovLy9cXHNzaGQuc2VydmljZT4iDQoNCisN
Cg0KIFBBTV9TUkNfVVJJID0gImZpbGU6Ly9zc2hkPGZpbGU6Ly8vXFxzc2hk
PiINCg0KQEAgLTM5LDcgKzQxLDcgQEAgSU5JVFNDUklQVF9OQU1FXyR7UE59
LXNzaGQgPSAic3NoZCINCg0KSU5JVFNDUklQVF9QQVJBTVNfJHtQTn0tc3No
ZCA9ICJkZWZhdWx0cyA5Ig0KDQogU1lTVEVNRF9QQUNLQUdFUyA9ICIke1BO
fS1zc2hkIg0KDQotU1lTVEVNRF9TRVJWSUNFXyR7UE59LXNzaGQgPSAic3No
ZC5zb2NrZXQiDQoNCitTWVNURU1EX1NFUlZJQ0VfJHtQTn0tc3NoZCA9ICJz
c2hkLnNvY2tldCBzc2hkLnNlcnZpY2UiDQoNCiBpbmhlcml0IGF1dG90b29s
cy1icm9rZW5zZXAgcHRlc3QNCg0KQEAgLTExOCw5ICsxMjAsMTIgQEAgZG9f
aW5zdGFsbF9hcHBlbmQgKCkgew0KDQogICAgICAgaW5zdGFsbCAtYyAtbSAw
NjQ0ICR7V09SS0RJUn0vc3NoZC5zb2NrZXQgJHtEfSR7c3lzdGVtZF91bml0
ZGlyfS9zeXN0ZW0NCg0KICAgICAgIGluc3RhbGwgLWMgLW0gMDY0NCAke1dP
UktESVJ9L3NzaGRALnNlcnZpY2U8bWFpbHRvOiQlN2JXT1JLRElSJTdkL3Nz
aGRALnNlcnZpY2U+ICR7RH0ke3N5c3RlbWRfdW5pdGRpcn0vc3lzdGVtDQoN
CiAgICAgICBpbnN0YWxsIC1jIC1tIDA2NDQgJHtXT1JLRElSfS9zc2hkZ2Vu
a2V5cy5zZXJ2aWNlICR7RH0ke3N5c3RlbWRfdW5pdGRpcn0vc3lzdGVtDQoN
CisgICAgICAgaW5zdGFsbCAtYyAtbSAwNjQ0ICR7V09SS0RJUn0vc3NoZC5z
ZXJ2aWNlDQoNCiske0R9JHtzeXN0ZW1kX3VuaXRkaXJ9L3N5c3RlbQ0KDQog
ICAgICAgc2VkIC1pIC1lICdzLEBCQVNFX0JJTkRJUkAsJHtiYXNlX2JpbmRp
cn0sZycgXA0KDQogICAgICAgICAgICAgICAgLWUgJ3MsQFNCSU5ESVJALCR7
c2JpbmRpcn0sZycgXA0KDQogICAgICAgICAgICAgICAgLWUgJ3MsQEJJTkRJ
UkAsJHtiaW5kaXJ9LGcnIFwNCg0KKyAgICAgICAgICAgICAgICAtZSAncyxA
U1lTQ09ORkRJUkAsJHtzeXNjb25mZGlyfSxnJyBcDQoNCisgICAgICAgICAg
ICAgICAgLWUgJ3MsQGxvY2Fsc3RhdGVkaXJALCR7bG9jYWxzdGF0ZWRpcn0s
ZycgXA0KDQogICAgICAgICAgICAgICAgJHtEfSR7c3lzdGVtZF91bml0ZGly
fS9zeXN0ZW0vc3NoZC5zb2NrZXQgJHtEfSR7c3lzdGVtZF91bml0ZGlyfS9z
eXN0ZW0vKi5zZXJ2aWNlDQoNCn0NCg0KLS0NCg0KMS44LjQuMg0KDQoNCg0K
DQoNCg0KDQotLQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KDQpPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5n
IGxpc3QNCg0KT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZzxtYWlsdG86T3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4NCg0KaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0KDQoKCg==

--_000_F96CF52C4114D94498E9D1443A2CDDE2CDA30BEDG08CNEXMBPEKD02_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"=B4=BF=CE=C4=B1=BE Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.5pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.Char
	{mso-style-name:"=B4=BF=CE=C4=B1=BE Char";
	mso-style-priority:99;
	mso-style-link:=B4=BF=CE=C4=B1=BE;
	font-family:"Calibri","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Ping<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">If sysvinit is disabled from=
 DISTRO_FEATURES,then /etc/init.d/sshd will be removed,and this will cause =
sshd daemon failed to start by systemd, So add it.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Signed-off-by: Li Xin &lt;<a=
 href=3D"mailto:lixin.fnst@cn.fujitsu.com">lixin.fnst@cn.fujitsu.com</a>&gt=
;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">---<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">.../recipes-connectivity/ope=
nssh/openssh/sshd.service | 19 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">meta/recipes-connectivity/op=
enssh/openssh_7.1p2.bb&nbsp;&nbsp;&nbsp; | &nbsp;9 &#43;&#43;&#43;&#43;&#43=
;&#43;&#43;--<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">2 files changed, 26 insertio=
ns(&#43;), 2 deletions(-)&nbsp; create mode 100644 meta/recipes-connectivit=
y/openssh/openssh/sshd.service<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">diff --git a/meta/recipes-co=
nnectivity/openssh/openssh/sshd.service b/meta/recipes-connectivity/openssh=
/openssh/sshd.service<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">new file mode 100644<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">index 0000000..6c05f23<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">--- /dev/null<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;&#43;&#43; b/meta/recip=
es-connectivity/openssh/openssh/sshd.service<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">@@ -0,0 &#43;1,19 @@<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;[Unit]<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;Description=3DOpenSSH s=
erver daemon<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;Documentation=3Dman:ssh=
d(8) man:sshd_config(5) After=3Dnetwork.target
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;sshd-keygen.service Wan=
ts=3Dsshd-keygen.service<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;[Service]<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;Type=3Dforking<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><a href=3D"mailto:&#43;PIDFi=
le=3D@localstatedir@/run/sshd.pid">&#43;PIDFile=3D@localstatedir@/run/sshd.=
pid</a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;EnvironmentFile=3D-@SYS=
CONFDIR@/sysconfig/sshd<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;ExecStart=3D@SBINDIR@/s=
shd $OPTIONS<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;ExecReload=3D@BASE_BIND=
IR@/kill -HUP $MAINPID KillMode=3Dprocess
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;Restart=3Don-failure Re=
startSec=3D42s<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;[Install]<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;WantedBy=3Dmulti-user.t=
arget<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">diff --git a/meta/recipes-co=
nnectivity/openssh/openssh_7.1p2.bb b/meta/recipes-connectivity/openssh/ope=
nssh_7.1p2.bb<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">index 3b5e28a..8b31b40 10064=
4<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">--- a/meta/recipes-connectiv=
ity/openssh/openssh_7.1p2.bb<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;&#43;&#43; b/meta/recip=
es-connectivity/openssh/openssh_7.1p2.bb<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">@@ -23,7 &#43;23,9 @@ SRC_UR=
I =3D &quot;ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV=
}.tar.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\run-ptest">
file://run-ptest</a> \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\CVE-2016-1907_u=
pstream_commit.patch">
file://CVE-2016-1907_upstream_commit.patch</a> \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\CVE-2016-1907_2=
.patch">
file://CVE-2016-1907_2.patch</a> \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\CVE-2016-1907_3.patc=
h">
file://CVE-2016-1907_3.patch</a> &quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\CVE-2016-1907_3.=
patch">
file://CVE-2016-1907_3.patch</a> \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\sshd.service">
file://sshd.service</a>&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;PAM_SRC_URI =3D &quot;=
<a href=3D"file:///\\sshd">file://sshd</a>&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">@@ -39,7 &#43;41,7 @@ INITSC=
RIPT_NAME_${PN}-sshd =3D &quot;sshd&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">INITSCRIPT_PARAMS_${PN}-sshd=
 =3D &quot;defaults 9&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;SYSTEMD_PACKAGES =3D &=
quot;${PN}-sshd&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-SYSTEMD_SERVICE_${PN}-sshd =
=3D &quot;sshd.socket&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;SYSTEMD_SERVICE_${PN}-s=
shd =3D &quot;sshd.socket sshd.service&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;inherit autotools-brok=
ensep ptest<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">@@ -118,9 &#43;120,12 @@ do_=
install_append () {<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/s=
ystem<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; install -c -m 0644 <a href=3D"mailto:$%7bWORKDIR%7d/sshd@.service">
${WORKDIR}/sshd@.service</a> ${D}${systemd_unitdir}/system<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_un=
itdir}/system<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; install -c -m 0644 ${WORKDIR}/sshd.service
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;${D}${systemd_unitdir}/=
system<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -e 's,@SBIND=
IR@,${sbindir},g' \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -e 's,@BINDI=
R@,${bindir},g' \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -e 's,@=
SYSCONFDIR@,${sysconfdir},g' \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -e 's,@=
localstatedir@,${localstatedir},g' \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}${system=
d_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">}<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">--<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">1.8.4.2<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-- <o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">____________________________=
___________________<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Openembedded-core mailing li=
st<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><a href=3D"mailto:Openembedd=
ed-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a=
><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><a href=3D"http://lists.open=
embedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.=
org/mailman/listinfo/openembedded-core</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_F96CF52C4114D94498E9D1443A2CDDE2CDA30BEDG08CNEXMBPEKD02_--
