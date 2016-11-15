Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CF611607A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 19:10:10 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 15 Nov 2016 11:10:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,495,1473145200"; 
	d="scan'208,217";a="191764877"
Received: from besquive-mobl.amr.corp.intel.com (HELO besquiveMOBL)
	([10.255.94.81])
	by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2016 11:10:07 -0800
Reply-To: <benjamin.esquivel@intel.com>
From: "Benjamin Esquivel" <benjamin.esquivel@linux.intel.com>
To: "'Jose Perez Carranza'" <jose.perez.carranza@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <1479227073-13133-1-git-send-email-jose.perez.carranza@linux.intel.com>	<CAJTo0LYp7-ufcRMiwmXac7vmOZquq6PPm3w8_XDK40prpZBFZw@mail.gmail.com>
	<1369e521-e304-1b80-4229-2449718736a0@linux.intel.com> 
In-Reply-To: 
Date: Tue, 15 Nov 2016 13:10:06 -0600
Organization: Intel Corporation
Message-ID: <005d01d23f73$e17e85c0$a47b9140$@linux.intel.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQIPv9fy7bCxnpVrcLxrKbmtfmeZAwIhyWvLAU2H0TqgQ+QEYIAACSpw
Cc: 'OE-core' <openembedded-core@lists.openembedded.org>
Subject: FW: [PATCH v2] oe-tests: Migrate tests from /oe/test to /oeqa/selftest/oe-tests
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
X-List-Received-Date: Tue, 15 Nov 2016 19:10:12 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_005E_01D23F41.97116750"
Content-Language: en-us

------=_NextPart_000_005E_01D23F41.97116750
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Re-sending from the correct account (of mine).

=20

From: Esquivel, Benjamin=20
Sent: Tuesday, November 15, 2016 12:38 PM
To: 'Jose Perez Carranza' <jose.perez.carranza@linux.intel.com>; =
'Burton, Ross' <ross.burton@intel.com>
Cc: 'OE-core' <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] oe-tests: Migrate tests from /oe/test =
to /oeqa/selftest/oe-tests

=20

Apologies for the top posting.

=20

The reason for the migration of the tests is for them to be included in =
the selftest execution. And for that execution, it needs to base off of =
the oeSelfTest class.

=20

Benjamin

=20

From: openembedded-core-bounces@lists.openembedded.org =
<mailto:openembedded-core-bounces@lists.openembedded.org>  =
[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of =
Jose Perez Carranza
Sent: Tuesday, November 15, 2016 12:09 PM
To: Burton, Ross <ross.burton@intel.com <mailto:ross.burton@intel.com> >
Cc: OE-core <openembedded-core@lists.openembedded.org =
<mailto:openembedded-core@lists.openembedded.org> >
Subject: Re: [OE-core] [PATCH v2] oe-tests: Migrate tests from /oe/test =
to /oeqa/selftest/oe-tests

=20

=20

=20

On 11/15/2016 11:16 AM, Burton, Ross wrote:

=20

On 15 November 2016 at 16:24, <jose.perez.carranza@linux.intel.com =
<mailto:jose.perez.carranza@linux.intel.com> > wrote:

+class TestPackagesFilterOutSystem(oeSelfTest):


As the tests don't need anything special that oeSelfTest provides, can =
they remain as testcase.TestCase instances?  There's a lot of =
complication from oeSelfTest that isn't required.

=20

In order to the test cases be recognized and executed as part of the =
suite they need to be in the same context of selftest hence be an =
instance of oeSelftest. =20

Ross

=20


------=_NextPart_000_005E_01D23F41.97116750
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
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
	font-size:12.0pt;
	font-family:"Times New Roman",serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;
	color:black;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle19
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
</o:shapelayout></xml><![endif]--></head><body bgcolor=3Dwhite =
lang=3DEN-US link=3Dblue vlink=3Dpurple><div class=3DWordSection1><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D'=
>Re-sending from the correct account (of mine).<o:p></o:p></span></p><p =
class=3DMsoNormal><a name=3D"_MailEndCompose"><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D'=
><o:p>&nbsp;</o:p></span></a></p><div =
style=3D'border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt'><div><div style=3D'border:none;border-top:solid #E1E1E1 =
1.0pt;padding:3.0pt 0in 0in 0in'><p class=3DMsoNormal><b><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:windowte=
xt'>From:</span></b><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:windowte=
xt'> Esquivel, Benjamin <br><b>Sent:</b> Tuesday, November 15, 2016 =
12:38 PM<br><b>To:</b> 'Jose Perez Carranza' =
&lt;jose.perez.carranza@linux.intel.com&gt;; 'Burton, Ross' =
&lt;ross.burton@intel.com&gt;<br><b>Cc:</b> 'OE-core' =
&lt;openembedded-core@lists.openembedded.org&gt;<br><b>Subject:</b> RE: =
[OE-core] [PATCH v2] oe-tests: Migrate tests from /oe/test to =
/oeqa/selftest/oe-tests<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D'=
>Apologies for the top posting.<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D'=
><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D'=
>The reason for the migration of the tests is for them to be included in =
the selftest execution. And for that execution, it needs to base off of =
the oeSelfTest class.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D'=
><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D'=
>Benjamin<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D'=
><o:p>&nbsp;</o:p></span></p><div style=3D'border:none;border-left:solid =
blue 1.5pt;padding:0in 0in 0in 4.0pt'><div><div =
style=3D'border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in'><p class=3DMsoNormal><b><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:windowte=
xt'>From:</span></b><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:windowte=
xt'> <a =
href=3D"mailto:openembedded-core-bounces@lists.openembedded.org">openembe=
dded-core-bounces@lists.openembedded.org</a> [<a =
href=3D"mailto:openembedded-core-bounces@lists.openembedded.org">mailto:o=
penembedded-core-bounces@lists.openembedded.org</a>] <b>On Behalf Of =
</b>Jose Perez Carranza<br><b>Sent:</b> Tuesday, November 15, 2016 12:09 =
PM<br><b>To:</b> Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;<br><b=
>Cc:</b> OE-core &lt;<a =
href=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-cor=
e@lists.openembedded.org</a>&gt;<br><b>Subject:</b> Re: [OE-core] [PATCH =
v2] oe-tests: Migrate tests from /oe/test to =
/oeqa/selftest/oe-tests<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>On =
11/15/2016 11:16 AM, Burton, Ross wrote:<o:p></o:p></p></div><blockquote =
style=3D'margin-top:5.0pt;margin-bottom:5.0pt'><div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>On 15 =
November 2016 at 16:24, &lt;<a =
href=3D"mailto:jose.perez.carranza@linux.intel.com" =
target=3D"_blank">jose.perez.carranza@linux.intel.com</a>&gt; =
wrote:<o:p></o:p></p><blockquote style=3D'border:none;border-left:solid =
#CCCCCC 1.0pt;padding:0in 0in 0in =
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-bottom:5=
.0pt'><div id=3D":2sc"><p class=3DMsoNormal>+class =
TestPackagesFilterOutSystem(oeSelfTest):<o:p></o:p></p></div></blockquote=
></div><p class=3DMsoNormal><br>As the tests don't need anything special =
that oeSelfTest provides, can they remain as testcase.TestCase =
instances?&nbsp; There's a lot of complication from oeSelfTest that =
isn't required.<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></div></blockquote><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'>In order to the test =
cases be recognized and executed as part of the suite they need to be in =
the same context of selftest hence be an instance of oeSelftest.&nbsp; =
<o:p></o:p></p><blockquote =
style=3D'margin-top:5.0pt;margin-bottom:5.0pt'><div><div><p =
class=3DMsoNormal>Ross<o:p></o:p></p></div></div></blockquote><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></div></div></body></html>

------=_NextPart_000_005E_01D23F41.97116750--
