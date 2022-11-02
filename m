Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2791BC65BA6
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.859.1667349632543835204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HdoPnVlL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018435c852e7-b7599a01-9f4f-4990-a568-834563837669-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZFzJL7YxDeY/bOAssLd2ofXKnslNUiokEWY7fyC9fbI=;
	b=HdoPnVlLVTP0FDMIVFRpKaUHgVDrZh5Z7WmYUd31rVQDmEwEMRicnl2Gqjfp7Ai2
	69IN6NSOEJtBNu0JT1du1qWvlMFOBlnt0wlaGf9rLX91k1oH20dlcXmvywGfj0dtfCH
	eB/66fvb46Nw6ja2+gn6kQh7DSiaHiL01+2VLvNw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZFzJL7YxDeY/bOAssLd2ofXKnslNUiokEWY7fyC9fbI=;
	b=LJE0/CIRAYiBXaZZpBc9N8jvgEqWDcelKaIqx8XvjjQpJxDUvFVOaBRMRHkKznlO
	g+GJ6NKKjP6opNomTyV32SMtlav6ixuc9xny4bMo5iDgUqHltqevevvsrMMkp/uZbo/
	YUSrEXStc9iYhS/wjp3+zJvA3p04/vQccWyQDHko=
Content-Type: multipart/mixed; boundary="===============7986971344610513803=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.7.2 SUCCEEDED
Message-ID: <0101018435c852e7-b7599a01-9f4f-4990-a568-834563837669-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172407

--===============7986971344610513803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccache* to *4.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.6.3-4.7.2.patch
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
--===============7986971344610513803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 28061532 to 24714764 (-12%)
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGV changed from 4.6.3 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/ccache/ccache-dbg: PV changed from "4.6.3" to "4.7.2"
packages/core2-32-poky-linux/ccache/ccache-dev: PKGV changed from 4.6.3 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/ccache/ccache-dev: PV changed from "4.6.3" to "4.7.2"
packages/core2-32-poky-linux/ccache/ccache-doc: PKGV changed from 4.6.3 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/ccache/ccache-doc: PV changed from "4.6.3" to "4.7.2"
packages/core2-32-poky-linux/ccache/ccache-locale: PKGV changed from 4.6.3 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/ccache/ccache-locale: PV changed from "4.6.3" to "4.7.2"
packages/core2-32-poky-linux/ccache/ccache-src: PKGSIZE changed from 1846927 to 1866320 (+1%)
packages/core2-32-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.6.3-r0/src/storage -> /usr/src/debug/ccache/4.7.2-r0/src/storage, directory renamed /usr/src/debug/ccache/4.6.3-r0/src/third_party/blake3 -> /usr/src/debug/ccache/4.7.2-r0/src/third_party/blake3, directory renamed /usr/src/debug/ccache/4.6.3-r0/src/third_party/fmt -> /usr/src/debug/ccache/4.7.2-r0/src/third_party/fmt, removed "/usr/src/debug/ccache/4.6.3-r0/src/compression/NullDecompressor.cpp /usr/src/debug/ccache/4.6.3-r0/src/version.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/Writer.hpp /usr/src/debug/ccache/4.6.3-r0/src/AtomicFile.cpp /usr/src/debug/ccache/4.6.3-r0/src/util/Tokenizer.hpp /usr/src/debug/ccache/4.6.3-r0/src/core/ChecksummingWriter.hpp /usr/src/debug/ccache/4.6.3-r0/src/ResultExtractor.cpp /usr/src/debug/ccache/4.6.3-r0/src/Digest.hpp /usr/src/debug/ccache/4.6.3-r0/src/storage/primary/PrimaryStorage_statistics.cpp /usr/src/debug/ccache/4.6.3-r0/src/Util.hpp /usr/src/d
 ebug/ccache/4.6.3-r0/src/SignalHandler.hpp /usr/src/debug/ccache/4.6.3-r0/src/core/Manifest.cpp /usr/src/debug/ccache/4.6.3-r0/src/storage/primary/PrimaryStorage_cleanup.cpp /usr/src/debug/ccache/4.6.3-r0/src/File.hpp /usr/src/debug/ccache/4.6.3-r0/src/hashutil.hpp /usr/src/debug/ccache/4.6.3-r0/src/compression/NullCompressor.cpp /usr/src/debug/ccache/4.6.3-r0/src/Args.cpp /usr/src/debug/ccache/4.6.3-r0/src/TemporaryFile.hpp /usr/src/debug/ccache/4.6.3-r0/src/third_party/url.cpp /usr/src/debug/ccache/4.6.3-r0/src/NonCopyable.hpp /usr/src/debug/ccache/4.6.3-r0/src/compression/ZstdDecompressor.hpp /usr/src/debug/ccache/4.6.3-r0/src/Depfile.hpp /usr/src/debug/ccache/4.6.3-r0/src/util/string.hpp /usr/src/debug/ccache/4.6.3-r0/src/Result.hpp /usr/src/debug/ccache/4.6.3-r0/src/Context.cpp /usr/src/debug/ccache/4.6.3-r0/src/compression/ZstdCompressor.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/FileReader.hpp /usr/src/debug/ccache/4.6.3-r0/src/storage/secondary/HttpStorage.cpp /usr/src/debu
 g/ccache/4.6.3-r0/src/core/mainoptions.cpp /usr/src/debug/ccache/4.6.3-r0/src/util/path.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/CacheEntryHeader.hpp /usr/src/debug/ccache/4.6.3-r0/src/assertions.cpp /usr/src/debug/ccache/4.6.3-r0/src/storage/secondary/FileStorage.cpp /usr/src/debug/ccache/4.6.3-r0/src/third_party/nonstd/optional.hpp /usr/src/debug/ccache/4.6.3-r0/src/macroskip.hpp /usr/src/debug/ccache/4.6.3-r0/src/ProgressBar.cpp /usr/src/debug/ccache/4.6.3-r0/src/third_party/xxhash.h /usr/src/debug/ccache/4.6.3-r0/src/core/CacheEntryReader.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/CacheEntryWriter.hpp /usr/src/debug/ccache/4.6.3-r0/src/compression/NullCompressor.hpp /usr/src/debug/ccache/4.6.3-r0/src/storage/primary/StatsFile.hpp /usr/src/debug/ccache/4.6.3-r0/src/core/Statistics.hpp /usr/src/debug/ccache/4.6.3-r0/src/util/XXH3_128.hpp /usr/src/debug/ccache/4.6.3-r0/src/Fd.hpp /usr/src/debug/ccache/4.6.3-r0/src/util/file.cpp /usr/src/debug/ccache/4.6.3-r0/src/storage/seconda
 ry/FileStorage.hpp /usr/src/debug/ccache/4.6.3-r0/src/core/mainoptions.hpp /usr/src/debug/ccache/4.6.3-r0/src/util/file.hpp /usr/src/debug/ccache/4.6.3-r0/src/ResultExtractor.hpp /usr/src/debug/ccache/4.6.3-r0/src/Result.cpp /usr/src/debug/ccache/4.6.3-r0/src/InodeCache.cpp /usr/src/debug/ccache/4.6.3-r0/src/compopt.hpp /usr/src/debug/ccache/4.6.3-r0/src/third_party/httplib.h /usr/src/debug/ccache/4.6.3-r0/src/main.cpp /usr/src/debug/ccache/4.6.3-r0/src/ArgsInfo.hpp /usr/src/debug/ccache/4.6.3-r0/src/Logging.cpp /usr/src/debug/ccache/4.6.3-r0/src/util/string.cpp /usr/src/debug/ccache/4.6.3-r0/src/util/TextTable.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/exceptions.hpp /usr/src/debug/ccache/4.6.3-r0/src/util/XXH3_64.hpp /usr/src/debug/ccache/4.6.3-r0/src/core/types.cpp /usr/src/debug/ccache/4.6.3-r0/src/storage/primary/PrimaryStorage.hpp /usr/src/debug/ccache/4.6.3-r0/src/third_party/nonstd/string_view.hpp /usr/src/debug/ccache/4.6.3-r0/src/Stat.hpp /usr/src/debug/ccache/4.6.3-r0/sr
 c/third_party/base32hex.c /usr/src/debug/ccache/4.6.3-r0/src/ResultRetriever.hpp /usr/src/debug/ccache/4.6.3-r0/src/Finalizer.hpp /usr/src/debug/ccache/4.6.3-r0/src/Args.hpp /usr/src/debug/ccache/4.6.3-r0/src/ResultRetriever.cpp /usr/src/debug/ccache/4.6.3-r0/src/execute.cpp /usr/src/debug/ccache/4.6.3-r0/src/storage/primary/StatsFile.cpp /usr/src/debug/ccache/4.6.3-r0/src/storage/primary/CacheFile.cpp /usr/src/debug/ccache/4.6.3-r0/src/Context.hpp /usr/src/debug/ccache/4.6.3-r0/src/Lockfile.hpp /usr/src/debug/ccache/4.6.3-r0/src/argprocessing.hpp /usr/src/debug/ccache/4.6.3-r0/src/argprocessing.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/CacheEntryReader.hpp /usr/src/debug/ccache/4.6.3-r0/src/storage/secondary/SecondaryStorage.hpp /usr/src/debug/ccache/4.6.3-r0/src/core/Statistics.cpp /usr/src/debug/ccache/4.6.3-r0/src/AtomicFile.hpp /usr/src/debug/ccache/4.6.3-r0/src/core/StatisticsCounters.hpp /usr/src/debug/ccache/4.6.3-r0/src/util/expected.hpp /usr/src/debug/ccache/4.6.3-r0/src
 /Lockfile.cpp /usr/src/debug/ccache/4.6.3-r0/src/compression/types.cpp /usr/src/debug/ccache/4.6.3-r0/src/UmaskScope.hpp /usr/src/debug/ccache/4.6.3-r0/src/ccache.hpp /usr/src/debug/ccache/4.6.3-r0/src/compression/Decompressor.hpp /usr/src/debug/ccache/4.6.3-r0/src/Util.cpp /usr/src/debug/ccache/4.6.3-r0/src/language.hpp /usr/src/debug/ccache/4.6.3-r0/src/third_party/format.cpp /usr/src/debug/ccache/4.6.3-r0/src/third_party/httplib.cpp /usr/src/debug/ccache/4.6.3-r0/src/hashutil.cpp /usr/src/debug/ccache/4.6.3-r0/src/Hash.hpp /usr/src/debug/ccache/4.6.3-r0/src/storage/primary/PrimaryStorage_compress.cpp /usr/src/debug/ccache/4.6.3-r0/src/ProgressBar.hpp /usr/src/debug/ccache/4.6.3-r0/src/FormatNonstdStringView.hpp /usr/src/debug/ccache/4.6.3-r0/src/ResultInspector.hpp /usr/src/debug/ccache/4.6.3-r0/src/compression/Decompressor.cpp /usr/src/debug/ccache/4.6.3-r0/src/ThreadPool.cpp /usr/src/debug/ccache/4.6.3-r0/src/storage/primary/util.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/Chec
 ksummingReader.hpp /usr/src/debug/ccache/4.6.3-r0/src/third_party/nonstd/expected.hpp /usr/src/debug/ccache/4.6.3-r0/src/util/Timer.hpp /usr/src/debug/ccache/4.6.3-r0/src/compression/Compressor.hpp /usr/src/debug/ccache/4.6.3-r0/src/ccache.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/StatsLog.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/CacheEntryHeader.cpp /usr/src/debug/ccache/4.6.3-r0/src/assertions.hpp /usr/src/debug/ccache/4.6.3-r0/src/third_party/base32hex.h /usr/src/debug/ccache/4.6.3-r0/src/util/path.hpp /usr/src/debug/ccache/4.6.3-r0/src/storage/primary/util.hpp /usr/src/debug/ccache/4.6.3-r0/src/storage/secondary/HttpStorage.hpp /usr/src/debug/ccache/4.6.3-r0/src/core/Reader.hpp /usr/src/debug/ccache/4.6.3-r0/src/InodeCache.hpp /usr/src/debug/ccache/4.6.3-r0/src/compression/ZstdDecompressor.cpp /usr/src/debug/ccache/4.6.3-r0/src/storage/primary/PrimaryStorage.cpp /usr/src/debug/ccache/4.6.3-r0/src/storage/primary/CacheFile.hpp /usr/src/debug/ccache/4.6.3-r0/src/compression/t
 ypes.hpp /usr/src/debug/ccache/4.6.3-r0/src/Stat.cpp /usr/src/debug/ccache/4.6.3-r0/src/compression/NullDecompressor.hpp /usr/src/debug/ccache/4.6.3-r0/src/third_party/url.hpp /usr/src/debug/ccache/4.6.3-r0/src/Logging.hpp /usr/src/debug/ccache/4.6.3-r0/src/Hash.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/Manifest.hpp /usr/src/debug/ccache/4.6.3-r0/src/language.cpp /usr/src/debug/ccache/4.6.3-r0/src/util/TextTable.hpp /usr/src/debug/ccache/4.6.3-r0/src/Fd.cpp /usr/src/debug/ccache/4.6.3-r0/src/ThreadPool.hpp /usr/src/debug/ccache/4.6.3-r0/src/Config.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/Statistic.hpp /usr/src/debug/ccache/4.6.3-r0/src/SignalHandler.cpp /usr/src/debug/ccache/4.6.3-r0/src/util/Tokenizer.cpp /usr/src/debug/ccache/4.6.3-r0/src/compression/Compressor.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/CacheEntryWriter.cpp /usr/src/debug/ccache/4.6.3-r0/src/ResultInspector.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/StatsLog.hpp /usr/src/debug/ccache/4.6.3-r0/src/Config.hpp
  /usr/src/debug/ccache/4.6.3-r0/src/storage/secondary/SecondaryStorage.cpp /usr/src/debug/ccache/4.6.3-r0/src/compopt.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/StatisticsCounters.cpp /usr/src/debug/ccache/4.6.3-r0/src/execute.hpp /usr/src/debug/ccache/4.6.3-r0/src/compression/ZstdCompressor.hpp /usr/src/debug/ccache/4.6.3-r0/src/TemporaryFile.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/Sloppiness.hpp /usr/src/debug/ccache/4.6.3-r0/src/core/types.hpp /usr/src/debug/ccache/4.6.3-r0/src/Depfile.cpp /usr/src/debug/ccache/4.6.3-r0/src/core/FileWriter.hpp", added "/usr/src/debug/ccache/4.7.2-r0/src/execute.hpp /usr/src/debug/ccache/4.7.2-r0/src/Fd.cpp /usr/src/debug/ccache/4.7.2-r0/src/assertions.cpp /usr/src/debug/ccache/4.7.2-r0/src/argprocessing.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/StatisticsCounters.hpp /usr/src/debug/ccache/4.7.2-r0/src/hashutil.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/TextTable.cpp /usr/src/debug/ccache/4.7.2-r0/src/core/ResultInspector.cpp /usr/src/debu
 g/ccache/4.7.2-r0/src/util/Duration.hpp /usr/src/debug/ccache/4.7.2-r0/src/Digest.hpp /usr/src/debug/ccache/4.7.2-r0/src/ccache.cpp /usr/src/debug/ccache/4.7.2-r0/src/storage/local/CacheFile.cpp /usr/src/debug/ccache/4.7.2-r0/src/util/XXH3_128.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/LockFile.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/StatsLog.cpp /usr/src/debug/ccache/4.7.2-r0/src/Context.cpp /usr/src/debug/ccache/4.7.2-r0/src/argprocessing.cpp /usr/src/debug/ccache/4.7.2-r0/src/Depfile.cpp /usr/src/debug/ccache/4.7.2-r0/src/version.cpp /usr/src/debug/ccache/4.7.2-r0/src/third_party/nonstd/expected.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/path.hpp /usr/src/debug/ccache/4.7.2-r0/src/third_party/base32hex.h /usr/src/debug/ccache/4.7.2-r0/src/storage/local/util.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/XXH3_64.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/Manifest.hpp /usr/src/debug/ccache/4.7.2-r0/src/storage/remote/FileStorage.cpp /usr/src/debug/ccache/4.7.2-r0/src/third_part
 y/xxhash.h /usr/src/debug/ccache/4.7.2-r0/src/language.hpp /usr/src/debug/ccache/4.7.2-r0/src/assertions.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/Statistics.cpp /usr/src/debug/ccache/4.7.2-r0/src/core/CacheEntry.hpp /usr/src/debug/ccache/4.7.2-r0/src/execute.cpp /usr/src/debug/ccache/4.7.2-r0/src/Stat.cpp /usr/src/debug/ccache/4.7.2-r0/src/storage/local/StatsFile.hpp /usr/src/debug/ccache/4.7.2-r0/src/Depfile.hpp /usr/src/debug/ccache/4.7.2-r0/src/Args.hpp /usr/src/debug/ccache/4.7.2-r0/src/storage/local/CacheFile.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/MsvcShowIncludesOutput.hpp /usr/src/debug/ccache/4.7.2-r0/src/NonCopyable.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/ResultRetriever.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/Bytes.cpp /usr/src/debug/ccache/4.7.2-r0/src/File.hpp /usr/src/debug/ccache/4.7.2-r0/src/storage/local/LocalStorage_statistics.cpp /usr/src/debug/ccache/4.7.2-r0/src/util/string.hpp /usr/src/debug/ccache/4.7.2-r0/src/main.cpp /usr/src/debug/ccache/4.7.
 2-r0/src/InodeCache.hpp /usr/src/debug/ccache/4.7.2-r0/src/language.cpp /usr/src/debug/ccache/4.7.2-r0/src/SignalHandler.hpp /usr/src/debug/ccache/4.7.2-r0/src/UmaskScope.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/TimePoint.cpp /usr/src/debug/ccache/4.7.2-r0/src/util/expected.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/Serializer.hpp /usr/src/debug/ccache/4.7.2-r0/src/SignalHandler.cpp /usr/src/debug/ccache/4.7.2-r0/src/core/ResultRetriever.cpp /usr/src/debug/ccache/4.7.2-r0/src/core/MsvcShowIncludesOutput.cpp /usr/src/debug/ccache/4.7.2-r0/src/third_party/url.hpp /usr/src/debug/ccache/4.7.2-r0/src/Fd.hpp /usr/src/debug/ccache/4.7.2-r0/src/storage/local/LocalStorage_compress.cpp /usr/src/debug/ccache/4.7.2-r0/src/Logging.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/Statistic.hpp /usr/src/debug/ccache/4.7.2-r0/src/third_party/xxh_x86dispatch.c /usr/src/debug/ccache/4.7.2-r0/src/core/mainoptions.cpp /usr/src/debug/ccache/4.7.2-r0/src/Context.hpp /usr/src/debug/ccache/4.7.2-r0/src/hash
 util.cpp /usr/src/debug/ccache/4.7.2-r0/src/compopt.hpp /usr/src/debug/ccache/4.7.2-r0/src/third_party/format.cpp /usr/src/debug/ccache/4.7.2-r0/src/TemporaryFile.cpp /usr/src/debug/ccache/4.7.2-r0/src/third_party/url.cpp /usr/src/debug/ccache/4.7.2-r0/src/Args.cpp /usr/src/debug/ccache/4.7.2-r0/src/Hash.cpp /usr/src/debug/ccache/4.7.2-r0/src/core/exceptions.hpp /usr/src/debug/ccache/4.7.2-r0/src/Finalizer.hpp /usr/src/debug/ccache/4.7.2-r0/src/storage/local/StatsFile.cpp /usr/src/debug/ccache/4.7.2-r0/src/util/TextTable.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/LockFile.cpp /usr/src/debug/ccache/4.7.2-r0/src/ProgressBar.cpp /usr/src/debug/ccache/4.7.2-r0/src/core/mainoptions.hpp /usr/src/debug/ccache/4.7.2-r0/src/TemporaryFile.hpp /usr/src/debug/ccache/4.7.2-r0/src/Hash.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/CacheEntryDataWriter.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/zstd.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/CacheEntry.cpp /usr/src/debug/ccache/4.7.2-r0/src/Atomi
 cFile.cpp /usr/src/debug/ccache/4.7.2-r0/src/macroskip.hpp /usr/src/debug/ccache/4.7.2-r0/src/ProgressBar.hpp /usr/src/debug/ccache/4.7.2-r0/src/storage/remote/RemoteStorage.hpp /usr/src/debug/ccache/4.7.2-r0/src/AtomicFile.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/Result.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/Manifest.cpp /usr/src/debug/ccache/4.7.2-r0/src/core/CacheEntryDataReader.hpp /usr/src/debug/ccache/4.7.2-r0/src/Config.cpp /usr/src/debug/ccache/4.7.2-r0/src/ccache.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/ResultExtractor.cpp /usr/src/debug/ccache/4.7.2-r0/src/core/types.cpp /usr/src/debug/ccache/4.7.2-r0/src/storage/local/LocalStorage_cleanup.cpp /usr/src/debug/ccache/4.7.2-r0/src/InodeCache.cpp /usr/src/debug/ccache/4.7.2-r0/src/storage/local/LocalStorage.cpp /usr/src/debug/ccache/4.7.2-r0/src/storage/remote/FileStorage.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/StatisticsCounters.cpp /usr/src/debug/ccache/4.7.2-r0/src/core/Result.cpp /usr/src/debug/ccache/4.7.2-
 r0/src/util/file.hpp /usr/src/debug/ccache/4.7.2-r0/src/storage/remote/RemoteStorage.cpp /usr/src/debug/ccache/4.7.2-r0/src/third_party/xxh_x86dispatch.h /usr/src/debug/ccache/4.7.2-r0/src/third_party/nonstd/span.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/ResultExtractor.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/zstd.cpp /usr/src/debug/ccache/4.7.2-r0/src/core/Sloppiness.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/types.hpp /usr/src/debug/ccache/4.7.2-r0/src/Config.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/file.cpp /usr/src/debug/ccache/4.7.2-r0/src/core/ResultInspector.hpp /usr/src/debug/ccache/4.7.2-r0/src/third_party/httplib.cpp /usr/src/debug/ccache/4.7.2-r0/src/util/path.cpp /usr/src/debug/ccache/4.7.2-r0/src/Util.hpp /usr/src/debug/ccache/4.7.2-r0/src/ArgsInfo.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/Timer.hpp /usr/src/debug/ccache/4.7.2-r0/src/compopt.cpp /usr/src/debug/ccache/4.7.2-r0/src/storage/local/util.cpp /usr/src/debug/ccache/4.7.2-r0/src/core/types.hpp /usr/s
 rc/debug/ccache/4.7.2-r0/src/Logging.cpp /usr/src/debug/ccache/4.7.2-r0/src/util/TimePoint.hpp /usr/src/debug/ccache/4.7.2-r0/src/third_party/base32hex.c /usr/src/debug/ccache/4.7.2-r0/src/Stat.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/Tokenizer.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/Statistics.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/string.cpp /usr/src/debug/ccache/4.7.2-r0/src/storage/local/LocalStorage.hpp /usr/src/debug/ccache/4.7.2-r0/src/util/Bytes.hpp /usr/src/debug/ccache/4.7.2-r0/src/core/StatsLog.hpp /usr/src/debug/ccache/4.7.2-r0/src/Util.cpp /usr/src/debug/ccache/4.7.2-r0/src/storage/remote/HttpStorage.hpp /usr/src/debug/ccache/4.7.2-r0/src/ThreadPool.hpp /usr/src/debug/ccache/4.7.2-r0/src/ThreadPool.cpp /usr/src/debug/ccache/4.7.2-r0/src/storage/remote/HttpStorage.cpp /usr/src/debug/ccache/4.7.2-r0/src/third_party/httplib.h /usr/src/debug/ccache/4.7.2-r0/src/util/Tokenizer.cpp"
packages/core2-32-poky-linux/ccache/ccache-src: PKGV changed from 4.6.3 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/ccache/ccache-src: PV changed from "4.6.3" to "4.7.2"
packages/core2-32-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.6.3 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/ccache/ccache-staticdev: PV changed from "4.6.3" to "4.7.2"
packages/core2-32-poky-linux/ccache/ccache: PKGSIZE changed from 1501220 to 1587236 (+6%)
packages/core2-32-poky-linux/ccache/ccache: PKGV changed from 4.6.3 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/ccache/ccache: PV changed from "4.6.3" to "4.7.2"
packages/core2-32-poky-linux/ccache: PKGV changed from 4.6.3 [default] to 4.7.2 [default]
packages/core2-32-poky-linux/ccache: PV changed from "4.6.3" to "4.7.2"
packages/core2-32-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.6.3/ccache-4.6.3.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch" to "https://github.com/ccache/ccache/releases//download/v4.7.2/ccache-4.7.2.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch"

--===============7986971344610513803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 28061532 to 24714764 (-12%)

--===============7986971344610513803==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.6.3-4.7.2.patch"

RnJvbSBmNGUwNDlmYTc0MzczZWQzNmEzZTAzMzI0YjNmY2QzYmFhYmQxMTUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwNzo0MToxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
YWNoZTogdXBncmFkZSA0LjYuMyAtPiA0LjcuMgoKLS0tCiAuLi4ve2NjYWNoZV80LjYuMy5iYiA9
PiBjY2FjaGVfNC43LjIuYmJ9ICAgICAgfCA5NyArKysrKysrKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgOTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY2NhY2hlL3tjY2FjaGVfNC42LjMuYmIgPT4gY2NhY2hlXzQuNy4yLmJi
fSAoMTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hl
XzQuNi4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC43LjIuYmIK
c2ltaWxhcml0eSBpbmRleCAxNyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nj
YWNoZS9jY2FjaGVfNC42LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2Fj
aGUvY2NhY2hlXzQuNy4yLmJiCmluZGV4IGJjMWJlOTJiZmYuLjQzNGZmZjI5NjYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuNi4zLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuNy4yLmJiCkBAIC0xLDMgKzEsOTYg
QEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRl
ZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBk
YXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdl
cyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMg
KGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMK
KyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLmFkb2MKKyMgKysrIExJQ0VOU0UuYWRv
YworIyBAQCAtNTE2LDEzICs1MTYsMTMgQEAKKyMgID09PSBzcmMvdGhpcmRfcGFydHkvaHR0cGxp
Yi4qCisjICAKKyMgIGNwcC1odHRwbGliIC0gQSBDKysxMSBjcm9zcy1wbGF0Zm9ybSBIVFRQL0hU
VFBTIGxpYnJhcnkuIENvcGllZCBmcm9tIGNwcC1odHRwbGliCisjIC12MC4xMC4yIGRvd25sb2Fk
ZWQgZnJvbSBodHRwczovL2dpdGh1Yi5jb20veWhpcm9zZS9jcHAtaHR0cGxpYltjcHAtaHR0cGxp
Yl0uIFRoZQorIyArdjAuMTEuMSBkb3dubG9hZGVkIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL3lo
aXJvc2UvY3BwLWh0dHBsaWJbY3BwLWh0dHBsaWJdLiBUaGUKKyMgIGxpYnJhcnkgaGFzIHRoZSBm
b2xsb3dpbmcgbGljZW5zZToKKyMgIAorIyAgLS0tLQorIyAgVGhlIE1JVCBMaWNlbnNlIChNSVQp
CisjICAKKyMgLUNvcHlyaWdodCAoYykgMjAyMSB5aGlyb3NlCisjICtDb3B5cmlnaHQgKGMpIDIw
MjIgeWhpcm9zZQorIyAgCisjICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9m
IGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjICBvZiB0aGlzIHNvZnR3
YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwg
dG8gZGVhbAorIyBAQCAtNTc3LDggKzU3Nyw4IEBACisjICA9PT0gc3JjL3RoaXJkX3BhcnR5L25v
bnN0ZC9leHBlY3RlZC5ocHAKKyMgIAorIyAgVGhpcyBpcyB0aGUgc2luZ2xlIGhlYWRlciB2ZXJz
aW9uIG9mCisjIC1odHRwczovL2dpdGh1Yi5jb20vbWFydGlubW9lbmUvZXhwZWN0ZWQtbGl0ZVtl
eHBlY3RlZC1saXRlXSByZXZpc2lvbgorIyAtM2FiZjA2ODIxZDQ4OWQ1NmFhOWM2MGVjY2Y4YWFi
NzBkNjdkMTU4YiB3aXRoIHRoZSBmb2xsb3dpbmcgbGljZW5zZToKKyMgK2h0dHBzOi8vZ2l0aHVi
LmNvbS9tYXJ0aW5tb2VuZS9leHBlY3RlZC1saXRlW2V4cGVjdGVkLWxpdGVdIDAuNi4yIHdpdGgg
dGhlCisjICtmb2xsb3dpbmcgbGljZW5zZToKKyMgIAorIyAgLS0tLQorIyAgQ29weXJpZ2h0IChj
KSAyMDE2LTIwMjAgTWFydGluIE1vZW5lCisjIEBAIC02MDksNDkgKzYwOSwxNCBAQAorIyAgLS0t
LQorIyAgCisjICAKKyMgLT09PSBzcmMvdGhpcmRfcGFydHkvbm9uc3RkL29wdGlvbmFsLmhwcAor
IyArPT09IHNyYy90aGlyZF9wYXJ0eS9ub25zdGQvc3Bhbi5ocHAKKyMgIAorIyAgVGhpcyBpcyB0
aGUgc2luZ2xlIGhlYWRlciB2ZXJzaW9uIG9mCisjIC1odHRwczovL2dpdGh1Yi5jb20vbWFydGlu
bW9lbmUvb3B0aW9uYWwtbGl0ZVtvcHRpb25hbC1saXRlXSAzLjUuMCB3aXRoIHRoZQorIyAraHR0
cHM6Ly9naXRodWIuY29tL21hcnRpbm1vZW5lL3NwYW4tbGl0ZVtleHBlY3RlZC1saXRlXSAwLjEw
LjMgd2l0aCB0aGUKKyMgIGZvbGxvd2luZyBsaWNlbnNlOgorIyAgCisjICAtLS0tCisjIC1Db3B5
cmlnaHQgKGMpIDIwMTQtMjAyMSBNYXJ0aW4gTW9lbmUKKyMgLQorIyAtQm9vc3QgU29mdHdhcmUg
TGljZW5zZSAtIFZlcnNpb24gMS4wIC0gQXVndXN0IDE3dGgsIDIwMDMKKyMgLQorIyAtUGVybWlz
c2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb3Ig
b3JnYW5pemF0aW9uCisjIC1vYnRhaW5pbmcgYSBjb3B5IG9mIHRoZSBzb2Z0d2FyZSBhbmQgYWNj
b21wYW55aW5nIGRvY3VtZW50YXRpb24gY292ZXJlZCBieQorIyAtdGhpcyBsaWNlbnNlICh0aGUg
IlNvZnR3YXJlIikgdG8gdXNlLCByZXByb2R1Y2UsIGRpc3BsYXksIGRpc3RyaWJ1dGUsCisjIC1l
eGVjdXRlLCBhbmQgdHJhbnNtaXQgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcHJlcGFyZSBkZXJpdmF0
aXZlIHdvcmtzIG9mIHRoZQorIyAtU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgdGhpcmQtcGFydGll
cyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8KKyMgLWRvIHNvLCBhbGwgc3Vi
amVjdCB0byB0aGUgZm9sbG93aW5nOgorIyAtCisjIC1UaGUgY29weXJpZ2h0IG5vdGljZXMgaW4g
dGhlIFNvZnR3YXJlIGFuZCB0aGlzIGVudGlyZSBzdGF0ZW1lbnQsIGluY2x1ZGluZworIyAtdGhl
IGFib3ZlIGxpY2Vuc2UgZ3JhbnQsIHRoaXMgcmVzdHJpY3Rpb24gYW5kIHRoZSBmb2xsb3dpbmcg
ZGlzY2xhaW1lciwKKyMgLW11c3QgYmUgaW5jbHVkZWQgaW4gYWxsIGNvcGllcyBvZiB0aGUgU29m
dHdhcmUsIGluIHdob2xlIG9yIGluIHBhcnQsIGFuZAorIyAtYWxsIGRlcml2YXRpdmUgd29ya3Mg
b2YgdGhlIFNvZnR3YXJlLCB1bmxlc3Mgc3VjaCBjb3BpZXMgb3IgZGVyaXZhdGl2ZQorIyAtd29y
a3MgYXJlIHNvbGVseSBpbiB0aGUgZm9ybSBvZiBtYWNoaW5lLWV4ZWN1dGFibGUgb2JqZWN0IGNv
ZGUgZ2VuZXJhdGVkIGJ5CisjIC1hIHNvdXJjZSBsYW5ndWFnZSBwcm9jZXNzb3IuCisjIC0KKyMg
LVRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFO
WSBLSU5ELCBFWFBSRVNTIE9SCisjIC1JTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVE
IFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyMgLUZJVE5FU1MgRk9SIEEg
UEFSVElDVUxBUiBQVVJQT1NFLCBUSVRMRSBBTkQgTk9OLUlORlJJTkdFTUVOVC4gSU4gTk8gRVZF
TlQKKyMgLVNIQUxMIFRIRSBDT1BZUklHSFQgSE9MREVSUyBPUiBBTllPTkUgRElTVFJJQlVUSU5H
IFRIRSBTT0ZUV0FSRSBCRSBMSUFCTEUKKyMgLUZPUiBBTlkgREFNQUdFUyBPUiBPVEhFUiBMSUFC
SUxJVFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLAorIyAtQVJJU0lO
RyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUg
VVNFIE9SIE9USEVSCisjIC1ERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCisjIC0tLS0tCisjIC0K
KyMgLQorIyAtPT09IHNyYy90aGlyZF9wYXJ0eS9ub25zdGQvc3RyaW5nX3ZpZXcuaHBwCisjIC0K
KyMgLVRoaXMgYWx0ZXJuYXRpdmUgaW1wbGVtZW50YXRpb24gb2YgYHN0ZDo6c3RyaW5nX3ZpZXdg
IHdhcyBkb3dubG9hZGVkIGZyb20KKyMgLTxodHRwczovL2dpdGh1Yi5jb20vbWFydGlubW9lbmUv
c3RyaW5nLXZpZXctbGl0ZT4gYW5kIGhhcyB0aGUgZm9sbG93aW5nIGxpY2Vuc2UKKyMgLXRleHQ6
CisjIC0KKyMgLS0tLS0KKyMgLUNvcHlyaWdodCAyMDE3LTIwMjAgYnkgTWFydGluIE1vZW5lCisj
ICtDb3B5cmlnaHQgKGMpIDIwMTgtMjAyMSBNYXJ0aW4gTW9lbmUKKyMgIAorIyAgQm9vc3QgU29m
dHdhcmUgTGljZW5zZSAtIFZlcnNpb24gMS4wIC0gQXVndXN0IDE3dGgsIDIwMDMKKyMgIAorIyAK
KyMKKwogU1VNTUFSWSA9ICJhIGZhc3QgQy9DKysgY29tcGlsZXIgY2FjaGUiCiBERVNDUklQVElP
TiA9ICJjY2FjaGUgaXMgYSBjb21waWxlciBjYWNoZS4gSXQgc3BlZWRzIHVwIHJlY29tcGlsYXRp
b24gXAogYnkgY2FjaGluZyB0aGUgcmVzdWx0IG9mIHByZXZpb3VzIGNvbXBpbGF0aW9ucyBhbmQg
ZGV0ZWN0aW5nIHdoZW4gdGhlIFwKQEAgLTcsMTQgKzEwMCwxNCBAQCBIT01FUEFHRSA9ICJodHRw
Oi8vY2NhY2hlLnNhbWJhLm9yZyIKIFNFQ1RJT04gPSAiZGV2ZWwiCiAKIExJQ0VOU0UgPSAiR1BM
LTMuMC1vci1sYXRlciIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuYWRvYztt
ZDU9N2ExOTM3N2EwMjc0OWQ4YTEyODFlZDYwODE2OWIwZWUiCitMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9MSUNFTlNFLmFkb2M7bWQ1PThmYzJjYWUyYmJhYmViOTIzNmNhY2ZhMWM4M2EzZGM1
IgogCiBERVBFTkRTID0gInpzdGQiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rv
d25sb2FkL3Yke1BWfS8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS14eGhh
c2guaC1GaXgtYnVpbGQtd2l0aC1nY2MtMTIucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZjQ2YmEzNzA2YWQ4MGMzMGQ0ZDU4NzRkZWUyYmY5MjI3YTdmY2QwY2Nh
YWMzMWI1MTkxOWEzMDUzZDg0YmQwNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2YjM0NmY0NDEz
NDJhMjVhNmMxZDdlMDEwOTU3YTU5M2Y0MTZlOTRiNWQ2NmZkZjJlMjk5Mjk1M2IzODYwYjlkIgog
CiBpbmhlcml0IGNtYWtlIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjMxLjEKCg==

--===============7986971344610513803==--

