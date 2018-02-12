Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 140A47826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:26 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id f89so17954792ioj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y+Fs2OQSiZPD0xKUbb1GOU8Fz8kjc3KsCZ1uHqBqgok=;
	b=AVwWFxMHbBDFbEshI5pAcB0gryNMPexIr6FRZLsj9HoSLECQybPkDH2Z7gyB9d3vDl
	b/BfAcGWi+xuBCiy88zImZFLG0VwV918beXbrEy8WGFPZHLQbeAAi58Qv0Z2A5IvXdyD
	tDBdsQEapq+pwbVeo4HebGV0NKlEPCqVKhYxztbqAaAjzxxhyQP/w4Iww4myg7BW+STJ
	6xQduheAf4CxF6Ff2RLSoTP+Ged2EVP2gu1v6OMr3fHTzomPeT2LyA9xOWvO9uTtqjje
	WDPgnALzEvgzUVQLB76rJNqIHH/OIx1xuGEAMdBSwTm8zL8R4Dr0ApzMke1HkyCG77pb
	qhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y+Fs2OQSiZPD0xKUbb1GOU8Fz8kjc3KsCZ1uHqBqgok=;
	b=UbIr4TzdoQmHVXo/jRRUhqGcnoU7WAAMKRyyY074vcAAy00KUc+XlxNvxlqpQlYyRy
	lg1J+vwKwb2yqn0dpY36mphFYTZmJsVERo9yPX1xqMPbuEj4KUv4OAC35M2V9aO0EYsS
	51JiKFNUWKFsjfCgDoJ/uTDSszJsHhO0nur1f3j/SO98HxD/8M2lKYUF6kf6qIjKyXKC
	4nMtxbrxiJfEtAj2v48bLQ3aaHDM6i7jRTNh1ayiRn7ZKqulY+hmrhlBz/P2eR+X0gq7
	XUhzIyQd6aoAtyLAmcbXtgNfYbKdHraY4Pva6nRH1PGfgDdMX16pxQ7Cms+FxtU2SRBw
	b4RQ==
X-Gm-Message-State: APf1xPARZjbiEeB99RzETOsL9KYvLLhCKIXbysELY6iY6Eh/5J7KrGTj
	4nRRA7zwSN+Wx50LBmV7pJPXjLMY
X-Google-Smtp-Source: AH8x2252n3JB87rIewzjlcNb7wr+gICxCK9xtduHRf1WRjqt9x/BzJPbMpNGJ0WATNSSfxj0kb7M6A==
X-Received: by 10.107.13.15 with SMTP id 15mr10506824ion.35.1518454347926;
	Mon, 12 Feb 2018 08:52:27 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:27 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:52:00 -0600
Message-Id: <6c8a148ffa7a83bbf67333ebfd424214ca868069.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 05/17] icecc-create-env: Add /bin/true to environment
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:27 -0000

icecream daemons execute /bin/true from the environment as a check to
determine if the environment is valid at all, so it needs to be
included.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env/icecc-create-env         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index 723f1f9bd90..c838256f748 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -122,6 +122,16 @@ then
     add_file $pluginfile  /usr${pluginfile#*usr}
 fi
 
+# for testing the environment is usable at all
+if test -x /bin/true; then
+    add_file /bin/true
+elif test -x /usr/bin/true; then
+    add_file /usr/bin/true /bin/true
+else
+    echo "'true' not found"
+    exit 1
+fi
+
 tempdir=`mktemp -d /tmp/iceccenvXXXXXX`
 new_target_files=
 for i in $target_files; do
-- 
2.14.3


