Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF1CC0502C
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 17:00:23 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web08.51072.1661619615462086923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 10:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dclRfqbv;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id by6so4264256ljb.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=XCXLxs0DkuZato5cUsVtcQjeMiOwEPcjSQD+QSIpgJQ=;
        b=dclRfqbvgsDlDm9tq7cjB5Ei9kmsQ3BZyZiC06rFa+ZgnqP808k/q9tamLndm8VFks
         WGkQzgC921JlvyhLpoF7BfG8MTkZAg/2UF1zG9A4kPdAmUR1uBlyQS3wUrijQ4dKuyoH
         etCVRbULY09imWtb+4ySxsAks9Zcd7yqPqRrMmHqhIHRR5BBlDpVWFtHatbKJmwmHeQb
         KiAOj2hY9WGUblKOKqz5+IKJIGz7girvz2UQkxpvPdoqoYYKk88vDHsMWr+bahneFtuG
         t/PX1byKsK9bWpZnj703KpQt9+cszi2+oxhyb+S6RWzUXKxj15RxKwAm7EI9N7KWIQyK
         KVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=XCXLxs0DkuZato5cUsVtcQjeMiOwEPcjSQD+QSIpgJQ=;
        b=3Q9HJ25328vzp0y6X/MvBspU2wG3vsXgbdZHSkSNfbJIUIrolIrNsd9XG5tkjTyFwu
         DbppccwLnfA4QPJKlnqD8tALXStUo1omuHYC9c+M3RxmuTEjaXpjILhPiD+NX2n7EzgV
         jhm8BM5Jw55pHQNLSdI4NSgoVIru7nZ1P4Ta1oUMutp4J72wsZVO9suKGo0WcmwLvww6
         eYfyHne4k4ABqIDuesfyQj6MFCNabD9WPXUDzhXMJM0aWRSZYRKPLIZOPM+d/te4KvsP
         Ha9bsfDMtyeTrjkmoT3A2EK27oeaZBqedQZ9YF72egYLWIF86jvIFy150zUni8rpUxEZ
         k2Fw==
X-Gm-Message-State: ACgBeo0ByD17Bfxtzbo3BKFJ4P7ARvJ5UsqiPpxcbb2dqVBpUwjoTDEf
	oJvH3cUKi0gH+GCrwQnixhGkSbe7KLSGA6NLEOQ=
X-Google-Smtp-Source: 
 AA6agR7l0imfYGZFv6lKApVU8rrpA3MjxA7n/LZT5UsLNKfDtXRmFim0+UuGjioIS0ZyDxuCab7iq5GwpOoGeLXC8Fg=
X-Received: by 2002:a2e:9e50:0:b0:261:e3fd:cdc5 with SMTP id
 g16-20020a2e9e50000000b00261e3fdcdc5mr3662122ljk.56.1661619613663; Sat, 27
 Aug 2022 10:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220824124234.3549247-1-alex@linutronix.de>
 <20220824124234.3549247-2-alex@linutronix.de>
 <20220827090049.1d19b479@booty>
In-Reply-To: <20220827090049.1d19b479@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Aug 2022 19:00:02 +0200
Message-ID: 
 <CANNYZj8SEbsxCO06+NJ7kE6Q4LpiobVG-iVSZppS-YwKnD8YSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 17:00:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169933

On Sat, 27 Aug 2022 at 09:00, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> This is making the AB fail:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4140/steps/7/logs/stdio

I believe this needs the patch for poky that moves the template to the
expected location, was it included? I just started a test with both
patches:
https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/force-templateconf

and it is able to proceed fine:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4144

Alex

