Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.20])
	by mail.openembedded.org (Postfix) with ESMTP id C811173219
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 11:58:11 +0000 (UTC)
Received: from nbhjo (111-250-207-159.dynamic.hinet.net [111.250.207.159])
	by msfrf2632.sfr.fr (SMTP Server) with ESMTP id CCDE11C000C29;
	Wed, 18 May 2016 13:58:10 +0200 (CEST)
Received: from nbhjo (111-250-207-159.dynamic.hinet.net
	[111.250.207.159])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2632.sfr.fr (SMTP Server) with ESMTPSA;
	Wed, 18 May 2016 13:58:09 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: "'Burton, Ross'" <ross.burton@intel.com>
References: <1463564726-111166-1-git-send-email-herve.jourdain@neuf.fr>
	<1463564726-111166-2-git-send-email-herve.jourdain@neuf.fr>
	<CAJTo0LYo8sTu+K2oFVxjRy16YW8+DjbzS90TF28XWaSQ+FXDCQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYo8sTu+K2oFVxjRy16YW8+DjbzS90TF28XWaSQ+FXDCQ@mail.gmail.com>
Date: Wed, 18 May 2016 13:58:04 +0200
Message-ID: <017d01d1b0fc$8c9e5950$a5db0bf0$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHpnVzzfJCBK/1OjoHzRF9Oh5krkAJCxL19AP5pdWqfdLTEYA==
X-sfr-mailing: LEGIT
Cc: 'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [mesa][PATCH 1/1] Fix mesa_populate_packages() when dri is disabled
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
X-List-Received-Date: Wed, 18 May 2016 11:58:12 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_017E_01D1B10D.5027C590"
Content-Language: fr

------=_NextPart_000_017E_01D1B10D.5027C590
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

=20

Yep, you=E2=80=99re right, sorry for that. V2 coming in a few.

=20

Herve

=20

From: Burton, Ross [mailto:ross.burton@intel.com]=20
Sent: mercredi 18 mai 2016 13:28
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [mesa][PATCH 1/1] Fix mesa_populate_packages() =
when dri is disabled

=20

=20

On 18 May 2016 at 10:45, Herve Jourdain <herve.jourdain@neuf.fr =
<mailto:herve.jourdain@neuf.fr> > wrote:

+    if os.path.isdir(dri_drivers_root):


You're checking files on the host here as dri_driver_root is =
${libdir}/dri and you failed to append PKGD (see the os.listdir call).

=20

Ross


------=_NextPart_000_017E_01D1B10D.5027C590
Content-Type: text/html;
	charset="utf-8"
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
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
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DFR link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D;=
mso-fareast-language:EN-US'>Hi Ross,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D;=
mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D;=
mso-fareast-language:EN-US'>Yep, you=E2=80=99re right, sorry for that. =
V2 coming in a few.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D;=
mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D;=
mso-fareast-language:EN-US'>Herve<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D;=
mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>From:</span><=
/b><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'> Burton, =
Ross [mailto:ross.burton@intel.com] <br><b>Sent:</b> mercredi 18 mai =
2016 13:28<br><b>To:</b> Herve Jourdain =
&lt;herve.jourdain@neuf.fr&gt;<br><b>Cc:</b> OE-core =
&lt;openembedded-core@lists.openembedded.org&gt;<br><b>Subject:</b> Re: =
[OE-core] [mesa][PATCH 1/1] Fix mesa_populate_packages() when dri is =
disabled<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>On 18 =
May 2016 at 10:45, Herve Jourdain &lt;<a =
href=3D"mailto:herve.jourdain@neuf.fr" =
target=3D"_blank">herve.jourdain@neuf.fr</a>&gt; =
wrote:<o:p></o:p></p><blockquote style=3D'border:none;border-left:solid =
#CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-right:0cm'><div id=3D":a6k"><p =
class=3DMsoNormal>+&nbsp; &nbsp; if =
os.path.isdir(dri_drivers_root):<o:p></o:p></p></div></blockquote></div><=
p class=3DMsoNormal><br>You're checking files on the host here as =
dri_driver_root is ${libdir}/dri and you failed to append PKGD (see the =
os.listdir call).<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>Ross<o:p></o:p></p></div></div></div></body></html>

------=_NextPart_000_017E_01D1B10D.5027C590--
