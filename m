Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9CAA771C3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 03:51:30 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id g2so17903114pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 20:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Vot4A5bBnQZXbukj77pmSXv3Y2cnyH3iO0JGXgZPXMM=;
	b=EoXzAC8oWfN6C6jWNJUegy65aObhDuD3mOYmNwZ70MsuQnFmC8If0GhqNTU0fFGezZ
	N8MamW30Wm8Zu88MNLzGlT1kiOWahIagsHzc8ywfGGQKQiQiVcSVA5Ymqlb5pMp3pxQc
	f+c2ckXdVsMKAoNXRceWEpo6wJ513pnTGXKGvGJSVK0rL3no57aUixGvxPulx7WzMO2E
	jddXayQk7rw3xuVpE3NQ0YYJSSWcg6yzXut3yDHAd4rLpyPvf9TW1a7AKlHpYZN1C9cH
	EgIqCyDKPfYJLmC5/uvJCNCYKT/6yjMAlT+eFeHiPKOrP1iU3FM2szEABWfZ3rLLk7Ru
	AfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Vot4A5bBnQZXbukj77pmSXv3Y2cnyH3iO0JGXgZPXMM=;
	b=htQo80ENilWMT1b+xk8E6OpktuWI0EpVWgBqnLlNIXH0XYGLJ4fHH5vxT65kr3HCdW
	XlA1oNXsJ44qA6nRDzWGNaw8+No1whXWaeOpyY6CfG7OODuol8igzJ3nvqs77mwxI3Aq
	mk0Xk8xrvywn3/KTj1Ugq3cNBTh6Ul9aOR5Bwcyw4z0q+ay+9UoU3+mbG8gRUY+jikLO
	hJu4C4fay0wzAt4/VXrAlVLRNdkGEkCcz9YpDU5aBtH4Wc3lebz5NOoOtgPYjLc42SlI
	lbVGyhFuIIp8EtFg84o014k5pFy8keH3iJhRR2FKhcx4Y8tnrYPFsw9lezHGc7Hvu8KO
	iKFw==
X-Gm-Message-State: AFeK/H1VeAqjgTvLO74BckN7iTkoWxXXaQB8bs17hTp4GVYzbPyIaKbfP/YA5PrQfF2JVg==
X-Received: by 10.84.202.194 with SMTP id q2mr33552286plh.108.1490673091382;
	Mon, 27 Mar 2017 20:51:31 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	b70sm3768669pfc.100.2017.03.27.20.51.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 20:51:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 20:51:23 -0700
Message-Id: <1490673083-1185-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bitbake.conf: sort HOSTTOOLS and remove duplicates
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
X-List-Received-Date: Tue, 28 Mar 2017 03:51:31 -0000

Cleanup only, no functional changes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fa5445b..96a9ed9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -455,21 +455,21 @@ export PATH
 
 # Tools needed to run builds with OE-Core
 HOSTTOOLS += " \
-    bash sh cut sed gcc ld git rm install which find xargs cat true mktemp \
-    grep tar gzip touch cp mv basename dirname tr getopt sort awk head tail \
-    mkdir patch uniq perl python chmod python3 ar strip expr ls make as \
-    ranlib egrep echo chown cpio tee wc wget bzip2 stat date rmdir od diff \
-    md5sum dd chrpath file pod2man gunzip python2.7 ln g++ [ false true \
-    uname test hostname nm objdump objcopy cmp printf env readlink gawk fgrep \
-    expand pwd sleep diffstat chgrp flock ldd strings rpcgen du makeinfo \
-    getconf mknod cpp readelf split \
+    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp cp cpio \
+    cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
+    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
+    head hostname install ld ldd ln ls make makeinfo md5sum mkdir mknod \
+    mktemp mv nm objcopy objdump od patch perl pod2man printf pwd python \
+    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sleep \
+    sort split stat strings strip tail tar tee test touch tr true uname uniq \
+    wc wget which xargs \
 "
 
 # Tools needed to run testimage runtime image testing
-HOSTTOOLS += "ps stty ip ssh scp ping"
+HOSTTOOLS += "ip ping ps scp ssh stty"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "ccache ld.bfd ld.gold gcc-ar gpg sftp nc socat sudo"
+HOSTTOOLS_NONFATAL += "ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
 
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
-- 
1.9.1


