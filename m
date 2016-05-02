Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7079F731B5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 19:53:05 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r187so21530376pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 12:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=POXke7+mMIl8f3NpMjPv5XekWCxtb6naXe1pSKQsXk0=;
	b=XDPjH2+GnF0K9861E9gQroSdise4FILyTH1n3QnJk0fDqnKrBNWn21+gtsl2xRijcA
	mGmDNIOgn5ni6T2wj38IyNsCpR5bH62WjOylm60+XwCArhsZzbIQxHXBfZJZM6BEPwpk
	INPtdJOoysW37O0N+AER60IYFWbieXNGUi/r8X2GrYDBu7CfK3x1cBQCBB/yrs9NbaIG
	RUXnhepHaLsdx/tq6/SMGJzkB5ID3dxRmAEvWtDdQe7CX0JQ0XJnpNu5YtaI98DFlNul
	H6bfYXd7inHSUjPfh4EyMgLVSPSND/EAe2bmqYargAcAjUZjJFbAZf9kEnX0WC19z6fs
	Aggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=POXke7+mMIl8f3NpMjPv5XekWCxtb6naXe1pSKQsXk0=;
	b=XsittGJYmb0GBKZx7HiTCGKgI6sjohjrbhLOvH0pDcE50K5WQQFbIQ+5h8i3d7aazt
	YAxq43PZD6/HFnKPChlX59TN73Xu9e1B2kR4tDWSLwDPE7vhcajJCzXzvPFuA/L+shlf
	zszeAPcZ2MIUDLWyVTqPQAyw2ruXFPkILIkawXBTtd407xK1XdjchAOI0ePOYjWioRxM
	Qp9ZoEOHNy6oXffiGn6oU5+a4HAipi69UQSb8KLroWJqWsiRqbEKmLT8B/HxPkxymvVi
	JTg0rjhvQk2TkKL/UnFShAyTzLm2H+eXQLzg8uXa7NLBhQKgFSqTeAmYSDjyZJiR2BDp
	bmww==
X-Gm-Message-State: AOPr4FXUpyPaBJIE7kxPvSPvz0N1o1P55YUxBB6jDWIDYmrGEeAPbbOY7IXsINIw5/5zVA==
X-Received: by 10.98.38.66 with SMTP id m63mr53850656pfm.57.1462218786044;
	Mon, 02 May 2016 12:53:06 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	199sm47426160pfc.15.2016.05.02.12.53.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2016 12:53:05 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 13:53:04 -0600
Message-Id: <1462218784-20252-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462218652-20142-1-git-send-email-danismostlikely@gmail.com>
References: <1462218652-20142-1-git-send-email-danismostlikely@gmail.com>
Subject: [PATCH] git: update to 2.8.2
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
X-List-Received-Date: Mon, 02 May 2016 19:53:09 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Now that krogoth has been released, update git to the latest release.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/git/{git_2.7.4.bb => git_2.8.2.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.7.4.bb => git_2.8.2.bb} (39%)

diff --git a/meta/recipes-devtools/git/git_2.7.4.bb b/meta/recipes-devtools/git/git_2.8.2.bb
similarity index 39%
rename from meta/recipes-devtools/git/git_2.7.4.bb
rename to meta/recipes-devtools/git/git_2.8.2.bb
index bc72793..b3ce4f8 100644
--- a/meta/recipes-devtools/git/git_2.7.4.bb
+++ b/meta/recipes-devtools/git/git_2.8.2.bb
@@ -5,7 +5,7 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.md5sum] = "c64012d491e24c7d65cd389f75383d91"
-SRC_URI[tarball.sha256sum] = "7104c4f5d948a75b499a954524cb281fe30c6649d8abe20982936f75ec1f275b"
-SRC_URI[manpages.md5sum] = "58020dc13a5801c49f7986fef7027535"
-SRC_URI[manpages.sha256sum] = "0dfe1931ad302873470e0280248e3aa50502b5edd00dcc3e9c9173667b6fea6a"
+SRC_URI[tarball.md5sum] = "3022d8ebf64b35b9704d5adf54b256f9"
+SRC_URI[tarball.sha256sum] = "a029c37ee2e0bb1efea5c4af827ff5afdb3356ec42fc19c1d40216d99e97e148"
+SRC_URI[manpages.md5sum] = "8c9da11aeb45b4a286ba766e25aaf3ab"
+SRC_URI[manpages.sha256sum] = "82d322211aade626d1eb3bcf3b76730bfdd2fcc9c189950fb0a8bdd69c383e2f"
-- 
2.8.2


