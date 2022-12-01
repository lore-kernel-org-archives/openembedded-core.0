Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D574C47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 02:19:48 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.32416.1669861178457244881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 18:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FWv4hAHr;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: rwmacleod@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id t5so228337vsh.8
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 18:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nzdGYilF111D5ewHB/ULpqNUaaB8JZeEcyxRsQ9PSr8=;
        b=FWv4hAHrvLZIK2KTFk1tBLtFqQRpLpt+L4qQAB24mBFmwCrMaBHK7e7Lo5L2JE9SbT
         qTC6720oYqeaud7rmqfk0wlUk+Ma5UsXhMwk2M3xMcUV29+TOu/rPooPthD/1rBR7bLZ
         PWeEkPfNTUeBDhMSOXoYQKr9v7VyRNPFuyuZemocQpXN2DTGfgUY/NnQUbyta1AM0CIE
         0YqykCbsj5sEWrBaFgzYH6UkDqzJ/NDh6iWDcRs78536Qbmct87yOkA8TOwAqcT90CgT
         GF9+v3GxIqLQ43Dovf4CyvsifSmiwBBHNP+td5f83YiPWzBRsA6WnM53FlMTjElDyfZl
         6A5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzdGYilF111D5ewHB/ULpqNUaaB8JZeEcyxRsQ9PSr8=;
        b=RzkIiDz5kWUQI3FxuYwPOo8B/BfmrPF3WYVNzE20Ydy1/kAGUVEW+L6W/r4GkEiC/n
         JRjG6eQGZysoTSLbCgZYvEM9gnMi5rVTfmT9ZIBd+FWNwvRXadicjH2+qLGiqRrP9HZ8
         nlUWHEawbT2cftxynv3o55xef2d5Nv6xSc2t4zPNqETCfh2h4jddyJcGzrAt4NsSxZbV
         UASZkyeXAd/K53bK7efGXdqZ7cGoOD9MSXiSpGkJynG1EwgtDehpQT+z+tz3WywSK5v7
         LxT9usA8xmm+B0Q+SZAVdu/jgxEky7Ki34/053/0oVFLfi/2aahswTwZVGZb3/3Bp+9O
         d09A==
X-Gm-Message-State: ANoB5pm5zfk++aftRREL1mi9fZebUPa0ghrMPyrarb3xV1ClNJWcvNlg
	1daAMVZ6R8fN5/mWyWTD9w7NkN3sG6tDyR5gY/E=
X-Google-Smtp-Source: AA0mqf6TH9ApSxZi08wQlVtdrzu6o+oDjGaaDfNxdPIPtM0kwab/1b55jxAfiHfoiH5QalSI7uku7iZCKxxMc9pMX7E=
X-Received: by 2002:a05:6102:2381:b0:3b0:c6ec:cc6a with SMTP id
 v1-20020a056102238100b003b0c6eccc6amr5937305vsr.0.1669861177320; Wed, 30 Nov
 2022 18:19:37 -0800 (PST)
MIME-Version: 1.0
References: <7gG8.1669853695660542625.UIUn@lists.openembedded.org>
In-Reply-To: <7gG8.1669853695660542625.UIUn@lists.openembedded.org>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Wed, 30 Nov 2022 21:19:23 -0500
Message-ID: <CAK6=ix4tUAhAifmr6TEs_EcyV20YqRu8pybHdxtTBaq0soasgg@mail.gmail.com>
Subject: Re: [OE-core] OpenEmbedded Layer Index is not updating
To: Livius <egyszeregy@freemail.hu>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004c6a6805eebada23"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 02:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174034

--0000000000004c6a6805eebada23
Content-Type: text/plain; charset="UTF-8"

On Wed., Nov. 30, 2022, 19:14 Livius, <egyszeregy@freemail.hu> wrote:

> As i see in OpenEmbedded Layer Index website
> <https://layers.openembedded.org/layerindex/branch/master/layers/>
> automatic layer updates stoped to works for all layers. Please fix it.
>
Hi Lucius,

Please open a bug in bugzilla.

If you have some interest and time, we could use your help to improve the
layer index:

https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=layerindex

https://layers.openembedded.org/layerindex/about/

Thanks,

Randy

https://layers.openembedded.org/layerindex/layerupdate/9393191/
>
> https://layers.openembedded.org/layerindex/layerupdate/9393249/
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174033):
> https://lists.openembedded.org/g/openembedded-core/message/174033
> Mute This Topic: https://lists.openembedded.org/mt/95371947/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000004c6a6805eebada23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed., Nov. 30, 2022, 19:14 Livius, &lt;<a href=3D"m=
ailto:egyszeregy@freemail.hu">egyszeregy@freemail.hu</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><p>As i see in=C2=A0<a href=3D"https://lay=
ers.openembedded.org/layerindex/branch/master/layers/" rel=3D"noopener nore=
ferrer" target=3D"_blank">OpenEmbedded Layer Index website</a> automatic la=
yer updates stoped to works for all layers. Please fix it.</p></blockquote>=
</div></div><div dir=3D"auto">Hi Lucius,</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Please open a bug in bugzilla.<br></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">If you have some interest and time, we could us=
e your help to improve the layer index:</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?qu=
icksearch=3Dlayerindex">https://bugzilla.yoctoproject.org/buglist.cgi?quick=
search=3Dlayerindex</a><br></div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><a href=3D"https://layers.openembedded.org/layerindex/about/">https://l=
ayers.openembedded.org/layerindex/about/</a><br></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Randy</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<p><a href=3D"https://layers.openembedded.org/layerindex/layerupdate/939319=
1/" rel=3D"noopener noreferrer" target=3D"_blank">https://layers.openembedd=
ed.org/layerindex/layerupdate/9393191/</a></p>
<p><a href=3D"https://layers.openembedded.org/layerindex/layerupdate/939324=
9/" rel=3D"noopener noreferrer" target=3D"_blank">https://layers.openembedd=
ed.org/layerindex/layerupdate/9393249/</a></p>
<p>=C2=A0</p>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174033): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174033" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/174033</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95371947/9533=
99" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/95371947/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000004c6a6805eebada23--

