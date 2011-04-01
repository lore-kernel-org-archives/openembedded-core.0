Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1p-0005BA-9t
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:09 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so3432253iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=JtO0ZtbV47Y1zMFI0zwN1gXs1OWtv0irT9Q5RIBVRwc=;
	b=nHvE+1/hcnT50AKYCiP2c+bltyDKvoV9CPBR1QgT8rBKvsdZnHAkHYvCxewjP9VuFu
	5Zgk5MRmL0rrQ94iihqQwymyac2PzQlD2I+na5tO6DfWmvkxaJyZOGfAxnokhoEcBRYf
	Wt7IyFyk70UOhNi0cBVcMNxK46tgh/0prdprs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VujjvY5/6y4i/mE4C2k45UiYnz9gOmBjB3oIQdM943FoCCsSbPikB4fcIxVS3Lsf84
	Z0X29PG0a5rH9hWXrRdMTJ4n4kPB5nbBNiiWGzYpx5KpeXspMWGTKKXgCRt0coSumAo2
	petTqCBhc3ebT7UZ271IRoRyTQA/M5CMp+Du0=
Received: by 10.231.92.132 with SMTP id r4mr2579150ibm.57.1301632209732;
	Thu, 31 Mar 2011 21:30:09 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 19sm1183807ibx.18.2011.03.31.21.30.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:00 -0700
Message-Id: <2dfed23ab9dcf2b44ebe515c4d85edfb535d06fa.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 34/46] xz_5.0.0.bb: inherit gettext class instead of adding gettext to DEPENDS directly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2011 04:32:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/xz/xz_5.0.0.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/xz/xz_5.0.0.bb b/meta/recipes-extended/xz/xz_5.0.0.bb
index 031c92a..629ea9a 100644
--- a/meta/recipes-extended/xz/xz_5.0.0.bb
+++ b/meta/recipes-extended/xz/xz_5.0.0.bb
@@ -14,10 +14,8 @@ SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
 SRC_URI[md5sum] = "f3c0706d100ad2b6d63327584d026c50"
 SRC_URI[sha256sum] = "eba9211990a642fc2c35ea02618b710c7fa898d78ccca48b546a07bdde03c44d"
 
-DEPENDS = "gettext"
-
 PR = "r0"
 
-inherit autotools
+inherit autotools gettext
 
 BBCLASSEXTEND = "native"
-- 
1.7.4.1



