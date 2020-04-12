Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.53])
 by mx.groups.io with SMTP id smtpd.web10.1146.1586717453965780744
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2020 11:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hotmail.com header.s=selector1 header.b=CaywMDgN;
 spf=pass (domain: hotmail.com, ip: 40.92.90.53, mailfrom: bjarne_michelsen@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/PVDpPMRBJl1aL6k5V+DvcrZ+XbQ1TVsRW5j4cIxJGf2TDgEgCs6GTNlwMkMfEZ7qxFHykYp+FCryQLhSDWHtpWWmDvc4uzbEwWUPQAA/69Ufzn6pYLBSKUgGMDTrWZefa7chZJJyt2PhMBa5cOKpBQsy/BrXxFJzMavGpVQnSbjlcdIf84S5gd2vk+sQMJphF6MNG05e5oBJg7KSvMA6lzowOPU6kMFTscusl+Je6dAoNNSvBzCE1YHNECL6thBH8MdNsdYCbLE4ys2Oepgw060RGWJOpP33WtEEfXsiNEYOtXl5m5Y3eC6g57S5RzDH3VCE79ckCwC5pL9ZlANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkVU8WqwO9DTp1c6kC9eMM26VPtwsbiNsQjqSVlp63U=;
 b=LwwiCo6V2E7SB1dgVhakIIzabmlEXXHCQMGQqPLnggz3cA3ywKl3Js3faSonS8djgOMBoFnfwzTBgS3P7yNiYqGxPiGR0a2u0Z08xW/aFpwqcZylvjRn6O+tZVI+A42LY+5DHPPWrivHzrRCBDe5friQH1iuUx6BcR/5RBC1VAmGtCJ3bLvUrtPsVB4bhpdyRYDOsi4C2Gd7KMTTqo/9+JlnhHKKQ7PpfVshp4NPCXiirQ8SauylX+6+cIWb9CwBPQhcIBHv+fAnlIIs1+2wFw9k36ZsN3GSYMO+VNK3Ep1iNr0WkwE8ACERv62Swzs6ClhARGSngA1IUtPNqZ5vzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkVU8WqwO9DTp1c6kC9eMM26VPtwsbiNsQjqSVlp63U=;
 b=CaywMDgNFNEy3ucNHQybOWRIV2fRBXTVSdbz4UygPlbEDGatz6TLd/SWRZQLjP3hOoEH1lIgczGqV0XJUTGyPnO+kyZ1mf4OP8P8hcP1ssGLrjcQlkxNUrU5YGIBED/PgN5xSYOu7OsEGJJcrLaGTwrTRWS/RVeSHbstnG9wru7HoiSMTjt+nHoqDMR0z41Oy5WhGhNCDU7KX3AdePbfOl8++wV37S5k8YFm56SwNbFRr/IBCL4oZILIDIW0Nzt7vLw90T7r+mCVOX+8oEwljWrZI/b3/j91RB7CrZnYaRGaJ1iZJOxlrN+qeAx3chX62pcnSpnTZ7YDj3awxRSDDQ==
Received: from DB8EUR05FT021.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc0f::41) by
 DB8EUR05HT070.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc0f::94)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Sun, 12 Apr
 2020 18:50:52 +0000
Received: from AM0P193MB0497.EURP193.PROD.OUTLOOK.COM (2a01:111:e400:fc0f::4a)
 by DB8EUR05FT021.mail.protection.outlook.com (2a01:111:e400:fc0f::288) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Sun, 12 Apr 2020 18:50:52 +0000
Received: from AM0P193MB0497.EURP193.PROD.OUTLOOK.COM
 ([fe80::38cb:aca6:33e3:8418]) by AM0P193MB0497.EURP193.PROD.OUTLOOK.COM
 ([fe80::38cb:aca6:33e3:8418%7]) with mapi id 15.20.2900.028; Sun, 12 Apr 2020
 18:50:52 +0000
From: "Bjarne Michelsen" <bjarne_michelsen@hotmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] devtool: fix error where no license checksum was found in recipe
Thread-Topic: [OE-core] [PATCH] devtool: fix error where no license checksum
 was found in recipe
Thread-Index: AQHWEOfAzR2tCy+bnUCEFl3BQLaot6h1zmhr
Date: Sun, 12 Apr 2020 18:50:52 +0000
Message-ID: 
 <AM0P193MB0497723FEC68E16AFDFD02D9FEDC0@AM0P193MB0497.EURP193.PROD.OUTLOOK.COM>
References: 
 <20200412132223.15582-1-bjarne_michelsen@hotmail.com>,<CANNYZj8d-T4CVJ3T3wUQGgfFWewY-xHOU0ZwvC90yZQYbKytmA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8d-T4CVJ3T3wUQGgfFWewY-xHOU0ZwvC90yZQYbKytmA@mail.gmail.com>
Accept-Language: da-DK, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: 
 OriginalChecksum:222A53486C970DBB4C454216453C4DCBBE922D38C37AC222994A005F1DD225CF;UpperCasedChecksum:73AC7AFB246AACD1CC8A7CB5EA630F118D66E876E5368B2376C9E5F4ADAFC75D;SizeAsReceived:7115;Count:46
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [CyqvK+v3QWUZWSMGC3Kk1WkQF8k50qws]
x-ms-publictraffictype: Email
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 4358ff6d-8f6f-4e9d-563d-08d7df126c9f
x-ms-traffictypediagnostic: DB8EUR05HT070:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Vd6bgDie0Myf7XDlcK1jNc0hBDb7Nn7WY5KwF7mYOCDnIYWHxy74IChipWO8W0dwQs3o/gOtAIvfMmXwFDROJxA6MP726+oqsQIfp40j5pgDaeEgm5l/e56EmzYuRR/E6w7G1dTjvbakZvAT4mKB4RPd6AECfiCywakZ1gLfQljDg9pwqUT75ADp2FxD+UAVA1I8OVHhy5RYYZdCGAVY7HkgRPUigECAScMzcsSTHJhlhjYdueUpxjad/gQHYErFTh+QO6UxkBl1+3X3SvuGkB+OV+oKs+1LcUI3VtOW2Pck1LLHV+QxxcTGiC+/sgUAzLAaI7T+zot6ZBKC/jwSyIdADbaONeh4VTCqDIka+F4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0497.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
x-ms-exchange-antispam-messagedata: 
 jwtw+2mYolKQJ0ZrObzYBQoYFG2cCYWw2ouLRPxIffnfqXifAZJtAwaEtNi0rRLCZwQkeaXEkdBLaf2/OH7FBIxgEJkr2PgTtZfDhh9x40O+Ts0EvlOo32BVNWYvCo+HsOS+QjWgEoklVt59LCw7Zw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4358ff6d-8f6f-4e9d-563d-08d7df126c9f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2020 18:50:52.0653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR05HT070
Content-Language: da-DK
Content-Type: multipart/alternative;
	boundary="_000_AM0P193MB0497723FEC68E16AFDFD02D9FEDC0AM0P193MB0497EURP_"

--_000_AM0P193MB0497723FEC68E16AFDFD02D9FEDC0AM0P193MB0497EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Actually I found out later today that it was cause because my recipe used  =
something like ssh://user@127.0.0.1:1234/test/my-repo
It should probably have been changed to git://user@127.0.0.1:1234/test/my-=
repo;protocol=3Dssh
But anyway, it should not result in such an error.
I had used `devtool add` to create a new recipe and it added the ssh URI d=
irectly. I did not notice that.

This is the error I am seeing:

Traceback (most recent call last):
  File "/home/bjarne/repos/yocto/poky/scripts/devtool", line 334, in <modu=
le>
    ret =3D main()
  File "/home/bjarne/repos/yocto/poky/scripts/devtool", line 321, in main
    ret =3D args.func(args, config, basepath, workspace)
  File "/home/bjarne/repos/yocto/poky/scripts/lib/devtool/upgrade.py", lin=
e 558, in upgrade
    tinfoil, rd)
  File "/home/bjarne/repos/yocto/poky/scripts/lib/devtool/upgrade.py", lin=
e 219, in _extract_new_source
    md5 =3D checksums['md5sum']
KeyError: 'md5sum'

/Bjarne

________________________________
Fra: Alexander Kanavin <alex.kanavin@gmail.com>
Sendt: 12. april 2020 18:30
Til: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Emne: Re: [OE-core] [PATCH] devtool: fix error where no license checksum w=
as found in recipe

Wait, what error are you seeing exactly? For me this works just fine even =
if the recipe has only sha256sum: the checksummer calculates the values fro=
m the actual tarball, and not from the recipe:

@@ -215,6 +215,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcr=
ev, srcbranch, branch, kee
         if ftmpdir and keep_temp:
             logger.info<https://eur02.safelinks.protection.outlook.com/?u=
rl=3Dhttp%3A%2F%2Flogger.info%2F&data=3D02%7C01%7C%7C61fcc38a816448e7f9f608=
d7defee1ee%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637223058597294667&=
sdata=3Dhjyma6WD%2FUWu1I%2BSTciIeRVmw9ACBdyugLzbVBEP06U%3D&reserved=3D0>('F=
etch temp directory is %s' % ftmpdir)

+        logger.info<https://eur02.safelinks.protection.outlook.com/?url=
=3Dhttp%3A%2F%2Flogger.info%2F&data=3D02%7C01%7C%7C61fcc38a816448e7f9f608d=
7defee1ee%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637223058597304671&s=
data=3DBGFsjxUJfzaHFw6HKwDZe%2BbDn8Sm%2FZyThOI11aXk0Kk%3D&reserved=3D0>(str=
(checksums))
         md5 =3D checksums['md5sum']
         sha256 =3D checksums['sha256sum']

prints

{'md5sum': '3f486f2f4435ef14b81814dbbc7b48bb', 'sha256sum': '186c6bfe6ecfb=
a7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35', 'sha1sum': '238e001ea=
1fbf19ede43e36209c37c1a636bb51f', 'sha384sum': '8985fc9f65c4c2fbbed1ec972be=
e339eeeb7362e96bdf85dc4652d20e517bdb03ffc222b51e34c15bd391c569caaf158', 'sh=
a512sum': 'b00bd9b5ad5298fbceeec6bb19c1ab0c106ca5cfb31178497c58bf7e0e0cf30f=
cc19c20f84e23af31cc126bf2447d3e4f8461db97bafa7bd78f69561932f000c'}

Alex

On Sun, 12 Apr 2020 at 15:22, Bjarne Michelsen <bjarne_michelsen@hotmail.c=
om<mailto:bjarne_michelsen@hotmail.com>> wrote:
devtool upgrade currently assumes that a md5 and sha256 sum is available
in the recipe, no matter what is the value of LICENSE.
This fix will just default to an empty checksum, if the parameter is not
found in the recipe.

Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com<mailto:bjarn=
e_michelsen@hotmail.com>>
---
 scripts/lib/devtool/upgrade.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.=
py
index cb6dce378a..7066ddd51e 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -215,8 +215,8 @@ def _extract_new_source(newpv, srctree, no_patch, srcr=
ev, srcbranch, branch, kee
         if ftmpdir and keep_temp:
             logger.info<https://eur02.safelinks.protection.outlook.com/?u=
rl=3Dhttp%3A%2F%2Flogger.info%2F&data=3D02%7C01%7C%7C61fcc38a816448e7f9f608=
d7defee1ee%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637223058597314667&=
sdata=3DjmZ7oOkMCS8b%2F89vcPy%2BGyoIl%2BuF8hJTe8JUkmkF5dU%3D&reserved=3D0>(=
'Fetch temp directory is %s' % ftmpdir)

-        md5 =3D checksums['md5sum']
-        sha256 =3D checksums['sha256sum']
+        md5 =3D checksums.get('md5sum', '')
+        sha256 =3D checksums.get('sha256sum', '')

         tmpsrctree =3D _get_srctree(tmpdir)
         srctree =3D os.path.abspath(srctree)
--
2.17.1



--_000_AM0P193MB0497723FEC68E16AFDFD02D9FEDC0AM0P193MB0497EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859=
-1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
Actually I found out later today that it was cause because my recipe used&=
nbsp; something like ssh://user@127.0.0.1:1234/test/my-repo</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-=
serif; font-size: 12pt;">It should probably have been changed to git://user=
@<span style=3D"font-family: Calibri, Helvetica, sans-serif; background-col=
or: rgb(255, 255, 255); display: inline !important">127.0.0.1:1234/test</sp=
an>/my-repo;protocol=3Dssh</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-=
serif; font-size: 12pt;">But anyway, it should not result in such an error.=
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
I had used `devtool add` to create a new recipe and it added the ssh URI d=
irectly. I did not notice that.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-=
serif; font-size: 12pt;">This is the error I am seeing:</span><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
<span>Traceback (most recent call last):<br>
</span>
<div>&nbsp; File &quot;/home/bjarne/repos/yocto/poky/scripts/devtool&quot;=
, line 334, in &lt;module&gt;<br>
</div>
<div>&nbsp; &nbsp; ret =3D main()<br>
</div>
<div>&nbsp; File &quot;/home/bjarne/repos/yocto/poky/scripts/devtool&quot;=
, line 321, in main<br>
</div>
<div>&nbsp; &nbsp; ret =3D args.func(args, config, basepath, workspace)<br=
>
</div>
<div>&nbsp; File &quot;/home/bjarne/repos/yocto/poky/scripts/lib/devtool/u=
pgrade.py&quot;, line 558, in upgrade<br>
</div>
<div>&nbsp; &nbsp; tinfoil, rd)<br>
</div>
<div>&nbsp; File &quot;/home/bjarne/repos/yocto/poky/scripts/lib/devtool/u=
pgrade.py&quot;, line 219, in _extract_new_source<br>
</div>
<div>&nbsp; &nbsp; md5 =3D checksums['md5sum']<br>
</div>
<div>KeyError: 'md5sum'<br>
</div>
<span></span><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: rgb(0, 0, 0);">
/Bjarne</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; co=
lor:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" c=
olor=3D"#000000" style=3D"font-size:11pt"><b>Fra:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sendt:</b> 12. april 2020 18:30<br>
<b>Til:</b> Bjarne Michelsen &lt;bjarne_michelsen@hotmail.com&gt;<br>
<b>Cc:</b> OE-core &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Emne:</b> Re: [OE-core] [PATCH] devtool: fix error where no license che=
cksum was found in recipe</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div>Wait, what error are you seeing exactly? For me this works just fine =
even if the recipe has only sha256sum: the checksummer calculates the value=
s from the actual tarball, and not from the recipe:</div>
<div><br>
</div>
<div>@@ -215,6 &#43;215,7 @@ def _extract_new_source(newpv, srctree, no_pa=
tch, srcrev, srcbranch, branch, kee<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ftmpdir and keep_temp:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"https://eur02.s=
afelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flogger.info%2F&amp;data=
=
=3D02%7C01%7C%7C61fcc38a816448e7f9f608d7defee1ee%7C84df9e7fe9f640afb435aaa=
aaaaaaaaa%7C1%7C0%7C637223058597294667&amp;sdata=3Dhjyma6WD%2FUWu1I%2BSTciI=
eRVmw9ACBdyugLzbVBEP06U%3D&amp;reserved=3D0" originalsrc=3D"http://logger.i=
nfo/" shash=3D"GhJ6EO790c3GEWRF04xZujhrGW&#43;4zWn4G&#43;Ab0ZjDRU7UYy5Vp/Y3=
p7FpXGrkDCobHqY4zLQIcUHicXLDoKyGTkMoL9ARUtrR9ZB0iPj8WFRi1USu58/1S6npOipAVf3=
Lq1&#43;TsNa&#43;5aW0Ugm524hy2nXm&#43;ptuysmvccV/pPQTNGQ=3D">logger.info</a=
>('Fetch
 temp directory is %s' % ftmpdir)<br>
&nbsp;<br>
&#43; &nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"https://eur02.safelinks.protec=
tion.outlook.com/?url=3Dhttp%3A%2F%2Flogger.info%2F&amp;data=3D02%7C01%7C%7=
C61fcc38a816448e7f9f608d7defee1ee%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C=
0%7C637223058597304671&amp;sdata=3DBGFsjxUJfzaHFw6HKwDZe%2BbDn8Sm%2FZyThOI1=
1aXk0Kk%3D&amp;reserved=3D0" originalsrc=3D"http://logger.info/" shash=3D"J=
070VVuYcgxlks/i1EgROmvPo5INo0VWoKo92hoKdEGeBTlSElawuUi0K&#43;7LivGa5t70wZMb=
4JSOqkIH&#43;6qituE6rYPuMFhra9FgnImmmoRe/olJ0qwOH3RVP7c7bS9Lzv3rzE&#43;ZpR6=
cttQnnm77ow8gE1&#43;F12UWGAekkObseHs=3D">logger.info</a>(str(checksums))<br=
>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;md5 =3D checksums['md5sum']<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sha256 =3D checksums['sha256sum']<br>
</div>
<div><br>
</div>
<div>prints</div>
<div><br>
</div>
<div>{'md5sum': '3f486f2f4435ef14b81814dbbc7b48bb', 'sha256sum': '186c6bfe=
6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35', 'sha1sum': '238e=
001ea1fbf19ede43e36209c37c1a636bb51f', 'sha384sum': '8985fc9f65c4c2fbbed1ec=
972bee339eeeb7362e96bdf85dc4652d20e517bdb03ffc222b51e34c15bd391c569caaf158'=
,
 'sha512sum': 'b00bd9b5ad5298fbceeec6bb19c1ab0c106ca5cfb31178497c58bf7e0e0=
cf30fcc19c20f84e23af31cc126bf2447d3e4f8461db97bafa7bd78f69561932f000c'}</di=
v>
<div><br>
</div>
<div>Alex<br>
</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Sun, 12 Apr 2020 at 15:22, Bjar=
ne Michelsen &lt;<a href=3D"mailto:bjarne_michelsen@hotmail.com">bjarne_mic=
helsen@hotmail.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bor=
der-left:1px solid rgb(204,204,204); padding-left:1ex">
devtool upgrade currently assumes that a md5 and sha256 sum is available<b=
r>
in the recipe, no matter what is the value of LICENSE.<br>
This fix will just default to an empty checksum, if the parameter is not<b=
r>
found in the recipe.<br>
<br>
Signed-off-by: Bjarne Michelsen &lt;<a href=3D"mailto:bjarne_michelsen@hot=
mail.com" target=3D"_blank">bjarne_michelsen@hotmail.com</a>&gt;<br>
---<br>
&nbsp;scripts/lib/devtool/upgrade.py | 4 &#43;&#43;--<br>
&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.=
py<br>
index cb6dce378a..7066ddd51e 100644<br>
--- a/scripts/lib/devtool/upgrade.py<br>
&#43;&#43;&#43; b/scripts/lib/devtool/upgrade.py<br>
@@ -215,8 &#43;215,8 @@ def _extract_new_source(newpv, srctree, no_patch, =
srcrev, srcbranch, branch, kee<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ftmpdir and keep_temp:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"https://eur02.s=
afelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flogger.info%2F&amp;data=
=
=3D02%7C01%7C%7C61fcc38a816448e7f9f608d7defee1ee%7C84df9e7fe9f640afb435aaa=
aaaaaaaaa%7C1%7C0%7C637223058597314667&amp;sdata=3DjmZ7oOkMCS8b%2F89vcPy%2B=
GyoIl%2BuF8hJTe8JUkmkF5dU%3D&amp;reserved=3D0" originalsrc=3D"http://logger=
.info/" shash=3D"uCcUeZxqxu58vbcW0H013yMVG2B3y/xFCk95CV3lt0ETtAsuDmxzukIaip=
ygwG//eaLC2kVGvEytR&#43;jvYmSVE&#43;Fbyk6sBT8YVQPfH1QduhblWue2k0Xc8OCKWQUgB=
1WUb4sO5tmGuAcyleJz3zrZqhx/mi/TY2eoRDn0DUJYjRk=3D" rel=3D"noreferrer" targe=
t=3D"_blank">logger.info</a>('Fetch
 temp directory is %s' % ftmpdir)<br>
<br>
-&nbsp; &nbsp; &nbsp; &nbsp; md5 =3D checksums['md5sum']<br>
-&nbsp; &nbsp; &nbsp; &nbsp; sha256 =3D checksums['sha256sum']<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp; md5 =3D checksums.get('md5sum', '')<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp; sha256 =3D checksums.get('sha256sum', '')=
<br>
<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tmpsrctree =3D _get_srctree(tmpdir)<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;srctree =3D os.path.abspath(srctree)<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_AM0P193MB0497723FEC68E16AFDFD02D9FEDC0AM0P193MB0497EURP_--
