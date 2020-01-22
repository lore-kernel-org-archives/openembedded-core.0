Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id F1A0A91436
	for <openembedded-core@openembedded.org>;
	Wed, 22 Jan 2020 05:48:19 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id ay11so2474913plb.0
	for <openembedded-core@openembedded.org>;
	Tue, 21 Jan 2020 21:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=y/3KXMxDz25N3o+xXUPPFWtsrODajH0HiYbIlzT0ro0=;
	b=IWSs0Fwba723xAGzucbZbTNdNDuQsQ6w/00Gin6N6Q2V69UgH0RDmgCkQqFLB9vX2p
	4grbXpyUZJPkb0jbZRh1ADTB1S+Ai1UwjodloaLv7lust3j6kDhLsJEmN73MDUllGKg8
	afrTbetSrYeya49AOphLjvOVPoxgAyLE0FtTd9oHVmDEqBDoC4gwM0Snd9Q6Xm5t0Gb9
	OihO/pWy4yxoz1x++75/0Cp18kb2XVLqcMCUq8UQul6SVy/wH3Lyy73K4vv+Cy3lWsJu
	uJkqNTofYyobZnkHIXGbxk/TIM8Dn8m9p8yM9QWyaKBOlMoXD/LE3oeFhP40mYt1pupG
	VGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=y/3KXMxDz25N3o+xXUPPFWtsrODajH0HiYbIlzT0ro0=;
	b=mWwCgCORIvcsZWTT3LkKcg5q9joTOo88tW8ESyG3lcJPRwDlq1zFSKIgmkcfHqN58T
	U/jrK6tkzgmrCaQ4Cyv9u0fa6VxWRu4uL2jTMjGVJV+7p3lvk2MAstAIpRQbz4SkPS8v
	TI/ttA/3hlXmEtZQF/DAkvTnrm5pH4kxWoKRMzQKc6yzDcEhIBSdLbdjQQURfjfX9G0h
	sMQ19+Si9AoLewSkko/2pS8zIrJE2eGzpX0iWG7fj96ckVS450D1dKu9sn2hYnQOkkJ3
	UjX/c8kFhZK4JQie+q5qlphr/SNEydm45be6W23mDK94uDBdpfDPGx2wxktLlt1cMrZ6
	9GCA==
X-Gm-Message-State: APjAAAUXUKqR6j1PTzgi6o41woa6hWy40iSbRdGiVzZWqhXFhDBI5LWk
	W9Rc6kvzXh5yr3cDabUAX0rtva7W
X-Google-Smtp-Source: APXvYqxsh+36gjqxkcUnX5xqRWHHTUDHufDFjPzBN7K4qrbg0OdG3tLFX6ssivkAuvnqLlrGYW/0dg==
X-Received: by 2002:a17:90a:2808:: with SMTP id
	e8mr1098029pjd.63.1579672100952; 
	Tue, 21 Jan 2020 21:48:20 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id p18sm1413247pjo.3.2020.01.21.21.48.20
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 21:48:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 21 Jan 2020 21:48:07 -0800
Message-Id: <f0ea8b49a183d9340aaf0c60ee959aa8ec3c041c.1579672034.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579672034.git.akuster808@gmail.com>
References: <cover.1579672034.git.akuster808@gmail.com>
Subject: [zeus 02/11] populate_sdk_ext.bbclass: No longer needed to clean away conf/sanity_info
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
X-List-Received-Date: Wed, 22 Jan 2020 05:48:20 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Since the sanity_info file has moved from the conf directory to the
cache directory, there is no longer any need to clean it away
explicitly in clean_esdk_builddir() since the whole cache directory is
already cleaned away anyway.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 40c30990e1be72130819c040fe471e2bdc0c6e7d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9fda1c9e78..5657af4b6a 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -122,7 +122,7 @@ SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME') or d.getVar('DISTR
 def clean_esdk_builddir(d, sdkbasepath):
     """Clean up traces of the fake build for create_filtered_tasklist()"""
     import shutil
-    cleanpaths = 'cache conf/sanity_info tmp'.split()
+    cleanpaths = ['cache', 'tmp']
     for pth in cleanpaths:
         fullpth = os.path.join(sdkbasepath, pth)
         if os.path.isdir(fullpth):
-- 
2.17.1


