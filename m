Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 689E76079F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 23:28:07 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id x86so22260871ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 16:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pwzPS7KeOYORrP3UGEBgVUsy8pG6RiYmvBJLPnsedxI=;
	b=m+VOIFVmDJXwAXGitXvziqgTSBIEe+yNkHz3fZrvIbR9leuO60WRY08GCwV3fJuec0
	WjALI7+/9s0UkytTPdVjJTxTXEoxYT3FeZy3pz36Akpli5FmfNnUIojP5/esRQIBdtqS
	6AiQeBkWOQZ9szARY7cl9XO37LRsrlfQkD+1WakMuncuUrWXdRUmC3gmakq7lFgzgb5T
	L0KoICeRpJ6OF8wAWu6lYo1hnTbiokoa3avZBpMeeGForq7KLgQ8ewa8jbHRevR5sUDF
	t+d1pZtIOaHKVzlK2uzuj5XHGqypbXyfJsm5RAQ/X3QsY9Bp3UBPx0ghdJdzfC5baLE9
	i3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pwzPS7KeOYORrP3UGEBgVUsy8pG6RiYmvBJLPnsedxI=;
	b=RsXSogtxRPnGmIHiTVb8pyZLvNRXDyNQQt3fUyxfm1oOWQ9XAZz8/nUpgdhMXG+sDA
	FlzPl7gQyvwpoc3VkqkJgp4+LKrjsVXZljFYgaplCdk7DzqWkxZymIFgJTu7ZIP0TQ/+
	tvFoySW/vRBLWOF7T0YZ4Sa0m5gvmqUS9nEZ32magDw5MDdMidT/K1/E+WBp3hggH94/
	IcbVPr2JoV3UaSbWTP3CUcBRm2W0RcZPH7boSd42uOcEWP9rCr0QacEVI5UA6GxaYRgr
	U/8bnQeXQPet89OAzd8clNbMHsh73f6BabxXeS59pbaOWzx//FLjA/kG/MlhH5EHAKA+
	sj/g==
X-Gm-Message-State: AN3rC/7iK7i0iNO8bXMh2HvG2x+tANTtGr83/G0vi9e6bR6haYk22u8F
	MxDMTxxespZO6g==
X-Received: by 10.84.164.225 with SMTP id l30mr12565848plg.23.1492730888931;
	Thu, 20 Apr 2017 16:28:08 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h89sm12315588pfh.45.2017.04.20.16.28.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Apr 2017 16:28:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 16:28:02 -0700
Message-Id: <1492730882-14291-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libcap: drop obsolete attr PACKAGECONFIG option and libattr dependency
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
X-List-Received-Date: Thu, 20 Apr 2017 23:28:08 -0000

In the 2.25 release, libcap dropped its dependency on an external
libattr library:

  https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=85f38a573fc47472ab792e813b6f6b6f0b1df112

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libcap/libcap_2.25.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.25.bb
index 26d7bf2..0587e77 100644
--- a/meta/recipes-support/libcap/libcap_2.25.bb
+++ b/meta/recipes-support/libcap/libcap_2.25.bb
@@ -27,11 +27,9 @@ do_configure() {
 	sed -e '/shell gperf/cifeq (,yes)' -i libcap/Makefile
 }
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG_class-native ??= ""
 
-PACKAGECONFIG[attr] = "LIBATTR=yes,LIBATTR=no,attr"
 PACKAGECONFIG[pam] = "PAM_CAP=yes,PAM_CAP=no,libpam"
 
 EXTRA_OEMAKE = " \
-- 
1.9.1


