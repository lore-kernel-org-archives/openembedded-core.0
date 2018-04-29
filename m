Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C870972EAD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:16 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id z129-v6so747283pgz.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/9rrMQFaghaCEsnzXmiiGbYenaF9f5zbW1cyPGKz6eU=;
	b=MEGLlCHuBrRiorvq4YZdCUsZ/MMQvi7fURd2NSdcKd6+eQNb7P1ADsl7JlmLu+PkDF
	f1KVxcYzez7dRKXEYPyAxoWB3U1a+faO8lklU99vP1Uwugh0UBDAkTzxqHBohT6YNeoA
	zAEtGjjwcXkWKepLLopOEwEl6sne112Wn57DDbw1vcYmStCwyR4uoUuC0wZMMt/voH+F
	12LP4PL0pey6B++0lwJmOfStuhE8OskTy6Z5zYh1KH1WXg71TS92n6VDoXe8qll9Fz47
	BQ23fMt93VvisCXpm/mjNVKvZPK6r2mMFsY8My7HbY2SY6zRJGalpEBQqHW2R8Nvsfok
	qVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/9rrMQFaghaCEsnzXmiiGbYenaF9f5zbW1cyPGKz6eU=;
	b=lr+VUjsqypXXa9NkbPD6Tm39NuW4ssUUEyfbRZ2N4U28/dn2lUS+gJb79/kg00bKDM
	qjghY+1uyLNov79VrSVO3PBqV5/qmjJivr5jfSvv0xzdWyk0C09ij7+SbAB/8fnI0ptS
	YI6bCPZSDtTgE1Yj2baiS04pI1JNdyBuhUUzx1JeL+t8hgALMAqKuj+dv/6uAQtcYgRD
	hp9+omc5Ib76ETzMtsg3fsVmVgeTzc5PkesIU/GwVbhJ3YnLrEfanbASDOgGd4PLXo9Q
	us6z2+GwqGBqJhXdj2aKrWItvxf2UBXQQfeuCbD/zx5eDglvptuoCy+gnSma9ZLhCPfn
	t3cQ==
X-Gm-Message-State: ALQs6tCKE2pw40+2ITTgJKVvdqPvDS2/M8noQOvUxzwnA98KUZdS0OfP
	aBhaKdLJt1waJYmGbPPNgIPrbw==
X-Google-Smtp-Source: AB8JxZogUsQ2L+7ejrXstWzrmd2VBmr2XKMDzAUIXMVleOmhs5n3+BG75oUVBmfjFVSoJSYgd/deOA==
X-Received: by 10.98.237.18 with SMTP id u18mr2974529pfh.127.1525030577845;
	Sun, 29 Apr 2018 12:36:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:35:49 -0700
Message-Id: <0cd556741ed6086c2089272835ab8a0ef7f3e819.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 02/24] musl: Depend on libssp-nonshared
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:16 -0000

libssp-nonshared is required on musl since
it does not implement the gcc runtime piece of
libssp, which actually it a gcc optimization to
reach to __stack_chk_fail

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 9f8c5126e8..a57460ddd2 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -22,6 +22,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            libgcc-initial \
            linux-libc-headers \
            bsd-headers \
+           libssp-nonshared \
           "
 
 export CROSS_COMPILE="${TARGET_PREFIX}"
@@ -65,7 +66,7 @@ do_install() {
 	done
 }
 
-RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev"
+RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
 
-- 
2.17.0


