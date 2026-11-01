Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15966.1793543993317219401
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 06:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QfpdjSyH;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9d7791b00so15950455ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 06:39:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793543992; cv=none;
        d=google.com; s=arc-20260327;
        b=gdRluyonWCwDdAxbM7N/jufHvsEqZYBvRh+eF5WUZcrG1BGaVRvH7sfQPCQV9F1OVc
         Cfhn2rkb7Vnj7vSx6L5pQpHILZFl+n3nbPNYTPAR0woEDd8WU7rCoPA6bZy3jg3CY7cK
         hJ9FT8ErQtZDAeNusEH6FV7M0fnvbX7cz9NEJpni/+BYd8pHu8/zHtiTJaBEl5ILYrdb
         e6aqK9an/uQPqG6VHMovOWbXt5CzgnufskbOLtg2NA7H6xpyCZ1wrsOfyCrzlslfMCkt
         7LdjjedmGtnbMfLcER9MsE48fxi0inkGP3a3A/6HY/2PqYkwanILcnb+6x0Bhp1hq6Vw
         Wreg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d0IOfsMD5SxMJd0XSmmsDbCH0cLOORr0623lhHBumwk=;
        fh=XEeFuJirsPXni/ugNGBRaJgK9WqZbhVJyAZe3jlzViw=;
        b=mmwMqTwaKiBSHoqHr+QR+bNeaTAD9rVIoOahdU3qWQBG4N8WTkJ9u+g9TO9U7RlA5C
         GfVjsZYmet4mpYWVcgHiBY8kV7z058n5+Jj5UTrmdTnoE7pJuKkilaZv/J9DvaSbPN//
         GB418MMtrOYXOY9KY0fi88xIgHdhQ/TM6wI2PQjyI94/rV/cg1JxwqnpIepOT5N46zdt
         2PN+M3BtNQjapsYrZVSFQA6/U38kXtuMUtjNDx3aFrRMfY1/xKD5aDHzvddIDdkgn0Jp
         MXakTmB4A32Ih0mf+2EJnZDjoSlQ6wbtUtp8ga0Sxqdi+15xc/WVVq3rCHESuhZZ7XyG
         JABw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543992; x=1794148792; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0IOfsMD5SxMJd0XSmmsDbCH0cLOORr0623lhHBumwk=;
        b=QfpdjSyH04LF0Lb6LMUH/B6MOmHevIK9t2loLVnm9AWtGwUPM9PCnFadwhNDbn9nB+
         p2EXqI01klJZR+4iAO0j+q9rH9B7amzNmbLO6Newze11OgwqHCcmYvCw9mM9W7FYavRz
         Up0a5TxpGUsnx/PIMzhVZbZoEnPxWRW/pAzj14Jz7Jp+aExohCkbjsxKKljHv82d8vST
         caq5M3vEBV89tIwSX4n3I4Mo8zCWWSrFhy6T996vJ0iUjxhNpzU9gruspYH5AHIjWFLE
         /W8dcs4mBiFe+wdtezSo5LAq0sWQwkxB0TsIcMQu33xiEVJ90GHYkJzdpNUUe29QLeFl
         rmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543992; x=1794148792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d0IOfsMD5SxMJd0XSmmsDbCH0cLOORr0623lhHBumwk=;
        b=d0Xl4qS8/vhEXqtlQBoT6XO4Vc8fEmbKvNCpkcwTtAjSbXXt5MT+DVQAhMXikFtvMG
         fVEz1pwW641TQ0kHkDcS5vQo/utQjhYuXneKXw5+moryiokbKesOg82mFQIq2MvO732o
         tOlyL2/HujHKfIofp5LaulLJryRAfYKT/bfCm/YyroOr3t8SB4YO6wqWSpwZsSMh4qvd
         hXG8KokoDG4wjEegEnWpwmnBKbUVIU5wq5q6bZ2SEzZordjLPQO88y+43pcdk8Q1H2I7
         srqk/FjNNmmF/RfFQ+BiFbwOIr9mriRCnPeldlpXOLPHvDSC9u6wPwPlHJ/GVS+bNdz6
         wNHA==
X-Forwarded-Encrypted: i=1; AKwUvByB1pBTfUmvjaVMYS8zEgXhB93O37VZ7PLBvn4/2MjbHFFzPDygGwKRQheIkrHchHATj/swP43mNvh9UhB1jYODcA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+urUJ5BGoTjNVhKKXkGOO0CoplE+0hTTTzuNBkin/qCp8pF6mc
	4cgtFpGfzkkMJ6BOKmm5hM4ikufhXbwg3r3cSwvqJXZ5Em5xLBzCMLF3tiJ0h0p+s5XZ6ZXMiuq
	sT8mhgjgmh5WiMT0hu1jB5HTn40QWJPo=
X-Gm-Gg: AYBFou0PHI24jdyH8jBDlxTXxen8w+pHu0CMjJOQ1ZIoFVokVCU0+wO/YGB6JHurvNH
	7dVEclKIZas8BirQRfiImeeVoDMkE4yubtAB+kwZpJwfSNRGnmHeFWEWE1LxjJANOKnM81qBmEU
	U6qcqeQfe64pHUDbKt+mECRp9aeUiTu7BD2aEA3CPxlVbjOscn4wn+zXOkYm6RmrXjJ3dWWb8zZ
	EX45tFEEXH0agUJEIoAgsyNg3EHZ+9ZlHHpH2HpPdKZDqdscQOC0UsqjWJHyLkVNFOkKHXOLcfd
	DUKJVZqRzp/OM/N+49LTWOEo03vShdmGyfazmKc1Sv31E26/6iSDCjLavK252khmTk3pZNBLxIT
	Vgalr7a4+iQRla7uZZCFxb19NXW/ehXREeXBQf4xdKAYKuF3NBb73P9REOVy1679P0jO3oCbF32
	DF1m/otXGNUlJ5YagQI2aFKARsXWZR7d5mhrd5+73cz7445TZKg/Gbxxw=
X-Received: by 2002:a17:903:230b:b0:2ea:19bc:2fe2 with SMTP id
 d9443c01a7336-2eb36401db6mr76270145ad.10.1793543992364; Sun, 01 Nov 2026
 06:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20261030100214.3111726-1-roshs@qti.qualcomm.com>
 <CADkTA4NWzzaT11ssicpviaA3AgYtOPbpg_HGuciPSttkQUggdQ@mail.gmail.com>
 <CANNYZj-1kbfQpAGpPKaOd_mGqA8Ums_+NO_aFyYtO2fq+gUudA@mail.gmail.com>
 <CADkTA4NCoBwDCxZrgsfAUQP4=9JMbb9CeYVzFg+j7J61ZfsSQg@mail.gmail.com> <DS4PR02MB111905C17A50EC946A8E16B0F876B2@DS4PR02MB11190.namprd02.prod.outlook.com>
In-Reply-To: <DS4PR02MB111905C17A50EC946A8E16B0F876B2@DS4PR02MB11190.namprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 1 Nov 2026 09:39:40 -0500
X-Gm-Features: AclHuK87kdG9Eu8ih3s3Njrn-puZ8Zzrp2cQXpF0gJIf5SFKrZeGGsegwjyiQk8
Message-ID: <CADkTA4MafrzEFPLhda-XFcBBn--ziqWHUkCASvNMZS-Xv+Ze=Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-devsrc: add runtime dependency on sed
To: Roshan Sivakumar <roshs@qti.qualcomm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Sumanth Gavini <sumanth.gavini@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000008dd332065f3800e0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 14:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249155

--0000000000008dd332065f3800e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 8:10=E2=80=AFAM Roshan Sivakumar <roshs@qti.qualcomm=
.com>
wrote:

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
And only for rpm as the package manager ? The reason I ask, is that while
it isn't a primary
mode for the -devsrc package, I know people have been putting it into SDKs
in the past.



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
yes.

Bruce



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

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000008dd332065f3800e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 1, 2026 at 8:10=
=E2=80=AFAM Roshan Sivakumar &lt;<a href=3D"mailto:roshs@qti.qualcomm.com">=
roshs@qti.qualcomm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div class=3D"msg1055014046367821379">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Hi Bruce,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Giving more context on what inspired this patch.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
When I try to generate sdk including kernel-devsrc in it by running the pop=
ulate_sdk task, I got an error saying</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
&quot;Nothing provides sed .. &quot;=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br></div></div></div></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">And only for rpm as the=C2=A0package man=
ager ? The reason I ask, is that while it isn&#39;t a primary</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">mode for the -devsrc package=
, I know people have been putting it into SDKs in the past.</div><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div cla=
ss=3D"msg1055014046367821379"><div dir=3D"ltr"><div style=3D"font-family:Ap=
tos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;fon=
t-size:11pt;color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
I found out that rpm generates this dependency by scanning the shebang line=
 in the mksysmap script.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
TOOLCHAIN_TARGET_TASK +=3D &quot;kernel-devsrc&quot;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
This is how kernel-devsrc is added to be included in the sdk.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Are you suggesting that we remove mksysmap script completely from the kerne=
l-devsrc package?</div>
<div id=3D"m_1055014046367821379Signature">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br></div></div></div></div></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">yes.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div class=3D"msg1055014046367821379"><di=
v dir=3D"ltr"><div id=3D"m_1055014046367821379Signature"><div style=3D"font=
-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans=
-serif;font-size:11pt;color:rgb(0,0,0)">
</div>
<p style=3D"margin:0in;font-family:Calibri,sans-serif;font-size:11pt">
Thanks,</p>
<p style=3D"margin:0in;font-family:Calibri,sans-serif;font-size:11pt">
Roshan.</p>
<p style=3D"margin:0in;font-family:Calibri,sans-serif;font-size:11pt">
=C2=A0</p>
</div>
<div id=3D"m_1055014046367821379appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_1055014046367821379divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> =
Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_b=
lank">bruce.ashfield@gmail.com</a>&gt;<br>
<b>Sent:</b> Friday, October 30, 2026 07:44<br>
<b>To:</b> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<b>Cc:</b> Roshan Sivakumar &lt;<a href=3D"mailto:roshs@qti.qualcomm.com" t=
arget=3D"_blank">roshs@qti.qualcomm.com</a>&gt;; <a href=3D"mailto:openembe=
dded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists=
.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists.openemb=
edded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&g=
t;; Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" t=
arget=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;; Sumanth Gavini &lt;<a=
 href=3D"mailto:sumanth.gavini@windriver.com" target=3D"_blank">sumanth.gav=
ini@windriver.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH] kernel-devsrc: add runtime dependency =
on sed</font>
<div>=C2=A0</div>
</div>
<div>
<p style=3D"text-align:center"><span style=3D"background-color:rgb(255,255,=
0);font-size:14px;font-family:sans-serif;color:rgb(0,0,0)"><strong>WARNING:=
</strong> This email originated from outside of Qualcomm. Please be wary of=
 any links or attachments, and do not enable
 macros.</span></p>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"font-size:small"><br>
</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Fri, Oct 30, 2026 at 9:24=E2=80=AFAM Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div dir=3D"ltr">
<div dir=3D"ltr">On Fri, 30 Oct 2026 at 13:56, Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt; wrote:</div>
<div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div dir=3D"ltr">
<div>
<div>
<div style=3D"font-size:small">I say &quot;probably&quot; above, because yo=
u aren&#39;t saying what you are</div>
<div style=3D"font-size:small">building that triggered that script to be ca=
lled at all. From a quick</div>
<div style=3D"font-size:small">grep of the kernel it is only linking vmlinu=
x that uses that.=C2=A0</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">Are you rebuilding the kernel completely fro=
m -devsrc ?=C2=A0(which=C2=A0</div>
<div style=3D"font-size:small">shouldn&#39;t work)=C2=A0 Or doing something=
 else that is triggering it to be</div>
<div style=3D"font-size:small">called ?</div>
</div>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>From a different thread, I do not think this script is actually called=
 or used. Rather there was an interaction with rpm packaging that revealed =
the missing sed dependency in the package, caused by this script. Rpm tries=
 to be clever when processing binaries
 it&#39;s asked to package up, and sometimes that gets in the way (but othe=
r times reveals useful info about missing dependencies).</div>
<div><br>
</div>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>
<div style=3D"font-size:small">Aha.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">So in that case (assuming we prove it), we s=
hould drop the specific script (and keep a header around as clean: normally=
 looks for some of these) versus just adding the runtime dependency for som=
ething that
 isn&#39;t used at ... runtime.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">note: My comment is for=C2=A0Roshan, not Ale=
x!</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">Bruce</div>
<br>
</div>
<div>=C2=A0</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<div dir=3D"ltr">
<div>
<div></div>
<div>Alex=C2=A0</div>
</div>
</div>
</blockquote>
</div>
<div><br clear=3D"all">
</div>
<div><br>
</div>
<span>-- </span><br>
<div dir=3D"ltr">- Thou shalt not follow the NULL pointer, for chaos and ma=
dness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--0000000000008dd332065f3800e0--
