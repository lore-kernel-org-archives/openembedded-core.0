Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2240D103A989
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:19:29 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13954.1774405162868071838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IGEk6rk9;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82ae378fff8so3405162b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405162; x=1775009962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BqEdz+dgudZXFpeQgeTNYNMHv53hFATffZNbu1LziU=;
        b=IGEk6rk9bhfq6f35k9fVBXhf1NROnbpwLRpoW17prYRBzqkNH8vZQoBTmNtpYJj3BQ
         T3LAh9friqn4rCaSTuQ4QtLQpNa8E414qV5v3jYdbfBpf2mkAO1GuYRVnLIKkTrmjlcy
         FdjXIwSSdCh3s2UVf/sT3e326LaR59L++utfUloLO7Dj0IulKIxWqjPFbVR0T8lcXomz
         3DyYoy/RXMuCCbJUISsx9a/HvBHW4i1cT050MWOIbX+7TLc+eQ3+VZ6q4Z5JOuJdfu8K
         dEIo36opWHuiVrqfmSyqFCTKwathfYBg0FaGHmw5PtXBo14mVY5ufkvCwXLyA6PB41hK
         0gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405162; x=1775009962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7BqEdz+dgudZXFpeQgeTNYNMHv53hFATffZNbu1LziU=;
        b=pNhLJl6VZAJqDkPfBJA609UKtG/AxIhTe3uuCmsH4iitD81d+L41jjnrk1WQD54Zeb
         +pJFSA6xbK3TS+mR2PPdwJqWJGykqeOiKjqFemBZleZLxhwp8w3tzGM18hQ8WBvuvX6+
         r36P8JPp6vecXVdUfT5egjyZA/McDossivUo83seKHkulASm9aYNNvwsChKOhZJg2+6+
         2pRVLGOO9vwG8k907dEUI9ce2rCIzlkAL4xepAVpvP/HPIrPaWHfJtuY6mvjlQGbmDo/
         OUVrPpxETG29WRf9srq4k/nRJb3o1cwDBtNeM8aa166mPqo/Z/kyd6LkePblzBOFqetS
         26rg==
X-Gm-Message-State: AOJu0Yz1kHk8Yi73jlRZtDk+2dMRAG6ra3R30+ZJ+PhWlB2ELrU2Gk0W
	9xYL9/41ocLS3DxjpI9jZKgJa4t56oubJrKv1hmkTSG6Q+rVI7XiQlj8djHEZ/VH
X-Gm-Gg: ATEYQzzInlKU6feB+kPfO4s8Bqyg5VDxVJ3pl8jX47Q8vSkyHf7fWtr8CUH21DpTgzq
	8fuvUPlAu9hmXbJQ232IAPfyWdPMQxYTAeDCyd6ZeneU8kFDMFQ6G/G5uAZmfnRA3HjsG2LwATt
	/yUmbJBO3vwb90cnpzc6zJ5wLz/cBit+gr0wuI3K9CPp9fo+fVXK6XO3aHwbnT24tAH8vmzD/R0
	qyZkpxq+uWD9rxuzd6ekKcvdEvCSOII8o4xFRmbbadmfIHZ/VL+WQEmBZlzOPwZ5xQsmu2w/Mw4
	JBZis0mUD3pkUqI+MqyzdeO9tbtiudbWsC8+It9qyFbvrVWjl7CoquB2nSZdHwdKS2ncpW5S9cr
	cwDPqYi2l+pHo2vURobs0cqjI9H6ILAvofp8Kmqkt334lMZb/UHUqfemlqD38kXO/psedAzfVPG
	VpPdkZELD/iaeuFQzq8xT5qG0DVvItjXX52Bg=
X-Received: by 2002:a05:6a00:2d95:b0:829:86aa:e163 with SMTP id d2e1a72fcca58-82c6de828damr1821592b3a.13.1774405161991;
        Tue, 24 Mar 2026 19:19:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm13581235b3a.31.2026.03.24.19.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:19:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 02/12] libsoup: upgrade 3.6.5 -> 3.6.6
Date: Wed, 25 Mar 2026 15:18:46 +1300
Message-ID: <20260325021856.4053666-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233840

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* websocket: Fix out-of-bounds read in process_frame
* Check nulls returned by soup_date_time_new_from_http_string()
* Numerous fixes to handling of Range headers
* server: close the connection after responsing a request containing Content-Length and Transfer-Encoding
* Use CRLF as line boundary when parsing chunked enconding data
* websocket: do not accept messages frames after closing due to an error
* Sanitize filename of content disposition header values
* Always validate the headers value when coming from untrusted source
* uri-utils: do host validation when checking if a GUri is valid
* multipart: check length of bytes read soup_filter_input_stream_read_until()
* message-headers: Reject duplicate Host headers
* server: null-check soup_date_time_to_string()
* auth-digest: fix crash in soup_auth_digest_get_protection_space()
* session: fix 'heap-use-after-free' caused by 'finishing' queue item twice
* cookies: Avoid expires attribute if date is invalid
* http1: Set EOF flag once content-length bytes have been read
* date-utils: Add value checks for date/time parsing
* multipart: Fix multiple boundry limits
* Fixed multiple possible memory leaks
* message-headers: Correct merge of ranges
* body-input-stream: Correct chunked trailers end detection
* server-http2: Correctly validate URIs
* multipart: Fix read out of buffer bounds under soup_multipart_new_from_message()
* headers: Ensure Request-Line comprises entire first line
* tests: Fix MSVC build error
* Fix possible deadlock on init from gmodule usage
* Add Cornish translation
* Update Turkish translation
* Update Uighur translation
* Update Romanian translation
* Add Uzbek (Latin) translation
* Add Kazakh translation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b6fb8f26a26a28a13f64c4c31003b2d0bf1061a2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libsoup/{libsoup_3.6.5.bb => libsoup_3.6.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.6.5.bb => libsoup_3.6.6.bb} (95%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
similarity index 95%
rename from meta/recipes-support/libsoup/libsoup_3.6.5.bb
rename to meta/recipes-support/libsoup/libsoup_3.6.6.bb
index 549bbb7981..f9dd5311a4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 
-SRC_URI[archive.sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
+SRC_URI[archive.sha256sum] = "51ed0ae06f9d5a40f401ff459e2e5f652f9a510b7730e1359ee66d14d4872740"
 
 PROVIDES = "libsoup-3.0"
 

