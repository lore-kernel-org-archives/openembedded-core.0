Received: from mail-wg0-f53.google.com ([74.125.82.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7UHH-0006Jl-GY
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 18:13:22 +0100
Received: by mail-wg0-f53.google.com with SMTP id fn15so4915158wgb.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 08:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=e8UiLIRu0750DM3uKYc0YQg4mXYZeVXuupSP1qwTga0=;
	b=bbVFurRGimcXwoUD4zLQjUbMCudrlmOiyR7rJWQ7bRPT/24t1pxgGXtSGq4WBd1c58
	a6t5TY+e2ePY1dnWYWooHm+XlJ1pL6+XuIB/HTxj9pWjvfGJEK91aXvWUnO7l1qK8s6i
	PRB3DabJduCFlACrTCHpmRcN99v/uWcLsftMhMvXuGWQrLImQ5v79GGMjixY16cAVOb4
	9zcbGyVznzexvubAO7IMfTN0yyBk3fNuXQakA5A6fv6fJTDOnfEABOjNpam6JElUJph1
	V/z3v+tZN5E1BBQ4LsI7JawtZCzoc5tsF0QSA4THACCyAw9FcB9wZpz8b1iTn89ocTwJ
	kpPQ==
X-Received: by 10.180.103.161 with SMTP id fx1mr21676720wib.25.1361206628908; 
	Mon, 18 Feb 2013 08:57:08 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eo1sm20958966wib.8.2013.02.18.08.57.07
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 08:57:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 16:54:47 +0000
Message-Id: <b1e380b085cba34093cedf203a0e515829f8ca91.1361206387.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361206387.git.ross.burton@intel.com>
References: <cover.1361206387.git.ross.burton@intel.com>
In-Reply-To: <cover.1361206387.git.ross.burton@intel.com>
References: <cover.1361206387.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlAdrAAQKMPzAdtWsPf1EMJe+zJ1kU3y1ObUWbnKcQMPQCfz1NqZ5mNNRPSXQFQUuMMAkmG
Subject: [PATCH 2/3] matchbox-keyboard: add RRECOMMENDS to matchbox-keyboard-applet
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
X-List-Received-Date: Mon, 18 Feb 2013 17:13:33 -0000

The keyboard is more useful with the applet, as it means that you can hide it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 6841596..6944a07 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -52,3 +52,4 @@ do_install_append () {
 GTKIMMODULES_PACKAGES = "${PN}-im"
 
 RDEPENDS_${PN} = "formfactor dbus-wait"
+RRECOMMENDS_${PN} = "${PN}-applet"
-- 
1.7.10.4



