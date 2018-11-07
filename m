Return-Path: <deuteros76@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 96C967458B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 15:57:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f10-v6so2398887wme.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 07:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ETOknFsz5+xBhaT/F5mSJ+AD2lkT1vzLC3dZGQ5VR2U=;
	b=RfFeqC3XiBJbA0Jv/dPXC6g6sSToVFSCJqsDj1NI+NNs6o1QkDtt3KFOt/T7NRwqkr
	/QSnIW4MUbWjYwWB2KvRYyMonuR9nnY4CdwESfOf+8fhqZvzU5B4yNN8X5VaBGosqfRM
	zBw0avpjSCoIjs01OmAbUdmvvN/IkIeO92QDr3KQwdbO0++4lMJPfiZG6eljNwHxDi6p
	tZkGAcdUG+5Vfw0c+leWsor96+kml5Ftx7sURH7lBS5oGB9PYom1ADfUBZFpLm4sIW05
	Lb++MVMZ1ombirKvypLM7f0+sdaiJbEdWJ0ZQfEVK5Ze1QOZWihNwDEHOuGPO0QPpxHM
	v3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ETOknFsz5+xBhaT/F5mSJ+AD2lkT1vzLC3dZGQ5VR2U=;
	b=rDQNmh5WtN8BFTdH5wHiizxlfQtrrk9BXWTzk5Zm1vsPT3/vDob6AKXZcL2ahjWcFC
	hzO4FelYSCTq5WEn/9sJgfvoEVvcVo8lEkcrDbPC1Io4ASB9r9bzCgfHm4ru+fYWUg1N
	Jlv9EkrMMI8L9MR/+zft3eZlkHS3kuiyi3BUrOfft7oxKX7anzIIrIsP9jEzXslRs4Df
	b+OpxkY8AE6HESNzbghodA4G/B5OyS0Bep4CrtAyTaSeO/2+k+03fAhjj0aDbQLh3ZQt
	/EYfhYtckFsofFFlAK28Hn2C/N3RvFsn8tZzZgw6yKv5vrA/hG9xqUYB6Q1pQVCnYV/3
	hL3g==
X-Gm-Message-State: AGRZ1gJ4IqrnT1GzMcmzBiGQcCeaYdXYHPxECgHqu69rph1Owb+gCYVn
	mmO50rRCbNTjVgPBYuesy0ZLVuZE
X-Google-Smtp-Source: AJdET5cfy5zhx9xd/MESTZBVsHA3ZuDYT/8ilnEyegSWK30HrL7cxblA77XjRl8aXdU6fM+sA0f8bA==
X-Received: by 2002:a1c:c2d4:: with SMTP id
	s203-v6mr605722wmf.97.1541606227820; 
	Wed, 07 Nov 2018 07:57:07 -0800 (PST)
Received: from localhost.localdomain (174.red-88-27-107.staticip.rima-tde.net.
	[88.27.107.174]) by smtp.gmail.com with ESMTPSA id
	v10-v6sm1709294wrq.4.2018.11.07.07.57.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Nov 2018 07:57:06 -0800 (PST)
From: Guillermo Amat <deuteros76@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Nov 2018 16:56:01 +0100
Message-Id: <20181107155601.32065-1-deuteros76@gmail.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] Fix header files to compile libgpg-error-native on ppc64le Power8 build machine
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
X-List-Received-Date: Wed, 07 Nov 2018 15:57:07 -0000

Using a ppc64le build machine the following error occurs when compiling libjpg-error-native

cp: cannot stat '/home/ubuntu/Yocto/build-ppc64/tmp/work/ppc64le-linux/libgpg-error-native/1.32-r0/libgpg-error-1.32/src/syscfg/lock-obj-pub.ppc64le-unknown-linux-gnu.h': No such file or directory
---
 meta/recipes-support/libgpg-error/libgpg-error_1.32.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
index 4f3e3d8..1a8c1dc 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
@@ -48,6 +48,8 @@ do_compile_prepend() {
 	  mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
 	  mips*)      TUPLE=mips-unknown-linux-gnu ;;
 	  x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
+          ppc64le) TUPLE=powerpc64le-unknown-linux-gnu ;;
+          ppc64) TUPLE=powerpc64-unknown-linux-gnu ;;
 	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
 	esac
 
-- 
2.7.4


