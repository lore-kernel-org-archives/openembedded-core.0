Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C49C55171
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:56:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22814.1785675377322723125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KRkIKTW2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4955de8797cso6805415e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 05:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785675375; x=1786280175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ETfs/c6iWnkEc7fr8UfhPoeF+/dXfcZkqpOvbZ5RB7U=;
        b=KRkIKTW2vPMIAPOrJqAhZCJWauBS8Xbdq8O77aXSrTWRPC70EBtX4wNiikM+7bpL+r
         dvRsNOCXGyXOKKrUNziv6Zau+f/q8UHNA31NnkbqopS2ZSvq9oYFNjXIdrPQWW5mjxmF
         tU+B8NfJ1mAiKSkf6WZyEUKPUcywu2v/KmKio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785675375; x=1786280175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ETfs/c6iWnkEc7fr8UfhPoeF+/dXfcZkqpOvbZ5RB7U=;
        b=NlaY+2aCF2NLD5ntV2cAHvBfV4fLRZ9ErGtQBgYKkOE2Pzajw05+7GkEtkvq9a8bk/
         zdqxfij3Eu113DDfGBbFDM08O3jlJ1BLMsUteH35QoIf8snMjQ02k07o6gznSAS8qo0/
         S/Q2oNMXDT4dqE0e5pa15+5o9DrhGAanhJpBdUoZDKnFX4ebB1BjVFNvxOVUVnqckb8N
         UD7A5dYl9KepuPHs5YUN4J/Z7QbqvkZGGQAA+nugct8QSO9AZQuZl8/HFfaZnVWuxwVt
         eOxFWc3YbLWZYQQlJQz5DU4Jebccw2sq+OGuREKlVA7CFtR5JBVgZSIQSaak2I4N10/J
         B4xw==
X-Gm-Message-State: AOJu0YwSFzGlJiPR+NhSTSRhWJtT0zWEoUBrWocKOrN3tdgxabMsFoFT
	e7HnydNdnNA/lrSasthju0irm0jdlLIyUOPXv+WI9PaZNHmw3E4GmrdnkLeZcjAu5eQgyUxybgD
	InQioBMs=
X-Gm-Gg: AR+sD13k9bfkBJam+Pm+3Jt3ZArG5fBdoETaF5JCXq96LEFVlrhcWKmoI1oHSIVS4Bt
	PTIjB6rb8/5OaDlPopOS7aITOcbivmRsjSqJs969IhLJ/S+1uBGaK1GiG2BpbMaMwCb6ya0kHQt
	TF/GUpTPyv2aCsT5ksBBWJfGQnAqXtID3osE/c8YcuiaGvk7mqWANw0PDW1D7Hrfr9wj/ASc/PA
	8juxy81M5hqT/V156pwhYkmvywUNXVN21OLn+MSj+w/sDd1ykgEz4KDERiLGh3hgcLBAJSwdUSJ
	Yl/u/GZfS10dsR/kQf6q3TdP2gsmC9Eiqp5FseR/MNSreJpAZwKbCSsxQWfSMvj8zQEHCVcR8ss
	rfA32z4iyYIBRUzhmgaPKvGAXBZAg53ia24SdsX7I6Zw5OFYg2pNsC83m17Z390yUXZAVfJHolt
	4kuRQe4Zf5pWp+FLtl9wOFQsqDW6HxNKVhxG1QRJyH0zdaOGMeiOT88TzdH8Kvp8emQTVFHnZWD
	kqwM9WX597nUcAFnQ==
X-Received: by 2002:a05:600c:46ce:b0:498:ee7:e403 with SMTP id 5b1f17b1804b1-4980ee7e7dfmr99239105e9.19.1785675375446;
        Sun, 02 Aug 2026 05:56:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b73asm21911934f8f.29.2026.08.02.05.56.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:56:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] pkgconf: upgrade 3.0.4 -> 3.0.5
Date: Sun,  2 Aug 2026 13:56:06 +0100
Message-ID: <20260802125609.4049666-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802125609.4049666-1-richard.purdie@linuxfoundation.org>
References: <20260802125609.4049666-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 12:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242558

Changes from 3.0.4 to 3.0.5:
----------------------------

* Correctness fixes:
  - Shell quoting and backslash escapes in pc(5) properties are now consumed
    once, after variable substitution, instead of while splitting the property
    beforehand.  Quoting arriving from a variable is therefore treated like
    quoting written inline, --variable reports a value as the .pc file spells
    it, and fragments are escaped exactly once when rendered.  This supersedes
    the 3.0.4 fix, which unescaped whitespace at parse time and so hid the
    escaping from consumers such as cmake's FindPkgConfig.
    See https://github.com/pkgconf/pkgconf/issues/575 and
    https://github.com/pkgconf/pkgconf/issues/579.
  - Metadata queries no longer consult Conflicts rules between the modules named
    on the command line, as reporting metadata does not combine them into a
    build.  This covers --license, --license-file, --modversion, --path,
    --print-provides, --print-requires, --print-requires-private,
    --print-variables, --source and --variable.  --cflags, --libs and --exists
    are unaffected.
    See https://github.com/pkgconf/pkgconf/issues/580.
  - ${pc_sysrootdir} is now injected into the path taken by every -isystem and
    -idirafter flag in a fragment list, rather than only the first.
  - -isystem and -idirafter written joined to their path, as in `-isystem/opt`,
    are split into the flag and the path it takes, so that the path is subject
    to the same sysroot injection and deduplication as the separated spelling.
  - Sysroot injection is decided by reading the fragment's path instead of
    remembering whether ${pc_sysrootdir} was expanded, so a path which already
    lies under the sysroot never acquires a doubled prefix.

* Performance:
  - The package cache and the fragment deduplication index are kept sorted and
    searched with bsearch() rather than re-sorted or scanned linearly.
  - Variable keys and fragment text are stored with the structures they belong
    to, and buffers are rewound and reused rather than reallocated.
  - Escaping, fragment rendering and path relocation write into their
    destination buffer directly.
  Resolving a graph of roughly forty modules is about six times faster than
  3.0.4, and a small graph such as gio-2.0 about twice as fast.

* Build and portability fixes:
  - Fix the pkgconf-lite build, which failed to link because the dependency list
    renderer had come to depend on tracing machinery that pkgconf-lite omits.
  - Fix the test runner failing to build on MinGW, where the mkdtemp(3) fallback
    was compiled only for MSVC builds.
    See https://github.com/pkgconf/pkgconf/issues/582.
  - The meson build now defines HAVE_DECL_READLINKAT, so readlinkat(2) is used
    where it is available instead of always falling back to readlink(2).
  The MinGW and readlinkat fixes are by moi15moi.

* New libpkgconf API additions:
  - pkgconf_argv_split_raw: splits a string into an argument vector

* New libpkgconf API additions:
  - pkgconf_argv_split_raw: splits a string into an argument vector like
    pkgconf_argv_split, but leaves the quoting it reads in place.
  - pkgconf_fragment_filter_splice: like pkgconf_fragment_filter, but moves the
    matching fragments to the destination list instead of copying them.
  - pkgconf_charset_from_spans: compiles a span list into a byte set.
  - pkgconf_buffer_escape_charset: escapes a buffer against such a byte set.
  - pkgconf_buffer_rewind: empties a buffer while keeping its allocation.
  - pkgconf_list_splice: moves the contents of one list onto the end of another.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pkgconf/{pkgconf_3.0.4.bb => pkgconf_3.0.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.4.bb => pkgconf_3.0.5.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
index 0abd0fa923c..79ac3208d3e 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.4.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "91ce346b47f46b87d680c6928e6c43240b9cdc7a31afbea19f2298de4dbe266d"
+SRC_URI[sha256sum] = "3acd3a8a3cce65a8d620321855d92fb602e026cbe8e13ee36bdec58483b59ace"
 UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig

