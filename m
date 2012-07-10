Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Soc5N-0004gb-EA
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 17:10:45 +0200
Received: by mail-qa0-f47.google.com with SMTP id g1so2527330qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 07:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=zs9lrx9PkBs4S/BMAvWwbpxrWh5DMjd7EmgRApIj6GY=;
	b=QJ7nrVG87KE51wHp3qAtlBUOyqvndlQ8JZ1SenflHIqNI6NQwLFSJRLSC1Faorruf4
	NJoISdPgii1b0fQ7NqWkp1pwpcPk412LB1DBbeJGeE0o/6k2AEomve0hCRkkIuOjp5ms
	BTwXYuE1zd4P1gZ2PTwtDfH0+LRmjJggfRwMp7etcmRpYRgokPfRvfPvj78s7Y3ASP/i
	in3TTijgMIqJ9OOfYkW3Nh4UTukORXIee6jcTp026wZ3mVgbPlS88tkDiKt4v3Yj6MhD
	YZEnTk9nFV0wTMyvdoD+4p3SUrOs1oiiVk47uwjTpB4vV1WehGZVooYnuG5lfKpUQzT2
	l5gw==
Received: by 10.224.58.201 with SMTP id i9mr80220844qah.39.1341932376769;
	Tue, 10 Jul 2012 07:59:36 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id n2sm65763443qap.10.2012.07.10.07.59.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 07:59:36 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 17:59:20 +0300
Message-Id: <fc4f70174dcfb24e7e4d2faa232fd7ae8b50bdaa.1341932186.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
References: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
In-Reply-To: <cover.1341932186.git.andrei@gherzan.ro>
References: <cover.1341932186.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmg0pOs2glLZKUvSG81nZYNwJELue0WpEd7Nm5oYyQzqhI4MZXChznAtASyfX0HcXopynSB
Subject: [PATCH 3/5] bitbake.conf: Add MACHINE_FEATURES_BACKFILL and append to MACHINE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2012 15:10:45 -0000

This is works the way DISTRO_FEATURES_BACKFILL does.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/conf/bitbake.conf |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 855ba6a..6a4d4ef 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -724,6 +724,9 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 DISTRO_FEATURES_BACKFILL = "pulseaudio"
 DISTRO_FEATURES_append = "${@oe.utils.features_backfill("DISTRO_FEATURES",d)}"
 
+MACHINE_FEATURES_BACKFILL = ""
+MACHINE_FEATURES_append = "${@oe.utils.features_backfill("MACHINE_FEATURES",d)}"
+
 COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "alsa", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "bluetooth", d)} \
-- 
1.7.9.5



