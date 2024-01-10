Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72AFC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 04:26:15 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.5162.1704860772137913700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 20:26:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gk+t2j5y;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: rwmacleod@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4298b23abffso16586231cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 20:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704860771; x=1705465571; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L2wnESFGcC+xygR+DSAfUqEHsnPu8UtqLa1UnvS1tj0=;
        b=gk+t2j5yxrBdaTFIiqCtuU7r1HWODJDMpVaTtfGtMnrCEFy/6Wd2otF1c2Q6gUW8uq
         EnaxcjuuolUZGQcuXp0TvwTtXVSM7PenD2G7EZHDXnB3GKhQzp92WI9X6/hYnUJX/BBa
         dmFOt6kIpXVC+4izNoOsLI9d1yMYzlkYceW5d6Vg9O6y2ic5cc/S2E2yA0cTtzvz0Gid
         eZATzbcIYiHilVCkpO1pwmOmuL/408mrO83qECS92Nfapso3494/cBgByV0cTpV3cb9g
         k6mkxX/QzoyUBeg8x/SGGogKsjZTSBeab8tzLO/DCV8O8n/jnuoiRc9O8yozhox2v1RC
         rIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704860771; x=1705465571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2wnESFGcC+xygR+DSAfUqEHsnPu8UtqLa1UnvS1tj0=;
        b=s9mQj1k/XEiBfKLXn2iQvo2CmY1MZzBBgVgEAOjjA7jwbwayjRG7XMdhGNPzBh/kk/
         pH+sy4aGQDxxDlXWC0f/KMSnXEItue5359ItVjbPJJKQhr3wYXVF8rMGciEo99WgFo4Y
         6xO36mjqIuE7b5pN9JgPE+XDR+dRb0JZMZ6oIL4HVZDENYTxRiCFqTpVDNyac72mE7BT
         +iCxCDJmsXC2LIJ6It7Zk6bEoiVeIP4Q5Fr/tvlvEB8lxbZxzRXmucAoCQFTSjUJcB5Y
         e8MyTNP+Bq6Zn7rNiS215ToGlzOOnQ4U6iQstZft3f3nzjPVQn/SI79JGDIF85coTKFm
         qT4g==
X-Gm-Message-State: AOJu0YyWugyT1PyA+Twu8wA3f2YXE/DVwSsqhc7N+L62q/gUfsxuPFFV
	7unMrL3CEr/JEnspqpWISc2RdUQ3oh4v6S7zXac=
X-Google-Smtp-Source: AGHT+IG+24IMlgovBSxtTRir+OpqSMeJu1M2W0U+VJAsJE/xqHSGfAgBUyrdZgaYBO7FlWviQZWMoie/Hvz0toZgb50=
X-Received: by 2002:a05:622a:20e:b0:429:87fc:7a8 with SMTP id
 b14-20020a05622a020e00b0042987fc07a8mr530756qtx.40.1704860771138; Tue, 09 Jan
 2024 20:26:11 -0800 (PST)
MIME-Version: 1.0
References: <20240108220903.4086110-1-david.zuhn@sonos.com> <ZZzuHd4vDoIlXTYk@nuoska>
In-Reply-To: <ZZzuHd4vDoIlXTYk@nuoska>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Tue, 9 Jan 2024 23:25:58 -0500
Message-ID: <CAK6=ix75S-cEEo54JJknoGH4RWBGWi3WUoughiwJg9NFM6jxvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/1] rng-tools: remove unneeded build time dependency
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: david.zuhn@sonos.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a7c29e060e8fd4fe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 04:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193487

--000000000000a7c29e060e8fd4fe
Content-Type: text/plain; charset="UTF-8"

Hello David and thanks for all the Sonos speakers!

I'm not at my computer right now but it looks like nothing in oe-core
depends on rng-tools anymore since the 5.6 kernel release:

https://wiki.archlinux.org/title/Rng-tools

And note:

http://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Arng-tools


If this is accurate, it's a good time to move rng-tools to meta-oe for
people who still want to run rndg as a service for some reason or for those
who want to run rng-test.

Does that make sense? And if so can you send the patches?

Randy

On Tue., Jan. 9, 2024, 01:56 Mikko Rapeli, <mikko.rapeli@linaro.org> wrote:

> Hi,
>
> On Mon, Jan 08, 2024 at 04:09:02PM -0600, david zuhn via
> lists.openembedded.org wrote:
> > rng-tools used to depend on libsysfs, but has since been changed
> > to read directly from the /sys filesystem.  The build time
> > dependency on sysfsutils is no longer needed.
>
> This is a good change log entry but should be in the git commit directly
> to be recorded in git history. No need for extra cover letter if change
> itself
> documents everything.
>
> Cheers,
>
> -Mikko
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193443):
> https://lists.openembedded.org/g/openembedded-core/message/193443
> Mute This Topic: https://lists.openembedded.org/mt/103608803/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a7c29e060e8fd4fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello David and thanks for all the Sonos speakers!<div di=
r=3D"auto"><br></div><div dir=3D"auto">I&#39;m not at my computer right now=
 but it looks like nothing in oe-core depends on rng-tools anymore since th=
e 5.6 kernel release:<div dir=3D"auto"><br><div dir=3D"auto"><a href=3D"htt=
ps://wiki.archlinux.org/title/Rng-tools">https://wiki.archlinux.org/title/R=
ng-tools</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">And not=
e:</div><div dir=3D"auto"><br><div dir=3D"auto"><a href=3D"http://layers.op=
enembedded.org/layerindex/branch/master/recipes/?q=3Ddepends%3Arng-tools">h=
ttp://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddepends=
%3Arng-tools</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">If this is accurate, it&#39;s a good time to move =
rng-tools to meta-oe for people who still want to run rndg as a service for=
 some reason or for those who want to run rng-test.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Does that make sense? And if so can you send th=
e patches?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Randy</div></=
div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue., Jan. 9, 2024, 01:56 Mikko Rapeli, &lt;<a href=3D"m=
ailto:mikko.rapeli@linaro.org">mikko.rapeli@linaro.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
On Mon, Jan 08, 2024 at 04:09:02PM -0600, david zuhn via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; rng-tools used to depend on libsysfs, but has since been changed<br>
&gt; to read directly from the /sys filesystem.=C2=A0 The build time<br>
&gt; dependency on sysfsutils is no longer needed.<br>
<br>
This is a good change log entry but should be in the git commit directly<br=
>
to be recorded in git history. No need for extra cover letter if change its=
elf<br>
documents everything.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193443): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193443" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/193443</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103608803/953=
399" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/103608803/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a7c29e060e8fd4fe--

