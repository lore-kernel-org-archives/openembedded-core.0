Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id B40C67E4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 23:02:53 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id a25so13501374lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 16:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=yR+PSwSy5//xmSA5Bj0Vxot/fVr1JDO1jAEDuBew9t8=;
	b=oWg/eid3vBy1q6Ad/G7ro3mXJC3XpBD4QKBwUyBKmxZdasjWXukayXOVU9sJQnnB0X
	yEKIC3IknuvVc2XFl2UPj7L3QGph7VgK9ZWX4f533d5Gi+Qw6ilHJlqQToZQi4o5K6wC
	iL2Cxcaby2c9jQLq85UMrp1/+f3bLd4/F4ESHvf3+Qr0hlnou3/mgwpJVWqUnyjSUlfb
	dpDisMgC6oK+Rxku0FFkJs029buPCS/zqcOxNjo+y7jFrl6B74ZAUaLUNIRV05G6Xrsw
	flLzCV7KkqocybWb4uoTW0vPnw83U9AGK6MMA2AJCGWRNddxrlwrDVKZV7Xi7ksuJ4F3
	6pRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yR+PSwSy5//xmSA5Bj0Vxot/fVr1JDO1jAEDuBew9t8=;
	b=j3+0nnopTxm1IYhfPhTlJmxmnMCHUNZ9gYEEFxSBLgKTrJx3MJ3UYTNishynkf7hhF
	e9B0shxeka7IBjJNEzLx4BG5gfn7kicFYsXHUYhDER+Cl0ewOn606pXe0JyPoGujXFPx
	ncGgKVwjZH8lAH9DbW3c0hJNpcKmnwgek7f0IrlzZ8UuCTvagby+1cmuf/cYfZ0kO9/z
	iW911ZpawhUKwKjsaQV0kOBtkWdwqQaON8/IZUoXnNSitnb2QQLHLufzxNhdrWu9IOxs
	VlyHTzvWTB0uoWb48xPVNeHfJ9zGSDBk+Eunta0+ZEm5cuNMk6PKSvtenQ2ouj6pC+Cg
	snwA==
X-Gm-Message-State: APjAAAXJ3MbKYg21GhAmUvAlEYPoNeszOv2mjFPwilFdgVBU6bjP2RFx
	ooExeqog/bzbV5Bxrn8C0O/w/lk9NkM=
X-Google-Smtp-Source: APXvYqxOxN1ulF2YMopimCLznmDzJjxR+0hr8Ry/fgZM2nRusYMGVgO9dnGyo4vDPH8OGDLzk2ZPeQ==
X-Received: by 2002:ac2:5446:: with SMTP id d6mr6742742lfn.138.1560380574079; 
	Wed, 12 Jun 2019 16:02:54 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id i70sm233508lfe.12.2019.06.12.16.02.53
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 12 Jun 2019 16:02:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 01:02:51 +0200
Message-Id: <20190612230251.20142-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] selftest/devtool: fix URI to MarkupSafe package
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
X-List-Received-Date: Wed, 12 Jun 2019 23:02:54 -0000

PyPi packages are now hosted at files.pythonhosted.org.

[YOCTO Bug #13243]

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 434a7b9dd4..904ff6988b 100644
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
2.17.1


