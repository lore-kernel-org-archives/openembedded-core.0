Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7080DC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 07:28:15 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.3178.1655105292352721015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 00:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T3TWLruQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id d18so5224864ljc.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=N/K4YThejm9ioFXn5EClK9ER1C0peyuuXIhj42aqEgE=;
        b=T3TWLruQUXZFDeeD5ORoTA98hwfAO/qEshL7p2tFgyqqmbWyF+AMw+dGcMof+OSgqR
         WDQCWZO3Z7ctYRflIReWoRHCeC2XyLFuA6slJ2VTTw7UpEVHuzHuqzhWW+giws9bkmco
         GbO+eI01WupWNlb5D7N/6Cs6IqFTp5LoLCxkHK2sIIdaO5ZRQWNEmU87E3+BWh4Q9TgJ
         iyMxm8DrgbBKZa8pWmbL2yJqykuIxIw8e32pgMVsj4jvFravIDWbVEnql6LjwqoIiBIl
         RwdrJTUfZaRB3ie2iDRpWk60UE6m7Io9HBkhuJHoT7ek0V241MtaRtnZu7xHyUyl1ZD/
         rLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=N/K4YThejm9ioFXn5EClK9ER1C0peyuuXIhj42aqEgE=;
        b=HzeiHImhuIreMJfw2SiYfLGSVUtXHMCGnmEA2FhEDcJmwl3hT9zPQHDVEeWC5eAcXw
         Mc8qk0xv7XmpatUbbOkcAijmPoYn0s8oRYcidiyfA780alhW2A+81CctwPvFuLGVcnA/
         Zrl9YmUEju5lEdI0N7rFV9PEvwf5RiiHh1x3GH0G7BW1Z5+GMYaNNCY5uTm/SN2bfvrS
         ASTrlKM0pPa4uzEsUPllRLAEdd4suY8V62V1fc/FWiSu+ifglRBbCuRvlU7p7i/S8pwy
         Qzz1gPVzwRchyyilAOwlKUD+mUQeLRgtuDzVFT+nNQ4A6prfsqndGO0E1flk5FCYApoc
         rqTA==
X-Gm-Message-State: AOAM530JTFFdtMtfoOX7vmomSLAV4AoGZ96nc5GR3aUvWnUcQaj7s5W1
	TGFp5/6rWQ77ExC+HHNftjKiMOPFQgltjmbun2Y=
X-Google-Smtp-Source: 
 ABdhPJxwSDQSBRLBvePDP3lB83PBSW+nI885FMeX9+MUdB/iR6GcktF5LLWqUDoI4Y2jXqA3UZhn73LLG5rCFZBiF7s=
X-Received: by 2002:a2e:a812:0:b0:255:4aaf:c1fc with SMTP id
 l18-20020a2ea812000000b002554aafc1fcmr40757791ljq.257.1655105290067; Mon, 13
 Jun 2022 00:28:10 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CANNYZj_G0vR8nME0euHGLD0mODGA6nUiDEHQ3gE6KZng9_DC+w@mail.gmail.com>
 <5284.1655104714025276648@lists.openembedded.org>
In-Reply-To: <5284.1655104714025276648@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jun 2022 09:28:05 +0200
Message-ID: 
 <CANNYZj8Ty+p7fSCP7d5PUq1+1OVuq04XBuPwMG2Qxzgm6_0ZWg@mail.gmail.com>
Subject: Re: [OE-core] [honister] test and patches for xwayland support
To: =?UTF-8?B?U8O8c2VucywgU2ViYXN0aWFu?= <Sebastian.Suesens@baslerweb.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 07:28:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166830

video group seems more appropriate. You can also inspect how this is
done on your desktop distribution and mimic that.

Alex

On Mon, 13 Jun 2022 at 09:18, S=C3=BCsens, Sebastian via
lists.openembedded.org
<Sebastian.Suesens=3Dbaslerweb.com@lists.openembedded.org> wrote:
>
> On Fri, Jun 10, 2022 at 10:19 AM, Alexander Kanavin wrote:
>
> You need to check which user and group weston runs as, and any needed
> directories should be writable for those.
>
>
> Weston run as weston user and weston is in the video and input group.
>
> How shall I change the permission and owner for the patch?
>
> Proposal:
> 1. drwxr-xr-x    weston     weston   .X11-unix
>
> or
>
> 2.drwxrwxr-x    root     video     .X11-unix
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166829): https://lists.openembedded.org/g/openembedde=
d-core/message/166829
> Mute This Topic: https://lists.openembedded.org/mt/91664874/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

