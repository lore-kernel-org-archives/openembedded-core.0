Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269AEEEEC26
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:02 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.29467.1694804393872330060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cx5rAsuw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cWLSucsA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a9a36c46a-8fc77450-3772-4a30-acc6-ee5b1ac71e9d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ItCFkimbKO9ipU0vJSbFmrJUCbXbjGIX6LmSo3IUXpY=;
	b=cx5rAsuw9pn/AlsHbpebGmfqv7z5oz52Ql5o9TzgVpNmAiQFIYhLLLmDYwBEnuVA
	mZMTFAzoVWlOHH1zhgb1Ld4XPvUbCA38tmLUAtR1S3ju8MT0SWUx0Ak44mND5qYJXOl
	DmY959j6F8wnf9ukA0zSPoJl3ESOxw9ubT8pbEGg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ItCFkimbKO9ipU0vJSbFmrJUCbXbjGIX6LmSo3IUXpY=;
	b=cWLSucsAEolq8cDu/133F8iJFwXYFPvgpl8TlrrMiplADHfHeZX7Tin3JqBHAVd3
	NYg9jn9OlF0UCwL0miKkqY4LA1VjU1/BJIoSy8bLph3elY4skcSn/V6vb2v8ZztZBg2
	vNXObE9MtupJqsEUjdodW86hVFPFlsKGzrXO1R9Y=
Content-Type: multipart/mixed; boundary="===============4378345824573244923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 01d183fbb50603e5f0adcb2dbe9b02b44677a18a FAILED
Message-ID: <0101018a9a36c46a-8fc77450-3772-4a30-acc6-ee5b1ac71e9d-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187746

--===============4378345824573244923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *01d183fbb50603e5f0adcb2dbe9b02b44677a18a* has Failed(do_compile).

Detailed error information:

do_compile failed



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
From 44aa4d95449ab8943c6e8d7b409fed1d44bba306 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 15:50:10 +0000
Subject: [PATCH] vulkan-samples: upgrade to latest revision

---
 .../0001-Deprecate-u8string_view.patch        |  59 ----------
 ...ot-use-LFS64-functions-on-linux-musl.patch |  37 -------
 ...002-Committing-changes-from-do_patch.patch |  16 +++
 .../vulkan/vulkan-samples/32bit.patch         | 101 ------------------
 .../vulkan/vulkan-samples_git.bb              |   6 +-
 5 files changed, 18 insertions(+), 201 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-Deprecate-u8string_view.patch
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0002-Committing-changes-from-do_patch.patch
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/32bit.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-Deprecate-u8string_view.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-Deprecate-u8string_view.patch
deleted file mode 100644
index c2304bdd48..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-Deprecate-u8string_view.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 93987b1ce7d6f91387202495aac61026070597df Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Jan 2023 21:37:52 -0800
-Subject: [PATCH] Deprecate u8string_view
-
-Use basic_string_view instead
-
-Upstream-Status: Backport [https://github.com/fmtlib/fmt/commit/dea7fde8b7d649923dd41b0766bdf076033c62a2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/spdlog/fmt/bundled/core.h   |  3 ++-
- include/spdlog/fmt/bundled/format.h | 15 ++-------------
- 2 files changed, 4 insertions(+), 14 deletions(-)
-
-diff --git a/include/spdlog/fmt/bundled/core.h b/include/spdlog/fmt/bundled/core.h
-index 50b79351..e8b029ef 100644
---- a/include/spdlog/fmt/bundled/core.h
-+++ b/include/spdlog/fmt/bundled/core.h
-@@ -1484,7 +1484,8 @@ FMT_API void vprint(wstring_view format_str, wformat_args args);
- 
- /**
-   \rst
--  Prints formatted data to ``stdout``.
-+  Formats ``args`` according to specifications in ``format_str`` and writes the
-+  output to ``stdout``.
- 
-   **Example**::
- 
-diff --git a/include/spdlog/fmt/bundled/format.h b/include/spdlog/fmt/bundled/format.h
-index 1bb24a52..39426361 100644
---- a/include/spdlog/fmt/bundled/format.h
-+++ b/include/spdlog/fmt/bundled/format.h
-@@ -407,21 +407,10 @@ void basic_buffer<T>::append(const U *begin, const U *end) {
- enum char8_t: unsigned char {};
- #endif
- 
--// A UTF-8 string view.
--class u8string_view : public basic_string_view<char8_t> {
-- public:
--  typedef char8_t char_type;
--
--  u8string_view(const char *s):
--    basic_string_view<char8_t>(reinterpret_cast<const char8_t*>(s)) {}
--  u8string_view(const char *s, size_t count) FMT_NOEXCEPT:
--    basic_string_view<char8_t>(reinterpret_cast<const char8_t*>(s), count) {}
--};
--
- #if FMT_USE_USER_DEFINED_LITERALS
- inline namespace literals {
--inline u8string_view operator"" _u(const char *s, std::size_t n) {
--  return {s, n};
-+inline basic_string_view<char8_t> operator"" _u(const char* s, std::size_t n) {
-+  return {reinterpret_cast<const char8_t*>(s), n};
- }
- }
- #endif
--- 
-2.39.0
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-Do-not-use-LFS64-functions-on-linux-musl.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
deleted file mode 100644
index f2bd7e510b..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From ce7a593e74c8e0c2ece15c73e7614d4f13a19a53 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 30 Dec 2022 13:04:08 -0800
-Subject: [PATCH] Do not use LFS64 functions on linux/musl
-
-On musl, off_t is 64bit always ( even on 32bit platforms ), therefore using
-LFS64 funcitons is not needed on such platforms. Moreover, musl has stopped
-providing aliases for these functions [1] which means it wont compile on
-newer musl systems. Therefore only use it on 32bit glibc/linux platforms
-and exclude musl like cygwin or OSX
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=246f1c811448f37a44b41cd8df8d0ef9736d95f4
-
-Upstream-Status: Submitted [https://github.com/gabime/spdlog/pull/2589]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/spdlog/details/os.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/spdlog/details/os.h b/include/spdlog/details/os.h
-index 8e8476f0..be0a67b8 100644
---- a/include/spdlog/details/os.h
-+++ b/include/spdlog/details/os.h
-@@ -227,7 +227,9 @@ inline size_t filesize(FILE *f)
- #else // unix
-     int fd = fileno(f);
- // 64 bits(but not in osx or cygwin, where fstat64 is deprecated)
--#if !defined(__FreeBSD__) && !defined(__APPLE__) && (defined(__x86_64__) || defined(__ppc64__)) && !defined(__CYGWIN__)
-+#if !defined(__FreeBSD__) && !defined(__APPLE__) && \
-+    (defined(__linux__) && defined(__GLIBC__)) && \
-+    (defined(__x86_64__) || defined(__ppc64__)) && !defined(__CYGWIN__)
-     struct stat64 st;
-     if (::fstat64(fd, &st) == 0)
-     {
--- 
-2.39.0
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0002-Committing-changes-from-do_patch.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0002-Committing-changes-from-do_patch.patch
new file mode 100644
index 0000000000..b1092da299
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0002-Committing-changes-from-do_patch.patch
@@ -0,0 +1,16 @@
+From e40d786b2b25d66cbd4e0f8d8520a688bd558938 Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Fri, 15 Sep 2023 15:49:19 +0000
+Subject: [PATCH] Committing changes from do_patch
+
+---
+ third_party/spdlog | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/third_party/spdlog b/third_party/spdlog
+index 7bf8f14..724c892 160000
+--- a/third_party/spdlog
++++ b/third_party/spdlog
+@@ -1 +1 @@
+-Subproject commit 7bf8f148795d2571b4ae4aa9c6d2a8111fbb7077
++Subproject commit 724c892647fdf0b2e303d0ecf41d089a44889f76
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/32bit.patch b/meta/recipes-graphics/vulkan/vulkan-samples/32bit.patch
deleted file mode 100644
index 644c3b6167..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/32bit.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 49761ca63797014223d8e3ff6fb2c0235803c19c Mon Sep 17 00:00:00 2001
-From: asuessenbach <asuessenbach@nvidia.com>
-Date: Wed, 3 May 2023 09:50:08 +0200
-Subject: [PATCH] Resolve some Vulkan-Hpp-related issues on Win32.
-
-This patch fixes vulkan-samples compilation on 32-bit hosts.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- framework/common/hpp_vk_common.h                        | 4 ++--
- framework/core/hpp_buffer.cpp                           | 4 ++--
- framework/core/hpp_buffer.h                             | 2 +-
- framework/core/hpp_image.cpp                            | 2 +-
- samples/api/hpp_texture_loading/hpp_texture_loading.cpp | 2 +-
- 5 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/framework/common/hpp_vk_common.h b/framework/common/hpp_vk_common.h
-index 39ed3dcde..0cbbe479e 100644
---- a/framework/common/hpp_vk_common.h
-+++ b/framework/common/hpp_vk_common.h
-@@ -92,7 +92,7 @@ inline bool is_dynamic_buffer_descriptor_type(vk::DescriptorType descriptor_type
- 
- inline vk::ShaderModule load_shader(const std::string &filename, vk::Device device, vk::ShaderStageFlagBits stage)
- {
--	return vkb::load_shader(filename, device, static_cast<VkShaderStageFlagBits>(stage));
-+	return static_cast<vk::ShaderModule>(vkb::load_shader(filename, device, static_cast<VkShaderStageFlagBits>(stage)));
- }
- 
- inline void set_image_layout(vk::CommandBuffer         command_buffer,
-@@ -104,7 +104,7 @@ inline void set_image_layout(vk::CommandBuffer         command_buffer,
-                              vk::PipelineStageFlags    dst_mask = vk::PipelineStageFlagBits::eAllCommands)
- {
- 	vkb::set_image_layout(command_buffer,
--	                      image,
-+	                      static_cast<VkImage>(image),
- 	                      static_cast<VkImageLayout>(old_layout),
- 	                      static_cast<VkImageLayout>(new_layout),
- 	                      static_cast<VkImageSubresourceRange>(subresource_range),
-diff --git a/framework/core/hpp_buffer.cpp b/framework/core/hpp_buffer.cpp
-index 8da265acb..e6509b9f4 100644
---- a/framework/core/hpp_buffer.cpp
-+++ b/framework/core/hpp_buffer.cpp
-@@ -84,7 +84,7 @@ HPPBuffer::~HPPBuffer()
- 	if (get_handle() && (allocation != VK_NULL_HANDLE))
- 	{
- 		unmap();
--		vmaDestroyBuffer(get_device().get_memory_allocator(), get_handle(), allocation);
-+		vmaDestroyBuffer(get_device().get_memory_allocator(), static_cast<VkBuffer>(get_handle()), allocation);
- 	}
- }
- 
-@@ -93,7 +93,7 @@ VmaAllocation HPPBuffer::get_allocation() const
- 	return allocation;
- }
- 
--VkDeviceMemory HPPBuffer::get_memory() const
-+vk::DeviceMemory HPPBuffer::get_memory() const
- {
- 	return memory;
- }
-diff --git a/framework/core/hpp_buffer.h b/framework/core/hpp_buffer.h
-index 7a243c265..bad47406d 100644
---- a/framework/core/hpp_buffer.h
-+++ b/framework/core/hpp_buffer.h
-@@ -55,7 +55,7 @@ class HPPBuffer : public vkb::core::HPPVulkanResource<vk::Buffer>
- 
- 	VmaAllocation  get_allocation() const;
- 	const uint8_t *get_data() const;
--	VkDeviceMemory get_memory() const;
-+	vk::DeviceMemory get_memory() const;
- 
- 	/**
- 	 * @return Return the buffer's device address (note: requires that the buffer has been created with the VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT usage fla)
-diff --git a/framework/core/hpp_image.cpp b/framework/core/hpp_image.cpp
-index 00fa89ba7..5e6f27363 100644
---- a/framework/core/hpp_image.cpp
-+++ b/framework/core/hpp_image.cpp
-@@ -138,7 +138,7 @@ HPPImage::~HPPImage()
- 	if (get_handle() && memory)
- 	{
- 		unmap();
--		vmaDestroyImage(get_device().get_memory_allocator(), get_handle(), memory);
-+		vmaDestroyImage(get_device().get_memory_allocator(), static_cast<VkImage>(get_handle()), memory);
- 	}
- }
- 
-diff --git a/samples/api/hpp_texture_loading/hpp_texture_loading.cpp b/samples/api/hpp_texture_loading/hpp_texture_loading.cpp
-index 11a1f24c1..cbdd22773 100644
---- a/samples/api/hpp_texture_loading/hpp_texture_loading.cpp
-+++ b/samples/api/hpp_texture_loading/hpp_texture_loading.cpp
-@@ -170,7 +170,7 @@ void HPPTextureLoading::load_texture()
- 		memory_allocate_info  = {memory_requirements.size,
- 		                         get_device()->get_gpu().get_memory_type(memory_requirements.memoryTypeBits, vk::MemoryPropertyFlagBits::eDeviceLocal)};
- 		texture.device_memory = get_device()->get_handle().allocateMemory(memory_allocate_info);
--		VK_CHECK(vkBindImageMemory(get_device()->get_handle(), texture.image, texture.device_memory, 0));
-+		get_device()->get_handle().bindImageMemory(texture.image, texture.device_memory, 0);
- 
- 		vk::CommandBuffer copy_command = get_device()->create_command_buffer(vk::CommandBufferLevel::ePrimary, true);
- 
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 66f1ef5e9d..87eb407d0b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -7,13 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
            file://0001-vulkan-samples-Fix-reproducibility-issue.patch \
-           file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=third_party/spdlog \
-           file://0001-Deprecate-u8string_view.patch;patchdir=third_party/spdlog \
-           file://32bit.patch \
+           file://0002-Committing-changes-from-do_patch.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "2307c3eb5608cb1205fa3514b3a31dbfb857d00c"
+SRCREV = "01d183fbb50603e5f0adcb2dbe9b02b44677a18a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============4378345824573244923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-a3e9c2d153c4480820eaa8a847f52f62f1b0166d"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a3e9c2d153c4480820eaa8a847f52f62f1b0166d"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 34 Local 24 Mirrors 0 Missed 10 Current 251 (70% match, 96% complete)
Removing 1 stale sstate objects for arch qemux86...done.
Removing 9 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 766 of 855 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_recipe_qa)
NOTE: recipe vulkan-samples-git-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-samples-git-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_recipe_qa unihash changed to bc75291feae07088818e68d00f153e461471521b9c8bd24a838cf96bb5f410ea
NOTE: Setscene tasks completed
NOTE: Running task 837 of 855 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_fetch)
NOTE: recipe vulkan-samples-git-r0: task do_fetch: Started
NOTE: recipe vulkan-samples-git-r0: task do_fetch: Succeeded
NOTE: Running task 838 of 855 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_unpack)
NOTE: Running task 839 of 855 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-samples-git-r0: task do_unpack: Started
NOTE: recipe vulkan-samples-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-samples-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-samples-git-r0: task do_unpack: Succeeded
NOTE: Running task 840 of 855 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_patch)
NOTE: Running task 841 of 855 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-samples-git-r0: task do_patch: Started
NOTE: recipe vulkan-samples-git-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-samples-git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-samples-git-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 841 tasks of which 835 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-samples-git-r0 do_patch: Applying patch '0002-Committing-changes-from-do_patch.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-samples/git/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-samples/git/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0002-Committing-changes-from-do_patch.patch
File third_party/spdlog is not a regular file -- refusing to patch
1 out of 1 hunk ignored -- rejects in file 
Patch 0002-Committing-changes-from-do_patch.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-samples/git/temp/log.do_patch.306092
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_patch) failed with exit code '1'

--===============4378345824573244923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-samples-upgrade-to-latest-revision.patch"

RnJvbSA0NGFhNGQ5NTQ0OWFiODk0M2M2ZThkN2I0MDlmZWQxZDQ0YmJhMzA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTU6NTA6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tc2FtcGxlczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogLi4uLzAwMDEt
RGVwcmVjYXRlLXU4c3RyaW5nX3ZpZXcucGF0Y2ggICAgICAgIHwgIDU5IC0tLS0tLS0tLS0KIC4u
Lm90LXVzZS1MRlM2NC1mdW5jdGlvbnMtb24tbGludXgtbXVzbC5wYXRjaCB8ICAzNyAtLS0tLS0t
CiAuLi4wMDItQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2ggfCAgMTYgKysr
CiAuLi4vdnVsa2FuL3Z1bGthbi1zYW1wbGVzLzMyYml0LnBhdGNoICAgICAgICAgfCAxMDEgLS0t
LS0tLS0tLS0tLS0tLS0tCiAuLi4vdnVsa2FuL3Z1bGthbi1zYW1wbGVzX2dpdC5iYiAgICAgICAg
ICAgICAgfCAgIDYgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMjAxIGRl
bGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxr
YW4vdnVsa2FuLXNhbXBsZXMvMDAwMS1EZXByZWNhdGUtdThzdHJpbmdfdmlldy5wYXRjaAogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBs
ZXMvMDAwMS1Eby1ub3QtdXNlLUxGUzY0LWZ1bmN0aW9ucy1vbi1saW51eC1tdXNsLnBhdGNoCiBj
cmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tc2Ft
cGxlcy8wMDAyLUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tc2FtcGxlcy8z
MmJpdC5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXNhbXBsZXMvMDAwMS1EZXByZWNhdGUtdThzdHJpbmdfdmlldy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBsZXMvMDAwMS1EZXByZWNhdGUtdThzdHJp
bmdfdmlldy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYzIzMDRiZGQ0OC4u
MDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1w
bGVzLzAwMDEtRGVwcmVjYXRlLXU4c3RyaW5nX3ZpZXcucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAt
MSw1OSArMCwwIEBACi1Gcm9tIDkzOTg3YjFjZTdkNmY5MTM4NzIwMjQ5NWFhYzYxMDI2MDcwNTk3
ZGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgotRGF0ZTogU3VuLCAxNSBKYW4gMjAyMyAyMTozNzo1MiAtMDgwMAotU3ViamVjdDog
W1BBVENIXSBEZXByZWNhdGUgdThzdHJpbmdfdmlldwotCi1Vc2UgYmFzaWNfc3RyaW5nX3ZpZXcg
aW5zdGVhZAotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20v
Zm10bGliL2ZtdC9jb21taXQvZGVhN2ZkZThiN2Q2NDk5MjNkZDQxYjA3NjZiZGYwNzYwMzNjNjJh
Ml0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBp
bmNsdWRlL3NwZGxvZy9mbXQvYnVuZGxlZC9jb3JlLmggICB8ICAzICsrLQotIGluY2x1ZGUvc3Bk
bG9nL2ZtdC9idW5kbGVkL2Zvcm1hdC5oIHwgMTUgKystLS0tLS0tLS0tLS0tCi0gMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEv
aW5jbHVkZS9zcGRsb2cvZm10L2J1bmRsZWQvY29yZS5oIGIvaW5jbHVkZS9zcGRsb2cvZm10L2J1
bmRsZWQvY29yZS5oCi1pbmRleCA1MGI3OTM1MS4uZThiMDI5ZWYgMTAwNjQ0Ci0tLS0gYS9pbmNs
dWRlL3NwZGxvZy9mbXQvYnVuZGxlZC9jb3JlLmgKLSsrKyBiL2luY2x1ZGUvc3BkbG9nL2ZtdC9i
dW5kbGVkL2NvcmUuaAotQEAgLTE0ODQsNyArMTQ4NCw4IEBAIEZNVF9BUEkgdm9pZCB2cHJpbnQo
d3N0cmluZ192aWV3IGZvcm1hdF9zdHIsIHdmb3JtYXRfYXJncyBhcmdzKTsKLSAKLSAvKioKLSAg
IFxyc3QKLS0gIFByaW50cyBmb3JtYXR0ZWQgZGF0YSB0byBgYHN0ZG91dGBgLgotKyAgRm9ybWF0
cyBgYGFyZ3NgYCBhY2NvcmRpbmcgdG8gc3BlY2lmaWNhdGlvbnMgaW4gYGBmb3JtYXRfc3RyYGAg
YW5kIHdyaXRlcyB0aGUKLSsgIG91dHB1dCB0byBgYHN0ZG91dGBgLgotIAotICAgKipFeGFtcGxl
Kio6OgotIAotZGlmZiAtLWdpdCBhL2luY2x1ZGUvc3BkbG9nL2ZtdC9idW5kbGVkL2Zvcm1hdC5o
IGIvaW5jbHVkZS9zcGRsb2cvZm10L2J1bmRsZWQvZm9ybWF0LmgKLWluZGV4IDFiYjI0YTUyLi4z
OTQyNjM2MSAxMDA2NDQKLS0tLSBhL2luY2x1ZGUvc3BkbG9nL2ZtdC9idW5kbGVkL2Zvcm1hdC5o
Ci0rKysgYi9pbmNsdWRlL3NwZGxvZy9mbXQvYnVuZGxlZC9mb3JtYXQuaAotQEAgLTQwNywyMSAr
NDA3LDEwIEBAIHZvaWQgYmFzaWNfYnVmZmVyPFQ+OjphcHBlbmQoY29uc3QgVSAqYmVnaW4sIGNv
bnN0IFUgKmVuZCkgewotIGVudW0gY2hhcjhfdDogdW5zaWduZWQgY2hhciB7fTsKLSAjZW5kaWYK
LSAKLS0vLyBBIFVURi04IHN0cmluZyB2aWV3LgotLWNsYXNzIHU4c3RyaW5nX3ZpZXcgOiBwdWJs
aWMgYmFzaWNfc3RyaW5nX3ZpZXc8Y2hhcjhfdD4gewotLSBwdWJsaWM6Ci0tICB0eXBlZGVmIGNo
YXI4X3QgY2hhcl90eXBlOwotLQotLSAgdThzdHJpbmdfdmlldyhjb25zdCBjaGFyICpzKToKLS0g
ICAgYmFzaWNfc3RyaW5nX3ZpZXc8Y2hhcjhfdD4ocmVpbnRlcnByZXRfY2FzdDxjb25zdCBjaGFy
OF90Kj4ocykpIHt9Ci0tICB1OHN0cmluZ192aWV3KGNvbnN0IGNoYXIgKnMsIHNpemVfdCBjb3Vu
dCkgRk1UX05PRVhDRVBUOgotLSAgICBiYXNpY19zdHJpbmdfdmlldzxjaGFyOF90PihyZWludGVy
cHJldF9jYXN0PGNvbnN0IGNoYXI4X3QqPihzKSwgY291bnQpIHt9Ci0tfTsKLS0KLSAjaWYgRk1U
X1VTRV9VU0VSX0RFRklORURfTElURVJBTFMKLSBpbmxpbmUgbmFtZXNwYWNlIGxpdGVyYWxzIHsK
LS1pbmxpbmUgdThzdHJpbmdfdmlldyBvcGVyYXRvciIiIF91KGNvbnN0IGNoYXIgKnMsIHN0ZDo6
c2l6ZV90IG4pIHsKLS0gIHJldHVybiB7cywgbn07Ci0raW5saW5lIGJhc2ljX3N0cmluZ192aWV3
PGNoYXI4X3Q+IG9wZXJhdG9yIiIgX3UoY29uc3QgY2hhciogcywgc3RkOjpzaXplX3Qgbikgewot
KyAgcmV0dXJuIHtyZWludGVycHJldF9jYXN0PGNvbnN0IGNoYXI4X3QqPihzKSwgbn07Ci0gfQot
IH0KLSAjZW5kaWYKLS0tIAotMi4zOS4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy92dWxrYW4vdnVsa2FuLXNhbXBsZXMvMDAwMS1Eby1ub3QtdXNlLUxGUzY0LWZ1bmN0aW9u
cy1vbi1saW51eC1tdXNsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxr
YW4tc2FtcGxlcy8wMDAxLURvLW5vdC11c2UtTEZTNjQtZnVuY3Rpb25zLW9uLWxpbnV4LW11c2wu
cGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGYyYmQ3ZTUxMGIuLjAwMDAwMDAw
MDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tc2FtcGxlcy8wMDAx
LURvLW5vdC11c2UtTEZTNjQtZnVuY3Rpb25zLW9uLWxpbnV4LW11c2wucGF0Y2gKKysrIC9kZXYv
bnVsbApAQCAtMSwzNyArMCwwIEBACi1Gcm9tIGNlN2E1OTNlNzRjOGUwYzJlY2UxNWM3M2U3NjE0
ZDRmMTNhMTlhNTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPgotRGF0ZTogRnJpLCAzMCBEZWMgMjAyMiAxMzowNDowOCAtMDgwMAot
U3ViamVjdDogW1BBVENIXSBEbyBub3QgdXNlIExGUzY0IGZ1bmN0aW9ucyBvbiBsaW51eC9tdXNs
Ci0KLU9uIG11c2wsIG9mZl90IGlzIDY0Yml0IGFsd2F5cyAoIGV2ZW4gb24gMzJiaXQgcGxhdGZv
cm1zICksIHRoZXJlZm9yZSB1c2luZwotTEZTNjQgZnVuY2l0b25zIGlzIG5vdCBuZWVkZWQgb24g
c3VjaCBwbGF0Zm9ybXMuIE1vcmVvdmVyLCBtdXNsIGhhcyBzdG9wcGVkCi1wcm92aWRpbmcgYWxp
YXNlcyBmb3IgdGhlc2UgZnVuY3Rpb25zIFsxXSB3aGljaCBtZWFucyBpdCB3b250IGNvbXBpbGUg
b24KLW5ld2VyIG11c2wgc3lzdGVtcy4gVGhlcmVmb3JlIG9ubHkgdXNlIGl0IG9uIDMyYml0IGds
aWJjL2xpbnV4IHBsYXRmb3JtcwotYW5kIGV4Y2x1ZGUgbXVzbCBsaWtlIGN5Z3dpbiBvciBPU1gK
LQotWzFdIGh0dHBzOi8vZ2l0Lm11c2wtbGliYy5vcmcvY2dpdC9tdXNsL2NvbW1pdC8/aWQ9MjQ2
ZjFjODExNDQ4ZjM3YTQ0YjQxY2Q4ZGY4ZDBlZjk3MzZkOTVmNAotCi1VcHN0cmVhbS1TdGF0dXM6
IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL2dhYmltZS9zcGRsb2cvcHVsbC8yNTg5XQot
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIGluY2x1
ZGUvc3BkbG9nL2RldGFpbHMvb3MuaCB8IDQgKysrLQotIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL2luY2x1ZGUvc3BkbG9nL2Rl
dGFpbHMvb3MuaCBiL2luY2x1ZGUvc3BkbG9nL2RldGFpbHMvb3MuaAotaW5kZXggOGU4NDc2ZjAu
LmJlMGE2N2I4IDEwMDY0NAotLS0tIGEvaW5jbHVkZS9zcGRsb2cvZGV0YWlscy9vcy5oCi0rKysg
Yi9pbmNsdWRlL3NwZGxvZy9kZXRhaWxzL29zLmgKLUBAIC0yMjcsNyArMjI3LDkgQEAgaW5saW5l
IHNpemVfdCBmaWxlc2l6ZShGSUxFICpmKQotICNlbHNlIC8vIHVuaXgKLSAgICAgaW50IGZkID0g
ZmlsZW5vKGYpOwotIC8vIDY0IGJpdHMoYnV0IG5vdCBpbiBvc3ggb3IgY3lnd2luLCB3aGVyZSBm
c3RhdDY0IGlzIGRlcHJlY2F0ZWQpCi0tI2lmICFkZWZpbmVkKF9fRnJlZUJTRF9fKSAmJiAhZGVm
aW5lZChfX0FQUExFX18pICYmIChkZWZpbmVkKF9feDg2XzY0X18pIHx8IGRlZmluZWQoX19wcGM2
NF9fKSkgJiYgIWRlZmluZWQoX19DWUdXSU5fXykKLSsjaWYgIWRlZmluZWQoX19GcmVlQlNEX18p
ICYmICFkZWZpbmVkKF9fQVBQTEVfXykgJiYgXAotKyAgICAoZGVmaW5lZChfX2xpbnV4X18pICYm
IGRlZmluZWQoX19HTElCQ19fKSkgJiYgXAotKyAgICAoZGVmaW5lZChfX3g4Nl82NF9fKSB8fCBk
ZWZpbmVkKF9fcHBjNjRfXykpICYmICFkZWZpbmVkKF9fQ1lHV0lOX18pCi0gICAgIHN0cnVjdCBz
dGF0NjQgc3Q7Ci0gICAgIGlmICg6OmZzdGF0NjQoZmQsICZzdCkgPT0gMCkKLSAgICAgewotLS0g
Ci0yLjM5LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxr
YW4tc2FtcGxlcy8wMDAyLUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tc2FtcGxlcy8wMDAyLUNvbW1pdHRp
bmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLmIxMDkyZGEyOTkKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzLzAwMDItQ29tbWl0dGluZy1jaGFuZ2VzLWZy
b20tZG9fcGF0Y2gucGF0Y2gKQEAgLTAsMCArMSwxNiBAQAorRnJvbSBlNDBkNzg2YjJiMjVkNjZj
YmQ0ZTBmOGQ4NTIwYTY4OGJkNTU4OTM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTog
T3BlbkVtYmVkZGVkIDxvZS5wYXRjaEBvZT4KK0RhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTU6NDk6
MTkgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gQ29tbWl0dGluZyBjaGFuZ2VzIGZyb20gZG9fcGF0
Y2gKKworLS0tCisgdGhpcmRfcGFydHkvc3BkbG9nIHwgMiArLQorIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvdGhpcmRfcGFydHkv
c3BkbG9nIGIvdGhpcmRfcGFydHkvc3BkbG9nCitpbmRleCA3YmY4ZjE0Li43MjRjODkyIDE2MDAw
MAorLS0tIGEvdGhpcmRfcGFydHkvc3BkbG9nCisrKysgYi90aGlyZF9wYXJ0eS9zcGRsb2cKK0BA
IC0xICsxIEBACistU3VicHJvamVjdCBjb21taXQgN2JmOGYxNDg3OTVkMjU3MWI0YWU0YWE5YzZk
MmE4MTExZmJiNzA3NworK1N1YnByb2plY3QgY29tbWl0IDcyNGM4OTI2NDdmZGYwYjJlMzAzZDBl
Y2Y0MWQwODlhNDQ4ODlmNzYKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxr
YW4vdnVsa2FuLXNhbXBsZXMvMzJiaXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1zYW1wbGVzLzMyYml0LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCA2NDRjM2I2MTY3Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92
dWxrYW4vdnVsa2FuLXNhbXBsZXMvMzJiaXQucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwxMDEg
KzAsMCBAQAotRnJvbSA0OTc2MWNhNjM3OTcwMTQyMjNkOGUzZmY2ZmIyYzAyMzU4MDNjMTljIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogYXN1ZXNzZW5iYWNoIDxhc3Vlc3NlbmJhY2hA
bnZpZGlhLmNvbT4KLURhdGU6IFdlZCwgMyBNYXkgMjAyMyAwOTo1MDowOCArMDIwMAotU3ViamVj
dDogW1BBVENIXSBSZXNvbHZlIHNvbWUgVnVsa2FuLUhwcC1yZWxhdGVkIGlzc3VlcyBvbiBXaW4z
Mi4KLQotVGhpcyBwYXRjaCBmaXhlcyB2dWxrYW4tc2FtcGxlcyBjb21waWxhdGlvbiBvbiAzMi1i
aXQgaG9zdHMuCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKLVNpZ25lZC1vZmYtYnk6IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotCi0tLS0KLSBmcmFtZXdvcmsvY29tbW9u
L2hwcF92a19jb21tb24uaCAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCi0gZnJhbWV3
b3JrL2NvcmUvaHBwX2J1ZmZlci5jcHAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKyst
LQotIGZyYW1ld29yay9jb3JlL2hwcF9idWZmZXIuaCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstCi0gZnJhbWV3b3JrL2NvcmUvaHBwX2ltYWdlLmNwcCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDIgKy0KLSBzYW1wbGVzL2FwaS9ocHBfdGV4dHVyZV9sb2FkaW5nL2hwcF90
ZXh0dXJlX2xvYWRpbmcuY3BwIHwgMiArLQotIDUgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvZnJhbWV3b3JrL2NvbW1vbi9ocHBf
dmtfY29tbW9uLmggYi9mcmFtZXdvcmsvY29tbW9uL2hwcF92a19jb21tb24uaAotaW5kZXggMzll
ZDNkY2RlLi4wY2JiZTQ3OWUgMTAwNjQ0Ci0tLS0gYS9mcmFtZXdvcmsvY29tbW9uL2hwcF92a19j
b21tb24uaAotKysrIGIvZnJhbWV3b3JrL2NvbW1vbi9ocHBfdmtfY29tbW9uLmgKLUBAIC05Miw3
ICs5Miw3IEBAIGlubGluZSBib29sIGlzX2R5bmFtaWNfYnVmZmVyX2Rlc2NyaXB0b3JfdHlwZSh2
azo6RGVzY3JpcHRvclR5cGUgZGVzY3JpcHRvcl90eXBlCi0gCi0gaW5saW5lIHZrOjpTaGFkZXJN
b2R1bGUgbG9hZF9zaGFkZXIoY29uc3Qgc3RkOjpzdHJpbmcgJmZpbGVuYW1lLCB2azo6RGV2aWNl
IGRldmljZSwgdms6OlNoYWRlclN0YWdlRmxhZ0JpdHMgc3RhZ2UpCi0gewotLQlyZXR1cm4gdmti
Ojpsb2FkX3NoYWRlcihmaWxlbmFtZSwgZGV2aWNlLCBzdGF0aWNfY2FzdDxWa1NoYWRlclN0YWdl
RmxhZ0JpdHM+KHN0YWdlKSk7Ci0rCXJldHVybiBzdGF0aWNfY2FzdDx2azo6U2hhZGVyTW9kdWxl
Pih2a2I6OmxvYWRfc2hhZGVyKGZpbGVuYW1lLCBkZXZpY2UsIHN0YXRpY19jYXN0PFZrU2hhZGVy
U3RhZ2VGbGFnQml0cz4oc3RhZ2UpKSk7Ci0gfQotIAotIGlubGluZSB2b2lkIHNldF9pbWFnZV9s
YXlvdXQodms6OkNvbW1hbmRCdWZmZXIgICAgICAgICBjb21tYW5kX2J1ZmZlciwKLUBAIC0xMDQs
NyArMTA0LDcgQEAgaW5saW5lIHZvaWQgc2V0X2ltYWdlX2xheW91dCh2azo6Q29tbWFuZEJ1ZmZl
ciAgICAgICAgIGNvbW1hbmRfYnVmZmVyLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dms6OlBpcGVsaW5lU3RhZ2VGbGFncyAgICBkc3RfbWFzayA9IHZrOjpQaXBlbGluZVN0YWdlRmxh
Z0JpdHM6OmVBbGxDb21tYW5kcykKLSB7Ci0gCXZrYjo6c2V0X2ltYWdlX2xheW91dChjb21tYW5k
X2J1ZmZlciwKLS0JICAgICAgICAgICAgICAgICAgICAgIGltYWdlLAotKwkgICAgICAgICAgICAg
ICAgICAgICAgc3RhdGljX2Nhc3Q8VmtJbWFnZT4oaW1hZ2UpLAotIAkgICAgICAgICAgICAgICAg
ICAgICAgc3RhdGljX2Nhc3Q8VmtJbWFnZUxheW91dD4ob2xkX2xheW91dCksCi0gCSAgICAgICAg
ICAgICAgICAgICAgICBzdGF0aWNfY2FzdDxWa0ltYWdlTGF5b3V0PihuZXdfbGF5b3V0KSwKLSAJ
ICAgICAgICAgICAgICAgICAgICAgIHN0YXRpY19jYXN0PFZrSW1hZ2VTdWJyZXNvdXJjZVJhbmdl
PihzdWJyZXNvdXJjZV9yYW5nZSksCi1kaWZmIC0tZ2l0IGEvZnJhbWV3b3JrL2NvcmUvaHBwX2J1
ZmZlci5jcHAgYi9mcmFtZXdvcmsvY29yZS9ocHBfYnVmZmVyLmNwcAotaW5kZXggOGRhMjY1YWNi
Li5lNjUwOWI5ZjQgMTAwNjQ0Ci0tLS0gYS9mcmFtZXdvcmsvY29yZS9ocHBfYnVmZmVyLmNwcAot
KysrIGIvZnJhbWV3b3JrL2NvcmUvaHBwX2J1ZmZlci5jcHAKLUBAIC04NCw3ICs4NCw3IEBAIEhQ
UEJ1ZmZlcjo6fkhQUEJ1ZmZlcigpCi0gCWlmIChnZXRfaGFuZGxlKCkgJiYgKGFsbG9jYXRpb24g
IT0gVktfTlVMTF9IQU5ETEUpKQotIAl7Ci0gCQl1bm1hcCgpOwotLQkJdm1hRGVzdHJveUJ1ZmZl
cihnZXRfZGV2aWNlKCkuZ2V0X21lbW9yeV9hbGxvY2F0b3IoKSwgZ2V0X2hhbmRsZSgpLCBhbGxv
Y2F0aW9uKTsKLSsJCXZtYURlc3Ryb3lCdWZmZXIoZ2V0X2RldmljZSgpLmdldF9tZW1vcnlfYWxs
b2NhdG9yKCksIHN0YXRpY19jYXN0PFZrQnVmZmVyPihnZXRfaGFuZGxlKCkpLCBhbGxvY2F0aW9u
KTsKLSAJfQotIH0KLSAKLUBAIC05Myw3ICs5Myw3IEBAIFZtYUFsbG9jYXRpb24gSFBQQnVmZmVy
OjpnZXRfYWxsb2NhdGlvbigpIGNvbnN0Ci0gCXJldHVybiBhbGxvY2F0aW9uOwotIH0KLSAKLS1W
a0RldmljZU1lbW9yeSBIUFBCdWZmZXI6OmdldF9tZW1vcnkoKSBjb25zdAotK3ZrOjpEZXZpY2VN
ZW1vcnkgSFBQQnVmZmVyOjpnZXRfbWVtb3J5KCkgY29uc3QKLSB7Ci0gCXJldHVybiBtZW1vcnk7
Ci0gfQotZGlmZiAtLWdpdCBhL2ZyYW1ld29yay9jb3JlL2hwcF9idWZmZXIuaCBiL2ZyYW1ld29y
ay9jb3JlL2hwcF9idWZmZXIuaAotaW5kZXggN2EyNDNjMjY1Li5iYWQ0NzQwNmQgMTAwNjQ0Ci0t
LS0gYS9mcmFtZXdvcmsvY29yZS9ocHBfYnVmZmVyLmgKLSsrKyBiL2ZyYW1ld29yay9jb3JlL2hw
cF9idWZmZXIuaAotQEAgLTU1LDcgKzU1LDcgQEAgY2xhc3MgSFBQQnVmZmVyIDogcHVibGljIHZr
Yjo6Y29yZTo6SFBQVnVsa2FuUmVzb3VyY2U8dms6OkJ1ZmZlcj4KLSAKLSAJVm1hQWxsb2NhdGlv
biAgZ2V0X2FsbG9jYXRpb24oKSBjb25zdDsKLSAJY29uc3QgdWludDhfdCAqZ2V0X2RhdGEoKSBj
b25zdDsKLS0JVmtEZXZpY2VNZW1vcnkgZ2V0X21lbW9yeSgpIGNvbnN0OwotKwl2azo6RGV2aWNl
TWVtb3J5IGdldF9tZW1vcnkoKSBjb25zdDsKLSAKLSAJLyoqCi0gCSAqIEByZXR1cm4gUmV0dXJu
IHRoZSBidWZmZXIncyBkZXZpY2UgYWRkcmVzcyAobm90ZTogcmVxdWlyZXMgdGhhdCB0aGUgYnVm
ZmVyIGhhcyBiZWVuIGNyZWF0ZWQgd2l0aCB0aGUgVktfQlVGRkVSX1VTQUdFX1NIQURFUl9ERVZJ
Q0VfQUREUkVTU19CSVQgdXNhZ2UgZmxhKQotZGlmZiAtLWdpdCBhL2ZyYW1ld29yay9jb3JlL2hw
cF9pbWFnZS5jcHAgYi9mcmFtZXdvcmsvY29yZS9ocHBfaW1hZ2UuY3BwCi1pbmRleCAwMGZhODli
YTcuLjVlNmYyNzM2MyAxMDA2NDQKLS0tLSBhL2ZyYW1ld29yay9jb3JlL2hwcF9pbWFnZS5jcHAK
LSsrKyBiL2ZyYW1ld29yay9jb3JlL2hwcF9pbWFnZS5jcHAKLUBAIC0xMzgsNyArMTM4LDcgQEAg
SFBQSW1hZ2U6On5IUFBJbWFnZSgpCi0gCWlmIChnZXRfaGFuZGxlKCkgJiYgbWVtb3J5KQotIAl7
Ci0gCQl1bm1hcCgpOwotLQkJdm1hRGVzdHJveUltYWdlKGdldF9kZXZpY2UoKS5nZXRfbWVtb3J5
X2FsbG9jYXRvcigpLCBnZXRfaGFuZGxlKCksIG1lbW9yeSk7Ci0rCQl2bWFEZXN0cm95SW1hZ2Uo
Z2V0X2RldmljZSgpLmdldF9tZW1vcnlfYWxsb2NhdG9yKCksIHN0YXRpY19jYXN0PFZrSW1hZ2U+
KGdldF9oYW5kbGUoKSksIG1lbW9yeSk7Ci0gCX0KLSB9Ci0gCi1kaWZmIC0tZ2l0IGEvc2FtcGxl
cy9hcGkvaHBwX3RleHR1cmVfbG9hZGluZy9ocHBfdGV4dHVyZV9sb2FkaW5nLmNwcCBiL3NhbXBs
ZXMvYXBpL2hwcF90ZXh0dXJlX2xvYWRpbmcvaHBwX3RleHR1cmVfbG9hZGluZy5jcHAKLWluZGV4
IDExYTFmMjRjMS4uY2JkZDIyNzczIDEwMDY0NAotLS0tIGEvc2FtcGxlcy9hcGkvaHBwX3RleHR1
cmVfbG9hZGluZy9ocHBfdGV4dHVyZV9sb2FkaW5nLmNwcAotKysrIGIvc2FtcGxlcy9hcGkvaHBw
X3RleHR1cmVfbG9hZGluZy9ocHBfdGV4dHVyZV9sb2FkaW5nLmNwcAotQEAgLTE3MCw3ICsxNzAs
NyBAQCB2b2lkIEhQUFRleHR1cmVMb2FkaW5nOjpsb2FkX3RleHR1cmUoKQotIAkJbWVtb3J5X2Fs
bG9jYXRlX2luZm8gID0ge21lbW9yeV9yZXF1aXJlbWVudHMuc2l6ZSwKLSAJCSAgICAgICAgICAg
ICAgICAgICAgICAgICBnZXRfZGV2aWNlKCktPmdldF9ncHUoKS5nZXRfbWVtb3J5X3R5cGUobWVt
b3J5X3JlcXVpcmVtZW50cy5tZW1vcnlUeXBlQml0cywgdms6Ok1lbW9yeVByb3BlcnR5RmxhZ0Jp
dHM6OmVEZXZpY2VMb2NhbCl9OwotIAkJdGV4dHVyZS5kZXZpY2VfbWVtb3J5ID0gZ2V0X2Rldmlj
ZSgpLT5nZXRfaGFuZGxlKCkuYWxsb2NhdGVNZW1vcnkobWVtb3J5X2FsbG9jYXRlX2luZm8pOwot
LQkJVktfQ0hFQ0sodmtCaW5kSW1hZ2VNZW1vcnkoZ2V0X2RldmljZSgpLT5nZXRfaGFuZGxlKCks
IHRleHR1cmUuaW1hZ2UsIHRleHR1cmUuZGV2aWNlX21lbW9yeSwgMCkpOwotKwkJZ2V0X2Rldmlj
ZSgpLT5nZXRfaGFuZGxlKCkuYmluZEltYWdlTWVtb3J5KHRleHR1cmUuaW1hZ2UsIHRleHR1cmUu
ZGV2aWNlX21lbW9yeSwgMCk7Ci0gCi0gCQl2azo6Q29tbWFuZEJ1ZmZlciBjb3B5X2NvbW1hbmQg
PSBnZXRfZGV2aWNlKCktPmNyZWF0ZV9jb21tYW5kX2J1ZmZlcih2azo6Q29tbWFuZEJ1ZmZlckxl
dmVsOjplUHJpbWFyeSwgdHJ1ZSk7Ci0gCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92
dWxrYW4vdnVsa2FuLXNhbXBsZXNfZ2l0LmJiCmluZGV4IDY2ZjFlZjVlOWQuLjg3ZWI0MDdkMGIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBsZXNf
Z2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBsZXNf
Z2l0LmJiCkBAIC03LDEzICs3LDExIEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0U7bWQ1PTQ4YWEzNWNlZmI3Njg0MzYyMjNhNmU3ZjE4ZGMyYTJhIgogCiBTUkNfVVJJID0gImdp
dHNtOi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVNhbXBsZXMuZ2l0O2JyYW5jaD1t
YWluO3Byb3RvY29sPWh0dHBzO2xmcz0wIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtdnVsa2Fu
LXNhbXBsZXMtRml4LXJlcHJvZHVjaWJpbGl0eS1pc3N1ZS5wYXRjaCBcCi0gICAgICAgICAgIGZp
bGU6Ly8wMDAxLURvLW5vdC11c2UtTEZTNjQtZnVuY3Rpb25zLW9uLWxpbnV4LW11c2wucGF0Y2g7
cGF0Y2hkaXI9dGhpcmRfcGFydHkvc3BkbG9nIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtRGVw
cmVjYXRlLXU4c3RyaW5nX3ZpZXcucGF0Y2g7cGF0Y2hkaXI9dGhpcmRfcGFydHkvc3BkbG9nIFwK
LSAgICAgICAgICAgZmlsZTovLzMyYml0LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDIt
Q29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2ggXAogICAgICAgICAgICAiCiAK
IFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICIyMzA3YzNlYjU2MDhjYjEy
MDVmYTM1MTRiM2EzMWRiZmI4NTdkMDBjIgorU1JDUkVWID0gIjAxZDE4M2ZiYjUwNjAzZTVmMGFk
Y2IyZGJlOWIwMmI0NDY3N2ExOGEiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIlRo
ZXNlIGFyZSBub3QgdGhlIHJlbGVhc2VzIHlvdSdyZSBsb29raW5nIGZvciIKIFMgPSAiJHtXT1JL
RElSfS9naXQiCi0tIAoyLjM5LjIKCg==

--===============4378345824573244923==--

