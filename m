Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RfByU-0004i4-Sn
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Dec 2011 15:56:27 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Dec 2011 06:43:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="106105970"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 26 Dec 2011 06:43:54 -0800
Received: from pgsmsx103.gar.corp.intel.com (10.221.44.82) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 26 Dec 2011 22:43:53 +0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	PGSMSX103.gar.corp.intel.com (10.221.44.82) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 26 Dec 2011 22:43:52 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.38]) with mapi id
	14.01.0355.002; Mon, 26 Dec 2011 22:43:51 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: HOB: which host packages are needed
Thread-Index: AczDhgsn8fqmjRdCTYqkR2J7iMKDQgAVpi6g
Date: Mon, 26 Dec 2011 14:43:50 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC010B4E@SHSMSX102.ccr.corp.intel.com>
References: <AF604684617F454390621992F367F169010C2CE6@039-SN2MPN1-023.039d.mgd.msft.net>
In-Reply-To: <AF604684617F454390621992F367F169010C2CE6@039-SN2MPN1-023.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: Zang Roy-R61911 <r61911@freescale.com>
Subject: Re: HOB: which host packages are needed
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
X-List-Received-Date: Mon, 26 Dec 2011 14:56:27 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3AB6CE7F274E534CAFD089D127A8A1FC010B4ESHSMSX102ccrcorpi_"

--_000_3AB6CE7F274E534CAFD089D127A8A1FC010B4ESHSMSX102ccrcorpi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

(1)    Is there a list of distro that hob was tested on, or which host pack=
ages are needed to run "hob"?

HOB has been tested on Ubuntu 11.04 and opensuse 11.4.

--
Shane
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Liu Ting-B28495
Sent: Monday, December 26, 2011 12:23 PM
To: openembedded-core@lists.openembedded.org
Cc: Zang Roy-R61911
Subject: [OE-core] HOB: which host packages are needed

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

(2)    Besides the glib module, what else is needed?

(3)    Is there a list of distro that hob was tested on, or which host pack=
ages are needed to run "hob"?

Any help will be appreciated. Thanks.

Best Regards,
Ting


--_000_3AB6CE7F274E534CAFD089D127A8A1FC010B4ESHSMSX102ccrcorpi_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
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
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
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
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level4
	{mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level7
	{mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo2"><![if !supportLists]><span lang=3D"EN-US"><span style=3D"mso-list:=
Ignore">(1)<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nb=
sp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Is there a list of dist=
ro that hob was tested on, or which host packages are needed to run &#8220;=
hob&#8221;?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;color=
:#1F497D">HOB has been tested on
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;;color:#1F497D">Ubuntu 11.04 and opensuse 11=
.4.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#1F497D">--<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#1F497D">Shane</span>=
<span lang=3D"EN-US" style=3D"font-size:10.5pt;color:#1F497D"><o:p></o:p></=
span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span =
lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&qu=
ot;sans-serif&quot;"> openembedded-core-bounces@lists.openembedded.org [mai=
lto:openembedded-core-bounces@lists.openembedded.org]
<b>On Behalf Of </b>Liu Ting-B28495<br>
<b>Sent:</b> Monday, December 26, 2011 12:23 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Cc:</b> Zang Roy-R61911<br>
<b>Subject:</b> [OE-core] HOB: which host packages are needed<o:p></o:p></s=
pan></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-right:.9pt;text-autospace:none"><spa=
n lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&q=
uot;sans-serif&quot;;color:black">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-indent:-7.5pt=
;text-autospace:none">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-right:.9pt;text-autospace:none"><spa=
n lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&q=
uot;sans-serif&quot;;color:black">We try to use poky in FC9. When trying to=
 use HOB, the following ImportError appeared:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-right:.9pt;text-autospace:none"><spa=
n lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&q=
uot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-right:.9pt;text-autospace:none"><spa=
n lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&q=
uot;sans-serif&quot;;color:black">NOTE: Running setscene task 18 of 18 (/ho=
me/roy/CVS/poky/meta/recipes-devtools/quilt/quilt-native_0.48.bbo_populate_=
sysroot_setscene)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">NOTE: package quilt-native-0.48-r0: t=
ask do_populate_sysroot_setscene: Started<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">NOTE: package quilt-native-0.48-r0: t=
ask do_populate_sysroot_setscene: Succeeded<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">NOTE: Executing RunQueue Tasks<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">NOTE: Tasks Summary: Attempted 126 ta=
sks of which 126 didn't need to be rerun and 0 failed.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">Traceback (most recent call last):<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">&nbsp; File &quot;/home/roy/CVS/poky/=
bitbake/bin/bitbake&quot;, line 238, in &lt;module&gt;<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">&nbsp;&nbsp;&nbsp; ret =3D main()<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">&nbsp; File &quot;/home/roy/CVS/poky/=
bitbake/bin/bitbake&quot;, line 173, in main<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">&nbsp;&nbsp;&nbsp; ui_main =3D get_ui=
(configuration)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">&nbsp; File &quot;/home/roy/CVS/poky/=
bitbake/bin/bitbake&quot;, line 68, in get_ui<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">&nbsp;&nbsp;&nbsp; module =3D __impor=
t__(&quot;bb.ui&quot;, fromlist =3D [interface])<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">&nbsp; File &quot;/home/roy/CVS/poky/=
bitbake/lib/bb/ui/hob.py&quot;, line 21, in &lt;module&gt;<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0cm;margin-right:.9pt;ma=
rgin-bottom:0cm;margin-left:13.6pt;margin-bottom:.0001pt;text-autospace:non=
e">
<span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot=
;,&quot;sans-serif&quot;;color:black">&nbsp;&nbsp;&nbsp; import glib<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Arial&quot;,&quot;sans-serif&quot;;color:black">ImportError: N=
o module named glib</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We installed python 2.6 from th=
e source since the version 2.5 was shipped with FC9.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">My question is:<o:p></o:p></spa=
n></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo2"><![if !supportLists]><span lang=3D"EN-US"><span style=3D"mso-list:=
Ignore">(2)<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nb=
sp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Besides the glib module=
, what else is needed?<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo2"><![if !supportLists]><span lang=3D"EN-US"><span style=3D"mso-list:=
Ignore">(3)<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nb=
sp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Is there a list of dist=
ro that hob was tested on, or which host packages are needed to run &#8220;=
hob&#8221;?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Any help will be appreciated. T=
hanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Arial&quot;,&quot;sans-serif&quot;">Best&nbsp;Regards,</span><=
span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Arial&quot;,&quot;sans-serif&quot;">Ting</span><span lang=3D"E=
N-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_3AB6CE7F274E534CAFD089D127A8A1FC010B4ESHSMSX102ccrcorpi_--
