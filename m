Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5600C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 18:09:48 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.45454.1741630182123729451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 11:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b6bx3Srh;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso7712478a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 11:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741630181; x=1742234981; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NxGLmhrTBSqoWpwbwO/Wb0cNhTNzY70K/o1NSiPaoVI=;
        b=b6bx3SrhFNrS9vmjbXi4U5g9itEjPuta4EzJ6jAG8B9Irr7oJOsgGBpTk8AGJnpkNx
         A3xWTkLEp7iWYRO9tCOP/QrypAm5uP4LWQKLG1R4MaSxNB1RZC5Gw2RsrC42/MGcSYzy
         coIEZT6wblJeRalB+kqr/FnG1fPM2UmrpDkcMVPXzcggiJe5mgL4IOCY9eFHnkoVGdav
         j8zGkDMyMlCqE79aoIRQlI/O2HeDaawO8yTM1pXRvDek8MWbYZZ7Q5GPuxrAJzMLahM8
         3Y+i+JVQ8Uv7cICzotjZ5WaG9/sPbG/wZPXz8OSJbHF6BRnSlZolIsEwhKmc0/DO8d6L
         Ojmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741630181; x=1742234981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxGLmhrTBSqoWpwbwO/Wb0cNhTNzY70K/o1NSiPaoVI=;
        b=KDWF1iuhOR3JMe408Z4Mui464UutmxPCVYQv20nHtQm6DknFw0zczXZFYKKM5BMO7p
         i28xKoo22RnoXj1ZPuPUDNF8Rj8yoDD5Qa8MpTg83vGYtDJjyQMbK+2ocx8ES3wqJ2hI
         jIc79CavwmahNW+lqvhs/rqNIhLrTTp806C8pRbEGtOwZCW8Oa4w4fumRlsWxBqZ8Df1
         ncg7A/6e/EKRjcpK561Me4T3B4wmPZGOUYXnhDrVwmMzyiSlKw0KhbiIsdZCbyV3tXA9
         +DWSUwM0COfc/0zoukLgs9vHKs9pGyKgX0Xqi7m++izVosdAg95vED7okGLQWZ9Dpc83
         I+lg==
X-Gm-Message-State: AOJu0Yy6w8JWV1cTKSVt464+Idss/XgSSTlP+4G9wrRQcDXPsheVuNdE
	jUFkSFKXuacL8xf+zSSFT3bo7/A2W2XHgPQVwWZiIXnXOXF3w1IpCGm/Kxwo+FfGDIkZWNkRL2r
	05sS+dy6GfnLMvR0FPof8ELW8t7s=
X-Gm-Gg: ASbGncuCOnOHFegVvVrhy30rysK9drBYb8zM5FrlxWEP8iIKGhVngE2wIpcb42t23Kh
	CUPy/mP3L3G7Fdxqz35uy95B9g9mCGSryqKcuTQDx4OXzVZ4B/RvPqixb2rMJtfG7U5f7a/1TJX
	clDedtngx5HL1Yjk+DzLDb/jxrnA==
X-Google-Smtp-Source: AGHT+IEbeKtR2xTitn6ILO8M/srxhe8DemfK6CibqhXHmlxU2WT6oMBgI0wkTYNnjSY9aG/4/uU3t8IHvvxuyarU4lk=
X-Received: by 2002:a17:90b:1d46:b0:2fa:2133:bc87 with SMTP id
 98e67ed59e1d1-3010051f268mr576046a91.6.1741630181298; Mon, 10 Mar 2025
 11:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250306-qa_kernel-v1-1-e83431c29799@syslinbit.com>
 <CADkTA4ObLCgE_Ra9QoxYSJXYE-Wb8L3VVZ8B9j3jv9=XszxKug@mail.gmail.com>
 <6209fffe-ae60-4379-b991-9ac6c1bafde3@syslinbit.com> <CADkTA4PkHWUKZ-WTzOZP4vmTtsyMSay9AZAb9nERRckJ3maA2w@mail.gmail.com>
 <7c042bcf-368e-48eb-a579-3f17f868a544@syslinbit.com>
In-Reply-To: <7c042bcf-368e-48eb-a579-3f17f868a544@syslinbit.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Mar 2025 14:09:30 -0400
X-Gm-Features: AQ5f1JoCTAPRRtEUlQsQzzlH_dMpxxMU3DdI776G2pDhBtvAUrpLocM5Npxks54
Message-ID: <CADkTA4OosMPRK5+TSDp4zqiJBCZMM-PJKm69AF4Trz1PYRj6Tg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/kernel: add QA to check required or
 forbidden kernel configs
To: Louis Rannou <louis.rannou@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org, pascal.eberhard@se.com, 
	Louis Rannou <louis.rannou@non.se.com>
Content-Type: multipart/alternative; boundary="000000000000495b73063000e0fb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 18:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212533

--000000000000495b73063000e0fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 12:38=E2=80=AFPM Louis Rannou <louis.rannou@syslinb=
it.com>
wrote:

>
>
> On 07/03/2025 14:54, Bruce Ashfield wrote:
> >
> >
> > On Fri, Mar 7, 2025 at 2:45=E2=80=AFAM Louis Rannou <louis.rannou@sysli=
nbit.com
> > <mailto:louis.rannou@syslinbit.com>> wrote:
> >
> >
> >
> >     On 06/03/2025 16:36, Bruce Ashfield wrote:
> >      >
> >      >
> >      > On Thu, Mar 6, 2025 at 10:04=E2=80=AFAM Louis Rannou via
> >     lists.openembedded.org <http://lists.openembedded.org>
> >      > <http://lists.openembedded.org <http://lists.openembedded.org>>
> >      > <louis.rannou=3Dsyslinbit.com@lists.openembedded.org
> >     <mailto:syslinbit.com@lists.openembedded.org>
> >      > <mailto:syslinbit.com@lists.openembedded.org
> >     <mailto:syslinbit.com@lists.openembedded.org>>> wrote:
> >      >
> >      >     From: Louis Rannou <louis.rannou@non.se.com
> >     <mailto:louis.rannou@non.se.com>
> >      >     <mailto:louis.rannou@non.se.com
> >     <mailto:louis.rannou@non.se.com>>>
> >      >
> >      >     Add a QARECIPETEST kernel-config to the kernel to check the
> >     kernel
> >      >     config has
> >      >     set (or unset) config listed in variables
> >     QA_KERNEL_CONFIGS_REQUIRED (or
> >      >     QA_KERNEL_CONFIGS_FORBIDDEN).
> >      >
> >      >
> >      > We already have audit tools that can do this, the approach of
> opening
> >      > the .config, iterating and then hard binding ourselves to the
> >     very specific
> >      > kernel configuration names has been considered and rejected many
> >      > times.
> >      >
> >      > What exactly isn't working with the already supported mechanism =
?
> >
> >     My ignorance I suppose. I didn't know about the audit phase and
> >     kernel-cache. I guess I have to read the doc...
> >
> >
> > If it doesn't work for your use case, or is otherwise causing issues, l=
et
> > me know and I'll make changes as required.
>
> Thanks, the main issue for us is that it does not handle in-tree kernel
> configs such as hardening.config
>
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree=
/kernel/configs/hardening.config
>
>
In which sense ? The meta-data handling can now apply them (I did a change
about
three months ago to support it).

For them to be part of the audit, you then either need to increase the
verbosity level
of the audit or promote them to "hardware" or "required" configuration
values.

If you have a public layer showing an issue, I'll definitely have a look.

Bruce



> Louis
>
> >
> > I've taken a note to pull together a short presentation on this, as mor=
e
> > documentation/examples can only be a good thing.
> >
> > Cheers,
> >
> > Bruce
> >
> >
> >     Louis
> >
> >      >
> >      > Bruce
> >      >
> >      >     Signed-off-by: Louis Rannou <louis.rannou@non.se.com
> >     <mailto:louis.rannou@non.se.com>
> >      >     <mailto:louis.rannou@non.se.com
> >     <mailto:louis.rannou@non.se.com>>>
> >      >     ---
> >      >       meta/classes-recipe/kernel.bbclass | 38 ++++++++++++++++++=
+
> >     +++++++
> >      >     ++++++++++++
> >      >       1 file changed, 38 insertions(+)
> >      >
> >      >     diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-
> >      >     recipe/kernel.bbclass
> >      >     index
> >      >
> >
>  64a685a964dab942db05b8d9e08cc22a3bbb152e..4a82b84d479667bf4a6e64ad3e99d9=
34c6868b98
> 100644
> >      >     --- a/meta/classes-recipe/kernel.bbclass
> >      >     +++ b/meta/classes-recipe/kernel.bbclass
> >      >     @@ -867,3 +867,41 @@ EXPORT_FUNCTIONS do_deploy
> >      >
> >      >       # Add using Device Tree support
> >      >       inherit kernel-devicetree
> >      >     +
> >      >     +
> >      >     +# Add QA test to check some required/forbidden kernel
> >     configs are
> >      >     set or not.
> >      >     +QA_KERNEL_CONFIGS_REQUIRED ??=3D ""
> >      >     +QA_KERNEL_CONFIGS_FORBIDDEN ??=3D ""
> >      >     +
> >      >     +WARN_QA:append =3D " kernel-config"
> >      >     +
> >      >     +QARECIPETEST[kernel-config] =3D
> "package_qa_check_kernel_config"
> >      >     +def package_qa_check_kernel_config(pn, d):
> >      >     +    from pathlib import Path
> >      >     +    import re
> >      >     +
> >      >     +    config_path =3D Path(d.getVar("B"), ".config")
> >      >     +    if not config_path.exists():
> >      >     +        oe.qa.handle_error("kernel-config",
> >      >     +                           "Kernel configs have not been
> >     checked "\
> >      >     +                           "as the kernel .config is not
> >     found: "\
> >      >     +                           "%s." % config_path)
> >      >     +        return
> >      >     +
> >      >     +    config_list =3D {}
> >      >     +    with config_path.open('r') as f_config:
> >      >     +        for line in f_config.read().splitlines():
> >      >     +            configset =3D re.match(r'# (\w+) is not set|
> >      >     (\w+)=3D([ymn])', line)
> >      >     +            if configset is not None:
> >      >     +                if configset.group(1) is not None:
> >      >     +                    config_list[configset.group(1)] =3D "n"
> >      >     +                else:
> >      >     +                    config_list[configset.group(2)] =3D
> >      >     configset.group(3)
> >      >     +
> >      >     +    for conf in
> d.getVar("QA_KERNEL_CONFIGS_REQUIRED").split():
> >      >     +        if conf not in config_list or config_list[conf] =3D=
=3D
> "n":
> >      >     +            oe.qa.handle_error("kernel-config", "Kernel
> >     config is
> >      >     required: %s" % conf, d)
> >      >     +
> >      >     +    for conf in
> d.getVar("QA_KERNEL_CONFIGS_FORBIDDEN").split():
> >      >     +        if conf in config_list and config_list[conf] in "ym=
":
> >      >     +            oe.qa.handle_error("kernel-config", "Kernel
> >     config is
> >      >     forbidden: %s" % conf, d)
> >      >
> >      >     ---
> >      >     base-commit: b72823fc09674f78ad452250f453f6e47d9444de
> >      >     change-id: 20250306-qa_kernel-061a37e316c4
> >      >
> >      >     Best regards,
> >      >     --
> >      >     Louis Rannou <louis.rannou@syslinbit.com
> >     <mailto:louis.rannou@syslinbit.com>
> >      >     <mailto:louis.rannou@syslinbit.com
> >     <mailto:louis.rannou@syslinbit.com>>>
> >      >
> >      >
> >      >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >      >     Links: You receive all messages sent to this group.
> >      >     View/Reply Online (#212394): https://lists.openembedded.org/
> >     g/ <https://lists.openembedded.org/g/>
> >      >     openembedded-core/message/212394 <https://
> >     lists.openembedded.org/g/ <https://lists.openembedded.org/g/>
> >      >     openembedded-core/message/212394>
> >      >     Mute This Topic: https://lists.openembedded.org/
> >     mt/111549046/1050810 <https://lists.openembedded.org/
> >     mt/111549046/1050810>
> >      >     <https://lists.openembedded.org/mt/111549046/1050810
> >     <https://lists.openembedded.org/mt/111549046/1050810>>
> >      >     Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >      >     <mailto:openembedded-core%2Bowner@lists.openembedded.org
> >     <mailto:openembedded-core%252Bowner@lists.openembedded.org>>
> >      >     Unsubscribe: https://lists.openembedded.org/g/openembedded-
> >     core/ <https://lists.openembedded.org/g/openembedded-core/>
> >      >     unsub <https://lists.openembedded.org/g/openembedded-core/
> >     unsub <https://lists.openembedded.org/g/openembedded-core/unsub>>
> >      >     [bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>
> >     <mailto:bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>>=
]
> >      >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >      >
> >      >
> >      >
> >      > --
> >      > - Thou shalt not follow the NULL pointer, for chaos and madness
> >     await
> >      > thee at its end
> >      > - "Use the force Harry" - Gandalf, Star Trek II
> >      >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000495b73063000e0fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 10, 2025 at 12:38=
=E2=80=AFPM Louis Rannou &lt;<a href=3D"mailto:louis.rannou@syslinbit.com">=
louis.rannou@syslinbit.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
<br>
On 07/03/2025 14:54, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Mar 7, 2025 at 2:45=E2=80=AFAM Louis Rannou &lt;<a href=3D"mai=
lto:louis.rannou@syslinbit.com" target=3D"_blank">louis.rannou@syslinbit.co=
m</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:louis.rannou@syslinbit.com" target=3D"_bl=
ank">louis.rannou@syslinbit.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 06/03/2025 16:36, Bruce Ashfield wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Thu, Mar 6, 2025 at 10:04=E2=80=AFAM Louis=
 Rannou via<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org" rel=3D"no=
referrer" target=3D"_blank">lists.openembedded.org</a> &lt;<a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">http://lists=
.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;<a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org</a> &lt=
;<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bl=
ank">http://lists.openembedded.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;louis.rannou=3D<a href=3D"mailto:syslinbi=
t.com@lists.openembedded.org" target=3D"_blank">syslinbit.com@lists.openemb=
edded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:syslinbit.com@lists.op=
enembedded.org" target=3D"_blank">syslinbit.com@lists.openembedded.org</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:syslinbit.com@li=
sts.openembedded.org" target=3D"_blank">syslinbit.com@lists.openembedded.or=
g</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:syslinbit.com@lists.op=
enembedded.org" target=3D"_blank">syslinbit.com@lists.openembedded.org</a>&=
gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0From: Louis Rannou &lt;<a =
href=3D"mailto:louis.rannou@non.se.com" target=3D"_blank">louis.rannou@non.=
se.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:louis.rannou@non.se.co=
m" target=3D"_blank">louis.rannou@non.se.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:louis.rannou@non.se.com" target=3D"_blank">louis.rannou@non.se.com</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:louis.rannou@non.se.co=
m" target=3D"_blank">louis.rannou@non.se.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Add a QARECIPETEST kernel-=
config to the kernel to check the<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0config has<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0set (or unset) config list=
ed in variables<br>
&gt;=C2=A0 =C2=A0 =C2=A0QA_KERNEL_CONFIGS_REQUIRED (or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0QA_KERNEL_CONFIGS_FORBIDDE=
N).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; We already have audit tools that can do this,=
 the approach of opening<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the .config, iterating and then hard binding =
ourselves to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0very specific<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; kernel configuration names has been considere=
d and rejected many<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; times.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; What exactly isn&#39;t working with the alrea=
dy supported mechanism ?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0My ignorance I suppose. I didn&#39;t know about the=
 audit phase and<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel-cache. I guess I have to read the doc...<br>
&gt; <br>
&gt; <br>
&gt; If it doesn&#39;t work for your use case, or is otherwise causing issu=
es, let<br>
&gt; me know and I&#39;ll make changes as required.<br>
<br>
Thanks, the main issue for us is that it does not handle in-tree kernel <br=
>
configs such as hardening.config<br>
<br>
<a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux=
.git/tree/kernel/configs/hardening.config" rel=3D"noreferrer" target=3D"_bl=
ank">https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/t=
ree/kernel/configs/hardening.config</a><br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">In which sense ? The meta-data handling can now apply them=
 (I did a change about</div><div class=3D"gmail_default" style=3D"font-size=
:small">three months ago to support it).=C2=A0</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">For them to be part of the audit, you then either nee=
d to increase the verbosity level</div><div class=3D"gmail_default" style=
=3D"font-size:small">of the audit or promote them to &quot;hardware&quot; o=
r &quot;required&quot; configuration values.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">If you have a public layer showing an issue, I&#39;ll =
definitely have a look.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">B=
ruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
Louis<br>
<br>
&gt; <br>
&gt; I&#39;ve taken a note to pull together a short presentation on this, a=
s more<br>
&gt; documentation/examples can only be a good thing.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Louis<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Bruce<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Louis Ranno=
u &lt;<a href=3D"mailto:louis.rannou@non.se.com" target=3D"_blank">louis.ra=
nnou@non.se.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:louis.rannou@non.se.co=
m" target=3D"_blank">louis.rannou@non.se.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:louis.rannou@non.se.com" target=3D"_blank">louis.rannou@non.se.com</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:louis.rannou@non.se.co=
m" target=3D"_blank">louis.rannou@non.se.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes-recipe=
/kernel.bbclass | 38 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 38 =
insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes-=
recipe/kernel.bbclass b/meta/classes-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0recipe/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0index<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A064a685a964dab942db05b8d9e08cc22a3bbb152e..4a=
82b84d479667bf4a6e64ad3e99d934c6868b98 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes-recipe/=
kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes-recipe/=
kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0@@ -867,3 +867,41 @@ EXPOR=
T_FUNCTIONS do_deploy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Add using Device =
Tree support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inherit kernel-devi=
cetree<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+# Add QA test to check so=
me required/forbidden kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0configs are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0set or not.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+QA_KERNEL_CONFIGS_REQUIRE=
D ??=3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+QA_KERNEL_CONFIGS_FORBIDD=
EN ??=3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+WARN_QA:append =3D &quot;=
 kernel-config&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+QARECIPETEST[kernel-confi=
g] =3D &quot;package_qa_check_kernel_config&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+def package_qa_check_kern=
el_config(pn, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 from pathli=
b import Path<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 import re<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 config_path=
 =3D Path(d.getVar(&quot;B&quot;), &quot;.config&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if not conf=
ig_path.exists():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 oe.qa.handle_error(&quot;kernel-config&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;Kernel configs have not been<br>
&gt;=C2=A0 =C2=A0 =C2=A0checked &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;as the kernel .config is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0found: &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;%s.&quot; % config_path)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 config_list=
 =3D {}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 with config=
_path.open(&#39;r&#39;) as f_config:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for line in f_config.read().splitlines():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 configset =3D re.match(r&#39;# (\w+) is not set|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0(\w+)=3D([ymn])&#39;, line=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if configset is not None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if configset.group(1) is not None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config_list[configset.group(1=
)] =3D &quot;n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config_list[configset.group(2=
)] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0configset.group(3)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 for conf in=
 d.getVar(&quot;QA_KERNEL_CONFIGS_REQUIRED&quot;).split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if conf not in config_list or config_list[conf] =3D=3D &quot;n&quot;:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&quot;kernel-config&quot;, &quot;Kerne=
l<br>
&gt;=C2=A0 =C2=A0 =C2=A0config is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0required: %s&quot; % conf,=
 d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 for conf in=
 d.getVar(&quot;QA_KERNEL_CONFIGS_FORBIDDEN&quot;).split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if conf in config_list and config_list[conf] in &quot;ym&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&quot;kernel-config&quot;, &quot;Kerne=
l<br>
&gt;=C2=A0 =C2=A0 =C2=A0config is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0forbidden: %s&quot; % conf=
, d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0base-commit: b72823fc09674=
f78ad452250f453f6e47d9444de<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0change-id: 20250306-qa_ker=
nel-061a37e316c4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Best regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Louis Rannou &lt;<a href=
=3D"mailto:louis.rannou@syslinbit.com" target=3D"_blank">louis.rannou@sysli=
nbit.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:louis.rannou@syslinbit=
.com" target=3D"_blank">louis.rannou@syslinbit.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:louis.rannou@syslinbit.com" target=3D"_blank">louis.rannou@syslinbit.com=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:louis.rannou@syslinbit=
.com" target=3D"_blank">louis.rannou@syslinbit.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all mes=
sages sent to this group.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#212394=
): <a href=3D"https://lists.openembedded.org/" rel=3D"noreferrer" target=3D=
"_blank">https://lists.openembedded.org/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0g/ &lt;<a href=3D"https://lists.openembedded.org/g/=
" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0openembedded-core/message/=
212394 &lt;https://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/g/" rel=3D=
"noreferrer" target=3D"_blank">lists.openembedded.org/g/</a> &lt;<a href=3D=
"https://lists.openembedded.org/g/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0openembedded-core/message/=
212394&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=
=3D"https://lists.openembedded.org/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0mt/111549046/1050810 &lt;<a href=3D"https://lists.o=
penembedded.org/" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0mt/111549046/1050810&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lis=
ts.openembedded.org/mt/111549046/1050810" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/mt/111549046/1050810</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/mt/11=
1549046/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/111549046/1050810</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"ma=
ilto:openembedded-core%2Bowner@lists.openembedded.org" target=3D"_blank">op=
enembedded-core+owner@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:openembedded-core%252Bowner@lists.openembedded.org" target=3D"_blank">op=
enembedded-core%2Bowner@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%2525=
2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-core%252Bown=
er@lists.openembedded.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe: <a href=3D"ht=
tps://lists.openembedded.org/g/openembedded-" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0core/ &lt;<a href=3D"https://lists.openembedded.org=
/g/openembedded-core/" rel=3D"noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0unsub &lt;<a href=3D"https=
://lists.openembedded.org/g/openembedded-core/" rel=3D"noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0unsub &lt;<a href=3D"https://lists.openembedded.org=
/g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/g/openembedded-core/unsub</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:bruce.a=
shfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a> &lt;mailt=
o:<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfi=
eld@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a> &lt;mailto:<a href=3D"ma=
ilto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</=
a>&gt;&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - Thou shalt not follow the NULL pointer, for=
 chaos and madness<br>
&gt;=C2=A0 =C2=A0 =C2=A0await<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; thee at its end<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - &quot;Use the force Harry&quot; - Gandalf, =
Star Trek II<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
<br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; <br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000495b73063000e0fb--

