Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 78F63731B5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 19:50:56 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id i5so18392000pag.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 12:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=POXke7+mMIl8f3NpMjPv5XekWCxtb6naXe1pSKQsXk0=;
	b=zHgBxny7vsLKGo+h9/Jx/OFgIL5JWFGuyB4WYywFsuM/1T8eGcUv04axKRmS6ca7n+
	MNNjQYBUSFBtte8PbRNl6c99az+gRj0Rv4rjSL7bYiNUCbmEqkOitGCZ+/CPussMxaBL
	+7BC7G/34QLn17ccJilji68MDkJuyPRrzh3yB5ecBwur8zDp0tYjWw3kmP8f8qpLjWK2
	LVv2l3ym+dVSp7rjfPhgICz/gJWAOmYwLrquLps2kOSqu6UkYgMd1Q8YKGApyXnKAluW
	wYebkjU3iWNZsv+le7Btgcnv3EZjaC+0Bq3PcvB8Elwe1vJTOqyeUXEkWC61cGe4SYuE
	0Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=POXke7+mMIl8f3NpMjPv5XekWCxtb6naXe1pSKQsXk0=;
	b=gFouSwZkOT4FYa/Mejka0qLWlWDy2BlXysHwEPiXFUJW8cRYD/DTKevkbxEAIWfDpH
	2eerEfJOTdWb6m+RyK+P7UsRQLTZqn5BNtVANbrfwYPw9wo37X9dWH/Njtk7LiW/Er/C
	ehiRL6gwhg0Zxwvoqv4lrpJouv1RnANt8Pz1whm3WJYntxDzKi5bAmwW0YVQ/YzUoLhg
	shwf7RoxlOBdsi68Pc7XfPC/M+epv3O4hk1wziyfGmSXtX3txPgLGRkJGlx5p8mEDLCK
	Bb3C8vWo6Emj1piLFcs7xEobqzQ1Y2Wv+TAispb5Sb7dmMD6poDt5Y9kHPDIPNosGgSD
	kWQA==
X-Gm-Message-State: AOPr4FW84KFUw3JWOk6EUH1dpahdBcjaAtOi1RyROiJS1pu5VrKk5LrA3+sCl2Sbb+17RQ==
X-Received: by 10.66.222.3 with SMTP id qi3mr54166562pac.24.1462218656924;
	Mon, 02 May 2016 12:50:56 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	r73sm47362146pfi.4.2016.05.02.12.50.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2016 12:50:56 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 13:50:52 -0600
Message-Id: <1462218652-20142-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.2
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
X-List-Received-Date: Mon, 02 May 2016 19:50:58 -0000

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


