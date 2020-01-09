Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4F87FE61
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:49:55 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id r67so590749pjb.0
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=q2rRXwGkv+8Zubgohigs5Exc0Nxhya7VJ1Oc7Z4LrtA=;
	b=IwJWwtCH8DZMMB0jJNfoQ2DgnbgFig+6gjbzXXXMs4ESOzctZrD3bJwp23VvbUnXT/
	Aa3hDSzferuTgC2c5zTgTCJyXsUaJUk0psUFdhGS2lOlIyQ3kUL2Mg8EVbFe+uMKT9yn
	NVI69buhVGbozSy+3kEY5zw+kIWa1Qn5SXDvsp/rqfsVnxchifTR9hMhzhqqlsG50BMQ
	qFNMFl8ROQfi+DposReY15Y5OeMS3OjgdqRX938dKF72EUiGZofBUn2FIw1pmA8o4jMI
	oaPcgzqhcDVzT/QCQhsoTyKw2YFAVBRGdQbu3eE4hQnzzhHziTi1UNQgblVGCfCZBH1d
	/owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=q2rRXwGkv+8Zubgohigs5Exc0Nxhya7VJ1Oc7Z4LrtA=;
	b=JNbx+ZKy7t9L+3qOqo4UBbtUps62dgyEqPpbciPlVJyURnKPzMpuIA/f+7EONbAwO3
	DkRCWS8dv3CkQO4NcSCqmH8pEkoUvRngflh1pTiri09oXevHZJE2S9hhF60ovmWTy2ri
	A+7yd4qYKW3Alt+4P0pRFZ9R4o8JvO7dBL8GXyKYsYdq58mor/NBtT2Glj9C5LKXytpQ
	F0SBw4+gaI0pl+opVhs/43ZyYwqfC6N7HS4Uua6/5mFkWY1SDDe7QFtG6QGrT00Wcr/P
	EZIJ1iqPyIk0Gn0vAhi5E1tGtq2Ypfx0H6f4zuk1J9rPvLDhI7IkQP7w0iWbCJJ1CEx+
	9yyw==
X-Gm-Message-State: APjAAAWGJRyK2WAjP/snjNW6wCrZT/kawo2/z1z8Ppq0uBUPdxFhX+i8
	RS3uN9UkNJ6xU5K9m9SxELyfOfez
X-Google-Smtp-Source: APXvYqyPDQvchm8PE1liGBgruxYQvVgGJ0cb2fiI9X1M+kxB4bGPeFQDEX7BEX/G3diuqDpyxKpuiA==
X-Received: by 2002:a17:902:a614:: with SMTP id
	u20mr9583339plq.107.1578545396522; 
	Wed, 08 Jan 2020 20:49:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.49.55
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:49:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:24 -0800
Message-Id: <c5f285f83ea1e322d5124847904adf488d3e790a.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 05/28] sstate: Ensure mkdir happens before mktemp
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
X-List-Received-Date: Thu, 09 Jan 2020 04:49:55 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This avoids a directory not present error.

Fix a comment typo whilst here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1360d8d7d99b70a80c8cdbc1fc6d9e6752483139)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 79ae392116..b5267f00be 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -747,14 +747,13 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
 # set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.
 #
 sstate_create_package () {
-	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
-
-	# Exit earlu if it already exists
+	# Exit early if it already exists
 	if [ -e ${SSTATE_PKG} ]; then
 		return
 	fi
 
         mkdir -p `dirname ${SSTATE_PKG}`
+	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 
         # Use pigz if available
         OPT="-czS"
-- 
2.17.1


