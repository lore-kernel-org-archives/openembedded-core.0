Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0D9C001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 11:00:06 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.29678.1690541999848250515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 04:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UJkGU38f;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b9a828c920so32374411fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 03:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690541998; x=1691146798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5LUFbH2by1D8jFYQUxPH+lECqbBXcaOIlPpGWQ1gzfE=;
        b=UJkGU38fP3EM//wnEOxR+ebgmfCugpPtSA/cBAe0bUg+JHZj1A+XIKpPfcSRTwYjMb
         Wj1MiCHa+02ei+LT95gyGfDkYBIoEuscLo5s4AmnyyL7/BW5daFuatxU1fXleCNNsBj7
         NZjvY5Y8joajR9e9VOEHpa8Fq9IqXANPMM1ozAurijTSPITJ7cI+HhTFz/weaLm4KX4r
         F+cgGlKGwJ8FacnwaGXTcoWD0lBz4kF4NKHt/Khl/Ff0WrfgoLkT/a+y0Iu6yNG+1kuj
         5PMa1EnRmlyoF/8dw9PYuu4D8jm94A/+QNpaCXdspZsnmXoKY/83xYxLCJTM4e5pUBVu
         NMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690541998; x=1691146798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LUFbH2by1D8jFYQUxPH+lECqbBXcaOIlPpGWQ1gzfE=;
        b=YJSETHwG2ciJ1ADHSKq+x5Z3xZ5KCxa1QX5UXHGfdjWh7rueyRGhqybMkR1BgDnKmR
         FJoz7owmk2xyWLXu4CdVgkPjU17btqCQEyd2Uy0Gcbf8JlURx5WsnEjnSG/K8c7MEb5B
         kgpAyYYAJpsWHtiZLVpwq/FIFTrmpobggBE2AXD/IiWyi80fU4pn7602UuY5FX8jkF0D
         cEvRnsATa0216wqCrFAe7a8Hlza6CuxQNug1K+BTLcbOwDqOiKfWaTieFAHGCpi3Lrj4
         VxMpwarCZigW4RYg9KAZx7zJK1B2xX4GmbVh5n62TkecCI6G3s2/te0vH8YHFmg+frdZ
         J9tA==
X-Gm-Message-State: ABy/qLYJc7ijix7tWJ/vwZRvrYP5Kvp6lnI6uNX5nRSLP83f9eR6aKTw
	NwZg57/F4RZaLs4oXkImHdV/ME8wBrSa9Ydroec=
X-Google-Smtp-Source: APBJJlFhBI1VmAKVZG/H7hdMZJPdltwuGsk9WYWbRmJWp7fpIeWG/4i7NSlPcpPKo+USrddEErqe7ekVgJ7iJ158ksg=
X-Received: by 2002:a2e:7807:0:b0:2b6:e958:5700 with SMTP id
 t7-20020a2e7807000000b002b6e9585700mr1512828ljc.4.1690541997944; Fri, 28 Jul
 2023 03:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230727143627.3718496-1-alex@linutronix.de> <20230727143627.3718496-16-alex@linutronix.de>
 <a88db32d-aea3-d125-72d3-5d25db427f36@gmail.com>
In-Reply-To: <a88db32d-aea3-d125-72d3-5d25db427f36@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Jul 2023 12:59:46 +0200
Message-ID: <CANNYZj_QwQHj_At0QZRC4DD28XDuCNkxcn9E=O3n65BLKuQO_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/21] libadwaita: add recipe from meta-gnome
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 11:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185020

On Thu, 27 Jul 2023 at 18:12, Khem Raj <raj.khem@gmail.com> wrote:
>
> On 7/27/23 7:36 AM, Alexander Kanavin wrote:
> > This is a requirement of latest epiphany 44.x.
> >
>
> This import breaks layer check tests for meta-oe job because now we have
> this recipe in two places. Would be good to send a removal to meta-gnome
> simultaneously.

Patch sent.

Alex

