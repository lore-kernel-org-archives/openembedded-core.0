Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13353.1793371491679015331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 07:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UL1AfnUX;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e60f9af6e6so7560685ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793371491; cv=none;
        d=google.com; s=arc-20260327;
        b=ajxdC05wwAd7p9HenowHl/CkMY5mWSuztLBWxN31OpONsRKYVCzQ1PoaXYRpukjgSU
         hgJnTX/9/m1jVKUIIpEnq/20TDS43YWhR8TM0ZNYfe+MHz+H8FekZeDLoy3wBkikLGrq
         S0npVQa69Uo8VnOr0fxdAryscavgIESBjYb1lUp83OOu9FhtzKMl0XiJNGJ8m9qOM+qC
         VyoijLAsgg3zPSu6gGRTo1yxXbvQQfquLbmR4pTlgxx9AcN8cpLmKeUBN/BeI1s7cQQh
         5ObOSQQgOWjyT/pu10WNPqtCzGmNLd86nN09jl8rUn6JbqXHS8l1tVt2w8+SsRPRmZa0
         o94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vn2Fd9QYFH8QRMipQ0zLx4zZ2ROozgLjI4aMeRcr7Ws=;
        fh=4cfF+7jMEMDADlQFQLUog/AQ/iDzJ8np+cNzhU937QE=;
        b=PXIorxqBR82t3RIPbqcsfH1d6dZ0fwMHiAtwOl8flrVE75L6RbT2JBC5xJ8YX1yue6
         G4/12CLasZNEjyGErzlPyZnitiSRih9RTVxD4A9h950/foxrYWYmu/CV5qWGnsBQffb0
         QHx7e0BEz0MAZdP0ls+vVcAscB+C/MWZxxXFBMDAHCoAlUcUGcAyH4o/2GhFm+FaFuD2
         8NaaHvec9Wr1QWUYB2qrRN1XFvhZe9+Fw486vGWUPEJxFIj2qgwA6zBmcejN5WxIksAU
         VAhhv03DAvHxxuKikG0kKZa1xgzdwPRfiD7MD/DjNgSpaI1Mf/2ApaG5ZsU67oYdHPRR
         KQBA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371491; x=1793976291; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vn2Fd9QYFH8QRMipQ0zLx4zZ2ROozgLjI4aMeRcr7Ws=;
        b=UL1AfnUXs3YXBFsNhpnOSC9m0FSLfyYq+X0etZJmvA7Mhlh59WgHVAwI0vP/aZK46+
         gFAGN+UXrj2aSDie4hdSN6WhEdCGf76ORpcVCqG8ebVQF5/riefTJO7UHS8O7qNeli4u
         02lfYVvOyydNL2YNdyN4Sk7jkyXYJsIw/beUEZ8T3zbi3IOBzgfCEUa+8ZdDqUA9DQId
         k65Cs0Fdr/VEyY0j1x3tD5R3WFFP2bTH6kYecbtAzhZ0KIgv0p/RbLiTNh+JbXuy9h3k
         dIP9QohP7zNueOssoESLzacPy54/BidRFe+rYFcuyazzO/hI0QjAYGRwuAvr8bnaAFMr
         j0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371491; x=1793976291;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vn2Fd9QYFH8QRMipQ0zLx4zZ2ROozgLjI4aMeRcr7Ws=;
        b=M4G4qllckofSDh0dMj8KjpRBoghJHxH6plvGmTc3l8wvnutoGTrRAfUbbrZYUtJ9RK
         jF2y7kvOaBbSMOzHrUtVV6KYdd+zF181T/O0rFdByfIrXIrTTzviCzUHtjvz+C/zIqtU
         WmpElofLf2gkosY79nvmskdlC0hZ2uBpCQ4Slvjkdsn34vQmvxfbJUw/cDY2etpEYwQt
         7dxBFsxe3zm01k3RGWi0caKsl1lsqQnMUc/PiT+hurrCuqkm+SKJ6VCVffYibmx1E85D
         ckKyUFySC/h3nnP80vCb01Qe9ybOIYzLUNHGbx5P6DFo3oYus2PWSR/hhbQ0kh9PmRa/
         wqyA==
X-Forwarded-Encrypted: i=1; AKwUvBwB/h+gFrJfR8AJkKqr1sW6D7+11BlC646y3RIhmy/q7ukFqmLfTcEhekBJhJzTMacDi2Z33lEjpuxdP/DP9eijzw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJcegdPOKQvZeheuq35mbizZtHSGNCNm4KmJHFAcydiUcoznD2Q
	QDyHVZwdr2lQcZ8MDYmN3pY6vkV0ZlKU2rOYFLFrsjz03BNVRARtPiKtnocUT5P5w0dU/3zHe4b
	ZS2yQmpRkHBFvvTIJ++fkqVknjctcnko=
X-Gm-Gg: AYBFou0S+ReBnEnYyFTXKpX5wLjluU2mpSCqJIH+ADLeAC4JO4ldPpq8RNSkuGQIxgU
	NeBZj5nyj1XJXcpiQBiWh1gRUVxNVdHgac99bt28PAs3ubKtU4dsNSlmkEkkz45MPQIzCkissPD
	DSTO7uRsbftNc14Ojgn3mR4pi2BO5TmMQgJJz92QvMhZ2LBR+4YmXfUA6zB8bnFgwQFXNYkm0ye
	ekQ71kPG+VsoWEqePargIGvtguAuCH+3vKtLCsLDKoNMoUaum+EOd4/51zQJP4mozyP6EacIxk1
	aaylLtd0cnKaLEAn59/SatleMgpqm6Xw2lpH5nKJ7uMCCOulmkDuZyngQJATzGJ+hNcppeYT+K3
	VIpKKPN9qjnTyw4Hbzehz0eb5sB1w2Z1YDn3+9uF8HqGUSJ9+280X1xIAChHWZ9r7USRKurmTbN
	TxvIEOBSYpBq6DAYtU3lY74ztsymZ+ctmbkBXS7g69wkARJRY2+pJnXRw=
X-Received: by 2002:a17:902:ec81:b0:2e9:64b9:a332 with SMTP id
 d9443c01a7336-2eb36493e9cmr28571655ad.15.1793371490832; Fri, 30 Oct 2026
 07:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20261030100214.3111726-1-roshs@qti.qualcomm.com>
 <CADkTA4NWzzaT11ssicpviaA3AgYtOPbpg_HGuciPSttkQUggdQ@mail.gmail.com> <CANNYZj-1kbfQpAGpPKaOd_mGqA8Ums_+NO_aFyYtO2fq+gUudA@mail.gmail.com>
In-Reply-To: <CANNYZj-1kbfQpAGpPKaOd_mGqA8Ums_+NO_aFyYtO2fq+gUudA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Oct 2026 10:44:38 -0400
X-Gm-Features: AclHuK_1UyDzza8ZU9dNSu8fl0ftlHFKQYeJkMAU9MzfTJuuEImhsPZkcjHsLF0
Message-ID: <CADkTA4NCoBwDCxZrgsfAUQP4=9JMbb9CeYVzFg+j7J61ZfsSQg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-devsrc: add runtime dependency on sed
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: roshs@qti.qualcomm.com, openembedded-core@lists.openembedded.org, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Sumanth Gavini <sumanth.gavini@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000a95823065f0fd67b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249049

--000000000000a95823065f0fd67b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 9:24=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Fri, 30 Oct 2026 at 13:56, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>> I say "probably" above, because you aren't saying what you are
>> building that triggered that script to be called at all. From a quick
>> grep of the kernel it is only linking vmlinux that uses that.
>>
>> Are you rebuilding the kernel completely from -devsrc ? (which
>> shouldn't work)  Or doing something else that is triggering it to be
>> called ?
>>
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
Aha.

So in that case (assuming we prove it), we should drop the specific script
(and keep a header around as clean: normally looks for some of these)
versus just adding the runtime dependency for something that isn't used at
... runtime.

note: My comment is for Roshan, not Alex!

Bruce



> Alex
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a95823065f0fd67b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2026 at 9:24=
=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Fri, 30 Oct 202=
6 at 13:56, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:</div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"font-size:small">I s=
ay &quot;probably&quot; above, because you aren&#39;t saying what you are</=
div><div style=3D"font-size:small">building that triggered that script to b=
e called at all. From a quick</div><div style=3D"font-size:small">grep of t=
he kernel it is only linking vmlinux that uses that.=C2=A0</div><div style=
=3D"font-size:small"><br></div><div style=3D"font-size:small">Are you rebui=
lding the kernel completely from -devsrc ?=C2=A0(which=C2=A0</div><div styl=
e=3D"font-size:small">shouldn&#39;t work)=C2=A0 Or doing something else tha=
t is triggering it to be</div><div style=3D"font-size:small">called ?</div>=
</div></div></div></blockquote><div><br></div><div>From a different thread,=
 I do not think this script is actually called or used. Rather there was an=
 interaction with rpm packaging that revealed the missing sed dependency in=
 the package, caused by this script. Rpm tries to be clever when processing=
 binaries it&#39;s asked to package up, and sometimes that gets in the way =
(but other times reveals useful info about missing dependencies).</div><div=
><br></div></div></div></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">Aha.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">So in that case (assuming we prove it), we should drop the =
specific script (and keep a header around as clean: normally looks for some=
 of these) versus just adding the runtime dependency for something that isn=
&#39;t used at ... runtime.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">note: My comment is for=C2=A0Roshan, not Alex!</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_=
quote"><div></div><div>Alex=C2=A0</div></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000a95823065f0fd67b--
