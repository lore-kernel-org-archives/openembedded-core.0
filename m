Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A34C433F5
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 14:13:59 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web09.36314.1638022437693966689
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 06:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PbfiYtSE;
 spf=pass (domain: gmail.com, ip: 209.85.221.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id q21so7801017vkn.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 06:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vnvs6Kcw1rlAm32u9rvL2F/Z0v5w0jGNDwxempskiRA=;
        b=PbfiYtSE12zg9JkVu53dXnx0ikbgRPBgcBipJaanlMogyhC6gsOmrrzJxNBYEnam2d
         0qeDttR0jMCSlfr2dCbT1Cw171JD5psvdKOKYYDFZT/qQGGf6aV5fQIq89rpNCGuv0Nx
         fKvRA2yRAKahx/prdvj2G0VpyNZkRlmdrw74gGhsSYStoDPixhgt93erGnFBy3YOIMp/
         ujScBFIpTjcZMAmoKgwwVfjO397LvO1XKxiOC4HAydln8U/vF3HoI8lkfbPjxNG7NnB4
         qjdVnnXBXmfSrZ4YVUQp64h5EnIQVMcWB/0YEMRSsZp6fuzY5FPN8NkkGP5X8A4gIYkM
         7BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vnvs6Kcw1rlAm32u9rvL2F/Z0v5w0jGNDwxempskiRA=;
        b=Q5oDgDynNcioPTDjCMiOiV1Eeflhr5qmh76CThgeaWc5aOpg6tRPkiDNse99HwFIrw
         +edmaOfK6p/8jKFdryFrN398wP7evE1fzY4PxROZi1R8c3zfM+3wXmtM+o8vnWsYzxRB
         aO2heo+IqfvX3tIJVTb8d1EWRgQgcMfrHnx0ZYhdNr5cgaJ+3GfjrpoAHRCWQyfuZzql
         sJar6j5U5VZeneZg31aPDxyFFpRHGSFQ0fvXEELDWQ0wawHtjVn0GQhGKI7jaVDq7IOY
         A+ilxBWeF5/WkZlooHTMMSzHzsz7EdM2/KT02q34+gUI7jvhC2N3U9a8p8CrLE3eC1jp
         EzpA==
X-Gm-Message-State: AOAM533OXZBX+35nib5uBcQdEJDdcgMbTwfFtElCtVyS3OLdzbYJ9rEo
	3lXYRSBhayDOgI2Eq6H1bf8ynmtddtNzYZEi33E=
X-Google-Smtp-Source: 
 ABdhPJwpKP/RCHXSsabsZc6YCz+i9G3Ng/NlZREiNCs0WgXZRsYlbOKVgbKwYx6J2ICyn1n1gmvP00EQdVuTzO+hyjE=
X-Received: by 2002:a05:6122:c6f:: with SMTP id
 i47mr26207884vkr.20.1638022436667;
 Sat, 27 Nov 2021 06:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20211127095357.1748429-1-alex@linutronix.de>
 <20211127095357.1748429-2-alex@linutronix.de>
 <AM9PR09MB464286750F3CC4518BDC8BF0A8649@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB464286750F3CC4518BDC8BF0A8649@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Nov 2021 15:13:44 +0100
Message-ID: 
 <CANNYZj9hZvQgF6qQwM7ieTnqFrC47Nx3Q0R_bODhwPu1D1my4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/13] insane.bbclass: do not hardcode oe-core
 path in upstream-status check
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000078c3a605d1c5d10c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 14:13:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158864

--00000000000078c3a605d1c5d10c
Content-Type: text/plain; charset="UTF-8"

I would like to get RPs blessing for the patch as it is first, there were
concerns about state signatures (oe selftest is fine though).

Alex

On Sat 27. Nov 2021 at 12.01, Konrad Weihmann <kweihmann@outlook.com> wrote:

>
>
> On 27.11.21 10:53, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >   meta/classes/insane.bbclass | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 240f3aad62..8a47da5a09 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -1176,7 +1176,9 @@ python do_qa_patch() {
> >          (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
> >
> >          # skip patches not in oe-core
> > -       if '/meta/' not in fullpath:
>
> Last time my morning coffee didn't fully work, so let's try it again...
> What I would want to see (maybe in a followup patch) is to have the
> layers, where this check is performed, configurable (not just core), as
> I think also other people would want to make use of this very nice check.
>
> Maybe something like
>
> INSANE_PATCH_US_PATTERN ??= "BBFILE_PATTERN_core"
>
> and then
>
> match_oecore = any(re.search(re.compile(x), fullpath)) for x in
> (d.getVar('INSANE_PATCH_US_PATTERN' or '').split(" "))
>
> > +       oecore_re = re.compile(d.getVar('BBFILE_PATTERN_core'))
> > +       match_oecore = oecore_re.search(fullpath)
> > +       if not match_oecore:
> >              continue
> >
> >          content = open(fullpath, encoding='utf-8',
> errors='ignore').read()
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#158851):
> https://lists.openembedded.org/g/openembedded-core/message/158851
> > Mute This Topic: https://lists.openembedded.org/mt/87335190/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kweihmann@outlook.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000078c3a605d1c5d10c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I would like to get RPs blessing for the patch as it is f=
irst, there were concerns about state signatures (oe selftest is fine thoug=
h).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 27. =
Nov 2021 at 12.01, Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.=
com">kweihmann@outlook.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
<br>
On 27.11.21 10:53, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/insane.bbclass | 4 +++-<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass=
<br>
&gt; index 240f3aad62..8a47da5a09 100644<br>
&gt; --- a/meta/classes/insane.bbclass<br>
&gt; +++ b/meta/classes/insane.bbclass<br>
&gt; @@ -1176,7 +1176,9 @@ python do_qa_patch() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_, _, fullpath, _, _, _) =3D bb.fet=
ch.decodeurl(url)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # skip patches not in oe-core<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;/meta/&#39; not in fullpath:<br>
<br>
Last time my morning coffee didn&#39;t fully work, so let&#39;s try it agai=
n...<br>
What I would want to see (maybe in a followup patch) is to have the <br>
layers, where this check is performed, configurable (not just core), as <br=
>
I think also other people would want to make use of this very nice check.<b=
r>
<br>
Maybe something like<br>
<br>
INSANE_PATCH_US_PATTERN ??=3D &quot;BBFILE_PATTERN_core&quot;<br>
<br>
and then<br>
<br>
match_oecore =3D any(re.search(re.compile(x), fullpath)) for x in <br>
(d.getVar(&#39;INSANE_PATCH_US_PATTERN&#39; or &#39;&#39;).split(&quot; &qu=
ot;))<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0oecore_re =3D re.compile(d.getVar(&#39;BBF=
ILE_PATTERN_core&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0match_oecore =3D oecore_re.search(fullpath=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if not match_oecore:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 content =3D open(fullpath, encoding=
=3D&#39;utf-8&#39;, errors=3D&#39;ignore&#39;).read()<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#158851): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/158851" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/158851</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87335190=
/3647476" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/87335190/3647476</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--00000000000078c3a605d1c5d10c--

