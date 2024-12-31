Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF4CE77194
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 21:26:11 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.3608.1735680362846510236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Dec 2024 13:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Lji4uOA9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20241231212559ae8a7479c326801ea6-ciimcy@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20241231212559ae8a7479c326801ea6
        for <openembedded-core@lists.openembedded.org>;
        Tue, 31 Dec 2024 22:25:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6rrjpEPSOQ0DlZxx4Ny2xi8cCJUxga1oaZ07hX69ZG0=;
 b=Lji4uOA9Ieki66UGQLUI/2BkDbQCBenPSH5w2xA3LZp5WjWSj08zpgDHfuMEq2jX7D2dti
 74mtg6PuhKaD4Fj4XYYEVK8oFclqhuKqbwOZiXd67ShL5pu5cg3W6H7sFCCIok5CKjZ/ZUYD
 VyJ6AKuJv0HVLIOBZXyYXadx1bhzzKbFRZ0FJZJENNDSIXHf/6H9bPAfsRpixV/5Jwp+DGNT
 HAezylzDjw2Z0SHyEhxSyJQ12TFWx3ea+8DZqXIKvYkmLE9uB+li9uBZFn1ht9emT+aGiAO7
 Q0ZgCgIY8VKgefDw+8glUs42sg4Ur7llpnJLQGMUN4r+nxedWR8AVlAw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 0/5] kirkstone CVE cleanup
Date: Tue, 31 Dec 2024 22:25:06 +0100
Message-Id: <20241231212511.3649711-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Dec 2024 21:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209185

Handle some CVEs from kirkstone cve metrics

Peter Marko (5):
  ghostscript: ignore CVE-2024-46954
  tiff: ignore CVE-2023-2731
  tiff: patch CVE-2023-3164
  gstreame1.0: ignore CVEs from gstreamer1.0-plugins-bad
  xwayland: patch CVE-2023-5380 CVE-2024-0229

 .../ghostscript/ghostscript_9.55.0.bb         |   2 +-
 .../xwayland/xwayland/CVE-2023-5380.patch     | 103 ++++++++
 .../xwayland/xwayland/CVE-2024-0229-1.patch   |  88 +++++++
 .../xwayland/xwayland/CVE-2024-0229-2.patch   | 222 ++++++++++++++++++
 .../xwayland/xwayland/CVE-2024-0229-3.patch   |  42 ++++
 .../xwayland/xwayland/CVE-2024-0229-4.patch   |  46 ++++
 .../xwayland/xwayland_22.1.8.bb               |   5 +
 .../gstreamer/gstreamer1.0_1.20.7.bb          |   4 +-
 .../libtiff/tiff/CVE-2023-3164.patch          | 114 +++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   5 +-
 10 files changed, 626 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2023-5380.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-2.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-3.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-0229-4.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-3164.patch

-- 
2.30.2


