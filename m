Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1082579E65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:47 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id y126so1738105pfb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5bPaZC2d1LvE8xtofmjAyDXJ3jYzYg6K7MClZxIuz2w=;
	b=qR+i1o1Asek5ayRm6nPxBU7cTtbGEXKm8sU2jYNiAF6YaH0uhlLUmz7dQwAI3YsPLo
	8FZ3mrtm9vtS8qvf1a8NQR0et7S/N9tDkaJgBEYe8w5U7/pfOXGdWe4GS7qJSplYSU7v
	feed6RDXBC9QkbCeCxx+o7rKn9k7qYyQZTOSeagqNxHk3kQlCtfzfJWeOra4xgiQ3QKV
	7CnyP/P7LRRltTYB+7t3OypUmAFByx7d5Q3g8v4N+imOIP3+bGbcfnmEwnGN7cVsfL9Y
	3eV4uI4N1fS48c7qzynRArMnxi0oWLsv18/OIYOme2KzNEYhR7v1mKQvhMKA0nJW7WfA
	9glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5bPaZC2d1LvE8xtofmjAyDXJ3jYzYg6K7MClZxIuz2w=;
	b=k6vZdBcbZyIXQga4XvQxFMO4pms+LcuggvTr06EpN4oWjmTzeT6kQwf7Oibh8LXH4Z
	OfOLdm/bOseKn19GnjFx7KLQSEO42kzRRRd2BCJ22x6c5RTYr3h7ibzcB13SBZ/EabnS
	gzpl7mXFRrWLZMiCpCEDfCFy0GDwEewgGzjrMJSUkbUzOiabhZj9ysw1B06thFgmK0Nv
	MyMOeoKs/fMwqiY6a+ruEi0d8oeyCZqx1hDyLYXcEVsh7fnrwvCtbdSZ4nglJydAxEDl
	A7cHx0Ei85Cj8gm2lGzU6K3qTcwWHyVtxMoXpyJdYHhxnFHaggy4ULBceBqAc1VZhqsD
	aANA==
X-Gm-Message-State: AA+aEWYq0AW/etFOw+/id7bleSJ5ST0GVEaMh3qVR7S9BdwydU2El4fI
	Kyei/llj/8qh3dKF2ya5d+CULvi0
X-Google-Smtp-Source: AFSGD/WcyIVKdG0UGIB0vpgTmZd8908fw1axORwzt+LQ9GInO5Dwhg1zZmShHSyF8vpj0Ad9SkB+sA==
X-Received: by 2002:a65:514c:: with SMTP id g12mr393098pgq.169.1544737189146; 
	Thu, 13 Dec 2018 13:39:49 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:48 -0800
Message-Id: <7189850db104ee31f0171244cb51bc6a8e846194.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 40/45] oeqa/utils/metadata: Allow to function without the git module
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:48 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The python git module may or may not be enabled, allow this code to
function without it, falling back to the same method as metadata_scm.bbclass
uses. This will be cleaned up in the next round of feature development.

(From OE-Core rev: 6350586ba9f4a4107a2d457590824cd4d662d5b9)

(From OE-Core rev: 32c9169b76e13e53b6a9ab4a59932cea7863d992)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/metadata.py | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 65bbdc6..b7def77 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -58,9 +58,22 @@ def metadata_from_data_store(d):
 
 def git_rev_info(path):
     """Get git revision information as a dict"""
-    from git import Repo, InvalidGitRepositoryError, NoSuchPathError
-
     info = OrderedDict()
+
+    try:
+        from git import Repo, InvalidGitRepositoryError, NoSuchPathError
+    except ImportError:
+        import subprocess
+        try:
+            info['branch'] = subprocess.check_output(["git", "rev-parse", "--abbrev-ref", "HEAD"], cwd=path).decode('utf-8').strip()
+        except subprocess.CalledProcessError:
+            pass
+        try:
+            info['commit'] = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=path).decode('utf-8').strip()
+        except subprocess.CalledProcessError:
+            pass
+        return info
+
     try:
         repo = Repo(path, search_parent_directories=True)
     except (InvalidGitRepositoryError, NoSuchPathError):
-- 
2.7.4


