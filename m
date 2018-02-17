Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2BC71B2A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 15:44:20 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id l24so4264669pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 07:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=tRtCFgmviWeLIII4J871nzBmd5/RR+4tbrmwwqdAK8o=;
	b=PuUcrgF2FqJTdMpWTzVdOFXP1sHlpI2YB7x5KEaVcxuxTZkGtXzD6mVnq0Wz6cg9Rl
	hjTjhbSlQzoqkkg+SXo+hzIQTRApBB9KUMQhdUOB2RhYTEgCO466FeLovY8XU8dZ0qgv
	5Uzs5zeZT0JhlibW+Z+brcLOrHZYtOaiRsS3ikil45U+0BUF1mjhUE00afXg/iI0/HC4
	wukdXTjUX4fF1fiVeCPHLOpmVnWTqn7IuqNp491uj5hDVyCP980rjDei8I8UlfopUIGo
	DYWVisWnybayk7eh/Guwq75+U4k8YvMXDQ+bMeSrt9LhYc09xiGU8sZvq11xnmBJjn0u
	AHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tRtCFgmviWeLIII4J871nzBmd5/RR+4tbrmwwqdAK8o=;
	b=cJ235iryukUUCTLPFXliG3+2SqWF33d4KkV4YQJeUGFEtBXK+j3wCIn/OWWk7hdD1Y
	70uSlPQaTpoSfOOKqFrKanoz3yKVB64mewZ+0LumWgMSviDLAqvbbAL8l8YmJ+fdIDLU
	xogR5+QEh1hB0++iDX7wyDSdhnNltvgnEbWt4r8/bofmUbi/J15fa2AK3MeqE94+LcHI
	UKs4e43HJ9i53erUaZUQ0vVJDW9cVVWFMuaQ1pNivmgekNaMXD8fI4aYGv5wPO8Hiewv
	unUW2ry+rFn1maLppQGSam2ve3crHmFSECfp4pSYUVbwzAWBL8BHS/TjfO29vUAAC9nN
	9Xmg==
X-Gm-Message-State: APf1xPCkR/QCaQni6YXg/GHgJNlgszzl2JSZPI33sffh7b5v2RdOwexJ
	0vZHRTDNQvFMOLZxyfgCveY=
X-Google-Smtp-Source: AH8x227IzNG0Px4uf+0sxtUhCfuqh5u6jA5Uh+YQZO5meG2Lt7gb6YIoiRNZaw9LXD8qzAnLRZk9+g==
X-Received: by 10.99.122.74 with SMTP id j10mr7729028pgn.84.1518882262490;
	Sat, 17 Feb 2018 07:44:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:1886:ab70:59d6:9e86])
	by smtp.gmail.com with ESMTPSA id
	x124sm46728635pfx.105.2018.02.17.07.44.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Feb 2018 07:44:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sat, 17 Feb 2018 07:44:19 -0800
Message-Id: <1518882260-2644-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] update-rc.d: QA regression.
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
X-List-Received-Date: Sat, 17 Feb 2018 15:44:21 -0000

I noticed many new QA warning with arm64 mulitlib
suspicious values 'initd-functions-dev' in RRECOMMENDS [multilib]

I believe this is a regression via commit
http://cgit.openembedded.org/openembedded-core/commit/meta/classes/update-rc.d.bbclass?id=cdcebd81c872cb7386c658998e27cf24e1d0447c

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/update-rc.d.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index e1e0e04..06e3b21 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -91,7 +91,8 @@ python populate_packages_updatercd () {
             return
         statement = "grep -q -w '/etc/init.d/functions' %s" % path
         if subprocess.call(statement, shell=True) == 0:
-            d.appendVar('RDEPENDS_' + pkg, ' initd-functions')
+            mlprefix = d.getVar('MLPREFIX') or ""
+            d.appendVar('RDEPENDS_' + pkg, ' %sinitd-functions' % (mlprefix))
 
     def update_rcd_package(pkg):
         bb.debug(1, 'adding update-rc.d calls to preinst/postinst/prerm/postrm for %s' % pkg)
-- 
2.7.4


