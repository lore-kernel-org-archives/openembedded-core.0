Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4999B607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 23:04:33 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id 65so57493774pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 15:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ix4pnBW8RvP8PZvmQXuiF9BZDG55H/ZR+LpX17swM2w=;
	b=SKA5U/JSEQSn0/b3uo/c/kiNws6yuj/UbGAKcEV5S64NToZ16EQcHDErKJnEQuqstB
	e04RWInVQJeBzO6MHLxkfp/VhVx3lBP7Iz9c1qCF89Uk7CI5D9Pvh+bB8L5JHr7iMCS6
	RNVI6PHzu3cOkyVzc969ensCyOIYNRLmt4SRLk9yKPDqtKCwarFljIGH0P5NlS/OafWk
	o8zXLZrKoEI3rsVw1gxIo7yfwQUZva9PVI5QUZ/1Kw6RVgSvkjTHCxch3yNAgjTX8L/w
	dvWHi9gjyj8moVUWRlqBVpxw0/AIqEDewL1ucdHRupZlSZMXzh/WAfLxPShu28Shlvgx
	NKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ix4pnBW8RvP8PZvmQXuiF9BZDG55H/ZR+LpX17swM2w=;
	b=V/R+5Sek+k5O3Rbgq7RiuQXiSZSNrf58kuGBA4xu9wfqbiw2+Zhbt8SCfWUGUjnL9K
	NA9kD7cCJxE6VvP8O8bLRS2wDPWfogJZosLUhWjfs9AFksyl2hQKKiwsRGX/XSBRCCWf
	Nsfay5kDNtVLxRGzPCJDdPuuOqkGrNSG/c+pn89fBjhqSA9sx2hqk/gk0HyLVc07xjl9
	HRiC4lYKwmci4jdd2k1n1PIDw+Jjz6vwiRRymJviCgzbuSQdriByCi+vb1bM9CzDZE/a
	XshoRLswD0GRa4ZOwB99sXstz0PF8IleeLIvFnYfeN+47VxmyTvoIQ33WpwKcjy+ZMTQ
	AGbQ==
X-Gm-Message-State: AG10YOSORrgjh9Qt8ZkrAu4h09yYWjyUAHM2uAtzSF0luP/ykA4SbKJ5XXftWJhulUa1WQ==
X-Received: by 10.98.14.68 with SMTP id w65mr15260513pfi.146.1454627073986;
	Thu, 04 Feb 2016 15:04:33 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	76sm19535589pft.44.2016.02.04.15.04.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 15:04:33 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 15:04:17 -0800
Message-Id: <1454627058-26663-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
References: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/5] gstreamer1.0-plugins-base_git: update to git master 1.7.1-79-g6414289
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
X-List-Received-Date: Thu, 04 Feb 2016 23:04:33 -0000

Includes an important fix for:

  https://bugzilla.gnome.org/show_bug.cgi?id=760938

The fix is not a simple backport to 1.7.1, so just update to latest
version from the current git master branch.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index 8ac3a7b..956b24a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -14,12 +14,16 @@ SRC_URI = " \
 
 PV = "1.7.1+git${SRCPV}"
 
-SRCREV_base = "5f98203bd753c32666c8fa7a2fde6d186c2a4247"
+SRCREV_base = "641428966e09d16b0a46540040f2faf3791eb7c9"
 SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
+
+	# Temp solution for git snapshot: relax version checks so we can build against GStreamer 1.7.1
+	sed 's/^GST_REQ=1\.7\.1\.1/GST_REQ=1.7.1/' -i ${S}/configure.ac
+
 	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


