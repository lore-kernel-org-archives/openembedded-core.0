Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web12.3482.1615452563079314960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 00:49:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kdE0ymz/;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id j12so8023369vsm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 00:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JAh5GZikyJMfgFSSssJIrjGATMPE5VDOkNJT/N+oqP0=;
        b=kdE0ymz/D2zS+mhsRHkjIJPIQk1WzwcsThu11B3viABTNEjtWFJXborFzzcn5c4RrT
         UvfaYEvkPHCL1QXzjQgA/Q0xSqCRJj0joH19EpnsPQ5fKVt+KxJrhvbBJb3Nj9HDPHOS
         hMBiGe379uroulYIPQN7lzUTg1SCphhP60yRYI8G38EwBIxnp/KB96LvmXJjDioQIzF2
         w7bgteLNUK27FJCWXIvo2j2z+folMEUoSxZw3HHONrIHjOhTziStEQIUdocDaHJvfkMa
         KZBrZ0LvBr/Xfmz5QUfjjUL6CEFzhJi7ImA74NT8eEUB/aVIScAsBbMb1X3wmaWZdy/I
         kPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JAh5GZikyJMfgFSSssJIrjGATMPE5VDOkNJT/N+oqP0=;
        b=jdqcjDuQoiTEf/HhEdktYcKC8wsScyLxXSmE6wjFfiVj18vI8/8J8fldZhbziwa0QL
         zcciHRZCm9/9eUisDHDqYeRnFyHQmcGxzWK+jT+Pp/TXTEbdYrLkkJtJ7RJAwvxtaScC
         rDu0NhZHAgg2SijvOOFaADBmjR7BQW7vjDAniqHPZ0wa/PEKM0xAT/ek8WhDoSbzk3La
         Pv1J2vbAOZiy7NAMi8oNvpg+RTkQO3VQVVRaDYexSOSpZCCcPZyPdKchdvAfOvqThN1x
         blVTW28PHlIWp54cO2858ZbCkXvZppsZ5W9xFPhu56ilsR5q0uE+My09sgL626Nlxphx
         14/g==
X-Gm-Message-State: AOAM531TxrzAg0NludwU+Z+uyTFlGkgIkSL2Wf54CTq/fcwvac9gqnOL
	jGD0p5FDdJXgEc5DNwMcOMsXR7ZU9Z+wnjLc1d0=
X-Google-Smtp-Source: ABdhPJxd59+QBD8R8K1h4UEbOyBTEat/mFn+vbjSxAhIqc2X/v8Gpgh9AJsbML0lPJZ/WSpHjhosZbafJXRFEhs7tak=
X-Received: by 2002:a05:6102:74a:: with SMTP id v10mr4183854vsg.20.1615452562062;
 Thu, 11 Mar 2021 00:49:22 -0800 (PST)
MIME-Version: 1.0
References: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com> <CAMKF1somxbuSmVp+EH0jJeBseGZo2Ndk_c=T+wO+cKyJkLzqSw@mail.gmail.com>
In-Reply-To: <CAMKF1somxbuSmVp+EH0jJeBseGZo2Ndk_c=T+wO+cKyJkLzqSw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 11 Mar 2021 09:49:10 +0100
Message-ID: <CANNYZj-Cr0ym3gwp28QfOCjv+WY8bMNbPzhzSu-v8iEJMTnz-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] createrepo-c: upgrade 0.17.0 -> 0.17.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001d014705bd3edcfc"

--0000000000001d014705bd3edcfc
Content-Type: text/plain; charset="UTF-8"

Wang, please do use 'devtool upgrade' for version updates. That way you
will avoid patch fuzz problems, there will be help with rebasing patches,
and devtool will also write the license diffs into a recipe, which you can
then summarize into a commit message. I do not understand why you do these
updates by hand, with all the issues and extra work that brings.

Alex

On Thu, 11 Mar 2021 at 09:15, Khem Raj <raj.khem@gmail.com> wrote:

> seeing
>
> ERROR: createrepo-c-0.17.1-r0 do_patch: Fuzz detected:
>
> Applying patch 0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
> patching file src/python/CMakeLists.txt
> Hunk #1 succeeded at 14 with fuzz 1.
>
>
> The context lines in the patches can be updated with devtool:
>
>     devtool modify createrepo-c
>     devtool finish --force-patch-refresh createrepo-c <layer_path>
>
> Don't forget to review changes done by devtool!
>
> ERROR: createrepo-c-0.17.1-r0 do_patch: QA Issue: Patch log indicates
> that patches do not apply cleanly. [patch-fuzz]
>
> On Wed, Mar 10, 2021 at 3:47 AM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
> >
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  .../{createrepo-c_0.17.0.bb => createrepo-c_0.17.1.bb}          | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.0.bb =>
> createrepo-c_0.17.1.bb} (96%)
> >
> > diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
> b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.1.bb
> > similarity index 96%
> > rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
> > rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.1.bb
> > index e0433806b2..f621bff8a1 100644
> > --- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
> > +++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.1.bb
> > @@ -8,7 +8,7 @@ SRC_URI = "git://
> github.com/rpm-software-management/createrepo_c \
> >
>  file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
> >             "
> >
> > -SRCREV = "909a0636665ed96f97babc3b887f9badc88875c3"
> > +SRCREV = "956a318b427e2489ccac754d199a09d32690ddc3"
> >
> >  S = "${WORKDIR}/git"
> >
> > --
> > 2.25.1
> >
> >
> >
> >
>
> 
>
>

--0000000000001d014705bd3edcfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wang, please do use &#39;devtool upgrade&#39; for ver=
sion updates. That way you will avoid patch fuzz problems, there will be he=
lp with rebasing patches, and devtool will also write the license diffs int=
o a recipe, which you can then summarize into a commit message. I do not un=
derstand why you do these updates by hand, with all the issues and extra wo=
rk that brings.</div><div><br></div><div>Alex<br></div></div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 11 Mar 2021=
 at 09:15, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">seeing<br>
<br>
ERROR: createrepo-c-0.17.1-r0 do_patch: Fuzz detected:<br>
<br>
Applying patch 0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch<=
br>
patching file src/python/CMakeLists.txt<br>
Hunk #1 succeeded at 14 with fuzz 1.<br>
<br>
<br>
The context lines in the patches can be updated with devtool:<br>
<br>
=C2=A0 =C2=A0 devtool modify createrepo-c<br>
=C2=A0 =C2=A0 devtool finish --force-patch-refresh createrepo-c &lt;layer_=
path&gt;<br>
<br>
Don&#39;t forget to review changes done by devtool!<br>
<br>
ERROR: createrepo-c-0.17.1-r0 do_patch: QA Issue: Patch log indicates<br>
that patches do not apply cleanly. [patch-fuzz]<br>
<br>
On Wed, Mar 10, 2021 at 3:47 AM Wang Mingyu &lt;<a href=3D"mailto:wangmy@c=
n.fujitsu.com" target=3D"_blank">wangmy@cn.fujitsu.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.co=
m" target=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../{<a href=3D"http://createrepo-c_0.17.0.bb" rel=3D"noreferre=
r" target=3D"_blank">createrepo-c_0.17.0.bb</a> =3D&gt; <a href=3D"http://c=
reaterepo-c_0.17.1.bb" rel=3D"noreferrer" target=3D"_blank">createrepo-c_0.=
17.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/createrepo-c/{<a href=3D"http://cr=
eaterepo-c_0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">createrepo-c_0.1=
7.0.bb</a> =3D&gt; <a href=3D"http://createrepo-c_0.17.1.bb" rel=3D"norefer=
rer" target=3D"_blank">createrepo-c_0.17.1.bb</a>} (96%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/createrepo-c/<a href=3D"http://cre=
aterepo-c_0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">createrepo-c_0.17=
.0.bb</a> b/meta/recipes-devtools/createrepo-c/<a href=3D"http://createrepo=
-c_0.17.1.bb" rel=3D"noreferrer" target=3D"_blank">createrepo-c_0.17.1.bb</=
a><br>
&gt; similarity index 96%<br>
&gt; rename from meta/recipes-devtools/createrepo-c/<a href=3D"http://crea=
terepo-c_0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">createrepo-c_0.17.=
0.bb</a><br>
&gt; rename to meta/recipes-devtools/createrepo-c/<a href=3D"http://create=
repo-c_0.17.1.bb" rel=3D"noreferrer" target=3D"_blank">createrepo-c_0.17.1.=
bb</a><br>
&gt; index e0433806b2..f621bff8a1 100644<br>
&gt; --- a/meta/recipes-devtools/createrepo-c/<a href=3D"http://createrepo=
-c_0.17.0.bb" rel=3D"noreferrer" target=3D"_blank">createrepo-c_0.17.0.bb</=
a><br>
&gt; +++ b/meta/recipes-devtools/createrepo-c/<a href=3D"http://createrepo=
-c_0.17.1.bb" rel=3D"noreferrer" target=3D"_blank">createrepo-c_0.17.1.bb</=
a><br>
&gt; @@ -8,7 +8,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/=
rpm-software-management/createrepo_c" rel=3D"noreferrer" target=3D"_blank">=
github.com/rpm-software-management/createrepo_c</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-set=
-PYTHON_INSTALL_DIR-by-running-python.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -SRCREV =3D &quot;909a0636665ed96f97babc3b887f9badc88875c3&quot;<br>
&gt; +SRCREV =3D &quot;956a318b427e2489ccac754d199a09d32690ddc3&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000001d014705bd3edcfc--
