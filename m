Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 15DF870100
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 16:41:00 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id f126so76827060wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ok35lBqEmp4D6c7z2+7ySgeajRyYRhroJESOAjxCQzU=;
	b=wL6MNO2e1uqZi/2gs0NZADrwd/sBu2A582bGjx9ioiH1eHG06+yXO8ldGU3lBnpM0B
	pECjMBn6CWNGgIPIccRcyblDgG5YcZdOiISkiA1K6/X7SPlDn2zxsPEe/xTMgm87+TUs
	tmL+sCOFgIPrNneChqIC2t23VWkhJmJN+HkH3Yr+ACcRlCTLMLqQQS+aSOQo7KiNfta3
	GS8xbDHNvr4D9tnwaM+vYRiqj8RAmqCZIY58cX05rct5v2adYdJF3G57AFQOfZCzuaml
	I2V2Nq/SEuYCGVxgCu40ON44jhVfU4BJmTuL/yV7zKx1+pp4Ej/AE03KD4xV5faVCwZe
	hMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ok35lBqEmp4D6c7z2+7ySgeajRyYRhroJESOAjxCQzU=;
	b=fw/obaLXNtKT5tSuGLErZt9MwrpBpNWVRpRmhSrelOPCR1c8DnlQllzwll07fSNw22
	5WKmBNel5VAZjxaEhURDn+DNKNnq/k57a1t2MmnOeax/FBafOnYL+05Zv9WmbH1r7EKl
	csy+rbN2565Ogt1RnHLM416IClCNro65JGg3XU2R91FUrYkymM5bwgjLVkKfHDzZZ7IO
	TruR9ylzjFnUiYFVu0K9GfBnprzMlsvVp0RbJaKEpo5S3UIHCajiZsPFXolNaw0K2iuV
	7yCOse4sYvzp0tocLP2ABcH7ViuYvSEFCIPunafxie96tE2J7HWgmefICpD+l2XyKEyl
	ic1Q==
X-Gm-Message-State: ALyK8tJtO+L6w+Kf9SyqcwNEBZLdUhwMiBiOOcpF9LZoFtUUAZQZdfQ1pIpqpgtqKJv2xq7Z
X-Received: by 10.28.217.146 with SMTP id q140mr12561551wmg.56.1466440861073; 
	Mon, 20 Jun 2016 09:41:01 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id kc8sm659236wjb.0.2016.06.20.09.41.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Jun 2016 09:41:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2016 17:40:54 +0100
Message-Id: <1466440854-16120-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466440854-16120-1-git-send-email-ross.burton@intel.com>
References: <1466440854-16120-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] oeqa/targetbuild: use os.path.join instead of string concatenation
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
X-List-Received-Date: Mon, 20 Jun 2016 16:41:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/targetbuild.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index f087670..59593f5 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -117,7 +117,7 @@ class SDKBuildProject(BuildProject):
         subprocess.check_call(cmd, shell=True)
 
         #Change targetdir to project folder
-        self.targetdir = self.targetdir + self.fname
+        self.targetdir = os.path.join(self.targetdir, self.fname)
 
     def run_configure(self, configure_args='', extra_cmds=' gnu-configize; '):
         return super(SDKBuildProject, self).run_configure(configure_args=(configure_args or '$CONFIGURE_FLAGS'), extra_cmds=extra_cmds)
-- 
2.8.1


