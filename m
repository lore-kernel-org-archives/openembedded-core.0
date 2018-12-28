Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id EBD6F60043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 14:10:15 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1gcsq7-00040D-NM from Noor_Ahsan@mentor.com ;
	Fri, 28 Dec 2018 06:10:16 -0800
Received: from svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) by
	svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Fri, 28 Dec 2018 14:10:11 +0000
Received: from svr-ies-mbx-01.mgc.mentorg.com ([fe80::15aa:fe76:2483:1cce]) by
	svr-ies-mbx-01.mgc.mentorg.com ([fe80::15aa:fe76:2483:1cce%22]) with
	mapi id 15.00.1320.000; Fri, 28 Dec 2018 14:10:11 +0000
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Thread-Topic: [OE-core] ovmf fails when python sqlite module is not installed
	on	host
Thread-Index: AQHUnrcMzrajCISqzU2W/Kn+xFDGqA==
Date: Fri, 28 Dec 2018 14:10:11 +0000
Message-ID: <00ad1d465068421d9734f796328560f4@svr-ies-mbx-01.mgc.mentorg.com>
References: <321cb5cd28684311ba3f3c0dba168baf@svr-ies-mbx-01.mgc.mentorg.com>
In-Reply-To: <321cb5cd28684311ba3f3c0dba168baf@svr-ies-mbx-01.mgc.mentorg.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: ovmf fails when python sqlite module is not installed on	host
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
X-List-Received-Date: Fri, 28 Dec 2018 14:10:16 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_00ad1d465068421d9734f796328560f4svriesmbx01mgcmentorgco_"

--_000_00ad1d465068421d9734f796328560f4svriesmbx01mgcmentorgco_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

More info. This script is being called

/var/mentor/sfarooq/MEL/181206_1816/install_uno/mel/11/workspace/build/tmp/=
work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/usr/bin/edk2_bas=
etools/BaseTools/BinWrappers/PosixLike/build

Which is calling python directly. We get it executed from tmp/hosttools/pyt=
hon which is symbolic link to /usr/local/bin/python.

Noor

From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Ahsan, Noor
Sent: Friday, December 28, 2018 5:49 PM
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core] ovmf fails when python sqlite module is not installed on=
 host

Hello,

While building ovmf recipe I faced one issue regarding sqlite python module=
. The recipe is trying to access host python packages in order to build it.=
 On my system I had multiple puthon version installed and the one which Ovm=
f was picking did not had sqlite module installed so I got this error

Copying $EDK_TOOLS_PATH/Conf/target.template
     to /var/mentor/sfarooq/MEL/181206_1816/myproject_uno/workspace/build/t=
mp/work/corei7-64-mel-linux/ovmf/git-r0/git/Conf/target.txt
using prebuilt tools
Running edk2 build for OvmfPkgX64
Traceback (most recent call last):
  File "/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/workspace/build/t=
mp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/usr/bin/edk2_=
basetools/BaseTools/BinWrappers/PosixLike/../../Source/Python/build/build.p=
y", line 42, in <module>
    from AutoGen.AutoGen import *
  File "/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/workspace/build/t=
mp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/usr/bin/edk2_=
basetools/BaseTools/Source/Python/AutoGen/AutoGen.py", line 36, in <module>
    from GenFds.FdfParser import *
  File "/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/workspace/build/t=
mp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/usr/bin/edk2_=
basetools/BaseTools/Source/Python/GenFds/FdfParser.py", line 21, in <module=
>
    import Fd
  File "/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/workspace/build/t=
mp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/usr/bin/edk2_=
basetools/BaseTools/Source/Python/GenFds/Fd.py", line 19, in <module>
    import Fv
  File "/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/workspace/build/t=
mp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/usr/bin/edk2_=
basetools/BaseTools/Source/Python/GenFds/Fv.py", line 24, in <module>
    import AprioriSection
  File "/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/workspace/build/t=
mp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/usr/bin/edk2_=
basetools/BaseTools/Source/Python/GenFds/AprioriSection.py", line 21, in <m=
odule>
    import FfsFileStatement
  File "/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/workspace/build/t=
mp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/usr/bin/edk2_=
basetools/BaseTools/Source/Python/GenFds/FfsFileStatement.py", line 29, in =
<module>
    from GuidSection import GuidSection
  File "/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/workspace/build/t=
mp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/usr/bin/edk2_=
basetools/BaseTools/Source/Python/GenFds/GuidSection.py", line 30, in <modu=
le>
    from GenFds import FindExtendTool
  File "/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/workspace/build/t=
mp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/usr/bin/edk2_=
basetools/BaseTools/Source/Python/GenFds/GenFds.py", line 25, in <module>
    from Workspace.WorkspaceDatabase import WorkspaceDatabase
  File "/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/workspace/build/t=
mp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/usr/bin/edk2_=
basetools/BaseTools/Source/Python/Workspace/WorkspaceDatabase.py", line 18,=
 in <module>
    import sqlite3
  File "/usr/local/lib/python2.7/sqlite3/__init__.py", line 24, in <module>
    from dbapi2 import *
  File "/usr/local/lib/python2.7/sqlite3/dbapi2.py", line 28, in <module>
    from _sqlite3 import *
ImportError: No module named _sqlite3
WARNING: exit code 1 from a shell command.

I also inherited the recipe with  python3native but it is still accessing h=
ost python. Can you guide me how we can modify this recipe so that it start=
 using build system python3 packages.

Noor

--_000_00ad1d465068421d9734f796328560f4svriesmbx01mgcmentorgco_
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
span.code-keyword
	{mso-style-name:code-keyword;}
span.code-quote
	{mso-style-name:code-quote;}
span.EmailStyle22
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">More info. This script=
 is being called
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">/var/mentor/sfarooq/ME=
L/181206_1816/install_uno/mel/11/workspace/build/tmp/work/corei7-64-mel-lin=
ux/ovmf/git-r0/recipe-sysroot-native/usr/bin/edk2_basetools/BaseTools/BinWr=
appers/PosixLike/build<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Which is calling pytho=
n directly. We get it executed from tmp/hosttools/python which is symbolic =
link to /usr/local/bin/python.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Noor<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"><span style=3D"color:#1F=
497D"><o:p>&nbsp;</o:p></span></a></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openembedded-core-bounces@lists.openemb=
edded.org [mailto:openembedded-core-bounces@lists.openembedded.org]
<b>On Behalf Of </b>Ahsan, Noor<br>
<b>Sent:</b> Friday, December 28, 2018 5:49 PM<br>
<b>To:</b> Ricardo Neri &lt;ricardo.neri-calderon@linux.intel.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> [OE-core] ovmf fails when python sqlite module is not insta=
lled on host<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">While building ovmf recipe I faced one issue regardi=
ng sqlite python module. The recipe is trying to access host python package=
s in order to build it. On my system I had multiple puthon version installe=
d and the one which Ovmf was picking
 did not had sqlite module installed so I got this error<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">Copying $EDK_=
TOOLS_PATH/Conf/target.template<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp;&nbsp; to /</span><span style=3D"font-size:9.0pt;font-family:&quot;Cou=
rier New&quot;;color:#910091">var</span><span style=3D"font-size:9.0pt;font=
-family:&quot;Courier New&quot;;color:#333333">/mentor/sfarooq/MEL/181206_1=
816/myproject_uno/workspace/build/tmp/work/corei7-64-mel-linux/ovmf/git-r0/=
git/Conf/target.txt<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">using prebuil=
t tools<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">Running edk2 =
build
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">for</span><span style=3D"font-size:9.0pt;font-family:&quot;Co=
urier New&quot;;color:#333333"> OvmfPkgX64<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">Traceback (mo=
st recent call last):<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp; File
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#009100">&quot;/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/works=
pace/build/tmp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/u=
sr/bin/edk2_basetools/BaseTools/BinWrappers/PosixLike/../../Source/Python/b=
uild/build.py&quot;</span><span style=3D"font-size:9.0pt;font-family:&quot;=
Courier New&quot;;color:#333333">,
 line 42, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp; from AutoGen.AutoGen
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">import</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#333333"> *<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp; File
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#009100">&quot;/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/works=
pace/build/tmp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/u=
sr/bin/edk2_basetools/BaseTools/Source/Python/AutoGen/AutoGen.py&quot;</spa=
n><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:=
#333333">,
 line 36, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp; from GenFds.FdfParser
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">import</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#333333"> *<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp; File
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#009100">&quot;/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/works=
pace/build/tmp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/u=
sr/bin/edk2_basetools/BaseTools/Source/Python/GenFds/FdfParser.py&quot;</sp=
an><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color=
:#333333">,
 line 21, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">import</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#333333"> Fd<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp; File
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#009100">&quot;/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/works=
pace/build/tmp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/u=
sr/bin/edk2_basetools/BaseTools/Source/Python/GenFds/Fd.py&quot;</span><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#33333=
3">,
 line 19, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">import</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#333333"> Fv<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp; File
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#009100">&quot;/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/works=
pace/build/tmp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/u=
sr/bin/edk2_basetools/BaseTools/Source/Python/GenFds/Fv.py&quot;</span><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#33333=
3">,
 line 24, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">import</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#333333"> AprioriSection<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp; File
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#009100">&quot;/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/works=
pace/build/tmp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/u=
sr/bin/edk2_basetools/BaseTools/Source/Python/GenFds/AprioriSection.py&quot=
;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;=
color:#333333">,
 line 21, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">import</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#333333"> FfsFileStatement<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp; File
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#009100">&quot;/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/works=
pace/build/tmp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/u=
sr/bin/edk2_basetools/BaseTools/Source/Python/GenFds/FfsFileStatement.py&qu=
ot;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot=
;;color:#333333">,
 line 29, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp; from GuidSection
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">import</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#333333"> GuidSection<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp; File
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#009100">&quot;/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/works=
pace/build/tmp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/u=
sr/bin/edk2_basetools/BaseTools/Source/Python/GenFds/GuidSection.py&quot;</=
span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;col=
or:#333333">,
 line 30, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp; from GenFds
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">import</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#333333"> FindExtendTool<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp; File
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#009100">&quot;/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/works=
pace/build/tmp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/u=
sr/bin/edk2_basetools/BaseTools/Source/Python/GenFds/GenFds.py&quot;</span>=
<span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#3=
33333">,
 line 25, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp; from Workspace.WorkspaceDatabase
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">import</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#333333"> WorkspaceDatabase<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp; File
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#009100">&quot;/var/mentor/sfarooq/MEL/181206_1816/myproject_uno/works=
pace/build/tmp/work/corei7-64-mel-linux/ovmf/git-r0/recipe-sysroot-native/u=
sr/bin/edk2_basetools/BaseTools/Source/Python/Workspace/WorkspaceDatabase.p=
y&quot;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&=
quot;;color:#333333">,
 line 18, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">import</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#333333"> sqlite3<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp; File
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#009100">&quot;/usr/local/lib/python2.7/sqlite3/__init__.py&quot;</spa=
n><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:=
#333333">, line 24, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp; from dbapi2
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">import</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#333333"> *<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp; File
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#009100">&quot;/usr/local/lib/python2.7/sqlite3/dbapi2.py&quot;</span>=
<span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:#3=
33333">, line 28, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">&nbsp;&nbsp;&=
nbsp; from _sqlite3
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:#910091">import</span><span style=3D"font-size:9.0pt;font-family:&quot=
;Courier New&quot;;color:#333333"> *<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">ImportError: =
No module named _sqlite3<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:whitesmoke"><span style=3D"font-=
size:9.0pt;font-family:&quot;Courier New&quot;;color:#333333">WARNING: exit=
 code 1 from a shell command.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I also inherited the recipe with &nbsp;python3native=
 but it is still accessing host python. Can you guide me how we can modify =
this recipe so that it start using build system python3 packages.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Noor<o:p></o:p></p>
</div>
</body>
</html>

--_000_00ad1d465068421d9734f796328560f4svriesmbx01mgcmentorgco_--
