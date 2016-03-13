Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0F19C731F6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n205so11551930wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=f6IkL4pFtAz4dgRUU6cmBBU1oUeX1qdc+fqfl3W5szc=;
	b=gVpogcT1bIEIQr3p8Md3Xvs0+mdKrt3dPjsO57qvT1dW2jmFlcQI37MnH9A71efdX5
	mi5CdBz700kaqxnBVBZdnANUnAKFOGpt29PdswPDqqUwKmnk+/frESPldCWQSlE8pVwY
	Hinu6is1kshOkvalLvtW8y1Z6qJhg1SPLYnkPAcFMpHjfhTt9cdPL22VZPgUrCS4qc0L
	7ku5cQkOcV+JyXF3T4bVnsZJQdyZw0YIvkptgLCSQluyZgjIOL1kW3GnpPZo9ntsgTLt
	vU9pgOjy0xkvp3C7JVUQFASDrrpp4xw773aSR6nUrKF+OJyJJcrCXPrGwC2Dup6wOSQc
	PUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=f6IkL4pFtAz4dgRUU6cmBBU1oUeX1qdc+fqfl3W5szc=;
	b=UQq3BXt8SIGCuXSpNJYvvLmYAhtIeqzPKuy3PAJVFY1NlVkq3JkbREEfnti+fAz/EA
	+tu6mcsUpTEtY38Gf5KLXYMw5pFJvKk2Zevizs1Uid1/QwsXPOyvNyahrt1+BEzDTLTY
	qavHyF9iAgmWsiA2FsLTPV4l05RlgyWcBoztb4AT4Vc4deoewJ8RJ+K1Hc0efLSvMSM2
	5HjWWE0Bj3ZQP8f7BgTeVfldrJ6B6Tc64h4Zr119gYJaSsqKYUTyRolBOyjV4GLaUIhc
	0npWuv5mpiRI890mY7DZEtYjK7WbiggMwcLi2u30eg76UTqRLzvU4QjDqpqyVsksQsPV
	POqw==
X-Gm-Message-State: AD7BkJI0byVNeq/4SZQUDVpSiAaPT6Iy8TXa+ZY9hekG85Se9excOLXIk9sQ93oVBU7mRw==
X-Received: by 10.28.19.130 with SMTP id 124mr14376006wmt.2.1457896528681;
	Sun, 13 Mar 2016 12:15:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:27 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:40 +0100
Message-Id: <93b575d9347e4c2b95d429e5c69bd533fe00d059.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 42/42] bitbake.conf: Mark systemd_unitdir as deprecated to avoid future use
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:28 -0000

* This var is not used anymore in oe-core, but it may still be used in
  some other layers. Let's leave it there for some more time to avoid
  crashes.

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7ed5ffb..7eeac94 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -32,7 +32,10 @@ export datadir = "${prefix}/share"
 export infodir = "${datadir}/info"
 export mandir = "${datadir}/man"
 export docdir = "${datadir}/doc"
+
+# systemd_unitdir is DEPRECATED, don't use it:
 export systemd_unitdir = "${nonarch_base_libdir}/systemd"
+
 export systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"
 export nonarch_libdir = "${exec_prefix}/lib"
 export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
-- 
2.7.1


