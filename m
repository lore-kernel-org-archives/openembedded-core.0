Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912DCC4167B
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:10 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.13276.1668953763939044230
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qACEeU2T;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id v28so9099085pfi.12
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryohtewRbXNR8Vd2UA0PLD1Vj/aMs1XgqdBj0RwaLpA=;
        b=qACEeU2To4qM3FXGpur9BS+2vBTqtMQXBDTiiOhwKWkpOneaaouBHkSIgLzjoKB1zu
         9Lr4prB7IhrQHDgFNMV2T4RktYPV0mqnpANoXEET99HchDu1tei1IsCpcr68sII19ADd
         zKw/8he1D0GBfvDaafTAFhDMAgQKillyeeAezpKctiROBNhfCvNRVnm6U+XErstbEVSY
         7lwWcWZqqNaJZUKCbqRY41O695l1RZQj2HSyvOj/76LK9KFswQsj68+Gg+W85QjOHVj3
         q5L9xgd6sh+Wt5T/HUC/Ojrum+EpM+kajucaAhQueWnhHRTvvpYlBlgz5li2/bk+8H21
         +43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryohtewRbXNR8Vd2UA0PLD1Vj/aMs1XgqdBj0RwaLpA=;
        b=FELl0EEoEC/mJ4sDMBZe3j1+2BiqVbPMlqTgag3WLm76IPxbBWLvn+wykN4C46CbGF
         6vvfIOViC4QtSxJBaDf5TpzKv5l7wWwe1C4HPRIgIzJniH3DFFgZz8NuqdOl/Xd43uv9
         87r8N29ChddlcN48NlaAQoYD664IB9mQVlPL2ATO+ngWHwN86PvuyCe3Y68+hF1qMTyP
         KB1mx6GXVUT7cvXg0DdELUwxfgXVO7WJhqYya68DaDdw5L9VJd3h2CVAH5/mawR6bjFE
         S8Rv7CzvIXpmWZhVmZK0qWtTeeOdRdCFzXZenfQnpf50y8TEc+uBTFJ5JGKX+ObkUegm
         b4HA==
X-Gm-Message-State: ANoB5pmtR7WJd1jmiQcE9EzCa8slQ/fNJ3Hv7pB5Yagd4IE8OyYQFm75
	l7pUDwj2XTikHS/XjaaF4zXPXmaJWwuHLSWx5M8=
X-Google-Smtp-Source: AA0mqf5sK1B+ksfsX1HrG67OwbJi5UocZrO0kIkzu7H4y8WUFNNAqVD83KrmTF4uOC4IgFohDUrl2A==
X-Received: by 2002:a05:6a00:27ab:b0:56c:71a4:efe with SMTP id bd43-20020a056a0027ab00b0056c71a40efemr16236616pfb.84.1668953762821;
        Sun, 20 Nov 2022 06:16:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/35] oeqa/selftest/lic_checksum: Cleanup changes to emptytest include
Date: Sun, 20 Nov 2022 04:15:03 -1000
Message-Id: <63f4da1f46d4fdf0c244f0e52028087657fea7d4.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173614

From: Nathan Rossi <nathan.rossi@digi.com>

Config written to the emptytest include file is invalid after the test
has cleaned up its temporary directories resulting in the emptytest
recipe potentially having invalid content when parsed by successive
bitbake runs.

This presents the following error in tests after lic_checksum execution,
e.g. 'oe-selftest -r lic_checksum recipetool'

  ERROR: .../emptytest.bb: Unable to get checksum for emptytest SRC_URI entry tmpn_nyosnq: file could not be found

Remove the recipe include content once the bitbake runs are completed in
each lic_checksum test case.

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 087df767a64b271b503d714df3df6d8b3caad1c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/lic_checksum.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
index 8f1226e6a5..bc0a2b5d8e 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
 SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
 """ % (urllib.parse.quote(lic_path), urllib.parse.quote(lic_path)))
         result = bitbake(bitbake_cmd)
+        self.delete_recipeinc('emptytest')
 
 
     # Verify that changing a license file that has an absolute path causes
@@ -51,5 +52,6 @@ SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
             f.write("data")
 
         result = bitbake(bitbake_cmd, ignore_status=True)
+        self.delete_recipeinc('emptytest')
         if error_msg not in result.output:
             raise AssertionError(result.output)
-- 
2.25.1


