Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA859C47DB3
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 17:18:12 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.736.1706721488546601251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 09:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=QmBUA0YS;
 spf=pass (domain: snapchat.com, ip: 209.85.218.53, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a35385da5bbso768017466b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 09:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1706721487; x=1707326287; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/BSRBMy9HcNlHsiVaBQon/FSoqd+m2ClmIMJ0ZoCFbQ=;
        b=QmBUA0YShAIej+MqhPfLl9C3TdnasGJGpY3VrtQgMgkniTmCP7pEjy0Z5uKTIFb7lJ
         Wf07DZZTU4IV40BEPFfXqNqrGVab/ayMKi4A8GBYxFs0FIGAbIjoORVkRJkLq0ei6oQs
         FvzfVVuHjXn+1Szxd8N6wC6JXd6XrgYSi3eAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706721487; x=1707326287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BSRBMy9HcNlHsiVaBQon/FSoqd+m2ClmIMJ0ZoCFbQ=;
        b=T/cyR86fQRetReBgQRkbQLuFK3xJYylvCcQNpyQpVx+hPROkpRNhi2bxnxm8ly0t8R
         uxutYMx8Y4WrzTCSzNNb2qhWbALVrMrzevJ+CtCOc6r9iDyZZN13Eafxxd6c8D9sfP08
         FeROSBCIii7SJM2lkhvxJJyBEwbg+OvJQbzcN25wHk5VgoEx3zMg/JKmSQJgCvOVljgE
         iZDb9uVqD6hOlbeMr+NOQLWR1BOT9n/UuUZb7GHnJori55f8wwzLWh5Z1YS5YWvcztJh
         a7IJPy4t6S68y5SaT0Q9iGbla1P4HhjxxKcQhlhna37rV4KD3LDSM51N0tXZw45IIkQM
         Bq9w==
X-Gm-Message-State: AOJu0Yy/W9+T8RKm97KC3gEWio5zKdB0HJdy3vvgD+Z5rPJg/F+37ulM
	JPF1roDOlMiPyeNLI9wt+8ypqDPPOAh4piZGnglN5IHNoUlDFgrOa3kWN25OCmCGkP0XrxUUKit
	JibkpYB5tBgPq6msJNLFRP+gtZpKcmpXtac1nNw==
X-Google-Smtp-Source: AGHT+IEJEKQ/NMMIVDgfq9kF+OgJ3JERgDJrSOMKFhTulst0zDYTANik4C3sCU66XUdBmIAbi14L/VbWO1IB7nV5jcQ=
X-Received: by 2002:a17:906:f1d2:b0:a30:db7d:6811 with SMTP id
 gx18-20020a170906f1d200b00a30db7d6811mr1610622ejb.43.1706721486868; Wed, 31
 Jan 2024 09:18:06 -0800 (PST)
MIME-Version: 1.0
References: <17A2F72F5D272934.28089@lists.openembedded.org>
 <17A2F73D8934EE37.10357@lists.openembedded.org> <CAHUKmYbSB7YvxRbriXxpG9+JumEysDgVW=SxBX=B1yjDCRMrtw@mail.gmail.com>
 <20240131165340dbfecc40@mail.local>
In-Reply-To: <20240131165340dbfecc40@mail.local>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Wed, 31 Jan 2024 18:17:55 +0100
Message-ID: <CAHUKmYb6gU6x7pCTnsbWo=zdAYOznc3+=L-+E6C=cMqyTA16ug@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f4e6c30610410fc2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 17:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194531

--000000000000f4e6c30610410fc2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, note that based on the discussion at
https://lists.openembedded.org/g/openembedded-core/message/192676?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Creentrant%2C20%2C2%2C0%2C103208527
I indeed expect a build failure on an incremental build where S is
overridden, and the existing build directory has an "incorrect" structure
due to a previous build. In this case a one-time clean of the kernel is
required.

On Wed, Jan 31, 2024 at 5:53=E2=80=AFPM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 30/01/2024 16:39:27+0100, Etienne Cordonnier via lists.openembedded.or=
g
> wrote:
> > Hi,
> > what is the status of this patch? Was it rejected?
> >
>
> I'll test it again because I don't remember but I possibly add a
> build/test failure.
>
> > =C3=89tienne
> >
> > On Thu, Dec 21, 2023 at 10:50=E2=80=AFPM Etienne Cordonnier via
> > lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
> wrote:
> >
> > > patch v5: added ignore_dangling_symlinks to avoid error when linux
> sources
> > > contain dangling symlinks
> > >
> > > On Thu, Dec 21, 2023 at 10:49=E2=80=AFPM Etienne Cordonnier via
> > > lists.openembedded.org
> > > <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.=
org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DUCoMTsJKrnqkV-eQGGRGBeC-wIGTP7H0LRP=
vcTWkn9673LluHqkCpFInRctDEEct&s=3DAf3lZ-qHdVwBo6b8tlJ45PXYNer8GU6q0uxJ740ca=
CA&e=3D
> >
> > > <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
> > >
> > >> From: Etienne Cordonnier <ecordonnier@snap.com>
> > >>
> > >> The function do_symlink_kernsrc is not reentrant in the case where S
> is
> > >> defined
> > >> to a non-default value. This causes build-failures e.g. when buildin=
g
> > >> linux-yocto, then updating
> > >> poky to a commit which modifies kernel.bbclass, and then building
> > >> linux-yocto again.
> > >>
> > >> Bugzilla:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproj=
ect.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vC=
HvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DiKg=
aTl7foinidQ3odGNYB-M4jWUTar8G6CFMlnChcA57K40tJPv4CtbC0vRLjJpq&s=3D01DEoIZCm=
VtfygqQ3U_vRyh1Y1G_g-TrnrOOEXd0ysU&e=3D
> > >> <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproj=
ect.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vC=
HvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Deo9=
dzHi2uXPV1dA2f4GoA6Y7QoDiG2TTF1R2YQ__SwnF1U1d0O2JxX3PprS_T9BN&s=3De9FG4cG4G=
bLjCy8loEN6qVisSUax4Ngvd_Ok8TPonvY&e=3D
> >
> > >>
> > >> Tested with a recipe "my-custom-linux" which unpacks sources to a
> custom
> > >> ${S} directory
> > >> and ran symlink_kernsrc several times:
> > >> $ bitbake -f -c symlink_kernsrc my-custom-linux
> > >>
> > >> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > >> ---
> > >>  meta/classes-recipe/kernel.bbclass | 8 +++++++-
> > >>  1 file changed, 7 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/meta/classes-recipe/kernel.bbclass
> > >> b/meta/classes-recipe/kernel.bbclass
> > >> index 9ff37f5c38..45b63f1fa1 100644
> > >> --- a/meta/classes-recipe/kernel.bbclass
> > >> +++ b/meta/classes-recipe/kernel.bbclass
> > >> @@ -189,11 +189,17 @@ python do_symlink_kernsrc () {
> > >>              # drop trailing slash, so that os.symlink(kernsrc, s)
> > >> doesn't use s as
> > >>              # directory name and fail
> > >>              s =3D s[:-1]
> > >> -        if d.getVar("EXTERNALSRC"):
> > >> +        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
> > >>              # With EXTERNALSRC S will not be wiped so we can symlin=
k
> to
> > >> it
> > >>              os.symlink(s, kernsrc)
> > >>          else:
> > >>              import shutil
> > >> +            # perform idempotent/reentrant copy
> > >> +            s_copy =3D s + ".orig"
> > >> +            if not os.path.isdir(s_copy):
> > >> +                shutil.copytree(s, s_copy,
> ignore_dangling_symlinks=3DTrue)
> > >> +            bb.utils.remove(s, recurse=3DTrue)
> > >> +            shutil.copytree(s_copy, s, ignore_dangling_symlinks=3DT=
rue)
> > >>              shutil.move(s, kernsrc)
> > >>              os.symlink(kernsrc, s)
> > >>  }
> > >> --
> > >> 2.34.1
> > >>
> > >>
> > >>
> > >>
> > >
> > >
> > >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194496):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_194496&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DiKgaTl7foinidQ3odGNYB-M4jWUTar8G6CFMlnChcA57K40tJPv4CtbC0vRLjJpq&s=3DG7I=
8YhqpwqafPUBBHcpFpmThNk5vTFfDQAA3EdTet9U&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_104055728_3617179&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DiKgaTl7foinid=
Q3odGNYB-M4jWUTar8G6CFMlnChcA57K40tJPv4CtbC0vRLjJpq&s=3D7KEXcFZJh3ku2w0FRlL=
PGNz6p-IBgg7CaGGFAfBHrnA&e=3D
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DiKgaTl=
7foinidQ3odGNYB-M4jWUTar8G6CFMlnChcA57K40tJPv4CtbC0vRLjJpq&s=3DY9laBkE0P4fG=
E0KBQVjm585hG7rjyw1Zh2YxwQ5crX0&e=3D
> [alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.com&d=3DDw=
IDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&m=3DiKgaTl7foinidQ3odGNYB-M4jWUTar8G6CFMlnChcA57K=
40tJPv4CtbC0vRLjJpq&s=3D3OVhEgy2jWuMpzbOdK2jsZDChCURAw-6geaZ2FOllTs&e=3D
>

--000000000000f4e6c30610410fc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, note that based on the discussion at=C2=A0<a href=
=3D"https://lists.openembedded.org/g/openembedded-core/message/192676?p=3D%=
2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Creentrant%2C20%2C2%2C0%2C10320852=
7">https://lists.openembedded.org/g/openembedded-core/message/192676?p=3D%2=
C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Creentrant%2C20%2C2%2C0%2C103208527=
</a> I indeed expect a build failure on an incremental build where S is ove=
rridden, and the existing build directory has an &quot;incorrect&quot; stru=
cture due to a previous build. In this case a one-time clean of the kernel =
is required.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jan 31, 2024 at 5:53=E2=80=AFPM Alexandre Belloni &=
lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootl=
in.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 30/01/2024 16:39:27+0100, Etienne Cordonnier via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a> wrote:<br>
&gt; Hi,<br>
&gt; what is the status of this patch? Was it rejected?<br>
&gt; <br>
<br>
I&#39;ll test it again because I don&#39;t remember but I possibly add a<br=
>
build/test failure.<br>
<br>
&gt; =C3=89tienne<br>
&gt; <br>
&gt; On Thu, Dec 21, 2023 at 10:50=E2=80=AFPM Etienne Cordonnier via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:sna=
p.com@lists.openembedded.org" target=3D"_blank">snap.com@lists.openembedded=
.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; patch v5: added ignore_dangling_symlinks to avoid error when linu=
x sources<br>
&gt; &gt; contain dangling symlinks<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Dec 21, 2023 at 10:49=E2=80=AFPM Etienne Cordonnier via<b=
r>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &lt;<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-=
3A__lists.openembedded.org&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCH=
vabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;=
m=3DUCoMTsJKrnqkV-eQGGRGBeC-wIGTP7H0LRPvcTWkn9673LluHqkCpFInRctDEEct&amp;s=
=3DAf3lZ-qHdVwBo6b8tlJ45PXYNer8GU6q0uxJ740caCA&amp;e=3D" rel=3D"noreferrer"=
 target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__li=
sts.openembedded.org&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGk=
ICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DUC=
oMTsJKrnqkV-eQGGRGBeC-wIGTP7H0LRPvcTWkn9673LluHqkCpFInRctDEEct&amp;s=3DAf3l=
Z-qHdVwBo6b8tlJ45PXYNer8GU6q0uxJ740caCA&amp;e=3D</a>&gt;<br>
&gt; &gt; &lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembedded.o=
rg" target=3D"_blank">snap.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The function do_symlink_kernsrc is not reentrant in the case =
where S is<br>
&gt; &gt;&gt; defined<br>
&gt; &gt;&gt; to a non-default value. This causes build-failures e.g. when =
building<br>
&gt; &gt;&gt; linux-yocto, then updating<br>
&gt; &gt;&gt; poky to a commit which modifies kernel.bbclass, and then buil=
ding<br>
&gt; &gt;&gt; linux-yocto again.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Bugzilla: <a href=3D"https://urldefense.proofpoint.com/v2/url=
?u=3Dhttps-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&amp;d=
=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbN=
onVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DiKgaTl7foinidQ3odGNYB-M4jWUT=
ar8G6CFMlnChcA57K40tJPv4CtbC0vRLjJpq&amp;s=3D01DEoIZCmVtfygqQ3U_vRyh1Y1G_g-=
TrnrOOEXd0ysU&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldef=
ense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproject.org_show-5Fb=
ug.cgi-3Fid-3D15325&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DiKg=
aTl7foinidQ3odGNYB-M4jWUTar8G6CFMlnChcA57K40tJPv4CtbC0vRLjJpq&amp;s=3D01DEo=
IZCmVtfygqQ3U_vRyh1Y1G_g-TrnrOOEXd0ysU&amp;e=3D</a> <br>
&gt; &gt;&gt; &lt;<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&amp;d=3DDwMF=
aQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIG=
RfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Deo9dzHi2uXPV1dA2f4GoA6Y7QoDiG2TTF1R=
2YQ__SwnF1U1d0O2JxX3PprS_T9BN&amp;s=3De9FG4cG4GbLjCy8loEN6qVisSUax4Ngvd_Ok8=
TPonvY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.pr=
oofpoint.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-=
3Fid-3D15325&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epck=
fdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Deo9dzHi2uX=
PV1dA2f4GoA6Y7QoDiG2TTF1R2YQ__SwnF1U1d0O2JxX3PprS_T9BN&amp;s=3De9FG4cG4GbLj=
Cy8loEN6qVisSUax4Ngvd_Ok8TPonvY&amp;e=3D</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Tested with a recipe &quot;my-custom-linux&quot; which unpack=
s sources to a custom<br>
&gt; &gt;&gt; ${S} directory<br>
&gt; &gt;&gt; and ran symlink_kernsrc several times:<br>
&gt; &gt;&gt; $ bitbake -f -c symlink_kernsrc my-custom-linux<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecord=
onnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 meta/classes-recipe/kernel.bbclass | 8 +++++++-<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt;&gt; b/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt;&gt; index 9ff37f5c38..45b63f1fa1 100644<br>
&gt; &gt;&gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt;&gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt;&gt; @@ -189,11 +189,17 @@ python do_symlink_kernsrc () {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # drop traili=
ng slash, so that os.symlink(kernsrc, s)<br>
&gt; &gt;&gt; doesn&#39;t use s as<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # directory n=
ame and fail<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D s[:-1]<=
br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;EXTERNALSRC&qu=
ot;):<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;EXTERNALSRC&qu=
ot;) and not os.path.islink(s):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # With EXTERN=
ALSRC S will not be wiped so we can symlink to<br>
&gt; &gt;&gt; it<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(s,=
 kernsrc)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import shutil=
<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # perform idempote=
nt/reentrant copy<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s_copy =3D s + &qu=
ot;.orig&quot;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isd=
ir(s_copy):<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shut=
il.copytree(s, s_copy, ignore_dangling_symlinks=3DTrue)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(s,=
 recurse=3DTrue)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copytree(s_=
copy, s, ignore_dangling_symlinks=3DTrue)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.move(s=
, kernsrc)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(ke=
rnsrc, s)<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.34.1<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#194496): <a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_messa=
ge_194496&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DiKgaTl7foinid=
Q3odGNYB-M4jWUTar8G6CFMlnChcA57K40tJPv4CtbC0vRLjJpq&amp;s=3DG7I8YhqpwqafPUB=
BHcpFpmThNk5vTFfDQAA3EdTet9U&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.=
org_g_openembedded-2Dcore_message_194496&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUk=
SGa66m67E&amp;m=3DiKgaTl7foinidQ3odGNYB-M4jWUTar8G6CFMlnChcA57K40tJPv4CtbC0=
vRLjJpq&amp;s=3DG7I8YhqpwqafPUBBHcpFpmThNk5vTFfDQAA3EdTet9U&amp;e=3D</a> <b=
r>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.openembedded.org_mt_104055728_3617179&amp;d=3DDwIDaQ&amp=
;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&amp;m=3DiKgaTl7foinidQ3odGNYB-M4jWUTar8G6CFMlnChc=
A57K40tJPv4CtbC0vRLjJpq&amp;s=3D7KEXcFZJh3ku2w0FRlLPGNz6p-IBgg7CaGGFAfBHrnA=
&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoi=
nt.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_104055728_3617179&amp=
;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhk=
bNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DiKgaTl7foinidQ3odGNYB-M4jW=
UTar8G6CFMlnChcA57K40tJPv4CtbC0vRLjJpq&amp;s=3D7KEXcFZJh3ku2w0FRlLPGNz6p-IB=
gg7CaGGFAfBHrnA&amp;e=3D</a> <br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIDaQ&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfP=
x_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DiKgaTl7foinidQ3odGNYB-M4jWUTar8G6CFMln=
ChcA57K40tJPv4CtbC0vRLjJpq&amp;s=3DY9laBkE0P4fGE0KBQVjm585hG7rjyw1Zh2YxwQ5c=
rX0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore=
_unsub&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&a=
mp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DiKgaTl7foinidQ3o=
dGNYB-M4jWUTar8G6CFMlnChcA57K40tJPv4CtbC0vRLjJpq&amp;s=3DY9laBkE0P4fGE0KBQV=
jm585hG7rjyw1Zh2YxwQ5crX0&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:alexandre.b=
elloni@bootlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.c=
om&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DiKgaTl7foinidQ3odGNY=
B-M4jWUTar8G6CFMlnChcA57K40tJPv4CtbC0vRLjJpq&amp;s=3D3OVhEgy2jWuMpzbOdK2jsZ=
DChCURAw-6geaZ2FOllTs&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.com&amp;d=3DDwIDaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DiKgaTl7foinidQ3odGNYB-M4jWUTar8G6CFMl=
nChcA57K40tJPv4CtbC0vRLjJpq&amp;s=3D3OVhEgy2jWuMpzbOdK2jsZDChCURAw-6geaZ2FO=
llTs&amp;e=3D</a> <br>
</blockquote></div>

--000000000000f4e6c30610410fc2--

