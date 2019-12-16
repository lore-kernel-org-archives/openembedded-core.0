Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BF9677F7C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 09:56:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z7so6392241wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 01:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8pa/N4+TCq+o6PZrwZZ7S/j6QT30JsWMhfVC7rOsZf4=;
	b=mXK2BzqgXfdZvHea69i3LQn8He0dJR8ChXIomcIzZNj/aDxt5ZzFfgZidmWpZhKEUW
	pC/jATHHfwhoADNzeCGlzkPzDwzJmyD5WAhMlcob2/CdZN+j94SUGvZI2KDTN5yWD9Q8
	amrLLO4U2OGv65eCVFYL4SpcyJgYQzL4o1BB8Yaann3nlJ6epwweGSsXXsE8aLSO0Jpx
	rTLav1ZlMqcAJ96NkMozvw6kntP4FUhJCpSejhUQOnMvCh6L5IqMXI6a/4wyq+dXxTeu
	HBDcn5EZmmm/6gaYd4FdB8I68MiVQbbVPNmcO6AA2+mtOHSh6LtwVwr7Lygpi3ig6GjJ
	QvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8pa/N4+TCq+o6PZrwZZ7S/j6QT30JsWMhfVC7rOsZf4=;
	b=cJoCboTIw4f3WJoNDe6oXs3wSagXsrl6iiDkeP7kge3gobw7ueuzmp1SiOC0AwOT9R
	dbAFmQNCymE8AThqd1yMV9Jl7zF66tFxrwODkKE9SOJ5rdZMvR6hNu0REUQjexcNsjLO
	eMl2Mgb1PUUGPEOav7Aoj40xmXj0LI+Zc6DZG5XH/wEyhIl12w5ln6K7lbQlyRm0vHeh
	ECawbM9JWdagvAFMMHcWKqScZ7Q2xrFlB7vQmbntoZ5EYmpI4KNURL81YMR7Hgku2Shx
	MktA6sBv1axgnd3bG3sS0kFHhqhekSeLWJ8ZKyTuV+Z+baNpWGCEw0FCb6NbDI638Edk
	esHA==
X-Gm-Message-State: APjAAAWvN1QpJgvCpCLNJ2PBLs78I1nFl1zQAIcV++Eqy/9xroTLgZR9
	QRbua5xHNdzpGF0zfz5PGlC7yUls
X-Google-Smtp-Source: APXvYqwmwFcZnW84fzymEh+nEw8r6W1uXtNfhIyhEx5QrLULzMLIjjDkrIWb4SIffFvZ0Kox88lgVA==
X-Received: by 2002:a5d:5345:: with SMTP id t5mr30427068wrv.0.1576490183182;
	Mon, 16 Dec 2019 01:56:23 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	z3sm20883599wrs.94.2019.12.16.01.56.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Dec 2019 01:56:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 10:56:20 +0100
Message-Id: <20191216095620.3747-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sstate.bbclass: use tabs for indentation
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
X-List-Received-Date: Mon, 16 Dec 2019 09:56:23 -0000
Content-Transfer-Encoding: 8bit

* it's terrible, but this is what oe-core wants and it's better than mixing tabs and spaces in the same function

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sstate.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 14de791c81..18e3492674 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -753,13 +753,13 @@ sstate_create_package () {
 		return
 	fi
 
-        mkdir -p `dirname ${SSTATE_PKG}`
+	mkdir -p `dirname ${SSTATE_PKG}`
 	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 
-        # Use pigz if available
-        OPT="-czS"
-        if [ -x "$(command -v pigz)" ]; then
-            OPT="-I pigz -cS"
+	# Use pigz if available
+	OPT="-czS"
+	if [ -x "$(command -v pigz)" ]; then
+		OPT="-I pigz -cS"
         fi
 
 	# Need to handle empty directories
-- 
2.20.1


