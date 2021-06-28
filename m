Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web09.12360.1624892821926384653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 08:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Em4go/EL;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id 22so16303558oix.10
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ao6nE+AJlqwYaTbznN/h+p1AKEtYHklxbLnEJ1ibK8A=;
        b=Em4go/ELrIi4oQq5ubojICNqvNVozYs0EYb9t4uAUkRUC1lCFnMaKzeC91RUTGXJT7
         wEeMYHkvD1kwyQX8bsqvGNV9+F2uSXIzSMq88Mt1hj/N5ps7UWStxPy9BAtvJtXXPOjW
         igfBqEFjnkPj6hJZZWu9ssUVYSOH5WECRJATik6L3sEQevDbRU9x8Q68g7OS59OJ3tA2
         DDntX5XjgDkcZTdR3ZMO1Jfo24vD8XQ3RTwR/djiByzo0flWa8vamEhFTFcKeTjKjw3n
         d1hhvwArzCGzVLLx0qfIM3j4+bxDgOxBq/vUFEp/d5LBAQg81eAjWK+oW5sF6F3TYsMv
         jSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ao6nE+AJlqwYaTbznN/h+p1AKEtYHklxbLnEJ1ibK8A=;
        b=XYM38UkBCTpWe0TcFhL5ej0K5ekUW+SC0+PyIqNFcuXePRARgCpQMVN8h8Sn1EOs6J
         0oDghZEbFIApuAyAIPd/AhI2yDpyfQ8g5h+hPu7/a8ZkWW9PdBgj6GgXktfEPksuLlV+
         Y/oShDtwn574X8jxcU2HPZxKJrw5fysM5mA0WSy8maeTCpWo5AinR6kVhlLSpg+x9aa1
         6mBZ+1inngP+Upvf+KZ7aH/xV8k8FDJVOC7ookLRdOxI69rtuLaCKuwH5bc30xseSMGF
         fCj329I4GhltlpDUULKngfpkhZA6yp78legBNjt37QdQ8WjQLAVv9MU1K9OWJNW8VJKJ
         LH1w==
X-Gm-Message-State: AOAM531IqAb2HVbcI8GnQauk6z3YtjILOW281zHi4SkPBUVuStBir8Gm
	r3vUKbsoMHOP557fAcvi1HwPUHTbalUSH9WMxEM=
X-Google-Smtp-Source: ABdhPJxry5YpAF7fxc7ZY0IUe0kutwpXS/ORsrLZauB0hL0ikgT/1W6gUxhOF0Dqw/MQgGTzZ5KeqA==
X-Received: by 2002:aca:d842:: with SMTP id p63mr9990307oig.114.1624892820828;
        Mon, 28 Jun 2021 08:07:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c21sm2095892otp.8.2021.06.28.08.06.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:07:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/14] python3: upgrade 3.8.9 -> 3.8.10
Date: Mon, 28 Jun 2021 05:05:30 -1000
Message-Id: <471d19fa70c4c2b43a039909c9538e2223996335.1624892565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624892565.git.steve@sakoman.com>
References: <cover.1624892565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@intel.com>

Release Date: May 3, 2021

This is the tenth and final regular maintenance release of Python 3.8

Note: The release you're looking at is Python 3.8.10, a bugfix release for the
legacy 3.8 series. Python 3.9 is now the latest feature release series of
Python 3.

FIXME:
AssertionError: Failed ptests:
{'python3': ['test_record_extensions', 'test_build_ext']}

References:
https://www.python.org/downloads/release/python-3810/
https://docs.python.org/release/3.8.10/whatsnew/changelog.html

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3_3.8.9.bb => python3_3.8.10.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.9.bb => python3_3.8.10.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.8.9.bb b/meta/recipes-devtools/python/python3_3.8.10.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.8.9.bb
rename to meta/recipes-devtools/python/python3_3.8.10.bb
index 13d3b8e5b5..91fbc672a1 100644
--- a/meta/recipes-devtools/python/python3_3.8.9.bb
+++ b/meta/recipes-devtools/python/python3_3.8.10.bb
@@ -41,8 +41,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "51b5bbf2ab447e66d15af4883db1c133"
-SRC_URI[sha256sum] = "5e391f3ec45da2954419cab0beaefd8be38895ea5ce33577c3ec14940c4b9572"
+SRC_URI[md5sum] = "d9eee4b20155553830a2025e4dcaa7b3"
+SRC_URI[sha256sum] = "6af24a66093dd840bcccf371d4044a3027e655cf24591ce26e48022bc79219d9"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1

