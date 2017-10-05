Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 39E9D71B45
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 18:21:43 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id r64so15365461qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 11:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=irFkAiPXzs7Bu+o8E9QzXag8oy+cHWd+F5j13W0WogI=;
	b=Vd71O44BnNsZ6I8kQIv1RwQWaTZYDAmNIQ/pSobaCfL667zzL/vMalQS/W5wjPuOGH
	t/IXZfhPqN2sMi4Hc4V6FMIuWeosrDkoDuHup11WzZthmrgGUB1v1u0Q4cdSw0d0Q0Be
	jz/moKoGObHtjq0kOaVp3DQmM0ZfNT452IApyvligJjHgzf584SwRpMwxtPHlcs0IGe/
	bqzt7ZopWfE+uJlKqzbUwpPlxe7apluAyS3g+rRIKIF2dmHLReTBiP4w8M+5+6kLM+aa
	gOuCIXfFXNAjAxRybLEE5galSPd+NVV8g+0JUqgaHkAgFBlgcZGKRjZkYg6XxWs3+J7G
	5lZA==
X-Gm-Message-State: AMCzsaXckXirSD+LEjy9huWDvT3cpvek1YNsFiIsNQwWIgi8FaMICPVe
	BNOt6VV1JQ+Jo7VA/qNxGdC2tw==
X-Google-Smtp-Source: AOwi7QCh6hntkRtt37XXnGaySyJnXQ3zU+PEJQmd/G2QmKGk8Qvshx800GMv2Uk1AP2p5oAY155XIA==
X-Received: by 10.233.232.14 with SMTP id a14mr21300131qkg.256.1507227704765; 
	Thu, 05 Oct 2017 11:21:44 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	d139sm11927353qkb.96.2017.10.05.11.21.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 05 Oct 2017 11:21:44 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 05 Oct 2017 15:21:36 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  5 Oct 2017 15:21:35 -0300
Message-Id: <20171005182135.5888-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] bitbake.conf: Add 'id' to HOSTTOOLS
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
X-List-Received-Date: Thu, 05 Oct 2017 18:21:44 -0000

The 'id' utility is used in 'rootfs_check_host_user_contaminated'
rootfs-postcommand so it must be available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f41680b27e..6f53b23a67 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -476,7 +476,7 @@ HOSTTOOLS += " \
     [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
-    head hostname install ld ldd ln ls make makeinfo md5sum mkdir mknod \
+    head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
     mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python python2 \
     python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
-- 
2.14.2


