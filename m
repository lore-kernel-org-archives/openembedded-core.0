Return-Path: <prvs=5289eeee8a=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id F27A277B8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 16:01:22 +0000 (UTC)
X-AuditID: 0a000213-a29ff70000000e18-55-5900c4514784
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	63.1B.03608.154C0095; Wed, 26 Apr 2017 11:01:22 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 26 Apr 2017 11:01:20 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Broken NPM builds
Thread-Index: AdK+plfbZy9DvttbRuelzkiHuV3Mxw==
Date: Wed, 26 Apr 2017 16:01:20 +0000
Message-ID: <655290B7709079438B7932553958E60D16D23684@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsWyRiBPQzfoCEOkwd7vXBZ3fr5jd2D0OLdx
	BWMAYxS3TVJiSVlwZnqevl0Cd8bDK19ZC56UVKw9OI29gfFEZhcjB4eEgIlEz52ELkZODiGB
	E4wS+6cxdjFyAdmzGCXufj7FDpJgEzCSOHd9EyOILSIQLbF0xkywuLCAlMSDG8+YIOLyEt1X
	vrBB2HoSW95cBLNZBFQljh3aAGbzCgRJHFz9AcxmFBCT+H5qDVgvs4C4xK0n88FsCQEBiSV7
	zjND2KISLx//Y4Ww5STeNbWxQtTnS6y/uYQdYqagxMmZT1gmMArOQjJqFpKyWUjKFjAyr2IU
	zE3MzDHUSy0uLssvSdVLzs/dxAgMSS4GJuEdjHOm2B5iFOBgVOLhDfD4HyHEmlhWXJl7iFGa
	g0VJnPcsR3CEkEB6YklqdmpqQWpRfFFpTmrxIUYmDs5DjBIcXFIixal5KalFiaUlGfGgwI8v
	Boa+VANjqXBmXGX08sciF45JX/tt7V2UmL3kZm/WpQlzbSofpXn/97lvff/dXPaG73cZXjh7
	ycbaxd1W+Pi1g091d/uCQ+sf2zJ9j49xmdsQ4KjQ7rZusu2sMOuTVR/i+U7wnrKUK16wqmPv
	bPtVwoph2j1H5L25Y+1DpnBME1mayDRz2+EnomnnE/yVWIozEg21mIuKEwGxCuijRQIAAA==
Subject: Broken NPM builds
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
X-List-Received-Date: Wed, 26 Apr 2017 16:01:23 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60D16D23684ESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60D16D23684ESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a simple grunt-cli recipe using inherit npm.
On master branch it appears to be broken and unable to find the registry.  =
Same recipe on Morty branch works fine.
I looked through the mailing list and didn't see anyone else seeing this is=
sue.

On a related side note I have recipes working for node 6.10.2.  Is there a =
reason we are staying on the 4.x series now that 6 is LTS?

Log data follows:
| DEBUG: Executing shell function do_install
| npm ERR! Linux 3.10.0-514.10.2.el7.x86_64
| npm ERR! argv "/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r=
0/recipe-sysroot-native/usr/bin/node" "/build/test/tmp/work/x86_64-linux/gr=
unt-cli-native/1.2.0-r0/recipe-sysroot-native/usr/bin/npm" "install" "--pre=
fix" "/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/image/bui=
ld/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroot-nati=
ve/usr" "-g" "--arch=3Dx64" "--target_arch=3Dx64" "--production" "--no-regi=
stry"
| npm ERR! node v4.7.3
| npm ERR! npm  v2.15.11
|
| npm ERR! Registry not defined and registry files not found: "/build/test/=
tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/npm_cache/noregistry/findup=
-sync/.cache.json", "/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2=
.0-r0/npm_cache/findup-sync/.cache.json".
| npm ERR!
| npm ERR! If you need help, you may report this error at:
| npm ERR!     <https://github.com/npm/npm/issues>
| npm ERR! Linux 3.10.0-514.10.2.el7.x86_64
| npm ERR! argv "/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r=
0/recipe-sysroot-native/usr/bin/node" "/build/test/tmp/work/x86_64-linux/gr=
unt-cli-native/1.2.0-r0/recipe-sysroot-native/usr/bin/npm" "install" "--pre=
fix" "/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/image/bui=
ld/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroot-nati=
ve/usr" "-g" "--arch=3Dx64" "--target_arch=3Dx64" "--production" "--no-regi=
stry"
| npm ERR! node v4.7.3
| npm ERR! npm  v2.15.11
|
| npm ERR! Registry not defined and registry files not found: "/build/test/=
tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/npm_cache/noregistry/grunt-=
known-options/.cache.json", "/build/test/tmp/work/x86_64-linux/grunt-cli-na=
tive/1.2.0-r0/npm_cache/grunt-known-options/.cache.json".
| npm ERR!
| npm ERR! If you need help, you may report this error at:
| npm ERR!     <https://github.com/npm/npm/issues>
| npm ERR! Linux 3.10.0-514.10.2.el7.x86_64
| npm ERR! argv "/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r=
0/recipe-sysroot-native/usr/bin/node" "/build/test/tmp/work/x86_64-linux/gr=
unt-cli-native/1.2.0-r0/recipe-sysroot-native/usr/bin/npm" "install" "--pre=
fix" "/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/image/bui=
ld/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroot-nati=
ve/usr" "-g" "--arch=3Dx64" "--target_arch=3Dx64" "--production" "--no-regi=
stry"
| npm ERR! node v4.7.3
| npm ERR! npm  v2.15.11
|
| npm ERR! Registry not defined and registry files not found: "/build/test/=
tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/npm_cache/noregistry/nopt/.=
cache.json", "/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/n=
pm_cache/nopt/.cache.json".
| npm ERR!
| npm ERR! If you need help, you may report this error at:
| npm ERR!     <https://github.com/npm/npm/issues>
| npm ERR! Linux 3.10.0-514.10.2.el7.x86_64
| npm ERR! argv "/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r=
0/recipe-sysroot-native/usr/bin/node" "/build/test/tmp/work/x86_64-linux/gr=
unt-cli-native/1.2.0-r0/recipe-sysroot-native/usr/bin/npm" "install" "--pre=
fix" "/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/image/bui=
ld/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroot-nati=
ve/usr" "-g" "--arch=3Dx64" "--target_arch=3Dx64" "--production" "--no-regi=
stry"
| npm ERR! node v4.7.3
| npm ERR! npm  v2.15.11
|
| npm ERR! Registry not defined and registry files not found: "/build/test/=
tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/npm_cache/noregistry/resolv=
e/.cache.json", "/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r=
0/npm_cache/resolve/.cache.json".
| npm ERR!
| npm ERR! If you need help, you may report this error at:
| npm ERR!     <https://github.com/npm/npm/issues>
|
| npm ERR! Please include the following file with any support request:
| npm ERR!     /build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/=
npmpkg/npm-debug.log
| WARNING: /build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/temp=
/run.do_install.88695:1 exit 1 from 'npm install --prefix /build/test/tmp/w=
ork/x86_64-linux/grunt-cli-native/1.2.0-r0/image/build/test/tmp/work/x86_64=
-linux/grunt-cli-native/1.2.0-r0/recipe-sysroot-native/usr -g --arch=3Dx64 =
--target_arch=3Dx64 --production --no-registry'
| ERROR: Function failed: do_install (log file is located at /build/test/tm=
p/work/x86_64-linux/grunt-cli-native/1.2.0-r0/temp/log.do_install.88695)





--_000_655290B7709079438B7932553958E60D16D23684ESSEX01essvotec_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
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
	{mso-style-type:export-only;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.Section1
	{page:Section1;}
-->
</style><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"Section1">
<p class=3D"MsoNormal">I have a simple grunt-cli recipe using inherit npm.<=
o:p></o:p></p>
<p class=3D"MsoNormal">On master branch it appears to be broken and unable =
to find the registry.&nbsp; Same recipe on Morty branch works fine.<o:p></o=
:p></p>
<p class=3D"MsoNormal">I looked through the mailing list and didn&#8217;t s=
ee anyone else seeing this issue.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">On a related side note I have recipes working for no=
de 6.10.2.&nbsp; Is there a reason we are staying on the 4.x series now tha=
t 6 is LTS?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Log data follows:<o:p></o:p></p>
<p class=3D"MsoNormal">| DEBUG: Executing shell function do_install<o:p></o=
:p></p>
<p class=3D"MsoNormal">| npm ERR! Linux 3.10.0-514.10.2.el7.x86_64<o:p></o:=
p></p>
<p class=3D"MsoNormal">| npm ERR! argv &quot;/build/test/tmp/work/x86_64-li=
nux/grunt-cli-native/1.2.0-r0/recipe-sysroot-native/usr/bin/node&quot; &quo=
t;/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroo=
t-native/usr/bin/npm&quot; &quot;install&quot; &quot;--prefix&quot; &quot;/=
build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/image/build/test=
/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroot-native/usr&=
quot;
 &quot;-g&quot; &quot;--arch=3Dx64&quot; &quot;--target_arch=3Dx64&quot; &q=
uot;--production&quot; &quot;--no-registry&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! node v4.7.3<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! npm&nbsp; v2.15.11<o:p></o:p></p>
<p class=3D"MsoNormal">| <o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! Registry not defined and registry files n=
ot found: &quot;/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0=
/npm_cache/noregistry/findup-sync/.cache.json&quot;, &quot;/build/test/tmp/=
work/x86_64-linux/grunt-cli-native/1.2.0-r0/npm_cache/findup-sync/.cache.js=
on&quot;.<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR!<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! If you need help, you may report this err=
or at:<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR!&nbsp;&nbsp;&nbsp;&nbsp; &lt;https://githu=
b.com/npm/npm/issues&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! Linux 3.10.0-514.10.2.el7.x86_64<o:p></o:=
p></p>
<p class=3D"MsoNormal">| npm ERR! argv &quot;/build/test/tmp/work/x86_64-li=
nux/grunt-cli-native/1.2.0-r0/recipe-sysroot-native/usr/bin/node&quot; &quo=
t;/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroo=
t-native/usr/bin/npm&quot; &quot;install&quot; &quot;--prefix&quot; &quot;/=
build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/image/build/test=
/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroot-native/usr&=
quot;
 &quot;-g&quot; &quot;--arch=3Dx64&quot; &quot;--target_arch=3Dx64&quot; &q=
uot;--production&quot; &quot;--no-registry&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! node v4.7.3<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! npm&nbsp; v2.15.11<o:p></o:p></p>
<p class=3D"MsoNormal">| <o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! Registry not defined and registry files n=
ot found: &quot;/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0=
/npm_cache/noregistry/grunt-known-options/.cache.json&quot;, &quot;/build/t=
est/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/npm_cache/grunt-known-o=
ptions/.cache.json&quot;.<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR!<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! If you need help, you may report this err=
or at:<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR!&nbsp;&nbsp;&nbsp;&nbsp; &lt;https://githu=
b.com/npm/npm/issues&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! Linux 3.10.0-514.10.2.el7.x86_64<o:p></o:=
p></p>
<p class=3D"MsoNormal">| npm ERR! argv &quot;/build/test/tmp/work/x86_64-li=
nux/grunt-cli-native/1.2.0-r0/recipe-sysroot-native/usr/bin/node&quot; &quo=
t;/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroo=
t-native/usr/bin/npm&quot; &quot;install&quot; &quot;--prefix&quot; &quot;/=
build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/image/build/test=
/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroot-native/usr&=
quot;
 &quot;-g&quot; &quot;--arch=3Dx64&quot; &quot;--target_arch=3Dx64&quot; &q=
uot;--production&quot; &quot;--no-registry&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! node v4.7.3<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! npm&nbsp; v2.15.11<o:p></o:p></p>
<p class=3D"MsoNormal">| <o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! Registry not defined and registry files n=
ot found: &quot;/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0=
/npm_cache/noregistry/nopt/.cache.json&quot;, &quot;/build/test/tmp/work/x8=
6_64-linux/grunt-cli-native/1.2.0-r0/npm_cache/nopt/.cache.json&quot;.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">| npm ERR!<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! If you need help, you may report this err=
or at:<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR!&nbsp;&nbsp;&nbsp;&nbsp; &lt;https://githu=
b.com/npm/npm/issues&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! Linux 3.10.0-514.10.2.el7.x86_64<o:p></o:=
p></p>
<p class=3D"MsoNormal">| npm ERR! argv &quot;/build/test/tmp/work/x86_64-li=
nux/grunt-cli-native/1.2.0-r0/recipe-sysroot-native/usr/bin/node&quot; &quo=
t;/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroo=
t-native/usr/bin/npm&quot; &quot;install&quot; &quot;--prefix&quot; &quot;/=
build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/image/build/test=
/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroot-native/usr&=
quot;
 &quot;-g&quot; &quot;--arch=3Dx64&quot; &quot;--target_arch=3Dx64&quot; &q=
uot;--production&quot; &quot;--no-registry&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! node v4.7.3<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! npm&nbsp; v2.15.11<o:p></o:p></p>
<p class=3D"MsoNormal">| <o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! Registry not defined and registry files n=
ot found: &quot;/build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0=
/npm_cache/noregistry/resolve/.cache.json&quot;, &quot;/build/test/tmp/work=
/x86_64-linux/grunt-cli-native/1.2.0-r0/npm_cache/resolve/.cache.json&quot;=
.<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR!<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! If you need help, you may report this err=
or at:<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR!&nbsp;&nbsp;&nbsp;&nbsp; &lt;https://githu=
b.com/npm/npm/issues&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">| <o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR! Please include the following file with an=
y support request:<o:p></o:p></p>
<p class=3D"MsoNormal">| npm ERR!&nbsp;&nbsp;&nbsp;&nbsp; /build/test/tmp/w=
ork/x86_64-linux/grunt-cli-native/1.2.0-r0/npmpkg/npm-debug.log<o:p></o:p><=
/p>
<p class=3D"MsoNormal">| WARNING: /build/test/tmp/work/x86_64-linux/grunt-c=
li-native/1.2.0-r0/temp/run.do_install.88695:1 exit 1 from 'npm install --p=
refix /build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/image/bui=
ld/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/recipe-sysroot-nati=
ve/usr
 -g --arch=3Dx64 --target_arch=3Dx64 --production --no-registry'<o:p></o:p>=
</p>
<p class=3D"MsoNormal">| ERROR: Function failed: do_install (log file is lo=
cated at /build/test/tmp/work/x86_64-linux/grunt-cli-native/1.2.0-r0/temp/l=
og.do_install.88695)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_655290B7709079438B7932553958E60D16D23684ESSEX01essvotec_--
