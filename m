Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB3FC48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 16:06:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.26512.1706889987681884358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 08:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mdhq99oa;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40fc549ab9bso7815565e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 08:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706889986; x=1707494786; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HQGJZ90HKJRA5GiOF1hDZOmMj/hp9MmXkPjZ33EaZmI=;
        b=Mdhq99oayqRYgREyOjZqwjP/aZWuZOr+9I/Izl3ziExoS/Voo8oq3x0J7zDtAu2OjK
         iI7gpTINvhj9m17KRQqrFXFFJNsPvwi6J/UxhibskVcimelLx7myKIiW2dqJh+aao9xW
         HWgImszcxaKVdixmv2huKMrJYhr52Vv98htef+UKLynFzo2yK4nCVeHbSJJTeuckwDTD
         dD+Y1pJAzEO9tZ/SbnXyZtkuxBNpZkJ3E8zgKBgOwYXg42YcZpqAoCJBhnMnYTENzRTR
         Vjh8Gx0K/hdxa7ZhlQUxMCLtl+5WJFa8Ty5LVlYGTPcLoa4dYmhxcadxX11bToZgzLCE
         jrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706889986; x=1707494786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQGJZ90HKJRA5GiOF1hDZOmMj/hp9MmXkPjZ33EaZmI=;
        b=Et1cQ/VwUw+nBkBDxW/5GsKnl/cXr7F7rS2DbQGmHqwAfhprkH5VGgqSmgHEmb3p8F
         CRlSHlTyyxBcdcBVKwfI4ptWowo/x19S9vPqiu+Xwh7dse/AXeXDNMv1Vn949nZJINJ7
         EnTeE+NgwndnKU3CMhfWE/ZiOOBtuMLmQaCBfqcZ/tn72Amhw2G/rPG86bt0QmMuKys5
         JKM63FOyfLIGcVXA12aYxtiObk5DJ2oZbk/+g70KBgtovVGp6rmxI5ggpE+XwBpIv9ng
         lpJg+7iqRWI9DAEicXnMITfPnc+nwhONxSqzTjMkidCK/gcS4HKAgOYnAPt70E1K9ZRc
         ncGA==
X-Gm-Message-State: AOJu0YxexhHk2/m3Eb1xhozKLHpen6qJKKDXIsw6m8sAxp44/oH/zCDT
	K7hjfC6mE3u8pQ07maIdiytO+Z+un1Ffg759huWGeB183sly6wB+SAVahrZL1S92sHUwAdUn0KU
	CPihpKyCQ+n9fU7BEAjY1Ak5lsAs=
X-Google-Smtp-Source: AGHT+IFrufazy8EXLhaEWL1Q++yHwIRaRy9BkPCfM2h8uKNcSDe5d7a7Eb5FkidaLH4FVFtmRA4ur1wovuy9p/44dy0=
X-Received: by 2002:a05:600c:3b1d:b0:40e:fc29:f527 with SMTP id
 m29-20020a05600c3b1d00b0040efc29f527mr1914261wms.31.1706889985862; Fri, 02
 Feb 2024 08:06:25 -0800 (PST)
MIME-Version: 1.0
References: <20240202132434.1787053-1-martin.jansa@gmail.com> <baca486f-589d-4246-8cbf-d42ee8dcc7ec@ni.com>
In-Reply-To: <baca486f-589d-4246-8cbf-d42ee8dcc7ec@ni.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 2 Feb 2024 17:06:12 +0100
Message-ID: <CA+chaQeksKOt81g0egdANw4r6r7uP9PqVSkVz29ftUL4vmpobw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] package_manager: ipk: add
 OPKG_MAKE_INDEX_EXTRA_PARAMS variable
To: Alex Stewart <alex.stewart@ni.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004730e30610684bcc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 16:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194806

--0000000000004730e30610684bcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alex: thanks for review

I'll send v2 shortly, because now while testing without this variable set
at all it fails with:
opkg-make-index: error: unrecognized arguments: None
so will add weak assignment to empty before the use.

On Fri, Feb 2, 2024 at 4:40=E2=80=AFPM Alex Stewart <alex.stewart@ni.com> w=
rote:

> ACK from me.
>
> It's a little strange that we wouldn't just have a
> PACKAGE_FEED_PRESERVE_USER_FIELDS variable. But I understand that
> wouldn't work as well for how the RPM version of this parameter is define=
d.
>
> On 2/2/24 08:24, Martin Jansa via lists.openembedded.org wrote:
> > * can be used to pass e.g. -f param to preserve user-defined fields
> >    in the index as added in:
> >
> https://git.yoctoproject.org/opkg-utils/commit/opkg-make-index?id=3D13f62=
81d24e17199e0fef6c2984419372ea0f86f
> >
> > * otherwise it will show a lot of messages like:
> >    "Lost field Author <value>"
> >    for every package in the feed
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >   meta/lib/oe/package_manager/ipk/__init__.py | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/lib/oe/package_manager/ipk/__init__.py
> b/meta/lib/oe/package_manager/ipk/__init__.py
> > index 8fcbad56aa..c35c90ce42 100644
> > --- a/meta/lib/oe/package_manager/ipk/__init__.py
> > +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> > @@ -16,6 +16,7 @@ class OpkgIndexer(Indexer):
> >                        ]
> >
> >           opkg_index_cmd =3D bb.utils.which(os.getenv('PATH'),
> "opkg-make-index")
> > +        opkg_index_cmd_extra_params =3D
> self.d.getVar('OPKG_MAKE_INDEX_EXTRA_PARAMS')
> >           if self.d.getVar('PACKAGE_FEED_SIGN') =3D=3D '1':
> >               signer =3D get_signer(self.d,
> self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
> >           else:
> > @@ -41,8 +42,8 @@ class OpkgIndexer(Indexer):
> >                   if not os.path.exists(pkgs_file):
> >                       open(pkgs_file, "w").close()
> >
> > -                index_cmds.add('%s --checksum md5 --checksum sha256 -r
> %s -p %s -m %s' %
> > -                                  (opkg_index_cmd, pkgs_file,
> pkgs_file, pkgs_dir))
> > +                index_cmds.add('%s --checksum md5 --checksum sha256 -r
> %s -p %s -m %s %s' %
> > +                                  (opkg_index_cmd, pkgs_file,
> pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))
> >
> >                   index_sign_files.add(pkgs_file)
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194795):
> https://lists.openembedded.org/g/openembedded-core/message/194795
> > Mute This Topic: https://lists.openembedded.org/mt/104118971/3616788
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.stewart@ni.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Alex Stewart
> Software Engineer - NI Real-Time OS
> NI (National Instruments)
>
> alex.stewart@ni.com
>
>

--0000000000004730e30610684bcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Alex: thanks for review<div><br></div><div>I&#39;ll send v=
2 shortly, because now while testing without this variable set at all it fa=
ils with:</div><div>opkg-make-index: error: unrecognized arguments: None<br=
></div><div>so will add weak assignment to empty before the use.</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, Feb 2, 2024 at 4:40=E2=80=AFPM Alex Stewart &lt;<a href=3D"mailto:alex.s=
tewart@ni.com">alex.stewart@ni.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">ACK from me.<br>
<br>
It&#39;s a little strange that we wouldn&#39;t just have a <br>
PACKAGE_FEED_PRESERVE_USER_FIELDS variable. But I understand that <br>
wouldn&#39;t work as well for how the RPM version of this parameter is defi=
ned.<br>
<br>
On 2/2/24 08:24, Martin Jansa via <a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; * can be used to pass e.g. -f param to preserve user-defined fields<br=
>
&gt;=C2=A0 =C2=A0 in the index as added in:<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://git.yoctoproject.org/opkg-utils/commit=
/opkg-make-index?id=3D13f6281d24e17199e0fef6c2984419372ea0f86f" rel=3D"nore=
ferrer" target=3D"_blank">https://git.yoctoproject.org/opkg-utils/commit/op=
kg-make-index?id=3D13f6281d24e17199e0fef6c2984419372ea0f86f</a><br>
&gt;<br>
&gt; * otherwise it will show a lot of messages like:<br>
&gt;=C2=A0 =C2=A0 &quot;Lost field Author &lt;value&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 for every package in the feed<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/lib/oe/package_manager/ipk/__init__.py | 5 +++--<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe=
/package_manager/ipk/__init__.py<br>
&gt; index 8fcbad56aa..c35c90ce42 100644<br>
&gt; --- a/meta/lib/oe/package_manager/ipk/__init__.py<br>
&gt; +++ b/meta/lib/oe/package_manager/ipk/__init__.py<br>
&gt; @@ -16,6 +16,7 @@ class OpkgIndexer(Indexer):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ]<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opkg_index_cmd =3D bb.utils.wh=
ich(os.getenv(&#39;PATH&#39;), &quot;opkg-make-index&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 opkg_index_cmd_extra_params =3D self.d.ge=
tVar(&#39;OPKG_MAKE_INDEX_EXTRA_PARAMS&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.d.getVar(&#39;PACKAGE_=
FEED_SIGN&#39;) =3D=3D &#39;1&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signer =3D get_s=
igner(self.d, self.d.getVar(&#39;PACKAGE_FEED_GPG_BACKEND&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; @@ -41,8 +42,8 @@ class OpkgIndexer(Indexer):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 not os.path.exists(pkgs_file):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0open(pkgs_file, &quot;w&quot;).close()<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index_cmds.ad=
d(&#39;%s --checksum md5 --checksum sha256 -r %s -p %s -m %s&#39; %<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (opkg_index_cmd, pkgs_fil=
e, pkgs_file, pkgs_dir))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index_cmds.ad=
d(&#39;%s --checksum md5 --checksum sha256 -r %s -p %s -m %s %s&#39; %<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (opkg_index_cmd, pkgs_fil=
e, pkgs_file, pkgs_dir, opkg_index_cmd_extra_params))<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
dex_sign_files.add(pkgs_file)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#194795): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/194795" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/194795</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10411897=
1/3616788" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/104118971/3616788</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.stewart@ni.com" =
target=3D"_blank">alex.stewart@ni.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
-- <br>
Alex Stewart<br>
Software Engineer - NI Real-Time OS<br>
NI (National Instruments)<br>
<br>
<a href=3D"mailto:alex.stewart@ni.com" target=3D"_blank">alex.stewart@ni.co=
m</a><br>
<br>
</blockquote></div>

--0000000000004730e30610684bcc--

