Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2Jod-0008QA-1u
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 12:02:30 +0100
Received: from mail-bk0-f72.google.com ([209.85.214.72])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Feb 2013 02:46:32 -0800
Received: by mail-bk0-f72.google.com with SMTP id w5so6909238bku.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 02:46:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=ITavIO/J822Gs1pERzuQqxyux90i37bJNfT2F61w1ac=;
	b=V6djwV5I0p3KuOH6NXVYROENieMXhPxYebO95NpYRd/gQF1yBXNVz3kxQUJ8Bs19Zm
	lLcb+wWV22ZaGN/BJZsMvN3bFq48ivU1Q+i9ezBIqNwhfSpKqMHYFYdtEdivsyQJbaKB
	FEAGbDdhGJpG+AfednuxE+TZEigWy9dp1+bd1UOW9pdHAcxW+8yM19Xwy2W0GXgPgBla
	qYjztXi8DGX4Bm7ZeIsxFGzVYTvbIbY3CrNBivRKKt19TUWtnnHlVlQ49l44g6UO1hA2
	E642w3dnbpd+8ZuLNXcDxWlEgL2NvPTBvFFiG+S8GOy5C7xn7qy3unV89gt3Z6p2OUG9
	7FoA==
X-Received: by 10.180.79.201 with SMTP id l9mr6672501wix.20.1359974790176;
	Mon, 04 Feb 2013 02:46:30 -0800 (PST)
X-Received: by 10.180.79.201 with SMTP id l9mr6672477wix.20.1359974789953;
	Mon, 04 Feb 2013 02:46:29 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j9sm12586031wia.5.2013.02.04.02.46.28
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 02:46:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 10:44:14 +0000
Message-Id: <1359974656-21894-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1359974656-21894-1-git-send-email-ross.burton@intel.com>
References: <1359974656-21894-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm+fgU5W7nW4tNiy6sc027B3SiWPF1sphozdQr71WPmHllwk/FNPOIYQ+1pHnuMGkDFEalZwTXjL4KQMsoy+wBbvmzO+B2X1VFuIUPpHHszStxpc310IFQzmCbXs2luWKkEuQRUXNFoEZfAm0PHuUmh4055bSCi42l48uck4BXR6EXX6+MpdRObyVuH0tXwmjFUAvjA
Subject: [PATCH 3/5] gtk+: add missing $S references in do_install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 11:02:37 -0000

When $B != $S the relative paths are wrong, so add an explict $S.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 3a40409..d8adc11 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -72,9 +72,9 @@ do_install () {
 	mkdir -p ${D}${libdir}/gtk-2.0/include
 	install -m 0644 gdk/gdkconfig.h ${D}${libdir}/gtk-2.0/include/gdkconfig.h
 
-	install -m 0644 gtk/gtkfilechooserprivate.h ${D}${includedir}/gtk-2.0/gtk/
-	install -m 0644 gtk/gtkfilechooserutils.h   ${D}${includedir}/gtk-2.0/gtk/
-	install -m 0644 gtk/gtkfilesystemmodel.h    ${D}${includedir}/gtk-2.0/gtk/
+	install -m 0644 ${S}/gtk/gtkfilechooserprivate.h ${D}${includedir}/gtk-2.0/gtk/
+	install -m 0644 ${S}/gtk/gtkfilechooserutils.h   ${D}${includedir}/gtk-2.0/gtk/
+	install -m 0644 ${S}/gtk/gtkfilesystemmodel.h    ${D}${includedir}/gtk-2.0/gtk/
 
 	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-2.0
 }
-- 
1.7.10.4



