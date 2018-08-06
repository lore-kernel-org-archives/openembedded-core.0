Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7076025E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 16:20:09 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id s198-v6so23177085oih.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 09:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nRrGhk/QJiZg37jmo7FWnqSV8dYvwYyZTutnPL7UhNo=;
	b=suPeRukPtwCa48kzVLhgjuMPNJDdGA69Ce7DzLVSSLH2sLQePKCTOSm3ecbjVMgIwl
	gCKG2QMRTRZle/9nPfzJw6OvyGzP9f73E+NM59czRpxEO/+j5b55JPkZwHEN9KpoitDW
	fXzCGEK8OXUslUeinim6gm0qMT+VR+xn9sRtYx8bgX0uLzHvTWRhDpboM0WXm7U6WfDZ
	sRdhCBU5qcHQHCOe/wIGE5oolVltUoQ5X6kjgc70TuJkwUy20ugTHxUAEDXQWInwy8G6
	5Y10nvQtpIebEGv73WWy12TUXM1wMPvbnvTdeb9sSvIsa+D1hKK7f63hhcN/yb1NLfAZ
	j+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nRrGhk/QJiZg37jmo7FWnqSV8dYvwYyZTutnPL7UhNo=;
	b=sM53VC2dvKBAxrlNnI3DJ64aAlBD4oFGyrJsxbAhVl0XGKR5XKtYIQGhahNwoBhKej
	VlYdbawogiNpze6bjy6+jr3nrJUBt8pPxDtB8O3Tqe0x1rRg7OXLjEx2FB5rDtI0vP58
	FauawU0iv63Xg/QD1Hrwl92SL5cdIes/XFd6Tg/vEgT5dWOqNDWeqhVH0i0S0nS1t1KH
	YtPMOx+wHNjWr3lXw5LdpOm0jzYNiZW6Xn9rhyivcbomQPwl2LAjq1rcobTKpkt8X+Tx
	fg+09q2rzUStU1RPIqtUr+K/b5od42440AgJS4WF6e+fQmXwQsaVluLmcP6qxqLum9Hl
	O3fg==
X-Gm-Message-State: AOUpUlEZ0BTHbpBl5XcfWA2qMVs+YtCgwdzV/s35SuMaBJu2ZKWTzS1U
	O5lXKj8bK/5KM/+CUt8wwNw=
X-Google-Smtp-Source: AAOMgpfADlE/mK6FRG/CqCUFTZJbMuWKMT7zlpUZvGrDdo3eM8FtOnXgyV2JDTFbEtaI2tYufWKiIQ==
X-Received: by 2002:aca:3546:: with SMTP id
	c67-v6mr16088033oia.249.1533572410739; 
	Mon, 06 Aug 2018 09:20:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	p132-v6sm11896374oia.31.2018.08.06.09.20.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 09:20:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 09:20:01 -0700
Message-Id: <1533572407-3066-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
References: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/8] yocto-uninative: Upgrade to version 2.2
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
X-List-Received-Date: Mon, 06 Aug 2018 16:20:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This version adds nativesdk-libnss-nis to resolve glibc symbol issues

We need this to avoid symbol mismatch issues for binaries that use this
on newer systems which then won't run on older ones where it isn't present.

(From OE-Core rev: 98c7ab9cf32765d604c35dc69bc7bd90e94fc8f3)

(From OE-Core rev: 026408c9d90e6241ce1b3d4cadefc48b7aba1734)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index dcd59f8..38080c6 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,6 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.27"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.1/"
-UNINATIVE_CHECKSUM[i686] ?= "a90db17d8845ece764aaac19348cd78504c0e554cb998da39ebad03aeef76185"
-UNINATIVE_CHECKSUM[x86_64] ?= "d43555df8d5a056ef5b20c7d8e0287207974e09df1e969a3e19302c8b4ea6b4b"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.2/"
+UNINATIVE_CHECKSUM[i686] ?= "036b60092fe4acfa1a321d110673030db20344a2d56f33a4d047f0279498bdad"
+UNINATIVE_CHECKSUM[x86_64] ?= "e3b77208169bf1ac4e89496f3cdbf27695f5b18a2694a908a793390f28b67f83"
+
-- 
2.7.4


