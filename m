Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SRKfe-0003kL-N5
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 11:55:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 May 2012 02:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="139741439"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 07 May 2012 02:46:07 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 7 May 2012 02:46:06 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.226]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.243]) with mapi id
	14.01.0355.002; Mon, 7 May 2012 17:46:05 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: perl-native: do_compile failed: pod/buildtoc: no pods at
	pod/buildtoc line 305
Thread-Index: Ac0sNjfuTZxTPPvwS7WUqDqCnoqLEQ==
Date: Mon, 7 May 2012 09:46:04 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FD4D822@SHSMSX102.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: perl-native: do_compile failed: pod/buildtoc: no pods at pod/buildtoc line 305
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2012 09:55:59 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_A25F549E4D43CD42B4C02DF47A1913230FD4D822SHSMSX102ccrcor_"

--_000_A25F549E4D43CD42B4C02DF47A1913230FD4D822SHSMSX102ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, I got this ERROR today when running "bitbake perl-native -c compile" ag=
ainst today's latest poky master(I got the same issue when I tried the denz=
il branch).



Any one has the same issue?



Build Configuration:

BB_VERSION        =3D "1.15.2"

TARGET_ARCH       =3D "i586"

TARGET_OS         =3D "linux"

MACHINE           =3D "qemux86"

DISTRO            =3D "poky"

DISTRO_VERSION    =3D "1.2+snapshot-20120507"

TUNE_FEATURES     =3D "m32 i586"

TARGET_FPU        =3D ""

meta

meta-yocto        =3D "master:3b78ad8041e0ea232b8363e120595cab85b30507"

...

|  make all PERL_CORE=3D1 LIBPERL_A=3Dlibperl.so LINKTYPE=3Ddynamic

| make[1]: Entering directory `/distro/dcui/t/p2/build/tmp/work/x86_64-linu=
x/perl-native-5.14.2-r0/perl-5.14.2/dist/threads-shared'

| cp lib/threads/shared.pm ../../lib/threads/shared.pm

| ../../miniperl "-I../../lib" "-I../../lib" ../../lib/ExtUtils/xsubpp  -ty=
pemap ../../lib/ExtUtils/typemap  shared.xs > shared.xsc && mv shared.xsc s=
hared.c

| ccache gcc  -c   -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -f=
stack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BIT=
S=3D64 -O2   -DVERSION=3D\"1.37\" -DXS_VERSION=3D\"1.37\" -fPIC "-I../.."  =
 shared.c

| Running Mkbootstrap for threads::shared ()

| chmod 644 shared.bs

| rm -f ../../lib/auto/threads/shared/shared.so

| ccache gcc   -shared -O2 -L/distro/dcui/t/p2/build/tmp/sysroots/x86_64-li=
nux/usr/lib -L/distro/dcui/t/p2/build/tmp/sysroots/x86_64-linux/lib -L/usr/=
local/lib -fstack-protector shared.o  -o ../../lib/auto/threads/shared/shar=
ed.so  \

|    -lpthread          \

|

| chmod 755 ../../lib/auto/threads/shared/shared.so

| cp shared.bs ../../lib/auto/threads/shared/shared.bs

| chmod 644 ../../lib/auto/threads/shared/shared.bs

| make[1]: Leaving directory `/distro/dcui/t/p2/build/tmp/work/x86_64-linux=
/perl-native-5.14.2-r0/perl-5.14.2/dist/threads-shared'

| LD_LIBRARY_PATH=3D/distro/dcui/t/p2/build/tmp/work/x86_64-linux/perl-nati=
ve-5.14.2-r0/perl-5.14.2:/distro/dcui/t/p2/build/tmp/sysroots/x86_64-linux/=
usr/bin/../lib/pseudo/lib:/distro/dcui/t/p2/build/tmp/sysroots/x86_64-linux=
/usr/bin/../lib/pseudo/lib64  ./perl -f -Ilib pod/buildtoc --build-toc -q

| pod/buildtoc: no pods at pod/buildtoc line 305.

| make: *** [pod/perltoc.pod] Error 255

| ERROR: oe_runmake failed



Thanks,

-- Dexuan


--_000_A25F549E4D43CD42B4C02DF47A1913230FD4D822SHSMSX102ccrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
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
	mso-style-link:"Plain Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.5pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hi, I got this ERROR today w=
hen running &quot;bitbake perl-native -c compile&quot; against today's late=
st poky master(I got the same issue when I tried the denzil branch).<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Any one has the same issue?<=
o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Build Configuration:<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">BB_VERSION&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;1.15.2&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">TARGET_ARCH&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; =3D &quot;i586&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">TARGET_OS&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;linux&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">MACHINE&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;qemux86&quot;<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">DISTRO&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;poky&quot;<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">DISTRO_VERSION&nbsp;&nbsp;&n=
bsp; =3D &quot;1.2&#43;snapshot-20120507&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">TUNE_FEATURES&nbsp;&nbsp;&nb=
sp;&nbsp; =3D &quot;m32 i586&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">TARGET_FPU&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">meta<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">meta-yocto&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;master:3b78ad8041e0ea232b8363e120595cab8=
5b30507&quot;
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">...<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">|&nbsp; make all PERL_CORE=
=3D1 LIBPERL_A=3Dlibperl.so LINKTYPE=3Ddynamic<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| make[1]: Entering director=
y `/distro/dcui/t/p2/build/tmp/work/x86_64-linux/perl-native-5.14.2-r0/perl=
-5.14.2/dist/threads-shared'<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| cp lib/threads/shared.pm .=
./../lib/threads/shared.pm<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| ../../miniperl &quot;-I../=
../lib&quot; &quot;-I../../lib&quot; ../../lib/ExtUtils/xsubpp&nbsp; -typem=
ap ../../lib/ExtUtils/typemap&nbsp; shared.xs &gt; shared.xsc &amp;&amp; mv=
 shared.xsc shared.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| ccache gcc&nbsp; -c&nbsp;&=
nbsp; -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-protect=
or -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 -O2&nb=
sp;&nbsp; -DVERSION=3D\&quot;1.37\&quot; -DXS_VERSION=3D\&quot;1.37\&quot; =
-fPIC &quot;-I../..&quot;&nbsp;&nbsp;
 shared.c<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| Running Mkbootstrap for th=
reads::shared ()<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| chmod 644 shared.bs<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| rm -f ../../lib/auto/threa=
ds/shared/shared.so<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| ccache gcc&nbsp;&nbsp; -sh=
ared -O2 -L/distro/dcui/t/p2/build/tmp/sysroots/x86_64-linux/usr/lib -L/dis=
tro/dcui/t/p2/build/tmp/sysroots/x86_64-linux/lib -L/usr/local/lib -fstack-=
protector shared.o&nbsp; -o ../../lib/auto/threads/shared/shared.so&nbsp;
 \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">|&nbsp;&nbsp;&nbsp; -lpthrea=
d&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">|<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| chmod 755 ../../lib/auto/t=
hreads/shared/shared.so<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| cp shared.bs ../../lib/aut=
o/threads/shared/shared.bs<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| chmod 644 ../../lib/auto/t=
hreads/shared/shared.bs<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| make[1]: Leaving directory=
 `/distro/dcui/t/p2/build/tmp/work/x86_64-linux/perl-native-5.14.2-r0/perl-=
5.14.2/dist/threads-shared'<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| LD_LIBRARY_PATH=3D/distro/=
dcui/t/p2/build/tmp/work/x86_64-linux/perl-native-5.14.2-r0/perl-5.14.2:/di=
stro/dcui/t/p2/build/tmp/sysroots/x86_64-linux/usr/bin/../lib/pseudo/lib:/d=
istro/dcui/t/p2/build/tmp/sysroots/x86_64-linux/usr/bin/../lib/pseudo/lib64=
&nbsp;
 ./perl -f -Ilib pod/buildtoc --build-toc -q<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| pod/buildtoc: no pods at p=
od/buildtoc line 305.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| make: *** [pod/perltoc.pod=
] Error 255<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">| ERROR: oe_runmake failed<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">-- Dexuan<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_A25F549E4D43CD42B4C02DF47A1913230FD4D822SHSMSX102ccrcor_--
