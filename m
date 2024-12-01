Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA58BD4978F
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 18:54:33 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.156771.1733079271375277423
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 10:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=bUZ+Oh8i;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2024120118542746c1826aac17129b49-tcompk@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2024120118542746c1826aac17129b49
        for <openembedded-core@lists.openembedded.org>;
        Sun, 01 Dec 2024 19:54:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=S2KKjr6Kio+lFkV0R2eF2in5Yu8cLvQ+Sy9TWZg9iGc=;
 b=bUZ+Oh8iWxkBiCkOh1Tzk0SXckvbKtxPmpwbed/YGuMfdZ7CvOwDnV2Z6buUcQwH/KIaGs
 Haq1MgrUkSqQVKojoZveIFNLjz8u1C/1zZdRD8uWiCMgWNRo/aKnoFj7HkAoTgGF4cuAwUof
 DhobvuChfRH+a0trhdHnIk3/42GEn/1HbwrNOiAlPkPfIBm4D8t9jROcGNpVcmU89jlKQw0f
 pbgbzvdckpr7Ef6NGwr/lOlfyyxDZt2QkB9mdqCz0q6FtxF2DpCok+sbGEc5h37wDXAKJIms
 4KD5vJ5Ysw0DXB9rjEamUSQ7IKxka4RPSfHlzMpI+Berl75b44N01bdw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 0/5] CVE list cleanup
Date: Sun,  1 Dec 2024 19:53:32 +0100
Message-Id: <20241201185337.2675566-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 18:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208120

Cleanup CVE report - those which can be ignored

Peter Marko (5):
  cpio: ignore CVE-2023-7216
  gnupg: ignore CVE-2022-3515
  qemu: ignore CVE-2022-36648
  grub: ignore CVE-2024-1048 and CVE-2023-4001
  pixman: ignore CVE-2023-37769

 meta/recipes-bsp/grub/grub2.inc                 | 2 ++
 meta/recipes-devtools/qemu/qemu.inc             | 5 +++++
 meta/recipes-extended/cpio/cpio_2.14.bb         | 2 ++
 meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb | 3 +++
 meta/recipes-support/gnupg/gnupg_2.3.7.bb       | 2 ++
 5 files changed, 14 insertions(+)

-- 
2.30.2


