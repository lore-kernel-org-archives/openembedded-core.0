Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4691660234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 18:15:30 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id t14so166669lji.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 11:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=cAzFsi7CBCJgtrA99L1FOwWU88fzGJ+DkN6SUXAoOOM=;
	b=QvksDLL3RAcukB3OB8TzEODbslZVe4Hks4AC2rP6UDpZt3JCE+f81bd+Jv4Jp55kk7
	B6Lm/kk2TejtEVtrLwYGLqCdP/8ltUhGiZD2BZx1KRYOE1MUBljF6MLdGp//+pU3iHrZ
	vNp4mEh4j3QkI0Ksx7D1kpvu+XwlJtJSTgWSA/0q7nbyu9gsazxev0tc+myRnEyroLmw
	9lTgUrq7RICwZ+BxFh7LYqyJRzEYrR5ARH5zfHr5ipiYUx4DqUkdfmQJ7TmzD7kZGdfa
	oKuy4GA3LD5brsmcGSEdMWbJ6JIBNJUsbvkaIzavcbhWpqqH/6GVFxqeb8iIOBPDt96R
	lZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cAzFsi7CBCJgtrA99L1FOwWU88fzGJ+DkN6SUXAoOOM=;
	b=NhfXaO62BY11+z6KTykVtk14gUsqKxn6P1h/QlxxCUDtrS5pWYoo/UzBwDjO52nPZd
	F6i7KsYfzVwb4IXQfnRZQpdbprqE3zr/Ng1ATLn02RXbXQ8HrXshlzUqfzYgM7whnAUM
	7jZzAcpYzR5GM+13d0O5tt6IUOC7+nSylNExE8QjGgAI3FKeYOwE8f5BwFIWeECnnAB9
	sp2wE9A3tNUwERGwVcUcPgG64KxIx27GvKL6S1tFNwxcIwyJltWchWSZ2nc/1dRhLhVw
	8jDKCebFD5Orwk3oyyP7xGTge7Oohfk+6eK+XqWdWG1JwuiH32lucl7VhM287Mn0g38Q
	AA2Q==
X-Gm-Message-State: APjAAAWW9I580DIk40m/aAANR1WLnLwiNNL1DRjbyYum7YR0Cynap0YC
	ew/oFRLdUeAMhx0xhuHEjyrmqgvx740=
X-Google-Smtp-Source: APXvYqwopmufosAWU3QBqEfm0zcQRuTsQegvuCkcyWgIdAgGjvfRa0lyol0g3fZzU5Nqr/9VxorUOA==
X-Received: by 2002:a2e:429c:: with SMTP id h28mr10240801ljf.7.1565720130648; 
	Tue, 13 Aug 2019 11:15:30 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	141sm2791372ljf.32.2019.08.13.11.15.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Aug 2019 11:15:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 20:15:22 +0200
Message-Id: <20190813181522.2716-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libevent: update to 2.1.11
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
X-List-Received-Date: Tue, 13 Aug 2019 18:15:30 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libevent/{libevent_2.1.10.bb => libevent_2.1.11.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevent/{libevent_2.1.10.bb => libevent_2.1.11.bb} (88%)

diff --git a/meta/recipes-support/libevent/libevent_2.1.10.bb b/meta/recipes-support/libevent/libevent_2.1.11.bb
similarity index 88%
rename from meta/recipes-support/libevent/libevent_2.1.10.bb
rename to meta/recipes-support/libevent/libevent_2.1.11.bb
index 81ceb1cd91..1e18f0ab2c 100644
--- a/meta/recipes-support/libevent/libevent_2.1.10.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[md5sum] = "999caf86f52943af2363bc8077f00167"
-SRC_URI[sha256sum] = "e864af41a336bb11dab1a23f32993afe963c1f69618bd9292b89ecf6904845b0"
+SRC_URI[md5sum] = "7f35cfe69b82d879111ec0d7b7b1c531"
+SRC_URI[sha256sum] = "a65bac6202ea8c5609fd5c7e480e6d25de467ea1917c08290c521752f147283d"
 
 UPSTREAM_CHECK_URI = "http://libevent.org/"
 
-- 
2.17.1


