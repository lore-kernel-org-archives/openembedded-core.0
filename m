Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0D04F7E371
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 13:50:42 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c6so1668803pfa.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CR+PBeOW+9/dKmgCjlZHDSGWEP5wIA9Lsn3cVUZ4FAc=;
	b=ZK1Y909daYmmPndohVSckAXRc+sS8v/bXd5BBbfnWZ9PBNu+aVihNOI4IHO2lj9mSQ
	+4WkvgWim4eOg3jySw7SXqNXepKmlHDa5DlO9CaZvqcGuaOcjwccFSDEPuZvdg1z2yzn
	pFY07/PrkMWTrumJ1VhbuyCdxdmumY8XhwMt26tFOYdsABvZ19jN2wfKeJkZwYv/bOtS
	K8GmvShWn+TcphFx++okJmooN2IL484o+CxhqPslTm0gI1dqjrSKEE6+fgljXNFeYvTu
	4idqrEBf8kaNmhgNlOcACjt5/GCiYKd2DcTEHfLvNRAXWZWAQ3alV7KJWtAPmqNA1zs+
	1cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CR+PBeOW+9/dKmgCjlZHDSGWEP5wIA9Lsn3cVUZ4FAc=;
	b=LY0svZo5+t8X18EKhX412aKh5RPvM81IVhpkFPzHZTe4ORCi6bhmHp3IVP4HvA4Rno
	xr+52E0n5FNkhFr3EHvIqK6K+n27bvthvDVbNaWU7rIvW0cBOwJbGbBo/g1hhyMpNR4K
	fEoUULVFhZ88qO4fiolfMXTkIWkBeWu9diUF0ct+gKeirBatP8YhVMJfxioVln11QWxa
	eI0Z5+Fhl+JHPrd9pfnpyJq2EbWrI/ymf1ouPO9cDazG/SUHJyJFx3S03m84w16MWKcQ
	OVjBdvfJx4YWzQli4XhfE+X/VEIvMs0CSim4rn8twoS95aez68M5BZCzRANSpET2RMjx
	Rp8g==
X-Gm-Message-State: APjAAAVCbD0NreNw4VdOr79HgZsxnzjqhw/fqVTtqmUhJEqeQKr3fYmT
	+NGwfzTrALg5K+KazfSlmU22GVxJ
X-Google-Smtp-Source: APXvYqx6b0mEOL7qsUchWTXHTVloL74l0skYn1da6dCzozfdFAZPnjbOBsdsE86DEqp79gGJneMlVA==
X-Received: by 2002:a62:6585:: with SMTP id
	z127mr109946709pfb.179.1559137844073; 
	Wed, 29 May 2019 06:50:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id r7sm5976891pjb.8.2019.05.29.06.50.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 May 2019 06:50:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 06:50:32 -0700
Message-Id: <1559137838-8972-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
References: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 3/9] gnutls: no need to inherit binconfig
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
X-List-Received-Date: Wed, 29 May 2019 13:50:44 -0000

From: Ross Burton <ross.burton@intel.com>

This recipe doesn't ship a *-config binary, so don't inherit binconfig.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/gnutls/gnutls_3.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.4.bb b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
index 6d2a11d..d79a39d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.4.bb
@@ -24,7 +24,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
 SRC_URI[md5sum] = "63363d1c00601f4d11a5cadc8b5e0799"
 SRC_URI[sha256sum] = "c663a792fbc84349c27c36059181f2ca86c9442e75ee8b0ad72f5f9b35deab3a"
 
-inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
+inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
 PACKAGECONFIG ??= "libidn"
 
-- 
2.7.4


