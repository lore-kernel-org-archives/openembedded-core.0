Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7D273D17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 21:31:36 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so105438799wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 14:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LI9Rr2eutrpsU3NrukDD10EMvCzURv4qooy3Hi9kobA=;
	b=L/B74RAoShFAfvDNkBcdYlc41K/9pwpRGU/P+id9Y5VABJhmKlftG0ecNZczn5IUks
	nA5IVhreZs7CH+hg9QMeMitEbqN4jwXWMiTQm9ow8lsFbjk71ET08P2kIPx15CfW4/yS
	MD09/v4+W2ixZoPsXemp2VqQE21WE5XVLWI19agtev0wLP4JUN5GqqGVV72i9sSNHRSx
	dISEpa+pOL/ZemH/iwh9fPgSSp2OWYFr3bw6qLINIXiD7RRIX4dJzrU23X+cAIE776m8
	lXQNx3+lKhKDE+3f9foY5ggEn/3MydrSkRbvzosQlxpdJDrbITJsoMhMZZobsJLlBJUQ
	fdEg==
X-Gm-Message-State: ALoCoQlF5QBSkZJO8LTz+9tZcI6Jmol6rPFjnTfD7h4/rrlEu9ii4GJp/lsMWZB5Q2Q48vxIlBc1
X-Received: by 10.194.109.97 with SMTP id hr1mr17391007wjb.38.1439933496799;
	Tue, 18 Aug 2015 14:31:36 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a19sm23966351wjr.27.2015.08.18.14.31.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Aug 2015 14:31:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2015 22:25:18 +0100
Message-Id: <1439933118-17773-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439933118-17773-1-git-send-email-ross.burton@intel.com>
References: <1439933118-17773-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] json-glib: inherit gnomebase instead of gnome
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
X-List-Received-Date: Tue, 18 Aug 2015 21:31:41 -0000

There's no need to inherit gnome as it pulls in spurious dependencies for a
non-graphical library, so just inherit gnomebase.

Also remove the --disable-introspection option as gnomebase already does that.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/json-glib/json-glib_1.0.4.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
index 7ae1fee..2e6a908 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
@@ -15,8 +15,6 @@ GNOME_COMPRESS_TYPE = "xz"
 SRC_URI[archive.md5sum] = "3131b0417ecde3da1ae72acceaa375cf"
 SRC_URI[archive.sha256sum] = "80f3593cb6bd13f1465828e46a9f740e2e9bd3cd2257889442b3e62bd6de05cd"
 
-inherit gnome gettext lib_package
-
-EXTRA_OECONF = "--disable-introspection"
+inherit gnomebase gettext lib_package
 
 BBCLASSEXTEND = "native"
-- 
2.1.4


