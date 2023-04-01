Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C478BCA9EAD
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.32117.1680384534024432691
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hX9cVTfz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101873eb922ce-0f5b1b45-b979-48bf-8608-c6469ad2f0f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bEz1auee5+UQD/+0yVRk28AJUsq2yoSNrE9nhqIcj8M=;
	b=hX9cVTfzjGYim5O5hOkzuVCSvbmG5wZe/6be6hViHmFh+ffiSHQjXyDcXKCjM83X
	MaiB/LY6QqiBVI2cOqSMUgr4xpf42Z0CyD8Sm3sOhB34dPkkHgUptB2YVqO+Gsjb3yf
	ruX+n0SKDuhr/OxG7VhXMb4XHt65noQFI2khkRZE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bEz1auee5+UQD/+0yVRk28AJUsq2yoSNrE9nhqIcj8M=;
	b=Lx8cdNhWFswhUnO+vW/cDSXp5jLqaJuZu/H32kwwxdth6ZOFTmO6x+DvJPfPoCS2
	rjdDVy5TJjZH8zU+xTcP+I3qjgzcO1UX5ds8450XwruxceJRge6LWXUHnj/8z9dm5lU
	fPuSoK+jUMvc7z8LHonH7OR36JsuZWou1Dl0G9N0=
Content-Type: multipart/mixed; boundary="===============2725045946920736023=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.8 SUCCEEDED
Message-ID: <010101873eb922ce-0f5b1b45-b979-48bf-8608-c6469ad2f0f5-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179481

--===============2725045946920736023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccache* to *4.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.7.4-4.8.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2725045946920736023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ccache/ccache-dbg: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 24683464 to 25637556 (+4%)
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache-dev: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache-dev: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache-doc: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache-doc: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache-locale: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache-locale: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache-src: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache-src: PKGSIZE changed from 1870304 to 1911250 (+2%)
packages/core2-32-poky-linux/ccache/ccache-src: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.7.4-r0/src/third_party/blake3 -> /usr/src/debug/ccache/4.8-r0/src/third_party/blake3, directory renamed /usr/src/debug/ccache/4.7.4-r0/src/storage/remote -> /usr/src/debug/ccache/4.8-r0/src/storage/remote, directory renamed /usr/src/debug/ccache/4.7.4-r0/src/third_party/fmt -> /usr/src/debug/ccache/4.8-r0/src/third_party/fmt, directory renamed /usr/src/debug/ccache/4.7.4-r0/src/storage -> /usr/src/debug/ccache/4.8-r0/src/storage, directory renamed /usr/src/debug/ccache/4.7.4-r0/src/third_party/nonstd -> /usr/src/debug/ccache/4.8-r0/src/third_party/nonstd, directory renamed /usr/src/debug/ccache/4.7.4-r0/src -> /usr/src/debug/ccache/4.8-r0/src, directory renamed /usr/src/debug/ccache/4.7.4-r0/src/third_party -> /usr/src/debug/ccache/4.8-r0/src/third_party, removed "/usr/src/debug/ccache/4.7.4-r0/src/util/TextTable.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/StatsLog.hpp /usr/src/debug/c
 cache/4.7.4-r0/src/core/Statistics.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/Bytes.cpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/LocalStorage_compress.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/ResultInspector.cpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/util.cpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/util.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/Bytes.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/StatisticsCounters.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/zstd.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/ResultInspector.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/MsvcShowIncludesOutput.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/MsvcShowIncludesOutput.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/LockFile.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/CacheEntryDataWriter.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/Serializer.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/mainoptions.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/Duration.hpp /usr/src/debug/ccac
 he/4.7.4-r0/src/util/Tokenizer.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/string.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/CacheEntryDataReader.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/StatisticsCounters.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/string.hpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/LocalStorage.cpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/LocalStorage.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/Sloppiness.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/CacheEntry.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/expected.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/XXH3_64.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/path.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/zstd.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/Manifest.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/Result.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/Result.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/mainoptions.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/TimePoint.cpp /usr/src/debug/ccache/
 4.7.4-r0/src/util/file.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/Statistic.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/types.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/types.hpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/LocalStorage_cleanup.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/Manifest.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/Tokenizer.cpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/CacheFile.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/StatsLog.cpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/StatsFile.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/TextTable.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/ResultRetriever.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/ResultExtractor.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/LockFile.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/types.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/path.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/CacheEntry.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/Statistics.hpp /usr/src/debug/ccach
 e/4.7.4-r0/src/util/TimePoint.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/Timer.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/file.cpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/CacheFile.cpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/StatsFile.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/XXH3_128.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/ResultExtractor.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/ResultRetriever.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/exceptions.hpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/LocalStorage_statistics.cpp", added "/usr/src/debug/ccache/4.8-r0/src/util/expected.hpp /usr/src/debug/ccache/4.8-r0/src/util/BitSet.hpp /usr/src/debug/ccache/4.8-r0/src/core/MsvcShowIncludesOutput.cpp /usr/src/debug/ccache/4.8-r0/src/core/Sloppiness.hpp /usr/src/debug/ccache/4.8-r0/src/core/mainoptions.cpp /usr/src/debug/ccache/4.8-r0/src/util/TextTable.cpp /usr/src/debug/ccache/4.8-r0/src/core/Serializer.hpp /usr/src/debug/ccache/4.8-r0/src/util/XXH3_64.h
 pp /usr/src/debug/ccache/4.8-r0/src/core/CacheEntryDataReader.hpp /usr/src/debug/ccache/4.8-r0/src/core/CacheEntryDataWriter.hpp /usr/src/debug/ccache/4.8-r0/src/util/zstd.cpp /usr/src/debug/ccache/4.8-r0/src/core/StatsLog.cpp /usr/src/debug/ccache/4.8-r0/src/core/StatsLog.hpp /usr/src/debug/ccache/4.8-r0/src/util/types.hpp /usr/src/debug/ccache/4.8-r0/src/core/types.hpp /usr/src/debug/ccache/4.8-r0/src/core/Manifest.hpp /usr/src/debug/ccache/4.8-r0/src/core/Manifest.cpp /usr/src/debug/ccache/4.8-r0/src/util/string.hpp /usr/src/debug/ccache/4.8-r0/src/core/FileRecompressor.cpp /usr/src/debug/ccache/4.8-r0/src/core/FileRecompressor.hpp /usr/src/debug/ccache/4.8-r0/src/core/CacheEntry.hpp /usr/src/debug/ccache/4.8-r0/src/core/exceptions.hpp /usr/src/debug/ccache/4.8-r0/src/core/types.cpp /usr/src/debug/ccache/4.8-r0/src/util/XXH3_128.hpp /usr/src/debug/ccache/4.8-r0/src/core/mainoptions.hpp /usr/src/debug/ccache/4.8-r0/src/storage/local/LocalStorage.cpp /usr/src/debug/ccache/4.8-r0/sr
 c/core/MsvcShowIncludesOutput.hpp /usr/src/debug/ccache/4.8-r0/src/util/TimePoint.cpp /usr/src/debug/ccache/4.8-r0/src/util/zstd.hpp /usr/src/debug/ccache/4.8-r0/src/core/Result.hpp /usr/src/debug/ccache/4.8-r0/src/storage/local/util.hpp /usr/src/debug/ccache/4.8-r0/src/storage/local/StatsFile.cpp /usr/src/debug/ccache/4.8-r0/src/util/file.cpp /usr/src/debug/ccache/4.8-r0/src/core/StatisticsCounters.hpp /usr/src/debug/ccache/4.8-r0/src/core/Result.cpp /usr/src/debug/ccache/4.8-r0/src/core/Statistics.hpp /usr/src/debug/ccache/4.8-r0/src/core/ResultRetriever.cpp /usr/src/debug/ccache/4.8-r0/src/core/ResultRetriever.hpp /usr/src/debug/ccache/4.8-r0/src/core/StatisticsCounters.cpp /usr/src/debug/ccache/4.8-r0/src/util/TimePoint.hpp /usr/src/debug/ccache/4.8-r0/src/util/Tokenizer.hpp /usr/src/debug/ccache/4.8-r0/src/util/path.cpp /usr/src/debug/ccache/4.8-r0/src/util/Duration.hpp /usr/src/debug/ccache/4.8-r0/src/core/ResultInspector.cpp /usr/src/debug/ccache/4.8-r0/src/core/ResultInspect
 or.hpp /usr/src/debug/ccache/4.8-r0/src/util/file.hpp /usr/src/debug/ccache/4.8-r0/src/core/Statistics.cpp /usr/src/debug/ccache/4.8-r0/src/util/Bytes.hpp /usr/src/debug/ccache/4.8-r0/src/core/Statistic.hpp /usr/src/debug/ccache/4.8-r0/src/util/string.cpp /usr/src/debug/ccache/4.8-r0/src/storage/local/LocalStorage.hpp /usr/src/debug/ccache/4.8-r0/src/util/Timer.hpp /usr/src/debug/ccache/4.8-r0/src/storage/local/util.cpp /usr/src/debug/ccache/4.8-r0/src/storage/local/StatsFile.hpp /usr/src/debug/ccache/4.8-r0/src/util/LockFile.cpp /usr/src/debug/ccache/4.8-r0/src/util/LockFile.hpp /usr/src/debug/ccache/4.8-r0/src/util/LongLivedLockFileManager.cpp /usr/src/debug/ccache/4.8-r0/src/core/ResultExtractor.cpp /usr/src/debug/ccache/4.8-r0/src/core/ResultExtractor.hpp /usr/src/debug/ccache/4.8-r0/src/util/LongLivedLockFileManager.hpp /usr/src/debug/ccache/4.8-r0/src/util/TextTable.hpp /usr/src/debug/ccache/4.8-r0/src/util/Tokenizer.cpp /usr/src/debug/ccache/4.8-r0/src/core/CacheEntry.cpp /us
 r/src/debug/ccache/4.8-r0/src/util/Bytes.cpp /usr/src/debug/ccache/4.8-r0/src/util/path.hpp"
packages/core2-32-poky-linux/ccache/ccache-staticdev: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache: PKGSIZE changed from 1583140 to 1648676 (+4%)
packages/core2-32-poky-linux/ccache/ccache: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.7.4/ccache-4.7.4.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch" to "https://github.com/ccache/ccache/releases//download/v4.8/ccache-4.8.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch"

--===============2725045946920736023==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.7.4-4.8.patch"

RnJvbSAzMjNjMTNmOWI3MzMwNmZhNTM3YWU3YjMwZTYyOWEyNDhmYjNmNDY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAwNzo0ODo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
YWNoZTogdXBncmFkZSA0LjcuNCAtPiA0LjgKCi0tLQogLi4uL2NjYWNoZS97Y2NhY2hlXzQuNy40
LmJiID0+IGNjYWNoZV80LjguYmJ9IHwgMzUgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNo
YW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NjYWNoZS97Y2NhY2hlXzQuNy40LmJiID0+IGNjYWNoZV80LjguYmJ9ICg0
MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC43
LjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjguYmIKc2ltaWxh
cml0eSBpbmRleCA0MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9j
Y2FjaGVfNC43LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2Nh
Y2hlXzQuOC5iYgppbmRleCAwNDE5ZDA3YzRlLi5lMDJhZWVkMzNhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjcuNC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjguYmIKQEAgLTEsMyArMSwzNCBAQAorIyBGSVhN
RTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0
b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJ
Q0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRo
ZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTog
J0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hh
bmdlczoKKyMKKyMgLS0tIExJQ0VOU0UuYWRvYworIyArKysgTElDRU5TRS5hZG9jCisjIEBAIC0z
NSw3ICszNSw3IEBACisjICAKKyMgIC0tLS0KKyMgIENvcHlyaWdodCAoQykgMjAwMi0yMDA3IEFu
ZHJldyBUcmlkZ2VsbAorIyAtQ29weXJpZ2h0IChDKSAyMDA5LTIwMjIgSm9lbCBSb3NkYWhsIGFu
ZCBvdGhlciBjb250cmlidXRvcnMKKyMgK0NvcHlyaWdodCAoQykgMjAwOS0yMDIzIEpvZWwgUm9z
ZGFobCBhbmQgb3RoZXIgY29udHJpYnV0b3JzCisjICAtLS0tCisjICAKKyMgIAorIyBAQCAtNDEy
LDcgKzQxMiw3IEBACisjICA9PT0gc3JjL3RoaXJkX3BhcnR5L2RvY3Rlc3QuaAorIyAgCisjICBU
aGlzIGlzIHRoZSBzaW5nbGUgaGVhZGVyIHZlcnNpb24gb2YgaHR0cHM6Ly9naXRodWIuY29tL29u
cXRhbS9kb2N0ZXN0W2RvY3Rlc3RdCisjIC0yLjQuOCB3aXRoIHRoZSBmb2xsb3dpbmcgbGljZW5z
ZToKKyMgKzIuNC4xMCB3aXRoIHRoZSBmb2xsb3dpbmcgbGljZW5zZToKKyMgIAorIyAgLS0tLQor
IyAgVGhlIE1JVCBMaWNlbnNlIChNSVQpCisjIAorIworCiBTVU1NQVJZID0gImEgZmFzdCBDL0Mr
KyBjb21waWxlciBjYWNoZSIKIERFU0NSSVBUSU9OID0gImNjYWNoZSBpcyBhIGNvbXBpbGVyIGNh
Y2hlLiBJdCBzcGVlZHMgdXAgcmVjb21waWxhdGlvbiBcCiBieSBjYWNoaW5nIHRoZSByZXN1bHQg
b2YgcHJldmlvdXMgY29tcGlsYXRpb25zIGFuZCBkZXRlY3Rpbmcgd2hlbiB0aGUgXApAQCAtNywx
NCArMzgsMTQgQEAgSE9NRVBBR0UgPSAiaHR0cDovL2NjYWNoZS5zYW1iYS5vcmciCiBTRUNUSU9O
ID0gImRldmVsIgogCiBMSUNFTlNFID0gIkdQTC0zLjAtb3ItbGF0ZXIiCi1MSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFLmFkb2M7bWQ1PThmYzJjYWUyYmJhYmViOTIzNmNhY2ZhMWM4
M2EzZGM1IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5hZG9jO21kNT00M2Ew
MmI3NGM5ZWI3M2EwYjk3OGFlNTA4MmY1ZjFiNiIKIAogREVQRU5EUyA9ICJ6c3RkIgogCiBTUkNf
VVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vJHtCUH0udGFyLmd6IFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDEteHhoYXNoLmgtRml4LWJ1aWxkLXdpdGgtZ2NjLTEyLnBh
dGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRjMjgzOTA2YjczYmQ3
YzQ2MTE3OGNhNDcyYTQ1OWU5ZDg2YjU1MjM0MDUwMzU5MjFiZDgyMDRlNzc2MjAyNjQiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYWM0YjAxNzQ4ZmQ1OWNmZTA3ZTA3MGMzNDQzMmI5MWJkZDBmZDg2
NDBlMWU2NTNhODBiMDFkNmE1MjMxODZiMCIKIAogaW5oZXJpdCBjbWFrZSBnaXRodWItcmVsZWFz
ZXMKIAotLSAKMi4zOS4yCgo=

--===============2725045946920736023==--

