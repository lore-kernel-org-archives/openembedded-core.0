Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC9BE74903
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.64750.1696183992643619332
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Kva5UhQ8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WIJeVEBg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018aec71bc5e-474979fa-e5aa-41d3-a743-aee934403236-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lGDWa/s35kJ746rjbI12RtPJR57AeBb+lOmtKCcX5Kw=;
	b=Kva5UhQ81V9Vczkp4CDPvn29eOCWIXGi1dwGMLXfU3NEVg4v9spX/jV+fcFjWmWB
	pTvzS933cxvQv8Ff8fqCB9Ux2esOUzV5e7UbNYT83jKHh934xFMpys0Rv8ULCPWonav
	qfZnyhRANoEGkD+2J1yOXrb4nx4RUv6mkSkmmuuc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lGDWa/s35kJ746rjbI12RtPJR57AeBb+lOmtKCcX5Kw=;
	b=WIJeVEBgEA5OWDAfCuN+Ml0FhyvWMGQch5jaJuf6kVqBW65eTeNALH3GHhoqOwV2
	6Qu4XRG1gAsvnbiAlZRmPQnr2dv5zzNyY0Rs065YNiM8SHVghaN8ec+bojFp84l10Al
	ySZWZvYhIpo+DNr6LVr7Z/pjSoAdw7AW7TN8rNpE=
Content-Type: multipart/mixed; boundary="===============3840447276661012888=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 1048740b2a4adde1b8cb01c63732bdde3d42147b FAILED
Message-ID: <0101018aec71bc5e-474979fa-e5aa-41d3-a743-aee934403236-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188580

--===============3840447276661012888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *1048740b2a4adde1b8cb01c63732bdde3d42147b* has Failed(do_compile).

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
From f0136a525bf3ec25dc473edc32fdcf877e46273b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 16:07:59 +0000
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
index 0000000000..a729f81ef1
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0002-Committing-changes-from-do_patch.patch
@@ -0,0 +1,16 @@
+From a6d4dadf03460c14cdc6c89ee309e7858bec9e51 Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Sun, 1 Oct 2023 16:07:14 +0000
+Subject: [PATCH] Committing changes from do_patch
+
+---
+ third_party/spdlog | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/third_party/spdlog b/third_party/spdlog
+index 7bf8f14..15c61ab 160000
+--- a/third_party/spdlog
++++ b/third_party/spdlog
+@@ -1 +1 @@
+-Subproject commit 7bf8f148795d2571b4ae4aa9c6d2a8111fbb7077
++Subproject commit 15c61ab94178c7ec595cdbd68486b2a86acce831
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
index 66f1ef5e9d..5fb468d2cc 100644
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
+SRCREV = "1048740b2a4adde1b8cb01c63732bdde3d42147b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============3840447276661012888==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-samples-upgrade-to-latest-revision.patch"

RnJvbSBmMDEzNmE1MjViZjNlYzI1ZGM0NzNlZGMzMmZkY2Y4NzdlNDYyNzNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxNjowNzo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1zYW1wbGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiAuLi4vMDAwMS1E
ZXByZWNhdGUtdThzdHJpbmdfdmlldy5wYXRjaCAgICAgICAgfCAgNTkgLS0tLS0tLS0tLQogLi4u
b3QtdXNlLUxGUzY0LWZ1bmN0aW9ucy1vbi1saW51eC1tdXNsLnBhdGNoIHwgIDM3IC0tLS0tLS0K
IC4uLjAwMi1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaCB8ICAxNiArKysK
IC4uLi92dWxrYW4vdnVsa2FuLXNhbXBsZXMvMzJiaXQucGF0Y2ggICAgICAgICB8IDEwMSAtLS0t
LS0tLS0tLS0tLS0tLS0KIC4uLi92dWxrYW4vdnVsa2FuLXNhbXBsZXNfZ2l0LmJiICAgICAgICAg
ICAgICB8ICAgNiArLQogNSBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyMDEgZGVs
ZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tc2FtcGxlcy8wMDAxLURlcHJlY2F0ZS11OHN0cmluZ192aWV3LnBhdGNoCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tc2FtcGxl
cy8wMDAxLURvLW5vdC11c2UtTEZTNjQtZnVuY3Rpb25zLW9uLWxpbnV4LW11c2wucGF0Y2gKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1w
bGVzLzAwMDItQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2gKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzLzMy
Yml0LnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxr
YW4tc2FtcGxlcy8wMDAxLURlcHJlY2F0ZS11OHN0cmluZ192aWV3LnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tc2FtcGxlcy8wMDAxLURlcHJlY2F0ZS11OHN0cmlu
Z192aWV3LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBjMjMwNGJkZDQ4Li4w
MDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBs
ZXMvMDAwMS1EZXByZWNhdGUtdThzdHJpbmdfdmlldy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0x
LDU5ICswLDAgQEAKLUZyb20gOTM5ODdiMWNlN2Q2ZjkxMzg3MjAyNDk1YWFjNjEwMjYwNzA1OTdk
ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+Ci1EYXRlOiBTdW4sIDE1IEphbiAyMDIzIDIxOjM3OjUyIC0wODAwCi1TdWJqZWN0OiBb
UEFUQ0hdIERlcHJlY2F0ZSB1OHN0cmluZ192aWV3Ci0KLVVzZSBiYXNpY19zdHJpbmdfdmlldyBp
bnN0ZWFkCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9m
bXRsaWIvZm10L2NvbW1pdC9kZWE3ZmRlOGI3ZDY0OTkyM2RkNDFiMDc2NmJkZjA3NjAzM2M2MmEy
XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIGlu
Y2x1ZGUvc3BkbG9nL2ZtdC9idW5kbGVkL2NvcmUuaCAgIHwgIDMgKystCi0gaW5jbHVkZS9zcGRs
b2cvZm10L2J1bmRsZWQvZm9ybWF0LmggfCAxNSArKy0tLS0tLS0tLS0tLS0KLSAyIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9p
bmNsdWRlL3NwZGxvZy9mbXQvYnVuZGxlZC9jb3JlLmggYi9pbmNsdWRlL3NwZGxvZy9mbXQvYnVu
ZGxlZC9jb3JlLmgKLWluZGV4IDUwYjc5MzUxLi5lOGIwMjllZiAxMDA2NDQKLS0tLSBhL2luY2x1
ZGUvc3BkbG9nL2ZtdC9idW5kbGVkL2NvcmUuaAotKysrIGIvaW5jbHVkZS9zcGRsb2cvZm10L2J1
bmRsZWQvY29yZS5oCi1AQCAtMTQ4NCw3ICsxNDg0LDggQEAgRk1UX0FQSSB2b2lkIHZwcmludCh3
c3RyaW5nX3ZpZXcgZm9ybWF0X3N0ciwgd2Zvcm1hdF9hcmdzIGFyZ3MpOwotIAotIC8qKgotICAg
XHJzdAotLSAgUHJpbnRzIGZvcm1hdHRlZCBkYXRhIHRvIGBgc3Rkb3V0YGAuCi0rICBGb3JtYXRz
IGBgYXJnc2BgIGFjY29yZGluZyB0byBzcGVjaWZpY2F0aW9ucyBpbiBgYGZvcm1hdF9zdHJgYCBh
bmQgd3JpdGVzIHRoZQotKyAgb3V0cHV0IHRvIGBgc3Rkb3V0YGAuCi0gCi0gICAqKkV4YW1wbGUq
Kjo6Ci0gCi1kaWZmIC0tZ2l0IGEvaW5jbHVkZS9zcGRsb2cvZm10L2J1bmRsZWQvZm9ybWF0Lmgg
Yi9pbmNsdWRlL3NwZGxvZy9mbXQvYnVuZGxlZC9mb3JtYXQuaAotaW5kZXggMWJiMjRhNTIuLjM5
NDI2MzYxIDEwMDY0NAotLS0tIGEvaW5jbHVkZS9zcGRsb2cvZm10L2J1bmRsZWQvZm9ybWF0LmgK
LSsrKyBiL2luY2x1ZGUvc3BkbG9nL2ZtdC9idW5kbGVkL2Zvcm1hdC5oCi1AQCAtNDA3LDIxICs0
MDcsMTAgQEAgdm9pZCBiYXNpY19idWZmZXI8VD46OmFwcGVuZChjb25zdCBVICpiZWdpbiwgY29u
c3QgVSAqZW5kKSB7Ci0gZW51bSBjaGFyOF90OiB1bnNpZ25lZCBjaGFyIHt9OwotICNlbmRpZgot
IAotLS8vIEEgVVRGLTggc3RyaW5nIHZpZXcuCi0tY2xhc3MgdThzdHJpbmdfdmlldyA6IHB1Ymxp
YyBiYXNpY19zdHJpbmdfdmlldzxjaGFyOF90PiB7Ci0tIHB1YmxpYzoKLS0gIHR5cGVkZWYgY2hh
cjhfdCBjaGFyX3R5cGU7Ci0tCi0tICB1OHN0cmluZ192aWV3KGNvbnN0IGNoYXIgKnMpOgotLSAg
ICBiYXNpY19zdHJpbmdfdmlldzxjaGFyOF90PihyZWludGVycHJldF9jYXN0PGNvbnN0IGNoYXI4
X3QqPihzKSkge30KLS0gIHU4c3RyaW5nX3ZpZXcoY29uc3QgY2hhciAqcywgc2l6ZV90IGNvdW50
KSBGTVRfTk9FWENFUFQ6Ci0tICAgIGJhc2ljX3N0cmluZ192aWV3PGNoYXI4X3Q+KHJlaW50ZXJw
cmV0X2Nhc3Q8Y29uc3QgY2hhcjhfdCo+KHMpLCBjb3VudCkge30KLS19OwotLQotICNpZiBGTVRf
VVNFX1VTRVJfREVGSU5FRF9MSVRFUkFMUwotIGlubGluZSBuYW1lc3BhY2UgbGl0ZXJhbHMgewot
LWlubGluZSB1OHN0cmluZ192aWV3IG9wZXJhdG9yIiIgX3UoY29uc3QgY2hhciAqcywgc3RkOjpz
aXplX3QgbikgewotLSAgcmV0dXJuIHtzLCBufTsKLStpbmxpbmUgYmFzaWNfc3RyaW5nX3ZpZXc8
Y2hhcjhfdD4gb3BlcmF0b3IiIiBfdShjb25zdCBjaGFyKiBzLCBzdGQ6OnNpemVfdCBuKSB7Ci0r
ICByZXR1cm4ge3JlaW50ZXJwcmV0X2Nhc3Q8Y29uc3QgY2hhcjhfdCo+KHMpLCBufTsKLSB9Ci0g
fQotICNlbmRpZgotLS0gCi0yLjM5LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4tc2FtcGxlcy8wMDAxLURvLW5vdC11c2UtTEZTNjQtZnVuY3Rpb25z
LW9uLWxpbnV4LW11c2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGth
bi1zYW1wbGVzLzAwMDEtRG8tbm90LXVzZS1MRlM2NC1mdW5jdGlvbnMtb24tbGludXgtbXVzbC5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZjJiZDdlNTEwYi4uMDAwMDAwMDAw
MAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzLzAwMDEt
RG8tbm90LXVzZS1MRlM2NC1mdW5jdGlvbnMtb24tbGludXgtbXVzbC5wYXRjaAorKysgL2Rldi9u
dWxsCkBAIC0xLDM3ICswLDAgQEAKLUZyb20gY2U3YTU5M2U3NGM4ZTBjMmVjZTE1YzczZTc2MTRk
NGYxM2ExOWE1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBGcmksIDMwIERlYyAyMDIyIDEzOjA0OjA4IC0wODAwCi1T
dWJqZWN0OiBbUEFUQ0hdIERvIG5vdCB1c2UgTEZTNjQgZnVuY3Rpb25zIG9uIGxpbnV4L211c2wK
LQotT24gbXVzbCwgb2ZmX3QgaXMgNjRiaXQgYWx3YXlzICggZXZlbiBvbiAzMmJpdCBwbGF0Zm9y
bXMgKSwgdGhlcmVmb3JlIHVzaW5nCi1MRlM2NCBmdW5jaXRvbnMgaXMgbm90IG5lZWRlZCBvbiBz
dWNoIHBsYXRmb3Jtcy4gTW9yZW92ZXIsIG11c2wgaGFzIHN0b3BwZWQKLXByb3ZpZGluZyBhbGlh
c2VzIGZvciB0aGVzZSBmdW5jdGlvbnMgWzFdIHdoaWNoIG1lYW5zIGl0IHdvbnQgY29tcGlsZSBv
bgotbmV3ZXIgbXVzbCBzeXN0ZW1zLiBUaGVyZWZvcmUgb25seSB1c2UgaXQgb24gMzJiaXQgZ2xp
YmMvbGludXggcGxhdGZvcm1zCi1hbmQgZXhjbHVkZSBtdXNsIGxpa2UgY3lnd2luIG9yIE9TWAot
Ci1bMV0gaHR0cHM6Ly9naXQubXVzbC1saWJjLm9yZy9jZ2l0L211c2wvY29tbWl0Lz9pZD0yNDZm
MWM4MTE0NDhmMzdhNDRiNDFjZDhkZjhkMGVmOTczNmQ5NWY0Ci0KLVVwc3RyZWFtLVN0YXR1czog
U3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vZ2FiaW1lL3NwZGxvZy9wdWxsLzI1ODldCi1T
aWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gaW5jbHVk
ZS9zcGRsb2cvZGV0YWlscy9vcy5oIHwgNCArKystCi0gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvaW5jbHVkZS9zcGRsb2cvZGV0
YWlscy9vcy5oIGIvaW5jbHVkZS9zcGRsb2cvZGV0YWlscy9vcy5oCi1pbmRleCA4ZTg0NzZmMC4u
YmUwYTY3YjggMTAwNjQ0Ci0tLS0gYS9pbmNsdWRlL3NwZGxvZy9kZXRhaWxzL29zLmgKLSsrKyBi
L2luY2x1ZGUvc3BkbG9nL2RldGFpbHMvb3MuaAotQEAgLTIyNyw3ICsyMjcsOSBAQCBpbmxpbmUg
c2l6ZV90IGZpbGVzaXplKEZJTEUgKmYpCi0gI2Vsc2UgLy8gdW5peAotICAgICBpbnQgZmQgPSBm
aWxlbm8oZik7Ci0gLy8gNjQgYml0cyhidXQgbm90IGluIG9zeCBvciBjeWd3aW4sIHdoZXJlIGZz
dGF0NjQgaXMgZGVwcmVjYXRlZCkKLS0jaWYgIWRlZmluZWQoX19GcmVlQlNEX18pICYmICFkZWZp
bmVkKF9fQVBQTEVfXykgJiYgKGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChfX3BwYzY0
X18pKSAmJiAhZGVmaW5lZChfX0NZR1dJTl9fKQotKyNpZiAhZGVmaW5lZChfX0ZyZWVCU0RfXykg
JiYgIWRlZmluZWQoX19BUFBMRV9fKSAmJiBcCi0rICAgIChkZWZpbmVkKF9fbGludXhfXykgJiYg
ZGVmaW5lZChfX0dMSUJDX18pKSAmJiBcCi0rICAgIChkZWZpbmVkKF9feDg2XzY0X18pIHx8IGRl
ZmluZWQoX19wcGM2NF9fKSkgJiYgIWRlZmluZWQoX19DWUdXSU5fXykKLSAgICAgc3RydWN0IHN0
YXQ2NCBzdDsKLSAgICAgaWYgKDo6ZnN0YXQ2NChmZCwgJnN0KSA9PSAwKQotICAgICB7Ci0tLSAK
LTIuMzkuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGth
bi1zYW1wbGVzLzAwMDItQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzLzAwMDItQ29tbWl0dGlu
Zy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uYTcyOWY4MWVmMQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBsZXMvMDAwMi1Db21taXR0aW5nLWNoYW5nZXMtZnJv
bS1kb19wYXRjaC5wYXRjaApAQCAtMCwwICsxLDE2IEBACitGcm9tIGE2ZDRkYWRmMDM0NjBjMTRj
ZGM2Yzg5ZWUzMDllNzg1OGJlYzllNTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBP
cGVuRW1iZWRkZWQgPG9lLnBhdGNoQG9lPgorRGF0ZTogU3VuLCAxIE9jdCAyMDIzIDE2OjA3OjE0
ICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIENvbW1pdHRpbmcgY2hhbmdlcyBmcm9tIGRvX3BhdGNo
CisKKy0tLQorIHRoaXJkX3BhcnR5L3NwZGxvZyB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL3RoaXJkX3BhcnR5L3Nw
ZGxvZyBiL3RoaXJkX3BhcnR5L3NwZGxvZworaW5kZXggN2JmOGYxNC4uMTVjNjFhYiAxNjAwMDAK
Ky0tLSBhL3RoaXJkX3BhcnR5L3NwZGxvZworKysrIGIvdGhpcmRfcGFydHkvc3BkbG9nCitAQCAt
MSArMSBAQAorLVN1YnByb2plY3QgY29tbWl0IDdiZjhmMTQ4Nzk1ZDI1NzFiNGFlNGFhOWM2ZDJh
ODExMWZiYjcwNzcKKytTdWJwcm9qZWN0IGNvbW1pdCAxNWM2MWFiOTQxNzhjN2VjNTk1Y2RiZDY4
NDg2YjJhODZhY2NlODMxCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi1zYW1wbGVzLzMyYml0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tc2FtcGxlcy8zMmJpdC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggNjQ0YzNiNjE2Ny4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1zYW1wbGVzLzMyYml0LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMTAxICsw
LDAgQEAKLUZyb20gNDk3NjFjYTYzNzk3MDE0MjIzZDhlM2ZmNmZiMmMwMjM1ODAzYzE5YyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IGFzdWVzc2VuYmFjaCA8YXN1ZXNzZW5iYWNoQG52
aWRpYS5jb20+Ci1EYXRlOiBXZWQsIDMgTWF5IDIwMjMgMDk6NTA6MDggKzAyMDAKLVN1YmplY3Q6
IFtQQVRDSF0gUmVzb2x2ZSBzb21lIFZ1bGthbi1IcHAtcmVsYXRlZCBpc3N1ZXMgb24gV2luMzIu
Ci0KLVRoaXMgcGF0Y2ggZml4ZXMgdnVsa2FuLXNhbXBsZXMgY29tcGlsYXRpb24gb24gMzItYml0
IGhvc3RzLgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1TaWduZWQtb2ZmLWJ5OiBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLQotLS0tCi0gZnJhbWV3b3JrL2NvbW1vbi9o
cHBfdmtfY29tbW9uLmggICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQotIGZyYW1ld29y
ay9jb3JlL2hwcF9idWZmZXIuY3BwICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0K
LSBmcmFtZXdvcmsvY29yZS9ocHBfYnVmZmVyLmggICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMiArLQotIGZyYW1ld29yay9jb3JlL2hwcF9pbWFnZS5jcHAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyICstCi0gc2FtcGxlcy9hcGkvaHBwX3RleHR1cmVfbG9hZGluZy9ocHBfdGV4
dHVyZV9sb2FkaW5nLmNwcCB8IDIgKy0KLSA1IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2ZyYW1ld29yay9jb21tb24vaHBwX3Zr
X2NvbW1vbi5oIGIvZnJhbWV3b3JrL2NvbW1vbi9ocHBfdmtfY29tbW9uLmgKLWluZGV4IDM5ZWQz
ZGNkZS4uMGNiYmU0NzllIDEwMDY0NAotLS0tIGEvZnJhbWV3b3JrL2NvbW1vbi9ocHBfdmtfY29t
bW9uLmgKLSsrKyBiL2ZyYW1ld29yay9jb21tb24vaHBwX3ZrX2NvbW1vbi5oCi1AQCAtOTIsNyAr
OTIsNyBAQCBpbmxpbmUgYm9vbCBpc19keW5hbWljX2J1ZmZlcl9kZXNjcmlwdG9yX3R5cGUodms6
OkRlc2NyaXB0b3JUeXBlIGRlc2NyaXB0b3JfdHlwZQotIAotIGlubGluZSB2azo6U2hhZGVyTW9k
dWxlIGxvYWRfc2hhZGVyKGNvbnN0IHN0ZDo6c3RyaW5nICZmaWxlbmFtZSwgdms6OkRldmljZSBk
ZXZpY2UsIHZrOjpTaGFkZXJTdGFnZUZsYWdCaXRzIHN0YWdlKQotIHsKLS0JcmV0dXJuIHZrYjo6
bG9hZF9zaGFkZXIoZmlsZW5hbWUsIGRldmljZSwgc3RhdGljX2Nhc3Q8VmtTaGFkZXJTdGFnZUZs
YWdCaXRzPihzdGFnZSkpOwotKwlyZXR1cm4gc3RhdGljX2Nhc3Q8dms6OlNoYWRlck1vZHVsZT4o
dmtiOjpsb2FkX3NoYWRlcihmaWxlbmFtZSwgZGV2aWNlLCBzdGF0aWNfY2FzdDxWa1NoYWRlclN0
YWdlRmxhZ0JpdHM+KHN0YWdlKSkpOwotIH0KLSAKLSBpbmxpbmUgdm9pZCBzZXRfaW1hZ2VfbGF5
b3V0KHZrOjpDb21tYW5kQnVmZmVyICAgICAgICAgY29tbWFuZF9idWZmZXIsCi1AQCAtMTA0LDcg
KzEwNCw3IEBAIGlubGluZSB2b2lkIHNldF9pbWFnZV9sYXlvdXQodms6OkNvbW1hbmRCdWZmZXIg
ICAgICAgICBjb21tYW5kX2J1ZmZlciwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZr
OjpQaXBlbGluZVN0YWdlRmxhZ3MgICAgZHN0X21hc2sgPSB2azo6UGlwZWxpbmVTdGFnZUZsYWdC
aXRzOjplQWxsQ29tbWFuZHMpCi0gewotIAl2a2I6OnNldF9pbWFnZV9sYXlvdXQoY29tbWFuZF9i
dWZmZXIsCi0tCSAgICAgICAgICAgICAgICAgICAgICBpbWFnZSwKLSsJICAgICAgICAgICAgICAg
ICAgICAgIHN0YXRpY19jYXN0PFZrSW1hZ2U+KGltYWdlKSwKLSAJICAgICAgICAgICAgICAgICAg
ICAgIHN0YXRpY19jYXN0PFZrSW1hZ2VMYXlvdXQ+KG9sZF9sYXlvdXQpLAotIAkgICAgICAgICAg
ICAgICAgICAgICAgc3RhdGljX2Nhc3Q8VmtJbWFnZUxheW91dD4obmV3X2xheW91dCksCi0gCSAg
ICAgICAgICAgICAgICAgICAgICBzdGF0aWNfY2FzdDxWa0ltYWdlU3VicmVzb3VyY2VSYW5nZT4o
c3VicmVzb3VyY2VfcmFuZ2UpLAotZGlmZiAtLWdpdCBhL2ZyYW1ld29yay9jb3JlL2hwcF9idWZm
ZXIuY3BwIGIvZnJhbWV3b3JrL2NvcmUvaHBwX2J1ZmZlci5jcHAKLWluZGV4IDhkYTI2NWFjYi4u
ZTY1MDliOWY0IDEwMDY0NAotLS0tIGEvZnJhbWV3b3JrL2NvcmUvaHBwX2J1ZmZlci5jcHAKLSsr
KyBiL2ZyYW1ld29yay9jb3JlL2hwcF9idWZmZXIuY3BwCi1AQCAtODQsNyArODQsNyBAQCBIUFBC
dWZmZXI6On5IUFBCdWZmZXIoKQotIAlpZiAoZ2V0X2hhbmRsZSgpICYmIChhbGxvY2F0aW9uICE9
IFZLX05VTExfSEFORExFKSkKLSAJewotIAkJdW5tYXAoKTsKLS0JCXZtYURlc3Ryb3lCdWZmZXIo
Z2V0X2RldmljZSgpLmdldF9tZW1vcnlfYWxsb2NhdG9yKCksIGdldF9oYW5kbGUoKSwgYWxsb2Nh
dGlvbik7Ci0rCQl2bWFEZXN0cm95QnVmZmVyKGdldF9kZXZpY2UoKS5nZXRfbWVtb3J5X2FsbG9j
YXRvcigpLCBzdGF0aWNfY2FzdDxWa0J1ZmZlcj4oZ2V0X2hhbmRsZSgpKSwgYWxsb2NhdGlvbik7
Ci0gCX0KLSB9Ci0gCi1AQCAtOTMsNyArOTMsNyBAQCBWbWFBbGxvY2F0aW9uIEhQUEJ1ZmZlcjo6
Z2V0X2FsbG9jYXRpb24oKSBjb25zdAotIAlyZXR1cm4gYWxsb2NhdGlvbjsKLSB9Ci0gCi0tVmtE
ZXZpY2VNZW1vcnkgSFBQQnVmZmVyOjpnZXRfbWVtb3J5KCkgY29uc3QKLSt2azo6RGV2aWNlTWVt
b3J5IEhQUEJ1ZmZlcjo6Z2V0X21lbW9yeSgpIGNvbnN0Ci0gewotIAlyZXR1cm4gbWVtb3J5Owot
IH0KLWRpZmYgLS1naXQgYS9mcmFtZXdvcmsvY29yZS9ocHBfYnVmZmVyLmggYi9mcmFtZXdvcmsv
Y29yZS9ocHBfYnVmZmVyLmgKLWluZGV4IDdhMjQzYzI2NS4uYmFkNDc0MDZkIDEwMDY0NAotLS0t
IGEvZnJhbWV3b3JrL2NvcmUvaHBwX2J1ZmZlci5oCi0rKysgYi9mcmFtZXdvcmsvY29yZS9ocHBf
YnVmZmVyLmgKLUBAIC01NSw3ICs1NSw3IEBAIGNsYXNzIEhQUEJ1ZmZlciA6IHB1YmxpYyB2a2I6
OmNvcmU6OkhQUFZ1bGthblJlc291cmNlPHZrOjpCdWZmZXI+Ci0gCi0gCVZtYUFsbG9jYXRpb24g
IGdldF9hbGxvY2F0aW9uKCkgY29uc3Q7Ci0gCWNvbnN0IHVpbnQ4X3QgKmdldF9kYXRhKCkgY29u
c3Q7Ci0tCVZrRGV2aWNlTWVtb3J5IGdldF9tZW1vcnkoKSBjb25zdDsKLSsJdms6OkRldmljZU1l
bW9yeSBnZXRfbWVtb3J5KCkgY29uc3Q7Ci0gCi0gCS8qKgotIAkgKiBAcmV0dXJuIFJldHVybiB0
aGUgYnVmZmVyJ3MgZGV2aWNlIGFkZHJlc3MgKG5vdGU6IHJlcXVpcmVzIHRoYXQgdGhlIGJ1ZmZl
ciBoYXMgYmVlbiBjcmVhdGVkIHdpdGggdGhlIFZLX0JVRkZFUl9VU0FHRV9TSEFERVJfREVWSUNF
X0FERFJFU1NfQklUIHVzYWdlIGZsYSkKLWRpZmYgLS1naXQgYS9mcmFtZXdvcmsvY29yZS9ocHBf
aW1hZ2UuY3BwIGIvZnJhbWV3b3JrL2NvcmUvaHBwX2ltYWdlLmNwcAotaW5kZXggMDBmYTg5YmE3
Li41ZTZmMjczNjMgMTAwNjQ0Ci0tLS0gYS9mcmFtZXdvcmsvY29yZS9ocHBfaW1hZ2UuY3BwCi0r
KysgYi9mcmFtZXdvcmsvY29yZS9ocHBfaW1hZ2UuY3BwCi1AQCAtMTM4LDcgKzEzOCw3IEBAIEhQ
UEltYWdlOjp+SFBQSW1hZ2UoKQotIAlpZiAoZ2V0X2hhbmRsZSgpICYmIG1lbW9yeSkKLSAJewot
IAkJdW5tYXAoKTsKLS0JCXZtYURlc3Ryb3lJbWFnZShnZXRfZGV2aWNlKCkuZ2V0X21lbW9yeV9h
bGxvY2F0b3IoKSwgZ2V0X2hhbmRsZSgpLCBtZW1vcnkpOwotKwkJdm1hRGVzdHJveUltYWdlKGdl
dF9kZXZpY2UoKS5nZXRfbWVtb3J5X2FsbG9jYXRvcigpLCBzdGF0aWNfY2FzdDxWa0ltYWdlPihn
ZXRfaGFuZGxlKCkpLCBtZW1vcnkpOwotIAl9Ci0gfQotIAotZGlmZiAtLWdpdCBhL3NhbXBsZXMv
YXBpL2hwcF90ZXh0dXJlX2xvYWRpbmcvaHBwX3RleHR1cmVfbG9hZGluZy5jcHAgYi9zYW1wbGVz
L2FwaS9ocHBfdGV4dHVyZV9sb2FkaW5nL2hwcF90ZXh0dXJlX2xvYWRpbmcuY3BwCi1pbmRleCAx
MWExZjI0YzEuLmNiZGQyMjc3MyAxMDA2NDQKLS0tLSBhL3NhbXBsZXMvYXBpL2hwcF90ZXh0dXJl
X2xvYWRpbmcvaHBwX3RleHR1cmVfbG9hZGluZy5jcHAKLSsrKyBiL3NhbXBsZXMvYXBpL2hwcF90
ZXh0dXJlX2xvYWRpbmcvaHBwX3RleHR1cmVfbG9hZGluZy5jcHAKLUBAIC0xNzAsNyArMTcwLDcg
QEAgdm9pZCBIUFBUZXh0dXJlTG9hZGluZzo6bG9hZF90ZXh0dXJlKCkKLSAJCW1lbW9yeV9hbGxv
Y2F0ZV9pbmZvICA9IHttZW1vcnlfcmVxdWlyZW1lbnRzLnNpemUsCi0gCQkgICAgICAgICAgICAg
ICAgICAgICAgICAgZ2V0X2RldmljZSgpLT5nZXRfZ3B1KCkuZ2V0X21lbW9yeV90eXBlKG1lbW9y
eV9yZXF1aXJlbWVudHMubWVtb3J5VHlwZUJpdHMsIHZrOjpNZW1vcnlQcm9wZXJ0eUZsYWdCaXRz
OjplRGV2aWNlTG9jYWwpfTsKLSAJCXRleHR1cmUuZGV2aWNlX21lbW9yeSA9IGdldF9kZXZpY2Uo
KS0+Z2V0X2hhbmRsZSgpLmFsbG9jYXRlTWVtb3J5KG1lbW9yeV9hbGxvY2F0ZV9pbmZvKTsKLS0J
CVZLX0NIRUNLKHZrQmluZEltYWdlTWVtb3J5KGdldF9kZXZpY2UoKS0+Z2V0X2hhbmRsZSgpLCB0
ZXh0dXJlLmltYWdlLCB0ZXh0dXJlLmRldmljZV9tZW1vcnksIDApKTsKLSsJCWdldF9kZXZpY2Uo
KS0+Z2V0X2hhbmRsZSgpLmJpbmRJbWFnZU1lbW9yeSh0ZXh0dXJlLmltYWdlLCB0ZXh0dXJlLmRl
dmljZV9tZW1vcnksIDApOwotIAotIAkJdms6OkNvbW1hbmRCdWZmZXIgY29weV9jb21tYW5kID0g
Z2V0X2RldmljZSgpLT5jcmVhdGVfY29tbWFuZF9idWZmZXIodms6OkNvbW1hbmRCdWZmZXJMZXZl
bDo6ZVByaW1hcnksIHRydWUpOwotIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3Z1bGthbi92dWxrYW4tc2FtcGxlc19naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1zYW1wbGVzX2dpdC5iYgppbmRleCA2NmYxZWY1ZTlkLi41ZmI0NjhkMmNjIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzX2dp
dC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzX2dp
dC5iYgpAQCAtNywxMyArNywxMSBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT00OGFhMzVjZWZiNzY4NDM2MjIzYTZlN2YxOGRjMmEyYSIKIAogU1JDX1VSSSA9ICJnaXRz
bTovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1TYW1wbGVzLmdpdDticmFuY2g9bWFp
bjtwcm90b2NvbD1odHRwcztsZnM9MCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXZ1bGthbi1z
YW1wbGVzLUZpeC1yZXByb2R1Y2liaWxpdHktaXNzdWUucGF0Y2ggXAotICAgICAgICAgICBmaWxl
Oi8vMDAwMS1Eby1ub3QtdXNlLUxGUzY0LWZ1bmN0aW9ucy1vbi1saW51eC1tdXNsLnBhdGNoO3Bh
dGNoZGlyPXRoaXJkX3BhcnR5L3NwZGxvZyBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLURlcHJl
Y2F0ZS11OHN0cmluZ192aWV3LnBhdGNoO3BhdGNoZGlyPXRoaXJkX3BhcnR5L3NwZGxvZyBcCi0g
ICAgICAgICAgIGZpbGU6Ly8zMmJpdC5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAyLUNv
bW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIFwKICAgICAgICAgICAgIgogCiBV
UFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCi1TUkNSRVYgPSAiMjMwN2MzZWI1NjA4Y2IxMjA1
ZmEzNTE0YjNhMzFkYmZiODU3ZDAwYyIKK1NSQ1JFViA9ICIxMDQ4NzQwYjJhNGFkZGUxYjhjYjAx
YzYzNzMyYmRkZTNkNDIxNDdiIgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJUaGVz
ZSBhcmUgbm90IHRoZSByZWxlYXNlcyB5b3UncmUgbG9va2luZyBmb3IiCiBTID0gIiR7V09SS0RJ
Un0vZ2l0IgotLSAKMi4zOS4yCgo=

--===============3840447276661012888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-3caad1b3f0d465e5146f923f6b64d044cb18ddf2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3caad1b3f0d465e5146f923f6b64d044cb18ddf2"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 36 Mirrors 0 Missed 10 Current 239 (78% match, 96% complete)
Removing 9 stale sstate objects for arch core2-32...done.
Removing 1 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 766 of 855 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_recipe_qa)
NOTE: recipe vulkan-samples-git-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-samples-git-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_recipe_qa unihash changed to 194835427bb78d33ccbff9bfe79f3458147852caea8e73038c653637ee8b7589
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-samples/git/temp/log.do_patch.272299
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_patch) failed with exit code '1'

--===============3840447276661012888==--

