Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06885CD3436
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:26:00 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15617.1777645535643143513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=awf1qRi+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nvKA8BK7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019de3ee80d2-545cfd3f-7433-4071-b088-5ded356e0fae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o7Lb2HD8/X7Oglahj1NIDDYTohMncZFlUjxeD5/iG80=;
	b=awf1qRi+YkKozwTbHYBjvCtibz+8Mp9ilqArRbNtD0gqe227YCpQAGSD4DoG8yLm
	t4aYVnOIOPkPZz32QuxKkfaHvnmWWmnXScGp/Gm2RlHdcCUMPv9sKEmQqVvtoAjhfhW
	mQUyMUktssGYEpVa/ZTeIFQDv7FL4ZSYOQt+9DSg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o7Lb2HD8/X7Oglahj1NIDDYTohMncZFlUjxeD5/iG80=;
	b=nvKA8BK7wBDoPcxgrn3RwFZewDlxasM3Ope3Uz00NjO2DG9otGemPWLG8w042Cag
	tE1SyRedsnYaJ0AmDbCJ9FumIG+V/hHLgZFytLt5KygOm4VYVjjf0M7uGDzkfjUsK3R
	x/5BVrdMN/039rn3r0mNyYNU9k3U62wHHG4ZSUSI=
Content-Type: multipart/mixed; boundary="===============7139059503214894397=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 f9b160340bf3066313825c119710c9f51e75edd8 SUCCEEDED
Message-ID: <0101019de3ee80d2-545cfd3f-7433-4071-b088-5ded356e0fae-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236279

--===============7139059503214894397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *f9b160340bf3066313825c119710c9f51e75edd8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-samples-upgrade-to-latest-revision.patch
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

-- >8 --
From e1f31d03c4d99f171401c98a3f6285c9f797f607 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 12:40:19 +0000
Subject: [PATCH] vulkan-samples: upgrade to latest revision

---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index f3997c4e32..dd7b151aa5 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "fa2cf45adde08778d1e8f885f21f934f56d9eb58"
+SRCREV = "f9b160340bf3066313825c119710c9f51e75edd8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 
-- 
2.47.1


--===============7139059503214894397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/vulkan-samples (sysroot):
  /usr/include/vgf was added
  /usr/include/vgf/decoder.h was added
  /usr/include/vgf/decoder.hpp was added
  /usr/include/vgf/encoder.hpp was added
  /usr/include/vgf/logging.h was added
  /usr/include/vgf/logging.hpp was added
  /usr/include/vgf/types.hpp was added
  /usr/include/vgf-utils was added
  /usr/include/vgf-utils/memory_map.hpp was added
  /usr/include/vgf-utils/numpy.hpp was added
  /usr/include/vgf-utils/temp_folder.hpp was added
  /usr/include/vgf/vulkan_helpers.generated.hpp was added
  /usr/lib/libvgf.a was added
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-dev: FILELIST: added "/usr/include/vgf/decoder.h /usr/include/vgf/logging.h /usr/include/vgf/types.hpp /usr/include/vgf/vulkan_helpers.generated.hpp /usr/include/vgf-utils/memory_map.hpp /usr/include/vgf/decoder.hpp /usr/include/vgf/encoder.hpp /usr/include/vgf/logging.hpp /usr/include/vgf-utils/temp_folder.hpp /usr/include/vgf-utils/numpy.hpp"
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-src: PKGSIZE changed from 3441464 to 3787539 (+10%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-staticdev: FILELIST: added "/usr/lib/libvgf.a"

--===============7139059503214894397==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-samples-upgrade-to-latest-revision.patch"

RnJvbSBlMWYzMWQwM2M0ZDk5ZjE3MTQwMWM5OGEzZjYyODVjOWY3OTdmNjA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMjo0MDoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1zYW1wbGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBsZXNfZ2l0LmJiIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tc2FtcGxlc19naXQuYmIKaW5kZXggZjM5OTdjNGUz
Mi4uZGQ3YjE1MWFhNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92
dWxrYW4tc2FtcGxlc19naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92
dWxrYW4tc2FtcGxlc19naXQuYmIKQEAgLTksNyArOSw3IEBAIFNSQ19VUkkgPSAiZ2l0c206Ly9n
aXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tU2FtcGxlcy5naXQ7YnJhbmNoPW1haW47cHJv
dG9jCiAgICAgICAgICAgICIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgotU1JDUkVW
ID0gImZhMmNmNDVhZGRlMDg3NzhkMWU4Zjg4NWYyMWY5MzRmNTZkOWViNTgiCitTUkNSRVYgPSAi
ZjliMTYwMzQwYmYzMDY2MzEzODI1YzExOTcxMGM5ZjUxZTc1ZWRkOCIKIAogVVBTVFJFQU1fQ0hF
Q0tfR0lUVEFHUkVHRVggPSAiVGhlc2UgYXJlIG5vdCB0aGUgcmVsZWFzZXMgeW91J3JlIGxvb2tp
bmcgZm9yIgogCi0tIAoyLjQ3LjEKCg==

--===============7139059503214894397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 62 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host arm-poky-linux-musleabi (not in COMPATIBLE_HOST)

--===============7139059503214894397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86-64-v3-poky-linux/vulkan-samples (sysroot):
  /usr/include/vgf was added
  /usr/include/vgf/decoder.h was added
  /usr/include/vgf/decoder.hpp was added
  /usr/include/vgf/encoder.hpp was added
  /usr/include/vgf/logging.h was added
  /usr/include/vgf/logging.hpp was added
  /usr/include/vgf/types.hpp was added
  /usr/include/vgf-utils was added
  /usr/include/vgf-utils/memory_map.hpp was added
  /usr/include/vgf-utils/numpy.hpp was added
  /usr/include/vgf-utils/temp_folder.hpp was added
  /usr/include/vgf/vulkan_helpers.generated.hpp was added
  /usr/lib/libvgf.a was added
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-dev: FILELIST: added "/usr/include/vgf-utils/memory_map.hpp /usr/include/vgf-utils/temp_folder.hpp /usr/include/vgf/encoder.hpp /usr/include/vgf/decoder.hpp /usr/include/vgf/decoder.h /usr/include/vgf/logging.h /usr/include/vgf/logging.hpp /usr/include/vgf-utils/numpy.hpp /usr/include/vgf/types.hpp /usr/include/vgf/vulkan_helpers.generated.hpp"
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-dev: PKGSIZE changed from 1524945 to 1655483 (+9%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-src: FILELIST: added "/usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/src/logging_c_api.cpp /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/include-c/vgf/logging.h /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/src/internal_logging.hpp /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/src/header.hpp /usr/src/debug/vulkan-samples/git/third_party/flatbuffers/include/flatbuffers/flatbuffer_builder.h /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/src/logging.cpp /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/include/vgf/logging.hpp /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/include/vgf/decoder.hpp /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/schema/vgf_generated.h /usr/src/debug/vulkan-samples/git/third_party/flatbuffers/include/flatbuffers/vector.h /usr/src/debu
 g/vulkan-samples/git/third_party/flatbuffers/include/flatbuffers/table.h /usr/src/debug/vulkan-samples/git/third_party/flatbuffers/include/flatbuffers/allocator.h /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/include-c/vgf/decoder.h /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/include/vgf/encoder.hpp /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/src/internal_types.hpp /usr/src/debug/vulkan-samples/git/third_party/flatbuffers/include/flatbuffers/base.h /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/src/section_index_table.hpp /usr/src/debug/vulkan-samples/git/third_party/flatbuffers/include/flatbuffers/verifier.h /usr/src/debug/vulkan-samples/git/third_party/flatbuffers/include/flatbuffers/string.h /usr/src/debug/vulkan-samples/git/third_party/flatbuffers/include/flatbuffers/default_allocator.h /usr/src/debug/vulkan-samples/git/third_party/flatbuffers/include/flatbuffers/vector_downward.h /usr/src
 /debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/src/encoder.cpp /usr/src/debug/vulkan-samples/git/third_party/flatbuffers/include/flatbuffers/detached_buffer.h /usr/src/debug/vulkan-samples/git/third_party/flatbuffers/include/flatbuffers/stl_emulation.h /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/include/vgf/types.hpp /usr/src/debug/vulkan-samples/git/third_party/flatbuffers/include/flatbuffers/buffer.h /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/src/decoder.cpp /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/src/constant.hpp /usr/src/debug/vulkan-samples/git/third_party/ai-ml-sdk-vgf-library/src/decoder_c_api.cpp"
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-src: PKGSIZE changed from 3441464 to 3787539 (+10%)
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-staticdev: FILELIST: added "/usr/lib/libvgf.a"
packages/x86-64-v3-poky-linux/vulkan-samples/vulkan-samples-staticdev: PKGSIZE changed from 65330984 to 67884620 (+4%)

--===============7139059503214894397==--

