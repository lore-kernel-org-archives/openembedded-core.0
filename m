Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B6A78789FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:23 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y140-v6so9305363wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=P4tjeczz9fttez2ZmpaeoRi0/0N6GMLFlaMStl3bogw=;
	b=Mg+g8gQo2hzzZpjqlwccO0sKT89UfU5Q+piraVjpUHNpIjyGbd5oI5Gi4gbK4V0vcN
	/HG0SrpcyyWWr8TMbsNJKvDX+bhb+23OGnUIFjt/eXvWfVcY3EyBnjA+PhPBxE05tB75
	8tepSeatvm30wEEeo2XxUwpvMNlLny2xhiHHImkFoIaBB20EYAKO2LXpfhY5rqDeXeix
	MqlCOVIK0Ll/G7lExs0LgJjcJPP3DuxLkGI4nuos8QOqY6NDM/zKRCc0PWrRBc+I5Jb/
	TYLaRl8vXqxsllIx9Om+12SilKGY6k3LwGsAtnlGEOv3IBxCZOQrE5565VzU6PhxLeKw
	veDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=P4tjeczz9fttez2ZmpaeoRi0/0N6GMLFlaMStl3bogw=;
	b=COAI98/fYW95JfKsRge8qASUkxIGKg8jN3NPe8ZIQ/RvsxK4UwhoFfpSpOrZ29sLH/
	CwzvPBVJdo5jrhHE5Nu+FQrPuZh5P3V6LgVB5gFQBFiokbqsY9RCBY4BgRdwuxAPOOAf
	PmwjF/Eg+DaodRPHqQbvjWPtE5LH84DQlYGtdnMMc5LPf3ZDMVKpyaJBmN0SUwsJ9TLn
	8cVY4vHupD4ACe3gWz6g+aIukgVIuu7JtnhbXPO/YLTwLFaMC6xw2RGMh7BjP8VgrJq/
	+oppAaOdDaMF6rHFUfsX7RNel8KiSsKnZBC+HRJVvliZJ9xA3CfNK9/mQtZ70Rh8Dx2B
	qPWw==
X-Gm-Message-State: ABuFfoje48K8xXMTlGzAvw8taaIhmj5A2MCOmFOJs7YFZBDhd6l8qIOl
	mDVPspuMRPdfqyBpqm7ZgNo=
X-Google-Smtp-Source: ACcGV62SOEA/mMf7qExx5h5O9SbTqtkqbrvQod4EBhCJvusFq9FqTPz1xb6LUvV5ffRz8sH4h8NyMg==
X-Received: by 2002:a1c:c2c3:: with SMTP id
	s186-v6mr16069151wmf.16.1540217124174; 
	Mon, 22 Oct 2018 07:05:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:02 +0100
Message-Id: <1540217112-24479-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 03/13] gnutls: update to 2.6.4
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
X-List-Received-Date: Mon, 22 Oct 2018 14:05:24 -0000

Notable change:

libgnutls: Added the final (RFC8446) version numbering of the TLS1.3 protocol.
see: https://lists.gnupg.org/pipermail/gnutls-help/2018-September/004457.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.3.bb => gnutls_3.6.4.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.3.bb b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.3.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.4.bb
index 441bbec..6d2a11d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "d3b1b05c2546b80832101a423a80faf8"
-SRC_URI[sha256sum] = "ed642b66a4ecf4851ab2d809cd1475c297b6201d8e8bd14b4d1c08b53ffca993"
+SRC_URI[md5sum] = "63363d1c00601f4d11a5cadc8b5e0799"
+SRC_URI[sha256sum] = "c663a792fbc84349c27c36059181f2ca86c9442e75ee8b0ad72f5f9b35deab3a"
 
 inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
 
-- 
2.7.4


