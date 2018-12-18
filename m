Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 067757C0E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id u4so15588228wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iB1IwgDma8YcU01psevj/F0EeZ0hryQQJfazbuQlXEY=;
	b=n6J0B/vu8GBjqm73UbQLoejBFhKKfEXvlkddQWozfnPhs7LjLdpY6rDWLbyKA/5Kvt
	22g9Kg+4W3R0TRUxmvsyUhxz+cIiI3OByG1IMANTIbRWj4B8HRfgVXJaxHl/xhDP+DKn
	GtQ7WtwN2x9MX7h+fAWDX3Z7OUXCX+INaUkmkltK+uEyQCtzU9zrD7Q32VBhObAs+RNC
	cHcaMsXDczitccYqRFRrUoIi788cazrsPJBvxIhyFQlZDMQ1GsOhDK/7/KUTXWfqSsRE
	30FJUUx8lOklHjOi/s/Oid7vjphFayGcDljdu/ndlZqfY3eoGvFD7Dw1wwXlokn7SYI8
	m3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iB1IwgDma8YcU01psevj/F0EeZ0hryQQJfazbuQlXEY=;
	b=R0J0XkbIIJ3fDA2dYmumyrWyxxk9atSkIBY1e/x695DPjRet2zc04KGlCoCqQXbXNp
	uRCfdEFgG8330i6V5k2EtCvtR1sTyL1pn9IG+/94EDXmS3aP/DYNXCl49rN2fjyYZ6oB
	KkNFmB2tCo86cFYMX3uuO35A8Gy2O6uiNevA6wn5UTfLNO0Wx5RtqMcFlZbkK/62a1R4
	Ig4A3VE6d9DxHwb4Fnw/kVlPg7PT+gHOYZP4Vp4UAZceE8WkB52R3KZUsG0/A+KWPxAe
	sLcgRNqy0zp6od60a7XEKfEuziYih9pG9i586/u3EKykdfE89c52upH/oENdDarTIrM+
	5vTQ==
X-Gm-Message-State: AA+aEWbsY5qMbv11ANcnf/UFrnlOdenbcjpUsJ7mzzsDJq6CKPVXzTtu
	fwJLMo2NEZgAOkuKMMw3PfQFvjSl
X-Google-Smtp-Source: AFSGD/WRRACH6jNtvmlFIwvDG9vNnzblKQHPBqjFuWawOt2sH5tsTgQVXAdMZwIbzV//IWDGyp9ELQ==
X-Received: by 2002:adf:d0c9:: with SMTP id z9mr14715862wrh.317.1545150618374; 
	Tue, 18 Dec 2018 08:30:18 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:29:57 +0100
Message-Id: <20181218163005.1330-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218163005.1330-1-alex.kanavin@gmail.com>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/13] dnf: upgrade 4.0.9 -> 4.0.10
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
X-List-Received-Date: Tue, 18 Dec 2018 16:30:18 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.0.9.bb => dnf_4.0.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.0.9.bb => dnf_4.0.10.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.0.9.bb b/meta/recipes-devtools/dnf/dnf_4.0.10.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.0.9.bb
rename to meta/recipes-devtools/dnf/dnf_4.0.10.bb
index 24412fd4860..cd2713fcc6d 100644
--- a/meta/recipes-devtools/dnf/dnf_4.0.9.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.0.10.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            "
 
-SRCREV = "689a4c515738226f3dc85edb2035d23233ff41d8"
+SRCREV = "622e6d6fab05f0b15460c5b734f9e7b5935864f2"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


