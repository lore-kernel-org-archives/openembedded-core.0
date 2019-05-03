Return-Path: <paul@betafive.co.uk>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 3D04A7DDB5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 11:54:58 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 7543921B2C;
	Fri,  3 May 2019 07:54:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Fri, 03 May 2019 07:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:in-reply-to:references; s=
	fm1; bh=jHuWUuKgI8EJWWFY7Y2Ejhr4bU2i1i44rETnrvp9TNY=; b=w4kZFtF8
	8WUu+Eb8dkOuywsVNsA4+EPOL6IDlWiOjMofjUacKVL31K/LX/6RjtX3q8blKiCU
	tn/4T5s6agmPUDQUqWxqkvTUEAVfDG+PnqELaqZMmwKnnxQyQKU9LvUUveYxZWQf
	DVJ4kVdMb59F6dUt0RtnyozCiu2F0tBoItNAC1fS1fth4fPHD9TQXjNm6KLH7bdh
	p5WGV3qAgj1AOG7OwgBE/2OoBVC+7AxlBY4I2DLJN4qakM2AgeAygJz3Oy3XSrBJ
	8OJc0+ClQrF6gPjBV910vbZGPwdlQC6zIxakWx4kw/lDJYep3TFpiB2XWLQxW4Kr
	UhZZrz0SRiT0Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=jHuWUuKgI8EJWWFY7Y2Ejhr4bU2i1
	i44rETnrvp9TNY=; b=WKpG4Vg7JUGiZatkq3J8KE4fPAW5IShLUVO9iGjU4pdf+
	ffQdoYLGJCtAlxeu/heQnucxh1GeMALl/cIb6p7iwaCNkXuoQHOSMj1OjxZEzqZK
	V9TAla8nJtyv1CTeP20L+FZOfBD7sZgfAzMW570+/O8hhxVq3aeDiKoUBXgs+tHs
	dKyWQ/OaNcxBqNgON6KxVMq+H3O780XukZG9FQ9ofAGG4g/XkSGB6SwggPUBqAoy
	eTevRK1gQ78lkC3Qp7xX8naW6cJXpZsm6TM3RoCkVXllC9R90itw1ZcRN5Mu8Ame
	QRUgO7vtlV15V914OemL+W0jqocZiPct7EF4m5OyA==
X-ME-Sender: <xms:EyzMXEKP1Hhfh5fqrt88x3gcbw1poAeJ67HYZrf9X_WARDG9cfnoyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjedugdeglecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefhvffufffkofgjfhestddtredtredttdenucfhrhhomhepphgruhhlsegsvght
	rghfihhvvgdrtghordhukhenucfkphepkedurddukeejrdefvddrudefkeenucfrrghrrg
	hmpehmrghilhhfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucevlhhu
	shhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:EyzMXIZAM1lzyP8VfiEgOz93Q3inptagFzqfBfLXZVIWDzoYNby4uQ>
	<xmx:EyzMXPvJ_XcHKeFPIX4SRoRmRYu-slLePbvEfrcWbP9SIl5_-QPnAg>
	<xmx:EyzMXFuL6QZdbvHhJsJY3qrBa6hhTBMu_AuiuNqVaktICT0zWZddyA>
	<xmx:EyzMXFWTjyzt95zzqoAqRn3dpUs7OBhb1yjJOgTbzXrdHYAESAKCzQ>
Received: from alpha.home.b5net.uk (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7E503103D4;
	Fri,  3 May 2019 07:54:58 -0400 (EDT)
From: paul@betafive.co.uk
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2019 11:54:47 +0000
Message-Id: <20190503115448.10130-2-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503115448.10130-1-paul@betafive.co.uk>
References: <20190503115448.10130-1-paul@betafive.co.uk>
Subject: [PATCH v2 1/2] oe.path: Add copyhardlink() helper function
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
X-List-Received-Date: Fri, 03 May 2019 11:54:58 -0000

From: Paul Barker <paul@betafive.co.uk>

This function creates hard links if possible, falling back to copying
the file if the destination is on a different volume to the source.

The docstring for copyhardlinktree() is also updated to make the
difference between the two functions a little clearer.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 meta/lib/oe/path.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 1e24d0586b..c09eda5c42 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -90,7 +90,7 @@ def copytree(src, dst):
     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
 def copyhardlinktree(src, dst):
-    """ Make the hard link when possible, otherwise copy. """
+    """Make a tree of hard links when possible, otherwise copy."""
     bb.utils.mkdirhier(dst)
     if os.path.isdir(src) and not len(os.listdir(src)):
         return
@@ -114,6 +114,17 @@ def copyhardlinktree(src, dst):
     else:
         copytree(src, dst)
 
+def copyhardlink(src, dst):
+    """Make a hard link when possible, otherwise copy."""
+
+    # We need to stat the destination directory as the destination file probably
+    # doesn't exist yet.
+    dstdir = os.path.dirname(dst)
+    if os.stat(src).st_dev == os.stat(dstdir).st_dev:
+        os.link(src, dst)
+    else:
+        shutil.copy(src, dst)
+
 def remove(path, recurse=True):
     """
     Equivalent to rm -f or rm -rf
-- 
2.17.1


