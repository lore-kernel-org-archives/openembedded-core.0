Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxGYo-0005pR-Te
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 13:33:36 +0100
Received: from mail-lb0-f200.google.com ([209.85.217.200])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 04:17:40 -0800
Received: by mail-lb0-f200.google.com with SMTP id k6so1827488lbo.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=cwlF7DCBE4rOFHjD3l8y9gQE9F0rRx7cW0S0Nbpv9t8=;
	b=c40KZGqNr9LQ1s0mFVQBBQ4L0/rxJZ17e1JMVqA/S7HnKyfdQxTz0r9jsXTg1436Vr
	wMhHiMd2NYs8H+gNSPWO6nmsZ2r9gCEUNUm6yOmlf+Yn3Qp9/bGaePfxuRdRzJk5ZNha
	nyXds35Jf+8LYPMIC9r6OgqUwrGSza5wm5BzipLKWmEW3BqOPF+zA/4LVyT+6elnFcCG
	xY7mUG1fuf8UjbS50AKRVs+bqHAQSTCY/Ia/+u2uBt4B/9+R7C43kBIAHPpB1UqPHD/g
	tybTyJdIYrjjdOVa5zhpp2wFwXptPP34VP6IqXfAtyevtyQ8Qu9ex6Ko+uVqs21ml7mN
	ry+w==
X-Received: by 10.194.171.198 with SMTP id aw6mr26080762wjc.3.1358770657909;
	Mon, 21 Jan 2013 04:17:37 -0800 (PST)
X-Received: by 10.194.171.198 with SMTP id aw6mr26080743wjc.3.1358770657607;
	Mon, 21 Jan 2013 04:17:37 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s10sm18415972wiw.4.2013.01.21.04.17.36
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 04:17:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 12:15:33 +0000
Message-Id: <5906d647655a847ec142325e3ac758275a0790a3.1358770449.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <53d6b4110f4e12cfde4dcfbef992cc44d8c58c1e.1358770449.git.ross.burton@intel.com>
References: <53d6b4110f4e12cfde4dcfbef992cc44d8c58c1e.1358770449.git.ross.burton@intel.com>
In-Reply-To: <cover.1358770449.git.ross.burton@intel.com>
References: <cover.1358770449.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn9bIynPRoYvdtBWF+Tx//fatG4e0EaZG4rKbJnWhlXANmyvGMA0Z0lEGqq9XbaitvVc1WPrh8lhqI/Qubx1/1F5MdjSUo0fAHLcs0WpK8xP/JsxboivWCv0ecqXv1VlgXJs8ClRqgxgCruAOZPMtMjIpCOrTAWdeTG8snxjNfedhZ/ncI+GaKM4b6aAUsDGJ8YXAwA
Subject: [PATCH 4/5] gtk-doc: parameterise the documentation directory
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
X-List-Received-Date: Mon, 21 Jan 2013 12:33:39 -0000

Not every package puts the gtk-doc infrastructure into ${S}, so allow this to be
overridden.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-doc.bbclass |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index eaa1385..f7ba788 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -6,6 +6,9 @@
 # re-generation of documentation.  For now, we'll make do with this which
 # packages up any existing documentation (so from tarball builds).
 
+# The documentation directory, where the infrastructure will be copied.
+GTKDOC_DOCDIR ?= "${S}"
+
 DEPENDS_append = " gtk-doc-stub-native"
 
 EXTRA_OECONF_append = "\
@@ -15,5 +18,5 @@ EXTRA_OECONF_append = "\
 "
 
 do_configure_prepend () {
-	( cd ${S} && gtkdocize )
+	gtkdocize --docdir ${GTKDOC_DOCDIR}
 }
-- 
1.7.10.4



