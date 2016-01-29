Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 38378771D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 22:08:58 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id x141so4306482oia.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 14:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IrvTZ3joI+aOVaRhg3U93wJ0KqY+UFVjYnUT4TuQJ7o=;
	b=Gvng9pdQEHIrH/sbLHBF8p04uYlJKQ47KbDFEj1vnLzlrjhlw/gTdmfOdGTLNpKDN4
	jyqMDO3alukdz0/TDYXwoivTpUx34fYf4TAFYx/NZbpp3TESGA7y/YyGiB8ocLRelB7h
	ycH62OLrPLR5QbSlFmc2iwnV86QugKih561QLzPD6zCuj/CDIV+GJ8gs/KGfPpgYlWNv
	eN7GOfB2ag9y+GcQfdqGvU99BMux6EqENWkjTEfLBJr9wk/tdIpHzDesrU3zcG8/miHP
	29ycEUATvAvhCz+NbL6Fra7FM4meWSgHk5ZSsb1qhIyNR7tmc5IfNAUydil51El00yPC
	BK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IrvTZ3joI+aOVaRhg3U93wJ0KqY+UFVjYnUT4TuQJ7o=;
	b=eME4k0USyvA9UiFEcu406JV//wlAwHEBrEVaAJChLM1hE9sk2KY/AtfF0jm5qnLRnA
	GWbavD6FRUqITndDE1T9oKR8tA2sEud3WxaRMPV+GAbNYVUu66Ekgg+Uf9G6b4FtYrh0
	CrZYHY+CiK0gXOUjdCt32eJi7x1RHRxQoI0qdXsgBRYdznDnU9MqhxTl0wSXRyMRhn/k
	ko4RCgP24+HpCmoh3CTtWa0B7ELONodBGWAgVYQd5WKOzsKyeSA58e5tz2TEqpZyGIz9
	Erx2r7L09Y/JBCVvTNVeZRL520TKNlcPGir90HABRq9z9ObfU216JL7/5jTtp/T3OrPg
	MuJQ==
X-Gm-Message-State: AG10YORFgirkODsNT0lJpyERfT2vxn2Ezox9esLUiNCInnz2D9d/lAR+BhdrD9dDK/4tEw==
X-Received: by 10.202.168.201 with SMTP id r192mr8208356oie.44.1454105339686; 
	Fri, 29 Jan 2016 14:08:59 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id f2sm2724302oig.2.2016.01.29.14.08.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 14:08:58 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 14:08:48 -0800
Message-Id: <1454105329-11302-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454105329-11302-1-git-send-email-armccurdy@gmail.com>
References: <1454105329-11302-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] pango.inc: limit ptest specific do_compile_prepend to target builds
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
X-List-Received-Date: Fri, 29 Jan 2016 22:08:59 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/pango/pango.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index ede1150..63c7d1e 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -30,7 +30,7 @@ LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.8.0"
 
 # This binary needs to be compiled for the host architecture.  This isn't pretty!
-do_compile_prepend () {
+do_compile_prepend_class-target () {
 	if ${@base_contains('DISTRO_FEATURES', 'ptest', 'true', 'false', d)}; then
 		make CC="${BUILD_CC}" CFLAGS="" AM_CPPFLAGS="$(pkg-config-native --cflags glib-2.0)" gen_all_unicode_LDADD="$(pkg-config-native --libs glib-2.0)" -C ${B}/tests gen-all-unicode
 	fi
-- 
1.9.1


