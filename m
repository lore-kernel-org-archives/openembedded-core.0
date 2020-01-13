Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6C72B7FCB3
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:50 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id g6so3950478plp.6
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lsxWaYGbqikKsAcO8zU+dHYUe0haXlFrDheUIT45lj8=;
	b=GI1ONG4wNsPuq5/RwqShbkzefsg3jP20zDxmOEr63kisfiD7ehUh0GoaaPguK0BjqQ
	qULxQmkbGCImjOYLq1dzEUSjpXiyOUpP7Umz3W23n0irLpmiuKCgbqqw5NE3Wk6pn/ff
	4xuCv6Ir3Bh5M9JzPmKMk+s8VaIiSZsTlxKUiqGekfvj8HYbG5aWQD+BkjSrVruHDqAg
	nm8WAy/sqHO47qWMLPGt+ca6LFnjHsYtd29wgYkl3Qhiu4lrbs9GZdf3wqM9Xo7Rg6SO
	/aYxXvf5BjrZJv/cyszpnlDm2Vqac8K4g6IYnOliNXoX9UWnOHiRXdkD/Y4wH+Qb0+Aq
	sBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lsxWaYGbqikKsAcO8zU+dHYUe0haXlFrDheUIT45lj8=;
	b=alHFygD77bL3Lxjcxr43yh9Sd1Wdx0j605ZxGWv6amxf3JLUgWl0ItCiQszjfv8HZx
	oQ6xrV80Su5lHodkP+WXqOtTwxzxmQk3Ig1PZzheCggO1+B9LfKDO0HjMJryjrAQ9UfF
	1DEYapi04or6Pb1ZxuCx7vyViSP069t6Hg5otKKJCIoeWQhNzfNIMTt0JmIlZn1J43xE
	GYLdCSHNIHIBZxkHee6kQAE2SSqUTDHXpBSnmxbizDAU3w9Vhf9Cnz/L6cI2YefGhVm1
	w5D+/2GrfUr6915xZOttQ5kPgusmICS6q865FV2u2E+qaXBMddtdxtYEPe+f28ZkjYKY
	9IBw==
X-Gm-Message-State: APjAAAXpIrAwu8Q37oQuqxwK/vkWTjYVplYTc8xryAV6QJ1XnRq6Bhtm
	crfNg2eZbwnjhII9ryeKsadaGa7h
X-Google-Smtp-Source: APXvYqyWHCtYiCM9F3x33MPgdEGyvgI94Keu/Xnt3FXuBPCBENKTYeKoxjFv3miyFr++5pdk09VJ+w==
X-Received: by 2002:a17:902:8f98:: with SMTP id
	z24mr13927595plo.51.1578929451408; 
	Mon, 13 Jan 2020 07:30:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:15 -0800
Message-Id: <8bfe83d53c39e4a88f808af617db7db091694841.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 16/28] cve-check: we don't actually need to unpack to check
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:50 -0000

From: Ross Burton <ross.burton@intel.com>

The patch scanner works with patch files in the layer, not in the workdir, so it
doesn't need to unpack.

(From OE-Core rev: 2cba6ada970deb5156e1ba0182f4f372851e3c17)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 1c8b2223a2..3326944d79 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -62,7 +62,7 @@ python do_cve_check () {
 
 }
 
-addtask cve_check after do_unpack before do_build
+addtask cve_check before do_build
 do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
@@ -70,7 +70,6 @@ python cve_check_cleanup () {
     """
     Delete the file used to gather all the CVE information.
     """
-
     bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
 }
 
-- 
2.17.1


