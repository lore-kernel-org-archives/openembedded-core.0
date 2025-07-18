Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78DCC83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 17:44:25 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.4776.1752860662478725915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 10:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ci8O8dFD;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-748fe69a7baso2256196b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 10:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752860662; x=1753465462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMuW4h5R9wmb9JcpyziWmUag0uOp2FmCAnlzztU5KDw=;
        b=Ci8O8dFDY3//RxAv+Nf9bNMrMnguErHrkZ/CDF+SY8tFQrpSdQA4MAYHczFJTF/lqM
         Ba2ITSPf/DtnhEwa07f8TIUpi3pw/k6HX6J3QvBBrsDxDIZkw5jMuXjEW9YTIBYdJgG5
         mpIalURZT3V4BYo/m8wPIr6tmruGfTiDhaBRzyl03pMsRoWEU0ZL8RMKcWh8yo7qRfGW
         x4t+DlfGptrovQTzPI69etftb0yPdZDP5y3x4lSqHS/FnKGYmTv6FU6c/GsO8k6M+qwf
         H4Q8PCmFrOwcHYcG0oSKk/KsjdgBJc153IbZi2IY9AY9dvc6f0IIDzi0ajAJ4ZSkVBBz
         l43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752860662; x=1753465462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TMuW4h5R9wmb9JcpyziWmUag0uOp2FmCAnlzztU5KDw=;
        b=YQgCINiGWH3LIyjVzWdICB5V3fg4TrTimErxMfQVktOE4j0FQymYrHbSvOokTRSRJQ
         K7mF+H+VBxFJaD+u5Up7IIymcxMKXz+ehi0CuhMTtQG0sUke7BGPHVjvxeYJJd6CSY8N
         SV01RMZY5U5pJmPi6F+/GvgVVe//6DL7Cc61/9QS2fomyjMZ8P+3DDr5l+YGsj0mS0iY
         fHXxSFtipoJitsvSzP0aSE1p6J33gSxKkrq/XVsIHcjyp01SvRwEDKBuYY9z0/GMBrjs
         M9qdrNy9WEVfWkGUuKjMXkU0pMGvjKe6x2tWNQqnXfqNXz9jq15JHhoD76VIZ0bnU1VM
         Qx0g==
X-Gm-Message-State: AOJu0Yzxy2qkL2T0YcWatDWkuA8Z0TW8RYMsTeqcPgvStjORdrgDcFMO
	+TlT8G52zPNQy0vOEQ56SA1WfzoCkgBiRmvIOsuTUe5fTaa2M/s85TGeUrSXDrbpxBY=
X-Gm-Gg: ASbGncu6aZIh/MbTLFSe8eA6qedkmBHSdzdxt0LrXj0ro8gTObdBQ7wdw51AutsSEv5
	G0n0athhfYEaqKnT3z2ndEV1TBtpgjZip8H63xFK6sPFjuHl+FiZpkU47KTMSd7pt8VPIut6/N2
	13tvOUtBbU5ItssTq+Tfi0O82tm+l7KwwPl06w3WP243kZVwniCNuT6K75ZqT6bzWQN4/629WAD
	DnW0bdzbTgX3IIlEUFSv4k66qXtfp5p8tnR/oOCpExMw/SYdWp02/WE+8ErjdU3uwlG0n5FJe7l
	5wPRLMTjmRcC9pVZb02AjAeBiqa9M/B44RyhfzgAsILNvz0KJ/Zi+qhlXSqHzD6IGeH+qhyL5ds
	2HzdxhG7cUn5S389Gpg97moAu
X-Google-Smtp-Source: AGHT+IHgFRl91mCQYvg20vRmfMgfGyPJ/vucdn0gXk/rhp/mdxVNlf6fQTPq1tie5mbjURi2I/9aog==
X-Received: by 2002:a05:6a20:9188:b0:233:f0c6:a8a4 with SMTP id adf61e73a8af0-2390dc51bc4mr15547240637.31.1752860661352;
        Fri, 18 Jul 2025 10:44:21 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::8d90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe8b88bsm1483492a12.16.2025.07.18.10.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 10:44:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] pbzip2: Do not depend on char_trait template from stdlib
Date: Fri, 18 Jul 2025 10:44:18 -0700
Message-ID: <20250718174418.12850-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 17:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220604

This implementation is not part of standard and some implementations
e.g. libc++ have removed it starting with 19.x release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...std-char_traits-template-from-stdlib.patch | 116 ++++++++++++++++++
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-extended/pbzip2/pbzip2/0001-Do-not-rely-on-std-char_traits-template-from-stdlib.patch

diff --git a/meta/recipes-extended/pbzip2/pbzip2/0001-Do-not-rely-on-std-char_traits-template-from-stdlib.patch b/meta/recipes-extended/pbzip2/pbzip2/0001-Do-not-rely-on-std-char_traits-template-from-stdlib.patch
new file mode 100644
index 00000000000..21c9145a1ad
--- /dev/null
+++ b/meta/recipes-extended/pbzip2/pbzip2/0001-Do-not-rely-on-std-char_traits-template-from-stdlib.patch
@@ -0,0 +1,116 @@
+From c9f1af117557ad5d75df9e37bf3fbb1185f67de2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 18 Jul 2025 10:26:06 -0700
+Subject: [PATCH] Do not rely on std::char_traits template from stdlib
+
+standard never required the base template for
+char_traits to any type but it was given for
+convenience purposes. Nowadays, at least in LLVM's
+libcxx version 19+ it got removed [1].
+
+GCC might follow the same path at some point so
+porting it away from char_traits might be a good
+idea.
+
+The fix is applied to FreeBSD [2] [3]
+
+Reported issue [4]
+
+[1] https://reviews.llvm.org/D138307
+[2] https://cgit.freebsd.org/ports/commit/archivers/pbzip2/files/patch-BZ2StreamScanner.cpp?id=29c80f114ea6cc60be39502339572af8c35ac440
+[3] https://cgit.freebsd.org/ports/commit/archivers/pbzip2/files/patch-BZ2StreamScanner.cpp?id=89f872ec2ccf488f24cd9daca2e0d1f80e7ee429
+[4] https://github.com/ruanhuabin/pbzip2/issues/1
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2015-12-17]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ BZ2StreamScanner.cpp | 21 +++++++++++----------
+ BZ2StreamScanner.h   |  6 +++---
+ 2 files changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/BZ2StreamScanner.cpp b/BZ2StreamScanner.cpp
+index a134712..f32a321 100644
+--- a/BZ2StreamScanner.cpp
++++ b/BZ2StreamScanner.cpp
+@@ -42,15 +42,15 @@ int BZ2StreamScanner::init( int hInFile, size_t inBuffCapacity )
+ {
+ 	dispose();
+ 
+-	CharType bz2header[] = "BZh91AY&SY";
+-	// zero-terminated string
++	CharType bz2header[] =
++		{ 'B', 'Z', 'h', '9', '1', 'A', 'Y', '&', 'S', 'Y' };
+ 	CharType bz2ZeroHeader[] =
+-		{ 'B', 'Z', 'h', '9', 0x17, 0x72, 0x45, 0x38, 0x50, 0x90, 0 };
++		{ 'B', 'Z', 'h', '9', 0x17, 0x72, 0x45, 0x38, 0x50, 0x90 };
+ 
+ 	_hInFile = hInFile;
+ 	_eof = false;
+-	_bz2Header = bz2header;
+-	_bz2HeaderZero = bz2ZeroHeader;
++	_bz2Header.assign(begin(bz2header), end(bz2header));
++	_bz2HeaderZero.assign(begin(bz2ZeroHeader), end(bz2ZeroHeader));
+ 	_bz2HeaderFound = false;
+ 	_inBuffCapacity = 0;
+ 	_errState = 0;
+@@ -361,7 +361,7 @@ BZ2StreamScanner::CharType * BZ2StreamScanner::locateHeaderPrefixInBuff()
+ 			_errState |= ERR_INVALID_FILE_FORMAT;
+ 			_inBuffSearchPtr = getInBuffEnd();
+ 		}
+-		else if ( _bz2Header.compare( 0, prefixLen, getInBuffSearchPtr(), prefixLen ) == 0 )
++		else if ( equal( _bz2Header.begin(), _bz2Header.begin() + prefixLen, getInBuffSearchPtr() ) )
+ 		{
+ 			// header prefix found
+ 		}
+@@ -416,7 +416,7 @@ BZ2StreamScanner::CharType * BZ2StreamScanner::searchNextHeaderInBuff()
+ 	while ( !failed() && ( getUnsearchedCount() >= getHeaderSize() ) )
+ 	{
+ 		// _inBuffSearchPtr += prefixLen;
+-		basic_string<CharType> * pHdr = NULL;
++		vector<CharType> * pHdr = NULL;
+ 
+ 		if ( getInBuffSearchPtr()[hsp] == _bz2Header[hsp] )
+ 		{
+@@ -441,13 +441,14 @@ BZ2StreamScanner::CharType * BZ2StreamScanner::searchNextHeaderInBuff()
+ 				(*pHdr)[prefixLen] = bwtSizeChar;
+ 
+ 				// compare the remaining part of magic header
+-				int cmpres = pHdr->compare( hsp, pHdr->size() - hsp,
+-						getInBuffSearchPtr() + hsp, pHdr->size() - hsp );
++				bool cmpres = equal( pHdr->begin() + hsp, pHdr->end(),
++						getInBuffSearchPtr() + hsp );
++
+ 
+ 				#ifdef PBZIP_DEBUG
+ 				fprintf( stderr, "   searchNextHeaderInBuff:cmpres=%d\n", cmpres );
+ 				#endif
+-				if ( cmpres == 0 )
++				if ( cmpres )
+ 				{
+ 					_searchStatus = true;
+ 					#ifdef PBZIP_DEBUG
+diff --git a/BZ2StreamScanner.h b/BZ2StreamScanner.h
+index d3729fe..32697cb 100644
+--- a/BZ2StreamScanner.h
++++ b/BZ2StreamScanner.h
+@@ -44,7 +44,7 @@ public:
+ 
+ 	size_t getInBuffSize() const { return ( _inBuffEnd - _inBuff ); }
+ 	size_t getInBuffCapacity() const { return _inBuffCapacity; }
+-	const basic_string<CharType> & getHeader() const { return _bz2Header; }
++	const vector<CharType> & getHeader() const { return _bz2Header; }
+ 	size_t getHeaderSize() const { return _bz2Header.size(); }
+ 	int getErrState() const { return _errState; }
+ 	bool failed() { return ( _errState != 0 ); }
+@@ -125,8 +125,8 @@ private:
+ 	int _hInFile; // input file descriptor
+ 	bool _eof;
+ 
+-	basic_string<CharType> _bz2Header;
+-	basic_string<CharType> _bz2HeaderZero;
++	vector<CharType> _bz2Header;
++	vector<CharType> _bz2HeaderZero;
+ 	bool _bz2HeaderFound;
+ 	bool _searchStatus;
+ 
diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index f95400998cd..063f600ba9f 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -13,6 +13,7 @@ DEPENDS:append:class-native = " bzip2-replacement-native"
 
 SRC_URI = "https://launchpad.net/${BPN}/1.1/${PV}/+download/${BP}.tar.gz \
            file://0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch \
+           file://0001-Do-not-rely-on-std-char_traits-template-from-stdlib.patch \
            "
 
 SRC_URI[sha256sum] = "8fd13eaaa266f7ee91f85c1ea97c86d9c9cc985969db9059cdebcb1e1b7bdbe6"

