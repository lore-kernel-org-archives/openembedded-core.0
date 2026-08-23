Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17329C5DF9A
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 15:58:10 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16450.1787500679654792815
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 08:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=TtcRYoxa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260823155801956a889cd70002073c-gaj4l9@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260823155801956a889cd70002073c
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Aug 2026 17:58:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Vo4zRwe3SiIBHQbnzD7YB6JraZfTdjs+j/DsnqNAFfg=;
 b=TtcRYoxaBdIulLXNBiMX5G89KhyHabBpx1L6eQMUM5pU5kGWUD4Bctlsl9rs4+q3Qi2vDz
 h37ylWlEG+Fafc5a6IwXB3NqZsGvka9zFpZYFTP8A0X3ncIkQMpTeXguviNHH+Fw9ULpKZFf
 dlyU8SEt7KDWns/ggtCy1bG2r/OBWPm6uuXYsAQo4iioycEYLcJTGzo8wCtfYl6yqLkLzMQC
 p4odgtdi6zcgDnXhUTIx4ZI6riagLOwzHVCgeT9hRHfSUAuTbOLJAdkOllNjDP2avcVCH+C4
 aJ6LDG8gNR8YjCsCyaC+FCcorxDse5j9J/0bkxXd5dcOb+s/qEtwqKvw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 3/3] libslirp: add tag in SRC_URI
Date: Sun, 23 Aug 2026 17:57:41 +0200
Message-ID: <20260823155741.2091982-3-peter.marko@siemens.com>
In-Reply-To: <20260823155741.2091982-1-peter.marko@siemens.com>
References: <20260823155741.2091982-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 15:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244041

From: Peter Marko <peter.marko@siemens.com>

This is partial cherry-pick for single recipe:
* 00864cf5bcb6d85ec73d338c3e17e263512409a4

It will allow future cherry-picks from mastear and also uses single
filename in downloads mirror between master and wrynose (tag is added to
filename).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/slirp/libslirp_4.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
index 734e59a59b..1b45fd3247 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e \
                     file://LICENSE;md5=cfea6044642fd63b90ce9d79f5db64d9"
 
-SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v${PV}"
 SRCREV = "dd76415fce457e319d665eb8210d05c5731360ba"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

