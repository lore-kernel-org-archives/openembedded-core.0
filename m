Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79385C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 20:51:45 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.54.1707943902066830870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 12:51:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WyF/vXPP;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d72f71f222so1290615ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 12:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707943901; x=1708548701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzI8MW20l70jtr7rjg19GhdSxJ0UmdglNJqYT25HyqM=;
        b=WyF/vXPP/aJ8pZdn4V2dS+9TNuhYqNtZNvNvGqO8vVk3p6W98Az3L2vfVCVdGhGb7P
         oCI3racztP7CvuZnq52XjpQxoo+l2y+mVWB7RrQqHK1dK5UAJgX1HWWusUdx4hk3NRxH
         gg2JSC0Rmx7vMrS0EC93TtM/WPCdYLJ6CyPj/6xs4ekCWQI5QN24gLQFiliVvnbjY2M9
         R3BtBPt6CWJkoFeUw6Olgc2h3O8NzcobDtvIsYwnzcFMOOGotIPGNUL8f4QMnWO6zMQ3
         yX0sTOs/4W3MqtCfqwYsF0ICDbY7EfGv5UAV+tzvTDjMAwrMusJda19PKU9gBG5/Ht9i
         gfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707943901; x=1708548701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzI8MW20l70jtr7rjg19GhdSxJ0UmdglNJqYT25HyqM=;
        b=C7OcrefcNYp97jGZPICNRn2u3/4vadRhSrEYJYsXc5l2sR6z19iIuu8PfeDefTJ/Jo
         UFGeAYK8UMxS03T8GxCt4oNMDmTvZB3UNQFKpVdtXMbszkzBtXyxvZAW/dZAu9/yuDgn
         ulzLbjyw1qWxO9OyFNNsakTjv5d3RL1V6Q2rLd7Z1TiXlJ3eRwPNqgWVnyJ+vs+ymFlT
         lIJrKzKcVaK8nkVvGR4wS84iHgYQzJCRWJ83lrHLCzut/lMTACK0N2VfSc/gAyHygb02
         CnZsee8cTP6qhadx8Pin9+QLS7t7N0d0v21a9XJ+r4JfK3LV6fX7xdZiWAXuTSBNT9ux
         s18A==
X-Gm-Message-State: AOJu0YyuVTuonOkQymgPuZDFwrKKS08ZViRY8OpvqGjsah2OEMdMK1Qm
	zsD0SU+3iVtRU1AzOntXfxzUMoNiYqOSLAxooQ6zofpMhhzRGS7wo4zKBpxZUiw=
X-Google-Smtp-Source: AGHT+IGWa4JvN0+AEwdwTyhzUGQbnKsr6m2sBFz8ZuY3/FyCepLhHfKYjS9tFNQS9g1dOHdWTnMA/w==
X-Received: by 2002:a17:902:cec2:b0:1da:1b60:21ff with SMTP id d2-20020a170902cec200b001da1b6021ffmr3916954plg.13.1707943901063;
        Wed, 14 Feb 2024 12:51:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::b58c])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902c18400b001d916995423sm4150770pld.99.2024.02.14.12.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 12:51:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] vulkan-samples: Update to tip of trunk
Date: Wed, 14 Feb 2024 12:47:36 -0800
Message-ID: <20240214205135.401454-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240214205135.401454-1-raj.khem@gmail.com>
References: <20240214205135.401454-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 20:51:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195498

This gets the needed fixes for llvm-18 based builds
spdlog musl patches has been merged in the updated version module
32bit backport is also available in this version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Deprecate-u8string_view.patch        |  59 ----------
 ...ot-use-LFS64-functions-on-linux-musl.patch |  37 -------
 .../vulkan/vulkan-samples/32bit.patch         | 101 ------------------
 .../vulkan/vulkan-samples_git.bb              |   5 +-
 4 files changed, 1 insertion(+), 201 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-Deprecate-u8string_view.patch
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/32bit.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-Deprecate-u8string_view.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-Deprecate-u8string_view.patch
deleted file mode 100644
index c2304bdd48b..00000000000
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
index f2bd7e510b8..00000000000
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
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/32bit.patch b/meta/recipes-graphics/vulkan/vulkan-samples/32bit.patch
deleted file mode 100644
index 644c3b61670..00000000000
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
index d60c0f31903..c3374111112 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -7,13 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
            file://0001-vulkan-samples-Fix-reproducibility-issue.patch \
-           file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=third_party/spdlog \
-           file://0001-Deprecate-u8string_view.patch;patchdir=third_party/spdlog \
-           file://32bit.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "2307c3eb5608cb1205fa3514b3a31dbfb857d00c"
+SRCREV = "04091a428b76f234d47b8ce72cb4f3693e2fbcd1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.43.1


