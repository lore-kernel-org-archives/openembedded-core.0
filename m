Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A217EC48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 09:45:44 +0000 (UTC)
Received: from 11.mo583.mail-out.ovh.net (11.mo583.mail-out.ovh.net [46.105.47.167])
 by mx.groups.io with SMTP id smtpd.web11.9892.1708422334557585127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 01:45:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 46.105.47.167, mailfrom: jonathan@joggee.fr)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.148.65])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4TfDzc3G2mz1HCY
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 09:45:32 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-bwdjn (unknown [10.110.178.134])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DEC6B1FEE3
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 09:45:31 +0000 (UTC)
Received: from joggee.fr ([37.59.142.98])
	by ghost-submission-6684bf9d7b-bwdjn with ESMTPSA
	id z1nzIbt01GXFbgAAeJ6SKA
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 09:45:31 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R0028088bc4e-b90d-4875-a7ca-c42524b8f8c3,
                    1B5120BAC2DE0071621613A3459913DB1EC03C29) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 209.85.161.54
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-59ff33f1018so557561eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 01:45:31 -0800 (PST)
X-Gm-Message-State: AOJu0YyPBtV4JFGY+EV3RAspn4j/6N52q+87+YY61jzi+QRtETZfXUSy
	K+oCg7BTxIXwZcdinYAXCD3OQfqfw6eoUyC8GxXdYPZI17wku+2euBk1StQLqo3oomtV3u2yvNG
	Eqrfb2d5T1kRkCW2tRVhlm/JFOfY=
X-Google-Smtp-Source: AGHT+IHO6IlHBjVXUwOGvAAmK0eJbYLGvdRDDlbqiPdB0EsOljcr9Dpvxpsb0XALZFuwN/dAV92xp0SkXeuk1tbZdOU=
X-Received: by 2002:a4a:ea1a:0:b0:59f:f789:203a with SMTP id
 x26-20020a4aea1a000000b0059ff789203amr2152767ood.5.1708422330255; Tue, 20 Feb
 2024 01:45:30 -0800 (PST)
MIME-Version: 1.0
References: <CZ977GGGE9KN.16KHH2G2CQ1NJ@joggee.fr> <d3665f861467336a8c697f7994336de892a4192b.camel@linuxfoundation.org>
In-Reply-To: <d3665f861467336a8c697f7994336de892a4192b.camel@linuxfoundation.org>
From: Jonathan GUILLOT <jonathan@joggee.fr>
Date: Tue, 20 Feb 2024 10:45:08 +0100
X-Gmail-Original-Message-ID: <CAA_hxbT3dpkX0yxEiwvnvZuT3CBEZ9xQ+Q6HmeN=_YtYXq-3Kg@mail.gmail.com>
Message-ID: <CAA_hxbT3dpkX0yxEiwvnvZuT3CBEZ9xQ+Q6HmeN=_YtYXq-3Kg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/package: fix LOCALE_PATHS scan to create
 locale packages
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001f0e230611cd12d6"
X-Ovh-Tracer-Id: 8411598208078253179
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrfedtgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfhgjhfffkffuvfevtgesrgdtreertddtjeenucfhrhhomheplfhonhgrthhhrghnucfifgfknffnqffvuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeehffevvefgudefvedvjefgvefgteduteejheefffdtgfehhfekhfekueeggffhieenucffohhmrghinheprghlihgrshdrihhtnecukfhppeduvdejrddtrddtrddupddvtdelrdekhedrudeiuddrheegpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhhonhgrthhhrghnsehjohhgghgvvgdrfhhrpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 09:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195911

--0000000000001f0e230611cd12d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Without any of my modifications, it seems that glibc-locale recipe creates
a glibc-locale-locale.alias package containing only the file
/usr/share/locale/locale.alias. It looks like the same issue revealed with
the CUPS recipe. Do you know in which package locale.alias file is expected
to be located?

Regards,
Jonathan

Le mar. 20 f=C3=A9vr. 2024 =C3=A0 08:42, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> ERROR: glibc-locale-2.39+git-r0 do_package: QA Issue: glibc-locale:
> Files/directories were installed but not shipped in any package:
>   /usr/share/locale/locale.alias
> Please set FILES such that these items are packaged. Alternatively if the=
y
> are unneeded, avoid installing them or delete them within do_install.
>

--0000000000001f0e230611cd12d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Without any of my modifications, it seems that glibc-=
locale recipe creates a glibc-locale-locale.alias package containing only t=
he file /usr/share/locale/locale.alias. It looks like the same issue reveal=
ed with the CUPS recipe. Do you know in which package locale.alias file is =
expected to be located?<br></div><div><br></div><div>Regards,</div><div>Jon=
athan<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">Le=C2=A0mar. 20 f=C3=A9vr. 2024 =C3=A0=C2=A008:42, Richard Purdie =
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@li=
nuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
ERROR: glibc-locale-2.39+git-r0 do_package: QA Issue: glibc-locale: Files/d=
irectories were installed but not shipped in any package:<br>
=C2=A0 /usr/share/locale/locale.alias<br>
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.<br>
</blockquote></div></div>

--0000000000001f0e230611cd12d6--

