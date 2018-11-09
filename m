Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C91D96C202
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:29:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j26-v6so2118167wre.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eZUt1EvB9D1iME+a1UmhGiJ14EG1twhMz0ITSAEyFrM=;
	b=Q7zrWUKEnqdkvJRZK8a2lmw1TP5SPUiJLrAeRxCAJXpras7hlC+JKDxiixfNcI56/O
	CJELAsgrc+MJbsrwwP6COFaKttapDs140OdZkOsE39XhLyAONAD/LJFHvVJmqREBlxG9
	1MukpqS//4QL0S9GDnzOkrU/Ydbuz9yCviFR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eZUt1EvB9D1iME+a1UmhGiJ14EG1twhMz0ITSAEyFrM=;
	b=LWytyMcdvq3omAF5HynMPaQ5WSd8Q8UjEc98C7lBT8/xnNzD6SO6VqEfK8jiIJPlp2
	Zwh4wGOWVGWvvVnEVtHnnDvz81LQCNru2WPT9Ta8/OeMhSgPsfBXNUtPG0Msgw5VJHg7
	WgcB+63N3ePaTc0RaTbuN7S1vxM4ZQMO6O98RdQqd1HTlMv1RUBoi8ED4hkqo/HVySJT
	/2AlWcF8gnNrQK8nBXtC6KjuZ2sNQJrTmAVNMtWuS6SHEDoek9lK9xFN71ugI3cjeu08
	aNK1Inrc3HBJSWqb+HGwwgRndcaXoXNypY5WepHa4Z2sulfyOXDzKQefzz35liQbKGS8
	gaFw==
X-Gm-Message-State: AGRZ1gLShF98Q9lWpMyTvqClUJgu/E9C6VhpC7U0iIsvLUkMs8DmTvSl
	sU7NCMNCHr4cqB+xq2TglWa8bsyUE6U=
X-Google-Smtp-Source: AJdET5chBiR8wMPhup1Rk1SGnnUTfM1wfP5KwQnHQw1vLroRW3TWwz7hzgLAn1Cree7WsU5yrrh3GQ==
X-Received: by 2002:a5d:45c3:: with SMTP id
	b3-v6mr8117528wrs.296.1541773755805; 
	Fri, 09 Nov 2018 06:29:15 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm7713764wrb.73.2018.11.09.06.29.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 06:29:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 14:29:02 +0000
Message-Id: <20181109142912.23102-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/12] metadata_scm: Drop orphaned monotone functions
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
X-List-Received-Date: Fri, 09 Nov 2018 14:29:16 -0000

Its been 'a while' since we used monotone, drop these revision
function remnants.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/metadata_scm.bbclass | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 658e2f883b0..58bb4c555a2 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -12,30 +12,6 @@ def base_detect_branch(d):
 def base_get_scmbasepath(d):
     return os.path.join(d.getVar('COREBASE'), 'meta')
 
-def base_get_metadata_monotone_branch(path, d):
-    monotone_branch = "<unknown>"
-    try:
-        with open("%s/_MTN/options" % path) as f:
-            monotone_branch = f.read().strip()
-            if monotone_branch.startswith( "database" ):
-                monotone_branch_words = monotone_branch.split()
-                monotone_branch = monotone_branch_words[ monotone_branch_words.index( "branch" )+1][1:-1]
-    except:
-        pass
-    return monotone_branch
-
-def base_get_metadata_monotone_revision(path, d):
-    monotone_revision = "<unknown>"
-    try:
-        with open("%s/_MTN/revision" % path) as f:
-            monotone_revision = f.read().strip()
-            if monotone_revision.startswith( "format_version" ):
-                monotone_revision_words = monotone_revision.split()
-                monotone_revision = monotone_revision_words[ monotone_revision_words.index( "old_revision" )+1][1:-1]
-    except IOError:
-        pass
-    return monotone_revision
-
 def base_get_metadata_svn_revision(path, d):
     # This only works with older subversion. For newer versions 
     # this function will need to be fixed by someone interested
-- 
2.17.1


