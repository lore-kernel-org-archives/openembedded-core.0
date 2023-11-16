Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DEBC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:47:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.20230.1700174819950909611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z4jKNJ28;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4084095722aso11095445e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174818; x=1700779618; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/WIlQfdmL02WwFFLiZp5LI7jOGhLT45f5TRqnkEO5g=;
        b=Z4jKNJ28Pd5I1v9jBqAXo+9mtXm2APwUR/0JwWNjlvye2DAfSmv4MvmBTdV7qYNvwa
         CB8h+GeAy/dIjAjNCi2aPXeFkniwvoXznKv53COvoLK611ZEFQ6Vmk4qVg5QgDCuJdTb
         dBYnYfAZxeDR4nRgxBPmzUGUhCr6RVvSUyvYF1RrEXSOLeLA8NYU2QqL77jL2MK7rITx
         k6ixg5X90Kw0SsJ3Qqu2EbU0miu5wVL+Xfe0cBSJwQ0GPhnTqmpn+/IgbcjpsNqa91Me
         LyVYKzvZiRqYNGbw+ukbsgHyzET5zmROIY1Ki94uDlaaLT5TYri2SODMe+fWTJFGBduG
         nqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174818; x=1700779618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/WIlQfdmL02WwFFLiZp5LI7jOGhLT45f5TRqnkEO5g=;
        b=K8EqBsBhKsaWd2mX12y/mTJFGu9avNkVmfq+VEiMLODWHcYDAjKlSwkJTqvNMGBDCN
         p5eq/SkASDWkCp/j9YikqPGtmFVD4SyYUXJmaHiQwoVGrz4jPmZu5mu+LePQfCazjAL4
         3lkE8V+7192I/TJDPGUVWHVBsGFnjVIUfKhxj0F8f4v6q13nzWSYRETkbnR77tdjDrry
         0y4Fy3g5bGaO11VaUXrh1jDjkdoinX7SrRzFFarNRInMR+m3HiFNuXO5v/BlRMUs6Eow
         8I/hcIArerMENiaMkBVH2JD40ZfrlCmS94Cs8pQyfv6DETL7Zoih+bO78Y6vno6c+Aqn
         rrXA==
X-Gm-Message-State: AOJu0YzPrHwUKAc1qOjY+hOWcAFiZqihzislnSziD8rVvv3tHJsiIuop
	KNgPFcj1Nxs9dpbQnEA38fqIpWd7+q/d1UMGEFA=
X-Google-Smtp-Source: AGHT+IFjKx4tvnzhuCWRQWv8fJzdweaX4VFIx/xU9ojFPbuyXzcCMHlq/pCKZ5apkDi7FnV5joisg/U9fbVwBl2eqe4=
X-Received: by 2002:adf:f241:0:b0:32f:7cba:6815 with SMTP id
 b1-20020adff241000000b0032f7cba6815mr11260369wrp.61.1700174817952; Thu, 16
 Nov 2023 14:46:57 -0800 (PST)
MIME-Version: 1.0
References: <20231116073650.2710535-1-martin.jansa@gmail.com> <CAMKF1spKx_S3ORqC-Tek+DErRt1uwtybD2cja1eE+cnTpc53oA@mail.gmail.com>
In-Reply-To: <CAMKF1spKx_S3ORqC-Tek+DErRt1uwtybD2cja1eE+cnTpc53oA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Nov 2023 23:46:46 +0100
Message-ID: <CA+chaQd_ERfEp2Jr+MEijdoGUjbHuZ+6-KvXuC1WPVVhOmo8ig@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3 01/11] bitbake.conf: drop ${PE} and ${PR} from -f{file,macro,debug}-prefix-map
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001487e5060a4ccc5d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190814

--0000000000001487e5060a4ccc5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 8:44=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> On Wed, Nov 15, 2023 at 11:36=E2=80=AFPM Martin Jansa <martin.jansa@gmail=
.com>
> wrote:
> >
> > * ${EXTENDPE} and ${PR} was already dropped from ${WORKDIR} in:
> >   https://lists.openembedded.org/g/openembedded-core/message/185818
> >   adjust -fmacro-prefix-map and -fdebug-prefix-map similarly.
> >   As we don't depend on PR in WORKDIR maybe we don't need it in
> >   /usr/src/debug paths as well anymore.
> >
> > * The interesting side-effect of this is that for DISTROs which still
> >   use PR (e.g. webOS OSE), the difference in -fdebug-prefix-map causes
> >   all binaries to be slightly different when rebuilt with different PR
> >   (due to this path, even when otherwise they are binary reproducible)
> >   and when the number of digits in PR changes (e.g. from r9 to r10) it
> >   also results in slightly bigger binaries (and more unnecessary change=
s
> >   in buildhistory diffs).
> >
>
> these paths are for binary outputs unlike workdir, this change would mean=
s
> we
> have same path to install debug info on targets which might not match
> to installed
> binaries Can you check if these paths are matching while debugging on
> target ?
>

I did run the selftest with this included and it doesn't show any new
issues.

In a image built with IMAGE_FEATURES:append =3D " dev-pkgs dbg-pkgs src-pkg=
s"
and checked that there are no dirs with ${PR} anymore:
ls usr/src/debug/*/*-r*
and the paths in rootfs-dbg from IMAGE_GEN_DEBUGFS uses the same paths.

I also have 8 commits for meta-oe recipes to adjust for this.

Cheers,



> >   For example this foo binary, the difference between "new" and "old" i=
s
> >   extra patch applied in SRC_URI (which doesn't affect the foo binary,
> >   but was the reason for PR bump).
> >
> >   And the binary is bigger with r10, identical with r6 and slightly
> >   different due to debug-prefix-map between r6 and r7:
> >
> >   $ ls -la 1.0.0-175-*/image/usr/sbin/foo
> >   -rwxr-xr-x 1 bitbake bitbake 30182460 Nov  8 08:29
> 1.0.0-175-new-r10/image/usr/sbin/foo
> >   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 08:02
> 1.0.0-175-new-r6/image/usr/sbin/foo
> >   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:49
> 1.0.0-175-new-r7/image/usr/sbin/foo
> >   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:39
> 1.0.0-175-old-r6/image/usr/sbin/foo
> >
> >   $ md5sum 1.0.0-175-*/image/usr/sbin/foo
> >   8e3ab67d596f8cc2f9c6320dab10af01  1.0.0-175-new-r10/image/usr/sbin/fo=
o
> >   f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-new-r6/image/usr/sbin/foo
> >   6469a0b10aac233911e63c5ea97b03c0  1.0.0-175-new-r7/image/usr/sbin/foo
> >   f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-old-r6/image/usr/sbin/foo
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> > v3: added additional fix for perf (and changes in other recipes were
> moved to separate commits)
> >
> >  meta/conf/bitbake.conf | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 67ff769046..3836a389b8 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -648,10 +648,10 @@ EXTRA_OEMAKE:prepend:task-install =3D
> "${PARALLEL_MAKEINST} "
> >  ##################################################################
> >  # Beware: applied last to first
> >  DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> > - -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> > - -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> > - -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> > - -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> > + -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \
> > + -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \
> > + -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \
> > + -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \
> >   -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> >   -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
> >   -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> > --
> > 2.42.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#190753):
> https://lists.openembedded.org/g/openembedded-core/message/190753
> > Mute This Topic: https://lists.openembedded.org/mt/102623139/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000001487e5060a4ccc5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 16, 2023 at 8:44=E2=80=AF=
PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Wed, Nov 15, 2023 at 11:36=E2=80=AFPM Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; * ${EXTENDPE} and ${PR} was already dropped from ${WORKDIR} in:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-c=
ore/message/185818" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/g/openembedded-core/message/185818</a><br>
&gt;=C2=A0 =C2=A0adjust -fmacro-prefix-map and -fdebug-prefix-map similarly=
.<br>
&gt;=C2=A0 =C2=A0As we don&#39;t depend on PR in WORKDIR maybe we don&#39;t=
 need it in<br>
&gt;=C2=A0 =C2=A0/usr/src/debug paths as well anymore.<br>
&gt;<br>
&gt; * The interesting side-effect of this is that for DISTROs which still<=
br>
&gt;=C2=A0 =C2=A0use PR (e.g. webOS OSE), the difference in -fdebug-prefix-=
map causes<br>
&gt;=C2=A0 =C2=A0all binaries to be slightly different when rebuilt with di=
fferent PR<br>
&gt;=C2=A0 =C2=A0(due to this path, even when otherwise they are binary rep=
roducible)<br>
&gt;=C2=A0 =C2=A0and when the number of digits in PR changes (e.g. from r9 =
to r10) it<br>
&gt;=C2=A0 =C2=A0also results in slightly bigger binaries (and more unneces=
sary changes<br>
&gt;=C2=A0 =C2=A0in buildhistory diffs).<br>
&gt;<br>
<br>
these paths are for binary outputs unlike workdir, this change would means =
we<br>
have same path to install debug info on targets which might not match<br>
to installed<br>
binaries Can you check if these paths are matching while debugging on targe=
t ?<br></blockquote><div><br></div><div>I did run the selftest with this in=
cluded and it doesn&#39;t show any new issues.</div><div><br></div><div>In =
a image built with=C2=A0IMAGE_FEATURES:append =3D &quot; dev-pkgs dbg-pkgs =
src-pkgs&quot; and checked that there are no dirs with ${PR} anymore:</div>=
<div>ls usr/src/debug/*/*-r*</div><div>and the paths in=C2=A0rootfs-dbg fro=
m=C2=A0IMAGE_GEN_DEBUGFS uses the same paths.</div><div><br></div><div>I al=
so have 8 commits for meta-oe recipes to adjust for this.</div><div><br></d=
iv><div>Cheers,</div><div><br></div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0For example this foo binary, the difference between &quot;=
new&quot; and &quot;old&quot; is<br>
&gt;=C2=A0 =C2=A0extra patch applied in SRC_URI (which doesn&#39;t affect t=
he foo binary,<br>
&gt;=C2=A0 =C2=A0but was the reason for PR bump).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0And the binary is bigger with r10, identical with r6 and s=
lightly<br>
&gt;=C2=A0 =C2=A0different due to debug-prefix-map between r6 and r7:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0$ ls -la 1.0.0-175-*/image/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A0-rwxr-xr-x 1 bitbake bitbake 30182460 Nov=C2=A0 8 08:29 1.=
0.0-175-new-r10/image/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A0-rwxr-xr-x 1 bitbake bitbake 30182224 Nov=C2=A0 8 08:02 1.=
0.0-175-new-r6/image/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A0-rwxr-xr-x 1 bitbake bitbake 30182224 Nov=C2=A0 8 07:49 1.=
0.0-175-new-r7/image/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A0-rwxr-xr-x 1 bitbake bitbake 30182224 Nov=C2=A0 8 07:39 1.=
0.0-175-old-r6/image/usr/sbin/foo<br>
&gt;<br>
&gt;=C2=A0 =C2=A0$ md5sum 1.0.0-175-*/image/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A08e3ab67d596f8cc2f9c6320dab10af01=C2=A0 1.0.0-175-new-r10/i=
mage/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A0f6ff1e64fe6affb9ba0d8f278cf7ed79=C2=A0 1.0.0-175-new-r6/im=
age/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A06469a0b10aac233911e63c5ea97b03c0=C2=A0 1.0.0-175-new-r7/im=
age/usr/sbin/foo<br>
&gt;=C2=A0 =C2=A0f6ff1e64fe6affb9ba0d8f278cf7ed79=C2=A0 1.0.0-175-old-r6/im=
age/usr/sbin/foo<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v3: added additional fix for perf (and changes in other recipes were m=
oved to separate commits)<br>
&gt;<br>
&gt;=C2=A0 meta/conf/bitbake.conf | 8 ++++----<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 67ff769046..3836a389b8 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -648,10 +648,10 @@ EXTRA_OEMAKE:prepend:task-install =3D &quot;${PA=
RALLEL_MAKEINST} &quot;<br>
&gt;=C2=A0 ################################################################=
##<br>
&gt;=C2=A0 # Beware: applied last to first<br>
&gt;=C2=A0 DEBUG_PREFIX_MAP ?=3D &quot;-fcanon-prefix-map \<br>
&gt; - -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \<br>
&gt; - -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \<br>
&gt; - -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \<br>
&gt; - -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \<br>
&gt; + -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \<br>
&gt; + -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \<br>
&gt; + -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \<br>
&gt; + -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \<br>
&gt;=C2=A0 =C2=A0-fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt;=C2=A0 =C2=A0-fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt;=C2=A0 =C2=A0-fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
&gt; --<br>
&gt; 2.42.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#190753): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/190753" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/190753</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10262313=
9/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/102623139/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000001487e5060a4ccc5d--

