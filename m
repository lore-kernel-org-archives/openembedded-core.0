Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D08EC04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 18:52:29 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.36708.1659034344236037476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 11:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E+YMjNzO;
 spf=pass (domain: gmail.com, ip: 209.85.219.181,
 mailfrom: chuckwolber@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id y127so4651903yby.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 11:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fsiFgqpprehF/bqFtT9//+IQDO4Gsrxxo/SoqLtlRMw=;
        b=E+YMjNzOX65kqkqfhe/8DOKqLhsXYHKaYn/AoXXha0EQkN9R1hE5Is1DdlyqxQd3ev
         uP1b+TjfkiEvDAbiPrWhrmNT0DXDV8bfa3d+9Y97Co3IuLvZxXCqIrMq89VPNlsmVUOm
         gtX7y79p0Wso7SLbMFq22z+dErIRIF/cF2BuiNp+hDSsAZ4QbVDBFTLarJTCdqaNPQCv
         DeFT6qVRrA4dkI1XrlSROR0BzfdA3GufNbolUp3u0OfVmc77iOiap5Jc5yn1p8RCwtIJ
         MuNh3MicTewBj1CGsrDesDVHguNMUVLAodxBcQi5vA7eaUzObf19C459cb0otMf6JjC0
         2fNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fsiFgqpprehF/bqFtT9//+IQDO4Gsrxxo/SoqLtlRMw=;
        b=ENyYj7ROhGaOPvfQOZNMkZjPPMTRW5+BPuSK9ZmnTQRTgIyIvmWsCqx8hnxMITADOc
         RVQ7Y146DJVSmPoPlhll5Y/094CwhMpxgJeMVEMyNQz77u2kuWuj5Cvr7HZLM4n8F/06
         9xa0gi3KuRmGXnN0y2nOykfmJnab0dXqIT1PeecdU1WD4KUrHdmPiYXat5RFGFGRVw6w
         TCUrViBa+1ZLya2CMXSse91Uy8Ry9BJY/qan1fouGGzaFR5JawHQH6Ru0KS7FXiHSipv
         KEGTQ47XS+nAW7qfmCq61MQDIMJK8bORJVBycdE8CXnOork8xXTsTDxk3XZ2tsmHD5A/
         8xkA==
X-Gm-Message-State: ACgBeo0VxVlBEvrRCM1JrsnjqApF5Pb+E8CWgwRWQS+opvulSCvetnDW
	WkjPPKt+SojARaUU+QereO+b9eEzucoJERszYJk=
X-Google-Smtp-Source: 
 AA6agR7d0Ha7QMY1KxMAX6ykJu6GLkLsO86q4ah+lBpeKlmHDaHAhNhnt5JOptRIKPheF4JxxUzmRpNHegbDo8kK4Tg=
X-Received: by 2002:a5b:3ce:0:b0:66f:4692:27a2 with SMTP id
 t14-20020a5b03ce000000b0066f469227a2mr35086ybp.167.1659034343322; Thu, 28 Jul
 2022 11:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658882276.git.steve@sakoman.com>
 <bb1dc2bbfe268e73008dc37d6b1f83a861b48915.1658882276.git.steve@sakoman.com>
 <CAB=6tBTxdkT640huLEiMRKxWbONvbniKBb6_oiz7P_aUwjNKYQ@mail.gmail.com>
 <CAOSpxdY9JCXzDo6z2GxyTbXFQynFD2nj7T-FoJAEJzay3QnDJQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdY9JCXzDo6z2GxyTbXFQynFD2nj7T-FoJAEJzay3QnDJQ@mail.gmail.com>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Thu, 28 Jul 2022 11:52:12 -0700
Message-ID: 
 <CAB=6tBRwUSnj+egXoRMU5YaxQ3SQs1LnYdKK95Rabiu0qaAMxA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 13/15] gobject-introspection-data: Disable
 cache for g-ir-scanner
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b437b805e4e2080b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 18:52:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168615

--000000000000b437b805e4e2080b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 11:37 AM Steve Sakoman <steve@sakoman.com> wrote:

> On Thu, Jul 28, 2022 at 7:55 AM Chuck Wolber <chuckwolber@gmail.com>
> wrote:
> >
> > FWIW, the gobject-introspection-native recipe was one of the "canaries
> in the mine" that reliably caused an image build to die while I was
> actively encountering this GCC10 compiler issue in Hardknott:
>
> Have you encountered this issue with Kirkstone?
>

We have not tried yet. We are debating the Hardknott to Kirkstone upgrade
question right now.

Our build is complex and 2.6 (Thud) -> 3.3 (Hardknott) took two months of
very intensive work and then six months of stabilization. Granted python2
-> python3 was part of that, so a big chunk of the stabilization damage was
self-inflicted. I do not expect anything as major for Hardknott ->
Kirkstone, but I am also not na=C3=AFve either - all blockpoint upgrades ar=
e
painful in their own way...

..Ch:W..


--=20
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--000000000000b437b805e4e2080b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 28, 2022 at 11:37 AM Stev=
e Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu,=
 Jul 28, 2022 at 7:55 AM Chuck Wolber &lt;<a href=3D"mailto:chuckwolber@gma=
il.com" target=3D"_blank">chuckwolber@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; FWIW, the gobject-introspection-native recipe was one of the &quot;can=
aries in the mine&quot; that reliably caused an image build to die while I =
was actively encountering this GCC10 compiler issue in Hardknott:<br>
<br>
Have you encountered this issue with Kirkstone?<br></blockquote><div><br></=
div><div>We have not tried yet. We are debating the Hardknott to Kirkstone =
upgrade question right now.<br></div><div><br></div><div>Our build is compl=
ex and 2.6 (Thud) -&gt; 3.3 (Hardknott) took two months of very intensive w=
ork and then six months of stabilization. Granted python2 -&gt; python3 was=
 part of that, so a big chunk of the stabilization damage was self-inflicte=
d. I do not expect anything as major for Hardknott -&gt; Kirkstone, but I a=
m also not na=C3=AFve either - all blockpoint upgrades are painful in their=
 own way...</div><div><br></div><div>..Ch:W..<br></div></div><br clear=3D"a=
ll"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">=
<div><b><span style=3D"font-family:monospace">&quot;Perfection must be reac=
hed by degrees; she requires the slow hand of time.&quot; - Voltaire</span>=
</b></div></div></div></div>

--000000000000b437b805e4e2080b--

