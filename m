Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PzRGq-0005Z3-Od
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 11:14:32 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so363080bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 03:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Sj83ppi8EQz4MmWoiPEtDItmetRJ2EdMFfVbRAI/iJU=;
	b=O5Jn2pGvBRHHIv81ONbVDBn4EByidtrolHFuLfUvc4Zz2t5kYnUZAY7rYA1hQ6xWHQ
	hFMAKzLoeXgFdYRAgmg7xTO+3BobsWv7pzHRWjsWP2ZUucVGDnOMYEjf8ivujtsoI/of
	XwfUOU+htzLCYbMc8qc68+Tc5wSh9uc5fELc4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OTikrxBh+E97fJj3WWiF4eKB6aCrt/37fMY49hzLUMo8NchfSlLtFNCFMftN82uk3E
	y1n2sPUiepqaNyL7ziTEdcNTL79kE3Rn1g5+eqY94JgRBTh2jlU8lSGtXaslXF9VjJkk
	OI619S9N98vFNlY0wEKVmI2mhn1cG7qg8hnlU=
Received: by 10.204.162.66 with SMTP id u2mr9069041bkx.19.1300183973263;
	Tue, 15 Mar 2011 03:12:53 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b7sm5841279bkb.6.2011.03.15.03.12.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 03:12:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2011 11:12:46 +0100
Message-Id: <3627922c9060029bdf2b012b023ce5d68adcc393.1300183818.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300183818.git.Martin.Jansa@gmail.com>
References: <cover.1300183818.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] util-linux: move remaining files from files directory to util-linux-2.17.2 for faster lookup
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
X-List-Received-Date: Tue, 15 Mar 2011 10:14:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{files => util-linux-2.17.2}/MCONFIG           |    0
 .../{files => util-linux-2.17.2}/defines.h         |    0
 .../{files => util-linux-2.17.2}/make_include      |    0
 .../{files => util-linux-2.17.2}/swapargs.h        |    0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/util-linux/{files => util-linux-2.17.2}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{files => util-linux-2.17.2}/defines.h (100%)
 rename meta/recipes-core/util-linux/{files => util-linux-2.17.2}/make_include (100%)
 rename meta/recipes-core/util-linux/{files => util-linux-2.17.2}/swapargs.h (100%)

diff --git a/meta/recipes-core/util-linux/files/MCONFIG b/meta/recipes-core/util-linux/util-linux-2.17.2/MCONFIG
similarity index 100%
rename from meta/recipes-core/util-linux/files/MCONFIG
rename to meta/recipes-core/util-linux/util-linux-2.17.2/MCONFIG
diff --git a/meta/recipes-core/util-linux/files/defines.h b/meta/recipes-core/util-linux/util-linux-2.17.2/defines.h
similarity index 100%
rename from meta/recipes-core/util-linux/files/defines.h
rename to meta/recipes-core/util-linux/util-linux-2.17.2/defines.h
diff --git a/meta/recipes-core/util-linux/files/make_include b/meta/recipes-core/util-linux/util-linux-2.17.2/make_include
similarity index 100%
rename from meta/recipes-core/util-linux/files/make_include
rename to meta/recipes-core/util-linux/util-linux-2.17.2/make_include
diff --git a/meta/recipes-core/util-linux/files/swapargs.h b/meta/recipes-core/util-linux/util-linux-2.17.2/swapargs.h
similarity index 100%
rename from meta/recipes-core/util-linux/files/swapargs.h
rename to meta/recipes-core/util-linux/util-linux-2.17.2/swapargs.h
-- 
1.7.4.1



