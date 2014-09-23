Return-Path: <mgloff@emacinc.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id DB8CD714A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:33:13 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id r10so5303075igi.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 13:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ufIeh2UIdgha2LKWIXc9ukEgDbKGs8bg0qlsVZ77qbY=;
	b=iRQPNcq41E4+qNML2jM5s4dD5TgSsE1wbfc8udDtg6BClIebf2vuhXijWYBN0k9OW3
	QqZob1Uq6XLtZWcaSUA5GI6iiEiUI0f/HH9NJ1hLWKbswAX6Z3+HNP7LAlYBQVIGFelH
	K1+lGFhuiVKYECvltqXh2JtiUyF1nADfI1Ecwecot7W7VAmgcXu8JjD7i7URfDAThzJp
	9f1mJNd5d5JpF7NUk2uDT3RpD6uDjJ1LQnreJV/dKE9MnpOVISKYSlXGfVqXrO/AcddT
	1KvV+1cMOsDCGi36kA8Q7hr9Tembr4g2QlG6Gl+4Qe77BKljZrKi9GkZbhHzYCu+v3Ls
	8VtQ==
X-Gm-Message-State: ALoCoQnAku7S6YU508NAlKFkffHOYoqVjvc1JtXOohQCvzpNCKOTA5rdZchEhXNs7AZqLspJTJ//
X-Received: by 10.50.111.167 with SMTP id ij7mr25233647igb.49.1411504395134;
	Tue, 23 Sep 2014 13:33:15 -0700 (PDT)
Received: from eng-20-lx.emacinc.com ([66.186.100.194])
	by mx.google.com with ESMTPSA id l9sm2512651igu.17.2014.09.23.13.33.14
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 23 Sep 2014 13:33:14 -0700 (PDT)
From: Michael Gloff <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Sep 2014 15:33:08 -0500
Message-Id: <1411504388-4251-1-git-send-email-mgloff@emacinc.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] syslog: Change unused variable declaration LOCAL=0 to LOG_LOCAL=1
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
X-List-Received-Date: Tue, 23 Sep 2014 20:33:16 -0000

This fix allows the correct appending of -L to syslogd arguments when both file and remote logging are selected.

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
---
 meta/recipes-core/busybox/files/syslog |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/syslog b/meta/recipes-core/busybox/files/syslog
index 2944d3d..89c4d12 100644
--- a/meta/recipes-core/busybox/files/syslog
+++ b/meta/recipes-core/busybox/files/syslog
@@ -28,7 +28,7 @@ if [ -f /etc/syslog-startup.conf ]; then
 			if [ -n "$ROTATEGENS" ]; then
 				SYSLOG_ARGS="$SYSLOG_ARGS -b $ROTATEGENS"
 			fi
-			LOCAL=0
+			LOG_LOCAL=1
 		elif [ "$D" = "remote" ]; then
 			SYSLOG_ARGS="$SYSLOG_ARGS -R $REMOTE"
 			LOG_REMOTE=1
-- 
1.7.9.5


