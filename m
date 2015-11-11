Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 64F3F770DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 14:37:58 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so115392645wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 06:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe_de.20150623.gappssmtp.com; s=20150623;
	h=subject:references:to:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=T266pOC58ezFREQmyQANK9luHpKLJuSsGbNuGg6bq1k=;
	b=FYkJoOC0aatgQOtv2DTk86TmKWRwoBGv45hfRkFXkbV3CUi4bHIUtmkqRaQ4cbW3J4
	tHBUbglpcMABDzAFU2nxbrS5CjzYUogI8YX3oEFI5h1hTx/l/LtbANWuqEsjNN3voMET
	2y2Bz+hEFkJifYRF7UNycqXzZUfLn3iJFrr8IVgO/8YdNWB4mZtjVNU2vAhQFdZUmNmo
	7gOyC88tkP3FtboQpnwCtGhfDnLFdIFrChEmyAIKPB2ArDMsuQwJiDX1pPc+5Jcma8Br
	SCq1ZJk87+F9j2muui6L18MMUg4Mw5xkU9qnt23IoTK+4EHg2i2SEEzHgx7cOVQUmi2G
	SiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:references:to:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=T266pOC58ezFREQmyQANK9luHpKLJuSsGbNuGg6bq1k=;
	b=VL4+IDDV5Egydav3ZUXKnw8KSgm4jpOkYy1wtXj2vJW7X/qurX0JaVEeX6yHXR3CG4
	wn6osgHFGIXcHZPgrko/QOwxFdvfdvtEkoX40zPbkYqdULqSOyoN3MGGmEC8uuCDGlDR
	Cw0HFja7JOVsUI7YkvRCzMj2t//lJeHjfIClPeisXfhtaPjX4mVTrw9PgtYllabH9rBY
	KdOq/nEquhRY8UCnKEPfO8NvUkgrdEBt0CBi+ea9ZarWoiVML4O+zHZGE6MYc3bauRaF
	CPql1diu5CjGRirhXbNW0gDeYVYHwE4FRr04/z9gAX7GYPiz0AHTXkqoRx1eLWzJGxGR
	/nRQ==
X-Gm-Message-State: ALoCoQlAhlevqMRlKwW7SOWhByQtS3lTiA9Sfonp4HtMkfcLNrC3d4v7nPT36o8W4dTj3AXtAh7M
X-Received: by 10.28.170.65 with SMTP id t62mr12379035wme.1.1447252678459;
	Wed, 11 Nov 2015 06:37:58 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	pc2sm9323634wjb.11.2015.11.11.06.37.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 06:37:57 -0800 (PST)
References: <1447161703-4174-2-git-send-email-sledz@dresearch-fe.de>
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Forwarded-Message-Id: <1447161703-4174-2-git-send-email-sledz@dresearch-fe.de>
Message-ID: <564352C5.9060208@dresearch-fe.de>
Date: Wed, 11 Nov 2015 15:37:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447161703-4174-2-git-send-email-sledz@dresearch-fe.de>
Subject: [PATCH] busybox: add UPDATE_ALTERNATIVE for syslog-service
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Nov 2015 14:38:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Use ALTERNATIVE mechanism in OE to manage the syslog service to
avoid conflicts with other syslog implementations like rsyslog
or syslog-ng.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 meta/recipes-core/busybox/busybox.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 4d4709a..4531dd1 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -316,6 +316,12 @@ python () {
         d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-startup-conf')
         d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-startup-conf', '%s/syslog-startup.conf' % (d.getVar('sysconfdir', True)))
         d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-startup-conf', '%s/syslog-startup.conf.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
+
+    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
+        pn = d.getVar('PN', True)
+        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/busybox-syslog.service' % (d.getVar('systemd_unitdir', True)))
 }

 python do_package_prepend () {
-- 
2.6.3




