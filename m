Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Mk-0000KI-CW
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 19:07:02 +0100
Received: by mail-wi0-f176.google.com with SMTP id hm14so8149913wib.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=6yDRBlgDgHft0CiX4Ou1zVy9+M5EsDZ5MuwRuwfo8eI=;
	b=HHHC+K+JjIUKjgLjUzxygzsKxZ+JVVh0KDCL54SU0csQksipEPWozLR35RCSy5XTTW
	0qfz9ll7l+8TGHBwLPmwuK92ysV43liw19pk9XHEeMIzQubDglmqtnzdjbwffdKgr3Dq
	ihQ6qe7aPe03F2ROmEJcIhvrzZEDibLgpK5mVWipEG+JRc97lXdb1psfIbhXu4HGCqsz
	sPYZi0mfkwT2UnuXMxa7T0V7C+zmgdF6Bg7NsRwmO6efuY+/o5+yhbfvkq6/fg9ztlSz
	U0YmBxa4WOYSgpJ8occRtx6X0FTGJmZRU+FZL80Owim5/VogsN6WTmOr5QkHfTij1Nb9
	qIHA==
X-Received: by 10.180.75.110 with SMTP id b14mr13014457wiw.21.1363974111763;
	Fri, 22 Mar 2013 10:41:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.50
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:36 +0000
Message-Id: <657f4be6bd7fc0d2881f93698102a4788902d357.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm6+Maxa1RweVhKFN8FPytRwhFxdB72Oaa1T4T3ZRftKZROMY8oP3eaBHUuCTjrBEXxBRss
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/22] bitbake.conf: explicitly backfill sysvinit, not DISTRO_FEATURES_INITMAN
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 18:07:23 -0000

Reflect reality by backfilling sysvinit support, instead of whatever value was
in DISTRO_FEATURES_INITMAN.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 01ebad4..cd5d61e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -730,7 +730,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio ${DISTRO_FEATURES_INITMAN}"
+DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit"
 MACHINE_FEATURES_BACKFILL = "rtc"
 
 COMBINED_FEATURES = "\
-- 
1.7.10.4



