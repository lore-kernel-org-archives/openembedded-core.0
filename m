Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 01A207F8D0
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:55 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id kx11so1663271pjb.4
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ihb2qAySksjavllcldgEzYH/OXog0fr4LTqKcMfp8EI=;
	b=fIIT+zH/PrnfYtpacpXqcnQCRHYWQCIysf76Y+0xPXnoCeveC3ZHZ4dVAOzNv0/px6
	Ezh3MJ2AhHAXRqJ2m2lreCn/Z7ELz8/EN0aZcoqjL1ycbKvoxsX1oI9KazUHktVcYp9m
	6eLFNeWwIQ9E8C1MIg5ft9eofYVv+5kbOOfUku5iHBBn17gvaQef37ZTA7VEjCADQR0y
	4PwcF/dTrhe6qiDmhG35tKZlQAUaPbcKaA5Euf2ejKlGuk5vgS3GV0S1OlSNt9mRqMm9
	y9bWPijqy9bPrPZKM5PDOOtV7mNTBlUxLkC2eNhzuGFYCIgTYKC1VqTa/PdVIHZOpvLg
	wjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ihb2qAySksjavllcldgEzYH/OXog0fr4LTqKcMfp8EI=;
	b=mGUk++VMP+ojZCJpT8xd/PbqH3cHJT+kdfd15UWMkep25uCQVXR5J7YcwOL9jotPc8
	5ffDTsIwrNX9zMlUfRKk05FGi2OTLs3Bgsrv4w723lG6F67A31RljG54tnl5kJoYHOhD
	suK8nMZtjIiEzVUqQTfzzYMGVinMuPrVffz3zebnG9+irK8kHVANmpIUTyltnDAo6WE3
	oOppgPzfXuIL81b58NRMGw0QRBIPyFCKkKdxdy/cfM9shCVjqtzuNVlOiCg2w4PJpGzi
	psRyqepCd6pwfNj86x0a3j2/VOLBaFclMVl/j1XbQkEMsiXhVC3kPVX4RZpro64rmidk
	yJAQ==
X-Gm-Message-State: APjAAAViCafpNQOwXCoKtrTAF9fkfuzuMQbkAt6WuXsQnbRWyDN8p8FH
	xRZ8+KuXzZtnuriV7GCYIAn0GOKa
X-Google-Smtp-Source: APXvYqxumRthHg91mBnRC3yg2LACjzaHVa5GEdLT+WqRKu4gvBPOwa/VCsA2r//9xFlq51zzqJlFiw==
X-Received: by 2002:a17:902:bf03:: with SMTP id
	bi3mr14527160plb.119.1579188056997; 
	Thu, 16 Jan 2020 07:20:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.56
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:21 -0800
Message-Id: <ab5cc4a6119527e48299d7d6b7fac440c4b9bb6c.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 12/32] libxfont2: set CVE_PRODUCT
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:56 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
index 2b72d6750c..6994d79e89 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
@@ -20,3 +20,5 @@ SRC_URI[sha256sum] = "0e8ab7fd737ccdfe87e1f02b55f221f0bd4503a1c5f28be4ed6a54586b
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
+CVE_PRODUCT = "libxfont libxfont2"
-- 
2.17.1


