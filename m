Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0351C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 10:10:39 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.13580.1704795036661676613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 02:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MEZpfSiM;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5e784ce9bb8so21260287b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 02:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704795036; x=1705399836; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ske1Kz6CKxB4ZBqeJkidpBLO9kXB980YzVGdT3A1kQA=;
        b=MEZpfSiMLvIcpjVmus5Kq7vuyO9kQGJm51h3PRsqGMV9MMyiHhjiggPHmO+po0N4p3
         znzqR1U+Z2HX7//fuCMP+gCFAAljlmjhE5Tbf4Qph0PMt6hIL/FItd36YCATVK620vgG
         OFcow5wDZ9mnvDRSn/sORuBTA14+BqJCCWx5zVRGuU5+npPwNVkr92i1Lz6SxHkIEyih
         YazfEDRwlWqWsE0Wdd7SauTMwsNfII6H+CQ3hs+Ko2JE2Ru1l3BrKbcndIdPC3yiT8em
         VHgpxowyUoIlQPVMMyZftjvKeUAe0hJz9rKVUAgRovEsvW+lNPV3s13+rMHH14eoR6Zs
         2vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704795036; x=1705399836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ske1Kz6CKxB4ZBqeJkidpBLO9kXB980YzVGdT3A1kQA=;
        b=TLm9Da1ZjM8+t+nI3V0O1Ez+YyUhhcWbLAWuNrMWv5RRjnVgXFcB11q4+1Vsq+RNKD
         uZ5hfVGcHD9spc+1UbSWNuIdiv7VyjyWHJBzRCz1O/TXbL6zZ4wiJyF4USNggAWw38f5
         jJXaRdwZC89TUwTgPlsdDNyARkJCRNPl3t3ZX9ahhrJ60Hnea1f4vu43WoJwnHu6ElvW
         KgDW2gW7+/U+fJiXcw/V08texizo1I2BIM5N76Ba2pt9dqDs7sZMpHL/DQro4MjS6xP2
         pyg8345jqWf8H8HPL+kBIxNL7MTy+i6padf96LN2pe2zqUO7637e+dAp2GBoFnnJs0sB
         twvg==
X-Gm-Message-State: AOJu0YwdQT2E49iohFhxbaGuBQ5po16C5KC8k4TngWhkzkRP4L0D2QKe
	uMbjDR6xfVlfi2iAkuJ0u2D7wItYAfS59VwpWA==
X-Google-Smtp-Source: AGHT+IH3F508TkvRU56IKir1lsGXc1DcUyEz9XfWAfLqp2UxMO8TRvC/R4Pcdgg22B/m8AOg2mq0gT5P3U7jHN0+xx4=
X-Received: by 2002:a0d:e610:0:b0:5f9:3cc3:1ff7 with SMTP id
 p16-20020a0de610000000b005f93cc31ff7mr195523ywe.10.1704795035778; Tue, 09 Jan
 2024 02:10:35 -0800 (PST)
MIME-Version: 1.0
References: <c6b52856-a5c8-42ef-66f2-a5c422ee77db@kde.org> <28934.1704792897679047991@lists.openembedded.org>
In-Reply-To: <28934.1704792897679047991@lists.openembedded.org>
From: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Date: Tue, 9 Jan 2024 11:10:24 +0100
Message-ID: <CAJPofokHjF3Vmo+6_Fak7aHKax6xOsrvKDnB2EaYRFKvs3c0Nw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-good: Provide Qt6 option
 for qmlgl
To: sam.van.den.berge@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 10:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193448

> > Hi, a short update: I figured out that Meson actually has code to handle
> > exactly this situation to detect Qt's tools in libexec. Not sure yet
> > what is happening there and why the detection fails. By the way, this
> > detection problem holds for further Qt tools (moc, lrelease, rcc...)
> >
> > Currently looking into this.
>
> Andreas, did you eventually find anything or did you report this to meson project?

In the meantime I found this pull request in meson:
https://github.com/mesonbuild/meson/pull/12503

