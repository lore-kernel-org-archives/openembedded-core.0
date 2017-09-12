Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA2378431
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:51:46 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f24so393166qte.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=oJsrmeUneI958n2XsIIsXbIxY6vPAb34n3ZDtfkl0G8=;
	b=n0QmD3q95QEM3BsiaPuppNOF6Wl43gY+Nch2PPCnM4k8jQ9zws6+JIxrJhj47uRfQl
	I39YpC1Ed02f3xsZvJYB011u/lx2j57Inpl5nBU+RbwwamCqekmDMNrmZxya304lhOSy
	c+JQpDYQjkEfDNjEIJp6oOLsSz9gdGmAmT85A9GdL+VJrxG6iAj+2EA0GM31iJL2aRmo
	BNMurfg0iRvcD74y96HBXr6zSkN8uZwARbEjd9rmwBSog8iXrrHN9RyhkUd8EuRaz0aq
	r0k+MpykD2khUcrzhM0tzA/EQahtOTDVjoRZ8WJHX0cjXui/1lTBFaV3mfhseR2KO7FA
	G3Jg==
X-Gm-Message-State: AHPjjUi3oB1QnWcB1Q6FMz/XJ4YzXOKCb0sxe+pR3O/ECN7N/8Di2x43
	AqGuAMtaEvEt5eE4
X-Google-Smtp-Source: AOwi7QBupvmZmR2nlfc4TqQhMXzScYmSAFOLz7b9K/uG6Z/hFjLSicDPNLx7m6u0fyTpXqDnNw3ygA==
X-Received: by 10.200.63.154 with SMTP id d26mr21052764qtk.212.1505220707932; 
	Tue, 12 Sep 2017 05:51:47 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	a13sm7718607qkj.35.2017.09.12.05.51.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:51:47 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 09:51:40 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:50:24 -0300
Message-Id: <20170912125031.4009-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912125031.4009-1-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 06/13] go-dep: Move bash dependency to -dev package
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
X-List-Received-Date: Tue, 12 Sep 2017 12:51:47 -0000

The src content has been moved to -dev package, so does the test
routines. Fix the runtime dependency accordingly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8:
- new patch

Changes in v7: None
Changes in v6: None

 meta/recipes-devtools/go/go-dep_0.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-dep_0.3.0.bb b/meta/recipes-devtools/go/go-dep_0.3.0.bb
index c65b4f7cb5..5e4544a104 100644
--- a/meta/recipes-devtools/go/go-dep_0.3.0.bb
+++ b/meta/recipes-devtools/go/go-dep_0.3.0.bb
@@ -15,4 +15,4 @@ GO_INSTALL = "${GO_IMPORT}/cmd/dep"
 
 INSANE_SKIP_${PN} += "ldflags"
 
-RDEPENDS_${PN}-staticdev += "bash"
+RDEPENDS_${PN}-dev += "bash"
-- 
2.14.1


