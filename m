Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SZIjk-0004sF-JT
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 11:29:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 May 2012 02:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="105328208"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 29 May 2012 02:18:50 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 29 May 2012 02:18:49 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.133]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.90]) with mapi id
	14.01.0355.002; Tue, 29 May 2012 17:18:48 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: [yocto] Broken SDK
Thread-Index: AQHNPJOfd91Qw09DEUyod8uKtPkDm5bes19QgAFBHoCAAIngcA==
Date: Tue, 29 May 2012 09:18:47 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FDCC6AE@SHSMSX102.ccr.corp.intel.com>
References: <CA+Z6RkU-GBXYHygXhY8UQkxe-5vQSvj-4xqSHuueN=VnN126qA@mail.gmail.com>
	<857BE142E5399E46B20FD45B9DB8A7BC0FDCB920@SHSMSX102.ccr.corp.intel.com>
	<CA+Z6RkV3zeyCvfSx0ZrRQP7zhNQknchsN7q_sho1VkE2NGvFzg@mail.gmail.com>
In-Reply-To: <CA+Z6RkV3zeyCvfSx0ZrRQP7zhNQknchsN7q_sho1VkE2NGvFzg@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: Navani Srivastava <navani.srivastava@gmail.com>
Subject: FW: [yocto] Broken SDK
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
X-List-Received-Date: Tue, 29 May 2012 09:29:09 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_857BE142E5399E46B20FD45B9DB8A7BC0FDCC6AESHSMSX102ccrcor_"

--_000_857BE142E5399E46B20FD45B9DB8A7BC0FDCC6AESHSMSX102ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Does anyone have the answers to the following question? Thanks!

Regards,
-Lianhao

From: Navani Srivastava [mailto:navani.srivastava@gmail.com]
Sent: Tuesday, May 29, 2012 5:03 PM
To: Lu, Lianhao
Cc: yocto@yoctoproject.org
Subject: Re: [yocto] Broken SDK

Hi Lianhao,

These patches worked for me.But still I am failing to create symbolic link =
of mkspecs. It throws below mentioned error-

"ln -s /opt/poky/1.0/sysroots/arm-poky-linux-gnueabi/usr/share/qtopia/mkspe=
cs mkspecs
| ln: creating symbolic link `mkspecs': File exists"

On commenting out
 "(cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s ${SDKTARGETSYSROOT}/usr/sh=
are/qtopia/mkspecs mkspecs;)"

section of meta-toolchain-qte.bb<http://meta-toolchain-qte.bb>, I can succe=
ssfully create the SDK including my cross toolchain of specified architectu=
re. Do I need to change any path?
On Mon, May 28, 2012 at 11:29 AM, Lu, Lianhao <lianhao.lu@intel.com<mailto:=
lianhao.lu@intel.com>> wrote:
Navani Srivastava wrote on 2012-05-28:
> Hi,
>
>
>
> I am working with poky-bernerd-5.0. I have built cross-toolchain for qt w=
ith "bitbake -v meta-toolchain-qte" for arm1136 architecture.
>
> I got the tool chain "poky-eglibc-i686-arm-toolchain-1.0.tar.bz2" under b=
uild/tmp/deploy/sdk/ directory. On untaring this Toolchain I found
> that cross gcc wasn't included in the SDK. Can anyone please help me in r=
ecognizing the problem?
>
I think the meta-toolchain-qte was not workable in benard. You might need t=
o cherry-pick other patches for the recipe meta-toolchian-qte.

http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/meta/recipes-qt/meta/met=
a-toolchain-qte.bb

Best Regards,
Lianhao


--_000_857BE142E5399E46B20FD45B9DB8A7BC0FDCC6AESHSMSX102ccrcor_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:#1F497D">Does anyone have the answer=
s to the following question? Thanks!<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:#1F497D">Regards,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:#1F497D">-Lianhao<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp=
;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span =
lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&qu=
ot;sans-serif&quot;"> Navani Srivastava [mailto:navani.srivastava@gmail.com=
]
<br>
<b>Sent:</b> Tuesday, May 29, 2012 5:03 PM<br>
<b>To:</b> Lu, Lianhao<br>
<b>Cc:</b> yocto@yoctoproject.org<br>
<b>Subject:</b> Re: [yocto] Broken SDK<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">=
Hi Lianhao,<br>
<br>
These patches worked for me.But still I am failing to create symbolic link =
of mkspecs. It throws below mentioned error-<br>
<br>
&quot;ln -s /opt/poky/1.0/sysroots/arm-poky-linux-gnueabi/usr/share/qtopia/=
mkspecs mkspecs<br>
| ln: creating symbolic link `mkspecs': File exists&quot;<br>
<br>
On commenting out<br>
&nbsp;&quot;(cd ${SDK_OUTPUT}/${QT_TOOLS_PREFIX}/..; ln -s ${SDKTARGETSYSRO=
OT}/usr/share/qtopia/mkspecs mkspecs;)&quot;
<br>
<br>
section of <a href=3D"http://meta-toolchain-qte.bb">meta-toolchain-qte.bb</=
a>, I can successfully create the SDK including my cross toolchain of speci=
fied architecture. Do I need to change any path?<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Mon, May 28, 2012 at 11:29 A=
M, Lu, Lianhao &lt;<a href=3D"mailto:lianhao.lu@intel.com" target=3D"_blank=
">lianhao.lu@intel.com</a>&gt; wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Navani Srivastava wrote on 2012=
-05-28:<br>
&gt; Hi,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; I am working with poky-bernerd-5.0. I have built cross-toolchain for q=
t with &quot;bitbake -v meta-toolchain-qte&quot; for arm1136 architecture.<=
o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">=
&gt;<br>
&gt; I got the tool chain &quot;poky-eglibc-i686-arm-toolchain-1.0.tar.bz2&=
quot; under build/tmp/deploy/sdk/ directory. On untaring this Toolchain I f=
ound<br>
&gt; that cross gcc wasn't included in the SDK. Can anyone please help me i=
n recognizing the problem?<br>
&gt;<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">=
I think the meta-toolchain-qte was not workable in benard. You might need t=
o cherry-pick other patches for the recipe meta-toolchian-qte.<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/meta/recipes-=
qt/meta/meta-toolchain-qte.bb" target=3D"_blank">http://git.yoctoproject.or=
g/cgit/cgit.cgi/poky/log/meta/recipes-qt/meta/meta-toolchain-qte.bb</a><br>
<br>
Best Regards,<br>
Lianhao<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_857BE142E5399E46B20FD45B9DB8A7BC0FDCC6AESHSMSX102ccrcor_--
