Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXNx-00076m-38
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:11 +0100
Received: by mail-wi0-f172.google.com with SMTP id hr17so1211382wib.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=7tfNI+sQW31uQjAlGFtQ4MHyfW9ZnUPEhe8Dm56M0y0=;
	b=XCAY1cUN+GtEFYVNibWmFSWb9LqOMZQxiRDH4zSh7wSgOD7E8oyI5LHuynW4In/M4s
	R850J8nWTY3e67DCyMje+1uzkG2IIjIQroKAZw2MSlFy2OPCdnngibYmgS18l7NO1mNe
	uKPbY3aJTmbpQHMLkfBc28jB2AkN5jQAZ1NCnuL1C4qYIF8ILXYpcd9KK+TSp+F79xOE
	04JHv0uTRzGWDPuZpxd29MqpjN3VUPBOHCTwuoSlZlK3OFuwiUFrBVs6/atbB2t3Ih6r
	onPC7E6rtadtlkLShpPAGHe36E7eRAtSln9VaQL+q9JFGhjC3p8OJJ8UoMMlKBacApph
	dZjw==
X-Received: by 10.180.74.67 with SMTP id r3mr4515504wiv.14.1364316789375;
	Tue, 26 Mar 2013 09:53:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.08
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:03 +0000
Message-Id: <cb33f47af852b62bcb4cc816b10bcbe425bb5f34.1364316411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmj0R2/mKK9BUQPYem+OnTW1MZsqKrtWKJkGr9cCshUxwrXkxVD9KglFWZasrlwuUj1HRrG
Subject: [PATCH 05/24] core-image-minimal-initramfs: don't install busybox-syslog
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 17:10:18 -0000

This uses BAD_RECOMMENDATIONS which isn't supported by all package backends, but
it's a start.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 7f6826c..6de24b3 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -17,3 +17,5 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 inherit core-image
 
 IMAGE_ROOTFS_SIZE = "8192"
+
+BAD_RECOMMENDATIONS += "busybox-syslog"
-- 
1.7.10.4



