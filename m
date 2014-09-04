Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 84236713EC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 00:48:22 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id mc6so10904318lab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 17:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Fa9ZWq0zww0/S4JrVos6STWWVtV49pWpGjuM9AJqxg0=;
	b=vzK6sEQs42ZGllqOVYoPVHawMG/HynPzpG3FzJa0GcmbEdc2P/blEWMLkALqW8ZalZ
	ossg0ZgnEo4FL1yQ4jXiPurOhcAvTi/V9vFPBMbhXpBj+7lMIftlmLRaG0TsC2qvJzgl
	Z6WVYNYNZ+Y0/xnWGIedC7RF6kZR5EIdRm5zYw6dtLM3BMFhu2b4lxt6uIk2BV1szvqs
	oPLNW1GVpkkL+n3hNA8zcY0um49o7PW36aruYUmb90Tl5f1jAHzCEK56ny/D1XU6SP//
	7rL/a6I+DRlOO5uFGFnkMwJzO/Hp1QaKI+rR/HkFj2jjs3BsQhFPb/Dijyz2IyDICP9z
	ms4g==
X-Received: by 10.112.184.161 with SMTP id ev1mr827096lbc.82.1409791703706;
	Wed, 03 Sep 2014 17:48:23 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id k2sm38463lbt.40.2014.09.03.17.48.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Sep 2014 17:48:22 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.84)
	(envelope-from <cazfi74@gmail.com>)
	id 1XPLDo-0008Vm-Gw; Thu, 04 Sep 2014 03:48:20 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Sep 2014 03:48:16 +0300
Message-Id: <7da24a7036af281ee17d90c84bc5266c03b26164.1409791242.git.cazfi74@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <01fc289dc196b0e1bff3359fcfff1a3f33691302.1409791242.git.cazfi74@gmail.com>
References: <01fc289dc196b0e1bff3359fcfff1a3f33691302.1409791242.git.cazfi74@gmail.com>
In-Reply-To: <cover.1409791241.git.cazfi74@gmail.com>
References: <cover.1409791241.git.cazfi74@gmail.com>
Subject: [PATCH 5/6] pango: update to 1.36.6
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
X-List-Received-Date: Thu, 04 Sep 2014 00:48:25 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-graphics/pango/{pango_1.36.5.bb => pango_1.36.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.36.5.bb => pango_1.36.6.bb} (56%)

diff --git a/meta/recipes-graphics/pango/pango_1.36.5.bb b/meta/recipes-graphics/pango/pango_1.36.6.bb
similarity index 56%
rename from meta/recipes-graphics/pango/pango_1.36.5.bb
rename to meta/recipes-graphics/pango/pango_1.36.6.bb
index 5c20497..61ae359 100644
--- a/meta/recipes-graphics/pango/pango_1.36.5.bb
+++ b/meta/recipes-graphics/pango/pango_1.36.6.bb
@@ -8,5 +8,5 @@ SRC_URI += "file://run-ptest \
             file://multilib-fix-clean.patch \
 "
 
-SRC_URI[archive.md5sum] = "2500930093c3ed38acb40e4255bce2f1"
-SRC_URI[archive.sha256sum] = "be0e94b2e5c7459f0b6db21efab6253556c8f443837200b8736d697071276ac8"
\ No newline at end of file
+SRC_URI[archive.md5sum] = "1c27523c3f3a4efe4d9d303d0d240320"
+SRC_URI[archive.sha256sum] = "4c53c752823723875078b91340f32136aadb99e91c0f6483f024f978a02c8624"
\ No newline at end of file
-- 
2.1.0


