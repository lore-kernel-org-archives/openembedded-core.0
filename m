Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 501246F911
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 16:24:50 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 20so23807722yks.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 09:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=XVrCrgWNTzfWX1A9kgMvCkkSyt1CFF6kXFxPIYtyKiE=;
	b=o0WuGHCOagcg1NrJOU/rzMMjmbES4aSjSc7I3qaUW6+6GinKBgLQKkGV+kh7BE/U8g
	NRkWwQ0hBMn4RgIXz9XUJhl8wYs+EG3gSEKzJq6FcbwjlsOrKn+js+APCGgtZKFWfcde
	OSY5RKBXTlCUfuRUGQ4DqOkWSYCjX/AajOBwWzGae1iKX+y4rk1IrcQHZ7L5Lt/ldbHS
	oxsq64FU4wy1zegd+lBxB5WgfqqQpPSflVnUJ8x4CAeI43zwNbx0aJtlBZ2NIanM/mXU
	I62tLWSNsEv9fAyAGocM3cslYuFXfRBnc6Tza3U7SwxlsBKQcPtIWLxLdv/euio6Bq6j
	b8+A==
X-Received: by 10.236.126.162 with SMTP id b22mr27583716yhi.72.1395246291729; 
	Wed, 19 Mar 2014 09:24:51 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id q66sm7250309yhj.44.2014.03.19.09.24.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Mar 2014 09:24:51 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 14646198E98DE; Wed, 19 Mar 2014 13:24:43 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Mar 2014 13:24:39 -0300
Message-Id: <1395246282-8546-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/4] scripts/cleanup-workdir: Fix a comment typo
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
X-List-Received-Date: Wed, 19 Mar 2014 16:24:51 -0000

 s/Romve/Remove/

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/cleanup-workdir | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index 8e6bc43..25fef97 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -141,7 +141,7 @@ will be deleted. Be CAUTIOUS.""")
     get_cur_arch_dirs(workdir, cur_arch_dirs)
 
     for workroot, dirs, files in os.walk(workdir):
-        # For the files, they should NOT exist in WORKDIR. Romve them.
+        # For the files, they should NOT exist in WORKDIR. Remove them.
         for f in files:
             obsolete_dirs.append(os.path.join(workroot, f))
 
-- 
1.9.0


