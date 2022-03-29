Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DBFC433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 06:16:42 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.3511.1648534601483394625
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 23:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M2t+04rE;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id bx5so16427727pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 23:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Gru0xzSKUSWfV5dC8TSWAVYp7Xp73z1wb7Z02fCucT8=;
        b=M2t+04rEO3niWVZ2J8ixxCWh41dGVdD9s/U1swO6nHQagfS4BqNCxQgpLfh+vsvBND
         cxI8h4Pak6jnCdaFXb1eZ6E4313GHxj91XxKmgsFmxbYyjfEsa4vNpodpGh0ogGLJnjz
         VpoPIXoJM69g2KrlKguKQ44lJ7JpQqfrlxaFUh2Z43GgncH7k2CFGxuW86T1ZweevqOw
         UX+mLAJXE1qdCuxovV0UTpysavZHvWhoHnFls5z/p+nNDJDQu/5V2YtlScTDuSV+zqKm
         PaXNk4CFVJrAbPYF9d5YDc4inv9IsTPEXQm4filIM9SUtBqMFAKi21sQ6gxft29Ascyc
         XW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Gru0xzSKUSWfV5dC8TSWAVYp7Xp73z1wb7Z02fCucT8=;
        b=8JXfaUFg5Gr4s6qwFgeZKfRbGEve0g5bpvxAbJbqExE7Pn91nLRs/HoqwUMsvlUIo3
         1OWvXYJUqdya0X6mIalmPYouH3bZPy6/WgEerCKyHO4v8ENtpWkl7G+HZVYtnCDeoXdl
         eMRqU00g+xUdN02TsySPrXE6dA4hU2Gj6Yra18Z+sa4q1x5Nbb5KiqJkPtSuVapBTYKO
         qVTF/POly0F2Zd1Et4IImK8cDJGv/xSEe4wLwBiaTA10N1d44rvAG80Dzx7nO60o1uk+
         zR7OpYDWsQBQ2WCNnYZj3bHDNbGRXqAd+ylGZofgK0cR81tVfjq02nRFVlq7mV/7Rltg
         fi+A==
X-Gm-Message-State: AOAM533vyfZqxxA92YKNzCvyZ4e3i0kjBlNULLnD+qleW+da6pq6JSeu
	fcZFzNqhApAj/MvS3cLcxlUrnr5BiUJ/fYSKJMQ=
X-Google-Smtp-Source: 
 ABdhPJwgTuggsT1qwoJVnCo+Aqj6qQ6SNOIEu6aMYRgILTMekaCHZqw442dax1Wp8DRoHiHdyx2QuiKAOyIg4vk3QkY=
X-Received: by 2002:a17:902:c745:b0:151:e8fa:629b with SMTP id
 q5-20020a170902c74500b00151e8fa629bmr29674562plq.90.1648534600844; Mon, 28
 Mar 2022 23:16:40 -0700 (PDT)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Tue, 29 Mar 2022 17:16:04 +1100
Message-ID: 
 <CAA=hcWRay+5Xqz+RO_EX1-Yr2Ef_uXcLUL7dZE45d6wBga4mzA@mail.gmail.com>
Subject: Which vendors maintain SDIO WiFi in mainline stable kernel
To: yocto <yocto@lists.yoctoproject.org>
Cc: linux-wireless <linux-wireless@kernel.org>,
	oe-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 06:16:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163735

Hi,

I could not understand why so many large WiFi chip vendors retreat to
stop maintaining WiFi SDIO chips to mainline Linux kernel, and to
settle it's chip support to out of the tree, use its own SDK and
proprietary kernel tree to source.codeaurora.org or private repository
which are not compatible to mainline stable kernel, the kernel
configures are also different.

I looked at the following link, the mwifiex and mwifiex_sdio support
the Marvell (NXP) 88W88 chipset, but only kernel 4.19 was able to
build and to run, kernel 5 cannot support 88W88 chipset, any more.
Same to Qualcomm, the old Atheros WiFi modules are supported, the
QCA-9377-3 chipset is in source.codeaurora.org only supported by old
kernel 4.9.

Given the OE/Yocto poky kernel build is based on a mainline stable
kernel repository, how can I build kernel 5 for 88W88 chipset or
QCA-9377-3 from source.codeaurora.org or private repository? Or which
WiFi vendors are still well maintaining the WiFi chips for kernel 5,
the only sensible solution is to switch WiFi SDIO chips? Appreciate
your advice and comments.

https://wireless.wiki.kernel.org/en/users/drivers

Thank you very much.

Kind regards,

jupiter

