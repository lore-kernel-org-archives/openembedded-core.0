Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=VA3EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1Rf2R6-0004OW-Op
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Dec 2011 05:45:21 +0100
Received: from mail52-va3-R.bigfish.com (10.7.14.253) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.23; Mon, 26 Dec 2011 04:22:50 +0000
Received: from mail52-va3 (localhost [127.0.0.1])	by mail52-va3-R.bigfish.com
	(Postfix) with ESMTP id 1648B20281	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2011 04:22:28 +0000 (UTC)
X-SpamScore: -1
X-BigFish: VS-1(zzc85fh14ffOzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9n)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail52-va3 (localhost.localdomain [127.0.0.1]) by mail52-va3
	(MessageSwitch) id 1324873346342835_25768;
	Mon, 26 Dec 2011 04:22:26 +0000 (UTC)
Received: from VA3EHSMHS011.bigfish.com (unknown [10.7.14.254])	by
	mail52-va3.bigfish.com (Postfix) with ESMTP id 4F16A240044	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2011 04:22:26 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS011.bigfish.com
	(10.7.99.21) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 26 Dec 2011 04:22:45 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Sun, 25 Dec 2011 22:23:01 -0600
From: Liu Ting-B28495 <B28495@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: HOB: which host packages are needed
Thread-Index: AczDhgsn8fqmjRdCTYqkR2J7iMKDQg==
Date: Mon, 26 Dec 2011 04:23:01 +0000
Message-ID: <AF604684617F454390621992F367F169010C2CE6@039-SN2MPN1-023.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.20]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zang Roy-R61911 <r61911@freescale.com>
Subject: HOB: which host packages are needed
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
X-List-Received-Date: Mon, 26 Dec 2011 04:45:21 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AF604684617F454390621992F367F169010C2CE6039SN2MPN102303_"

--_000_AF604684617F454390621992F367F169010C2CE6039SN2MPN102303_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

We try to use poky in FC9. When trying to use HOB, the following ImportErro=
r appeared:

NOTE: Running setscene task 18 of 18 (/home/roy/CVS/poky/meta/recipes-devto=
ols/quilt/quilt-native_0.48.bbo_populate_sysroot_setscene)
NOTE: package quilt-native-0.48-r0: task do_populate_sysroot_setscene: Star=
ted
NOTE: package quilt-native-0.48-r0: task do_populate_sysroot_setscene: Succ=
eeded
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 126 tasks of which 126 didn't need to be rer=
un and 0 failed.
Traceback (most recent call last):
  File "/home/roy/CVS/poky/bitbake/bin/bitbake", line 238, in <module>
    ret =3D main()
  File "/home/roy/CVS/poky/bitbake/bin/bitbake", line 173, in main
    ui_main =3D get_ui(configuration)
  File "/home/roy/CVS/poky/bitbake/bin/bitbake", line 68, in get_ui
    module =3D __import__("bb.ui", fromlist =3D [interface])
  File "/home/roy/CVS/poky/bitbake/lib/bb/ui/hob.py", line 21, in <module>
    import glib
ImportError: No module named glib

We installed python 2.6 from the source since the version 2.5 was shipped w=
ith FC9.

My question is:

(1)     Besides the glib module, what else is needed?

(2)     Is there a list of distro that hob was tested on, or which host pac=
kages are needed to run "hob"?

Any help will be appreciated. Thanks.

Best Regards,
Ting


--_000_AF604684617F454390621992F367F169010C2CE6039SN2MPN102303_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:p=3D"urn:schemas-m=
icrosoft-com:office:powerpoint" xmlns:a=3D"urn:schemas-microsoft-com:office=
:access" xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:s=3D"=
uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882" xmlns:rs=3D"urn:schemas-microsof=
t-com:rowset" xmlns:z=3D"#RowsetSchema" xmlns:b=3D"urn:schemas-microsoft-co=
m:office:publisher" xmlns:ss=3D"urn:schemas-microsoft-com:office:spreadshee=
t" xmlns:c=3D"urn:schemas-microsoft-com:office:component:spreadsheet" xmlns=
:odc=3D"urn:schemas-microsoft-com:office:odc" xmlns:oa=3D"urn:schemas-micro=
soft-com:office:activation" xmlns:html=3D"http://www.w3.org/TR/REC-html40" =
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" xmlns:rtc=3D"http://m=
icrosoft.com/officenet/conferencing" xmlns:D=3D"DAV:" xmlns:Repl=3D"http://=
schemas.microsoft.com/repl/" xmlns:mt=3D"http://schemas.microsoft.com/share=
point/soap/meetings/" xmlns:x2=3D"http://schemas.microsoft.com/office/excel=
/2003/xml" xmlns:ppda=3D"http://www.passport.com/NameSpace.xsd" xmlns:ois=
=3D"http://schemas.microsoft.com/sharepoint/soap/ois/" xmlns:dir=3D"http://=
schemas.microsoft.com/sharepoint/soap/directory/" xmlns:ds=3D"http://www.w3=
.org/2000/09/xmldsig#" xmlns:dsp=3D"http://schemas.microsoft.com/sharepoint=
/dsp" xmlns:udc=3D"http://schemas.microsoft.com/data/udc" xmlns:xsd=3D"http=
://www.w3.org/2001/XMLSchema" xmlns:sub=3D"http://schemas.microsoft.com/sha=
repoint/soap/2002/1/alerts/" xmlns:ec=3D"http://www.w3.org/2001/04/xmlenc#"=
 xmlns:sp=3D"http://schemas.microsoft.com/sharepoint/" xmlns:sps=3D"http://=
schemas.microsoft.com/sharepoint/soap/" xmlns:xsi=3D"http://www.w3.org/2001=
/XMLSchema-instance" xmlns:udcs=3D"http://schemas.microsoft.com/data/udc/so=
ap" xmlns:udcxf=3D"http://schemas.microsoft.com/data/udc/xmlfile" xmlns:udc=
p2p=3D"http://schemas.microsoft.com/data/udc/parttopart" xmlns:wf=3D"http:/=
/schemas.microsoft.com/sharepoint/soap/workflow/" xmlns:dsss=3D"http://sche=
mas.microsoft.com/office/2006/digsig-setup" xmlns:dssi=3D"http://schemas.mi=
crosoft.com/office/2006/digsig" xmlns:mdssi=3D"http://schemas.openxmlformat=
s.org/package/2006/digital-signature" xmlns:mver=3D"http://schemas.openxmlf=
ormats.org/markup-compatibility/2006" xmlns:m=3D"http://schemas.microsoft.c=
om/office/2004/12/omml" xmlns:mrels=3D"http://schemas.openxmlformats.org/pa=
ckage/2006/relationships" xmlns:spwp=3D"http://microsoft.com/sharepoint/web=
partpages" xmlns:ex12t=3D"http://schemas.microsoft.com/exchange/services/20=
06/types" xmlns:ex12m=3D"http://schemas.microsoft.com/exchange/services/200=
6/messages" xmlns:pptsl=3D"http://schemas.microsoft.com/sharepoint/soap/Sli=
deLibrary/" xmlns:spsl=3D"http://microsoft.com/webservices/SharePointPortal=
Server/PublishedLinksService" xmlns:Z=3D"urn:schemas-microsoft-com:" xmlns:=
st=3D"&#1;" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1047291279;
	mso-list-type:hybrid;
	mso-list-template-ids:-934657822 -2123972378 67698713 67698715 67698703 67=
698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-text:"\(%1\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"margin-right:.9pt;text-autospace:none"><spa=
n style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&=
quot;;color:black">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-indent:-7.5pt=
;text-autospace:none">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-right:.9pt;text-autospace:none"><spa=
n style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&=
quot;;color:black">We try to use poky in FC9. When trying to use HOB, the f=
ollowing ImportError appeared:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-right:.9pt;text-autospace:none"><spa=
n style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&=
quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-right:.9pt;text-autospace:none"><spa=
n style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&=
quot;;color:black">NOTE: Running setscene task 18 of 18 (/home/roy/CVS/poky=
/meta/recipes-devtools/quilt/quilt-native_0.48.bbo_populate_sysroot_setscen=
e)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">NOTE: package quilt-native-0.48-r0: task do_populate=
_sysroot_setscene: Started<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">NOTE: package quilt-native-0.48-r0: task do_populate=
_sysroot_setscene: Succeeded<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">NOTE: Executing RunQueue Tasks<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">NOTE: Tasks Summary: Attempted 126 tasks of which 12=
6 didn't need to be rerun and 0 failed.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">Traceback (most recent call last):<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">&nbsp; File &quot;/home/roy/CVS/poky/bitbake/bin/bit=
bake&quot;, line 238, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">&nbsp;&nbsp;&nbsp; ret =3D main()<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">&nbsp; File &quot;/home/roy/CVS/poky/bitbake/bin/bit=
bake&quot;, line 173, in main<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">&nbsp;&nbsp;&nbsp; ui_main =3D get_ui(configuration)=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">&nbsp; File &quot;/home/roy/CVS/poky/bitbake/bin/bit=
bake&quot;, line 68, in get_ui<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">&nbsp;&nbsp;&nbsp; module =3D __import__(&quot;bb.ui=
&quot;, fromlist =3D [interface])<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">&nbsp; File &quot;/home/roy/CVS/poky/bitbake/lib/bb/=
ui/hob.py&quot;, line 21, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:.9pt;ma=
rgin-bottom:0in;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;sans-se=
rif&quot;;color:black">&nbsp;&nbsp;&nbsp; import glib<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;;color:black">ImportError: No module named =
glib</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We installed python 2.6 from the source since the ve=
rsion 2.5 was shipped with FC9.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My question is:<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">(1)<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Besides the glib module, what else is needed?<o:p><=
/o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">(2)<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Is there a list of distro that hob was tested on, o=
r which host packages are needed to run &#8220;hob&#8221;?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any help will be appreciated. Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;">Best&nbsp;Regards,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;">Ting</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_AF604684617F454390621992F367F169010C2CE6039SN2MPN102303_--
