Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6A28E72A6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:45 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so5962457pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=p6VvjOTO8WemjRjQB080cSJhhJt1yfDlPeZFKJmsPkI=;
	b=JI9NVEOyGSj02IJYzuGMufvVvkc4TIgEhUqbqKywHXPcF3LcbTBpxv72hBjWRs6QlL
	116adGfZLEO8zR95uZhy5VPfcbc7KgQlsDdTmzt2EMoYr/Og5uaKSY+0o9Haphv+ftxw
	b1elUcuWOutPMHODfGx43iQfxzJaQwJZBylHdz5iE2v+afukwSixBRtzy0IAU+gQI21c
	B2uz7RHHBMzaQUUHXFMWldS0iWhkhuxd9Fb3oKFE+T6iKGDhtJjCsVOCvn1ZfjZQBt1C
	ZaHUAKssHfXoPj+vYl/aG7U+b2TQoDjbyRiveXtc3mIr0UoytKAc1s+W/jZe4S2dXui3
	epPw==
X-Received: by 10.66.66.40 with SMTP id c8mr6617470pat.139.1423152286789;
	Thu, 05 Feb 2015 08:04:46 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:25 -0800
Message-Id: <86b9c2b226922af74207c2333d9d306cc9864369.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 17/61] openssh: deliver ssh-copy-id
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:45 -0000

From: Kai Kang <kai.kang@windriver.com>

Deliver script ssh-copy-id from openssh which is useful to add an
authorized ssh key.

(From OE-Core rev: 16562034a2c28cbfc6c90f9324c42c08e0655b7d)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_6.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
index 0b9e0fb..f575665 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
@@ -94,6 +94,7 @@ do_install_append () {
 	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${localstatedir}
 	install -d ${D}/${sysconfdir}/default/volatiles
 	install -m 644 ${WORKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
+	install -m 0755 ${S}/contrib/ssh-copy-id ${D}${bindir}
 
 	# Create config files for read-only rootfs
 	install -d ${D}${sysconfdir}/ssh
-- 
1.9.1


