Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF4177352
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 17:02:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 128so3855180wmz.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 09:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WcZBFf/xQXykd99AHLi6JSArPgZUb59MYb1goahYWVw=;
	b=EH2qv8Ho/gHPgfhw6l3sLLlRl/sWVSATheK1WdWjSJoA9tfS6ossZ9/5MDuwNZ7n3/
	+JocxuJuVlfuAj7BSfSTKn/kuQJqFtEy7P6wZhJV9hwRpYyASiMA/W+4CbWzgA2/3X7G
	bYCPNF51+n7QEDxqP4EcsXhKHA7PzreZL2QE4ZzV+yaFUa4UwuruKWnPgvMU4rRV55ON
	0oxfL3/Ji+hsSgyQfQVrF7f8P6C6Kv6PgQgivnTAkBlZ6acvfzhcHszxLzzR7xzLDmVl
	o3Wa1QzHef80vtfErHW6pUeWTVZCmUxnQpuZOqZEYPvmGyuq6e5ovFMQ0qicrSPDWJM+
	/5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WcZBFf/xQXykd99AHLi6JSArPgZUb59MYb1goahYWVw=;
	b=GJLkApqk263WDrBK5S2exS7dkHK+9D9ppfz7Of7lqkqRxYqcNyxe3wjo6pZ0B4eTvw
	jeUaqV7NJnWWthdfecspVBoFjkJYnWWYSA5Huc78lP0evl91EHr9F+qDY5ODtivr+2sV
	cDH3wAT34V4dzk1itbmZhBR8muyDkcrYJ6Onk9l7xKeoDH3qRIj2vzS0lhrPlTEoAuI9
	cfRp2RZVCrOha35Hqo4odMCctvyhNecntuJI6dRdRpKYmDFLkZBfRku2G6Y6D+ytdRmn
	cBxkzRTmS7jIW7fKl/TZpECODtSViL1HEJ/fjoAm7je74w9ccHzaYN0KszDURkriZgr+
	qelQ==
X-Gm-Message-State: AG10YOTBzcyi3xTgcINsFVQcrPc63OEAEo2c3A3lGN5pL3uR31A+UBsDtmLGoxLujboLMA==
X-Received: by 10.28.195.87 with SMTP id t84mr9969184wmf.41.1454691764119;
	Fri, 05 Feb 2016 09:02:44 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	v191sm18077361wme.1.2016.02.05.09.02.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 09:02:42 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 10:02:35 -0700
Message-Id: <1454691755-9327-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1454691755-9327-1-git-send-email-kergoth@gmail.com>
References: <1454691755-9327-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] toolchain-scripts: drop PYTHONHOME
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
X-List-Received-Date: Fri, 05 Feb 2016 17:02:43 -0000

From: Christopher Larson <chris_larson@mentor.com>

If this is set when nativesdk-python is not installed, it will break the host
python, so it's better to handle this in python.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/toolchain-scripts.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index ab4feb0..1566dd6 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -31,7 +31,6 @@ toolchain_create_sdk_env_script () {
 	echo "export OECORE_NATIVE_SYSROOT=\"$sdkpathnative\"" >> $script
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
 	echo "export OECORE_ACLOCAL_OPTS=\"-I $sdkpathnative/usr/share/aclocal\"" >> $script
-	echo "export PYTHONHOME=$sdkpathnative$prefix" >> $script
 	echo 'unset command_not_found_handle' >> $script
 
 	toolchain_shared_env_script
-- 
2.2.1


