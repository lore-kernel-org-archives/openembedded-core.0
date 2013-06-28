Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 913936ABF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:31 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id lj1so2913155pab.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=G27wY86x1UyvPMrNjjr+fCJ6FNRkv0C2UHJzg9e2I8s=;
	b=EKCI4IfLxq2T5UyCrJOy8Gq1yczsVkvVOQjQxtUXb1pB1xzaljm+xtRzu7H+7Jd6NF
	4yeKfz3Eirv1h4/iGnFy9zCHcvhUCbmjwBH/Nv1iWQpqbTjLSaeW2dHPyJ3BSg5/5KT/
	Nd5/t73yQ7EpNZQcLqZp6qQ9sFvf2xpzxNRmg0Oy5UwpU3pSYPgWWyxQ10vQ5+PRo9dX
	0dwTfVXD9Y3n1cZ34Ka+/+pT97GzEKYHx8eHBXzsf64gymUUE5Gf2MjwbTdvoVOd7OFF
	QQuVG4j6Tp11rbuAsvS21hKphtH7McOjPXgEt05kTtjCKPLH1gqWgh9uMyzcD97QWV6N
	UNDw==
X-Received: by 10.66.163.99 with SMTP id yh3mr13503562pab.22.1372457072977;
	Fri, 28 Jun 2013 15:04:32 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.32 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:03:52 -0700
Message-Id: <678b0d3adfc58b088e35adc51a9d3a7097e23db3.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 07/24] distutils3.bbclass: Port the distutils class fix to handle filenames with spaces
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils3.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 3738b14..602ce48 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -51,7 +51,7 @@ distutils3_do_install() {
         echo "Step 3 of ${PN} Install ..."
         # support filenames with *spaces*
         find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
-            sed -i -e s:${D}::g $i
+            sed -i -e s:${D}::g "$i"
         done
 
         echo "Step 4 of ${PN} Install ..."
-- 
1.7.9.5


