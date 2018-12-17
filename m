Return-Path: <jed.openxt@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id BB50E6079E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 18:08:32 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id i7so15106417qtj.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 10:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9LqczB796PRToL3zOd51/MwjsQsL7jjtUPMQzgkKkn0=;
	b=WhXb5Ae69LxTgX35P4NcSOv5i7o1OXcoveo8HciUAKiV7Xl8R6V4/fIIrmWR5kXrVD
	0k9EKNo2D1g4JqO9xUSr+BtF7BmW5gp8ziBkz/NLY7vVbga3q7TpKncx0mY6pyz6acOI
	x8SGWA03IlcAD1AGcfcZJnU0dMiz/t5QjdgGuCLbIIy4kjc4BbAQhVGaVQW8J3l9HGMT
	5RaTcJEZ00gKWipTK1E9E7ATQ3KAyJ20RkEpH+m5sLcRPyN7qeI90lGoGzVJ8yf/qG3z
	r2CF0YLdN/mXo95FY4Cod0zQltFxJgz0qC6gtCOCX324LXibxNlOEIiygrtJZ0POP561
	UXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9LqczB796PRToL3zOd51/MwjsQsL7jjtUPMQzgkKkn0=;
	b=pAeJ5WmaeCCA6FSHG7kvuu17T5ug9tVeYTNseAOJiTpvAx7ZBWJf1GHRJNlkaxCeye
	DyiGvCJcTYiehVTpqU74CSz4zIcIiTY8GJPJ9r0gUX0CqsDbB85b7MDSm2H+MB7jOKKe
	hBSbtWY4yUmO5gkCOo/vn4v84YJrMyyn+BwKNXcQw7fGUK/WahFImkRjmiJNkdsT/CG5
	YR0O6Ei2Q3BWJC7McI5iWxuaY9Fyo9750MO3TFY+P5SaUhjwIXO6Q6BuyU1apSiebk2J
	ctnXZ76RFmWtU4lfLrGZrv7cPcO2vbocMU77jk/zvHD7bDpoMnu685lPx0xswDTwV6Aj
	xMVQ==
X-Gm-Message-State: AA+aEWYANHqV4R6YxIoae9eLEe8IjpnGANQibJJ8ingO4pGeHiaXW937
	ici6kxLrrtN42952/F6YBnBpnS0Z
X-Google-Smtp-Source: AFSGD/Wt1ue7UFztDEsxa/AkYb1QkjSfF5tUy1SSPJw3J/bMPTNSObS0kBVN4cxSzSDR2XlmTCyCRw==
X-Received: by 2002:a05:6214:110e:: with SMTP id
	e14mr14195256qvs.10.1545070113480; 
	Mon, 17 Dec 2018 10:08:33 -0800 (PST)
Received: from jed.securext.net (50-205-235-218-static.hfc.comcastbusiness.net.
	[50.205.235.218])
	by smtp.gmail.com with ESMTPSA id e49sm7906582qta.0.2018.12.17.10.08.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 10:08:33 -0800 (PST)
From: Jed <jed.openxt@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2018 13:08:23 -0500
Message-Id: <20181217180823.16207-1-jed.openxt@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] at-spi2: fix dbus-daemon path
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
X-List-Received-Date: Mon, 17 Dec 2018 18:08:32 -0000

"dbus_daemon" is supposed to be set to the full dbus-daemon file
path, not just its directory.

Signed-off-by: Jed <jed.openxt@gmail.com>
---
 meta/recipes-support/atk/at-spi2-core_2.30.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
index 536431f7cd..d7ea9be87f 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
@@ -18,7 +18,7 @@ inherit meson gtk-doc gettext systemd pkgconfig distro_features_check upstream-v
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
-                  -Ddbus_daemon=${bindir}"
+                  -Ddbus_daemon=${bindir}/dbus-daemon"
 
 GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
 GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
-- 
2.11.0


