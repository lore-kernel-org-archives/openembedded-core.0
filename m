Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286DEC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:36:18 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.14210.1750664170329448313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=W5ybcAx0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20250623073606ab23d50a5bf1985ef8-sdbnwm@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250623073606ab23d50a5bf1985ef8
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Jun 2025 09:36:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XU+RJWi8nrcZ0vCHybuM3+mu/d1ywitAOoF3KLGlKjI=;
 b=W5ybcAx0o3HnevC0HNRrkNhwENqJrG9jxbh/EPBOgXptaGT6ZilJbCA/ViV+wInJFK+XyO
 N/oLusOOPcamupuGM0+Et7PHrAopF8qyneRku3HQeoQWTcfuIBxxjgxvHFWqGJIT1oNogw1X
 G2t2G4x9NOt3alw0gYA819SBhZGUY7eEfmmDrD0RcntF323dUpNDolmWgeLfN3k7aO+CeRev
 6gW+CXiO8+BiiTPPXTvnyVQPw3AZ3Qipa2v/Q+uhxDDG1oM8t0b8uLAkvi7tRIbzJZlGxcQ/
 cDQ30Pf11RNZgp4dsdMpKQtemhtHnYiHzsPe6aPXcFyQcze3fipiWURQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.babic@swupdate.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/2] libubootenv improvements
Date: Mon, 23 Jun 2025 09:35:05 +0200
Message-ID: <20250623073553.844037-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 07:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219197

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This series tries to clean up the handling of the configuration files which are
required by the libubootenv.

Further patches (going to meta-yocto-bsp) will provide a complete example for
the beaglebone-yocto machine which just works with OE-core and meta-yocto-bsp.

Adrian Freihofer (2):
  libubootenv: add rrecommends from libubootenv to u-boot-env
  libubootenv: do not drop debug symbols

 meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.49.0


