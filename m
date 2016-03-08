Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.163])
	by mail.openembedded.org (Postfix) with ESMTP id 4E425607F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 07:44:30 +0000 (UTC)
Received: from filter.sfr.fr (localhost [111.250.200.72])
	by msfrf2603.sfr.fr (SMTP Server) with ESMTP id C00701C000C2C;
	Tue,  8 Mar 2016 08:44:29 +0100 (CET)
Authentication-Results: sfrmc.priv.atos.fr; dkim=none (no signature);
	dkim-adsp=none (no policy) header.from=herve.jourdain@neuf.fr
Received: from nb-hjo (111-250-200-72.dynamic.hinet.net
	[111.250.200.72])	(using TLSv1
	with cipher AES128-SHA (128/128 bits))	(No client certificate
	requested)
	by msfrf2603.sfr.fr (SMTP Server) with ESMTP id B8AC41C000C1F;
	Tue,  8 Mar 2016 08:44:27 +0100 (CET)
X-SFR-UUID: 20160308074427756.B8AC41C000C1F@msfrf2603.sfr.fr
Received: from nbhjo
	by nb-hjo (PGP Universal service);  Tue, 08 Mar 2016 08:44:26 +0100
X-PGP-Universal: processed;	by nb-hjo on Tue, 08 Mar 2016 08:44:26 +0100
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: "'Burton, Ross'" <ross.burton@intel.com>
References: <00ce01d1788a$58d10b90$0a7322b0$@neuf.fr>
	<CAJTo0LYKDrDuQZTcfR2Smm5q9+PM0SQZ0aQvMLJ-6rpnQ8MtHg@mail.gmail.com>
In-Reply-To: <CAJTo0LYKDrDuQZTcfR2Smm5q9+PM0SQZ0aQvMLJ-6rpnQ8MtHg@mail.gmail.com>
Date: Tue, 8 Mar 2016 08:44:21 +0100
Message-ID: <013d01d1790e$572683e0$05738ba0$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJ7CaaI/1NLJlJ1n165w/M4NEVkowJKO3prnem2q9A=
Cc: 'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] systemd: binfmt should be added to SYSTEMD_PACKAGES only if binfmt is enabled
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
X-List-Received-Date: Tue, 08 Mar 2016 07:44:31 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_013E_01D17916.B8ED5CE0"
Content-Language: fr

------=_NextPart_000_013E_01D17916.B8ED5CE0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

=20

Duly noted, actually I tried several times through git-send-email, but =
it didn=E2=80=99t go through=E2=80=A6 I=E2=80=99m trying to figure out =
how to have it working in my configuration, but as a last resort I =
turned to Oulook=E2=80=A6

Until I fix my configuration, if I have other patches to send, =
I=E2=80=99ll follow your suggestion and attach the patch to the email.

=20

Thanks,

=20

Herve

=20

From: Burton, Ross [mailto:ross.burton@intel.com]=20
Sent: lundi 7 mars 2016 17:16
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH] systemd: binfmt should be added =
to SYSTEMD_PACKAGES only if binfmt is enabled

=20

Your mailer (Outlook, by the look of it) is corrupting patches (wraps =
lines when they shouldn't be wrapped), in the future please don't send =
patches by pasting them into an email but use git-send-email if you can, =
or attach the patch if you can't.  For a one-liner I could fix up the =
patch by hand so you don't need to re-send this one.

=20

Ross

=20

On 7 March 2016 at 15:59, Herve Jourdain <herve.jourdain@neuf.fr =
<mailto:herve.jourdain@neuf.fr> > wrote:

V2
Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr =
<mailto:herve.jourdain@neuf.fr> >
---
 meta/recipes-core/systemd/systemd_229.bb <http://systemd_229.bb>  | 2 =
++--
 1 file changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb =
<http://systemd_229.bb>=20
b/meta/recipes-core/systemd/systemd_229.bb <http://systemd_229.bb>=20
index 16af0ac..a537dd3 100644
--- a/meta/recipes-core/systemd/systemd_229.bb <http://systemd_229.bb>=20
+++ b/meta/recipes-core/systemd/systemd_229.bb <http://systemd_229.bb>=20
@@ -298,7 +298,7 @@ PACKAGES =3D+ "\
     ${PN}-extra-utils \
 "

-SYSTEMD_PACKAGES =3D "${PN}-binfmt"
+SYSTEMD_PACKAGES =3D "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', =
<mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'binfmt',%0b'$%7bPN%7d-=
binfmt',%20'',%20d)%7d>=20
'${PN}-binfmt', '', d)}"
 SYSTEMD_SERVICE_${PN}-binfmt =3D "systemd-binfmt.service"

 USERADD_PACKAGES =3D "${PN}"
--
1.9.1
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>=20
http://lists.openembedded.org/mailman/listinfo/openembedded-core
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>=20
http://lists.openembedded.org/mailman/listinfo/openembedded-core

=20


------=_NextPart_000_013E_01D17916.B8ED5CE0
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
span.hoenzb
	{mso-style-name:hoenzb;}
span.EmailStyle18
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
mso-fareast-language:EN-US'>Duly noted, actually I tried several times =
through git-send-email, but it didn=E2=80=99t go through=E2=80=A6 =
I=E2=80=99m trying to figure out how to have it working in my =
configuration, but as a last resort I turned to =
Oulook=E2=80=A6<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D;=
mso-fareast-language:EN-US'>Until I fix my configuration, if I have =
other patches to send, I=E2=80=99ll follow your suggestion and attach =
the patch to the email.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D;=
mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif;color:#1F497D;=
mso-fareast-language:EN-US'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
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
Ross [mailto:ross.burton@intel.com] <br><b>Sent:</b> lundi 7 mars 2016 =
17:16<br><b>To:</b> Herve Jourdain =
&lt;herve.jourdain@neuf.fr&gt;<br><b>Cc:</b> OE-core =
&lt;openembedded-core@lists.openembedded.org&gt;<br><b>Subject:</b> Re: =
[OE-core] [meta-oe][PATCH] systemd: binfmt should be added to =
SYSTEMD_PACKAGES only if binfmt is enabled<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>Your =
mailer (Outlook, by the look of it) is corrupting patches (wraps lines =
when they shouldn't be wrapped), in the future please don't send patches =
by pasting them into an email but use git-send-email if you can, or =
attach the patch if you can't.&nbsp; For a one-liner I could fix up the =
patch by hand so you don't need to re-send this =
one.<o:p></o:p></p><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>Ross<o:p></o:p></p></div></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>On 7 =
March 2016 at 15:59, Herve Jourdain &lt;<a =
href=3D"mailto:herve.jourdain@neuf.fr" =
target=3D"_blank">herve.jourdain@neuf.fr</a>&gt; =
wrote:<o:p></o:p></p><blockquote style=3D'border:none;border-left:solid =
#CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-right:0cm'><p =
class=3DMsoNormal>V2<br>Signed-off-by: Herve Jourdain &lt;<a =
href=3D"mailto:herve.jourdain@neuf.fr">herve.jourdain@neuf.fr</a>&gt;<br>=
---<br>&nbsp;meta/recipes-core/systemd/<a href=3D"http://systemd_229.bb" =
target=3D"_blank">systemd_229.bb</a> | 2 ++--<br>&nbsp;1 file changed, 1 =
insertions(+), 1 deletions(-)<br><br>diff --git =
a/meta/recipes-core/systemd/<a href=3D"http://systemd_229.bb" =
target=3D"_blank">systemd_229.bb</a><br>b/meta/recipes-core/systemd/<a =
href=3D"http://systemd_229.bb" =
target=3D"_blank">systemd_229.bb</a><br>index 16af0ac..a537dd3 =
100644<br>--- a/meta/recipes-core/systemd/<a =
href=3D"http://systemd_229.bb" =
target=3D"_blank">systemd_229.bb</a><br>+++ =
b/meta/recipes-core/systemd/<a href=3D"http://systemd_229.bb" =
target=3D"_blank">systemd_229.bb</a><br>@@ -298,7 +298,7 @@ PACKAGES =
=3D+ &quot;\<br>&nbsp; &nbsp; &nbsp;${PN}-extra-utils =
\<br>&nbsp;&quot;<br><br>-SYSTEMD_PACKAGES =3D =
&quot;${PN}-binfmt&quot;<br>+SYSTEMD_PACKAGES =3D &quot;<a =
href=3D"mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'binfmt',%0b'$%7=
bPN%7d-binfmt',%20'',%20d)%7d">${@bb.utils.contains('PACKAGECONFIG', =
'binfmt',<br>'${PN}-binfmt', '', =
d)}</a>&quot;<br>&nbsp;SYSTEMD_SERVICE_${PN}-binfmt =3D =
&quot;systemd-binfmt.service&quot;<br><br>&nbsp;USERADD_PACKAGES =3D =
&quot;${PN}&quot;<br>--<br>1.9.1<br>--<br>_______________________________=
________________<br>Openembedded-core mailing list<br><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-cor=
e@lists.openembedded.org</a><br><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core"=
 =
target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br><span class=3Dhoenzb><span =
style=3D'color:#888888'>--</span></span><span =
style=3D'color:#888888'><br><span =
class=3Dhoenzb>_______________________________________________</span><br>=
<span class=3Dhoenzb>Openembedded-core mailing list</span><br><span =
class=3Dhoenzb><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-cor=
e@lists.openembedded.org</a></span><br><span class=3Dhoenzb><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core"=
 =
target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a></span></span><o:p></o:p></p></blockquote></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></div></body></html>

------=_NextPart_000_013E_01D17916.B8ED5CE0--
