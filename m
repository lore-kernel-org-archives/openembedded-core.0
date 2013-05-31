Return-Path: <kergoth@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9306162D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:26:32 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wd20so2000188obb.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 19:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=p1bhCjMkXqC6F4JEsfwGPcuwRlYnJCexbH7lDaBOpPQ=;
	b=fU7OODE8L4s8e8vTRfOBC/WhCQZhw+TwCuAGZi4qVQbVZbnYKhHCRfL4FGrvWfxLN5
	rjI/bzIQFxc3BjpRdAL8JGuRjPpeL4htd+oCWX4umgyNh/ek6uub1nNZ2LrfLflqHvnZ
	lxo/qtUIjga0s3GFJezLesMGnnflEnYygBVPYT0ic8grb1uWANBguYRVXiNoZ2WeR/nY
	ETW/xl2K9M0l7ECgh+9WwZWYSN6qM6C+QgeV3MbZHQLTvHMlAknUX4nopV74TBt0C54g
	EjuwC0lwtnPczsje4QWjFZhf1EZatOfitty+Woj5CyuHwaUwha3VOZgyL5NzG/6Qlzs4
	FXfQ==
X-Received: by 10.60.79.198 with SMTP id l6mr5050164oex.47.1369967193302;
	Thu, 30 May 2013 19:26:33 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id sa2sm14397164oeb.1.2013.05.30.19.26.31
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 19:26:32 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 19:26:26 -0700
Message-Id: <77098db36645a68083166e7f1b92f0ed47d72edd.1369967097.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1369967097.git.chris_larson@mentor.com>
References: <cover.1369967097.git.chris_larson@mentor.com>
In-Reply-To: <cover.1369967097.git.chris_larson@mentor.com>
References: <cover.1369967097.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/5] quota: obey 'tcp-wrappers' PACKAGECONFIG
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
X-List-Received-Date: Fri, 31 May 2013 02:26:32 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-extended/quota/quota_4.01.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/quota/quota_4.01.bb b/meta/recipes-extended/quota/quota_4.01.bb
index 80159a9..4dc7e68 100644
--- a/meta/recipes-extended/quota/quota_4.01.bb
+++ b/meta/recipes-extended/quota/quota_4.01.bb
@@ -21,6 +21,9 @@ inherit autotools gettext
 
 EXTRA_OEMAKE += 'STRIP=""'
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--with-tcpwrappers,--without-tcpwrappers,tcp-wrappers"
+
 do_install() {
 	oe_runmake prefix=${D}${prefix} install
 }
-- 
1.8.3


