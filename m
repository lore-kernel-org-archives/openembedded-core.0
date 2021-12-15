Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BDEC433F5
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 14:55:26 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.41227.1639580125104751426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 06:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gejYtJ9Q;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id 107so1065687uaj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 06:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BO2ZgEST37rmWF1POkVVen2zwTY62dabe4Bhb6+rpRg=;
        b=gejYtJ9Q8broukL24jbbDpv1lPaLi4sfpnhgPnTvTx5ykPYNCJgfCLLOR6Tni95Kfv
         cOv1vcXW8labmLksaCjKr5fEzPFpssLWyLu+ecbS+nwRXwFXxvVeLI3/G2SpOUc8JYuC
         TbSg7ob5nJF6TAn5h22E9UpTKs+ouarFsqtSLfUtUKpwb1qxbLNVEF449BVs6gGTNeY0
         jzk7SU50AeHlpP7LFP8qxMP64xy9as5s2GMV73tEij8HVPNTKuIdNcsX30B/MfvMy+qR
         U6N/pjgdA3SiTXPhXCWvYXmTpignSm6MTfJeSRaom8ZbyzPm0sutonfKAIaSqmnbr+mX
         BefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BO2ZgEST37rmWF1POkVVen2zwTY62dabe4Bhb6+rpRg=;
        b=Mw+TSSaLFJQ0lv3kUZu4IHP7tuyO9GruJ3Q1iy0BBS/46j5ecSkQxFFlDwWA8gv7aE
         lb39YU5GSqwDYj9oDDfM4d1mp4cO3yETcTaqIt8e4iAyt9KegthSZsrRmzkgSc15AFT9
         jZziQJ3dWkMCXPW9HxGSLqdsg3I7FGYnJmf0VEWXR4KoAcs2apADYdEx33YeAlerucUF
         QJtxo7j03EKHtsBzpeFFLRuwcnafneDFuhjMo05+KMLfjFyrPCMAno9zBh9cQCa8CF6c
         Z7USTNAx9Bnu+5jfVKz0wLADVdWURNavZcq8z5PMQnW+3uu2MIQbENjFfLy8KbcEOilZ
         xiFg==
X-Gm-Message-State: AOAM533TqociLu+cBMJLhwEI2LDk1e9nzsAXzIOmTFngpjN6KH6lpjwC
	ixPdDCPm1fyni4AFaNA8+YO+5PcSkL+HBj5LGGFYBFn8Opw=
X-Google-Smtp-Source: 
 ABdhPJxKHGa8d+5kHbxgWWeGoI0K2iIja5oSzj3w3cM8b+oB0przlq+raMaaqu1B3KwY1k0zxndOh9jc716tGtHYmNc=
X-Received: by 2002:a67:efd5:: with SMTP id s21mr2916733vsp.73.1639580124163;
 Wed, 15 Dec 2021 06:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20211215100344.3266900-1-kweihmann@outlook.com>
 <16C0E58BF5CDEB84.23449@lists.openembedded.org>
 <AM9PR09MB4642F33198D3E8BC03E9B403A8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642F33198D3E8BC03E9B403A8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Dec 2021 15:55:12 +0100
Message-ID: 
 <CANNYZj8hgLO_BXC0zZO1mgS3U_arf=LcZ1GgRyceaqS7ZaiGKA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][RFC PATCH 2/2] insane: make patch
 upstream-status configurable
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000e1b13a05d3307ee4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 14:55:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159727

--000000000000e1b13a05d3307ee4
Content-Type: text/plain; charset="UTF-8"

I don't have any immediate objections :)

Alex

On Wed, 15 Dec 2021 at 11:06, Konrad Weihmann <kweihmann@outlook.com> wrote:

> Picking up where Alex left it last time, this proposes a different way
> to make the layers where the Upstream-Status check is run configurable.
>
> Please share your thoughs - esp. about the vardepsexclude, as I so far
> don't see any other option to get rid of the BBFILE_PATTERN creeping
> into the task hash
>
> On 15.12.21 11:03, Konrad Weihmann wrote:
> > instead of hard coding /meta/ into a skip condition introduce a
> > variable called QA_PATCH_CHECK_LAYER containing a space
> > separated list of layer names to perform the upstrem-status check
> > against.
> >
> > as this will add BBFILE_PATTERN_* and therefore host specific paths
> > to the task hash, we need to exclude do_qa_patch function from
> > task hashing.
> > As it is a postfunc it should run anyway, once do_patch needs to rerun
> >
> > Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> > ---
> >   meta/classes/insane.bbclass | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 240f3aad62..c19cc6f629 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -65,6 +65,8 @@ QA_EMPTY_DIRS ?= " \
> >   # message if the directory is not empty. If it is not specified for a
> directory,
> >   # then "but it is expected to be empty" will be used.
> >
> > +QA_PATCH_CHECK_LAYER ?= "core"
> > +
> >   def package_qa_clean_path(path, d, pkg=None):
> >       """
> >       Remove redundant paths from the path for display.  If pkg isn't
> set then
> > @@ -1171,12 +1173,15 @@ python do_qa_patch() {
> >       # Check if the patch contains a correctly formatted and spelled
> Upstream-Status
> >       import re
> >       from oe import patch
> > +    from oe.recipeutils import get_layer_name
> > +
> > +    check_layer = (d.getVar("QA_PATCH_CHECK_LAYER") or "").split()
> >
> >       for url in patch.src_patches(d):
> >          (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
> >
> > -       # skip patches not in oe-core
> > -       if '/meta/' not in fullpath:
> > +       # skip patches in all but the configured ones
> > +       if get_layer_name(fullpath, d) not in check_layer:
> >              continue
> >
> >          content = open(fullpath, encoding='utf-8',
> errors='ignore').read()
> > @@ -1298,6 +1303,7 @@ do_populate_sysroot[postfuncs] += "do_qa_staging "
> >
> >   # Check for patch fuzz
> >   do_patch[postfuncs] += "do_qa_patch "
> > +do_patch[vardepsexclude] += "do_qa_patch "
> >
> >   # Check broken config.log files, for packages requiring Gettext which
> >   # don't have it in DEPENDS.
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159718):
> https://lists.openembedded.org/g/openembedded-core/message/159718
> > Mute This Topic: https://lists.openembedded.org/mt/87741230/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kweihmann@outlook.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000e1b13a05d3307ee4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I don&#39;t have any immediate objections :)</div><di=
v><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 15 Dec 2021 at 11:06, Konrad Weihman=
n &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Picking=
 up where Alex left it last time, this proposes a different way <br>
to make the layers where the Upstream-Status check is run configurable.<br>
<br>
Please share your thoughs - esp. about the vardepsexclude, as I so far <br>
don&#39;t see any other option to get rid of the BBFILE_PATTERN creeping <b=
r>
into the task hash<br>
<br>
On 15.12.21 11:03, Konrad Weihmann wrote:<br>
&gt; instead of hard coding /meta/ into a skip condition introduce a<br>
&gt; variable called QA_PATCH_CHECK_LAYER containing a space<br>
&gt; separated list of layer names to perform the upstrem-status check<br>
&gt; against.<br>
&gt; <br>
&gt; as this will add BBFILE_PATTERN_* and therefore host specific paths<br=
>
&gt; to the task hash, we need to exclude do_qa_patch function from<br>
&gt; task hashing.<br>
&gt; As it is a postfunc it should run anyway, once do_patch needs to rerun=
<br>
&gt; <br>
&gt; Signed-off-by: Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook=
.com" target=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/insane.bbclass | 10 ++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass=
<br>
&gt; index 240f3aad62..c19cc6f629 100644<br>
&gt; --- a/meta/classes/insane.bbclass<br>
&gt; +++ b/meta/classes/insane.bbclass<br>
&gt; @@ -65,6 +65,8 @@ QA_EMPTY_DIRS ?=3D &quot; \<br>
&gt;=C2=A0 =C2=A0# message if the directory is not empty. If it is not spec=
ified for a directory,<br>
&gt;=C2=A0 =C2=A0# then &quot;but it is expected to be empty&quot; will be =
used.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +QA_PATCH_CHECK_LAYER ?=3D &quot;core&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0def package_qa_clean_path(path, d, pkg=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Remove redundant paths from the path for dis=
play.=C2=A0 If pkg isn&#39;t set then<br>
&gt; @@ -1171,12 +1173,15 @@ python do_qa_patch() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Check if the patch contains a correctly fo=
rmatted and spelled Upstream-Status<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0import re<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0from oe import patch<br>
&gt; +=C2=A0 =C2=A0 from oe.recipeutils import get_layer_name<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 check_layer =3D (d.getVar(&quot;QA_PATCH_CHECK_LAYER&qu=
ot;) or &quot;&quot;).split()<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for url in patch.src_patches(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_, _, fullpath, _, _, _) =3D bb.fet=
ch.decodeurl(url)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# skip patches not in oe-core<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;/meta/&#39; not in fullpath:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# skip patches in all but the configured o=
nes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if get_layer_name(fullpath, d) not in chec=
k_layer:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 content =3D open(fullpath, encoding=
=3D&#39;utf-8&#39;, errors=3D&#39;ignore&#39;).read()<br>
&gt; @@ -1298,6 +1303,7 @@ do_populate_sysroot[postfuncs] +=3D &quot;do_qa_=
staging &quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Check for patch fuzz<br>
&gt;=C2=A0 =C2=A0do_patch[postfuncs] +=3D &quot;do_qa_patch &quot;<br>
&gt; +do_patch[vardepsexclude] +=3D &quot;do_qa_patch &quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Check broken config.log files, for packages requiring Ge=
ttext which<br>
&gt;=C2=A0 =C2=A0# don&#39;t have it in DEPENDS.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#159718): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/159718" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/159718</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87741230=
/3647476" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/87741230/3647476</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div>

--000000000000e1b13a05d3307ee4--

