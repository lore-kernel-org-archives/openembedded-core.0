Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2DA7F8B9
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:00 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id z124so10021430pgb.13
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BMPZVc95Hy5qcdnvbjhVvd8DZeiSO13+9ZuOS4uaAFw=;
	b=bJDkMVOpugD6vUhze1l91BkY0qlpEXyqLblKiyiKSLT7LnOa2ZLdD6AoG9pwIkxO3o
	ynYnCVZuZiEboGplwnoUg3D9laIIHcVCdPcXMi0oFQxKfOVzmgn2yOi0wdGf9F05WrdH
	zd3JqtU668UEMwXNYWfaFAFzTkH/NjYmTBWdosGAV0F6CBZB6ZzzUSThdl9rLVHp6zdt
	YD2ZSPoJI4Po86O7AXeh0hS4yN6ow15DLUQWWhYRL6ynksITAfv7TfCj8LI05U81v6te
	WQdkVwXbPmxBVuItgpG7RXILManS29hYeAZDDI/FB9CCW8X+BcODHocap4dHCiwcn7Bw
	H4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BMPZVc95Hy5qcdnvbjhVvd8DZeiSO13+9ZuOS4uaAFw=;
	b=JFU0wn5CS5UuStjSxircvXKVpBbuhuYKBfUsTtwkG2U0kVaXJOQpNB7j53sOrVIICb
	+pffN3edbZ5/yHrZxAiwtd/TahD6G0zqirGPh4pZl5sPxKvzQ5w32hiquAy+J5s0+9OS
	YXlPfdkq53nZaXpVvCNzxqR8VHF+m2H/29NwRxC3MIttnvXzL4Vw1CBYyy1VBLypcAPU
	Z2OfxL8uVHxdH749DqcuJ6nuc7q66xP9CyDTwDqFiO4GYFYZ44thLhUE2fWlWxi/d+8i
	TgX1VpDcn6WU1Oq1RoB+RQA5tPbOurd4kikP04xxWawUDCalgzd8KSMkMkpWiF/ohvbV
	uojQ==
X-Gm-Message-State: APjAAAVQ2/AcmifF7HlWQYUEwv6fwm9H3QHZFivt2NSrNV2rKhf1bj4V
	fjcqPvgR793B38njvCGpeYHoQrHV
X-Google-Smtp-Source: APXvYqyzDxVW7j4Z4H1qVwGG95Ah22T9OyDaZLyWdi1vkN44/tpNj0sXrxplKBu0UqX3RbiZ9yPKFA==
X-Received: by 2002:a63:364f:: with SMTP id d76mr40742969pga.215.1579188061538;
	Thu, 16 Jan 2020 07:21:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.00
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:26 -0800
Message-Id: <7b8f6388e0a1e1eab35918a3764e98553a2452f4.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 17/32] sdk: Install nativesdk locales for all TCLIBC variants
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:00 -0000

From: Khem Raj <raj.khem@gmail.com>

install_locales() here is actually operating on nativesdk and only glibc
is the default library for nativesdk, since thats what most of
desktop/server distros use, therefore bailing out based on TCLIBC is not
needed here, since nativesdk-glibc would be required for all non-glibc
targetting SDKs as well.

Fixes SDK install time error

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
Following is the list of potential problems / advisories:
Your system needs to support the en_US.UTF-8 locale.
ERROR: SDK preparation failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/sdk.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index b4fbdb799e..d02a274812 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -88,10 +88,6 @@ class Sdk(object, metaclass=ABCMeta):
             bb.warn("cannot remove SDK dir: %s" % path)
 
     def install_locales(self, pm):
-        # This is only relevant for glibc
-        if self.d.getVar("TCLIBC") != "glibc":
-            return
-
         linguas = self.d.getVar("SDKIMAGE_LINGUAS")
         if linguas:
             import fnmatch
-- 
2.17.1


