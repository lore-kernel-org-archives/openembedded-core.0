Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 88F13782A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 19:38:53 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id x63so4979804pff.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 12:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EV/dyjDNJ/lg8qXjqOcp8PsTevIWZ4JKTQ13ai29S70=;
	b=umwZHrT6qjsH0ln5bXGjKva00D0OOeLyCmjeKj+tmofHMx7+jo4OGJUiZ9GfQax6Zu
	1q+HIIUxrWQoRyzSu8dUK67Z14nAq8y1UHxCLfeybtkI1uxPPw3jMbgUNyedpvgNnvn7
	+WBfBW2iy/6ImCBoETF4IooPhs0kpcqoofZq4deMOlDA01t6qQ+jJzt9vaU3s002EZHx
	1ghP7MwMYURhOUtjSW6qcYUBWkNTyCF2THmnHALZ9kxFyumcYNKyE+jr7t71nuR6NrJi
	tteCZ0dWfI2RRTNX83Wm6FKik76C2BIHKH6wwDr1BLLNPMlgJugHguVgIQ2lpfpCRbm3
	PiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EV/dyjDNJ/lg8qXjqOcp8PsTevIWZ4JKTQ13ai29S70=;
	b=pFCz52fO36gzBPKjkgF+XDqvdslvznFv7N5DgE4F6pp/rKTkG2q2FX0G6LIkvM2ELb
	7Rh9N08f0OInf5v0xb5d3sVxn7W+O5QPqKGmiAwJGYIHl/syr1G83bBp3OZ+5YyajNRQ
	Brv0Eul+tAe2pZft4JCcWv2mzPys7wHGowp4QSI8cKXlwhJz7tQGDEqOlbBYdGQKM8rj
	HXe2hE53d5e5W4FKTJpYBf6CRBOx00o5CU+nkkGOj0vlLujXM8mR+LsxYqi0bVYLS9Tl
	9qb/QsY2aB5zgxWyUSUNi/ne8hIks1/iAkERKnfS+nQ6kxHywamwbx22roxv9zrX/Fv2
	VIfQ==
X-Gm-Message-State: AKS2vOycqPTOO3/AZ9vr9W3bbnY/nQi3VPq5T/4w0/b+OVr7BGv7htwy
	naa+U3zLuhKoDszy
X-Received: by 10.84.209.236 with SMTP id y99mr1818119plh.198.1497469133638;
	Wed, 14 Jun 2017 12:38:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	r77sm1318101pfg.95.2017.06.14.12.38.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 12:38:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 12:38:38 -0700
Message-Id: <5e352b7889189ad21fa09130e7b5ccc0c80a44b1.1497468975.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497468975.git.raj.khem@gmail.com>
References: <cover.1497468975.git.raj.khem@gmail.com>
Subject: [PATCH 11/11] webkitgtk: Upgrade to 2.16.3
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
X-List-Received-Date: Wed, 14 Jun 2017 19:38:54 -0000

Use bfd linker on ppc, this is because gold fails to link
webkit libraries when PIE is enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch        | 12 ++++++------
 .../webkit/{webkitgtk_2.16.1.bb => webkitgtk_2.16.3.bb}      |  5 +++--
 2 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.16.1.bb => webkitgtk_2.16.3.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch b/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
index 5f58e4953e..a1ad248aac 100644
--- a/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
@@ -11,16 +11,16 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: webkitgtk-2.12.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
+Index: webkitgtk-2.16.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
 ===================================================================
---- webkitgtk-2.12.3.orig/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-+++ webkitgtk-2.12.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-@@ -86,7 +86,7 @@ static void pthreadSignalHandlerSuspendR
+--- webkitgtk-2.16.3.orig/Source/JavaScriptCore/heap/MachineStackMarker.cpp
++++ webkitgtk-2.16.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
+@@ -88,7 +88,7 @@ static void pthreadSignalHandlerSuspendR
      }
  
      ucontext_t* userContext = static_cast<ucontext_t*>(ucontext);
 -#if CPU(PPC)
 +#if CPU(PPC) && defined(__GLIBC__)
-     thread->suspendedMachineContext = *userContext->uc_mcontext.uc_regs;
+     threadData->suspendedMachineContext = *userContext->uc_mcontext.uc_regs;
  #else
-     thread->suspendedMachineContext = userContext->uc_mcontext;
+     threadData->suspendedMachineContext = userContext->uc_mcontext;
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.3.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.16.3.bb
index a52d93cfbe..5feca17be3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.3.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://gcc7.patch \
            file://detect-atomics-during-configure.patch \
            "
-SRC_URI[md5sum] = "d3bcf995a667fd9febb9ab991acf0ca7"
-SRC_URI[sha256sum] = "eb92383232328ce655b703c64370ed3795662479719ad1b4a869ed46769d2945"
+SRC_URI[md5sum] = "34dbbcad8a87a929519d93c67edd6d87"
+SRC_URI[sha256sum] = "204e9131da0101b9bc8765716e70a897121af04b964d9827cd9f20816a77b512"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
@@ -76,6 +76,7 @@ EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
 EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
+EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
 
 EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
-- 
2.13.1


