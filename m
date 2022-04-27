Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41560C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 07:15:15 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.5322.1651043711377281169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 00:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mMCgt+tR;
 spf=pass (domain: gmail.com, ip: 209.85.166.51,
 mailfrom: rybczynska@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id e194so1782556iof.11;
        Wed, 27 Apr 2022 00:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o+Av3UmYe+uepSNCZCopxeVFfOAhHDiwCLMMN3+R17A=;
        b=mMCgt+tRaOKUsq7cXFm2zPo0uuLF/1crJmUPzu/qTBhYMSjnWO8EMYgqe8q7NzyHg/
         VLiYSnmSK92QSx7ruYh+I3JRlCQQy4j6UHF87Q7JieQr50nmYZ50teOuJq4rNkjav6OP
         4q4tq6kYeM/anuRKn4Mg7i8lOto5wqGNt4V0Y9PmkJR2qx6IpsLETwrK/6TAS/lJdzNN
         ldpgnRZY7jaUYGRwX1PtkZjOk2FOmT1bwqlT7nydImEj9DPhPDyyA1kZ0lLmJcVGpjPF
         f4dzedKqapbDJGjRl89V9x6cZu+Bw0VplXk8lT6BHK4T6sadVb6et6n8d2044EpzYp7M
         4c0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o+Av3UmYe+uepSNCZCopxeVFfOAhHDiwCLMMN3+R17A=;
        b=OzZMoickSApmgO3XXhBrI9y9rDcKEGLi8SXF3GOedVO4vJ+1wOPSvYYiB+vEEna6cN
         1l/6CP3VXKJkQFMfTjvVndSbJ2AmZO1yosmdlm1+YC02E00XHDKPp/PHhkD70ncbHB2+
         AhDAli6cBcQaMXJF2Q4tc8uaQKAK1hCh1Dziiw2gzbVLe4kPmK2G4Bdyk9+uFxeBDiTc
         Ojll7REzL9PwTb+fMpFh+QHzQbmqoxQ05QVCEX25o5RW8xWh9q594D5+MHlehuhevMg+
         7U3gJx6gYCBimb72S7rOu2US12s7hpPoDhOyMcUzThRO0YfZVeLYZiQCxYoY/I9fU2rD
         tJWg==
X-Gm-Message-State: AOAM533QJqk8cXBXjROjgCS1J5xmFNBZnUI/79vNwlhGjASR6ObejOA0
	WdRtPy3+U7qOI8eXD0l5rwzfKe+lHM2T2Xo2d7c=
X-Google-Smtp-Source: 
 ABdhPJxMk0WZLGvB6lkpI5BJZrFK1qkvklHAgjc8l/gR7LIOu1HkWSOzUHjNaCwls+krAdJvAV76rm++7qOWBH03shQ=
X-Received: by 2002:a02:cb03:0:b0:328:8369:9023 with SMTP id
 j3-20020a02cb03000000b0032883699023mr11949699jap.247.1651043710705; Wed, 27
 Apr 2022 00:15:10 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAApg2=Q9DOoYVHNSCR_=pEN-x7EQuRw2yhwqWhEG2zaMTONt8w@mail.gmail.com>
 <CAApg2=TjNwub9WsLfh1ZAA8hfMVDPgTYVCELotUfGRGpO9gu8Q@mail.gmail.com>
 <5e82785b-14bc-5a4d-a807-fdaa58afee5d@gmail.com>
In-Reply-To: <5e82785b-14bc-5a4d-a807-fdaa58afee5d@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 27 Apr 2022 09:14:59 +0200
Message-ID: 
 <CAApg2=Rd7rBM_PaVEzt4K4vKd4AqVC1uA6yZJZrABFLFYNWrcQ@mail.gmail.com>
Subject: Re: CVE-check failing on world with meta-openembedded: diff.gz file
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e2a33505dd9d917b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 07:15:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164890

--000000000000e2a33505dd9d917b
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 26, 2022 at 6:09 PM Khem Raj <raj.khem@gmail.com> wrote:

> Hi Marta
>
> On 4/26/22 5:20 AM, Marta Rybczynska wrote:
> >
> >
> > On Fri, Apr 22, 2022 at 11:07 AM Marta Rybczynska <rybczynska@gmail.com
> > <mailto:rybczynska@gmail.com>> wrote:
> >
> >     Dear all,
> >     We're running cve-check on a world build containing oe-core, meta-oe
> >     and more. We have an issue with the lockdev recipe
> >     (meta-openembedded/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
> >     <http://lockdev_1.0.3.bb>), which causes a fail like below:
> >
> >     $ bitbake world --runonly=do_cve_check
> >     ERROR: lockdev-1_1.0.3-r0 do_cve_check: File Not found:
> >     <path>lockdev/1_1.0.3-r0/lockdev_1.0.3-1.6.diff
> >     ERROR: lockdev-1_1.0.3-r0 do_cve_check: Failure in searching patches
> >     ERROR: Logfile of failure stored in:
> >     <path>/lockdev/1_1.0.3-r0/temp/log.do_cve_check.8709
> >     ERROR: Task
> >
>  (<path>/meta-openembedded/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb:
> do_cve_check)
> >     failed with exit code '1'
> >
> >     The issue is caused by the fact that lockdev_1.0.3-1.6.diff is
> >     missing. When we look into the recipe, it is downloading
> >     lockdev_1.0.3-1.6.diff.gz file Please note the additional extension.
> >
> >     Stripping the extension comes from oe-core/meta/oe/patch.py, from
> >     the patch_path function, which is figuring out if a file is a patch,
> >     and returning the local path if it is so. However, at the moment
> >     when we do_cve_check, the .gz file is not uncompressed.
> >
> >     I'm wondering how to solve it.
> >     1. Add a dependency to make sure eventual patch files are
> >     decompressed first?
>
>
> I think this option looks best or perhaps we should drop applying debian
> diff entirely since debian seems to have dropped this package
>
> I think regardless of what we do with this package it seems to be a
> limitation of cve-check process which perhaps should either be fixed or
> documented.
>
> >     2. Do not consider this as a patch file in the scope of cve-check ?
> >     (this is more a part of the source then an actual patch that might
> >     be fixing a CVE)
> >
> >     This is the only case like that we have in the build. Please note
> >     that removing ".diff" from the extension list in patch_path() is
> >     solving the issue.
> >
> >     Any comments or suggestions?
> >
> >

Adding Ross, Richard and Steve.

I'm wondering if it makes sense to consider .diff.gz (or .patch.gz) files
as patches for
cve-check. They basically come directly from 3rd parties and it is quite
unlikely to expect
them to keep the CVE: tag. All the pieces of documentation I can find
mention also only
.patch files for CVEs, and not .patch.gz.

This is tempting to remove the .gz handling here (for the cve-check) in my
opinion.

Also, since the commit f5f97d33a1703d75b9fd9760f2c7767081538e00, cve-check
depends only on do_fetch.

Any further opinions?

Regards,
Marta

--000000000000e2a33505dd9d917b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 26, 2022 at 6:09 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Marta<br=
>
<br>
On 4/26/22 5:20 AM, Marta Rybczynska wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Apr 22, 2022 at 11:07 AM Marta Rybczynska &lt;<a href=3D"mailt=
o:rybczynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:rybczynska@gmail.com" target=3D"_blank">r=
ybczynska@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Dear all,<br>
&gt;=C2=A0 =C2=A0 =C2=A0We&#39;re running cve-check on a world build contai=
ning oe-core, meta-oe<br>
&gt;=C2=A0 =C2=A0 =C2=A0and more. We have an issue with the lockdev recipe<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0(meta-openembedded/meta-oe/recipes-support/lockdev/=
<a href=3D"http://lockdev_1.0.3.bb" rel=3D"noreferrer" target=3D"_blank">lo=
ckdev_1.0.3.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lockdev_1.0.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://lockdev_1.0.3.bb</a>&gt;), which causes a =
fail like below:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0$ bitbake world --runonly=3Ddo_cve_check<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: lockdev-1_1.0.3-r0 do_cve_check: File Not fo=
und:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;path&gt;lockdev/1_1.0.3-r0/lockdev_1.0.3-1.6.di=
ff<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: lockdev-1_1.0.3-r0 do_cve_check: Failure in =
searching patches<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Logfile of failure stored in:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;path&gt;/lockdev/1_1.0.3-r0/temp/log.do_cve_che=
ck.8709<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Task<br>
&gt;=C2=A0 =C2=A0 =C2=A0(&lt;path&gt;/meta-openembedded/meta-oe/recipes-sup=
port/lockdev/lockdev_1.0.3.bb:do_cve_check)<br>
&gt;=C2=A0 =C2=A0 =C2=A0failed with exit code &#39;1&#39;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The issue is caused by the fact that lockdev_1.0.3-=
1.6.diff is<br>
&gt;=C2=A0 =C2=A0 =C2=A0missing. When we look into the recipe, it is downlo=
ading<br>
&gt;=C2=A0 =C2=A0 =C2=A0lockdev_1.0.3-1.6.diff.gz file Please note the addi=
tional extension.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Stripping the extension comes from oe-core/meta/oe/=
patch.py, from<br>
&gt;=C2=A0 =C2=A0 =C2=A0the patch_path function, which is figuring out if a=
 file is a patch,<br>
&gt;=C2=A0 =C2=A0 =C2=A0and returning the local path if it is so. However, =
at the moment<br>
&gt;=C2=A0 =C2=A0 =C2=A0when we do_cve_check, the .gz file is not uncompres=
sed.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m wondering how to solve it.<br>
&gt;=C2=A0 =C2=A0 =C2=A01. Add a dependency to make sure eventual patch fil=
es are<br>
&gt;=C2=A0 =C2=A0 =C2=A0decompressed first?<br>
<br>
<br>
I think this option looks best or perhaps we should drop applying debian <b=
r>
diff entirely since debian seems to have dropped this package<br>
<br>
I think regardless of what we do with this package it seems to be a <br>
limitation of cve-check process which perhaps should either be fixed or <br=
>
documented.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A02. Do not consider this as a patch file in the scop=
e of cve-check ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0(this is more a part of the source then an actual p=
atch that might<br>
&gt;=C2=A0 =C2=A0 =C2=A0be fixing a CVE)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This is the only case like that we have in the buil=
d. Please note<br>
&gt;=C2=A0 =C2=A0 =C2=A0that removing &quot;.diff&quot; from the extension =
list in patch_path() is<br>
&gt;=C2=A0 =C2=A0 =C2=A0solving the issue.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Any comments or suggestions?<br>
&gt; <br>
&gt; </blockquote></div><div class=3D"gmail_quote">Adding Ross, Richard and=
 Steve.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote=
">I&#39;m wondering if it makes sense to consider .diff.gz (or .patch.gz) f=
iles as patches for</div><div class=3D"gmail_quote">cve-check. They basical=
ly come directly from 3rd parties and it is quite unlikely to expect</div><=
div class=3D"gmail_quote"><span class=3D"ng" style=3D"background:rgba(0,0,0=
,0) none repeat scroll 0% 0%!important">them to</span> keep the CVE: tag. A=
ll the pieces of documentation I can find mention also only</div><div class=
=3D"gmail_quote">.patch files for CVEs, and not .patch.gz.</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">This is tempting to r=
emove the .gz handling here (for the cve-check) in my opinion.</div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Also, since the co=
mmit f5f97d33a1703d75b9fd9760f2c7767081538e00, cve-check</div><div class=3D=
"gmail_quote">depends only on do_fetch.</div><div class=3D"gmail_quote"><br=
></div><div class=3D"gmail_quote">Any further opinions?</div><div class=3D"=
gmail_quote"><br></div><div class=3D"gmail_quote">Regards,</div><div class=
=3D"gmail_quote">Marta<br></div></div>

--000000000000e2a33505dd9d917b--

