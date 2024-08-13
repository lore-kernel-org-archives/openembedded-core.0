Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50ED6C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 04:33:50 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.65095.1723523625997961753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 21:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZRvuf9qs;
 spf=pass (domain: konsulko.com, ip: 209.85.215.172, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7a1be7b7bb5so3635196a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 21:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723523624; x=1724128424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLew3JhJjZ7/+Tn/ydM5FkszYGj9xKAxsLY1ukq7qBs=;
        b=ZRvuf9qsLizrNFNEx7pSl+Qwv4nR4uhITKnm9bApUxFS0EGPVkr689cHsxsGxi4nki
         O083E4Q7gMa2vluO8800HerrZM0WSdPlUj011/4LEIObQJPt5KBAzue5xCJ1glKUhyI3
         1S519P8Aals1V1dqp2fGsqdiNW8QV+oGfNP5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723523624; x=1724128424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLew3JhJjZ7/+Tn/ydM5FkszYGj9xKAxsLY1ukq7qBs=;
        b=DRm2yf1W2bara0rf+Xg4J975dvqs4Rs714CAMWrRqRHGqK45nETKnftD1rg96NoS3H
         7leDIhMigosEenOSUNpxqI1cOD/OVXoedq/clmftxh7K94rurLt++t6VJnWsv8e1qn4b
         ChGy8RoKXdErqFIKcyYuBUYBvHzgv3JY8q5gN2CHudPlue9m8hz/o5M7zYMhL+neOkrx
         FIciAish+qaAwkix134rx/O5k91DUoaBQxbROkb21K0dwHiOn+SIpoWIfOI81nEHkOMw
         r7mgQF3ElgTFTHb7zKdDqigAX7w4Tk2x0bgrrZYK4OM/ahKzD+MkiKlUeOBC5sdATXhe
         LgAw==
X-Gm-Message-State: AOJu0YzXKhUd72LgPr+OW1lDPsxX8IZ4uRTXf9OFLtWusg+7vrNfO4I2
	9dSoLpfk+Bve2RV+F6tebi0lJQS7lLh9jvZlN1RuLpkV+B8J4INN2b7WgIGobLrBR6HlHsF3sHJ
	Imr8=
X-Google-Smtp-Source: AGHT+IFeMekrVafYWld2HN3sAsUe34vP5ud51WBkYbaFfrLa3AgJrpet71kCieQUhibYuXics4shlQ==
X-Received: by 2002:a17:902:f545:b0:1fb:8785:d1fa with SMTP id d9443c01a7336-201ca1b1e18mr27565505ad.30.1723523624469;
        Mon, 12 Aug 2024 21:33:44 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd132895sm4621045ad.9.2024.08.12.21.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 21:33:43 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-more-itertools: upgrade 10.3.0 -> 10.4.0
Date: Mon, 12 Aug 2024 21:33:33 -0700
Message-ID: <20240813043332.1170848-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 04:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203245

From: Tim Orling <tim.orling@konsulko.com>

v10.4.0
  * What's Changed
    - Issue 854: sample improvements by @bbayles in #855
    - Issue 858: Use chain and starmap in run_length.decode by @bbayles
	  in #861
    - Issue 859: Update totient recipe by @bbayles in #860
    - Distinct permutations of incomparable items by @JamesParrott in #834
    - Clarify seekable.relative_seek behavior by @bbayles in #863
    - Issue 864: Improve _sample_unweighted by @bbayles in #865
    - Use log1p for _sample_unweighted by @bbayles in #868
    - Issue 862: change relative_seek() behaviour by @dkrikun in #866
    - Issue 876: is_sorted clarifications by @bbayles in #877
    - Issue 870: counts parameter for sample by @bbayles in #875
    - Issue 869: Add a steps argument to circular_shifts by @bbayles in #874
    - Issue 871: Add a fast path for sliding_window by @bbayles in #873
    - type annotation of windowed_complete corrected by @m472 in #881
    - [Docs] Fix strictly_n missing the n parameter by @fakuivan in #886
    - Standardize type hints for isinstance's second argument by @jbosboom
	  in #887
    - Issue 883: change type hint by @akisatoon1 in #884
    - Add type overloads for zip_broadcast by @Pandede in #888
    - Issue 889: Optimize triplewise by @bbayles in #891
    - Add option strict to sort_together by @Pandede in #892
    - Updates for version 10.4.0 by @bbayles in #893

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ore-itertools_10.3.0.bb => python3-more-itertools_10.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.3.0.bb => python3-more-itertools_10.4.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.3.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.4.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-more-itertools_10.3.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.4.0.bb
index c2c9e89a649..6451e3e23c0 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.3.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "e5d93ef411224fbcef366a6e8ddc4c5781bc6359d43412a65dd5964e46111463"
+SRC_URI[sha256sum] = "fe0e63c4ab068eac62410ab05cccca2dc71ec44ba8ef29916a0090df061cf923"
 
 inherit pypi python_flit_core ptest
 
-- 
2.46.0


