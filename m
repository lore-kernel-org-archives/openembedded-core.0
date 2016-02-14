Return-Path: <jajomojo@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA226E630
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 08:28:58 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g62so18951937wme.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 00:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=S5kXRS8vbAwtgu61CKnbI2kYCk+3HufcYIKT2/EGGAM=;
	b=Vf1ARzCESfxsh1l7aBdJNI81sFbXMCIROJPHav0neX0WPVeE9M2yO4k3WLGEhhhb2A
	vKg+Xc9kaLCWEIAuesqceMU6b+tiUZtSPUDlKQ7GvyqQFKacPwIQxKu71zYlRJnPfn16
	vzIgWEmjJ89ukXqsYl72tVmCzQYhbwMWkIPCssxWesxpZTJdcoEmSc6BLJX8DhnfVxTe
	V91chdmhUClApJnPLxRpZcZyzrb2+zAFCi+fmvvhi3vQeSnHQ6cn0XnvUuZcTHB18L6d
	cPK/f0OdVdZ1Le2Vv/LRgQUXDk41PneiEM4BZ6TvJDTW0KoJ8HtKxSI6i8qSUJwNoALf
	1IGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S5kXRS8vbAwtgu61CKnbI2kYCk+3HufcYIKT2/EGGAM=;
	b=GGwbZK3Sr4K/AQWmvv59prxoBoFueoUgVi7PfGQyoRSproEO5N1iUcusZSbzyuKyDk
	/CSs4JeBNIfC/VB8D+1JEnl+7XrWUZseylfGKeyZtGhRCBTHgohrQn25Xs2B0BBRaLdg
	2u0onB+XXysva06llzOt29cOje6cTLgifBk40zm8/Ya+meFN2pQXNkN7r3UbMxr7QMY6
	omUWJa2cLMTxlE5qRzba8I0vEi+1LX19PBId6Ine7/LZ5/kBfmBE1UETj6AKvUYVOtCx
	ZJEs6ruM7W+uF92rhQZMyB83+kyYBzMsQgD8SUj+yY64qzOEHSnQR7+9XYXCDQm4rWFZ
	Gk0Q==
X-Gm-Message-State: AG10YOTNta/9je7VWHkx5JHdEMLtrJSC9EzWLzPoV39PiMDa6QT0igx/KvP41C+yZQwGuA==
X-Received: by 10.28.57.131 with SMTP id g125mr6067915wma.17.1455438539369;
	Sun, 14 Feb 2016 00:28:59 -0800 (PST)
Received: from arjadnek.ysoft.local ([89.24.100.190])
	by smtp.gmail.com with ESMTPSA id
	p125sm9517534wmd.16.2016.02.14.00.28.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Feb 2016 00:28:58 -0800 (PST)
From: Jan Sarenik <jajomojo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Feb 2016 09:28:49 +0100
Message-Id: <1455438529-15853-1-git-send-email-jajomojo@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH] scripts/sstate-cache-management.sh: Change wording
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
X-List-Received-Date: Sun, 14 Feb 2016 08:28:59 -0000

Use "out of" rather than "from" in the output.

Signed-off-by: Jan Sarenik <jajomojo@gmail.com>
---
 scripts/sstate-cache-management.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 2286765..2ab450a 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -101,7 +101,7 @@ do_nothing () {
 
 # Read the input "y"
 read_confirm () {
-  echo "$total_deleted from $total_files files will be removed! "
+  echo "$total_deleted out of $total_files files will be removed! "
   if [ "$confirm" != "y" ]; then
       echo "Do you want to continue (y/n)? "
       while read confirm; do
@@ -282,7 +282,7 @@ remove_duplicated () {
       deleted_tgz=`cat $rm_list.* 2>/dev/null | grep ".tgz$" | wc -l`
       deleted_files=`cat $rm_list.* 2>/dev/null | wc -l`
       [ "$deleted_files" -gt 0 -a $debug -gt 0 ] && cat $rm_list.*
-      echo "($deleted_tgz from $total_tgz_suffix .tgz files for $suffix suffix will be removed or $deleted_files from $total_files_suffix when counting also .siginfo and .done files)"
+      echo "($deleted_tgz out of $total_tgz_suffix .tgz files for $suffix suffix will be removed or $deleted_files out of $total_files_suffix when counting also .siginfo and .done files)"
       let total_deleted=$total_deleted+$deleted_files
   done
   deleted_tgz=0
-- 
2.7.1


