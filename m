Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id AD22373C7D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 12:20:52 +0000 (UTC)
Received: by wgiu9 with SMTP id u9so17499416wgi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 05:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UCwIlbndPW9O3Eqf+CpkbbX3xOMy78dVeHXMsuU3AkM=;
	b=B2ZnTSxPo3qhNHp6CmEzCtl9hpWv1VYxylulaDNkBEsgbeq784XbvKKXH2Zzdk95i0
	mxbHMJbsPA9OELQSoveox2wVCDZ5kN3UYT4CuzjII5JgRiYdXeL2fTlG/DKxayQe5bf3
	rM1wEOpRMdVLqDtxswlL7rLv+1V266p2n2QkdFuIDnEY1qCTnaCi9BnolWDQUYFDjIjY
	WW4IacSkE4cYf4ONhSQUUTk+XyD+J7O7TvKAbpInuzXaNdRkCnCvhIOimFOsONuh7xTC
	0Mf43i2HRkbBO7CS/fvyz3DX/XGJOif9jyUChbCuJhrPa4OeNJ+q8fCt2pTVuZVVqThy
	ueWQ==
X-Gm-Message-State: ALoCoQmYOEI6up6XGdc2fzVlsYvWItiim96wQEy1EelTeSBduPGsAGIqExQbS/NXhwvu3ML534rs
X-Received: by 10.180.14.134 with SMTP id p6mr3528478wic.44.1430828453183;
	Tue, 05 May 2015 05:20:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id js3sm25339706wjc.5.2015.05.05.05.20.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 May 2015 05:20:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 13:17:00 +0100
Message-Id: <1430828220-14251-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] poky.conf: remove SVK mirror
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
X-List-Received-Date: Tue, 05 May 2015 12:20:53 -0000

The svk fetcher was removed in bitbake 1.22 and oe-core master doesn't consider
svk: a valid URL for mirrors.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-yocto/conf/distro/poky.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/poky.conf
index 3598f4f..aa6f01e 100644
--- a/meta-yocto/conf/distro/poky.conf
+++ b/meta-yocto/conf/distro/poky.conf
@@ -53,7 +53,6 @@ gitsm://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
 hg://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \n \
 osc://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n \
 p4://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \n \
-svk://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n \
 svn://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n"
 
 MIRRORS =+ "\
-- 
2.1.4


