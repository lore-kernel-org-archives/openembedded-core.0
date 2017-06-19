Return-Path: <michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF9D71BFC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 20:15:37 +0000 (UTC)
X-AuditID: 0a000213-2b5ff70000000e57-57-594830e89c7d
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	D4.BC.03671.8E038495; Mon, 19 Jun 2017 15:15:38 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Mon, 19 Jun 2017 15:15:36 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-CORE][pyro] Cmake Alias Broken
Thread-Index: AdLpOM8k6H17wLJ9RnOmIon1BDuGBQ==
Date: Mon, 19 Jun 2017 20:15:35 +0000
Message-ID: <655290B7709079438B7932553958E60DA131936D@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDLMWRmVeSWpSXmKPExsWyRiBPQ/eVgUekwYrzIhZ3fr5jd2D0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxonXj9kK9mhUPLhS3MD4SrmLkZNDQsBE4vv39exdjFwcQgIn
	GCU+3mljhXBmMUpMXvSeGaSKTcBI4tz1TYwgtohAtMTSGTPZQWxhAW2JY0vWsULEDSRubbjO
	DmHrSVx+2sEEYrMIqEr0NkD08goESSya2coCYjMKiEl8P7UGrIZZQFzi1pP5TBAXCUgs2XOe
	GcIWlXj5+B8rhC0n8a6pjRWiPl/i8flHrBAzBSVOznzCMoFRcBaSUbOQlM1CUraAkXkVo2Bu
	YmaOoV5qcXFZfkmqXnJ+7iZGYEhyMTAJ72BcMCP2EKMAB6MSD++C1+6RQqyJZcWVuYcYpTlY
	lMR5xUItIoUE0hNLUrNTUwtSi+KLSnNSiw8xMnFwggguqQbGUjuJxDuNXf8WfHj6yeO2Z8Vj
	yfYFxRoSm2/Upi5cKf7RL/eStMaeY69+K3zt2cF9b/KKGl35i/bs+Uumzbo3e4N175uX67qa
	t6hvXWklXBxUJnQxhk94o/cK4ztH73+p8ml9G3ygQU407O4LnrtHqzS/ntklfzC8KSWq93S1
	Y5y1s4NFsou0EktxRqKhFnNRcSIA4SSKJy8CAAA=
Subject: [pyro] Cmake Alias Broken
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
X-List-Received-Date: Mon, 19 Jun 2017 20:15:38 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60DA131936DESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60DA131936DESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The cmake alias is no longer functioning properly.
It puts the alias configure script in /path/toolchain/buildtools/sysroots/x=
86_64-pokysdk-linux/ environment-setup.d/ cmake.sh
The actual file goes into /path /toolchain/buildtools/sysroots/x86_64-pokys=
dk-linux/usr/share/cmake/ OEToolchainConfig.cmake

This falls outside the:
export SDKTARGETSYSROOT=3D/path/toolchain/tmp/sysroots/core-toolchain
export OECORE_NATIVE_SYSROOT=3D"/path/toolchain/tmp/sysroots/x86_64"
# Append environment subscripts
if [ -d "$OECORE_TARGET_SYSROOT/environment-setup.d" ]; then
    for envfile in $OECORE_TARGET_SYSROOT/environment-setup.d/*.sh; do
                    . $envfile
    done
fi
if [ -d "$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
    for envfile in $OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
                    . $envfile
    done
fi


I am guessing where the file is installed on the cmake recipe needs to chan=
ge.  Just not sure what to change it to.


--_000_655290B7709079438B7932553958E60DA131936DESSEX01essvotec_
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
<p class=3D"MsoNormal">The cmake alias is no longer functioning properly.<o=
:p></o:p></p>
<p class=3D"MsoNormal">It puts the alias configure script in /path/toolchai=
n/buildtools/sysroots/x86_64-pokysdk-linux/ environment-setup.d/ cmake.sh<o=
:p></o:p></p>
<p class=3D"MsoNormal">The actual file goes into /path /toolchain/buildtool=
s/sysroots/x86_64-pokysdk-linux/usr/share/cmake/ OEToolchainConfig.cmake<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This falls outside the:<o:p></o:p></p>
<p class=3D"MsoNormal">export SDKTARGETSYSROOT=3D/path/toolchain/tmp/sysroo=
ts/core-toolchain<o:p></o:p></p>
<p class=3D"MsoNormal">export OECORE_NATIVE_SYSROOT=3D&quot;/path/toolchain=
/tmp/sysroots/x86_64&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"># Append environment subscripts<o:p></o:p></p>
<p class=3D"MsoNormal">if [ -d &quot;$OECORE_TARGET_SYSROOT/environment-set=
up.d&quot; ]; then<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; for envfile in $OECORE_TARGET_SYS=
ROOT/environment-setup.d/*.sh; do<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; . $envfile<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; done<o:p></o:p></p>
<p class=3D"MsoNormal">fi<o:p></o:p></p>
<p class=3D"MsoNormal">if [ -d &quot;$OECORE_NATIVE_SYSROOT/environment-set=
up.d&quot; ]; then<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; for envfile in $OECORE_NATIVE_SYS=
ROOT/environment-setup.d/*.sh; do<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; . $envfile<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; done<o:p></o:p></p>
<p class=3D"MsoNormal">fi<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am guessing where the file is installed on the cma=
ke recipe needs to change.&nbsp; Just not sure what to change it to.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_655290B7709079438B7932553958E60DA131936DESSEX01essvotec_--
