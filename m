Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Awais_Belal@mentor.com>) id 1Ty6to-0003LC-9d
	for Openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 21:26:45 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Ty6el-00024A-NN from Awais_Belal@mentor.com 
	for Openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 12:10:47 -0800
Received: from SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 23 Jan 2013 12:10:47 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.46]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.01.0289.001; Wed, 23 Jan 2013 20:10:45 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: Openssl - config file not being pulled in on the install
Thread-Index: Ac35pbcXPhpuDj63SM6UuHtatAld2g==
Date: Wed, 23 Jan 2013 20:10:44 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD289FCCF37B@EU-MBX-03.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.68]
MIME-Version: 1.0
X-OriginalArrivalTime: 23 Jan 2013 20:10:47.0323 (UTC)
	FILETIME=[BB7046B0:01CDF9A5]
Subject: Openssl - config file not being pulled in on the install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 20:26:45 -0000
X-Groupsio-MsgNum: 34299
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_2021B186DC632746BD5A3CE32F12BD289FCCF37BEUMBX03mgcmento_"

--_004_2021B186DC632746BD5A3CE32F12BD289FCCF37BEUMBX03mgcmento_
Content-Type: multipart/alternative;
	boundary="_000_2021B186DC632746BD5A3CE32F12BD289FCCF37BEUMBX03mgcmento_"

--_000_2021B186DC632746BD5A3CE32F12BD289FCCF37BEUMBX03mgcmento_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Guys,

This probably went un-noticed because I forgot to put a subject the first t=
ime around... my bad!

I have a question regarding openssl. The openssl.inc file under the poky pa=
ckage creates a -misc package which is not directly installed unless either=
 put in RDPENEDS or RRECOMMENDS. This package (-misc) contains the openssl =
configuration file which is required while generating certificates on the t=
arget otherwise the command says:

WARNING: can't open config file: /usr/lib/ssl/openssl.cnf
Unable to load config info from /usr/lib/ssl/openssl.cnf

In an older version of the recipe attached here, the correct method is bein=
g (this is my understanding) to get that file in on the target while instal=
ling.

Any guidance here would be much appreciated.

BR,
Awais Belal

--_000_2021B186DC632746BD5A3CE32F12BD289FCCF37BEUMBX03mgcmento_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle"></style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hi Guys,<br>
<br>
This probably went un-noticed because I forgot to put a subject the first t=
ime around... my bad!<br>
<br>
I have a question regarding openssl. The openssl.inc file under the poky pa=
ckage creates a -misc package which is not directly installed unless either=
 put in RDPENEDS or RRECOMMENDS. This package (-misc) contains the openssl =
configuration file which is required
 while generating certificates on the target otherwise the command says:<br=
>
<i><br>
WARNING: can't open config file: /usr/lib/ssl/openssl.cnf</i><i><br>
Unable to load config info from /usr/lib/ssl/openssl.cnf</i><i><br>
</i>
<div><br>
In an older version of the recipe attached here, the correct method is bein=
g (this is my understanding) to get that file in on the target while instal=
ling.<br>
<br>
Any guidance here would be much appreciated.<br>
<br>
<div><font size=3D"1"><span style=3D"font-size: 13px;">
<div style=3D"margin: 0px;"><span lang=3D"en-US"><font face=3D"Calibri,sans=
-serif" size=3D"2"><span style=3D"font-size: 10pt;">BR,</span></font></span=
></div>
<div style=3D"margin: 0px;"><span lang=3D"en-US"><font face=3D"Calibri,sans=
-serif" size=3D"2"><span style=3D"font-size: 10pt;">Awais Belal</span></fon=
t></span></div>
</span></font></div>
</div>
<div>
<div style=3D"font-family:Tahoma; font-size:13px"><span lang=3D"en-US"></sp=
an></div>
</div>
</div>
</body>
</html>

--_000_2021B186DC632746BD5A3CE32F12BD289FCCF37BEUMBX03mgcmento_--

--_004_2021B186DC632746BD5A3CE32F12BD289FCCF37BEUMBX03mgcmento_
Content-Type: application/octet-stream; name="openssl.inc"
Content-Description: openssl.inc
Content-Disposition: attachment; filename="openssl.inc"; size=3372;
	creation-date="Wed, 23 Jan 2013 20:10:40 GMT";
	modification-date="Wed, 23 Jan 2013 20:10:40 GMT"
Content-ID: <a3ddcae2-20b4-4bfd-b979-d18ae16cf982>
Content-Transfer-Encoding: base64

REVTQ1JJUFRJT04gPSAiU2VjdXJlIFNvY2tldCBMYXllciAoU1NMKSBiaW5hcnkgYW5kIHJlbGF0
ZWQgY3J5cHRvZ3JhcGhpYyB0b29scy4iCkhPTUVQQUdFID0gImh0dHA6Ly93d3cub3BlbnNzbC5v
cmcvIgpMSUNFTlNFID0gIm9wZW5zc2wiClNFQ1RJT04gPSAibGlicy9uZXR3b3JrIgoKU1JDX1VS
SSA9ICJodHRwOi8vd3d3Lm9wZW5zc2wub3JnL3NvdXJjZS9vcGVuc3NsLSR7UFZ9LnRhci5nejtu
YW1lPXNyYyIKUyA9ICIke1dPUktESVJ9L29wZW5zc2wtJHtQVn0iCgppbmhlcml0IHNpdGVpbmZv
CgpJTkNfUFIgPSAicjE0IgoKQVJfYXBwZW5kID0gIiByIgpDRkxBRyA9ICIke0BiYXNlX2NvbmRp
dGlvbmFsKCdTSVRFSU5GT19FTkRJQU5ORVNTJywgJ2xlJywgJy1ETF9FTkRJQU4nLCAnLURCX0VO
RElBTicsIGQpfSBcCgktRFRFUk1JTyAke0ZVTExfT1BUSU1JWkFUSU9OfSAtV2FsbCIKCiMgLTAy
IGRvZXMgbm90IHdvcmsgb24gbWlwc2VsOiBzc2ggaGFuZ3Mgd2hlbiBpdCB0cmllcyB0byByZWFk
IC9kZXYvdXJhbmRvbQpDRkxBR19tdHgtMSA6PSAiJHtAJyR7Q0ZMQUd9Jy5yZXBsYWNlKCctTzIn
LCAnJyl9IgpDRkxBR19tdHgtMiA6PSAiJHtAJyR7Q0ZMQUd9Jy5yZXBsYWNlKCctTzInLCAnJyl9
IgoKZXhwb3J0IERJUlMgPSAiY3J5cHRvIHNzbCBhcHBzIgpleHBvcnQgRVhfTElCUyA9ICItbGdj
YyAtbGRsIgpleHBvcnQgQVMgPSAiJHtDQ30gLWMiCgpQQUNLQUdFUyA9KyAibGliY3J5cHRvIGxp
YnNzbCAke1BOfS1taXNjIG9wZW5zc2wtY29uZiIKRklMRVNfbGliY3J5cHRvID0gIiR7bGliZGly
fS9saWJjcnlwdG8uc28uKiIKRklMRVNfbGlic3NsID0gIiR7bGliZGlyfS9saWJzc2wuc28uKiIK
RklMRVNfJHtQTn0tbWlzYyA9ICIke2xpYmRpcn0vc3NsL21pc2MiCgojIEFkZCB0aGUgb3BlbnNz
bC5jbmYgZmlsZSB0byB0aGUgb3BlbnNzbC1jb25mIHBhY2thZ2UuICBNYWtlIHRoZSBsaWJjcnlw
dG8KIyBwYWNrYWdlIFJSRUNPTU1FTkRTIG9uIHRoaXMgcGFja2FnZS4gIFRoaXMgd2lsbCBlbmFi
bGUgdGhlIGNvbmZpZ3VyYXRpb24KIyBmaWxlIHRvIGJlIGluc3RhbGxlZCBmb3IgYm90aCB0aGUg
YmFzZSBvcGVuc3NsIHBhY2thZ2UgYW5kIHRoZSBsaWJjcnlwdG8KIyBwYWNrYWdlIHNpbmNlIHRo
ZSBiYXNlIG9wZW5zc2wgcGFja2FnZSBkZXBlbmRzIG9uIHRoZSBsaWJjcnlwdG8gcGFja2FnZS4K
RklMRVNfb3BlbnNzbC1jb25mID0gIiR7bGliZGlyfS9zc2wvb3BlbnNzbC5jbmYiCkNPTkZGSUxF
U19vcGVuc3NsLWNvbmYgPSAiJHtsaWJkaXJ9L3NzbC9vcGVuc3NsLmNuZiIKUlJFQ09NTUVORFNf
bGliY3J5cHRvICs9ICJvcGVuc3NsLWNvbmYiCgpkb19jb25maWd1cmVfcHJlcGVuZF9kYXJ3aW4g
KCkgewoJc2VkIC1pIC1lICcvdmVyc2lvbi1zY3JpcHQ9b3BlbnNzbFwubGQvZCcgQ29uZmlndXJl
Cn0KCmRvX2NvbmZpZ3VyZSAoKSB7CgljZCB1dGlsCglwZXJsIHBlcmxwYXRoLnBsICR7YmluZGly
fQoJY2QgLi4KCWxuIC1zZiBhcHBzL29wZW5zc2wucG9kIGNyeXB0by9jcnlwdG8ucG9kIHNzbC9z
c2wucG9kIGRvYy8KCglvcz0ke0hPU1RfT1N9CglpZiBbIGBlY2hvICRvcyB8IGdyZXAgLXEgbGlu
dXg7IGVjaG8gJD9gIC1lcSAwIF07IHRoZW4KCQlvcz1saW51eAoJZmkKCXRhcmdldD0iJG9zLSR7
SE9TVF9BUkNIfSIKCWNhc2UgJHRhcmdldCBpbgoJbGludXgtYXJtKQoJCXRhcmdldD1saW51eC1l
bGYtYXJtCgkJOzsKCWxpbnV4LWFybWViKQoJCXRhcmdldD1saW51eC1lbGYtYXJtZWIKCQk7OwoJ
bGludXgtc2gzKQoJCXRhcmdldD1kZWJpYW4tc2gzCgkJOzsKCWxpbnV4LXNoNCkKCQl0YXJnZXQ9
ZGViaWFuLXNoNAoJCTs7CglsaW51eC1pNDg2KQoJCXRhcmdldD1kZWJpYW4taTM4Ni1pNDg2CgkJ
OzsKCWxpbnV4LWk1ODYgfCBsaW51eC12aWFjMykKCQl0YXJnZXQ9ZGViaWFuLWkzODYtaTU4NgoJ
CTs7CglsaW51eC1pNjg2KQoJCXRhcmdldD1kZWJpYW4taTM4Ni1pNjg2L2Ntb3YKCQk7OwoJbGlu
dXgtbWlwcykKCQl0YXJnZXQ9ZGViaWFuLW1pcHMKCQk7OwoJbGludXgtbWlwc2VsKQoJCXRhcmdl
dD1kZWJpYW4tbWlwc2VsCgkJOzsKCWxpbnV4LXBvd2VycGMpCgkJdGFyZ2V0PWxpbnV4LXBwYwoJ
CTs7CglsaW51eC1wb3dlcnBjNjQpCgkJdGFyZ2V0PWxpbnV4LXBwYzY0CgkJOzsKCWxpbnV4LXN1
cGVyc3BhcmMpCgkJdGFyZ2V0PWxpbnV4LXNwYXJjdjgKCQk7OwoJbGludXgtc3BhcmMpCgkJdGFy
Z2V0PWxpbnV4LXNwYXJjdjgKCQk7OwoJZGFyd2luLWkzODYpCgkJdGFyZ2V0PWRhcndpbi1pMzg2
LWNjCgkJOzsKCWVzYWMKCSMgaW5qZWN0IG1hY2hpbmUtc3BlY2lmaWMgZmxhZ3MKCXNlZCAtaSAt
ZSAic3xeXChcIiR0YXJnZXRcIixccypcIlteOl1cK1wpOlwoW146XVwrXCl8XDE6JHtDRkxBR318
ZyIgQ29uZmlndXJlCiAgICAgICAgdXNlcHJlZml4PSR7cHJlZml4fQogICAgICAgIGlmIFsgIngk
dXNlcHJlZml4IiA9ICJ4IiBdOyB0aGVuCiAgICAgICAgICAgICAgICB1c2VwcmVmaXg9LwogICAg
ICAgIGZpICAgICAgICAKCXBlcmwgLi9Db25maWd1cmUgJHtFWFRSQV9PRUNPTkZ9IHNoYXJlZCAt
LXByZWZpeD0kdXNlcHJlZml4IC0tb3BlbnNzbGRpcj0ke2xpYmRpcn0vc3NsICR0YXJnZXQKCgll
dmFsICIke0BiYXNlX2NvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAnbGFyZ2VmaWxlJywgJycs
ICdzZWQgLWkgLWUgIi9fRklMRV9PRkZTRVRfQklUUy8sLyNlbmRpZi9kIiAke1N9L2NyeXB0by9i
aW8vYnNzX2ZpbGUuYycsIGQpfSIKCWV2YWwgIiR7QGJhc2VfY29udGFpbnMoJ0RJU1RST19GRUFU
VVJFUycsICdpcHY2JywgJycsICdzZWQgLWkgLWUgIi9BRl9JTkVUNi8sL2JyZWFrL2QiICR7U30v
Y3J5cHRvL2Jpby9ic3NfZGdyYW0uYycsIGQpfSIKfQoKZG9fY29tcGlsZSAoKSB7CglvZV9ydW5t
YWtlCn0KCmRvX2luc3RhbGwgKCkgewoJb2VfcnVubWFrZSBJTlNUQUxMX1BSRUZJWD0iJHtEfSIg
aW5zdGFsbAoKCSMgT24geDg2XzY0LCBtb3ZlIGxpYi8qIHRvIGxpYjY0CglpZiBbICIke2xpYmRp
cn0iICE9ICIke3ByZWZpeH0vbGliIiBdCgl0aGVuCgkJaW5zdGFsbCAtZCAke0R9JHtsaWJkaXJ9
ICR7RH0ke2xpYmRpcn0vcGtnY29uZmlnCgkJbXYgJHtEfSR7cHJlZml4fS9saWIvbGliKiAke0R9
JHtsaWJkaXJ9CgkJbXYgJHtEfSR7cHJlZml4fS9saWIvcGtnY29uZmlnLyoucGMgJHtEfSR7bGli
ZGlyfS9wa2djb25maWcKCWZpCgoJb2VfbGliaW5zdGFsbCAtc28gbGliY3J5cHRvICR7RH0ke2xp
YmRpcn0KCW9lX2xpYmluc3RhbGwgLXNvIGxpYnNzbCAke0R9JHtsaWJkaXJ9CgoJaW5zdGFsbCAt
ZCAke0R9JHtpbmNsdWRlZGlyfQoJY3AgLUwgLVIgaW5jbHVkZS9vcGVuc3NsICR7RH0ke2luY2x1
ZGVkaXJ9Cn0K

--_004_2021B186DC632746BD5A3CE32F12BD289FCCF37BEUMBX03mgcmento_--
