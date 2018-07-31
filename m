Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8A493744AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 21:52:49 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id s9-v6so4671221wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 14:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=k2aTbD7XCvVk82ZpzquRpcqUctlSBnNGto9AhPqS1jg=;
	b=FM15dxZoaFWbX8pO1iVHJbRqNL2AOArYP5JrRNEJsniRwcVyPaJh5s9BDREwpctamI
	hULtDf6hqHVvN+THz+GlSrf1LcuFzoDi/vX6y9HiWZoYBO0nwQ5rEqvoVTF8EKzpNlKC
	3lrWiMaUJNDF2VhBNUQ6uIcg4phGdMi70SIsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=k2aTbD7XCvVk82ZpzquRpcqUctlSBnNGto9AhPqS1jg=;
	b=cdVYszXCw182kZuuBPj+7zpIgV4iwW2Z/CN8nWGTNwhlPeNFE/MGrQTxLPYu7OD6+Z
	3Iv48HqjopqEHu1TEv0udTopD3ggYGZp9KR9i9VtN9dn/z98ZGWwx9VapbEWgwA48GXj
	O37xWhzQAOt8QE49U7NqMwZHIG+C8IcnbgocJWXf7Ua472934fJhYcqM3BBpfdtZQVbk
	Fyfg5qlj1FDtc/jhv0ESpQNga4uQUbvpLox5QUfmPMTxN9mOfKcWQv/1OA4+JT3BGM5X
	X2K9DAd28tDow2olpurCYCK8pzU85phZnidXTrNRzNuaPZHGglWJVFZkywOqwE0XyBF+
	zqgw==
X-Gm-Message-State: AOUpUlGkss7iZl1FS70SzEDGjLSSwXJ9GX0UIH24CJgB9nG2xHbJ5beO
	c3yxTltp6+0i4f+zz1tPubI0z5o37Tqc5Q==
X-Google-Smtp-Source: AAOMgpdZAnKkVmn5oGu64iUIHp7sMmSC/xh1pnPKZXaP8RGRmcKAhlVosBAZjWgdE8bqabOy8jC5sw==
X-Received: by 2002:a1c:3411:: with SMTP id b17-v6mr851456wma.85.1533073969890;
	Tue, 31 Jul 2018 14:52:49 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j6-v6sm12711948wro.13.2018.07.31.14.52.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Jul 2018 14:52:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 22:52:43 +0100
Message-Id: <20180731215243.12440-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] util-linux: Enable fallocate for native/nativesdk
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
X-List-Received-Date: Tue, 31 Jul 2018 21:52:49 -0000

fallocate was disabled for native/nativesdk in:

http://git.openembedded.org/openembedded-core/commit/?id=17f3c548caf4adec37c3bbb139aa6b3900419794

We have since added uninative support and better glibc handling for SDKs
so this difference can be dropped now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/util-linux/util-linux.inc     | 3 +--
 meta/recipes-core/util-linux/util-linux_2.32.bb | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 9ac8bd6f798..9d52ed935f5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -207,8 +207,7 @@ ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
 ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall unshare"
-ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin taskset"
-ALTERNATIVE_${PN}_append_class-target = " fallocate"
+ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin taskset fallocate"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
diff --git a/meta/recipes-core/util-linux/util-linux_2.32.bb b/meta/recipes-core/util-linux/util-linux_2.32.bb
index 55cc98c2002..4af7f873b93 100644
--- a/meta/recipes-core/util-linux/util-linux_2.32.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.32.bb
@@ -21,10 +21,8 @@ SRC_URI[sha256sum] = "6c7397abc764e32e8159c2e96042874a190303e77adceb4ac5bd502a27
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
 EXTRA_OECONF_class-native = "${SHARED_EXTRA_OECONF} \
-                             --disable-fallocate \
 			     --disable-use-tty-group \
 "
 EXTRA_OECONF_class-nativesdk = "${SHARED_EXTRA_OECONF} \
-                                --disable-fallocate \
 				--disable-use-tty-group \
 "
-- 
2.17.1


