Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 230EB719AE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 14:16:36 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 197so25910909wmk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 07:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=P1EgsE1+fu9qo4Ibi2us7ZzoJ/twWcTkm0ue2cn+xTw=;
	b=NeITKv7GbzPZWljGZE88RNfsBkVYKthRDEgiwCEuCcD0+KpMXkgeFMP726SYmIcgu0
	wOqz4jFToXSo6dUmMFzRfrwOfdJQCcjY8xTS/8+7/7zdeC80dPHgavEAenVOpFX1rnXH
	/iTurb9lCjQinVpho9XJimlq6yCNNIRyGOawqp7DlLAI85ImmBv7wIk8OuZN7RmTvssH
	q8gLNRXB0pGt7Nmq8gZdmLxzoxxtN7bhlZk5d4pglYXFPKgQ6nbm6kLVSBTRJuFaOgKd
	6kKKGUzT7Re5zw/Lmo4LxZJRgUycepQ+QdyshjL73wX2XArR3PisFeUtaTcWP1Tdcgwx
	5eFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=P1EgsE1+fu9qo4Ibi2us7ZzoJ/twWcTkm0ue2cn+xTw=;
	b=bd6fDgoBRE8y+h78tKl3BThWy2sBks55JaxtKI5iLB0pBuyJyBf2CV1VgU1u0mhn/m
	PB3h4zrUMLU9b4Lku8Uqp+7FQvO9tSbAdP7i/GP6GqJRyQwqhXwk+a7UX2h4TbwzfRNV
	HVfsefP9wCA1ish57cakMOdEt6IIggiCMjd8lakyt5KZzbKMPeWjhfxQvGF/SYnyG+DB
	o5+3m/kZgl92gJkPSXExHT88Fk8DWqEbIKYSXGGT5NDDoX/ksWeJZhcvAFaw7jPPxFpb
	wrUERgQYtTmBKE3ajZCydIO/lTRyB81iOMk7PJWfUJvRtIS0Sc++NU/Ga6zu6/AMbA1U
	pU1A==
X-Gm-Message-State: AA6/9RmtAHLt/0xqk49r8bH4BLzdKtfHBvc08/uNJe/xsky9uMkSNrLjAlWYuy2mj5BEHBun
X-Received: by 10.28.232.84 with SMTP id f81mr11250455wmh.39.1475504197206;
	Mon, 03 Oct 2016 07:16:37 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	yt4sm34606312wjc.48.2016.10.03.07.16.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Oct 2016 07:16:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 15:16:31 +0100
Message-Id: <1475504192-17738-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1475504192-17738-1-git-send-email-ross.burton@intel.com>
References: <1475504192-17738-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] binutils: fix typo in libtool patch
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
X-List-Received-Date: Mon, 03 Oct 2016 14:16:37 -0000

There was a clear typo in a function name, correct it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
index f2411c4..f0fdf46 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
@@ -16352,7 +16352,7 @@ index 9503ec8..70e856e 100644
  	      case "$perm_rpath " in
  	      *" $libdir "*) ;;
 -	      *) perm_rpath="$perm_rpath $libdir" ;;
-+	      *) func_apped perm_rpath " $libdir" ;;
++	      *) func_append perm_rpath " $libdir" ;;
  	      esac
  	    fi
  	  done
@@ -21175,4 +21175,3 @@ index bba9fd2..25a2dae 100755
  
 -- 
 2.9.0
-
-- 
2.8.1


