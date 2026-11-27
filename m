Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15084.1795782330495252161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 04:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tld-robotics.com header.s=google header.b=GmYbsA/u;
 spf=pass (domain: easymile.com, ip: 209.85.218.50, mailfrom: antoine.lubineau@easymile.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5188e4980fso430097866b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 04:25:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795782329; cv=none;
        d=google.com; s=arc-20260327;
        b=InMpHMThPqMdttyEUH6nC1SVbgTeVxsNrLXi4Xgg8gM7KkeycQw8/tO/rgMBzJSOeF
         kRjhQdy18qXaKiaj7H9mT9FerfYgLDairiij50UfhgiAxs/rnQP+dyREvOVWxfJZ34aZ
         K4eV0XxFXc1pd8di3f5QjPFX8h6oRCX1VRLOeHQdHE7qYGc0Jl70bjMZQjdDliInoUte
         v5mWKrwmrMCNct/gswQVYAp6BZ1WN3vT0w8CgRy6LUdxRZbT0tap2x6vJ1eWEH65GDNP
         3D5UHWadtOjXACstQX8EX97B4Qo4KTi3MUCrpnGsudYVoAgAyztggTy9+NRcSdnVeqAn
         LHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+8TkJpijOkrgjq3hirS0Y9XfK51xB1QZjJp6hO0/3O4=;
        fh=ZwLzHH/ir84D0nJ2/V9eYgM3Q/pN/1bAZyQIMuOFGWk=;
        b=LcetH/LYzRGlwiCOd6pLd2XZb4scmnctN9u/RHm0oa4kJaV5RlKm6/mI628F3QbBCI
         z9kiXVvK0PeSFDHp9whwCqXRo22MAkntDpv6lsNwsWcbxqnbeNT0gkc8PN8osfAfx0nQ
         B90sgmTsGzp5yeI2VHoHNJSYe8kba86cAUjlT+21ur4zx6D41Xhw60vAlUtE2jMuUcJP
         MXmgBS0VNGIItgAfk1KIRyRUQW5uoec5FycWrMzehTNP7v4eRDrlHMKv+lGNcdq7n1v/
         eNAGvHskog9tEkWKMDz69a58SUCQAPybH4eaVrLTOUDmuAxS8FE/a/qLtaW7Y3RgjFVR
         474A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tld-robotics.com; s=google; t=1795782329; x=1796387129; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8TkJpijOkrgjq3hirS0Y9XfK51xB1QZjJp6hO0/3O4=;
        b=GmYbsA/u2sKldvXN2U5vMcxUlGXoKKBlKDrFrd5doh5NpVb41yMDAtpcDArVyCqgai
         kDSfVUVC9xo21CjTl4+sEEPNqFLFT/VVIYS7Z+/xmoBdNRKz84opbDybIm8pCDe1xP76
         qEe7EgKuL6rX3zdJYv/IOFMC6q1LLVxH7LKac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782329; x=1796387129;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+8TkJpijOkrgjq3hirS0Y9XfK51xB1QZjJp6hO0/3O4=;
        b=Fe54FAkitGH3soNvws4gp/w0JEi3Bzygi8y7Oi8rNaZBF0rBnhsRG44Gs/ZXSr1wdQ
         J2qrrzTBn3aWu+i5skYE6XETLBw4RqqE9hj4Off/xpGVaD88eNHYs8VcBvTIe0HJSCN5
         POV7e4kEop6/dG2ZdC29v5LZjBHitptCDdMePF6p7s10D+1QSJrBtNTM8vYwbl7IKxtQ
         ZZ6r1qH/HNIwCIYBtSOUcdJO8viSy8Ks8lOuXcM6eTvFKfxwXv6agcUvMgdd4tFglzqR
         twUkbrmcQCY7ONbP0twPwkNmdfmFHdxwBoZxBn6clfDVgjpGWnw7lswDTIsn/5u9/UCn
         LBEw==
X-Gm-Message-State: APuU4Z9e5WdqAr3IOBu+BvRNUeiv7J/y5nBogqdK3gRCKgeWmfx+XX60
	+UK/Y2yYgnrtYPlbjVA9rmlKpNwUyT9VcS4dYj+q3c8g9Ikfbl8UfY9C4j8tTytwHeNmlSWcrf0
	eEPUNmdW/NKkUamtBa5zFFuqO9s2Cvaf0BZ4dRAB+5aK064vBblm2UgTeDBbM8wOOBsuP8uZOoB
	L1Let/trz7vyscP1GlKDkD4OycjzEdQZPeb2B1voZ7xD6ohRtdtw==
X-Gm-Gg: AZFdTZcGoEu8HiqOzrYBe1nXyWJOFWR6YOrXLujyvXd4GD7KV3MbmFwtEvFrm+h5/Nb
	pyFZc73mIXJ8YGEh3evnT4UwgjRzz6zbY3TEtZT0sNn27JsgCaY6wwuH0G4BsW4T6IIguP3PEdq
	oIjFjkBhoK4eJxikhqYpp05RBeNgfrDml6VcOc0qEqO04glUFBXZDe5EjP8VlG77eXfOpyfCC9k
	r7Ldd+fwxfGY2CNg8u8rPohZNNbBCbGXF2F7d0SyFnscy6egqjE7QriQFrGp9I2FYXWqXT/Zg3X
	3NZ82hX9auvbw2No91MI4OA06I80ZdivM5rXkiqHPqzPZl+DoY8fF1qMdsp6vdKIZ4FcSAujNWB
	Ujhmtgdi6DZ2by2iXb/Yphyqq4RtmE+L3Ix8=
X-Received: by 2002:a17:906:cb8c:b0:c51:2497:c64a with SMTP id
 a640c23a62f3a-c513ab3463bmr1569866966b.48.1795782328254; Fri, 27 Nov 2026
 04:25:28 -0800 (PST)
MIME-Version: 1.0
References: <20261126-mfe-multi-cargo-lock-files-v3-1-7ee885214204@pengutronix.de>
In-Reply-To: <20261126-mfe-multi-cargo-lock-files-v3-1-7ee885214204@pengutronix.de>
Reply-To: antoine.lubineau@tld-robotics.com
From: Antoine Lubineau <antoine.lubineau@tld-robotics.com>
Date: Fri, 27 Nov 2026 13:25:16 +0100
X-Gm-Features: Aa3M54pJVCvqOVOI83xPDFAUZ4DxSKE8ki3oRrNClY9Qz_ePWkJ4p57VzSm-EeI
Message-ID: <CAMPh3wqn5VMvufgZyUC3+=yzm3b0n3aciiROqnTYGDcsg2wgxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] classes/cargo-update-recipe-crates: support
 multiple Cargo.lock search directories
To: m.felsch@pengutronix.de
Cc: openembedded-core@lists.openembedded.org, peter.kjellerstedt@axis.com, 
	yocto@pengutronix.de
Content-Type: multipart/alternative; boundary="000000000000c5183a0661412734"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 12:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251381

--000000000000c5183a0661412734
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 26 Nov 2026 at 09:37, Marco Felsch via openembedded-core <m.felsch=
=3D
pengutronix.de@lists.openembedded.org> wrote:

> ../..
> +    for cargo_lock_src_dir in d.getVar("CARGO_LOCK_SRC_DIR").split():
> +        for root, dirs, files in os.walk(cargo_lock_src_dir):
>

May I suggest adding 'dirs.sort()' here? The order of the lists is
dependent on the filesystem, so the operation may not be stable between
runs. That=E2=80=99s not a new issue when having multiple Cargo.lock files =
in the
same source tree but I never submitted the patch.

Regards,
Antoine

--=20


*This email and any attachment contains EasyMile=E2=80=99s confidential=20
information, and must not be modified or circulated without EasyMile=E2=80=
=99s=20
prior written consent. It is intended exclusively for their recipient.s. If=
=20
you received this message by mistake, please notify us promptly and=20
immediately delete this email and any of its attachments.*

*As data=20
controller, EasyMile processes personal data, in compliance with the=20
European GDPR (EU) 2016/679 of 27 April 2016. To exercise your rights, you=
=20
can contact EasyMile at=C2=A0privacy@easymile.com, and if necessary, you ma=
y=20
contact the local competent supervisory authority.=E2=80=9D*

*Cet e-mail et toute=20
pi=C3=A8ce jointe contiennent des informations confidentielles d'EasyMile e=
t ne=20
doivent pas =C3=AAtre modifi=C3=A9s ou diffus=C3=A9s sans le consentement =
=C3=A9crit pr=C3=A9alable=20
d'EasyMile. Ils sont destin=C3=A9s exclusivement =C3=A0 leur destinataire.s=
. Si vous=20
avez re=C3=A7u ce message par erreur, veuillez nous en informer rapidement =
et=20
supprimer imm=C3=A9diatement cet e-mail et toutes ses pi=C3=A8ces jointes.=
=C2=A0=C2=A0*

*En=20
tant que responsable de traitement, EasyMile traite des donn=C3=A9es=20
personnelles, conform=C3=A9ment au RGPD europ=C3=A9en (UE) 2016/679 du 27 a=
vril 2016.=20
Pour exercer vos droits, vous pouvez contacter EasyMile =C3=A0=C2=A0
privacy@easymile.com <mailto:privacy@easymile.com>, et si n=C3=A9cessaire, =
vous=20
pouvez contacter l'autorit=C3=A9 de contr=C3=B4le locale comp=C3=A9tente.*

--000000000000c5183a0661412734
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 26 Nov 2026 at 09:37, Mar=
co Felsch via openembedded-core &lt;m.felsch=3D<a href=3D"mailto:pengutroni=
x.de@lists.openembedded.org" target=3D"_blank">pengutronix.de@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">../..<br>
+=C2=A0 =C2=A0 for cargo_lock_src_dir in d.getVar(&quot;CARGO_LOCK_SRC_DIR&=
quot;).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for root, dirs, files in os.walk(cargo_lock_sr=
c_dir):<br></blockquote><div><br></div><div>May I suggest adding &#39;dirs.=
sort()&#39; here? The order of the lists is dependent on the filesystem, so=
 the operation may not be stable between runs. That=E2=80=99s not a new iss=
ue when having multiple Cargo.lock files in the same source tree but I neve=
r submitted the patch.</div><div><br></div><div>Regards,</div><div>Antoine<=
/div></div></div>
</div>

<br>
<p dir=3D"ltr"><span><span><i><span><span><span><span><span><span><span><sp=
an><span><font size=3D"1" color=3D"#808080">This email and any attachment c=
ontains EasyMile=E2=80=99s confidential information, and must not be modifi=
ed or circulated without EasyMile=E2=80=99s prior written consent. It is in=
tended exclusively for their recipient.s. If you received this message by m=
istake, please notify us promptly and immediately delete this email and any=
 of its attachments.</font></span></span></span></span></span></span></span=
></span></span></i></span></span></p><p dir=3D"ltr"><span><span><i><span><s=
pan><span><span><span><span><span><span><span><font size=3D"1" color=3D"#80=
8080"><span>As data controller, EasyMile processes personal data, in compli=
ance with the European GDPR (EU) 2016/679 of 27 April 2016. To exercise you=
r rights, you can contact EasyMile at</span><span>=C2=A0</span><a><span sty=
le=3D"text-decoration:underline">privacy@easymile.com</span></a><span>, and=
 if necessary, you may contact the local competent supervisory authority.=
=E2=80=9D</span></font></span></span></span></span></span></span></span></s=
pan></span></i></span></span></p><p dir=3D"ltr"><span><span><i><span><span>=
<span><span><span><span><span><span><span><font size=3D"1" color=3D"#808080=
">Cet e-mail et toute pi=C3=A8ce jointe contiennent des informations confid=
entielles d&#39;EasyMile et ne doivent pas =C3=AAtre modifi=C3=A9s ou diffu=
s=C3=A9s sans le consentement =C3=A9crit pr=C3=A9alable d&#39;EasyMile. Ils=
 sont destin=C3=A9s exclusivement =C3=A0 leur destinataire.s. Si vous avez =
re=C3=A7u ce message par erreur, veuillez nous en informer rapidement et su=
pprimer imm=C3=A9diatement cet e-mail et toutes ses pi=C3=A8ces jointes.=C2=
=A0=C2=A0</font></span></span></span></span></span></span></span></span></s=
pan></i></span></span></p><p dir=3D"ltr"><span><span><i><span><span><span><=
span><span><span><span><span><span><font size=3D"1" color=3D"#808080">En ta=
nt que responsable de traitement, EasyMile traite des donn=C3=A9es personne=
lles, conform=C3=A9ment au RGPD europ=C3=A9en (UE) 2016/679 du 27 avril 201=
6. Pour exercer vos droits, vous pouvez contacter EasyMile =C3=A0=C2=A0<a h=
ref=3D"mailto:privacy@easymile.com" target=3D"_blank">privacy@easymile.com<=
/a>, et si n=C3=A9cessaire, vous pouvez contacter l&#39;autorit=C3=A9 de co=
ntr=C3=B4le locale comp=C3=A9tente.</font></span></span></span></span></spa=
n></span></span></span></span></i></span></span></p><br>
--000000000000c5183a0661412734--
