Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC994C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 17:39:46 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.50066.1702921180572250310
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 09:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=DsIrQPzj;
 spf=pass (domain: snapchat.com, ip: 209.85.218.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a234139b725so221190566b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702921179; x=1703525979; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=at6gNWqA6AIRx6dR5A0jeaOPgIvYgOaIwUwR/f7URks=;
        b=DsIrQPzjRaotUh7Sfda7Fc1eQr/NoTznlQVkLrVObKjpZXvlC8pDkfdnxXYYOFrym4
         0p6A6G1eCOZ9oDsAGtc2VYG1Ii1FeHlePYfGT6Ml4hqdxNstQIuPioHIiNOZj7ixPoqh
         loOMArq11PjWjuyPyH8c/N5Aq1azV9iqVHdv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702921179; x=1703525979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=at6gNWqA6AIRx6dR5A0jeaOPgIvYgOaIwUwR/f7URks=;
        b=g4lb0vsx1BEUsKEBPwa/xda5LLjCUIjJZy5igxLpSKeix8/amaOIPPKkU4PutEZe1F
         G9bdN6QHnHxQQvHVjFFlc6LvklywOG/Es6Ffm++Xv6hPmUWrUfya1GxuuGjNFBbnpIqo
         uV+zX16MkMvBIw59/tPrYjNrhHNiq2n5+V0VwK+neseLkTSai/pU1FMN6+NA5z14sZIU
         62Ie3EgMuNL3tYUAD1mqt7JLIGUbwxGEPZbs1TymcBVcJy9Tw6Y/d1zd7sT13yQ1sKYA
         86mfA+4Gulmrzm0SLeBOk9vH6gSm61FvoK6SKdH9eOxfW/3B3rPRiXNjhVV7T1TKrn+d
         LUFw==
X-Gm-Message-State: AOJu0Yx91HYmdLq7NlXtsqYJ6XCWJSQr0D7yUituGMgNnSIAUp6RA0Ji
	Mdp91O6Fa5JX9UeyVfRm7piaRBCPbJnaWjUfIrxxJg==
X-Google-Smtp-Source: AGHT+IFEMJhprFAEithVDv/ZKVtFDLzI0OrHdzJ9GPBsllx8m4WQ7OL/uprmdM2EVqGb7V6K0sBmG6dbEIWEQfMH8DM=
X-Received: by 2002:a17:906:205:b0:a1c:588a:ffc3 with SMTP id
 5-20020a170906020500b00a1c588affc3mr3770587ejd.161.1702921178854; Mon, 18 Dec
 2023 09:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20231216135306.188070-1-ecordonnier@snap.com> <34bee488217f82e9575f52dff15447474bf63d00.camel@linuxfoundation.org>
 <CAHUKmYY_NE=OEkTQ6qXVxWTs7UuHRK=+2_8FGW4AtJgv77RA9w@mail.gmail.com> <CADkTA4Mtai26k4bnGq=P-Hf9bt7XCzH2PFUqtd3K2WpAHZJCmQ@mail.gmail.com>
In-Reply-To: <CADkTA4Mtai26k4bnGq=P-Hf9bt7XCzH2PFUqtd3K2WpAHZJCmQ@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 18 Dec 2023 18:39:27 +0100
Message-ID: <CAHUKmYbPGRSiyB0VCyvwhqtQH9maCEtpHCjne-GY_PD+MOENiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f2e0cf060ccc3b0d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 17:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192670

--000000000000f2e0cf060ccc3b0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,
can you please clarify? Are you saying that you prefer the version of
the patch which I pasted with shutil.copytree?

The condition to trigger the issue is not that rare, e.g. anybody updating
from kirkstone 4.0.12 to 4.0.13 and doing an incremental build will get a
build failure if S doesn't have the default value (in my case the BSP layer
overrides S). In the same way, if we merge the version with
shutil.copytree, people will need to perform a manual clean, or they may
get build failures.

Etienne

On Mon, Dec 18, 2023 at 3:25=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> On Mon, Dec 18, 2023 at 6:45=E2=80=AFAM Etienne Cordonnier via
> lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
> wrote:
> >
> > My thinking was that in my local build I was updating from a build
> without
> https://github.com/yoctoproject/poky/commit/3b8d0acca30c806fb69fc3096d415=
93cc76ed22c
> to a build containing this commit, so the behavior of do_symlink_kernsrc
> got modified, but my incremental build is not executing the new version o=
f
> the code since it detects that the symlink already exists and then the re=
st
> of the function gets skipped, so I thought this justified a warning.
> >
> > I'll lower the warning to info, but then this assumes that we will neve=
r
> modify do_symlink_kernsrc in a way which is not backwards-compatible.
> >
> > @Richard: the reason I didn't go for the copy to "orig" is that I don't
> see a way to add this without breaking incremental builds (where s is a
> symlink to kernsrc which is potentially modified already by do_patch etc.=
).
> However I think it would be a cleaner solution than simply skipping the
> code like I did:
>
> If the only way to trigger the issue is through really rare pre-<some
> commit> to post
> that commit that happens to modify the detection/manipulation/other of S
> and the
> symlink, then it is rare enough to just drop an info message breadcrumb
> and keep
> moving.
>
> But if it really is a rare situation like you ran into, or some sort
> of forced execution
> of the task, I don't think that a copy would be an unexpected thing to
> happen.
>
> Bruce
>
> >
> > -        if d.getVar("EXTERNALSRC"):
> > +        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
> >              # With EXTERNALSRC S will not be wiped so we can symlink t=
o
> it
> >              os.symlink(s, kernsrc)
> >          else:
> >              import shutil
> > +            s_copy =3D s + ".orig"
> > +            if not os.path.isdir(s_copy):
> > +                shutil.copytree(s, s_copy)
> > +            bb.utils.remove(s, recurse=3DTrue)
> > +            shutil.copytree(s_copy, s)
> >
> > Etienne
> >
> >
> > On Sun, Dec 17, 2023 at 8:52=E2=80=AFPM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> >>
> >> On Sat, 2023-12-16 at 14:53 +0100, Etienne Cordonnier via
> >> lists.openembedded.org wrote:
> >> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >> >
> >> > The function do_symlink_kernsrc is not reentrant in the case where S
> is defined
> >> > to a non-default value. This causes build-failures e.g. when buildin=
g
> linux-yocto, then updating
> >> > poky to a commit which modifies kernel.bbclass, and then building
> linux-yocto again.
> >> >
> >> > Bugzilla:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproj=
ect.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vC=
HvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DqcR=
ut2Wm9dH26YP_YovPl6QVczLOYUxs1xfzA75ZJBiHj4dWwxbAS-2JjGPlyiyS&s=3D_WTBsDroH=
fmiIIyCOXRV2CAId9PmKZ4sN3bRO3EOcyU&e=3D
> >> >
> >> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> >> > ---
> >> >  meta/classes-recipe/kernel.bbclass | 5 +++++
> >> >  1 file changed, 5 insertions(+)
> >> >
> >> > diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> >> > index 9ff37f5c38..130bedd901 100644
> >> > --- a/meta/classes-recipe/kernel.bbclass
> >> > +++ b/meta/classes-recipe/kernel.bbclass
> >> > @@ -194,6 +194,11 @@ python do_symlink_kernsrc () {
> >> >              os.symlink(s, kernsrc)
> >> >          else:
> >> >              import shutil
> >> > +            if os.path.islink(s):
> >> > +                # this happens for instance when a poky update
> forces symlink_kernsrc to run again
> >> > +                # after s was already moved to kernsrc
> >> > +                bb.warn("%s is already a symlink! Not symlinking
> kernel sources" % s)
> >> > +                return 0
> >> >              shutil.move(s, kernsrc)
> >> >              os.symlink(kernsrc, s)
> >> >  }
> >>
> >> Usually what we recommend is that the first pass does something if "if
> >> not exists X.org; cp X X.orig; fi", then you can always copy from
> >> X.orig.
> >>
> >> As Bruce says, it definitely shouldn't be a warning, this can happen
> >> quite normally.
> >>
> >> Cheers,
> >>
> >> Richard
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192635):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_192635&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3D82QaxN_7mSeykh83DV-qNXJc9JezHaPCHv4jG2rrq55pywmZCA6Nz75KaUoSuFn8&s=3DxGE=
3OScznEMBXLhPR_DdKU6FPE6dbxsHXhKnfksbT8U&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_103208527_1050810&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D82QaxN_7mSeyk=
h83DV-qNXJc9JezHaPCHv4jG2rrq55pywmZCA6Nz75KaUoSuFn8&s=3DGX9x-WmhPnkZRNBnirD=
hR76l6Laww76WDH7ZwKCFSKQ&e=3D
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D82QaxN=
_7mSeykh83DV-qNXJc9JezHaPCHv4jG2rrq55pywmZCA6Nz75KaUoSuFn8&s=3DroqLGNR0ewax=
jmAl_ZE8nSZf_6sCh3yj7LXuITei5EA&e=3D
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000f2e0cf060ccc3b0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bruce,<br>can you please clarify? Are you saying that y=
ou prefer the version of the=C2=A0patch which I pasted with shutil.copytree=
?<br><br>The condition to trigger the issue is not that rare, e.g. anybody =
updating from kirkstone 4.0.12 to 4.0.13 and doing an incremental build wil=
l get a build failure if S doesn&#39;t have the default value (in my case t=
he BSP layer overrides S). In the same way, if we merge the version with sh=
util.copytree, people will need to perform a manual clean, or they may get =
build failures.<br><br>Etienne=C2=A0</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 18, 2023 at 3:25=E2=80=AFPM=
 Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfi=
eld@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Mon, Dec 18, 2023 at 6:45=E2=80=AFAM Etienne Cordonnier via=
<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com=
@lists.openembedded.org" target=3D"_blank">snap.com@lists.openembedded.org<=
/a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; My thinking was that in my local build I was updating from a build wit=
hout <a href=3D"https://github.com/yoctoproject/poky/commit/3b8d0acca30c806=
fb69fc3096d41593cc76ed22c" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/yoctoproject/poky/commit/3b8d0acca30c806fb69fc3096d41593cc76ed22c</=
a> to a build containing this commit, so the behavior of do_symlink_kernsrc=
 got modified, but my incremental build is not executing the new version of=
 the code since it detects that the symlink already exists and then the res=
t of the function gets skipped, so I thought this justified a warning.<br>
&gt;<br>
&gt; I&#39;ll lower the warning to info, but then this assumes that we will=
 never modify do_symlink_kernsrc in a way which is not backwards-compatible=
.<br>
&gt;<br>
&gt; @Richard: the reason I didn&#39;t go for the copy to &quot;orig&quot; =
is that I don&#39;t see a way to add this without breaking incremental buil=
ds (where s is a symlink to kernsrc which is potentially modified already b=
y do_patch etc.). However I think it would be a cleaner solution than simpl=
y skipping the code like I did:<br>
<br>
If the only way to trigger the issue is through really rare pre-&lt;some<br=
>
commit&gt; to post<br>
that commit that happens to modify the detection/manipulation/other of S an=
d the<br>
symlink, then it is rare enough to just drop an info message breadcrumb and=
 keep<br>
moving.<br>
<br>
But if it really is a rare situation like you ran into, or some sort<br>
of forced execution<br>
of the task, I don&#39;t think that a copy would be an unexpected thing to =
happen.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;EXTERNALSRC&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;EXTERNALSRC&quot;) and =
not os.path.islink(s):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # With EXTERNALSRC S w=
ill not be wiped so we can symlink to it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(s, kernsrc)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import shutil<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s_copy =3D s + &quot;.orig&=
quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isdir(s_copy=
):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copytr=
ee(s, s_copy)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(s, recurse=
=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copytree(s_copy, s)<=
br>
&gt;<br>
&gt; Etienne<br>
&gt;<br>
&gt;<br>
&gt; On Sun, Dec 17, 2023 at 8:52=E2=80=AFPM Richard Purdie &lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sat, 2023-12-16 at 14:53 +0100, Etienne Cordonnier via<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt; &gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The function do_symlink_kernsrc is not reentrant in the case =
where S is defined<br>
&gt;&gt; &gt; to a non-default value. This causes build-failures e.g. when =
building linux-yocto, then updating<br>
&gt;&gt; &gt; poky to a commit which modifies kernel.bbclass, and then buil=
ding linux-yocto again.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Bugzilla: <a href=3D"https://urldefense.proofpoint.com/v2/url=
?u=3Dhttps-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&amp;d=
=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbN=
onVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DqcRut2Wm9dH26YP_YovPl6QVczLO=
YUxs1xfzA75ZJBiHj4dWwxbAS-2JjGPlyiyS&amp;s=3D_WTBsDroHfmiIIyCOXRV2CAId9PmKZ=
4sN3bRO3EOcyU&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldef=
ense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproject.org_show-5Fb=
ug.cgi-3Fid-3D15325&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DqcR=
ut2Wm9dH26YP_YovPl6QVczLOYUxs1xfzA75ZJBiHj4dWwxbAS-2JjGPlyiyS&amp;s=3D_WTBs=
DroHfmiIIyCOXRV2CAId9PmKZ4sN3bRO3EOcyU&amp;e=3D</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecord=
onnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/classes-recipe/kernel.bbclass | 5 +++++<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classe=
s-recipe/kernel.bbclass<br>
&gt;&gt; &gt; index 9ff37f5c38..130bedd901 100644<br>
&gt;&gt; &gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt;&gt; &gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt;&gt; &gt; @@ -194,6 +194,11 @@ python do_symlink_kernsrc () {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(s,=
 kernsrc)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import shutil=
<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.islink(=
s):<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # th=
is happens for instance when a poky update forces symlink_kernsrc to run ag=
ain<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # af=
ter s was already moved to kernsrc<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.w=
arn(&quot;%s is already a symlink! Not symlinking kernel sources&quot; % s)=
<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn 0<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.move(s=
, kernsrc)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(ke=
rnsrc, s)<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; Usually what we recommend is that the first pass does something if=
 &quot;if<br>
&gt;&gt; not exists X.org; cp X X.orig; fi&quot;, then you can always copy =
from<br>
&gt;&gt; X.orig.<br>
&gt;&gt;<br>
&gt;&gt; As Bruce says, it definitely shouldn&#39;t be a warning, this can =
happen<br>
&gt;&gt; quite normally.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Richard<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#192635): <a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_messa=
ge_192635&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D82QaxN_7mSeyk=
h83DV-qNXJc9JezHaPCHv4jG2rrq55pywmZCA6Nz75KaUoSuFn8&amp;s=3DxGE3OScznEMBXLh=
PR_DdKU6FPE6dbxsHXhKnfksbT8U&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.=
org_g_openembedded-2Dcore_message_192635&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUk=
SGa66m67E&amp;m=3D82QaxN_7mSeykh83DV-qNXJc9JezHaPCHv4jG2rrq55pywmZCA6Nz75Ka=
UoSuFn8&amp;s=3DxGE3OScznEMBXLhPR_DdKU6FPE6dbxsHXhKnfksbT8U&amp;e=3D</a> <b=
r>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.openembedded.org_mt_103208527_1050810&amp;d=3DDwIFaQ&amp=
;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&amp;m=3D82QaxN_7mSeykh83DV-qNXJc9JezHaPCHv4jG2rrq=
55pywmZCA6Nz75KaUoSuFn8&amp;s=3DGX9x-WmhPnkZRNBnirDhR76l6Laww76WDH7ZwKCFSKQ=
&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoi=
nt.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_103208527_1050810&amp=
;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhk=
bNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D82QaxN_7mSeykh83DV-qNXJc9J=
ezHaPCHv4jG2rrq55pywmZCA6Nz75KaUoSuFn8&amp;s=3DGX9x-WmhPnkZRNBnirDhR76l6Law=
w76WDH7ZwKCFSKQ&amp;e=3D</a> <br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfP=
x_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D82QaxN_7mSeykh83DV-qNXJc9JezHaPCHv4jG2=
rrq55pywmZCA6Nz75KaUoSuFn8&amp;s=3DroqLGNR0ewaxjmAl_ZE8nSZf_6sCh3yj7LXuITei=
5EA&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore=
_unsub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&a=
mp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D82QaxN_7mSeykh83=
DV-qNXJc9JezHaPCHv4jG2rrq55pywmZCA6Nz75KaUoSuFn8&amp;s=3DroqLGNR0ewaxjmAl_Z=
E8nSZf_6sCh3yj7LXuITei5EA&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
--<br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000f2e0cf060ccc3b0d--

