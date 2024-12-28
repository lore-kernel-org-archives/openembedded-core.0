Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584EBE77188
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 22:04:10 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.36123.1735423441360272916
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Dec 2024 14:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ED+N6OdF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202412282203585a961d495bb88d2d0c-7dd16d@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202412282203585a961d495bb88d2d0c
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Dec 2024 23:03:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=4Kpq80pwS7QDZXMgEVN72lsSVpb9BYdZWHX6Zu4ly5w=;
 b=ED+N6OdFUWioqmBYwNr92TMk1nuYQf4m/G3rY4jwaklmrAmwCvMmgzukW+0x/gCcDBW2PS
 /7ScUdA6fwHTEE9elnV2dvwsLyyYwld7BQIAk2KktIZICOgPtEz1LbLfZAvwFTzB2OWM45qG
 4CMAnqwVrZ8iHRSSRcij9ib2AlsMXydwo0rWrbhADQPx1e1yjUhLm7DvfXtkGOFXXHxofcP8
 4mSSMK3MrwGXpvztnaiMwJl/eJSrwnvFtJZzz5ouqqxSlK5IxHwi1Bp9pFh2r7TZxs6LIYOJ
 oJkvl+R3lPgUNB63tgWEscaMfag1LPt37+CjzraWXWw0rgzzZRYIOYKw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 0/4] update gstreamer1.0
Date: Sat, 28 Dec 2024 21:49:04 +0100
Message-Id: <20241228204908.2470952-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Dec 2024 22:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209123

Pull all patches from master to styhead.
The last one fixes influx of 29 CVEs in reports.

Alexander Kanavin (1):
  gstreamer1.0: upgrade 1.24.6 -> 1.24.9

Ross Burton (2):
  gstreamer1.0-libav: explicitly disable documentation
  gstreamer1.0: run ptests in parallel

Wang Mingyu (1):
  gstreamer1.0: upgrade 1.24.9 -> 1.24.10

 ...ct-has-a-different-signature-on-musl.patch |  2 +-
 ...ools_1.24.6.bb => gst-devtools_1.24.10.bb} |  2 +-
 ....24.6.bb => gstreamer1.0-libav_1.24.10.bb} |  3 +-
 ...ialized-warnings-when-compiling-with.patch |  2 +-
 ...-avoid-including-sys-poll.h-directly.patch |  2 +-
 ...issing-opencv-data-dir-in-yocto-buil.patch |  2 +-
 ...bb => gstreamer1.0-plugins-bad_1.24.10.bb} |  2 +-
 ...et-caps-from-src-pad-when-query-caps.patch |  2 +-
 ...parse-enhance-SSA-text-lines-parsing.patch |  2 +-
 ...iv-fb-Make-sure-config.h-is-included.patch |  2 +-
 ...b => gstreamer1.0-plugins-base_1.24.10.bb} |  2 +-
 ...b => gstreamer1.0-plugins-good_1.24.10.bb} |  2 +-
 ...b => gstreamer1.0-plugins-ugly_1.24.10.bb} |  2 +-
 ...24.6.bb => gstreamer1.0-python_1.24.10.bb} |  2 +-
 ...bb => gstreamer1.0-rtsp-server_1.24.10.bb} |  2 +-
 ...-required-lines-accidentally-removed.patch | 33 +++++++++++++++++++
 ....24.6.bb => gstreamer1.0-vaapi_1.24.10.bb} |  6 ++--
 ...spect-the-idententaion-used-in-meson.patch |  2 +-
 ...ts-add-support-for-install-the-tests.patch |  4 +--
 ...s-use-a-dictionaries-for-environment.patch |  2 +-
 ...er-script-to-run-the-installed_tests.patch |  4 +--
 .../gstreamer/gstreamer1.0/run-ptest          |  2 +-
 ...r1.0_1.24.6.bb => gstreamer1.0_1.24.10.bb} |  2 +-
 23 files changed, 61 insertions(+), 25 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.6.bb => gst-devtools_1.24.10.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.6.bb => gstreamer1.0-libav_1.24.10.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.6.bb => gstreamer1.0-plugins-bad_1.24.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.6.bb => gstreamer1.0-plugins-base_1.24.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.6.bb => gstreamer1.0-plugins-good_1.24.10.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.6.bb => gstreamer1.0-plugins-ugly_1.24.10.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.6.bb => gstreamer1.0-python_1.24.10.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.6.bb => gstreamer1.0-rtsp-server_1.24.10.bb} (90%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-meson-Re-added-required-lines-accidentally-removed.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.6.bb => gstreamer1.0-vaapi_1.24.10.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.6.bb => gstreamer1.0_1.24.10.bb} (97%)

-- 
2.30.2


