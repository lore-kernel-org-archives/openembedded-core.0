Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D32AF6F769
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 23:25:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s37NPtnf025334
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Apr 2014 16:25:56 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.109]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0169.001;
	Mon, 7 Apr 2014 16:25:55 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: libxslt populate_sysroot dependencies
Thread-Index: Ac9St9lECD/KPBdYT26R1f74B7GePg==
Date: Mon, 7 Apr 2014 23:25:55 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF8455D24E2D@ALA-MBA.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.76]
MIME-Version: 1.0
Subject: libxslt populate_sysroot dependencies
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
X-List-Received-Date: Mon, 07 Apr 2014 23:26:00 -0000
X-Groupsio-MsgNum: 52240
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_007BD92917A2324FA403BCF9A464CF8455D24E2DALAMBAcorpadwrs_"

--_004_007BD92917A2324FA403BCF9A464CF8455D24E2DALAMBAcorpadwrs_
Content-Type: multipart/alternative;
	boundary="_000_007BD92917A2324FA403BCF9A464CF8455D24E2DALAMBAcorpadwrs_"

--_000_007BD92917A2324FA403BCF9A464CF8455D24E2DALAMBAcorpadwrs_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have attached a patch that makes sure libxml2-native is available when bo=
th it and libxslt-native
are taken from sstate.

The patch parallels one from a few weeks ago for pixbufcache, but the under=
lying problem might
have been fixed since then.  I looked for likely commits, and didn't see an=
ything, so this patch
might still be needed.

Joe


--_000_007BD92917A2324FA403BCF9A464CF8455D24E2DALAMBAcorpadwrs_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I have attached a patch that makes sure libxml2-nati=
ve is available when both it and libxslt-native<o:p></o:p></p>
<p class=3D"MsoNormal">are taken from sstate.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The patch parallels one from a few weeks ago for pix=
bufcache, but the underlying problem might<o:p></o:p></p>
<p class=3D"MsoNormal">have been fixed since then.&nbsp; I looked for likel=
y commits, and didn't see anything, so this patch<o:p></o:p></p>
<p class=3D"MsoNormal">might still be needed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Joe<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_007BD92917A2324FA403BCF9A464CF8455D24E2DALAMBAcorpadwrs_--

--_004_007BD92917A2324FA403BCF9A464CF8455D24E2DALAMBAcorpadwrs_
Content-Type: application/octet-stream;
	name="0001-libxslt-native-add-populate_sysroot-dependencies.patch"
Content-Description: 0001-libxslt-native-add-populate_sysroot-dependencies.patch
Content-Disposition: attachment;
	filename="0001-libxslt-native-add-populate_sysroot-dependencies.patch";
	size=1400; creation-date="Mon, 07 Apr 2014 23:23:12 GMT";
	modification-date="Mon, 07 Apr 2014 21:42:45 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5MjE4NDZiOGMwNGMzYWNmOTllYWM2YzIwY2QyZmJmOTU1ZjA0MmQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2UgU2xhdGVyIDxqc2xhdGVyQHdpbmRyaXZlci5jb20+CkRh
dGU6IE1vbiwgNyBBcHIgMjAxNCAxNDozNzoyNSAtMDcwMApTdWJqZWN0OiBbUEFUQ0ggMS8xXSBs
aWJ4c2x0LW5hdGl2ZTogYWRkIHBvcHVsYXRlX3N5c3Jvb3QgZGVwZW5kZW5jaWVzCgpXaGVuIGxp
YnhzbHQtbmF0aXZlIHBvcHVsYXRlcyBzeXNyb290IGZyb20gc3N0YXRlIHdlCm5lZWQgdG8gZGVw
ZW5kIG9uIGxpYnhtbDIuICBJZiB3ZSBkbyBub3QsIHhzbHRwcm9jIG1pZ2h0CnRyeSB0byB1c2Ug
dGhlIGhvc3QgbGlieG1sMiwgd2hpY2ggaXQgd2FzIG5vdCBsaW5rZWQgYWdhaW5zdC4KClNpZ25l
ZC1vZmYtYnk6IEpvZSBTbGF0ZXIgPGpzbGF0ZXJAd2luZHJpdmVyLmNvbT4KLS0tCiBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4xLjI4LmJiIHwgICAgOSArKysrKysrKysK
IDEgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8xLjEuMjguYmIgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4xLjI4LmJiCmluZGV4IGFlMmU2
YjEuLmFiNTZmZGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGli
eHNsdF8xLjEuMjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0
XzEuMS4yOC5iYgpAQCAtMzcsMyArMzcsMTIgQEAgRklMRVNfJHtQTn0gKz0gIiR7bGliZGlyfS9s
aWJ4c2x0LXBsdWdpbnMiCiBGSUxFU18ke1BOfS1kZXYgKz0gIiR7bGliZGlyfS94c2x0Q29uZi5z
aCIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUiCisKKyMgSW4gb3JkZXIgdG8gYmUgc3VyZSB4
c2x0cHJvYyBjYW4gcnVuIGFmdGVyIG91ciBwb3B1bGF0ZV9zeXNyb290X3NldHNjZW5lLCB3ZSBu
ZWVkCisjIHRvIGhhdmUgcnVudGltZSBkZXBlbmRlbmNpZXMgaGVyZS4gIEJvdGggc2V0cyBvZiBk
ZXBlbmRlbmNpZXMgYXJlIG5lY2Vzc2FyeSEKKyMKK0xPQ0FMX1NZU1JPT1RfREVQUyA9ICIiCitM
T0NBTF9TWVNST09UX0RFUFNfY2xhc3MtbmF0aXZlID0gImxpYnhtbDItbmF0aXZlOmRvX3BvcHVs
YXRlX3N5c3Jvb3Rfc2V0c2NlbmUiCitkb19wb3B1bGF0ZV9zeXNyb290X3NldHNjZW5lW2RlcGVu
ZHNdICs9ICIke0xPQ0FMX1NZU1JPT1RfREVQU30iCitkb19wb3B1bGF0ZV9zeXNyb290W2RlcGVu
ZHNdICs9ICIke0BkLmdldFZhcignTE9DQUxfU1lTUk9PVF9ERVBTJywgVHJ1ZSkucmVwbGFjZSgn
X3NldHNjZW5lJywnJyl9IgorCi0tIAoxLjcuMy40Cgo=

--_004_007BD92917A2324FA403BCF9A464CF8455D24E2DALAMBAcorpadwrs_--
