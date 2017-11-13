Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DC2047849C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 02:23:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208,217";a="30118431"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Nov 2017 10:23:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 83BE948089F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 10:22:57 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0361.001; Mon, 13 Nov 2017 10:22:59 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: do_configure problem about freerdp
Thread-Index: AdNcJfkNMsYnHDoLRe+/rBbqUGbBNQ==
Date: Mon, 13 Nov 2017 02:22:58 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA151C@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.116]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 83BE948089F6.AADEA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: do_configure problem about freerdp
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
X-List-Received-Date: Mon, 13 Nov 2017 02:23:01 -0000
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_33D4DBCAC5F2D74E96B07F6E7632BF732EEA151CG08CNEXMBPEKD01_"

--_000_33D4DBCAC5F2D74E96B07F6E7632BF732EEA151CG08CNEXMBPEKD01_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxso7oNCg0KICAgV2hlbiBJIGJpdGJha2UgdGhlIGZyZWVyZHAsIEkg
bWV0IHRoZSBkZXBlbmRzIHByb2JsZW0gYWJvdXQgZ3N0cmVhbWUgaW4gZG9f
Y29uZmlndXJlo6wgZG8gYW55b25lIGtub3cgdGhlIHJlYXNvbqO/DQoNCiAg
IEhlcmUgaXMgdGhlIGxvZ6O6DQp8IC0tIENoZWNraW5nIGZvciBtb2R1bGUg
J2dzdHJlYW1lci1hcHAtMS4wID49ICcNCnwgLS0gICBDb21wYXJpc29uIG9w
ZXJhdG9yIGJ1dCBubyB2ZXJzaW9uIGFmdGVyIHBhY2thZ2UgbmFtZSAnZ3N0
cmVhbWVyLWFwcC0xLjAnIGluIGZpbGUgJyhjb21tYW5kIGxpbmUgYXJndW1l
bnRzKScNCnwgLS0gQ2hlY2tpbmcgZm9yIG1vZHVsZSAnZ3N0cmVhbWVyLWF1
ZGlvLTEuMCA+PSAnDQp8IC0tICAgQ29tcGFyaXNvbiBvcGVyYXRvciBidXQg
bm8gdmVyc2lvbiBhZnRlciBwYWNrYWdlIG5hbWUgJ2dzdHJlYW1lci1hdWRp
by0xLjAnIGluIGZpbGUgJyhjb21tYW5kIGxpbmUgYXJndW1lbnRzKScNCnwg
LS0gQ2hlY2tpbmcgZm9yIG1vZHVsZSAnZ3N0cmVhbWVyLWZmdC0xLjAgPj0g
Jw0KfCAtLSAgIENvbXBhcmlzb24gb3BlcmF0b3IgYnV0IG5vIHZlcnNpb24g
YWZ0ZXIgcGFja2FnZSBuYW1lICdnc3RyZWFtZXItZmZ0LTEuMCcgaW4gZmls
ZSAnKGNvbW1hbmQgbGluZSBhcmd1bWVudHMpJw0KfCAtLSBDaGVja2luZyBm
b3IgbW9kdWxlICdnc3RyZWFtZXItcGJ1dGlscy0xLjAgPj0gJw0KfCAtLSAg
IENvbXBhcmlzb24gb3BlcmF0b3IgYnV0IG5vIHZlcnNpb24gYWZ0ZXIgcGFj
a2FnZSBuYW1lICdnc3RyZWFtZXItcGJ1dGlscy0xLjAnIGluIGZpbGUgJyhj
b21tYW5kIGxpbmUgYXJndW1lbnRzKScNCnwgLS0gQ2hlY2tpbmcgZm9yIG1v
ZHVsZSAnZ3N0cmVhbWVyLXZpZGVvLTEuMCA+PSAnDQp8IC0tICAgQ29tcGFy
aXNvbiBvcGVyYXRvciBidXQgbm8gdmVyc2lvbiBhZnRlciBwYWNrYWdlIG5h
bWUgJ2dzdHJlYW1lci12aWRlby0xLjAnIGluIGZpbGUgJyhjb21tYW5kIGxp
bmUgYXJndW1lbnRzKScNCnwgLS0gQ291bGQgTk9UIGZpbmQgR1NUUkVBTUVS
XzFfMCAobWlzc2luZzogR1NUUkVBTUVSXzFfMF9JTkNMVURFX0RJUlMpDQp8
IENNYWtlIFdhcm5pbmcgYXQgY21ha2UvRmluZEZlYXR1cmUuY21ha2U6NDYg
KG1lc3NhZ2UpOg0KfCAgICAgICBmZWF0dXJlIEdTdHJlYW1lcl8xXzAgd2Fz
IHJlcXVlc3RlZCBidXQgY291bGQgbm90IGJlIGZvdW5kISBPTiAvIEZBTFNF
DQp8IENhbGwgU3RhY2sgKG1vc3QgcmVjZW50IGNhbGwgZmlyc3QpOg0KfCAg
IENNYWtlTGlzdHMudHh0OjYyNSAoZmluZF9mZWF0dXJlKQ0KfA0KfA0KfCAt
LSBTa2lwcGluZyBvcHRpb25hbCBmZWF0dXJlIEpQRUcgZm9yIGNvZGVjICh1
c2UgSlBFRyBsaWJyYXJ5KQ0KfCAtLSAgICAgRW5hYmxlIGZlYXR1cmUgSlBF
RyB1c2luZyAiLURXSVRIX0pQRUc9T04iDQp8IC0tIFNraXBwaW5nIG9wdGlv
bmFsIGZlYXR1cmUgeDI2NCBmb3IgY29kZWMgKHVzZSB4MjY0IGxpYnJhcnkp
DQp8IC0tICAgICBFbmFibGUgZmVhdHVyZSB4MjY0IHVzaW5nICItRFdJVEhf
WDI2ND1PTiINCnwgLS0gU2tpcHBpbmcgb3B0aW9uYWwgZmVhdHVyZSBPcGVu
SDI2NCBmb3IgY29kZWMgKHVzZSBPcGVuSDI2NCBsaWJyYXJ5KQ0KfCAtLSAg
ICAgRW5hYmxlIGZlYXR1cmUgT3BlbkgyNjQgdXNpbmcgIi1EV0lUSF9PUEVO
SDI2ND1PTiINCnwgLS0gU2tpcHBpbmcgb3B0aW9uYWwgZmVhdHVyZSBHU00g
Zm9yIGNvZGVjIChHU00gYXVkaW8gY29kZWMgbGlicmFyeSkNCnwgLS0gICAg
IEVuYWJsZSBmZWF0dXJlIEdTTSB1c2luZyAiLURXSVRIX0dTTT1PTiINCnwg
LS0gRnJlZVJEUCBHSVQNCnwgLS0gRmluZGluZyByZWNvbW1lbmRlZCBmZWF0
dXJlIFhLQkZpbGUgZm9yIFgxMSBrZXlib2FyZCAoWDExIGtleWJvYXJkIGZp
bGUgZXh0ZW5zaW9uKQ0KfCAtLSAgICAgRGlzYWJsZSBmZWF0dXJlIFhLQkZp
bGUgdXNpbmcgIi1EV0lUSF9YS0JGSUxFPU9GRiINCnwgLS0gRm91bmQgWEtC
RmlsZTogL3lvY3RvL3dvcmswMDEvZm5zdC96cnEvY29tbXVuaXR5L2J1aWxk
X21hc3Rlci90bXAvd29yay9pNTg2LXBva3ktbGludXgvZnJlZXJkcC8xLjIu
NStnaXRyQVVUT0lOQys2MmRhOWQyOGM2LXIwL3JlY2lwZS1zeXNyb290L3Vz
ci9saWIvbGlieGtiZmlsZS5zbw0KfCAtLSBGcmVlUkRQIEdJVA0KfCAtLSBB
ZGRpbmcgZHluYW1pYyBjaGFubmVsIGNsaWVudCBzZXJ2ZXIgImF1ZGluIjog
QXVkaW8gSW5wdXQgUmVkaXJlY3Rpb24gVmlydHVhbCBDaGFubmVsIEV4dGVu
c2lvbg0KfCAtLSBBZGRpbmcgc3RhdGljIGNoYW5uZWwgY2xpZW50IHNlcnZl
ciAiY2xpcHJkciI6IENsaXBib2FyZCBWaXJ0dWFsIENoYW5uZWwgRXh0ZW5z
aW9uDQp8IC0tIEFkZGluZyBkeW5hbWljIGNoYW5uZWwgY2xpZW50ICJkaXNw
IjogRGlzcGxheSBVcGRhdGUgVmlydHVhbCBDaGFubmVsIEV4dGVuc2lvbg0K
fCAtLSBBZGRpbmcgc3RhdGljIGNoYW5uZWwgY2xpZW50IHNlcnZlciAiZHJk
eW52YyI6IER5bmFtaWMgVmlydHVhbCBDaGFubmVsIEV4dGVuc2lvbg0KfCAt
LSBBZGRpbmcgZGV2aWNlIGNoYW5uZWwgY2xpZW50ICJkcml2ZSI6IERyaXZl
IFJlZGlyZWN0aW9uIFZpcnR1YWwgQ2hhbm5lbCBFeHRlbnNpb24NCnwgLS0g
QWRkaW5nIGR5bmFtaWMgY2hhbm5lbCBjbGllbnQgc2VydmVyICJlY2hvIjog
RWNobyBWaXJ0dWFsIENoYW5uZWwgRXh0ZW5zaW9uDQp8IC0tIEFkZGluZyBz
dGF0aWMgY2hhbm5lbCBjbGllbnQgc2VydmVyICJlbmNvbXNwIjogTXVsdGlw
YXJ0eSBWaXJ0dWFsIENoYW5uZWwgRXh0ZW5zaW9uDQp8IC0tIEFkZGluZyBk
ZXZpY2UgY2hhbm5lbCBjbGllbnQgInBhcmFsbGVsIjogUGFyYWxsZWwgUG9y
dCBWaXJ0dWFsIENoYW5uZWwgRXh0ZW5zaW9uDQp8IC0tIEFkZGluZyBkZXZp
Y2UgY2hhbm5lbCBjbGllbnQgInByaW50ZXIiOiBQcmludCBWaXJ0dWFsIENo
YW5uZWwgRXh0ZW5zaW9uDQp8IC0tIEFkZGluZyBzdGF0aWMgY2hhbm5lbCBj
bGllbnQgInJhaWwiOiBSZW1vdGUgUHJvZ3JhbXMgVmlydHVhbCBDaGFubmVs
IEV4dGVuc2lvbg0KfCAtLSBBZGRpbmcgc3RhdGljIGNoYW5uZWwgY2xpZW50
IHNlcnZlciAicmRwZHIiOiBEZXZpY2UgUmVkaXJlY3Rpb24gVmlydHVhbCBD
aGFubmVsIEV4dGVuc2lvbg0KfCAtLSBBZGRpbmcgZHluYW1pYyBjaGFubmVs
IGNsaWVudCAicmRwZWkiOiBJbnB1dCBWaXJ0dWFsIENoYW5uZWwgRXh0ZW5z
aW9uDQp8IC0tIEFkZGluZyBkeW5hbWljIGNoYW5uZWwgY2xpZW50ICJyZHBn
ZngiOiBHcmFwaGljcyBQaXBlbGluZSBFeHRlbnNpb24NCnwgLS0gQWRkaW5n
IHN0YXRpYyBjaGFubmVsIGNsaWVudCBzZXJ2ZXIgInJkcHNuZCI6IEF1ZGlv
IE91dHB1dCBWaXJ0dWFsIENoYW5uZWwgRXh0ZW5zaW9uDQp8IC0tIEFkZGlu
ZyBzdGF0aWMgY2hhbm5lbCBjbGllbnQgc2VydmVyICJyZW1kZXNrIjogUmVt
b3RlIEFzc2lzdGFuY2UgVmlydHVhbCBDaGFubmVsIEV4dGVuc2lvbg0KfCAt
LSBBZGRpbmcgZGV2aWNlIGNoYW5uZWwgY2xpZW50ICJzZXJpYWwiOiBTZXJp
YWwgUG9ydCBWaXJ0dWFsIENoYW5uZWwgRXh0ZW5zaW9uDQp8IC0tIEFkZGlu
ZyBkZXZpY2UgY2hhbm5lbCBjbGllbnQgInNtYXJ0Y2FyZCI6IFNtYXJ0IENh
cmQgVmlydHVhbCBDaGFubmVsIEV4dGVuc2lvbg0KfCAtLSBBZGRpbmcgZHlu
YW1pYyBjaGFubmVsIGNsaWVudCAidHNtZiI6IFZpZGVvIFJlZGlyZWN0aW9u
IFZpcnR1YWwgQ2hhbm5lbCBFeHRlbnNpb24NCnwgLS0gRmluZGluZyByZXF1
aXJlZCBmZWF0dXJlIFhSYW5kUiBmb3IgWDExIHJhbmRyIChYMTEgcmFuZHIg
ZXh0ZW5zaW9uKQ0KfCAtLSBGb3VuZCBYUkFORFI6IC95b2N0by93b3JrMDAx
L2Zuc3QvenJxL2NvbW11bml0eS9idWlsZF9tYXN0ZXIvdG1wL3dvcmsvaTU4
Ni1wb2t5LWxpbnV4L2ZyZWVyZHAvMS4yLjUrZ2l0ckFVVE9JTkMrNjJkYTlk
MjhjNi1yMC9yZWNpcGUtc3lzcm9vdC91c3IvbGliL2xpYlhyYW5kci5zbw0K
fCBDTWFrZSBFcnJvciBhdCBjaGFubmVscy90c21mL2NsaWVudC9nc3RyZWFt
ZXIvQ01ha2VMaXN0cy50eHQ6MjEgKG1lc3NhZ2UpOg0KfCAgIEdTdHJlYW1l
ciBsaWJyYXJ5IG5vdCBmb3VuZCwgYnV0IHJlcXVpcmVkIGZvciBUU01GIG1v
ZHVsZS4NCnwNCnwNCnwgLS0gQ29uZmlndXJpbmcgaW5jb21wbGV0ZSwgZXJy
b3JzIG9jY3VycmVkIQ0KfCBTZWUgYWxzbyAiL3lvY3RvL3dvcmswMDEvZm5z
dC96cnEvY29tbXVuaXR5L2J1aWxkX21hc3Rlci90bXAvd29yay9pNTg2LXBv
a3ktbGludXgvZnJlZXJkcC8xLjIuNStnaXRyQVVUT0lOQys2MmRhOWQyOGM2
LXIwL2J1aWxkL0NNYWtlRmlsZXMvQ01ha2VPdXRwdXQubG9nIi4NCnwgU2Vl
IGFsc28gIi95b2N0by93b3JrMDAxL2Zuc3QvenJxL2NvbW11bml0eS9idWls
ZF9tYXN0ZXIvdG1wL3dvcmsvaTU4Ni1wb2t5LWxpbnV4L2ZyZWVyZHAvMS4y
LjUrZ2l0ckFVVE9JTkMrNjJkYTlkMjhjNi1yMC9idWlsZC9DTWFrZUZpbGVz
L0NNYWtlRXJyb3IubG9nIi4NCnwgV0FSTklORzogZXhpdCBjb2RlIDEgZnJv
bSBhIHNoZWxsIGNvbW1hbmQuDQp8IEVSUk9SOiBGdW5jdGlvbiBmYWlsZWQ6
IGRvX2NvbmZpZ3VyZSAobG9nIGZpbGUgaXMgbG9jYXRlZCBhdCAveW9jdG8v
d29yazAwMS9mbnN0L3pycS9jb21tdW5pdHkvYnVpbGRfbWFzdGVyL3RtcC93
b3JrL2k1ODYtcG9reS1saW51eC9mcmVlcmRwLzEuMi41K2dpdHJBVVRPSU5D
KzYyZGE5ZDI4YzYtcjAvdGVtcC9sb2cuZG9fY29uZmlndXJlLjI4MDEyKQ0K
RVJST1I6IFRhc2sgKC95b2N0by93b3JrMDAxL2Zuc3QvenJxL2NvbW11bml0
eS95b2N0by9tZXRhLW9wZW5lbWJlZGRlZC9tZXRhLW9lL3JlY2lwZXMtc3Vw
cG9ydC9mcmVlcmRwL2ZyZWVyZHBfZ2l0LmJiOmRvX2NvbmZpZ3VyZSkgZmFp
bGVkIHdpdGggZXhpdCBjb2RlICcxJw0KDQpTZWNvbmQgS2V5Ym9hcmQgSW50
ZXJydXB0LCBzdG9wcGluZy4uLg0KDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpaaGVuZyBSdW9xaW4N
Ck5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0
ZC4oRk5TVCkNCkFERFIuOiBOby42IFdlbnpodSBSb2FkLCBTb2Z0d2FyZSBB
dmVudWUsDQogICAgICAgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KTUFJTCA6
IHpoZW5ncnEuZm5zdEBjbi5mdWppc3R1LmNvbQ0KDQoKCg==

--_000_33D4DBCAC5F2D74E96B07F6E7632BF732EEA151CG08CNEXMBPEKD01_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All</span><span style=3D"fon=
t-family:=CB=CE=CC=E5">=A3=BA</span><span lang=3D"EN-US"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; When I bitbake the=
 freerdp, I met the depends problem about gstreame in do_configure</span><s=
pan style=3D"font-family:=CB=CE=CC=E5">=A3=AC</span>
<span lang=3D"EN-US">do anyone know the reason</span><span style=3D"font-fa=
mily:=CB=CE=CC=E5">=A3=BF</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; Here is the log</s=
pan><span style=3D"font-family:=CB=CE=CC=E5">=A3=BA</span><span lang=3D"EN-=
US"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Checking for module 'gstreamer-app-1.0 &gt;=
=3D '<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| --&nbsp;&nbsp; Comparison operator but no versio=
n after package name 'gstreamer-app-1.0' in file '(command line arguments)'=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Checking for module 'gstreamer-audio-1.0 &gt;=
=3D '<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| --&nbsp;&nbsp; Comparison operator but no versio=
n after package name 'gstreamer-audio-1.0' in file '(command line arguments=
)'<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Checking for module 'gstreamer-fft-1.0 &gt;=
=3D '<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| --&nbsp;&nbsp; Comparison operator but no versio=
n after package name 'gstreamer-fft-1.0' in file '(command line arguments)'=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Checking for module 'gstreamer-pbutils-1.0 &g=
t;=3D '<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| --&nbsp;&nbsp; Comparison operator but no versio=
n after package name 'gstreamer-pbutils-1.0' in file '(command line argumen=
ts)'<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Checking for module 'gstreamer-video-1.0 &gt;=
=3D '<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| --&nbsp;&nbsp; Comparison operator but no versio=
n after package name 'gstreamer-video-1.0' in file '(command line arguments=
)'<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Could NOT find GSTREAMER_1_0 (missing: GSTREA=
MER_1_0_INCLUDE_DIRS)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| CMake Warning at cmake/FindFeature.cmake:46 (mes=
sage):<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature GStr=
eamer_1_0 was requested but could not be found! ON / FALSE<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| Call Stack (most recent call first):<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">|&nbsp;&nbsp; CMakeLists.txt:625 (find_feature)<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">|<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">|<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Skipping optional feature JPEG for codec (use=
 JPEG library)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| --&nbsp;&nbsp;&nbsp;&nbsp; Enable feature JPEG u=
sing &quot;-DWITH_JPEG=3DON&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Skipping optional feature x264 for codec (use=
 x264 library)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| --&nbsp;&nbsp;&nbsp;&nbsp; Enable feature x264 u=
sing &quot;-DWITH_X264=3DON&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Skipping optional feature OpenH264 for codec =
(use OpenH264 library)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| --&nbsp;&nbsp;&nbsp;&nbsp; Enable feature OpenH2=
64 using &quot;-DWITH_OPENH264=3DON&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Skipping optional feature GSM for codec (GSM =
audio codec library)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| --&nbsp;&nbsp;&nbsp;&nbsp; Enable feature GSM us=
ing &quot;-DWITH_GSM=3DON&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- FreeRDP GIT<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Finding recommended feature XKBFile for X11 k=
eyboard (X11 keyboard file extension)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| --&nbsp;&nbsp;&nbsp;&nbsp; Disable feature XKBFi=
le using &quot;-DWITH_XKBFILE=3DOFF&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Found XKBFile: /yocto/work001/fnst/zrq/commun=
ity/build_master/tmp/work/i586-poky-linux/freerdp/1.2.5&#43;gitrAUTOINC&#43=
;62da9d28c6-r0/recipe-sysroot/usr/lib/libxkbfile.so<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- FreeRDP GIT<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding dynamic channel client server &quot;au=
din&quot;: Audio Input Redirection Virtual Channel Extension<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding static channel client server &quot;cli=
prdr&quot;: Clipboard Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding dynamic channel client &quot;disp&quot=
;: Display Update Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding static channel client server &quot;drd=
ynvc&quot;: Dynamic Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding device channel client &quot;drive&quot=
;: Drive Redirection Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding dynamic channel client server &quot;ec=
ho&quot;: Echo Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding static channel client server &quot;enc=
omsp&quot;: Multiparty Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding device channel client &quot;parallel&q=
uot;: Parallel Port Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding device channel client &quot;printer&qu=
ot;: Print Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding static channel client &quot;rail&quot;=
: Remote Programs Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding static channel client server &quot;rdp=
dr&quot;: Device Redirection Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding dynamic channel client &quot;rdpei&quo=
t;: Input Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding dynamic channel client &quot;rdpgfx&qu=
ot;: Graphics Pipeline Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding static channel client server &quot;rdp=
snd&quot;: Audio Output Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding static channel client server &quot;rem=
desk&quot;: Remote Assistance Virtual Channel Extension<o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding device channel client &quot;serial&quo=
t;: Serial Port Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding device channel client &quot;smartcard&=
quot;: Smart Card Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Adding dynamic channel client &quot;tsmf&quot=
;: Video Redirection Virtual Channel Extension<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Finding required feature XRandR for X11 randr=
 (X11 randr extension)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Found XRANDR: /yocto/work001/fnst/zrq/communi=
ty/build_master/tmp/work/i586-poky-linux/freerdp/1.2.5&#43;gitrAUTOINC&#43;=
62da9d28c6-r0/recipe-sysroot/usr/lib/libXrandr.so<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| CMake Error at channels/tsmf/client/gstreamer/CM=
akeLists.txt:21 (message):<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">|&nbsp;&nbsp;
<span style=3D"color:red">GStreamer library not found, but required for TSM=
F module.<o:p></o:p></span></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">|<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">|<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| -- Configuring incomplete, errors occurred!<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| See also &quot;/yocto/work001/fnst/zrq/community=
/build_master/tmp/work/i586-poky-linux/freerdp/1.2.5&#43;gitrAUTOINC&#43;62=
da9d28c6-r0/build/CMakeFiles/CMakeOutput.log&quot;.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| See also &quot;/yocto/work001/fnst/zrq/community=
/build_master/tmp/work/i586-poky-linux/freerdp/1.2.5&#43;gitrAUTOINC&#43;62=
da9d28c6-r0/build/CMakeFiles/CMakeError.log&quot;.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| WARNING: exit code 1 from a shell command.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">| ERROR: Function failed: do_configure (log file i=
s located at /yocto/work001/fnst/zrq/community/build_master/tmp/work/i586-p=
oky-linux/freerdp/1.2.5&#43;gitrAUTOINC&#43;62da9d28c6-r0/temp/log.do_confi=
gure.28012)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">ERROR: Task (/yocto/work001/fnst/zrq/community/yoc=
to/meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb:do_conf=
igure) failed with exit code '1'<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:10.5pt;mso-para-margin-left:1.0=
gd"><span lang=3D"EN-US">Second Keyboard Interrupt, stopping...<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">--------------------------------------------------<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">Zheng Ruoqin<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">ADDR.: No.6 Wenzhu Road, Software Avenue,<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nanjing, 210012, China<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">MAIL : zhengrq.fnst@cn.fujistu.com<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_33D4DBCAC5F2D74E96B07F6E7632BF732EEA151CG08CNEXMBPEKD01_--
