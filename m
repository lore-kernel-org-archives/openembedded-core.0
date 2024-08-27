Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433B7C54743
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:20 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.71676.1724736250895413486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gYWTyu32;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a868b739cd9so610473266b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736249; x=1725341049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vprq2iHtI0VTgL+IpKQDHLbj12E/DhjqS7PJEaWBVLA=;
        b=gYWTyu32bf5+u8Bkh6f/K0iXCmgYWrGDnLqDMci4LIW1NiIrAXIEUudzYuEjXMmI6I
         tsHmOwc6oc49DeeQk9xkgj/RTu5ia0JnYGiFLxYDCurVcXrHo6ZuvFfbCnXbdvQq2qrI
         uTpj/w1RRIiJEGckjuo/WWoQmg8HbBaRfRSb4jzIY9osN2qXvVA4APfX5xJt5tpo+7cS
         UdPWQ7wHU9p7g8taDAmr/Pj0a2cdUW0qOqzlnXzVN6DlbY55Yv0N/WTPJlTggzf5h8y8
         7BxUNlwa3dC8YUg1gy/8WQ+29MivSDicDTAQc3egRoUrWeh2Xlvcc5i91gx8OF1+ODJS
         4amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736249; x=1725341049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vprq2iHtI0VTgL+IpKQDHLbj12E/DhjqS7PJEaWBVLA=;
        b=jQDd3u/0l7wddGo+bBD6ckqos/RnLI1rYaya0U0WseIArlNG6fv9/VIfthCLyNxy+J
         xp5C5Jy4/ccMSF/19gZMLmDipMA2Lx7IwvxlOEnEj+uDlMO50eFB0CGiagW7h/ntQJFX
         2Ug4XVisSbUlFxM5zrvI5hBIPKK/0su7C8yHo8r8UBFcfE5Q3lkUbxcsSUB+5Mb8Qyb+
         drTmr8BS2mVHdph6FupiQoVLPzSpzJpOGqkKaRykbttrHJlrpd9F0N/Ec0XigXqCqV0f
         VfB+aAX7kg84ZSb6s1YCNn0ObQBbJdYlusHYvTd0Yj6mbPmXU1K3/1yi8v9YuuZC6Ngp
         ZMZw==
X-Gm-Message-State: AOJu0YwE0U1I5/TqPWJkbqQXWpN+43dbVl/Qwnnw79T0iVr/4H8PvqEQ
	PBtA6mjEmKPsH7clLvwL3DRleVAjBLsMwHJyedPhl8IN2nUxsLDE7Zq9FA==
X-Google-Smtp-Source: AGHT+IHYIE++OCzfLEUQ2rz17UDMWLy9HPAiTK4W3io9oi0amud72IgKkyP7mgldPoPjusFvTdwPzw==
X-Received: by 2002:a17:906:f5a4:b0:a80:d913:be07 with SMTP id a640c23a62f3a-a86e3a4b2eemr123150966b.36.1724736248511;
        Mon, 26 Aug 2024 22:24:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/34] vulkan-samples: update to latest revision
Date: Tue, 27 Aug 2024 07:23:39 +0200
Message-Id: <20240827052354.1319810-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203795

From: Alexander Kanavin <alex@linutronix.de>

Drop backports.

This has again regressed on 32 bit x86, and as no one cares upstream
and the 32 bit x86 platform really isn't relevant for vulkan,
let's just disable it there.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Deprecate-u8string_view.patch        |  59 ----------
 ...ot-use-LFS64-functions-on-linux-musl.patch |  37 -------
 .../vulkan/vulkan-samples/32bit.patch         | 101 ------------------
 .../vulkan/vulkan-samples_git.bb              |   7 +-
 4 files changed, 3 insertions(+), 201 deletions(-)
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
index 4e688e44a72..93d4cdfdd9e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -7,14 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
            file://0001-vulkan-samples-Fix-reproducibility-issue.patch \
-           file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=third_party/spdlog \
-           file://0001-Deprecate-u8string_view.patch;patchdir=third_party/spdlog \
-           file://32bit.patch \
            file://0001-zstd.c-replace-FORCE_INLINE_TEMPLATE-with-inline.patch;patchdir=third_party/ktx \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "2307c3eb5608cb1205fa3514b3a31dbfb857d00c"
+SRCREV = "fdce530c029514e2f66296288f9ee26a05058ec1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
@@ -38,3 +35,5 @@ EXTRA_OECMAKE += "-DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON"
 
 # This needs to be specified explicitly to avoid xcb/xlib dependencies
 EXTRA_OECMAKE += "-DVKB_WSI_SELECTION=D2D"
+
+COMPATIBLE_HOST:x86 = "null"
-- 
2.39.2


