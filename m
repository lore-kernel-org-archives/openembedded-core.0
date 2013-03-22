Received: from mail-we0-f176.google.com ([74.125.82.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6KH-00005c-RF
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 19:04:36 +0100
Received: by mail-we0-f176.google.com with SMTP id s10so354513wey.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=sakGhZ1XRge3jn6hICiJp9qYKNUKAoeMyHBrUhMVxLQ=;
	b=lUIUpmAD5opuZBybEj0dBE59x6JPAQw9aaWGld8hKO7LuZVNXSDacNd5ZrKoHRnhtv
	xyspzfmrJttI52wNKJqFCWwxJ1+vOPvAra81nqtOdHT/wgRaICOU+H/KnDG9VYeGudPv
	wcUbvEmYHUKAlZUIdUyUhSxPHsa5ZXmxuVrHYRn3fs8+HhBSrvP3mvGGMkJZUBrRSsW4
	8qez3v9stNhuz2nP37FKdssW1YRonwJ/3ywF80yjTUcMCHaUZn3P1DnP/FUNy3EZ7tec
	EBytAuYXQX5KH42bxWV6ddPjfjoo7OpS5bjbTeOSjWI1lkOr2E9cAb6SyRtOHqik28CF
	GMvw==
X-Received: by 10.180.185.204 with SMTP id fe12mr4680366wic.2.1363974119182;
	Fri, 22 Mar 2013 10:41:59 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.58
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:42 +0000
Message-Id: <0e1da1e227c8e52087f7a52f8501a81cd28e76c7.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlj56E0GmAlgwic5HowcT1wy4+0s/lt18fl35WM6wr58nswPeRUZ1vEip7ImcEZz3KJ7oCD
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 22/22] systemd: recommend systemd-compat-units
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
X-List-Received-Date: Fri, 22 Mar 2013 18:04:39 -0000
X-List-Received-Date: Fri, 22 Mar 2013 18:04:39 -0000

These are more than useful as they ensure some services are not started twice,
and cause the first-boot postinstalls to run.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index d07fa95..5ba3a23 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -180,7 +180,7 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 
 RDEPENDS_${PN} += "dbus"
 
-RRECOMMENDS_${PN} += "systemd-serialgetty \
+RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
                       util-linux-agetty \
                       util-linux-fsck e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
-- 
1.7.10.4



