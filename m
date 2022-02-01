Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D27CC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 17:42:13 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web12.51673.1643737332423092280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 09:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gzrvgIs4;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id r8so1470473uaj.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 09:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WjzkXyQbYQdlCLjF3v/wppFKBY/bpYuxYESWaFronPU=;
        b=gzrvgIs4XS8Vqcf7UttbvJQuVtIMd//uWTJFiWZ//7BouzWXI15MfkBt2Vv5Eru616
         ttO4Zrrm9cPrR7fa2o6bpRU1QiADkTk7/EI8cpNex+T7Gz/DkmMZezCrYuzx4RprfDNW
         1e8lxIFhEjqn8cT54WQ1RYLAfldhICbnnTu+zRQ9M4NWHg5vle2N0eTKSUv6EagJmH2w
         vpWbYHtuJJBmgPDN7W8OcrUvBuCtiE+fvXSoYIv3I8dFWWp0dGKjrxNHhs8HCR372poj
         X4LaW0Mt2aOmUrU+Gs9fhxeAfArOipaTbBpcTBAGOOsj1KZr3rUQfqIomV2v5nZDGuXT
         RX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WjzkXyQbYQdlCLjF3v/wppFKBY/bpYuxYESWaFronPU=;
        b=gTpJBk/AQwVeYxbxWD5qEtK641+Lc/Xas4ipuLwctCmmMAglPwwz6pFCfJ2Hh5eYiA
         DHAnFoQ/4WliQUZecZlctoHaLURY8sXClXEAGlD3uhBeqV0zin4QdIVV7Bt0nwXQFp7F
         FT8BDnha6eXOFHo98x5PP5VZEZfxhRRbNOorV3xxXku/OmgsMEQdf8HLNGWYi5DcDIf/
         +3Pz7JikHsMhIpjMtr93SYFrMlIZ2XHbDfk6qXnNMU3NJJRpVTxsR1BdMfD3QTMxHQNF
         47eA38xf0zF+cHmA7OEcci8UVJvQBr5Nsw7uqwPU8DB3i3wGl6R57wo3wbqmghdpW8Ke
         jBAQ==
X-Gm-Message-State: AOAM530LbWM65d1WHuRIVIrPbfRFHYRNqyTuK68yIAajlRm7KtdMrlt0
	yRMKlGXNpZU8cBA9RPHYmuIqwAmK5skv1vognDs=
X-Google-Smtp-Source: 
 ABdhPJxxiAnCM2az0dF0XWJm8ytsfPdsGmOKM9be25vdDO5OnFp+HSNGv9DUQQAX7AWPTiOvqQqs5euiAROPi7If3Aw=
X-Received: by 2002:a67:b241:: with SMTP id s1mr10401574vsh.73.1643737331505;
 Tue, 01 Feb 2022 09:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20220201133054.3265186-1-alex@linutronix.de>
 <20220201133054.3265186-2-alex@linutronix.de>
 <20220201171501.GA26229@denix.org>
 <9f8348365cbc49b762b5a514f7a302dfbc71c703.camel@collabora.com>
In-Reply-To: <9f8348365cbc49b762b5a514f7a302dfbc71c703.camel@collabora.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Feb 2022 18:41:59 +0100
Message-ID: 
 <CANNYZj87j4qZfUFEAPD+PqKTNpAmLqNj0KXDT27r7b6i35dTFQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/2] weston: upgrade 9.0.0 -> 10.0.0
To: Daniel Stone <daniel.stone@collabora.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Marius Vlad <marius.vlad@collabora.com>,
	Chen Qi <Qi.Chen@windriver.com>, Denys Dmytriyenko <denys@konsulko.com>,
	Tom Hochstein <tom.hochstein@nxp.com>,
 Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Ming Liu <ming.liu@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000bfa02705d6f86ba0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 17:42:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161165

--000000000000bfa02705d6f86ba0
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Feb 2022 at 18:25, Daniel Stone <daniel.stone@collabora.com>
wrote:

> Most systems use Weston's logind backend with systemd integration;
> OE/Yocto was the last system I know of using the old weston-launch
> wrapper.
>

weston-launch was used in yocto only for sysvinit based images; systemd
images have used direct rootless weston unit like everyone else for a while
now. So it's reasonably well tested here too.

Alex

--000000000000bfa02705d6f86ba0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 1 Feb 2022 at 18:25, Daniel Stone &lt;<a href=3D"mailto:dani=
el.stone@collabora.com">daniel.stone@collabora.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Most systems use Weston&#39;s logind backend with systemd integration;<br>
OE/Yocto was the last system I know of using the old weston-launch<br>
wrapper.<br></blockquote></div><div class=3D"gmail_quote"><br></div><div cl=
ass=3D"gmail_quote">weston-launch was used in yocto only for sysvinit based=
 images; systemd images have used direct rootless weston unit like everyone=
 else for a while now. So it&#39;s reasonably well tested here too.</div><d=
iv class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div=
></div>

--000000000000bfa02705d6f86ba0--

