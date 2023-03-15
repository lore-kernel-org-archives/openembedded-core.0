Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AB0C87FDE
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.12291.1678895725245672049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZLquZhuR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010186e5fbb71a-dcf53a0b-f35b-4cfb-a23b-ae0f9982c66a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895724;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zebqcG+WqTOfGsrvUE+AiD+ZRXgZDadE+oy0AoRq/+c=;
	b=ZLquZhuRIC5zG3y/eZwW7i6JxcZIu7ewQmdF1N95aBkEgc2s7tvFvuP7Jo3ULPuU
	DK8Y0w/HHqWZb/cdsV5ZdVmxi0OgJBRy8gPv8yXCHRGTJnY4vhgmw0EK8MGpvXHgUTc
	J/s4dytbJ7haJX3+FX1UvIy17aaOi17fnw8oJ2EY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895724;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zebqcG+WqTOfGsrvUE+AiD+ZRXgZDadE+oy0AoRq/+c=;
	b=JXSOuU6ozuyshGjar13iaAdzDOKNveQDM6H3oj7JcDrRc7f+a547387UlpAjeG6H
	HyVMSRE7hlV0NRx+F1VePUQgmpUOrnlRTSwOH72PcM6/poJ8j4QKOgRF7BgWtJ53roN
	5ttZ38b2eod455EfrvQ2SyKOBa5hFUoE1AP4Xl4I=
Content-Type: multipart/mixed; boundary="===============3425018066531395569=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.8 SUCCEEDED
Message-ID: <01010186e5fbb71a-dcf53a0b-f35b-4cfb-a23b-ae0f9982c66a-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178587

--===============3425018066531395569==
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
--===============3425018066531395569==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.7.4-4.8.patch"

RnJvbSAwYzlmOWNhZGExZDcwMzQyYTQ2ZjcyN2NkZDBhNGYyYzcwZWM2YTM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDc6MjY6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC43LjQgLT4gNC44CgotLS0KIC4uLi9jY2FjaGUve2NjYWNoZV80Ljcu
NC5iYiA9PiBjY2FjaGVfNC44LmJifSB8IDM1ICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9jY2FjaGUve2NjYWNoZV80LjcuNC5iYiA9PiBjY2FjaGVfNC44LmJifSAo
NDMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQu
Ny40LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC44LmJiCnNpbWls
YXJpdHkgaW5kZXggNDMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUv
Y2NhY2hlXzQuNy40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2Nj
YWNoZV80LjguYmIKaW5kZXggMDQxOWQwN2M0ZS4uZTAyYWVlZDMzYSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC43LjQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC44LmJiCkBAIC0xLDMgKzEsMzQgQEAKKyMgRklY
TUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2
dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBM
SUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0
aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6
ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNo
YW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLmFkb2MKKyMgKysrIExJQ0VOU0UuYWRvYworIyBAQCAt
MzUsNyArMzUsNyBAQAorIyAgCisjICAtLS0tCisjICBDb3B5cmlnaHQgKEMpIDIwMDItMjAwNyBB
bmRyZXcgVHJpZGdlbGwKKyMgLUNvcHlyaWdodCAoQykgMjAwOS0yMDIyIEpvZWwgUm9zZGFobCBh
bmQgb3RoZXIgY29udHJpYnV0b3JzCisjICtDb3B5cmlnaHQgKEMpIDIwMDktMjAyMyBKb2VsIFJv
c2RhaGwgYW5kIG90aGVyIGNvbnRyaWJ1dG9ycworIyAgLS0tLQorIyAgCisjICAKKyMgQEAgLTQx
Miw3ICs0MTIsNyBAQAorIyAgPT09IHNyYy90aGlyZF9wYXJ0eS9kb2N0ZXN0LmgKKyMgIAorIyAg
VGhpcyBpcyB0aGUgc2luZ2xlIGhlYWRlciB2ZXJzaW9uIG9mIGh0dHBzOi8vZ2l0aHViLmNvbS9v
bnF0YW0vZG9jdGVzdFtkb2N0ZXN0XQorIyAtMi40Ljggd2l0aCB0aGUgZm9sbG93aW5nIGxpY2Vu
c2U6CisjICsyLjQuMTAgd2l0aCB0aGUgZm9sbG93aW5nIGxpY2Vuc2U6CisjICAKKyMgIC0tLS0K
KyMgIFRoZSBNSVQgTGljZW5zZSAoTUlUKQorIyAKKyMKKwogU1VNTUFSWSA9ICJhIGZhc3QgQy9D
KysgY29tcGlsZXIgY2FjaGUiCiBERVNDUklQVElPTiA9ICJjY2FjaGUgaXMgYSBjb21waWxlciBj
YWNoZS4gSXQgc3BlZWRzIHVwIHJlY29tcGlsYXRpb24gXAogYnkgY2FjaGluZyB0aGUgcmVzdWx0
IG9mIHByZXZpb3VzIGNvbXBpbGF0aW9ucyBhbmQgZGV0ZWN0aW5nIHdoZW4gdGhlIFwKQEAgLTcs
MTQgKzM4LDE0IEBAIEhPTUVQQUdFID0gImh0dHA6Ly9jY2FjaGUuc2FtYmEub3JnIgogU0VDVElP
TiA9ICJkZXZlbCIKIAogTElDRU5TRSA9ICJHUEwtMy4wLW9yLWxhdGVyIgotTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRS5hZG9jO21kNT04ZmMyY2FlMmJiYWJlYjkyMzZjYWNmYTFj
ODNhM2RjNSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuYWRvYzttZDU9NDNh
MDJiNzRjOWViNzNhMGI5NzhhZTUwODJmNWYxYjYiCiAKIERFUEVORFMgPSAienN0ZCIKIAogU1JD
X1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7QlB9LnRhci5neiBc
CiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXh4aGFzaC5oLUZpeC1idWlsZC13aXRoLWdjYy0xMi5w
YXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkYzI4MzkwNmI3M2Jk
N2M0NjExNzhjYTQ3MmE0NTllOWQ4NmI1NTIzNDA1MDM1OTIxYmQ4MjA0ZTc3NjIwMjY0IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImFjNGIwMTc0OGZkNTljZmUwN2UwNzBjMzQ0MzJiOTFiZGQwZmQ4
NjQwZTFlNjUzYTgwYjAxZDZhNTIzMTg2YjAiCiAKIGluaGVyaXQgY21ha2UgZ2l0aHViLXJlbGVh
c2VzCiAKLS0gCjIuMzkuMgoK

--===============3425018066531395569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ccache/ccache-dbg: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache-dbg: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 24683464 to 25637556 (+4%)
packages/core2-32-poky-linux/ccache/ccache-dev: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache-dev: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache-doc: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache-doc: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache-locale: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache-locale: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache-src: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache-src: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.7.4-r0/src/storage -> /usr/src/debug/ccache/4.8-r0/src/storage, directory renamed /usr/src/debug/ccache/4.7.4-r0/src/third_party/fmt -> /usr/src/debug/ccache/4.8-r0/src/third_party/fmt, directory renamed /usr/src/debug/ccache/4.7.4-r0/src/third_party/nonstd -> /usr/src/debug/ccache/4.8-r0/src/third_party/nonstd, directory renamed /usr/src/debug/ccache/4.7.4-r0/src -> /usr/src/debug/ccache/4.8-r0/src, directory renamed /usr/src/debug/ccache/4.7.4-r0/src/third_party/blake3 -> /usr/src/debug/ccache/4.8-r0/src/third_party/blake3, directory renamed /usr/src/debug/ccache/4.7.4-r0/src/third_party -> /usr/src/debug/ccache/4.8-r0/src/third_party, directory renamed /usr/src/debug/ccache/4.7.4-r0/src/storage/remote -> /usr/src/debug/ccache/4.8-r0/src/storage/remote, removed "/usr/src/debug/ccache/4.7.4-r0/src/core/Result.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/Result.hpp /usr/src/debug/ccache
 /4.7.4-r0/src/core/Statistic.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/ResultExtractor.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/ResultRetriever.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/ResultInspector.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/path.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/Manifest.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/TimePoint.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/Timer.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/CacheEntry.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/Statistics.hpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/StatsFile.cpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/CacheFile.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/Duration.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/Bytes.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/Bytes.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/Manifest.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/TimePoint.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/ResultExtractor.hpp /usr/src/debug/ccache/
 4.7.4-r0/src/core/ResultRetriever.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/Serializer.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/StatisticsCounters.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/LockFile.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/Tokenizer.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/string.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/string.hpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/CacheFile.hpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/StatsFile.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/exceptions.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/types.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/types.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/CacheEntryDataReader.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/types.hpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/LocalStorage_cleanup.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/CacheEntryDataWriter.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/XXH3_128.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/Stat
 isticsCounters.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/StatsLog.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/mainoptions.hpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/LocalStorage_compress.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/file.cpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/util.cpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/util.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/TextTable.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/expected.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/StatsLog.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/LockFile.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/MsvcShowIncludesOutput.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/MsvcShowIncludesOutput.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/ResultInspector.hpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/LocalStorage.cpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/LocalStorage.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/Tokenizer.hpp /usr/src/debug/ccache/4.7.4-r0/src/u
 til/zstd.hpp /usr/src/debug/ccache/4.7.4-r0/src/storage/local/LocalStorage_statistics.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/XXH3_64.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/file.hpp /usr/src/debug/ccache/4.7.4-r0/src/core/Sloppiness.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/path.hpp /usr/src/debug/ccache/4.7.4-r0/src/util/TextTable.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/mainoptions.cpp /usr/src/debug/ccache/4.7.4-r0/src/util/zstd.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/Statistics.cpp /usr/src/debug/ccache/4.7.4-r0/src/core/CacheEntry.cpp", added "/usr/src/debug/ccache/4.8-r0/src/core/FileRecompressor.cpp /usr/src/debug/ccache/4.8-r0/src/core/FileRecompressor.hpp /usr/src/debug/ccache/4.8-r0/src/core/Manifest.cpp /usr/src/debug/ccache/4.8-r0/src/core/CacheEntry.hpp /usr/src/debug/ccache/4.8-r0/src/core/Manifest.hpp /usr/src/debug/ccache/4.8-r0/src/core/exceptions.hpp /usr/src/debug/ccache/4.8-r0/src/util/file.cpp /usr/src/debug/ccache/4.8-r0/src/util/TimePoint.cpp
  /usr/src/debug/ccache/4.8-r0/src/util/path.hpp /usr/src/debug/ccache/4.8-r0/src/util/Tokenizer.cpp /usr/src/debug/ccache/4.8-r0/src/util/XXH3_64.hpp /usr/src/debug/ccache/4.8-r0/src/core/mainoptions.hpp /usr/src/debug/ccache/4.8-r0/src/storage/local/LocalStorage.cpp /usr/src/debug/ccache/4.8-r0/src/storage/local/StatsFile.cpp /usr/src/debug/ccache/4.8-r0/src/core/ResultInspector.hpp /usr/src/debug/ccache/4.8-r0/src/core/CacheEntryDataReader.hpp /usr/src/debug/ccache/4.8-r0/src/util/file.hpp /usr/src/debug/ccache/4.8-r0/src/util/string.cpp /usr/src/debug/ccache/4.8-r0/src/util/XXH3_128.hpp /usr/src/debug/ccache/4.8-r0/src/core/mainoptions.cpp /usr/src/debug/ccache/4.8-r0/src/core/types.cpp /usr/src/debug/ccache/4.8-r0/src/core/Result.hpp /usr/src/debug/ccache/4.8-r0/src/core/Statistics.cpp /usr/src/debug/ccache/4.8-r0/src/core/CacheEntry.cpp /usr/src/debug/ccache/4.8-r0/src/core/Serializer.hpp /usr/src/debug/ccache/4.8-r0/src/util/LongLivedLockFileManager.cpp /usr/src/debug/ccache/4
 .8-r0/src/util/LongLivedLockFileManager.hpp /usr/src/debug/ccache/4.8-r0/src/core/StatsLog.cpp /usr/src/debug/ccache/4.8-r0/src/core/StatisticsCounters.hpp /usr/src/debug/ccache/4.8-r0/src/core/StatsLog.hpp /usr/src/debug/ccache/4.8-r0/src/util/Tokenizer.hpp /usr/src/debug/ccache/4.8-r0/src/util/BitSet.hpp /usr/src/debug/ccache/4.8-r0/src/util/Timer.hpp /usr/src/debug/ccache/4.8-r0/src/storage/local/util.cpp /usr/src/debug/ccache/4.8-r0/src/util/path.cpp /usr/src/debug/ccache/4.8-r0/src/util/TextTable.cpp /usr/src/debug/ccache/4.8-r0/src/util/string.hpp /usr/src/debug/ccache/4.8-r0/src/core/types.hpp /usr/src/debug/ccache/4.8-r0/src/util/types.hpp /usr/src/debug/ccache/4.8-r0/src/util/Duration.hpp /usr/src/debug/ccache/4.8-r0/src/util/zstd.hpp /usr/src/debug/ccache/4.8-r0/src/core/Statistics.hpp /usr/src/debug/ccache/4.8-r0/src/core/ResultRetriever.cpp /usr/src/debug/ccache/4.8-r0/src/core/ResultRetriever.hpp /usr/src/debug/ccache/4.8-r0/src/core/StatisticsCounters.cpp /usr/src/debu
 g/ccache/4.8-r0/src/util/Bytes.cpp /usr/src/debug/ccache/4.8-r0/src/util/expected.hpp /usr/src/debug/ccache/4.8-r0/src/storage/local/util.hpp /usr/src/debug/ccache/4.8-r0/src/util/LockFile.cpp /usr/src/debug/ccache/4.8-r0/src/util/LockFile.hpp /usr/src/debug/ccache/4.8-r0/src/util/TextTable.hpp /usr/src/debug/ccache/4.8-r0/src/core/MsvcShowIncludesOutput.cpp /usr/src/debug/ccache/4.8-r0/src/core/Statistic.hpp /usr/src/debug/ccache/4.8-r0/src/util/zstd.cpp /usr/src/debug/ccache/4.8-r0/src/util/TimePoint.hpp /usr/src/debug/ccache/4.8-r0/src/storage/local/StatsFile.hpp /usr/src/debug/ccache/4.8-r0/src/core/MsvcShowIncludesOutput.hpp /usr/src/debug/ccache/4.8-r0/src/storage/local/LocalStorage.hpp /usr/src/debug/ccache/4.8-r0/src/core/ResultExtractor.cpp /usr/src/debug/ccache/4.8-r0/src/core/ResultExtractor.hpp /usr/src/debug/ccache/4.8-r0/src/core/Result.cpp /usr/src/debug/ccache/4.8-r0/src/util/Bytes.hpp /usr/src/debug/ccache/4.8-r0/src/core/ResultInspector.cpp /usr/src/debug/ccache/4.
 8-r0/src/core/Sloppiness.hpp /usr/src/debug/ccache/4.8-r0/src/core/CacheEntryDataWriter.hpp"
packages/core2-32-poky-linux/ccache/ccache-src: PKGSIZE changed from 1870304 to 1911250 (+2%)
packages/core2-32-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache-staticdev: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache/ccache: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache/ccache: PKGSIZE changed from 1583140 to 1648676 (+4%)
packages/core2-32-poky-linux/ccache: PKGV changed from 4.7.4 [default] to 4.8 [default]
packages/core2-32-poky-linux/ccache: PV changed from "4.7.4" to "4.8"
packages/core2-32-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.7.4/ccache-4.7.4.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch" to "https://github.com/ccache/ccache/releases//download/v4.8/ccache-4.8.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch"

--===============3425018066531395569==--

