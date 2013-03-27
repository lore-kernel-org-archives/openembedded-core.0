Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKrud-00033p-NM
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 16:05:22 +0100
Received: by mail-pb0-f46.google.com with SMTP id uo1so1457597pbc.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 07:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:message-id:references:to:x-mailer;
	bh=u4RwDMAUMY1HFdBiDXaqcRwWZOb92UZbPpNPRAc1Fw4=;
	b=O+uMUr/l/eKgWCgNekHrDf06ZlSK8q+u4uhGgBBVHNzifrWDIGI9zbGj4EPQPApTaw
	komRO6Nw8rsXsIO6DxrOgMk6cC9mtTNDu5V4+Age1YNDSVwanQn481AVeiyvZiEpahzE
	OJj7R0h9AvJS4TZLjOPLjLYxQFCFpFra7EvX25x/hivV8TtmE1KSHEn33uje89Z207Rq
	2Q1K3e4QcwI4kJecXnG5oLsXD1X1jk1Ww4ajaMFiLsG5Z4EoEkUPXaMWzGKH1ntmXVWp
	KLJFWXvZx9CJaC92xE9tRcSOaU9dd2H/Pcr+Fhcj0WFSQX3BtRVwky3Z/aJCssC9W75C
	Pd6Q==
X-Received: by 10.68.179.1 with SMTP id dc1mr29302205pbc.128.1364395693575;
	Wed, 27 Mar 2013 07:48:13 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id qh4sm17325843pac.8.2013.03.27.07.48.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 07:48:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <019d01ce2acc$289b89a0$79d29ce0$@st.com>
Date: Wed, 27 Mar 2013 07:48:10 -0700
Message-Id: <91A9D013-4F74-40F0-B6BB-6FFB647B3991@gmail.com>
References: <019d01ce2acc$289b89a0$79d29ce0$@st.com>
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] iproute2: add bash runtime dependence
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 15:05:36 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_352C43DB-839F-402E-B92B-3DF80FC351FB"

--Apple-Mail=_352C43DB-839F-402E-B92B-3DF80FC351FB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Mar 27, 2013, at 2:19 AM, Giuseppe CONDORELLI =
<giuseppe.condorelli@st.com> wrote:

> Hi All,
> =20
> =D8  Where does this dependency come from?
> The dependency comes from the =93ip=94 subdirs, where there are three =
bash scripts.
> Also there are few scripts as examples.
> =20

yeah create a new package something like iproute2-examples and package =
these scripts there

> Khem,
> do you think it is however the case to split the package creating the =
ip one?
> This problem appeared when I tried to install iproute2, previously =
packaged as rpm.
> =20
> Best Regards,
> Giuseppe
> =20
> =20
> From: Giuseppe Condorelli [mailto:giuseppe.condorelli@gmail.com]=20
> Sent: mercoled=EC 27 marzo 2013 10:14
> To: Giuseppe CONDORELLI
> Subject: Fwd: [OE-core] [PATCH] iproute2: add bash runtime dependence
> =20
> =20
>=20
> ---------- Forwarded message ----------
> From: Phil Blundell <pb@pbcl.net>
> Date: 2013/3/26
> Subject: Re: [OE-core] [PATCH] iproute2: add bash runtime dependence
> To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
> Cc: openembedded-core@lists.openembedded.org
>=20
>=20
> On Tue, 2013-03-26 at 17:17 +0100, Giuseppe CONDORELLI wrote:
> > Add bash runtime dependence, required at package install time.
>=20
> Where does this dependency come from?
>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> =20


--Apple-Mail=_352C43DB-839F-402E-B92B-3DF80FC351FB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=windows-1252

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dwindows-1252"><base href=3D"x-msg://1289/"></head><body =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><br><div><div>On Mar 27, 2013, =
at 2:19 AM, Giuseppe CONDORELLI &lt;<a =
href=3D"mailto:giuseppe.condorelli@st.com">giuseppe.condorelli@st.com</a>&=
gt; wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div lang=3D"EN-US" link=3D"blue" vlink=3D"purple" =
style=3D"font-family: Helvetica; font-size: medium; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
"><div class=3D"WordSection1" style=3D"page: WordSection1; "><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: 'Times =
New Roman', serif; "><span style=3D"font-size: 11pt; font-family: =
Calibri, sans-serif; color: rgb(31, 73, 125); ">Hi =
All,<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman', serif; "><span =
style=3D"font-size: 11pt; font-family: Calibri, sans-serif; color: =
rgb(31, 73, 125); ">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt 36pt; font-size: 12pt; font-family: 'Times New Roman', serif; =
text-indent: -18pt; "><span style=3D"font-size: 11pt; font-family: =
Wingdings; color: rgb(31, 73, 125); "><span>=D8<span style=3D"font-style: =
normal; font-variant: normal; font-weight: normal; font-size: 7pt; =
line-height: normal; font-family: 'Times New Roman'; ">&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span></span></span></span>Where =
does this dependency come from?<span style=3D"font-size: 11pt; =
font-family: Calibri, sans-serif; color: rgb(31, 73, 125); =
"><o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman', serif; "><span =
style=3D"font-size: 11pt; font-family: Calibri, sans-serif; color: =
rgb(31, 73, 125); ">The dependency comes from the =93ip=94 subdirs, =
where there are three bash scripts.<o:p></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: 'Times =
New Roman', serif; "><span style=3D"font-size: 11pt; font-family: =
Calibri, sans-serif; color: rgb(31, 73, 125); ">Also there are few =
scripts as examples.<o:p></o:p></span></div><div style=3D"margin: 0cm =
0cm 0.0001pt; font-size: 12pt; font-family: 'Times New Roman', serif; =
"><span style=3D"font-size: 11pt; font-family: Calibri, sans-serif; =
color: rgb(31, 73, 125); =
">&nbsp;</span></div></div></div></blockquote><div><br></div><div>yeah =
create a new package something like iproute2-examples and package these =
scripts there</div><br><blockquote type=3D"cite"><div lang=3D"EN-US" =
link=3D"blue" vlink=3D"purple" style=3D"font-family: Helvetica; =
font-size: medium; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; "><div =
class=3D"WordSection1" style=3D"page: WordSection1; "><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: 'Times =
New Roman', serif; "><span style=3D"font-size: 11pt; font-family: =
Calibri, sans-serif; color: rgb(31, 73, 125); =
">Khem,<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman', serif; "><span =
style=3D"font-size: 11pt; font-family: Calibri, sans-serif; color: =
rgb(31, 73, 125); ">do you think it is however the case to split the =
package creating the ip one?<o:p></o:p></span></div><div style=3D"margin: =
0cm 0cm 0.0001pt; font-size: 12pt; font-family: 'Times New Roman', =
serif; "><span style=3D"font-size: 11pt; font-family: Calibri, =
sans-serif; color: rgb(31, 73, 125); ">This problem appeared when I =
tried to install iproute2, previously packaged as =
rpm.<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman', serif; "><span =
style=3D"font-size: 11pt; font-family: Calibri, sans-serif; color: =
rgb(31, 73, 125); ">&nbsp;</span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 12pt; font-family: 'Times New Roman', serif; =
"><span style=3D"font-size: 11pt; font-family: Calibri, sans-serif; =
color: rgb(31, 73, 125); ">Best Regards,<o:p></o:p></span></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: 'Times =
New Roman', serif; "><span style=3D"font-size: 11pt; font-family: =
Calibri, sans-serif; color: rgb(31, 73, 125); =
">Giuseppe<o:p></o:p></span></div><div style=3D"margin: 0cm 0cm =
0.0001pt; font-size: 12pt; font-family: 'Times New Roman', serif; =
"><span style=3D"font-size: 11pt; font-family: Calibri, sans-serif; =
color: rgb(31, 73, 125); ">&nbsp;</span></div><div style=3D"margin: 0cm =
0cm 0.0001pt; font-size: 12pt; font-family: 'Times New Roman', serif; =
"><span style=3D"font-size: 11pt; font-family: Calibri, sans-serif; =
color: rgb(31, 73, 125); ">&nbsp;</span></div><div style=3D"border-style: =
none none none solid; border-left-width: 1.5pt; border-left-color: blue; =
padding: 0cm 0cm 0cm 4pt; "><div><div style=3D"border-style: solid none =
none; border-top-width: 1pt; border-top-color: rgb(181, 196, 223); =
padding: 3pt 0cm 0cm; "><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman', serif; "><b><span =
style=3D"font-size: 10pt; font-family: Tahoma, sans-serif; =
">From:</span></b><span style=3D"font-size: 10pt; font-family: Tahoma, =
sans-serif; "><span class=3D"Apple-converted-space">&nbsp;</span>Giuseppe =
Condorelli [mailto:giuseppe.condorelli@<a href=3D"http://gmail.com" =
style=3D"color: purple; text-decoration: underline; =
">gmail.com</a>]<span =
class=3D"Apple-converted-space">&nbsp;</span><br><b>Sent:</b><span =
class=3D"Apple-converted-space">&nbsp;</span>mercoled=EC 27 marzo 2013 =
10:14<br><b>To:</b><span =
class=3D"Apple-converted-space">&nbsp;</span>Giuseppe =
CONDORELLI<br><b>Subject:</b><span =
class=3D"Apple-converted-space">&nbsp;</span>Fwd: [OE-core] [PATCH] =
iproute2: add bash runtime =
dependence<o:p></o:p></span></div></div></div><div style=3D"margin: 0cm =
0cm 0.0001pt; font-size: 12pt; font-family: 'Times New Roman', serif; =
"><o:p>&nbsp;</o:p></div><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm =
12pt; font-size: 12pt; font-family: 'Times New Roman', serif; =
"><o:p>&nbsp;</o:p></p><div><p class=3D"MsoNormal" style=3D"margin: 0cm =
0cm 12pt; font-size: 12pt; font-family: 'Times New Roman', serif; =
">---------- Forwarded message ----------<br>From:<span =
class=3D"Apple-converted-space">&nbsp;</span><b>Phil Blundell</b><span =
class=3D"Apple-converted-space">&nbsp;</span>&lt;<a =
href=3D"mailto:pb@pbcl.net" style=3D"color: purple; text-decoration: =
underline; ">pb@pbcl.net</a>&gt;<br>Date: 2013/3/26<br>Subject: Re: =
[OE-core] [PATCH] iproute2: add bash runtime dependence<br>To: Giuseppe =
CONDORELLI &lt;<a href=3D"mailto:giuseppe.condorelli@st.com" =
style=3D"color: purple; text-decoration: underline; =
">giuseppe.condorelli@st.com</a>&gt;<br>Cc:<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:openembedded-core@lists.openembedded.org" style=3D"color: =
purple; text-decoration: underline; =
">openembedded-core@lists.openembedded.org</a><br><br><o:p></o:p></p><div>=
<p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 12pt; font-size: 12pt; =
font-family: 'Times New Roman', serif; ">On Tue, 2013-03-26 at 17:17 =
+0100, Giuseppe CONDORELLI wrote:<br>&gt; Add bash runtime dependence, =
required at package install time.<o:p></o:p></p></div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: 'Times =
New Roman', serif; ">Where does this dependency come from?<br><span =
style=3D"color: rgb(136, 136, 136); "><br><span =
class=3D"hoenzb">p.</span></span><o:p></o:p></div><div><div =
style=3D"margin: 0cm 0cm 0.0001pt; font-size: 12pt; font-family: 'Times =
New Roman', serif; =
"><br><br><br>_______________________________________________<br>Openembed=
ded-core mailing list<br><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" style=3D"color: =
purple; text-decoration: underline; =
">Openembedded-core@lists.openembedded.org</a><br><a =
href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-c=
ore" target=3D"_blank" style=3D"color: purple; text-decoration: =
underline; =
">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a=
><o:p></o:p></div></div></div><div style=3D"margin: 0cm 0cm 0.0001pt; =
font-size: 12pt; font-family: 'Times New Roman', serif; =
"><o:p>&nbsp;</o:p></div></div></div></div></blockquote></div><br></body><=
/html>=

--Apple-Mail=_352C43DB-839F-402E-B92B-3DF80FC351FB--
