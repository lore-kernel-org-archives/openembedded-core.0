Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXA0j-0002Ao-M2
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 14:50:24 +0200
Received: by mail-ee0-f41.google.com with SMTP id c50so232855eek.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 05:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=s8du8gGYrf5KS52jQ+34mYe6riLJa4TfWStlbW0UIiU=;
	b=AN2BXVrTd00uzje13Ex2x1SWCm8mNjMPC+8erRDyg1Y3NDhGqPVMKQCWUInlhyin1+
	hJ6lVmgEOUN+Yl17YxbzeAdmvQqNFeYGmxy+DbYvINaPIThfTCtzk3apqOXT3rCzDDWR
	rBGfA+md6CVHePGja0Odt/IN+lJb5LAnRTWt+YJMflRCToNoN7itNquFrV1hCXRkP3IC
	Xe0x4ZsSmnnwGaBv7mtLcKVhb4U6eOo0SBqk7vdYIXk6wIogGd1MkMDQ3MAWIQvESm2+
	4r9lL3ZXvVDYyn5dBLOkxZDU2jbo1oAtqzOJskd/YQF1a0U5rMOf2yv8FWWn2OgjCWtL
	h0fw==
X-Received: by 10.14.202.201 with SMTP id d49mr16084398eeo.1.1367325151350;
	Tue, 30 Apr 2013 05:32:31 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id cd3sm38486124eeb.6.2013.04.30.05.32.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 05:32:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 14:30:04 +0200
Message-Id: <1367325004-7740-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1367325004-7740-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367325004-7740-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH/v2 3/3] core-image-sato: add udev-extraconf
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
X-List-Received-Date: Tue, 30 Apr 2013 12:50:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

as discussed in [1-2]

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/039025.html
[2] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/039027.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-sato/images/core-image-sato.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index e3246d2..76abb17 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -8,4 +8,4 @@ LICENSE = "MIT"
 
 inherit core-image
 
-IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
+IMAGE_INSTALL += "packagegroup-core-x11-sato-games udev-extraconf"
-- 
1.7.6.5



