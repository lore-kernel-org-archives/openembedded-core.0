Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EA5C43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 16:13:54 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.1219.1657901626641815683
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gJrS32P0;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id z25so8599841lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ljnAO4ZElDwVmnNBYUIvQd8vCSFums181iFjuZJDMJA=;
        b=gJrS32P0eAoK86c8Xoo6wGi4aAX8dHnbEgEQa2Kdu0Qe7RGpdemaHCtHPDDTrAY2/T
         FqedHps/reOC8sJgDXF8cv38FknckDBCJlre35gqbXRbl6J76j/pwiUM44TAsfwvFSvP
         g+TGNK/qi0eO41rLw2gXlUiunq+wUVZyrhhso/Aj8FUs5BhF6CH1eFC5rMaK60Z2lOUz
         33tqFrn08tIzXDA2dJ+SWnFqnUUYcolwSUQ+gQShQdocLTCx6iyk3KjxJa6+uQsDUQfY
         DjvVcAiq2ABEdn+ywfW1dYzXPYWE2F3ViMakU8b9izvuQqN2UOpANLSNPWpsGIBRDMDI
         GYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ljnAO4ZElDwVmnNBYUIvQd8vCSFums181iFjuZJDMJA=;
        b=tLRROA8mGzvpnebVAhWNkX6P/k2zGUqzrEZSOdaO6Eieyo/xCIuIfIQmBO1EyCGGki
         E0RTy2kpH4oxX3pQEewjTSP3YSNuRCcWoDzzhGlxexbV0B7rlpep2xacYnfOf2sqSKDN
         hu+xhSFKTPW4ygFyoryybv2SnKhPvuhgTOSx0sOZXiuac3z+M9ahWnNzFDoNWEQzrTWM
         btS0c6m8dCNPACDnFVctgpkpdmuu5xTENaqtlcbM3TO/I+8fq7FCeyLKBIlBfzdyb9Qc
         GTlti4AtTF+iMNChxp9ZWAr7a9rZq91Crn6CKYGR7QcSwhOa2RwIikaJhUQnPzoEvClx
         CRdg==
X-Gm-Message-State: AJIora+xKz5CWOmY64uL1IiJFnwde1CKocyxpZ/lD7UIRI4gBSw4eRJ+
	BpBSjk/P+xjPzr2j9eRKxBT314BMHTGUf7H4JpM=
X-Google-Smtp-Source: 
 AGRyM1vuSQMcwdpeK2dbH72SBgmoepnvhRipdKc3wIEZ4SzJdvax/BPBEAmScPdiS//kt0NX5FrTlg0i31/CyRvVoJA=
X-Received: by 2002:a05:6512:38cf:b0:489:ca4f:496f with SMTP id
 p15-20020a05651238cf00b00489ca4f496fmr8020436lft.521.1657901624726; Fri, 15
 Jul 2022 09:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220715155859.665686-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220715155859.665686-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Jul 2022 18:13:33 +0200
Message-ID: 
 <CANNYZj8FT-H9-0qB+9VrAiiKjEQ=jj3aG0GB1MFJU67umQpqpg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest/runtime_test/virgl: Disable for all
 almalinux
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 16:13:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168123

On Fri, 15 Jul 2022 at 17:59, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> -        if distro and distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04', 'almalinux-8.5', 'almalinux-8.6']:
> +        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or distro.startswith('almalinux')):

I guess almalinux-9 has also shown the same problem as 8? Should this
be 'or distro.startswith('almalinux-8') or
distro.startswith('almalinux-9') rather? It will be a while before 10
is available , and that should be evaluated on its own.

Alex

