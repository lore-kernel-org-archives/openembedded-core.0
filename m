Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id CD2E77F301
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:51:59 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id 7so3018983ljw.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9Yyck2m61aIQia5olcELOwA/9an49KF/03k+uTU8pdw=;
	b=CwRJqy/oaCSNUP1rYdvt8AKgPrKgpFNAJeDPlqgxVLw0SAruqnKYpCtzhrv0Lv/fy/
	SmLYb/dHdETbCMoMrsUaWu+LUGD99b70HLII0VOYcP/tTv8MO+8Cy1yKeHkXUEt9dUpQ
	PSSayVEDUvMBoBrRjP8VYZpcgDKSNodxH7T5kE7g5esRx4zUdjM3QMZljhmlgtXtOjjU
	x22g4pwBCn9n+4A7BqYljDMvgRNBKeojGJtLbptp9Vb7NE0xyN4Dw0uZOurA9O+a6BCK
	zgR+58f0G6FS7jXx4zE/nbdmpWMii5bp20tN06VChT/h6qREb2VvvM/NqSIBo8aW3orR
	64pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9Yyck2m61aIQia5olcELOwA/9an49KF/03k+uTU8pdw=;
	b=rTR8Rq8DNThxm+eyuq6IIsePaZbD3XtHW3WNQXRolnGRTaY/QlWlHieecGy0r43vBS
	76PpQAIkwH5OleOvg/+r3VtY0UirBv7Y9+fVojW/viwhtSbFzTJoNTuizBAV9rNq5lSO
	jNaJbOOtQu8L96fECHvigwd1EjblvZkWB7DwLZv3q3XuyQbtuIzksslfMF9VTxiYNAHI
	Kim/dWKeycNMXWhP4lI5Rf6IMJDQARJ4WyNBUJ++Kb/YZhkBbzmZtWB/bCpklemM0IUc
	qqkrZjVxjNeSm3bcco0HE02eYeZxQ3EPaWjS5HLl7O4L7o6beQdyJjfyrp8NcGcDozWk
	FCsw==
X-Gm-Message-State: APjAAAVhjJlzWRygaFaF+WjlutOiPvqKWGgtVNPKA8726ADhVt+PQRa1
	Qb3gi2VfrWqStWDmg/CMKtRMxYbEshQ=
X-Google-Smtp-Source: APXvYqySepUzFnPPGDE44i6sCQ1rUMxwiKU9yZaD1XjJsAb/oNeWA3/ciOr9ka6jmlnP58Gl/z+YMg==
X-Received: by 2002:a2e:7818:: with SMTP id t24mr2536702ljc.210.1567698720206; 
	Thu, 05 Sep 2019 08:52:00 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id h21sm439530ljg.34.2019.09.05.08.51.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 08:51:59 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 17:51:53 +0200
Message-Id: <20190905155153.30625-3-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905155153.30625-1-open.source@oleksandr-kravchuk.com>
References: <20190905155153.30625-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 3/3] python3-git: update to 3.0.2
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
X-List-Received-Date: Thu, 05 Sep 2019 15:52:00 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-git_3.0.0.bb => python3-git_3.0.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_3.0.0.bb => python3-git_3.0.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-git_3.0.0.bb b/meta/recipes-devtools/python/python3-git_3.0.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-git_3.0.0.bb
rename to meta/recipes-devtools/python/python3-git_3.0.2.bb
index b6c837cdf3..9dd753db4f 100644
--- a/meta/recipes-devtools/python/python3-git_3.0.0.bb
+++ b/meta/recipes-devtools/python/python3-git_3.0.2.bb
@@ -12,8 +12,8 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "9412ae9665fd29328f2afc6df887ae81"
-SRC_URI[sha256sum] = "629867ebf609cef21bb9d849039e281e25963fb7d714a2f6bacc1ecce4800293"
+SRC_URI[md5sum] = "ccec14a5c9f18702406122983d80032c"
+SRC_URI[sha256sum] = "d2f4945f8260f6981d724f5957bc076398ada55cb5d25aaee10108bcdc894100"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.17.1


