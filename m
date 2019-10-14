Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 96B9A6D545
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 21:50:22 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id b20so18101366ljj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 14:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sEGg9Sj1BP/bFt75GPjmKhLqV5N9tjB1lEizwnDJxJE=;
	b=qJwEll9QFXOFEM7149T+DczXTfEepotmn+jU//VWBsyWo764WhobNXg0f6JSW98P4t
	FI4p1Juk8hS7oQZzQTTuzNLtnGA58V0ey9jsm7nTyVdfxzHk/LOWvyv1dUH+4/OroKv0
	X85gSpbtvHeYpt+ufL8T8Uptb4aE8R5UDsp4BgEJvbvCieGrZLOYMTlWeDz1B78gqrtf
	/xBBBfvf89GiqhOtoht/RjX5sbSl8N1m46i4YmSswjFtBVADRFevpyZBL7W4ZJAaG3O+
	lW+qsCLXwH7pcyhlWvIKQ0PBpjByOkUtb4qjF43eL3f4Q6jvQp7Z7gopvf1UeU+CoqcE
	flrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sEGg9Sj1BP/bFt75GPjmKhLqV5N9tjB1lEizwnDJxJE=;
	b=aST/LovnfwZMIQTlo7POECWko2k7BALctSvRJUeqEjp0dfCXHkWbVzMQzXOZtYcxW7
	Rb7DNwrSiLFaqgDgVGKbqcR/6IC5eUreKjicGFKTEJFcmu8fN9N5TjC43/NuiHzJ7L2U
	ZQAxx322akUBJOZTx5bonZx5F8aWHjAuUvI+aWWozfMKxzipyL5Rq3k5GyVrfgdMzbVO
	CoSVEu82qw1fYbk/ZpfN/dUdsx84+q95WhpLil1Q8F+zI8hn3ROrPQAvLuXswu3zicc+
	3u64QqiD1s3xk9iS7nB6Ox11QdlP1JEMIkGc23EiMKwClI91EQMs6y4Uvf8BQaluTHSH
	32ng==
X-Gm-Message-State: APjAAAXUCL7aNHpGu2n2eB8qSjymoupLdxKL2t8Vtr8pXnrelaoep6r0
	eUTeB9jFSrOOxwYtZe7afbFT0je7FeY=
X-Google-Smtp-Source: APXvYqz+qbt7p83h64x7dUpNYE109vGF3I6xPuAzpXe5jaqiegav1Fu/+U3BS+OmjzrwLvPa0CiaYw==
X-Received: by 2002:a2e:964c:: with SMTP id z12mr2213367ljh.79.1571089822750; 
	Mon, 14 Oct 2019 14:50:22 -0700 (PDT)
Received: from localhost.localdomain ([188.162.65.242])
	by smtp.gmail.com with ESMTPSA id c3sm4418076lfi.32.2019.10.14.14.50.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 14:50:21 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2019 00:50:11 +0300
Message-Id: <20191014215014.9656-2-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014215014.9656-1-dbaryshkov@gmail.com>
References: <20191014215014.9656-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 2/5] multilib.conf: add systemd-boot to non-multilib recipes list
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
X-List-Received-Date: Mon, 14 Oct 2019 21:50:22 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Add systemd-boot to NON_MULTILIB_RECIPES so that it won't be built for multilib targets.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index cfed3fbbd07f..c734a121e12d 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -29,4 +29,4 @@ PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkg
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf"
+NON_MULTILIB_RECIPES = "grub grub-efi systemd-boot make-mod-scripts ovmf"
-- 
2.23.0


