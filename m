Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8940EC04A95
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:48:29 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.516.1663955303914797970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 10:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L7dRhLQE;
 spf=pass (domain: gmail.com, ip: 209.85.167.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id c81so738997oif.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 10:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PAd3s4agmatdfqLizVo1ylNa78dFgGVouqDagP+xpZw=;
        b=L7dRhLQEfnnBBXGYleL93JGVixC3DvaOUYR4Np/6eZx4trmZsX9BcQCGPXS8XGtD2B
         idrUZrdzunTYla4cX7pVlXwTRJOgMR6HaI9NzHCzclkonkYIoVvbs366mySfJwlj0LQ3
         zoQy/+JSWDyprIZnFRaZb2Mg4zYPkIo8lI6S3KDdqx81BjOdQx/47u6j0Bt15+kPRLeR
         4hnMbUKOf6uNIUk9vyvoUg+8HJ2Bqwyb0hJs1HuVXMBFyBq7g+7s+Rv7z8gjlGJfbDFH
         Nt8QbEPRXSqbV5KiJ4ZStf5lVhPcoecEf6GOj/gUFaH0PBcaJ/QfICNtKkgZtx5fQkeC
         5Fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PAd3s4agmatdfqLizVo1ylNa78dFgGVouqDagP+xpZw=;
        b=uI8cUtjKOLso6igNY/wRX+d3eXIoSv6uZkySmDQb4e4fP6G7voKBMH2HysdoKrRQtq
         XTLI3d+avKi0O065bYN4WMsLYEXNOxPsF8OFm2DFIk59ccA3E55LKN08M2BNtPkE513T
         2jtgojQfJhpgBZElLJBc/VTnwmGeRlXarBXrhsY+fy9oWjOFztvFN24gTAOoDyNqzlTK
         NjE0BKHXHMVho/erg5xtD22GUveSlIAB0JWDZf0PdtRy3LX+jP77g9W+L+QhcDWGUmYP
         e6PptNAJpsnqohbdoU3tAnxhAQ9JFkv4NBRkcdtCgXbdopUgSYOuMVnn9+Wtoxsh4pKA
         yxzw==
X-Gm-Message-State: ACrzQf0BsxIfraqotXoX63O4NAxdrUvjB0ZvvL7t8zPyoypAbrbF8i2o
	oJk5C+6f2P6pIn2xyDQvtFuY6wO6xfd7YufY5hQ=
X-Google-Smtp-Source: 
 AMsMyM79CS51oriXgUUe+4RGdC/vQF37B/6ZPliE+zGlW2BuiHAJfffqHyyGWTBZ1Qdx/7/Au+nX0o4hwL3RntRlceI=
X-Received: by 2002:a05:6808:1988:b0:34f:de19:411c with SMTP id
 bj8-20020a056808198800b0034fde19411cmr9279589oib.262.1663955303018; Fri, 23
 Sep 2022 10:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662077634.git.wltu@google.com>
 <32c56887301c5fc58e5c9877c858295de66fc482.1662077634.git.wltu@google.com>
 <CAHwn2Xn80+=miR0ZvM1mLhMLUyMdg3Ja4yt6r5xLikh2uRE87Q@mail.gmail.com>
In-Reply-To: 
 <CAHwn2Xn80+=miR0ZvM1mLhMLUyMdg3Ja4yt6r5xLikh2uRE87Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Sep 2022 13:48:11 -0400
Message-ID: 
 <CAMKF1soAvqmReWbkrpPpM-NGmzyCbQkpLRtqvR_pmfL5a9MYdw@mail.gmail.com>
Subject: Re: [PULL] [PATCH 1/1] openssh: Install header + lib files
To: Willy Tu <wltu@google.com>
Cc: Tristan Lelong <tlelong@google.com>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c2346905e95bc858"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Sep 2022 17:48:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171002

--000000000000c2346905e95bc858
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 23, 2022 at 12:56 PM Willy Tu <wltu@google.com> wrote:

> friendly ping (again), but this time with plain text only.
>

I think it should be done with packageconfig which is at recipe scope and
then in your own distro you could enable it via bbappend or via other
global knob if you wish so

Secondly lot of these seems to be something that devel package should have
already can you check that and ensure we are not double installing the
files


> Willy Tu
>
>
> On Thu, Sep 1, 2022 at 5:16 PM Willy Tu <wltu@google.com> wrote:
> >
> > Instal API only if opensshinternals is in DISTRO_FEATURES.
> >
> > Install the OpenSSH header + lib files for other repo to build using it.
> > For example, https://github.com/google/hiba is dependent on those files
> > to build and this change is needed to meet that requirement.
> >
> > https://github.com/openembedded/meta-openembedded/pull/597
> >
> > Signed-off-by: Willy Tu <wltu@google.com>
> > ---
> >  meta/recipes-connectivity/openssh/openssh_9.0p1.bb | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
> > index b63ea2b137..84da118ca6 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
> > @@ -137,6 +137,17 @@ do_install:append () {
> >                 ${D}${sysconfdir}/init.d/sshd
> >
> >         install -D -m 0755 ${WORKDIR}/sshd_check_keys
> ${D}${libexecdir}/${BPN}/sshd_check_keys
> > +
> > +       if ${@bb.utils.contains('DISTRO_FEATURES', 'opensshinternals',
> 'true', 'false', d)}; then
> > +               install -d ${D}${includedir}/ssh
> > +               install -d ${D}${includedir}/ssh/openbsd-compat
> > +               install -m0644 ${S}/*.h ${D}${includedir}/ssh
> > +               install -m0644 ${S}/openbsd-compat/*.h
> ${D}${includedir}/ssh/openbsd-compat
> > +
> > +               install -d ${D}${libdir}
> > +               install -m0644 ${S}/libssh.a ${D}${libdir}
> > +               install -m0644 ${S}/openbsd-compat/libopenbsd-compat.a
> ${D}${libdir}
> > +       fi
> >  }
> >
> >  do_install_ptest () {
> > --
> > 2.37.2.789.g6183377224-goog
> >
>

--000000000000c2346905e95bc858
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 23, 2022 at 12:56 PM Willy Tu &lt;<a href=3D"ma=
ilto:wltu@google.com">wltu@google.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">friendly ping (again), but this time with plain text only=
.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think it shoul=
d be done with packageconfig which is at recipe scope and then in your own =
distro you could enable it via bbappend or via other global knob if you wis=
h so</div><div dir=3D"auto"><br></div><div dir=3D"auto">Secondly lot of the=
se seems to be something that devel package should have already can you che=
ck that and ensure we are not double installing the files=C2=A0</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Willy Tu<br>
<br>
<br>
On Thu, Sep 1, 2022 at 5:16 PM Willy Tu &lt;<a href=3D"mailto:wltu@google.c=
om" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Instal API only if opensshinternals is in DISTRO_FEATURES.<br>
&gt;<br>
&gt; Install the OpenSSH header + lib files for other repo to build using i=
t.<br>
&gt; For example, <a href=3D"https://github.com/google/hiba" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/google/hiba</a> is dependent on t=
hose files<br>
&gt; to build and this change is needed to meet that requirement.<br>
&gt;<br>
&gt; <a href=3D"https://github.com/openembedded/meta-openembedded/pull/597"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/openembedded/meta-=
openembedded/pull/597</a><br>
&gt;<br>
&gt; Signed-off-by: Willy Tu &lt;<a href=3D"mailto:wltu@google.com" target=
=3D"_blank">wltu@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.0p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.0p1.bb</a> | 11 ++++++=
+++++<br>
&gt;=C2=A0 1 file changed, 11 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://opens=
sh_9.0p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.0p1.bb</a> b/me=
ta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.0p1.bb" rel=3D"=
noreferrer" target=3D"_blank">openssh_9.0p1.bb</a><br>
&gt; index b63ea2b137..84da118ca6 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.0p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.0p1.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.0p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.0p1.bb</a><br>
&gt; @@ -137,6 +137,17 @@ do_install:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${sys=
confdir}/init.d/sshd<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 0755 ${WORKDIR}/sshd_ch=
eck_keys ${D}${libexecdir}/${BPN}/sshd_check_keys<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATUR=
ES&#39;, &#39;opensshinternals&#39;, &#39;true&#39;, &#39;false&#39;, d)}; =
then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D=
}${includedir}/ssh<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D=
}${includedir}/ssh/openbsd-compat<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m0644=
 ${S}/*.h ${D}${includedir}/ssh<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m0644=
 ${S}/openbsd-compat/*.h ${D}${includedir}/ssh/openbsd-compat<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D=
}${libdir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m0644=
 ${S}/libssh.a ${D}${libdir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m0644=
 ${S}/openbsd-compat/libopenbsd-compat.a ${D}${libdir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_install_ptest () {<br>
&gt; --<br>
&gt; 2.37.2.789.g6183377224-goog<br>
&gt;<br>
</blockquote></div></div>

--000000000000c2346905e95bc858--

