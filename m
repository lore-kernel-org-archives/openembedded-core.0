Return-Path: <srikanthx.x.bheemanadhuni@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 97D526C5A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 06:40:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2018 22:40:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,268,1539673200"; 
	d="scan'208,217,223";a="110850642"
Received: from pgsmsx108.gar.corp.intel.com ([10.221.44.103])
	by orsmga002.jf.intel.com with ESMTP; 22 Nov 2018 22:40:47 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.244]) by
	PGSMSX108.gar.corp.intel.com ([169.254.8.100]) with mapi id
	14.03.0415.000; Fri, 23 Nov 2018 14:40:46 +0800
From: "Bheemanadhuni, SrikanthX X" <srikanthx.x.bheemanadhuni@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: oe-selftest : Unset SANITY_TESTED_DISTROS bugzilla: 11933
Thread-Index: AdSC0oiubnp5GwIpS4eCp0zMLyfWrQAJOFOA
Date: Fri, 23 Nov 2018 06:40:45 +0000
Message-ID: <0473F6BDF4E7AC46B8E60219F1EDEEBC3C0A39@PGSMSX101.gar.corp.intel.com>
References: <0473F6BDF4E7AC46B8E60219F1EDEEBC3C09B6@PGSMSX101.gar.corp.intel.com>
In-Reply-To: <0473F6BDF4E7AC46B8E60219F1EDEEBC3C09B6@PGSMSX101.gar.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDAyM2VhN2QtNDFiZi00NDVkLTk2ZmItZmFlNmM2NzEwNTM1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUVFWMnZsWHpjcnBTUFJEOFwvcWxGMDRIcEJkMVwvQVRxYVNuSHRoSFAwVktTdGt5SlFRcGo0dEJQYlwvdlpjUmx3OCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: oe-selftest : Unset SANITY_TESTED_DISTROS bugzilla: 11933
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
X-List-Received-Date: Fri, 23 Nov 2018 06:40:47 -0000
X-Groupsio-MsgNum: 118550
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_0473F6BDF4E7AC46B8E60219F1EDEEBC3C0A39PGSMSX101garcorpi_"

--_004_0473F6BDF4E7AC46B8E60219F1EDEEBC3C0A39PGSMSX101garcorpi_
Content-Type: multipart/alternative;
	boundary="_000_0473F6BDF4E7AC46B8E60219F1EDEEBC3C0A39PGSMSX101garcorpi_"

--_000_0473F6BDF4E7AC46B8E60219F1EDEEBC3C0A39PGSMSX101garcorpi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,


unset the SANITY_TESTED_DISTROS in the function  _add_layer_libs() file b/m=
eta/lib/oeqa/selftest/context.py



And added function remove_variables() which is called in

final:

     self.remove_variables()

the function will comment the the unset SANITY_TESTED_DISTROS in local.conf


Thanks && Best Regards
Srikanth B


--_000_0473F6BDF4E7AC46B8E60219F1EDEEBC3C0A39PGSMSX101garcorpi_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<pre style=3D"background:white"><span style=3D"font-size:12.0pt;color:black=
">unset the SANITY_TESTED_DISTROS in the function&nbsp; _add_layer_libs() f=
ile b/meta/lib/oeqa/selftest/context.py<o:p></o:p></span></pre>
<pre style=3D"background:white"><span style=3D"font-size:12.0pt;color:black=
"><o:p>&nbsp;</o:p></span></pre>
<pre style=3D"background:white"><span style=3D"font-size:12.0pt;color:black=
">And added function remove_variables() which is called in <o:p></o:p></spa=
n></pre>
<pre style=3D"background:white"><span style=3D"font-size:12.0pt;color:black=
">final:<o:p></o:p></span></pre>
<pre style=3D"background:white"><span style=3D"font-size:12.0pt;color:black=
">&nbsp;&nbsp;&nbsp;&nbsp; self.remove_variables()<o:p></o:p></span></pre>
<pre style=3D"background:white"><span style=3D"font-size:12.0pt;color:black=
">the function will comment the the unset SANITY_TESTED_DISTROS in local.co=
nf<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks &amp;&amp; Best Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Srikanth B<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_0473F6BDF4E7AC46B8E60219F1EDEEBC3C0A39PGSMSX101garcorpi_--

--_004_0473F6BDF4E7AC46B8E60219F1EDEEBC3C0A39PGSMSX101garcorpi_
Content-Type: application/octet-stream;
	name="0001-oe-selftest-Unset-SANITY_TESTED_DISTROS.patch"
Content-Description: 0001-oe-selftest-Unset-SANITY_TESTED_DISTROS.patch
Content-Disposition: attachment;
	filename="0001-oe-selftest-Unset-SANITY_TESTED_DISTROS.patch"; size=2994;
	creation-date="Fri, 23 Nov 2018 02:15:13 GMT";
	modification-date="Fri, 23 Nov 2018 02:15:13 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5YWZiMmNkMjJhNzRlZTk5MTgzNDE3NDVmNzFhOTEwMmI0Mzk3YTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBiaGVlbWExeCA8c3Jpa2FudGh4LnguYmhlZW1hbmFkaHVuaUBp
bnRlbC5jb20+CkRhdGU6IEZyaSwgMjMgTm92IDIwMTggMTA6MTE6MTYgKzA4MDAKU3ViamVjdDog
W1BBVENIXSBvZS1zZWxmdGVzdCA6IFVuc2V0IFNBTklUWV9URVNURURfRElTVFJPUwoKVW5zZXR0
aW5nIFNBTklUWV9URVNURURfRElTVFJPUyB0byBhdm9pZCAgd2FybmluZyB0aGF0CmFyZSB0cmVh
dGVkIGxpa2UgZmFpbHVyZXMgYnkgb2Utc2VsZnRlc3Qgc3VpdGUuCgpTaWduZWQtb2ZmLWJ5OiBi
aGVlbWExeCA8c3Jpa2FudGh4LnguYmhlZW1hbmFkaHVuaUBpbnRlbC5jb20+Ci0tLQogbWV0YS9s
aWIvb2VxYS9zZWxmdGVzdC9jb250ZXh0LnB5IHwgMTkgKysrKysrKysrKysrKy0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jb250ZXh0LnB5IGIvbWV0YS9saWIvb2VxYS9zZWxm
dGVzdC9jb250ZXh0LnB5CmluZGV4IDllOTBkM2MuLjliOGRlMzkgMTAwNjQ0Ci0tLSBhL21ldGEv
bGliL29lcWEvc2VsZnRlc3QvY29udGV4dC5weQorKysgYi9tZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0
L2NvbnRleHQucHkKQEAgLTExLDEyICsxMSwxMiBAQCBmcm9tIHNodXRpbCBpbXBvcnQgY29weWZp
bGUKIGZyb20gcmFuZG9tIGltcG9ydCBjaG9pY2UKIAogaW1wb3J0IG9lcWEKLQoraW1wb3J0IG9l
cWEudXRpbHMuZnRvb2xzIGFzIGZ0b29scwogZnJvbSBvZXFhLmNvcmUuY29udGV4dCBpbXBvcnQg
T0VUZXN0Q29udGV4dCwgT0VUZXN0Q29udGV4dEV4ZWN1dG9yCiBmcm9tIG9lcWEuY29yZS5leGNl
cHRpb24gaW1wb3J0IE9FUUFQcmVSdW4sIE9FUUFUZXN0Tm90Rm91bmQKIAogZnJvbSBvZXFhLnV0
aWxzLmNvbW1hbmRzIGltcG9ydCBydW5DbWQsIGdldF9iYl92YXJzLCBnZXRfdGVzdF9sYXllcgot
CitsYXllcmFwcGVuZCA9ICcnCiBjbGFzcyBPRVNlbGZ0ZXN0VGVzdENvbnRleHQoT0VUZXN0Q29u
dGV4dCk6CiAgICAgZGVmIF9faW5pdF9fKHNlbGYsIHRkPU5vbmUsIGxvZ2dlcj1Ob25lLCBtYWNo
aW5lcz1Ob25lLCBjb25maWdfcGF0aHM9Tm9uZSk6CiAgICAgICAgIHN1cGVyKE9FU2VsZnRlc3RU
ZXN0Q29udGV4dCwgc2VsZikuX19pbml0X18odGQsIGxvZ2dlcikKQEAgLTE4NiwxNiArMTg2LDIz
IEBAIGNsYXNzIE9FU2VsZnRlc3RUZXN0Q29udGV4dEV4ZWN1dG9yKE9FVGVzdENvbnRleHRFeGVj
dXRvcik6CiAgICAgICAgIGlmICJQUlNFUlZfSE9TVCIgaW4gc2VsZi50Yy50ZDoKICAgICAgICAg
ICAgIHNlbGYudGMubG9nZ2VyLmVycm9yKCJQbGVhc2UgdW5zZXQgUFJTRVJWX0hPU1QgaW4gb3Jk
ZXIgdG8gcnVuIG9lLXNlbGZ0ZXN0IikKICAgICAgICAgICAgIHJhaXNlIE9FUUFQcmVSdW4KLQor
ICAgICAgICBidWlsZGRpciA9IG9zLmVudmlyb24uZ2V0KCJCVUlMRERJUiIpCiAgICAgICAgIGlm
ICJTQU5JVFlfVEVTVEVEX0RJU1RST1MiIGluIHNlbGYudGMudGQ6Ci0gICAgICAgICAgICBzZWxm
LnRjLmxvZ2dlci5lcnJvcigiUGxlYXNlIHVuc2V0IFNBTklUWV9URVNURURfRElTVFJPUyBpbiBv
cmRlciB0byBydW4gb2Utc2VsZnRlc3QiKQotICAgICAgICAgICAgcmFpc2UgT0VRQVByZVJ1bgor
ICAgICAgICAgICAgc2VsZi5sYXllcmFwcGVuZCA9ICJcbiNVbnNldCBTQU5JVFlfVEVTVEVEX0RJ
U1RST1MgYWRkZWQgYnkgb2Utc2VsZnRlc3QucHlcblNBTklUWV9URVNURURfRElTVFJPUz0nJyIK
KyAgICAgICAgICAgIGZ0b29scy5hcHBlbmRfZmlsZShidWlsZGRpciArICIvY29uZi9sb2NhbC5j
b25mIiwgc2VsZi5sYXllcmFwcGVuZCkKIAogICAgICAgICBfYWRkX2xheWVyX2xpYnMoKQogCiAg
ICAgICAgIHNlbGYudGMubG9nZ2VyLmluZm8oIlJ1bm5pbmcgYml0YmFrZSAtcCIpCiAgICAgICAg
IHJ1bkNtZCgiYml0YmFrZSAtcCIpCiAKKyAgICAgICAgZGVmIHJlbW92ZV92YXJpYWJsZXMoKToK
KyAgICAgICAgICAgIGlmICIjVW5zZXQgU0FOSVRZX1RFU1RFRF9ESVNUUk9TIGFkZGVkIGJ5IG9l
LXNlbGZ0ZXN0LnB5IiBcCisgICAgICAgICAgICAgICAgICBpbiBmdG9vbHMucmVhZF9maWxlKG9z
LnBhdGguam9pbihidWlsZGRpciwgImNvbmYvbG9jYWwuY29uZiIpKToKKyAgICAgICAgICAgICAg
ICAgIHNlbGYudGMubG9nZ2VyLmluZm8oIlJlbW92aW5nIFNBTklUWV9URVNURURfRElTVFJPUyBm
cm9tIGxvY2FsLmNvbmYiKQorICAgICAgICAgICAgICAgICAgZnRvb2xzLnJlbW92ZV9mcm9tX2Zp
bGUob3MucGF0aC5qb2luKGJ1aWxkZGlyLCAiY29uZi9sb2NhbC5jb25mIiksIFwKKyAgICAgICAg
ICAgICAgICAgICAiXG4jVW5zZXQgU0FOSVRZX1RFU1RFRF9ESVNUUk9TIGFkZGVkIGJ5IG9lLXNl
bGZ0ZXN0LnB5XG5TQU5JVFlfVEVTVEVEX0RJU1RST1M9JyciKQorCiAgICAgZGVmIF9pbnRlcm5h
bF9ydW4oc2VsZiwgbG9nZ2VyLCBhcmdzKToKICAgICAgICAgc2VsZi5tb2R1bGVfcGF0aHMgPSBz
ZWxmLl9nZXRfY2FzZXNfcGF0aHMoCiAgICAgICAgICAgICAgICAgc2VsZi50Y19rd2FyZ3NbJ2lu
aXQnXVsndGQnXVsnQkJQQVRIJ10uc3BsaXQoJzonKSkKQEAgLTI3Myw3ICsyODAsNyBAQCBjbGFz
cyBPRVNlbGZ0ZXN0VGVzdENvbnRleHRFeGVjdXRvcihPRVRlc3RDb250ZXh0RXhlY3V0b3IpOgog
ICAgICAgICAgICAgaWYgb3MucGF0aC5leGlzdHMob3V0cHV0X2xpbmspOgogICAgICAgICAgICAg
ICAgIG9zLnJlbW92ZShvdXRwdXRfbGluaykKICAgICAgICAgICAgIG9zLnN5bWxpbmsoYXJncy5v
dXRwdXRfbG9nLCBvdXRwdXRfbGluaykKLQorICAgICAgICAgICAgc2VsZi5yZW1vdmVfdmFyaWFi
bGVzKCkKICAgICAgICAgcmV0dXJuIHJjCiAKIF9leGVjdXRvcl9jbGFzcyA9IE9FU2VsZnRlc3RU
ZXN0Q29udGV4dEV4ZWN1dG9yCi0tIAoyLjcuNAoK

--_004_0473F6BDF4E7AC46B8E60219F1EDEEBC3C0A39PGSMSX101garcorpi_--
