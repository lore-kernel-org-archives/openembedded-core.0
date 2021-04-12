Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.33883.1618239020796996482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 07:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=up13SpOd;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id c123so9131034qke.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=3Y22gmClpVDV+fRESU6QjSk2NRBVjAMsy9J8PqEyt7k=;
        b=up13SpOdoqn8Jvf0FzwixgtCTV2pmjOC7i3Qifwh8bGhmYjthXjIK9aH4moVC/MCwk
         TcDfjEIOgUvPIaS+7QztZShaesvxKivKUPZVUsAHHV0pcXZcI4xr1qBqAY9GVzPHM2R7
         d6fy4p61v2FgnrO2INwvN1JKgSvUeItpZ/0nRHrrov7nW+ar8keCRXYYLjwHBXXZTW/j
         3vo+8BA2KQdar7vxmSLG+3dEdka12TjM5SZUbHQoWnSSTzQggcj0I+CjDigi6+aunUW9
         THtMTBu5/ZXSXkqiPRBx8/lEXtkLnO6PfaQ48HKiGSRusdWruSC9akZ6mThxPftmK26T
         jJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=3Y22gmClpVDV+fRESU6QjSk2NRBVjAMsy9J8PqEyt7k=;
        b=FBIEvJ2jRfE5pa+Z59qNuiMb/1xJEL1uuwOsPGh3tg3xQv/SqCmFtJBUtD/OSDLESF
         It77XfXeBg1VzYMicMt8elhFJJtfbR5jiLJNEodkOBmdeGA+NF6luFTgBOwiYRgZHqVk
         L7BFAlK+DWNK9+sgdw8w9WjRbZ3g2rkCRjSBYD58m+INM6OvrRJH+s7ZYWbY1O+64pPb
         UYji4PBjcp1u8koHNDrWx2odMlcA5UlPsW/5Ie07xnmP9diM/brVMFvwtnt/faKuy7fX
         AKZaVwBaR3Lxy1Kmuivp/6Op0YQeonCWIfFbO7Nr9cuOkD3MO7EBD5M3sT9XrvJyay3H
         7RjA==
X-Gm-Message-State: AOAM532jIrnf6HHWV3Ci6SGu2jWYtF9clDXph+eUG2A+Qz0ZNzyR1Kui
	BcTxlUdAo2ryvqVO+iErX4mpCB/5SnBrUMJ4MKA=
X-Google-Smtp-Source: ABdhPJwVmaGmiEOQt6UtHnGtH5+NW+Ty2GdmUW83rpx1s4yxOwV3R8BhxwgUtkHJSBcIqs/fZqgxSAhki+KjhIMA3WU=
X-Received: by 2002:a37:8c4:: with SMTP id 187mr2464265qki.125.1618239019904;
 Mon, 12 Apr 2021 07:50:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a37:6f07:0:0:0:0:0 with HTTP; Mon, 12 Apr 2021 07:50:19
 -0700 (PDT)
In-Reply-To: <e1f15324-16c8-9ff8-2918-7766fce4e8c0@gmail.com>
References: <20210411154900.20331-1-akuster808@gmail.com> <CAMKF1so45P=eZyYuLr2SVwfYQscM81URUQR37urrmppPdKJLWg@mail.gmail.com>
 <e1f15324-16c8-9ff8-2918-7766fce4e8c0@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 12 Apr 2021 07:50:19 -0700
Message-ID: <CAMKF1sp0WbFsk6w_V2fSHZZfMpF_wSW31fpJS6kcMzENPae6FQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: rename BRANCH var
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f16fd305bfc7a119"

--000000000000f16fd305bfc7a119
Content-Type: text/plain; charset="UTF-8"

On Monday, April 12, 2021, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 4/11/21 11:03 AM, Khem Raj wrote:
> > On Sun, Apr 11, 2021 at 8:49 AM akuster <akuster808@gmail.com> wrote:
> >> If BRANCH is defined in local.conf then that name is used to d/l sources
> >> for binutils. You will get this error:
> >>
> >> Fetcher failure for URL: 'git://sourceware.org/git/
> binutils-gdb.git;branch=hardknott;protocol=git'. Unable to fetch URL from
> any source.
> >>
> >> Rename to SRCBRANCH like glibc has to avoid the more common variable
> name BRANCH.
> >>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>  meta/recipes-devtools/binutils/binutils-2.36.inc | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc
> b/meta/recipes-devtools/binutils/binutils-2.36.inc
> >> index 2968291889..f638f02e8f 100644
> >> --- a/meta/recipes-devtools/binutils/binutils-2.36.inc
> >> +++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
> >> @@ -19,13 +19,13 @@ def binutils_branch_version(d):
> >>  PV = "2.36.1"
> >>  CVE_VERSION = "2.36.1"
> >>  BINUPV = "${@binutils_branch_version(d)}"
> >> -#BRANCH = "binutils-${BINUPV}-branch"
> >> -BRANCH ?= "binutils-2_36-branch"
> >> +#SRCBRANCH = "binutils-${BINUPV}-branch"
> >> +SRCBRANCH ?= "binutils-2_36-branch"
> > if dropping to use BINUPV then lets drop setting this as well. Which
> > also means you can drop
> i wasn't the one who dropped BINUPV. Those were already commented out via
> b71294c4de binutils: Upgrade to binutils 2.32
>
>
> > binutils_branch_version as well which is fine with me.
>
> I can do V2 to clean that up.
>
>
That will be cool


> -armin
> >
> >>  UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
> >>
> >>  SRCREV ?= "7651a4871c225925ffdfda0a8c91a6ed370cd9a1"
> >> -BINUTILS_GIT_URI ?= "git://sourceware.org/git/
> binutils-gdb.git;branch=${BRANCH};protocol=git"
> >> +BINUTILS_GIT_URI ?= "git://sourceware.org/git/
> binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
> >>  SRC_URI = "\
> >>       ${BINUTILS_GIT_URI} \
> >>       file://0004-configure-widen-the-regexp-for-SH-architectures.patch
> \
> >> --
> >> 2.17.1
> >>
> >>
> >> 
> >>
>
>
>

--000000000000f16fd305bfc7a119
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, April 12, 2021, akuster808 &lt;<a href=3D"mailto:akuster=
808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><br>
<br>
On 4/11/21 11:03 AM, Khem Raj wrote:<br>
&gt; On Sun, Apr 11, 2021 at 8:49 AM akuster &lt;<a href=3D"mailto:akuster=
808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br>
&gt;&gt; If BRANCH is defined in local.conf then that name is used to d/l =
sources<br>
&gt;&gt; for binutils. You will get this error:<br>
&gt;&gt;<br>
&gt;&gt; Fetcher failure for URL: &#39;git://<a href=3D"http://sourceware.=
org/git/binutils-gdb.git;branch=3Dhardknott;protocol=3Dgit" target=3D"_blan=
k">sourceware.org/git/<wbr>binutils-gdb.git;branch=3D<wbr>hardknott;protoco=
l=3Dgit</a>&#39;. Unable to fetch URL from any source.<br>
&gt;&gt;<br>
&gt;&gt; Rename to SRCBRANCH like glibc has to avoid the more common varia=
ble name BRANCH.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmai=
l.com">akuster808@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/<wbr>binutils/binutils-2.36.inc | 6 +=
++---<br>
&gt;&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/<wbr>binutils/binutils-2.36.in=
c b/meta/recipes-devtools/<wbr>binutils/binutils-2.36.inc<br>
&gt;&gt; index 2968291889..f638f02e8f 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/<wbr>binutils/binutils-2.36.inc<br>
&gt;&gt; +++ b/meta/recipes-devtools/<wbr>binutils/binutils-2.36.inc<br>
&gt;&gt; @@ -19,13 +19,13 @@ def binutils_branch_version(d):<br>
&gt;&gt;=C2=A0 PV =3D &quot;2.36.1&quot;<br>
&gt;&gt;=C2=A0 CVE_VERSION =3D &quot;2.36.1&quot;<br>
&gt;&gt;=C2=A0 BINUPV =3D &quot;${@binutils_branch_version(d)<wbr>}&quot;<=
br>
&gt;&gt; -#BRANCH =3D &quot;binutils-${BINUPV}-branch&quot;<br>
&gt;&gt; -BRANCH ?=3D &quot;binutils-2_36-branch&quot;<br>
&gt;&gt; +#SRCBRANCH =3D &quot;binutils-${BINUPV}-branch&quot;<br>
&gt;&gt; +SRCBRANCH ?=3D &quot;binutils-2_36-branch&quot;<br>
&gt; if dropping to use BINUPV then lets drop setting this as well. Which<=
br>
&gt; also means you can drop<br>
i wasn&#39;t the one who dropped BINUPV. Those were already commented out =
via<br>
b71294c4de binutils: Upgrade to binutils 2.32<br>
<br>
<br>
&gt; binutils_branch_version as well which is fine with me.<br>
<br>
I can do V2 to clean that up.<br>
<br></blockquote><div><br></div><div>That will be cool</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
-armin<br>
&gt;<br>
&gt;&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;binutils-(?P&lt;pver&g=
t;\d+_(\d_?)*<wbr>)&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRCREV ?=3D &quot;<wbr>7651a4871c225925ffdfda0a8c91a6<wbr>e=
d370cd9a1&quot;<br>
&gt;&gt; -BINUTILS_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.o=
rg/git/binutils-gdb.git;branch=3D${BRANCH};protocol=3Dgit" target=3D"_blank=
">sourceware.org/git/<wbr>binutils-gdb.git;branch=3D${<wbr>BRANCH};protocol=
=
=3Dgit</a>&quot;<br>
&gt;&gt; +BINUTILS_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.o=
rg/git/binutils-gdb.git;branch=3D${SRCBRANCH};protocol=3Dgit" target=3D"_bl=
ank">sourceware.org/git/<wbr>binutils-gdb.git;branch=3D${<wbr>SRCBRANCH};pr=
otocol=3Dgit</a>&quot;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${BINUTILS_GIT_URI} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-configure-widen-<wbr>the-re=
gexp-for-SH-<wbr>architectures.patch \<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
<br>
</blockquote>

--000000000000f16fd305bfc7a119--
