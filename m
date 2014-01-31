Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 02D886E87D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 19:01:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Jan 2014 11:02:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,759,1384329600"; 
	d="scan'208,217";a="475960337"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga002.jf.intel.com with ESMTP; 31 Jan 2014 11:01:31 -0800
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 31 Jan 2014 19:01:30 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.202]) by
	IRSMSX152.ger.corp.intel.com ([163.33.192.66]) with mapi id
	14.03.0123.003; Fri, 31 Jan 2014 19:01:30 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: iw in place of wireless-tools
Thread-Index: Ac8dwl9txB+i5I6IRdy9l5d1uH7F9wA80u+A
Date: Fri, 31 Jan 2014 19:01:30 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
In-Reply-To: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: iw in place of wireless-tools
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
X-List-Received-Date: Fri, 31 Jan 2014 19:02:01 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_969F26A8BAB325438E7EB80D3C3134FB16CFA7F5IRSMSX105gercor_"

--_000_969F26A8BAB325438E7EB80D3C3134FB16CFA7F5IRSMSX105gercor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Noor, all,

An analysis of the differences, improvements, maybe possible shortcomings o=
f iw versus wireless-tools would be nice.

For a start:
http://wireless.kernel.org/en/users/Documentation/iw/replace-iwconfig
Basically, this says that iw is simpler to use than wireless-tools various =
commands.
It is unclear to me if iw functionality matches wireless-tools functionalit=
y or maybe surpasses it, maybe someone else has info on this?
On my Ubuntu 13.10 dev machine, wireless-tools and iw are both installed by=
 default (I might be wrong here, maybe I installed them some time ago by ha=
nd).


Regards,
Cristian Iorga
YP
Intel

From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Ahsan, Noor
Sent: Thursday, January 30, 2014 3:55 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] iw in place of wireless-tools

Hello,

I read in couple of threads that iw is replacing wireless-tools in linux wi=
reless world and people recommending replacing wireless-tools with iw in oe=
-core. I did not see it happening. Here I am starting this thread to discus=
s this so that we can make the decision and replace these two recipes with =
each other. Comments?

Noor

Noor Ahsan | Engineering Manager Mentor Embedded Linux & Hypervisor
Mentor Embedded<http://www.mentor.com/embedded>(tm) |5-6-7-8th floors 105  =
B2 Gulberg III, Ali Tower
MM Alam Road, Lahore
P +92 42 36099196 | M +92 307 4448444
Nucleus<http://www.mentor.com/embedded-software/nucleus/>(r) | Linux<http:/=
/www.mentor.com/embedded-software/linux/>(r) | Android<http://www.mentor.co=
m/embedded-software/android/>(tm) | Services<http://www.mentor.com/embedded=
-software/services/> | UI<http://www.mentor.com/embedded-software/inflexion=
/> | Multi-OS<http://www.mentor.com/embedded-software/multicore-multi-os>

Android is a trademark of Google Inc. Use of this trademark is subject to G=
oogle Permissions.
Linux is the registered trademark of Linus Torvalds in the U.S. and other c=
ountries.


--_000_969F26A8BAB325438E7EB80D3C3134FB16CFA7F5IRSMSX105gercor_
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
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hello Noor, all,<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">An analysis of the dif=
ferences, improvements, maybe possible shortcomings of iw versus wireless-t=
ools would be nice.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">For a start:<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><a href=3D"http://wire=
less.kernel.org/en/users/Documentation/iw/replace-iwconfig">http://wireless=
.kernel.org/en/users/Documentation/iw/replace-iwconfig</a><o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Basically, this says t=
hat iw is simpler to use than wireless-tools various commands.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">It is unclear to me if=
 iw functionality matches wireless-tools functionality or maybe surpasses i=
t, maybe someone else has info on this?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">On my Ubuntu 13.10 dev=
 machine, wireless-tools and iw are both installed by default (I might be w=
rong here, maybe I installed them some time ago by hand).<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Regards,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Cristian Iorga<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">YP<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Intel<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"><span style=3D"color:#1F=
497D"><o:p>&nbsp;</o:p></span></a></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openembedded-core-bounces@lists.openemb=
edded.org [mailto:openembedded-core-bounces@lists.openembedded.org]
<b>On Behalf Of </b>Ahsan, Noor<br>
<b>Sent:</b> Thursday, January 30, 2014 3:55 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> [OE-core] iw in place of wireless-tools<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I read in couple of threads that iw is replacing wir=
eless-tools in linux wireless world and people recommending replacing wirel=
ess-tools with iw in oe-core. I did not see it happening. Here I am startin=
g this thread to discuss this so that
 we can make the decision and replace these two recipes with each other. Co=
mments?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Noor<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt">Noor Ahsan</span=
></b><span style=3D"font-size:10.0pt">
<span style=3D"color:#595959">| Engineering Manager Mentor Embedded Linux &=
amp; Hypervisor</span><span style=3D"color:#7F7F7F"><o:p></o:p></span></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt"><a href=3D"http://w=
ww.mentor.com/embedded">Mentor Embedded</a>&#8482;
<span style=3D"color:#595959">|5-6-7-8<sup>th</sup> floors 105&nbsp; B2 Gul=
berg III, Ali Tower<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#595959">MM Al=
am Road, Lahore</span><span style=3D"font-size:10.0pt;color:#7F7F7F"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#595959">P &#4=
3;92 42 36099196 | M &#43;92 307 4448444<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt"><a href=3D"http://w=
ww.mentor.com/embedded-software/nucleus/">Nucleus</a>&reg;<span style=3D"co=
lor:#76923C"> |
</span><a href=3D"http://www.mentor.com/embedded-software/linux/">Linux</a>=
&reg;<span style=3D"color:#76923C"> |
</span><a href=3D"http://www.mentor.com/embedded-software/android/">Android=
</a>&#8482;<span style=3D"color:#76923C"> |
</span><a href=3D"http://www.mentor.com/embedded-software/services/">Servic=
es</a> <span style=3D"color:#76923C">
| </span><a href=3D"http://www.mentor.com/embedded-software/inflexion/">UI<=
/a> <span style=3D"color:#76923C">
| </span><a href=3D"http://www.mentor.com/embedded-software/multicore-multi=
-os">Multi-OS</a><span style=3D"color:#76923C"><o:p></o:p></span></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:7.0pt;color:#1F497D"><o:p>&=
nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:7.0pt;color:#7F7F7F">Androi=
d is a trademark of Google Inc. Use of this trademark is subject to Google =
Permissions.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:7.0pt;color:#7F7F7F">Linux =
is the registered trademark of Linus Torvalds in the U.S. and other countri=
es.</span><span style=3D"font-size:7.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_969F26A8BAB325438E7EB80D3C3134FB16CFA7F5IRSMSX105gercor_--
