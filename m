Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id EB6AD7E554
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:24 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id y72so6341800pgd.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1n2vPLeCDDRPmB6KbITJbJYHgVolN8gPnOVMrJnuiqc=;
	b=W9nWJP75rdDLS3y5cCZlxbhyvPxD1X1X2toLu30WMEYj5YDG6EnZDpPKqx7V0RIsKY
	xkepMnkImDPDq4uLhTJe2d3tP5038rdw8+WkTkgYt7BmTXcrDPmSqhw8JvDYb31wtR/h
	a0uawQ5XhxnqPoOt4GmMI+SMAQKKcJjQDO+/gvNvS/+IlusCKPxLMh5u/pkayTX6ZDmh
	dY4QcIxdYEJ1QpdKO6hvYsZSQVhZMSVsH313AN3guK4cRjZWRs7EC/Ypc5uNhHWoi28h
	TiuaQ9tM02fUArQexXmOmYmRFHdcXMHkd9iliPJd5+wY5FnbIkw1ZNDric4BtYmNEOgi
	zLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1n2vPLeCDDRPmB6KbITJbJYHgVolN8gPnOVMrJnuiqc=;
	b=PvTcRhxHx13yR/YjECm1NzR/ZUfYXd4SFMNQZaJWYs438a+u0bG3ZyNyTffjaXTKpc
	WbLoLZQqGtbTqyBBsBlUoo5qrjt0XpHbiMWkIqHbI/1SB1Sn5RNeZ+I0Wz//3I4M7GvG
	xBRbAJGXJ3KTfQRJYmbNhSBNlavYGCQahMDRx0Ctr5B7jZmHyEEJ9lHTDqp/oNaZprao
	Xr0OMRmbUWYQFClqs8huSqixo0tJylFoV2j4M9tp54jplVzqVafivR7CEr4qeb3rhrG8
	ZQJNwVwnDqZ0EdII9/R6zIXztFOsDIgEvmiGGPQseD/NbfaICzWVpRaepYHu4XixN0q2
	OExA==
X-Gm-Message-State: APjAAAU5PtHHTMu4ab2qd+8END801ktVaCr6rop60kB2XDMTAEE2Pufr
	LDM2KFxiSLhYqOUqdcKGv+Uho5jffuo=
X-Google-Smtp-Source: APXvYqzsEkvZ+Aw8gtSpq2YWAobt3gGvN5hI57RI3IyU286FQ6sZqkgsQmjpIau6AFdgt+5+FxiSrA==
X-Received: by 2002:a63:5d61:: with SMTP id o33mr31020745pgm.114.1561348465742;
	Sun, 23 Jun 2019 20:54:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:02 -0700
Message-Id: <cdb40f32fc2f0fde01e89f24b4ca3894b2b02430.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 03/19] selftest/devtool: fix URI to MarkupSafe package
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:25 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

PyPi packages are now hosted at files.pythonhosted.org.

[YOCTO #13243]

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 434a7b9..904ff69 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -393,7 +393,7 @@ class DevtoolAddTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         testver = '0.23'
-        url = 'https://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-%s.tar.gz' % testver
+        url = 'https://files.pythonhosted.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-%s.tar.gz' % testver
         testrecipe = 'python-markupsafe'
         srcdir = os.path.join(tempdir, testrecipe)
         # Test devtool add
-- 
2.7.4


