Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0F7C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 19:34:57 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.621.1724355293277300563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 12:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AYfus073;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5334c018913so1168110e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 12:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724355291; x=1724960091; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N0I7pKOoK0pCJew32IM1CvW7RTx3eErhwRFXvohyVEY=;
        b=AYfus0735tYfCbpcHW/mwLhYNvf1dmhAkK0+Mj440WHoyuQPT6ntpJrezDkzvNE50p
         uxrgURw5fBq0iLz6N5La23fWoE9LG3eC/Cpbs6N0x1jAEe4nXC+Qmk9iWqcH7qdCcuFQ
         GbL0K4Sxte2V5Rc0CwzrurK/RYehY7vEMuCll+aCkcI7rcqEUAsUjze/OC2lhQPlbPLk
         xjAg9u3r0XFH1MwDsROIoyoXD/rgALDqgZFK0DBcE7rXco4LsxhxzyAe0Ag7iQdKaCXX
         cTcYdp1buQ8XH0esH1NBnVOekjQ+oAlhvRSNPFRMO1W4GPjRxDZ8NUZfZFQQzVYhvL20
         +IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724355291; x=1724960091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0I7pKOoK0pCJew32IM1CvW7RTx3eErhwRFXvohyVEY=;
        b=gPAgd1fWhcs4fqlgiIKiUXlcFCrqS2EYnXlBtumVbbkX9ovAnPZs3YmqddlUh61ssZ
         8Nzln7ZjuRonSufm64xztGxAxJsrwzw/LrQMr4Vd1jSjQWhvctdSu8Y/uSAMSurVRSkE
         yf1/CelCn0Gs0Fl2uqSHhDR2zloh4BTiMPt/b5OInMJE0akaDvRWeycsCK3lxTq/L7RB
         OzO2NA1s+VRyAsFIhHBAVRmfVn+JGqElPUNxKTA/fRAwSaNF+AjwqaH6+jKFR21LjiI0
         vNvks1l/9KqvU20N2JOGNcFpYveEqS9KiTNTsaRaeNK9Q6kDikzUBTdFE+2pGdoP0Yd+
         m3iA==
X-Gm-Message-State: AOJu0Yw7cibpYZb92RY/UtF6KRgvRIkzchOj1x025yQvhUsOb1VHk0sL
	6+jL5RWt/xny2ILOevLHQj58sSwYOiDu+UcEa9xoqcIFQNopeWV95crzINB9jxedxJorOq1Tiei
	bHMVPX/bqyomuKh3PAhn3uUYrNo4=
X-Google-Smtp-Source: AGHT+IFfaI/O66Hd2J/koNyZKsnfZFFTpUFPW5GtJQo7v3hNP9PnYMNQOdH/SAPWiseCpQ6nNnTPLW3RID+0kekV9q0=
X-Received: by 2002:ac2:4c4d:0:b0:533:d28:b9d9 with SMTP id
 2adb3069b0e04-534387be4c5mr8910e87.58.1724355290973; Thu, 22 Aug 2024
 12:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <202408221102453aaf2ba8@mail.local> <15565.1724350360225135129@lists.openembedded.org>
In-Reply-To: <15565.1724350360225135129@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Aug 2024 21:34:39 +0200
Message-ID: <CANNYZj-D+XgSFDNWnJ9LNdRe=RgLq-c5v8AP48s4T18TJ2pDZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sysvinit: upgrade 3.04 -> 3.10
To: mr.name@web.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 19:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203662

On Thu, 22 Aug 2024 at 20:12, Sven Reschke via lists.openembedded.org
<mr.name=web.de@lists.openembedded.org> wrote:
> Yes I see your problem and I'm really sorry for my incompetence.
> It seems like both of my patches are malformed (but at least the email I got for my initial patch, seems to be fine, although the representation in this thread is off somehow).
>
> What do you mean with creating a branch somewhere?
> Do you mean I should clone the repo and create a branch with my changes?

Yes, for example on github.

Alex

