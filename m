Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C8CC64990
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 13:45:39 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web12.23986.1661435134849125217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 06:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FbuLdr9u;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id x24so1422406lji.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=+9KAAn6ePAgMm8X08YFkMzSWMQc1KFAgkuP8Xv9kh+s=;
        b=FbuLdr9u6nnlXiBcB41esytTa4F1pelwxA51fT+pWxfsMhD2gJsKsv0ifUNnD/C72Z
         SW7EmAhHEpMowDh8ZyawAvjpIO9JV+lur0UxWamuCfFVSX3V+l51WPuqY+L0TZpoToMX
         a10x1s7f9qeEN6IbNW9x+paXi5QvrXgxH39R1grgYh/JKAP4eaN45cS2UwcWDDHnDdyE
         Wes9WdxNJYa2LjLTznrUmfu62/TNfTME5AKLHYzvzzZpLiLgDFuni3yHAoc5BnbFa3aV
         YBAkUs6q/a4f5R1IqkH4k6euSDiUuWb97J7dN8iFbaFzUL3gNKtfiTpnygWRmWCYcAJf
         j2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+9KAAn6ePAgMm8X08YFkMzSWMQc1KFAgkuP8Xv9kh+s=;
        b=3E03f8TEPgf7BeaDLTPLh0qSQJPnOhW9RPumfOT2ynK5tPB/ryksE8Ps6NBXnlvbCS
         shRqlh+Evux5UFcmLWsg8FIMxDdDVkq+XrqcxFLRf4dqA3GEQjwjr5GCQ56xvKLgdNui
         Q/ZCE5/K/xiqykpelx5moMQRk4chNbQKHuVFq9wWcI7ZkmxMLnRZTLlFRGzErw16SsRn
         5EQsp9Bi6jW7/Bn3KSWbgjDskP2A1ukH0PrzvcrE72Pv/9FpQsyfDvenA4Y7SVIJOxvl
         f3/dGzcMgov/n/4QtbMYWJqoMe22Ev5c9h7f42nr+UgM14+ic95HJJJMVwFsHqWNSvF/
         UhAg==
X-Gm-Message-State: ACgBeo3D9ZbQGG60UT1Bkz6vxroe1vO2bR1YmvLsbKFjKugoWAnSvp0Y
	sudEkuMVOSJhr6F8k3rXfMOGk5+I5LVfEGa6u5c=
X-Google-Smtp-Source: 
 AA6agR5x/WkIHZxq5BSOF5rH5qSZPBEA1P6Ljj1AFORU9ENPYiSQ1wrQTHJqeZg+iplSJC6JDr0YGDurzR7ghsQVBhs=
X-Received: by 2002:a05:651c:31b:b0:261:df26:53ba with SMTP id
 a27-20020a05651c031b00b00261df2653bamr1215866ljp.513.1661435132979; Thu, 25
 Aug 2022 06:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220824124234.3549247-1-alex@linutronix.de>
 <20220825153712.55f446b1@booty>
In-Reply-To: <20220825153712.55f446b1@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Aug 2022 15:45:21 +0200
Message-ID: 
 <CANNYZj_HRzuszmzkT0vU8rQ7sxvp8m_kLQUfQqPbCMWT_tdFxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] meta/conf: move default configuration
 templates into meta/conf/templates/default
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 13:45:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169873

I've sent a separate patch for meta-yocto to poky@ list, does that help?

Alex

On Thu, 25 Aug 2022 at 15:37, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hello Alex,
>
> On Wed, 24 Aug 2022 14:42:33 +0200
> "Alexander Kanavin" <alex.kanavin@gmail.com> wrote:
>
> > This sets the ground for standardizing (and enforcing) the location of
> > configuration templates: let's start with the default one.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>
> I have been trying to apply this patch, and it applies on oe-core, but
> then combo-layer fails in picking it because poky has a different
> .templateconf file. I'm not sure how this should be fixed, maybe the
> patch should be done against meta-yocto (which has a .templateconf
> identical to the one in poky)?
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

