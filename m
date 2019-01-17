Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id F288E7C1E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:28 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id t9-v6so9125219ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ivjJniFb/wwbQgAX9KhfCtrW1dG8QEVlcZ7AHXCeDX0=;
	b=L1TZ5txIhEAaVwmNX3CgzVg2odIehDwf/yDQ5IEXVx2RqaHmtEMre3cHcZuUqssmSa
	/WQ5rakaM/TM1YHrZ1ke3LVBCbrTs+Lg/c3xUjsayHKs9b18PEq5aVmZY7hP3psZP919
	C8617vdBKPx6dQvZ/sHeLfzt36+pEsSlfRKXqUNT8A7AVk8cJw4SeTXBYuAqLKEhGRgH
	w9hSCH7m1OAMzD48L/RjASpJNGp78UnFqk5zGQuF0k/Mt378nA/lYpXdYCaGEk4h+Q6L
	JAPKWAfBEoAEmPyMzOk3o8CVqgTQFnXN8YJx/7P0qy5CXMLRfl692U8Z7edTOVqgUfU7
	shmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ivjJniFb/wwbQgAX9KhfCtrW1dG8QEVlcZ7AHXCeDX0=;
	b=M/PzwWdTKNKvabN4ceTCZW8nresfeUL1CN1/gQtVt2Y1Ae1UgsiP7kUqcfCxC6hlqC
	oyhNQk3LVQZCp71/+ykmyYy7KOJKQtPf2ftQmVwRbMaZpU63EeQDaqQf6z3pYpvjjvlm
	acCpTKfVbmzzbYYR1g7qzN1u8PlT98lfHIcaGsmOutGL5c4ASR1srRhpmygV42mC7Rys
	P9trHvhUvpeZ2JiQug070EKWo/Xi8hWWwXcSUnkykZaei5VWAK3VbgLrGH82lRkEhV5S
	ts/bD7Z8iclOAMdAximlynMPkyDRHoFz/bNINDHwrXDbRBhlyn9JhsMZZd/jCo0zBVfJ
	RHiQ==
X-Gm-Message-State: AJcUukdQVxL2ZzDXJC0P2EqzDRm1wU2ruXaA6Ld5kAu5NBQ+7JaB8McM
	jw+3K5lVpmZ4oreGvFVldV34pj0M
X-Google-Smtp-Source: ALg8bN5mr9TsIqQZYe3H0gVvJ4jk+ORxLdSUP+almNrShx9X/1gC4q6FxoNa+hLNwR0W5oBxIa872Q==
X-Received: by 2002:a2e:2f15:: with SMTP id
	v21-v6mr10275607ljv.56.1547743229248; 
	Thu, 17 Jan 2019 08:40:29 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:49 +0100
Message-Id: <7e6b983303e849371888ed346f8fe100c112563f.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 04/27] pixbufcache.bbclass: remove a dependency loop introduced by enabling gtk+3-native
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:30 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/pixbufcache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 3378ff2c806..fb50cd49659 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -3,7 +3,7 @@
 # packages.
 #
 
-DEPENDS += "qemu-native"
+DEPENDS_append_class-target = " qemu-native"
 inherit qemu
 
 PIXBUF_PACKAGES ??= "${PN}"
-- 
2.17.1


