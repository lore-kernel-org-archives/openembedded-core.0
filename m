Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.1510.1588648837619827341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nB3HVHhH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id b6so216505plz.13
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CVjmVrvHzd7Key4tPY6Rw01unnww/Otm6w8QyifIxdc=;
        b=nB3HVHhHphGgMtYQBkhNyr+CT9RHZUHT5+RPMlNiFaUaitT8isVipDlmCODALQGTd+
         EC+rcQCZkVd/SjzJWnQ1Iruq2a2oHFK8N7UGGACHJr7KQO9pq0ipXzAB8OoxK/95+zBx
         HiLqjQch8ioXrwvoAAkbaiYOuILpO5AVkJq6JAsczT8Wlr2Gim74Dpqp5CI9ENKPuDMz
         GvncNHk+ttHaXd2eQWhSQJ1dTokEamU1TQa2aEA/8bf8lQ7K7jVf6BF7Qt2LVWf+cm/V
         gK6KHT16bb3Jaq+/ivSlvDNTTlgBHD0Qqbg20GkCK+Lk5t3GQhqGid3Xd3t5YaIhf01C
         f8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CVjmVrvHzd7Key4tPY6Rw01unnww/Otm6w8QyifIxdc=;
        b=pH2S6RAgNuCV14sEuTxETmgw2UktsgCaPJt0vZ0E6kDuiZUsahUmNZPIdAQCfSQWL6
         28STf7F/l0eJQ0xw+KRqJkN/fv2oPd2z532Dlw0PSJzH/qxqIbh3HlSfQt8ueKLdSWEG
         sm9YByt/nNb5sM3NJhC8EJq4MCOZ8hrtB34eSxwOZVYDJZfuaTecA9odGPeZ8xFcJQ4g
         5TGYhumQXdUpzSBcD9CoybxL1S1BPOpdXhn0wu3Slifmh7CsmLiuhJjaQBCq9USAhTEe
         91j9j5mVcncR1rXraeQt0wiITRPD3XwhVa708LDCwsSL8zglqp044QFY8lOhSfqoPc8v
         UQ2A==
X-Gm-Message-State: AGi0PuY9YQ9f51JyEVGwTXtFvNftKBXvwV0bKG5uPdNqTgJFXSpWRxJA
	W1VlxmoNWQC9RjxwT30EZ4swXPUTH2z4/Q==
X-Google-Smtp-Source: APiQypKmB8Y2XDZWCfXvjJ/KIn31iCNNyjZ9Ams33iUZK8DmlNI9qCqiShp0UdKzMa/P8c1TqQHcRA==
X-Received: by 2002:a17:90a:20a8:: with SMTP id f37mr402312pjg.148.1588648836695;
        Mon, 04 May 2020 20:20:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/28] perl: Add missing dependency for tie-hash on carp.
Date: Mon,  4 May 2020 17:19:08 -1000
Message-Id: <3d633f20a98edff434086aa59e8157990bd62f25.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Drew Moseley <drew.moseley@northern.tech>

Signed-off-by: Drew Moseley <drew.moseley@northern.tech>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/files/perl-rdepends.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/files/perl-rdepends.txt b/meta/recipes-devtools/perl/files/perl-rdepends.txt
index 331a44d308..9ecfce0011 100644
--- a/meta/recipes-devtools/perl/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl/files/perl-rdepends.txt
@@ -2218,6 +2218,7 @@ RDEPENDS_perl-module-tie-handle += "perl-module-warnings-register"
 RDEPENDS_perl-module-tie-hash-namedcapture += "perl-module-strict"
 RDEPENDS_perl-module-tie-hash-namedcapture += "perl-module-xsloader"
 RDEPENDS_perl-module-tie-hash += "perl-module-warnings-register"
+RDEPENDS_perl-module-tie-hash += "perl-module-carp"
 RDEPENDS_perl-module-tie-memoize += "perl-module-strict"
 RDEPENDS_perl-module-tie-memoize += "perl-module-tie-hash"
 RDEPENDS_perl-module-tie-refhash += "perl-module-config"
-- 
2.17.1

