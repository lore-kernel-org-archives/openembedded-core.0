Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id C5D7460155
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 13:15:47 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id f8so1587728wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2014 05:15:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dC6FYctUJTBbcWOniwxv/6tE18mR0mO9EvKCbcm8hkU=;
	b=my15O58RXpSQVVIJskvvo2mUMkQq07BKg7unVZjMSzQBK9Igb0ALT/0il2q1Ja9Uu9
	JaIX9ZMOStLiMkzLNL6p68BKRoMczKas6woMiJQnEq9Y+JCXAVoukZEDKHqLBATL9F7H
	HZD2OGDU/83irRiwuxf+HE2w8AV9Z64fWgZBU/HHcg/rQ9AbT1SNgMQLEnuvtNX2vN3b
	BeJAsl6Roop5Rme3PjOlmT+iB2nLyPkBmf50jLUc+d9aRkzlw9xTcJx+R/5gsutNDcon
	VXm5JrhnCpwsAKoKlwHAmUCXCbHA75FNgOB/J0EwVr80J7HPh1Djp8r67ToIIVQ41HJb
	iRxQ==
X-Gm-Message-State: ALoCoQnRVtJzKKuW0b5aCh6HUY2LEOAWRrvovkE7LylHFMw/qJ41beYgF5vQDuHy+d1fh6p5pUX+
X-Received: by 10.180.149.206 with SMTP id uc14mr6936391wib.10.1391692547893; 
	Thu, 06 Feb 2014 05:15:47 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id cm5sm5648217wid.5.2014.02.06.05.15.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Feb 2014 05:15:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 13:15:40 +0000
Message-Id: <1391692540-24139-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1391692540-24139-1-git-send-email-ross.burton@intel.com>
References: <1391692540-24139-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] systemd-compat-units: don't mask dbus, the recipe does this itself
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
X-List-Received-Date: Thu, 06 Feb 2014 13:15:48 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index e653470..fe4c50c 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -16,7 +16,6 @@ SYSTEMD_DISABLED_SYSV_SERVICES = " \
   hwclock \
   networking \
   syslog.busybox \
-  dbus-1 \
 "
 
 pkg_postinst_${PN} () {
-- 
1.7.10.4


