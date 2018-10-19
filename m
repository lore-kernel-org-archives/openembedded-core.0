Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 92E6279BFC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 17:34:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id i8-v6so4367696wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 10:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=VRdUr2wHi9eu/um3NZmcc+eBFsRQGYwkkxRQ6F4uESw=;
	b=h8hOOSrMkGfbJn0fhUs+BlEICN9YcEp2VVQ/cEn4Y1CG/DJziQDPZWxboDWiKSGnSl
	DlA8T5BWppmGGFafaUPwy6Uizh0bOUpv6Re/5jPwQsQ+w6quTOxgfCW/bQA+lXOnNev6
	LdfzE42ilbssoT0zC8JdWnDzA93aQrldUqgqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VRdUr2wHi9eu/um3NZmcc+eBFsRQGYwkkxRQ6F4uESw=;
	b=geWp04txfGMFFZo8I3CKZBBKssnBZgISu39VfWsAE3dFIUYRPxLzeJxgqlCm/EYECU
	ocqNShrOy1PtBCENVvlcJI9NI8Vis9ijgVGpv0mmRmB21Hz8EzwMXUPjCH4IpTp9txTe
	mIwXg7rtm7PlTeI122DPi8xo1actLwdaf8wIYPr4MNQ2UuaQK7j0hx88P0dsjMlGGCh5
	7XX1mF4NdjQo2LmmtfBQute/Pgc/GdOI++R+stA9CYG67jzSO23XByGln2JE+tnWvwYD
	jc+ck9ePu3hlIMXFW+tGraBk3QiCFXDC16kX3cWKBhcrldpMIcp7FDSEdCJyl/BvqYqz
	sKmw==
X-Gm-Message-State: ABuFfohLGD9HdfGmPOEh2HD5TsUB0CJFxB09rTyOPqvhUtM42kMdRmYR
	jjSczm5MMU1XAP+mVkUs0VHn4tosQn8=
X-Google-Smtp-Source: ACcGV61AqD6c9hFCr9/JEfvTF95QTjuPdpUxxj1YHU233EeCyvYLKBDBZEjvCWWNJje0ofK6T6AMIQ==
X-Received: by 2002:a1c:9ca:: with SMTP id 193-v6mr6031970wmj.86.1539970487666;
	Fri, 19 Oct 2018 10:34:47 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m16-v6sm4732138wmd.35.2018.10.19.10.34.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Oct 2018 10:34:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2018 18:34:44 +0100
Message-Id: <20181019173444.21882-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] image_types: Fix a shell syntax error in do_image_ubi
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
X-List-Received-Date: Fri, 19 Oct 2018 17:34:48 -0000

| DEBUG: Executing shell function do_image_ubi
| /home/pokybuild/yocto-worker/nightly-oe-selftest/build/build-st-31289/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/run.do_image_ubi.7928: 123: [: missing ]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 00a00d318f4..05e5b0a2e0c 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -154,7 +154,7 @@ multiubi_mkfs() {
 	local ubinize_args="$2"
     
         # Added prompt error message for ubi and ubifs image creation.
-        if [ -z "$mkubifs_args"] || [ -z "$ubinize_args" ]; then
+        if [ -z "$mkubifs_args" ] || [ -z "$ubinize_args" ]; then
             bbfatal "MKUBIFS_ARGS and UBINIZE_ARGS have to be set, see http://www.linux-mtd.infradead.org/faq/ubifs.html for details"
         fi
     
-- 
2.17.1


