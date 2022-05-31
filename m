Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B66C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 19:01:40 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.1818.1654023690364985563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 12:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WbCvi967;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id ew15so3229320qtb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 12:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AKzzopMkwvmbwMNEg9M3Nw44ScXKeapXBjL6fFCIsM0=;
        b=WbCvi967xEfanaXpMKyBdIXtXh8oMCMwajYtXXoRj9joDCeCpF+jREix/+jHl6Nx4v
         oZzNW5EaVXYOZQwzTXtBPk9GLEN8NItjy88Xjjpv5cXNUn9y38NIT89XTJDUd4p3lThS
         vIP44+5wQp7cAJTJIcJfY8Hh7GmjVMYnxznM2JjPGHbAu5XQS0lDef5aiKTXWwrd5Zso
         3jTtPNfm4CuT4Ul9AJz3S+spAxP/7T00DxYa+r10j/BSjeb+1Do13aIFa639wmRhLEJb
         1t1xGAbr5MqEj+LN8LnjnbBJ/IiQBqfAAgfKGXWG1udLs6eN4JNZPwmbJ70fbXW3a6hr
         yscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AKzzopMkwvmbwMNEg9M3Nw44ScXKeapXBjL6fFCIsM0=;
        b=k5Aa5kwvdaEIoutbFF1Uh4FAUumVDJ3EV4iH8zv1v1z+7PK2yZhDxhfjNtVhUaveCm
         OmKwH8h+oJ/lAc4YcDVxSNxzzcBz2gYmXWpuCbYtFE5RbSDbxQkwdoeM/Q5TiAlvbOdH
         eNXTRAmYLy+I+PtvnXKVh43EoAXPZqCscMHM88L+d8h6XDuA584k+CqHCmDepsuVlb7X
         DszGWNno3KA+sCnCvJj38gSJfBCfU2TPGWGNaH2Sit9tF1si6lfOc5CvGM/rtkuhR4V4
         PDPTCPgo7mo7RPe4v6r2z4n0/b0zN41ZubatjRd9td2g1ufOiGtzwCFS12jj+82y3ICv
         MmXg==
X-Gm-Message-State: AOAM5332dzhazYz22eGXKiGKZBHPc65lAzmgyCI6FAdAFf4EPwtPm8Tw
	YU4QbQcB82gvmofaSDYY6TIVKPMr7xfDJ26eC54=
X-Google-Smtp-Source: 
 ABdhPJzJ5oEYW0/tikx+FdkjpCPOfkUTSrr345aHIvGtfkg+cyH5H9TI9WpovWHuzh0jQJYEbjALL9R54CLSF5FSPnA=
X-Received: by 2002:ac8:5a86:0:b0:303:fba5:ed5e with SMTP id
 c6-20020ac85a86000000b00303fba5ed5emr9668416qtc.330.1654023689018; Tue, 31
 May 2022 12:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220531155704.682685-1-marcel@ziswiler.com>
 <CAMKF1so133M+wX7a8QPBLoyYsyz7R7SS4fOJJY9ZRRp=q=Gm7g@mail.gmail.com>
 <7d8e033f-0066-a403-f084-988bec763a75@berginkonsult.se>
In-Reply-To: <7d8e033f-0066-a403-f084-988bec763a75@berginkonsult.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 May 2022 12:01:18 -0700
Message-ID: 
 <CAMKF1srYNVRO51=-Q0HQFpTmrQT_031nJiUjNd2z3C==dw=TkA@mail.gmail.com>
Subject: Re: [oe-core][PATCH v2] libavtp: add recipe to be able to use aaf
 config for alsa-plugins
To: Peter Bergin <peter@berginkonsult.se>
Cc: Marcel Ziswiler <marcel@ziswiler.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006f1f8605e05366e5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 19:01:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166327

--0000000000006f1f8605e05366e5
Content-Type: text/plain; charset="UTF-8"

Maybe call the recipe avtp

On Tue, May 31, 2022 at 11:36 AM Peter Bergin <peter@berginkonsult.se>
wrote:

> Hi,
>
> thanks Marcel for bumping this patch again!
>
> On 2022-05-31 18:38, Khem Raj wrote:
> > On Tue, May 31, 2022 at 8:57 AM Marcel Ziswiler <marcel@ziswiler.com>
> wrote:
> >> From: Peter Bergin <peter@berginkonsult.se>
> >>
> >> In order to enable configuration option aaf (AVTP Audio Format)
> >> used for AVB the library libavtp is a dependency but no recipe for
> >> this library was present. aaf support for alsa-plugins was
> >> introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
> >>
> >> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> >> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> >>
> >> ---
> >> Resurrect from mailing list [1] as this is still not upstream.
> >> End-to-end tested on Verdin iMX8M Plus.
> >> Will talk about it at the Embedded World in the TSN & Linux track next
> >> month [2].
> >>
> >> [1]
> https://lore.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.se/
> >> [2]
> https://events.weka-fachmedien.de/embedded-world-conference/program/
> >>
> >> Changes in v2:
> >> - Updated SRC_URI specifying mandatory protocol as https.
> >> - Updated SRCREV to latest.
> >>
> >>   meta/recipes-multimedia/libavtp/libavtp_git.bb | 16 ++++++++++++++++
> > There was a 0.2.0 release
> https://github.com/Avnu/libavtp/releases/tag/v0.2.0
> > so I wonder if we should use the release tagged SRC_URI and call the PV
> = 0.2.0
> This tag was set after I sent my initial patch. I think this is a good
> thing to do.
> >
> >>   1 file changed, 16 insertions(+)
> >>   create mode 100644 meta/recipes-multimedia/libavtp/libavtp_git.bb
> >>
> >> diff --git a/meta/recipes-multimedia/libavtp/libavtp_git.bb
> b/meta/recipes-multimedia/libavtp/libavtp_git.bb
> >> new file mode 100644
> >> index 0000000000..aefbee56ea
> >> --- /dev/null
> >> +++ b/meta/recipes-multimedia/libavtp/libavtp_git.bb
> >> @@ -0,0 +1,16 @@
> >> +DESCRIPTION = "Open source implementation of Audio Video Transport
> Protocol (AVTP) \
> >> +               specified in IEEE 1722-2016 spec."
> >> +HOMEPAGE = "https://github.com/Avnu/libavtp"
> >> +LICENSE = "BSD-3-Clause"
> >> +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=7fcb4331e23e45e171cd5693c1ff7d3e"
> >> +
> >> +PROVIDES = "avtp"
> > why is this provides needed ?
>
> It is because recipe meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
> has this PACKAGECONFIG:
>
>    PACKAGECONFIG[aaf] = "--enable-aaf,--disable-aaf,avtp"
>
> So either this PROVIDES or also change PACKAGECONFIG for alsa-plugins?
>
> /Peter
>
> >> +
> >> +SRC_URI = "git://
> github.com/Avnu/libavtp.git;branch=master;protocol=https"
> >> +SRCREV = "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +inherit meson pkgconfig
> >> +
> >> +EXTRA_OEMESON = "-Dtests=disabled"
> >> --
> >> 2.36.1
> >>
> >>
> >>
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#166324):
> https://lists.openembedded.org/g/openembedded-core/message/166324
> >> Mute This Topic: https://lists.openembedded.org/mt/91454504/3617552
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> peter@berginkonsult.se]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>

--0000000000006f1f8605e05366e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Maybe call the recipe avtp=C2=A0</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 31, 2022=
 at 11:36 AM Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se">pet=
er@berginkonsult.se</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Hi,<br>
<br>
thanks Marcel for bumping this patch again!<br>
<br>
On 2022-05-31 18:38, Khem Raj wrote:<br>
&gt; On Tue, May 31, 2022 at 8:57 AM Marcel Ziswiler &lt;<a href=3D"mailto:=
marcel@ziswiler.com" target=3D"_blank">marcel@ziswiler.com</a>&gt; wrote:<b=
r>
&gt;&gt; From: Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se" t=
arget=3D"_blank">peter@berginkonsult.se</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; In order to enable configuration option aaf (AVTP Audio Format)<br=
>
&gt;&gt; used for AVB the library libavtp is a dependency but no recipe for=
<br>
&gt;&gt; this library was present. aaf support for alsa-plugins was<br>
&gt;&gt; introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Peter Bergin &lt;<a href=3D"mailto:peter@berginkons=
ult.se" target=3D"_blank">peter@berginkonsult.se</a>&gt;<br>
&gt;&gt; Signed-off-by: Marcel Ziswiler &lt;<a href=3D"mailto:marcel.ziswil=
er@toradex.com" target=3D"_blank">marcel.ziswiler@toradex.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; Resurrect from mailing list [1] as this is still not upstream.<br>
&gt;&gt; End-to-end tested on Verdin iMX8M Plus.<br>
&gt;&gt; Will talk about it at the Embedded World in the TSN &amp; Linux tr=
ack next<br>
&gt;&gt; month [2].<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://lore.kernel.org/all/20210604090216.553285-1=
-peter@berginkonsult.se/" rel=3D"noreferrer" target=3D"_blank">https://lore=
.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.se/</a><br>
&gt;&gt; [2] <a href=3D"https://events.weka-fachmedien.de/embedded-world-co=
nference/program/" rel=3D"noreferrer" target=3D"_blank">https://events.weka=
-fachmedien.de/embedded-world-conference/program/</a><br>
&gt;&gt;<br>
&gt;&gt; Changes in v2:<br>
&gt;&gt; - Updated SRC_URI specifying mandatory protocol as https.<br>
&gt;&gt; - Updated SRCREV to latest.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-multimedia/libavtp/<a href=3D"http://liba=
vtp_git.bb" rel=3D"noreferrer" target=3D"_blank">libavtp_git.bb</a> | 16 ++=
++++++++++++++<br>
&gt; There was a 0.2.0 release <a href=3D"https://github.com/Avnu/libavtp/r=
eleases/tag/v0.2.0" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/Avnu/libavtp/releases/tag/v0.2.0</a><br>
&gt; so I wonder if we should use the release tagged SRC_URI and call the P=
V =3D 0.2.0<br>
This tag was set after I sent my initial patch. I think this is a good <br>
thing to do.<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 16 insertions(+)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-multimedia/libavtp/<a =
href=3D"http://libavtp_git.bb" rel=3D"noreferrer" target=3D"_blank">libavtp=
_git.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-multimedia/libavtp/<a href=3D"http://lib=
avtp_git.bb" rel=3D"noreferrer" target=3D"_blank">libavtp_git.bb</a> b/meta=
/recipes-multimedia/libavtp/<a href=3D"http://libavtp_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">libavtp_git.bb</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..aefbee56ea<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-multimedia/libavtp/<a href=3D"http://libavtp_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">libavtp_git.bb</a><br>
&gt;&gt; @@ -0,0 +1,16 @@<br>
&gt;&gt; +DESCRIPTION =3D &quot;Open source implementation of Audio Video T=
ransport Protocol (AVTP) \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specified =
in IEEE 1722-2016 spec.&quot;<br>
&gt;&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/Avnu/libavtp" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/Avnu/libavtp</a>&quot=
;<br>
&gt;&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7fcb4331e23e45e17=
1cd5693c1ff7d3e&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +PROVIDES =3D &quot;avtp&quot;<br>
&gt; why is this provides needed ?<br>
<br>
It is because recipe meta/recipes-multimedia/alsa/<a href=3D"http://alsa-pl=
ugins_1.2.6.bb" rel=3D"noreferrer" target=3D"_blank">alsa-plugins_1.2.6.bb<=
/a> <br>
has this PACKAGECONFIG:<br>
<br>
=C2=A0=C2=A0 PACKAGECONFIG[aaf] =3D &quot;--enable-aaf,--disable-aaf,avtp&q=
uot;<br>
<br>
So either this PROVIDES or also change PACKAGECONFIG for alsa-plugins?<br>
<br>
/Peter<br>
<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/Avnu/libavtp=
.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>github.com/Avnu/libavtp.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
&gt;&gt; +SRCREV =3D &quot;3599a5bf2d18fc3ae89b64f208d8380e6ee3a866&quot;<b=
r>
&gt;&gt; +<br>
&gt;&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +inherit meson pkgconfig<br>
&gt;&gt; +<br>
&gt;&gt; +EXTRA_OEMESON =3D &quot;-Dtests=3Ddisabled&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.36.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#166324): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/166324" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/166324</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9145=
4504/3617552" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/91454504/3617552</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:peter@berginkonsu=
lt.se" target=3D"_blank">peter@berginkonsult.se</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--0000000000006f1f8605e05366e5--

