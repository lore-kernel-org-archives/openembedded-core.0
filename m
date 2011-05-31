Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRREe-0001ha-N8
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 17:52:00 +0200
Received: by fxm19 with SMTP id 19so3662979fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 08:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=1XIXkLdUC8PU1S2FJQGNZmoIVo4hz1ngbnmKw3tew20=;
	b=hIHH2FFde2aC7Y6Irb1pQATBMSHPkaFP6gASUvmY7tl5GjZPthwFdDcZEdj8Rwir2O
	ciX/OlyJJGYPXrKLN/ZlpBuBfrMXcruE7DBalir3hyZmABus5p7FrozjjSw+vWmSYJ+G
	laWVJJl4SA1X9ZXKVu26UfsIn87E/sGjeJWcA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=oW0QnE4XgiIKr+XuKebFaSTamcZDBHpnCU3WDFtXFAmcQ0ZvmhA8rhDTELVmpZIztV
	L5j1MhCse/KpeK/Z96kihjzllAbQnachwz8bC5uKbgmOBzEnvUnP4OIM++B79cVh3CgR
	c1YjvRUuVP82NFTZZMPwOkwBbXqgpRYzxh+oI=
Received: by 10.223.41.89 with SMTP id n25mr1462915fae.7.1306856931397;
	Tue, 31 May 2011 08:48:51 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 11sm84881fax.36.2011.05.31.08.48.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 08:48:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 17:48:40 +0200
Message-Id: <4fdf0bdf57b56d363e0b2ae8747e85fc84fbf8ca.1306856806.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <cover.1306856806.git.Martin.Jansa@gmail.com>
References: <cover.1306856806.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/1] create-pull-request: allow '+' in git PROTO_RE, ie for 'git+ssh://'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2011 15:52:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/create-pull-request |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 19b640f..d52098e 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -102,7 +102,7 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
 		case "$REMOTE_URL" in
 		*@*)
 			USER_RE="[A-Za-z0-9_.@][A-Za-z0-9_.@-]*\$\?"
-			PROTO_RE="[a-z][a-z]*://"
+			PROTO_RE="[a-z][a-z+]*://"
 			GIT_RE="\(^\($PROTO_RE\)\?$USER_RE@\)\([^:/]*\)[:/]\(.*\)"
 			REMOTE_URL=${REMOTE_URL%.git}
 			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#$GIT_RE#\4#")
-- 
1.7.5.3



