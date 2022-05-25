Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615D4C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 12:59:36 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.6361.1653483571522232577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 05:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nxiHhDX2;
 spf=pass (domain: gmail.com, ip: 209.85.219.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id i187so33895256ybg.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pRbuKxbDf1sdccZJJzY9xkrOHO1i3CLI5Dg6kHhNAO4=;
        b=nxiHhDX2WzbeuPvO+BI9aiEGVUlEgrS0B//hexWAmn7VC0FTr+zUAWu9skjzKnVoIq
         ljrLuImkI4xaU2e8JJZDI6MqqOtqPlK1IpbvZ2+aQ7q7d9EqDuMolo35R9BHVgAiyZCn
         mKBNHEBTwu2OaL3iwfzDDNgsy3LPLFH6+l3RRT+NeA8mhoK8nMDhcdW7sF+KdNThzA5o
         1snCF1p5NeTnZfesBh62FiNsImVrsoJkVBy0CQOzCFA3HZa+tuBo9z/k0tYMInQNqLv1
         P4BGxlEFj4/6QLD3Ed9RGyJKQvjnLqBByC7ievh/uQBNhNwBFH5BYXJlzvwIZ9tt8wXe
         h4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pRbuKxbDf1sdccZJJzY9xkrOHO1i3CLI5Dg6kHhNAO4=;
        b=Z8eoXrNLV/THtSsDH3XxF8LXFpQC9ur/S7EXK4fK9iwk4p5G51Db8gJE31zU1ijNV8
         vAvuSZxSUA8MaQN/MR1igLD14Ih9dLiJS+sAjBV0sjpOZzHP1v5olYsIJnCo1Fvpf0P9
         MARSAYO/lgoVf1/2Kt/2OQbN3b83EcoRacoNuwDDIgjGSzxdEm9+wTp9hF3eyUQs9wJ0
         2wM8r9NjnDzFzwFIHxhPLNzGJc9WUUHcW5/fdlTzTo4i0U5wR5IMxavWeuEdol/ViTKu
         Swc3/dYPQBv0mCpMxm3GL9TQYdWLiR2l6bKv4cbEqnJXzYTtZbWrR3c0PgBPtG0HOiVZ
         w3DA==
X-Gm-Message-State: AOAM533KD3MKDPH8iOMkpo2Zrq7n8l5HPlf9W/H8wrSdy+UJh4Yoh1fx
	qF5Krxlc1kxstIeB+iacdj0GrTM0aAH2RKxI0rI=
X-Google-Smtp-Source: 
 ABdhPJxzWj+UNruQnm5MOWzUn+Kog1L19dOqlEme2RCJgil+abe6wdk4Kp29sYLS0NQY2W6QE5NrtcnYyqD0VfyD6W8=
X-Received: by 2002:a05:6902:114c:b0:641:87a7:da90 with SMTP id
 p12-20020a056902114c00b0064187a7da90mr32458193ybu.561.1653483570662; Wed, 25
 May 2022 05:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220524152401.1663317-1-ross.burton@arm.com>
 <20220524152401.1663317-9-ross.burton@arm.com>
 <20220525100322.1a50d726@melee>
 <9BB79F38-1612-4383-BAE2-DD4FD065476B@arm.com>
In-Reply-To: <9BB79F38-1612-4383-BAE2-DD4FD065476B@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 May 2022 08:59:19 -0400
Message-ID: 
 <CADkTA4M_j9rPa+FscV93XZgDvs_HpQaXg_SFZAD2yW9Ldf=ihg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 9/9] lzo: remove recipe from oe-core
To: Ross Burton <Ross.Burton@arm.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000df102905dfd5a451"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 12:59:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166122

--000000000000df102905dfd5a451
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 7:26 AM Ross Burton <Ross.Burton@arm.com> wrote:

> On 25 May 2022, at 09:03, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote=
:
> >
> > Hi Ross, Bruce,
> >
> > Il giorno Tue, 24 May 2022 16:24:01 +0100
> > "Ross Burton" <ross.burton@arm.com> ha scritto:
> >
> >> LZO is a fairly archaic compression format that hasn't been updated
> >> since 2017.  It's now unused by anything else in oe-core, so remove
> >> the recipes.
> >>
> >> Signed-off-by: Ross Burton <ross.burton@arm.com>
> >
> > I love removals of archaic features...
> >
> > ...and how they make things explode :-)
> >
> > stdio: ERROR: Nothing PROVIDES 'lzo' (but
> >
> /home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recipes-=
extended/xen/
> xen_4.16.bb,
> >
> /home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recipes-=
extended/xen/
> xen-tools_4.16.bb
> > DEPENDS on or otherwise requires it)
>
> I=E2=80=99ve also just sent a RFC patch for xen to disable LZO entirely, =
but I=E2=80=99ll
> leave that up to Bruce to decide.  If lzo is removed from core it will be
> added to meta-oe, so xen will continue to build either way.
>
>
right.

We'll keep it as optional.

But isn't this just a timing issue for the failure ? Or are we missing a
dependency in meta-virt on where this landed in meta-oe ? We definitely
have meta-oe dependencies in meta-virt, so the AB should already have those
in place .. so this must have only blown up because it hasn't landed in
meta-oe yet (nor should it probably have, as this is a test of the removal
in OEcore) .

Either way, I'll merge the meta-virt, make-it-optional patch shortly and
this should be good to go.

Bruce



> Ross



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000df102905dfd5a451
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, May 25, 2022 at 7:26 AM Ross Burton &lt;<a =
href=3D"mailto:Ross.Burton@arm.com" target=3D"_blank">Ross.Burton@arm.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 25 May 2022, at 09:03, Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@b=
ootlin.com" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi Ross, Bruce,<br>
&gt; <br>
&gt; Il giorno Tue, 24 May 2022 16:24:01 +0100<br>
&gt; &quot;Ross Burton&quot; &lt;<a href=3D"mailto:ross.burton@arm.com" tar=
get=3D"_blank">ross.burton@arm.com</a>&gt; ha scritto:<br>
&gt; <br>
&gt;&gt; LZO is a fairly archaic compression format that hasn&#39;t been up=
dated<br>
&gt;&gt; since 2017.=C2=A0 It&#39;s now unused by anything else in oe-core,=
 so remove<br>
&gt;&gt; the recipes.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.c=
om" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; <br>
&gt; I love removals of archaic features...<br>
&gt; <br>
&gt; ...and how they make things explode :-)<br>
&gt; <br>
&gt; stdio: ERROR: Nothing PROVIDES &#39;lzo&#39; (but<br>
&gt; /home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recip=
es-extended/xen/<a href=3D"http://xen_4.16.bb" rel=3D"noreferrer" target=3D=
"_blank">xen_4.16.bb</a>,<br>
&gt; /home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recip=
es-extended/xen/<a href=3D"http://xen-tools_4.16.bb" rel=3D"noreferrer" tar=
get=3D"_blank">xen-tools_4.16.bb</a><br>
&gt; DEPENDS on or otherwise requires it)<br>
<br>
I=E2=80=99ve also just sent a RFC patch for xen to disable LZO entirely, bu=
t I=E2=80=99ll leave that up to Bruce to decide.=C2=A0 If lzo is removed fr=
om core it will be added to meta-oe, so xen will continue to build either w=
ay.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">right.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">W=
e&#39;ll keep it as optional.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">But isn&#39;t this just a timing issue for the failure ? Or are we mis=
sing a dependency in meta-virt on where this landed in meta-oe ? We definit=
ely have meta-oe dependencies in meta-virt, so the AB should already have t=
hose in place .. so this must have only blown up because it hasn&#39;t land=
ed in meta-oe yet (nor should it probably have, as this is a test of the re=
moval in OEcore) .</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Either=
 way, I&#39;ll merge the meta-virt, make-it-optional patch shortly and this=
 should be good to go.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Ross</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr">- Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek I=
I<br><br></div></div>

--000000000000df102905dfd5a451--

