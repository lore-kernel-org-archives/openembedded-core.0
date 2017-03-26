Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4380F71AC1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 19:59:07 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id p22so5250655qka.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 12:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=U9z7brU3rrjjhSulX5Ory7vFq+ti8Zgqhr1WKstyBw4=;
	b=JemGP3XskbJE7bzUrDmcCKKAprw7TNlPJ27wv3UBMHzjO5JX5UbtRel66QWGVXp5La
	5qPYstHLWbPyOU3wAebg5Oj1BhCEo1ib0Z5w/46G/GpIeBLBqPnNpFazlLt0lMirbP2R
	lGr4OhYlDhrb2GtG9MIOHarBsZ61/CozEC2G4v3ixFh0nnc8ypEyFppgZC1uhwazcwf6
	XJJ6sjp2vAEH++BDFSmVPfZXZuLQFjFLmvm8rvmJo4MEEXNarDjKfniPian/PgV2hBop
	ujFNj/BCt7y6LkSDz79oJ4CB9gMOvewfgeCVaC7pKhVeITajzY42xMrN7/599eqldGXY
	i3KQ==
X-Gm-Message-State: AFeK/H2L48FhVWvfAfQpY1eUmZ7VNe5+0NDvvrAMjFuWZYEfbQ/OPK6LG5/MAB4hpm3cYw==
X-Received: by 10.55.97.67 with SMTP id v64mr18649767qkb.80.1490558349065;
	Sun, 26 Mar 2017 12:59:09 -0700 (PDT)
Received: from localhost ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id d4sm6418340qkf.30.2017.03.26.12.59.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Mar 2017 12:59:07 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Sun, 26 Mar 2017 16:59:03 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Mar 2017 16:58:59 -0300
Message-Id: <20170326195900.15990-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.12.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] mesa: Update to 17.0.2
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
X-List-Received-Date: Sun, 26 Mar 2017 19:59:08 -0000

This is a bugfix only release.

,----
| Bug fixes
|
| Bug 68504 - 9.2-rc1 workaround for clover build failure on ppc/altivec: cannot convert 'bool' to '__vector(4) __bool int' in return
| Bug 97988 - [radeonsi] playing back videos with VDPAU exhibits deinterlacing/anti-aliasing issues not visible with VA-API
| Bug 99484 - Crusader Kings 2 - Loading bars, siege bars, morale bars, etc. do not render correctly
| Bug 99715 - Don't print: "Note: Buggy applications may crash, if they do please report to vendor"
| Bug 100049 - "ralloc: Make sure ralloc() allocations match malloc()'s alignment." causes seg fault in 32bit build
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/mesa/{mesa-gl_17.0.1.bb => mesa-gl_17.0.2.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.0.1.bb => mesa_17.0.2.bb}       | 5 +++--
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.0.1.bb => mesa-gl_17.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.0.1.bb => mesa_17.0.2.bb} (82%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_17.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.0.1.bb b/meta/recipes-graphics/mesa/mesa_17.0.2.bb
similarity index 82%
rename from meta/recipes-graphics/mesa/mesa_17.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_17.0.2.bb
index 9e491c28dc..2689e8fac2 100644
--- a/meta/recipes-graphics/mesa/mesa_17.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.0.2.bb
@@ -5,8 +5,9 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/mesa-${PV}.tar.xz \
            file://disable-asm-on-non-gcc.patch \
            file://0001-Use-wayland-scanner-in-the-path.patch \
 "
-SRC_URI[md5sum] = "6a7e768241846c8c69bbadbf904dcc58"
-SRC_URI[sha256sum] = "96fd70ef5f31d276a17e424e7e1bb79447ccbbe822b56844213ef932e7ad1b0c"
+
+SRC_URI[md5sum] = "8f808e92b893d412fbd6510e1d16f5c5"
+SRC_URI[sha256sum] = "f8f191f909e01e65de38d5bdea5fb057f21649a3aed20948be02348e77a689d4"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.12.1


