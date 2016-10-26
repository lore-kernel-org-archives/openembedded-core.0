Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8175971AD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 12:07:27 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y138so3309730wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 05:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UB14nq3qC7YEB6+N4Rk6bGhSF7hr51iQjOcDCYHl0X4=;
	b=XwQN0tpy9D849RPzkQz9q/e7bFkZEk0L0f5cGhdUCECpC1qJ50dCsF797hOhD3cb76
	/ID82Y/njeR2rF6qidvNmeR1Gtu5kMgeQhPZLz1LLLUmq7Ef8xe969z9gnRj8GV3jkq0
	FnnaBeoybI7wrc0kPHXa2p3mFMklCHR2vB08mPHJpJXX7yzVBDEsuMUbqrI+mgWZe1K1
	PVzzi8o6EqaUZvXXhHQu9+hEyq+WwYchyf7iof+tDZ/pl/1uIflQld5HYQ9W2+9jshnM
	fV2J7jSk4/RZKhQlSmLwmmn9dU5SbOqRKGcK4rM71k+B2H9VDXoSPM7BOKflVNhd9KIx
	ncyg==
X-Gm-Message-State: ABUngvfRKceI3jcvMSHDyYgkx1GLOzocFB5uAtBIhqMqXI3zFBgVJlyf8OsI0rcWUu7hEw==
X-Received: by 10.28.232.23 with SMTP id f23mr2570484wmh.125.1477483647903;
	Wed, 26 Oct 2016 05:07:27 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id u64sm9258468wmd.6.2016.10.26.05.07.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Oct 2016 05:07:26 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 13:07:25 +0100
Message-Id: <20161026120725.27983-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] boost: disable 'wave' in MIPS16e mode
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
X-List-Received-Date: Wed, 26 Oct 2016 12:07:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

This doesn't compile, see
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77757#c2

Signed-off-by: André Draszik <adraszik@tycoint.com>
Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index ef16533..1966d3d 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -34,6 +34,8 @@ BOOST_LIBS_append_x86-64 = " context coroutine"
 BOOST_LIBS_append_powerpc = " context coroutine"
 # need consistent settings for native builds (x86 override not applied for native)
 BOOST_LIBS_remove_class-native = " context coroutine"
+# does not compile
+BOOST_LIBS_remove_mips16e = "wave"
 
 # optional libraries
 PACKAGECONFIG ??= "locale"
-- 
2.9.3


