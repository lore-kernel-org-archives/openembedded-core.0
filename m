Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12717.1793626577190620790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 05:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JfCU955M;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ab38a051aaso28853677b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 05:36:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793626576; cv=none;
        d=google.com; s=arc-20260327;
        b=CNSR+OjNsrmT3YOM5gwGRWH3whbWjQOFJF4+yaLsl7n0PBk0fNSss2AskhuOX/c/v+
         FqT1HoTKzl4zE74eKtpniAcE3/cNhd0QI+/9rvD+9Bs4LRWm/nlYkq+JIX2Jh/WtS6QO
         gXaDVJPR46QI3T0UagRR5lK96Yano6Ind9DIyrjTHiCz3SmeoE07H4G6MWXMeC5euNeW
         BGWVc7H0PqNq0TAALYTZn9AsXinH0NGoVMWPPY3GOentkkTBgbX8aWTzXJijNwnA37gt
         HvcAjGqkezQ5Cnp0ha3AaBZMCqTWY7NNmcNft8tZPoWXXjh1tufCOMDPKw+MFFK2JEEO
         VOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W0CmFrh3rTK4iPnkMRyJQXdjhVsEjLKeng8KeWjXNGA=;
        fh=QVrhXCz/H8RaTvxyR/n7BduMRI7AoERWsUxOs7NjF6M=;
        b=Zc8G441RGYkzFCj1b0+9SSNVNXHanboYCpoiOP3djAzqmbzaCoG/08i/p6+AyOHu48
         XY3vLSEq2d9IITEJO4PuAKtCJYcjjGg3FVCMoP9WdxRzLE3dg1bBQ6Sj2rd514YpWGuq
         dFSS4hkD3RmmmsFTPweIp/90n6iMz0J0/+tPf/jSgLDwH2yNLvBOCrySLuvWAbBtxl3H
         LHHgHB37hvL205If0s+W7qbgL+v87TIu4UiM4UinLLDXGrq2QiSE3IMCX/unmoXtacBn
         KH7F03XznagnDVxh+VdaPXcmUfqnlkRfdfgm25sh2+kLz7pa7oJzwAF2LXsgdwIVg+ej
         pFfA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793626576; x=1794231376; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0CmFrh3rTK4iPnkMRyJQXdjhVsEjLKeng8KeWjXNGA=;
        b=JfCU955M8PzCqpikbt3DxMGBC0rA4J86GLi14Oui7ehwT1phgHNYsD+4QdCCM9o8Y7
         16w0uUL5uZMCybTVVgiFHhy3p1VSZWcsvjhZ6WVvuq5dn8SA7IIt0k6DgsKQQ430gKYx
         7SjtWlCquOEn5rDEdNCAGANAPJchVDs5rGfXFMWN5mouLzhpIk+uSY+rY105Z3WwE32+
         +JfcsTQaHr699bhaHEkP1RvpMfpWKgAZa/QClv9L1KjFlX5ftwviJzU0rH+1gxPdCmjR
         nxKuB1b95Df8Bu1y8brCxxvMXcgtj9PNi4wuXdVom7iDIrT87AKpnkz/dmTuVmt5o9EE
         ENvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626576; x=1794231376;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W0CmFrh3rTK4iPnkMRyJQXdjhVsEjLKeng8KeWjXNGA=;
        b=e4tnYK3O1Iq31etgc/rroJjqgnFsR+ICU7YwGw84mWkOGm9pKcguKD4mAA2kev+4Vr
         yaB2ksUpNiogoHNIlsmIBgqtKgafgOz3+K7OKmA4KYgPC/QF2YYMxyAIRFr+Om6EUzkC
         nO4l5oNmzpulGahhkRcmNHI5rSDyVz/PFRQPt6mVlu0ept+tNSNpx0fvpoVy7vc+cM3n
         WhwrKmm/6DDb0sLF7X7K+E0BKvEl2DUyjmngh5OmXYz+ADoGWajUyvB6akVAj0sHJpnQ
         J2jiBcBMA77pNLIYZm1/S36Wssw217mixZ4sHeljiUcDyAkLu/se+VwVwoB8ue5VDWUU
         z3lw==
X-Forwarded-Encrypted: i=1; AKwUvBzAvOq/mXnlsECSNFFwpqDf+o+iTeeeyvmzIdkuNwJsrVbGKaMdw7vgY4dmw73CtHgPu0FUwbJN53nc0Sv1/aCiEg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/M5YK3Dza2DPmPk+YUnpWokPgi7Y4jfhlSsB78J3h/blzMI6ht
	tl2AS920vLyCOnLNUBDUyDTemj9iVBYL56Fsj87RZExIOZ9uOGbnLUUbEQJTqzdC2gHABJNdlCb
	CVrI/jzHpn68X3Kr3mSPF3hU939DLUyo=
X-Gm-Gg: AYBFou0ooeMaiAQ2jc94RSKhRH9G248l2C27erQsAINFWYeef0ebCc2Se+I47IlsKEh
	CPiV93er7maAjpQHdDPPiA6ix0lkLR5dLym1mZUXPvsEOCzW/2+RieCwroG8+eN4mBYJQA13VFM
	PhmOFcQ7E3o3HLvAdzIS9R9z/4pKlt4M+96SY1UpBhqYpDqAElYjSYfXT+bsGDK8Z4usS16+sF8
	H7V+snS7gZQiEE/47SJuo/Oz2AKWSdju7wKDnVyyaNWy23AXy8HT+r/6Q7svDF/J0QrZ3w3G2S7
	TIr0ENGoOx9UtYsnmEQhdEkyqrAjXelRZuzWZmmnqKS8kYDU32ykeTs1bAnXaX39+38BCkXCwgD
	EpVj97d1pfn197v+4IBlmDGTkyuM+CNJUM5TD63ocHPi6iiISKA9dXppU722U4tWdR1m5FCuX3i
	ZrG3B34k920Nw4GiwTucI+Zm4REV9ssx0Tj4BKHJTbGudrAZISQBIEwBFQ
X-Received: by 2002:a05:690c:c50d:b0:8ac:e42d:330 with SMTP id
 00721157ae682-8b2b67095c5mr69378327b3.28.1793626575067; Mon, 02 Nov 2026
 05:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20261030100214.3111726-1-roshs@qti.qualcomm.com>
 <CADkTA4NWzzaT11ssicpviaA3AgYtOPbpg_HGuciPSttkQUggdQ@mail.gmail.com>
 <CANNYZj-1kbfQpAGpPKaOd_mGqA8Ums_+NO_aFyYtO2fq+gUudA@mail.gmail.com>
 <CADkTA4NCoBwDCxZrgsfAUQP4=9JMbb9CeYVzFg+j7J61ZfsSQg@mail.gmail.com>
 <DS4PR02MB111905C17A50EC946A8E16B0F876B2@DS4PR02MB11190.namprd02.prod.outlook.com>
 <CADkTA4MafrzEFPLhda-XFcBBn--ziqWHUkCASvNMZS-Xv+Ze=Q@mail.gmail.com> <DS4PR02MB11190E63996C3A1CD940B99F7876A2@DS4PR02MB11190.namprd02.prod.outlook.com>
In-Reply-To: <DS4PR02MB11190E63996C3A1CD940B99F7876A2@DS4PR02MB11190.namprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 2 Nov 2026 08:36:01 -0500
X-Gm-Features: AclHuK80iubXPBUcI4vDo4zn4wvyak--VOydm6g2IRUwNAw95MODApCjt6vKQXE
Message-ID: <CADkTA4NW1OLrE6f1PfQ6yptuaVvnVTHdsvwbHHnLdNtyWHs-BQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-devsrc: add runtime dependency on sed
To: Roshan Sivakumar <roshs@qti.qualcomm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Sumanth Gavini <sumanth.gavini@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000dde0f8065f4b3ac6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 13:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249206

--000000000000dde0f8065f4b3ac6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:02=E2=80=AFAM Roshan Sivakumar <roshs@qti.qualcomm=
.com>
wrote:

> Hi Bruce,
>
> Are you rebuilding the kernel completely from -devsrc ? (which
> shouldn't work)
>
> I'm not. But someone else would and removing the script would break that
> ability, wouldn't it?
>
>
It's not a capability that works now. Nothing will be broken. And we'll
never add that ability to -devsrc, so it is safe to do.

Bruce



>
> Thanks,
>
> Roshan.
>
>
>
>
> ------------------------------
> *From:* Bruce Ashfield via openembedded-core <bruce.ashfield=3D
> gmail.com@lists.openembedded.org>
> *Sent:* Sunday, November 01, 2026 06:39
> *To:* Roshan Sivakumar <roshs@qti.qualcomm.com>
> *Cc:* Alexander Kanavin <alex.kanavin@gmail.com>;
> openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; Peter Kjellerstedt <
> peter.kjellerstedt@axis.com>; Sumanth Gavini <sumanth.gavini@windriver.co=
m
> >
> *Subject:* Re: [OE-core][PATCH] kernel-devsrc: add runtime dependency on
> sed
>
> *WARNING:* This email originated from outside of Qualcomm. Please be wary
> of any links or attachments, and do not enable macros.
>
>
> On Sun, Nov 1, 2026 at 8:10=E2=80=AFAM Roshan Sivakumar <roshs@qti.qualco=
mm.com>
> wrote:
>
> Hi Bruce,
>
> Giving more context on what inspired this patch.
>
> When I try to generate sdk including kernel-devsrc in it by running the
> populate_sdk task, I got an error saying
>
> "Nothing provides sed .. "
>
>
> And only for rpm as the package manager ? The reason I ask, is that while
> it isn't a primary
> mode for the -devsrc package, I know people have been putting it into SDK=
s
> in the past.
>
>
>
> I found out that rpm generates this dependency by scanning the shebang
> line in the mksysmap script.
>
> TOOLCHAIN_TARGET_TASK +=3D "kernel-devsrc"
>
> This is how kernel-devsrc is added to be included in the sdk.
>
> Are you suggesting that we remove mksysmap script completely from the
> kernel-devsrc package?
>
>
> yes.
>
> Bruce
>
>
>
> Thanks,
>
> Roshan.
>
>
> ------------------------------
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* Friday, October 30, 2026 07:44
> *To:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Cc:* Roshan Sivakumar <roshs@qti.qualcomm.com>;
> openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; Peter Kjellerstedt <
> peter.kjellerstedt@axis.com>; Sumanth Gavini <sumanth.gavini@windriver.co=
m
> >
> *Subject:* Re: [OE-core][PATCH] kernel-devsrc: add runtime dependency on
> sed
>
>
> *WARNING:* This email originated from outside of Qualcomm. Please be wary
> of any links or attachments, and do not enable macros.
>
>
> On Fri, Oct 30, 2026 at 9:24=E2=80=AFAM Alexander Kanavin <alex.kanavin@g=
mail.com>
> wrote:
>
> On Fri, 30 Oct 2026 at 13:56, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
> I say "probably" above, because you aren't saying what you are
> building that triggered that script to be called at all. From a quick
> grep of the kernel it is only linking vmlinux that uses that.
>
> Are you rebuilding the kernel completely from -devsrc ? (which
> shouldn't work)  Or doing something else that is triggering it to be
> called ?
>
>
> From a different thread, I do not think this script is actually called or
> used. Rather there was an interaction with rpm packaging that revealed th=
e
> missing sed dependency in the package, caused by this script. Rpm tries t=
o
> be clever when processing binaries it's asked to package up, and sometime=
s
> that gets in the way (but other times reveals useful info about missing
> dependencies).
>
>
> Aha.
>
> So in that case (assuming we prove it), we should drop the specific scrip=
t
> (and keep a header around as clean: normally looks for some of these)
> versus just adding the runtime dependency for something that isn't used a=
t
> ... runtime.
>
> note: My comment is for Roshan, not Alex!
>
> Bruce
>
>
>
> Alex
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000dde0f8065f4b3ac6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 2, 2026 at 5:02=
=E2=80=AFAM Roshan Sivakumar &lt;<a href=3D"mailto:roshs@qti.qualcomm.com">=
roshs@qti.qualcomm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div class=3D"msg-7410399795454405759">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Hi Bruce,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:9.75pt;color:rgb(0,0,0)">
<br>
</div>
<blockquote style=3D"margin-left:0.8ex;padding-left:1ex;border-left:3px sol=
id rgb(200,200,200)">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:9.75pt;color:rgb(0,0,0)">
Are you rebuilding the kernel completely from -devsrc ?=C2=A0(which=C2=A0</=
div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:9.75pt;color:rgb(0,0,0)">
shouldn&#39;t work)</div>
</blockquote>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:9.75pt;color:rgb(0,0,0)">
I&#39;m not. But someone else would and removing the script would break tha=
t ability, wouldn&#39;t it?</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br></div></div></div></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">It&#39;s not a capability that works now=
. Nothing will be broken. And we&#39;ll never add that ability to -devsrc, =
so it is safe to do.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div class=3D"msg-7410399795454405759"><div dir=3D"ltr"><div sty=
le=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helv=
etica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
</div>
<div id=3D"m_-7410399795454405759Signature">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<p style=3D"margin:0in;font-family:Calibri,sans-serif;font-size:11pt">
Thanks,</p>
<p style=3D"margin:0in;font-family:Calibri,sans-serif;font-size:11pt">
Roshan.</p>
<p style=3D"margin:0in;font-family:Calibri,sans-serif;font-size:11pt">
=C2=A0</p>
</div>
<div><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<b>From:</b> Bruce Ashfield via openembedded-core &lt;bruce.ashfield=3D<a h=
ref=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com=
@lists.openembedded.org</a>&gt;<br>
<b>Sent:</b> Sunday, November 01, 2026 06:39<br>
<b>To:</b> Roshan Sivakumar &lt;<a href=3D"mailto:roshs@qti.qualcomm.com" t=
arget=3D"_blank">roshs@qti.qualcomm.com</a>&gt;<br>
<b>Cc:</b> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;; <a href=3D"mailto:openemb=
edded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@list=
s.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists.openem=
bedded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&=
gt;; Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" =
target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;; Sumanth Gavini &lt;<=
a href=3D"mailto:sumanth.gavini@windriver.com" target=3D"_blank">sumanth.ga=
vini@windriver.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH] kernel-devsrc: add runtime dependency =
on sed
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<p style=3D"text-align:center;margin-top:1em;margin-bottom:1em"><span style=
=3D"font-family:sans-serif;font-size:14px;color:black;background-color:yell=
ow"><b>WARNING:</b> This email originated from outside of Qualcomm.
 Please be wary of any links or attachments, and do not enable macros.</spa=
n></p>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">On Sun, Nov 1, 2026 at 8:10=E2=80=AFAM Roshan =
Sivakumar &lt;<a href=3D"mailto:roshs@qti.qualcomm.com" id=3D"m_-7410399795=
454405759OWA9891bd4b-3909-3506-a059-78898438f661" target=3D"_blank">roshs@q=
ti.qualcomm.com</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
Hi Bruce,</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
<br>
</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
Giving more context on what inspired this patch.</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
<br>
</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
When I try to generate sdk including kernel-devsrc in it by running the pop=
ulate_sdk task, I got an error saying</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
<br>
</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
&quot;Nothing provides sed .. &quot;=C2=A0</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
<br>
</div>
</blockquote>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">And only for rpm as the=C2=A0=
package manager ? The reason I ask, is that while it isn&#39;t a primary</d=
iv>
<div style=3D"direction:ltr;font-size:9.75pt">mode for the -devsrc package,=
 I know people have been putting it into SDKs in the past.</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
I found out that rpm generates this dependency by scanning the shebang line=
 in the mksysmap script.</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
<br>
</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
TOOLCHAIN_TARGET_TASK +=3D &quot;kernel-devsrc&quot;</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
<br>
</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
This is how kernel-devsrc is added to be included in the sdk.</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
<br>
</div>
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
Are you suggesting that we remove mksysmap script completely from the kerne=
l-devsrc package?</div>
<div id=3D"m_-7410399795454405759x_m_1055014046367821379Signature">
<div style=3D"direction:ltr;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif;font-size:11pt;color:black">
<br>
</div>
</div>
</blockquote>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">yes.</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">Bruce</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div id=3D"m_-7410399795454405759x_m_1055014046367821379Signature">
<p style=3D"direction:ltr;margin:0px;font-family:Calibri,sans-serif;font-si=
ze:11pt">
Thanks,</p>
<p style=3D"direction:ltr;margin:0px;font-family:Calibri,sans-serif;font-si=
ze:11pt">
Roshan.</p>
<p style=3D"direction:ltr;margin:0px;font-family:Calibri,sans-serif;font-si=
ze:11pt">
=C2=A0</p>
</div>
<hr style=3D"direction:ltr;display:inline-block;width:98%">
<div id=3D"m_-7410399795454405759x_m_1055014046367821379divRplyFwdMsg">
<div style=3D"direction:ltr"><span style=3D"font-family:Calibri,sans-serif;=
font-size:11pt;color:black"><b>From:</b> Bruce Ashfield &lt;<a href=3D"mail=
to:bruce.ashfield@gmail.com" id=3D"m_-7410399795454405759OWAa880ab05-5c8a-b=
cc9-d446-d26837e0a169" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<b=
r>
<b>Sent:</b> Friday, October 30, 2026 07:44<br>
<b>To:</b> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
id=3D"m_-7410399795454405759OWA492053eb-1a25-ea3a-284c-ece558630cd9" target=
=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<b>Cc:</b> Roshan Sivakumar &lt;<a href=3D"mailto:roshs@qti.qualcomm.com" i=
d=3D"m_-7410399795454405759OWA78a6f75e-0169-c294-d2ac-9a8cada80947" target=
=3D"_blank">roshs@qti.qualcomm.com</a>&gt;;
<a href=3D"mailto:openembedded-core@lists.openembedded.org" id=3D"m_-741039=
9795454405759OWA89415176-2b3f-9108-fec6-e6d00f44cb8e" target=3D"_blank">
openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembe=
dded-core@lists.openembedded.org" id=3D"m_-7410399795454405759OWAe35b75db-6=
794-29ab-f9fc-30be263bb9cf" target=3D"_blank">openembedded-core@lists.opene=
mbedded.org</a>&gt;; Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjeller=
stedt@axis.com" id=3D"m_-7410399795454405759OWA7238f952-955d-38e5-fad5-bf5a=
194a2797" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;;
 Sumanth Gavini &lt;<a href=3D"mailto:sumanth.gavini@windriver.com" id=3D"m=
_-7410399795454405759OWAd1148e30-9ce6-f446-0a4f-f34e817f534d" target=3D"_bl=
ank">sumanth.gavini@windriver.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH] kernel-devsrc: add runtime dependency =
on sed</span>
</div>
<div style=3D"direction:ltr">=C2=A0</div>
</div>
<p style=3D"direction:ltr;text-align:center;margin-top:1em;margin-bottom:1e=
m">
<span style=3D"font-family:sans-serif;font-size:14px;color:black;background=
-color:yellow"><b>WARNING:</b> This email originated from outside of Qualco=
mm. Please be wary of any links or attachments, and do not enable macros.</=
span></p>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">On Fri, Oct 30, 2026 at 9:24=E2=80=AFAM Alexan=
der Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" id=3D"m_-74103997=
95454405759OWAc5987af3-c044-83d2-2542-f0d3302a09d8" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr">On Fri, 30 Oct 2026 at 13:56, Bruce Ashfield &=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com" id=3D"m_-7410399795454405759=
OWA6b47252f-de34-cd88-bf5a-93e2a24f6f99" target=3D"_blank">bruce.ashfield@g=
mail.com</a>&gt; wrote:</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr;font-size:9.75pt">I say &quot;probably&quot; ab=
ove, because you aren&#39;t saying what you are</div>
<div style=3D"direction:ltr;font-size:9.75pt">building that triggered that =
script to be called at all. From a quick</div>
<div style=3D"direction:ltr;font-size:9.75pt">grep of the kernel it is only=
 linking vmlinux that uses that.=C2=A0</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">Are you rebuilding the kernel=
 completely from -devsrc ?=C2=A0(which=C2=A0</div>
<div style=3D"direction:ltr;font-size:9.75pt">shouldn&#39;t work)=C2=A0 Or =
doing something else that is triggering it to be</div>
<div style=3D"direction:ltr;font-size:9.75pt">called ?</div>
</blockquote>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">From a different thread, I do not think this s=
cript is actually called or used. Rather there was an interaction with rpm =
packaging that revealed the missing sed dependency in the package, caused b=
y this script. Rpm tries to be clever
 when processing binaries it&#39;s asked to package up, and sometimes that =
gets in the way (but other times reveals useful info about missing dependen=
cies).</div>
<div style=3D"direction:ltr"><br>
</div>
</blockquote>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">Aha.</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">So in that case (assuming we =
prove it), we should drop the specific script (and keep a header around as =
clean: normally looks for some of these) versus just adding the runtime dep=
endency for something that isn&#39;t
 used at ... runtime.</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">note: My comment is for=C2=A0=
Roshan, not Alex!</div>
<div style=3D"direction:ltr;font-size:9.75pt"><br>
</div>
<div style=3D"direction:ltr;font-size:9.75pt">Bruce</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left:=
1px solid rgb(204,204,204)">
<div style=3D"direction:ltr">Alex=C2=A0</div>
</blockquote>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">--<br>
</div>
<div style=3D"direction:ltr">- Thou shalt not follow the NULL pointer, for =
chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</div>
</blockquote>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr"><br>
</div>
<div style=3D"direction:ltr">--<br>
</div>
<div style=3D"direction:ltr">- Thou shalt not follow the NULL pointer, for =
chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000dde0f8065f4b3ac6--
