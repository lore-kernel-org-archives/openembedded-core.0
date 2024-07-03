Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832ACC30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 07:16:34 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.45762.1719990992191372213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 00:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NvL0cMJM;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-25e16380bc9so53448fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 00:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719990991; x=1720595791; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VkCoVph9EXk47h63K+zmnXDzs6jpN8xKbfuXAHojbuQ=;
        b=NvL0cMJMVZytjvY+Rwqt94gxZ0XGmD02EJbBF1//S9rNKbZz/mfIzRNucKPcVluO5f
         LSYn7pVaZJqWKhft67Yw5q+Dsr4+mWJBN6GTFdprJn6jSXO32/9+cOVeDe9vNC0Yeoza
         Z+SR9O7MzuK67gyz3IwyJAsLOnd//HRBV5DsbDeS701SrAGmoQUGJ9v0KICMHK4BDPY6
         r2wvn4lFtZo3JVMq6eOSyHnw/P7ULjOTMzjMraisFg2Kh0SFMxxMzmGrhJ9rYr55NoiM
         TdFYMHEzgYnZwS3PMUGS4zAng6+rZzIa6xw6IN03xQRtFT8n8t1JO1m6IdmEw8pdotFo
         Ya7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719990991; x=1720595791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkCoVph9EXk47h63K+zmnXDzs6jpN8xKbfuXAHojbuQ=;
        b=kbToTkTF7EyBtoH1Lx8YTIX2+ngYljmAYO/UV1fDNUV0QhmLdtQfoAUfmo8sjRrt3v
         7ydWNLZ+3H7gETOtlTWDtFzq/a82snvrlmHY4OXLFI4DKQtcENT3rVHpyhT0C3MaZNFZ
         gRZH1sm+gSG2NYzl+HUWR0b20aJoghkEA74WZR67BS2SiO2JwpgMumUq8X7N3/REtghU
         nmf1DWcxD83Dm4JDbmL5OiOgUdJQHdpNN/z5ZdGZrfyuEthflEzLfi5IMhCHKINPD877
         pxfJO+dRLrKJ3GDezayKgsXCcSRrFk3ItQ9KjhBzgtIIYQd7+Tij8TU9wjhcEL2CsoeS
         kx5Q==
X-Gm-Message-State: AOJu0Yxahz8Z/lMM4cxgo1Yz5qh0AwHtnNdSuVajs+kXBgaoj1LiA7BX
	DR5Ra4T1pE2KosANfzNjbxOInAsswhApGfxh6QfQ3vfwJiHkby/rO0IHrQclH/7C420uWwqvtut
	B97uwZVOJDzg3pcD3cY4n7urN3ak=
X-Google-Smtp-Source: AGHT+IHyaUTQDaxBV2Il99XBfrvGfEQ+7oWAg2jXFtMEUdE5QUqUnXuXS0RFpHou7VgdQUa7ZXdUsfsqEfFpebpEsPU=
X-Received: by 2002:a05:6870:1f07:b0:258:3455:4b37 with SMTP id
 586e51a60fabf-25db362b956mr10584970fac.59.1719990991251; Wed, 03 Jul 2024
 00:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240703020027.3434756-1-ruiqiang.hao@windriver.com>
 <CAMKF1spnQpsOZFe_bseefaNtPA0T8z23MStYPxZEfCh8bMMqiA@mail.gmail.com> <SN7PR11MB802547B5393E20C157D4968A8DDD2@SN7PR11MB8025.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB802547B5393E20C157D4968A8DDD2@SN7PR11MB8025.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jul 2024 00:16:04 -0700
Message-ID: <CAMKF1sr62Y21TgHp+78c+gL5UGpOUip6LPJ12Ke6TLf_kCybnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune: octeontx2: remove crypto from TUNE_FEATURES
To: "Hao, Ruiqiang" <Ruiqiang.Hao@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000cef5b061c529c14"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 07:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201455

--0000000000000cef5b061c529c14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 11:57=E2=80=AFPM Hao, Ruiqiang <Ruiqiang.Hao@windriv=
er.com>
wrote:

> This is a clang problem. It should be fixed in clang, not here.
> Additionally we check for 'crypto' in TUNE_FEATURES in many recipes for
> making specific tweaks, they will fail for octeonx2 if we apply this. See
> https://github.com/kraj/meta-clang/blob/master/classes/clang.bbclass#L49-=
L53
> Hi kraj,
>
> Thanks for your prompt feedback.
> I have limited experience with Clang, could you provide some suggestions
> for fixing this issue?
> Additionally, this link is not related to the TUNE_FEATURES check for
> octeontx2.
> Could you provide one name of recipe that checks whether TUNE_FEATURES
> includes 'crypto' to help me with troubleshooting?
>

add it to TUNE_CCARGS:remove:toolchain-clang list
-mcpu=3Docteontx2+crypto

then add to TUNE_CCARGS e.g
TUNE_CCARGS:append:toolchain-clang =3D "${@bb.utils.contains("TUNE_FEATURES=
",
"octeontx2 crypto", " -mcpu=3Docteontx2", "", d)}"


>
> B.R.
> Ruiqiang
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Wednesday, July 3, 2024 11:30
> *To:* Hao, Ruiqiang <Ruiqiang.Hao@windriver.com>
> *Cc:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH] tune: octeontx2: remove crypto from
> TUNE_FEATURES
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
> On Tue, Jul 2, 2024 at 7:00=E2=80=AFPM Ruiqiang Hao via lists.openembedde=
d.org
> <Ruiqiang.Hao=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
> >
> > Since GCC's configuration includes the crypto feature when specifying
> > '-mcpu=3Docteontx2', there's no need to additionally include this featu=
re
> > in TUNE_FEATURES. Removing crypto to fix the following error:
> >
> > aarch64-wrs-linux-clang: error: unsupported argument 'octeontx2+crypto'
> for option '-mcpu=3D'
>
> This is a clang problem. It should be fixed in clang, not here.
> Additionally we check for 'crypto' in TUNE_FEATURES in
> many recipes for making specific tweaks, they will fail for octeonx2
> if we apply this. See
>
> https://github.com/kraj/meta-clang/blob/master/classes/clang.bbclass#L49-=
L53
>
> >
> > Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
> > ---
> >  meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
> b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
> > index e9d7a59c51..d51d19b980 100644
> > --- a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
> > +++ b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
> > @@ -9,6 +9,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc
> >  AVAILTUNES +=3D "octeontx2"
> >  ARMPKGARCH:tune-octeontx2             =3D "octeontx2"
> >  # We do not want -march since -mcpu is added above to cover for it
> > -TUNE_FEATURES:tune-octeontx2          =3D "aarch64 crypto octeontx2"
> > +TUNE_FEATURES:tune-octeontx2          =3D "aarch64 octeontx2"
> >  PACKAGE_EXTRA_ARCHS:tune-octeontx2    =3D
> "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} octeontx2"
> >  BASE_LIB:tune-octeontx2               =3D "lib64"
> > --
> > 2.45.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#201448):
> https://lists.openembedded.org/g/openembedded-core/message/201448
> > Mute This Topic: https://lists.openembedded.org/mt/107012841/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000000cef5b061c529c14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 2, 2024 at 11:57=E2=80=AF=
PM Hao, Ruiqiang &lt;<a href=3D"mailto:Ruiqiang.Hao@windriver.com">Ruiqiang=
.Hao@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div class=3D"msg4169497276683250889">




<div dir=3D"ltr">
<div style=3D"width:100%;display:inline-block;color:inherit;background-colo=
r:inherit">
<table style=3D"border:1.5px solid rgb(237,235,233);border-radius:4px;paddi=
ng:4px 0px 4px 4px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService=
,Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0);margin-bottom=
:4px" id=3D"m_4169497276683250889ReplyWithQuote_Container">
<tbody>
<tr>
<td style=3D"background-color:rgb(200,198,196);width:3.5px;border-radius:10=
px" rowspan=3D"2">
</td>
<td style=3D"font-size:12px;border-left:10px solid transparent;border-right=
:10px solid transparent">
</td>
</tr>
<tr>
<td style=3D"font-size:14px;color:rgb(50,49,48);border-left:10px solid tran=
sparent;border-right:10px solid transparent">
This is a clang problem. It should be fixed in clang, not here. Additionall=
y we check for &#39;crypto&#39; in TUNE_FEATURES in many recipes for making=
 specific tweaks, they will fail for octeonx2 if we apply this. See <a href=
=3D"https://github.com/kraj/meta-clang/blob/master/classes/clang.bbclass#L4=
9-L53" target=3D"_blank">https://github.com/kraj/meta-clang/blob/master/cla=
sses/clang.bbclass#L49-L53</a></td>
</tr>
</tbody>
</table>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi kraj,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"direction:ltr;margin-top:1em;margin-bottom:1em;font-family:Ap=
tos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;fon=
t-size:12pt;color:rgb(0,0,0)">
Thanks for your prompt feedback.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I have limited experience with Clang, could you provide some suggestions fo=
r fixing this issue?=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Additionally, this link is not related to the TUNE_FEATURES check for octeo=
ntx2.=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Could you provide one name of recipe that checks whether TUNE_FEATURES incl=
udes &#39;crypto&#39; to help me with troubleshooting?</div></div></div></b=
lockquote><div><br></div><div>add it to=C2=A0TUNE_CCARGS:remove:toolchain-c=
lang list</div><div>-mcpu=3Docteontx2+crypto</div><div><br></div><div>then =
add to TUNE_CCARGS e.g</div><div>TUNE_CCARGS:append:toolchain-clang =3D &qu=
ot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;, &quot;octeontx2 crypto&q=
uot;, &quot; -mcpu=3Docteontx2&quot;, &quot;&quot;, d)}&quot;<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg4169497276683250889"><div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
B.R.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Ruiqiang</div>
<div id=3D"m_4169497276683250889appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_4169497276683250889divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;<br>
<b>Sent:</b> Wednesday, July 3, 2024 11:30<br>
<b>To:</b> Hao, Ruiqiang &lt;<a href=3D"mailto:Ruiqiang.Hao@windriver.com" =
target=3D"_blank">Ruiqiang.Hao@windriver.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] tune: octeontx2: remove crypto from T=
UNE_FEATURES</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>CAUTION: This email comes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Tue, Jul 2, 2024 at 7:00=E2=80=AFPM Ruiqiang Hao via <a href=3D"http://l=
ists.openembedded.org" target=3D"_blank">lists.openembedded.org</a><br>
&lt;Ruiqiang.Hao=3D<a href=3D"mailto:windriver.com@lists.openembedded.org" =
target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Ruiqiang Hao &lt;<a href=3D"mailto:Ruiqiang.Hao@windriver.com" t=
arget=3D"_blank">Ruiqiang.Hao@windriver.com</a>&gt;<br>
&gt;<br>
&gt; Since GCC&#39;s configuration includes the crypto feature when specify=
ing<br>
&gt; &#39;-mcpu=3Docteontx2&#39;, there&#39;s no need to additionally inclu=
de this feature<br>
&gt; in TUNE_FEATURES. Removing crypto to fix the following error:<br>
&gt;<br>
&gt; aarch64-wrs-linux-clang: error: unsupported argument &#39;octeontx2+cr=
ypto&#39; for option &#39;-mcpu=3D&#39;<br>
<br>
This is a clang problem. It should be fixed in clang, not here.<br>
Additionally we check for &#39;crypto&#39; in TUNE_FEATURES in<br>
many recipes for making specific tweaks, they will fail for octeonx2<br>
if we apply this. See<br>
<a href=3D"https://github.com/kraj/meta-clang/blob/master/classes/clang.bbc=
lass#L49-L53" target=3D"_blank">https://github.com/kraj/meta-clang/blob/mas=
ter/classes/clang.bbclass#L49-L53</a><br>
<br>
&gt;<br>
&gt; Signed-off-by: Ruiqiang Hao &lt;<a href=3D"mailto:Ruiqiang.Hao@windriv=
er.com" target=3D"_blank">Ruiqiang.Hao@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc | 2 +-=
<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc=
 b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc<br>
&gt; index e9d7a59c51..d51d19b980 100644<br>
&gt; --- a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc<br>
&gt; +++ b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc<br>
&gt; @@ -9,6 +9,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc<br>
&gt;=C2=A0 AVAILTUNES +=3D &quot;octeontx2&quot;<br>
&gt;=C2=A0 ARMPKGARCH:tune-octeontx2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;octeontx2&quot;<br>
&gt;=C2=A0 # We do not want -march since -mcpu is added above to cover for =
it<br>
&gt; -TUNE_FEATURES:tune-octeontx2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;aarch64 crypto octeontx2&quot;<br>
&gt; +TUNE_FEATURES:tune-octeontx2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;aarch64 octeontx2&quot;<br>
&gt;=C2=A0 PACKAGE_EXTRA_ARCHS:tune-octeontx2=C2=A0=C2=A0=C2=A0 =3D &quot;$=
{PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} octeontx2&quot;<br>
&gt;=C2=A0 BASE_LIB:tune-octeontx2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;lib64&quot;<br>
&gt; --<br>
&gt; 2.45.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#201448): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/201448" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/201448</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10701284=
1/1997914" target=3D"_blank">
https://lists.openembedded.org/mt/107012841/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</div>

</div></blockquote></div></div>

--0000000000000cef5b061c529c14--

