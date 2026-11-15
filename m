Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2966.1794721856087942734
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 21:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GfaFRmwD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ozhrV5HA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1ddc23673-3509fb04-acf6-4b59-b799-a5db66d15270-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794721855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Pe/zRbQfbfJKkmNnJNMao23KxNwqeR9WqGPWwptGDeE=;
	b=GfaFRmwD3p/N20e2DEN2P+RoEIvCE3g8EYr22jAiB4ebU9J2rO7+4m7LwtKE7P5Z
	CATzQORfjg9nUZGqm4WSv3rdITTyeRxSSm5mWnQKnVUSaG/BGgFRcYVEyQ+JrKo8bu9
	JEhyMEcIbLRpbrW5Rm/h8EOjvvvLHXm9lEjKImGk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794721855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Pe/zRbQfbfJKkmNnJNMao23KxNwqeR9WqGPWwptGDeE=;
	b=ozhrV5HAgYAC3KEZQpywR7aZ4vKO0+YxibkQzrvwdtARylqR9tdV6updReAA7hQ1
	/9faE8fGDiPwLjbhRRDqbnvODmksfIkB0LyVQAwOM8NKcLFr6/5CI9afDtg0l9QWk0L
	yHApTeQcznjA4fPdzqz0VjhPoETvywvfsjuD3sAI=
Content-Type: multipart/mixed; boundary="===============5398093610190215615=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 b4fb432b80234e54cf7be7411f20b65494a5b0f5 FAILED
Message-ID: <010101a1ddc23673-3509fb04-acf6-4b59-b799-a5db66d15270-000000@us-west-2.amazonses.com>
Date: Sun, 15 Nov 2026 05:50:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 05:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250224

--===============5398093610190215615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *b4fb432b80234e54cf7be7411f20b65494a5b0f5* has Failed(do_compile).

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
From e47aeca6df4c8df9a7078a2440fda3a421665603 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Nov 2026 05:32:56 +0000
Subject: [PATCH] vulkan-samples: upgrade to latest revision

Merge pull request #1596 from ARM-software/fix/antora-node-version
Pin Node.js version for Antora documentation CI
Add a check for full screen exclusive support to the GPU selection
Load spirv in ShaderModule from data or file, instead of just file.
Fix TOSA RESCALE operands in tensor image aliasing sample
Resolve VVL error about wrong image layout in extensions sample
dynamic_rendering_local_read.
Unify vkb::VulkanException and vkb::common::HPPVulkanException into
vkb::common::VulkanException<bindingType>
Use textureLod instead of the texture
Fix broken links in Tensor and Data Graph examples.
Support Vulkan Loader and VVL on iOS Simulator for SDKs >= 1.4.357
Remove unused PostProcessingComputePass
upgrade clang-tools for CI
Fix disabled FIFO latest ready mode in swapchain recreation
Limit clang-tidy CI check to C/C++ source files
Align all general DebugUtilsMessengerCallbacks as in hpp_hello_triangle.
Fix acquire semaphore handling for suboptimal swapchains
Fix usage of
vkCreateDebugUtilsMessengerEXT/vk::Instance::createDebugUtilsMessengerEXT.
Unify vkb::ShaderModule and vkb::core::HPPShaderModule into
vkb::core::ShaderModule<bindingType>
Use correct compile define
Remove C++20 requirement
Use correct regionCount Fixes #1581
Fix GUI buffer update with deferred allocation
Update assets submodule to include upstream additions
Cleanup on debug callback.
Refactor device extension handling
Add a Gaussian Splat and octomap rendering sample
Add sample demonstrating VK_EXT_layer_settings usage
Change framework.lib from object to static lib.
Adjust wording
Add simple API sample for VK_EXT_present_timing.
Add new sample for VK_EXT_descriptor_heap
Limit number of columns in framework to 120
Add a new sample for VK_EXT_device_fault
add shader quad control sample demonstrating VK_KHR_shader_quad_control
features.
Move call to ApiVulkanSample::submit_frame to after submitting both graphics
command buffers
Unify vkb::PipelineState and vkb::rendering::HPPPipelineState into
vkb::rendering::PipelineState<bindingType>
Add VK_KHR_pipeline_binary sample
Merge pull request #1551 from KhronosGroup/contributing/add-ai-block
chore: Fix dates and reintroduce old style copyright
chore: Updates to CONTRIBUTING.adoc - Remove old style Apache 2.0 headers in
favour of SPDX headers - Update example headers to use new SPDX headers - Add
Khronos copyright for 2026
chore: Add AI-Assisted Contributions and fix CLA pre-disclosure
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 3d965ff22e..e53a7da4df 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "383471195757abdd43339c464db60449619d4f84"
+SRCREV = "b4fb432b80234e54cf7be7411f20b65494a5b0f5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 
-- 
2.47.1


--===============5398093610190215615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-3f1bc48bec5f87d82e8ccd5be0a66e9a6b25f202"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3f1bc48bec5f87d82e8ccd5be0a66e9a6b25f202"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 69 Local 58 Mirrors 0 Missed 11 Current 303 (84% match, 97% complete)
done.
Removing 8 stale sstate objects for arch x86-64-v3...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 890 of 1009 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_fetch)
NOTE: recipe vulkan-samples-git-r0: task do_fetch: Started
WARNING: vulkan-samples-git-r0 do_fetch: Failed to fetch URL gitsm://github.com/KhronosGroup/Vulkan-Samples-Assets;protocol=https;name=assets;subpath=assets;nobranch=1;lfs=0;bareclone=1;nobranch=1, attempting MIRRORS if available
WARNING: vulkan-samples-git-r0 do_fetch: Failed to fetch URL gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0, attempting MIRRORS if available
NOTE: recipe vulkan-samples-git-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 990 tasks of which 989 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261115053230.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261115053230.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-samples/git/temp/log.do_fetch.3693958
Summary: There were 2 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-samples-git-r0 do_fetch: Fetcher failure: Unable to find revision 2e79ef91d398fc2c50f1802cf94a842a01e9f964 in branch  even from upstream
ERROR: vulkan-samples-git-r0 do_fetch: gitsm: submodule download failed: FetchError Fetcher failure for URL: 'gitsm://github.com/KhronosGroup/Vulkan-Samples-Assets;protocol=https;name=assets;subpath=assets;nobranch=1;lfs=0;bareclone=1;nobranch=1'. Unable to fetch URL from any source.
ERROR: vulkan-samples-git-r0 do_fetch: Fetcher failure for URL: 'gitsm://github.com/KhronosGroup/Vulkan-Samples-Assets;protocol=https;name=assets;subpath=assets;nobranch=1;lfs=0;bareclone=1;nobranch=1'. Unable to fetch URL from any source.
ERROR: vulkan-samples-git-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-samples/git/temp/log.do_fetch.3693958
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-samples_git.bb:do_fetch) failed with exit code '1'

--===============5398093610190215615==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-samples-upgrade-to-latest-revision.patch"

RnJvbSBlNDdhZWNhNmRmNGM4ZGY5YTcwNzhhMjQ0MGZkYTNhNDIxNjY1NjAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTm92IDIwMjYgMDU6MzI6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tc2FtcGxlczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCk1lcmdlIHB1bGwgcmVx
dWVzdCAjMTU5NiBmcm9tIEFSTS1zb2Z0d2FyZS9maXgvYW50b3JhLW5vZGUtdmVyc2lvbgpQaW4g
Tm9kZS5qcyB2ZXJzaW9uIGZvciBBbnRvcmEgZG9jdW1lbnRhdGlvbiBDSQpBZGQgYSBjaGVjayBm
b3IgZnVsbCBzY3JlZW4gZXhjbHVzaXZlIHN1cHBvcnQgdG8gdGhlIEdQVSBzZWxlY3Rpb24KTG9h
ZCBzcGlydiBpbiBTaGFkZXJNb2R1bGUgZnJvbSBkYXRhIG9yIGZpbGUsIGluc3RlYWQgb2YganVz
dCBmaWxlLgpGaXggVE9TQSBSRVNDQUxFIG9wZXJhbmRzIGluIHRlbnNvciBpbWFnZSBhbGlhc2lu
ZyBzYW1wbGUKUmVzb2x2ZSBWVkwgZXJyb3IgYWJvdXQgd3JvbmcgaW1hZ2UgbGF5b3V0IGluIGV4
dGVuc2lvbnMgc2FtcGxlCmR5bmFtaWNfcmVuZGVyaW5nX2xvY2FsX3JlYWQuClVuaWZ5IHZrYjo6
VnVsa2FuRXhjZXB0aW9uIGFuZCB2a2I6OmNvbW1vbjo6SFBQVnVsa2FuRXhjZXB0aW9uIGludG8K
dmtiOjpjb21tb246OlZ1bGthbkV4Y2VwdGlvbjxiaW5kaW5nVHlwZT4KVXNlIHRleHR1cmVMb2Qg
aW5zdGVhZCBvZiB0aGUgdGV4dHVyZQpGaXggYnJva2VuIGxpbmtzIGluIFRlbnNvciBhbmQgRGF0
YSBHcmFwaCBleGFtcGxlcy4KU3VwcG9ydCBWdWxrYW4gTG9hZGVyIGFuZCBWVkwgb24gaU9TIFNp
bXVsYXRvciBmb3IgU0RLcyA+PSAxLjQuMzU3ClJlbW92ZSB1bnVzZWQgUG9zdFByb2Nlc3NpbmdD
b21wdXRlUGFzcwp1cGdyYWRlIGNsYW5nLXRvb2xzIGZvciBDSQpGaXggZGlzYWJsZWQgRklGTyBs
YXRlc3QgcmVhZHkgbW9kZSBpbiBzd2FwY2hhaW4gcmVjcmVhdGlvbgpMaW1pdCBjbGFuZy10aWR5
IENJIGNoZWNrIHRvIEMvQysrIHNvdXJjZSBmaWxlcwpBbGlnbiBhbGwgZ2VuZXJhbCBEZWJ1Z1V0
aWxzTWVzc2VuZ2VyQ2FsbGJhY2tzIGFzIGluIGhwcF9oZWxsb190cmlhbmdsZS4KRml4IGFjcXVp
cmUgc2VtYXBob3JlIGhhbmRsaW5nIGZvciBzdWJvcHRpbWFsIHN3YXBjaGFpbnMKRml4IHVzYWdl
IG9mCnZrQ3JlYXRlRGVidWdVdGlsc01lc3NlbmdlckVYVC92azo6SW5zdGFuY2U6OmNyZWF0ZURl
YnVnVXRpbHNNZXNzZW5nZXJFWFQuClVuaWZ5IHZrYjo6U2hhZGVyTW9kdWxlIGFuZCB2a2I6OmNv
cmU6OkhQUFNoYWRlck1vZHVsZSBpbnRvCnZrYjo6Y29yZTo6U2hhZGVyTW9kdWxlPGJpbmRpbmdU
eXBlPgpVc2UgY29ycmVjdCBjb21waWxlIGRlZmluZQpSZW1vdmUgQysrMjAgcmVxdWlyZW1lbnQK
VXNlIGNvcnJlY3QgcmVnaW9uQ291bnQgRml4ZXMgIzE1ODEKRml4IEdVSSBidWZmZXIgdXBkYXRl
IHdpdGggZGVmZXJyZWQgYWxsb2NhdGlvbgpVcGRhdGUgYXNzZXRzIHN1Ym1vZHVsZSB0byBpbmNs
dWRlIHVwc3RyZWFtIGFkZGl0aW9ucwpDbGVhbnVwIG9uIGRlYnVnIGNhbGxiYWNrLgpSZWZhY3Rv
ciBkZXZpY2UgZXh0ZW5zaW9uIGhhbmRsaW5nCkFkZCBhIEdhdXNzaWFuIFNwbGF0IGFuZCBvY3Rv
bWFwIHJlbmRlcmluZyBzYW1wbGUKQWRkIHNhbXBsZSBkZW1vbnN0cmF0aW5nIFZLX0VYVF9sYXll
cl9zZXR0aW5ncyB1c2FnZQpDaGFuZ2UgZnJhbWV3b3JrLmxpYiBmcm9tIG9iamVjdCB0byBzdGF0
aWMgbGliLgpBZGp1c3Qgd29yZGluZwpBZGQgc2ltcGxlIEFQSSBzYW1wbGUgZm9yIFZLX0VYVF9w
cmVzZW50X3RpbWluZy4KQWRkIG5ldyBzYW1wbGUgZm9yIFZLX0VYVF9kZXNjcmlwdG9yX2hlYXAK
TGltaXQgbnVtYmVyIG9mIGNvbHVtbnMgaW4gZnJhbWV3b3JrIHRvIDEyMApBZGQgYSBuZXcgc2Ft
cGxlIGZvciBWS19FWFRfZGV2aWNlX2ZhdWx0CmFkZCBzaGFkZXIgcXVhZCBjb250cm9sIHNhbXBs
ZSBkZW1vbnN0cmF0aW5nIFZLX0tIUl9zaGFkZXJfcXVhZF9jb250cm9sCmZlYXR1cmVzLgpNb3Zl
IGNhbGwgdG8gQXBpVnVsa2FuU2FtcGxlOjpzdWJtaXRfZnJhbWUgdG8gYWZ0ZXIgc3VibWl0dGlu
ZyBib3RoIGdyYXBoaWNzCmNvbW1hbmQgYnVmZmVycwpVbmlmeSB2a2I6OlBpcGVsaW5lU3RhdGUg
YW5kIHZrYjo6cmVuZGVyaW5nOjpIUFBQaXBlbGluZVN0YXRlIGludG8KdmtiOjpyZW5kZXJpbmc6
OlBpcGVsaW5lU3RhdGU8YmluZGluZ1R5cGU+CkFkZCBWS19LSFJfcGlwZWxpbmVfYmluYXJ5IHNh
bXBsZQpNZXJnZSBwdWxsIHJlcXVlc3QgIzE1NTEgZnJvbSBLaHJvbm9zR3JvdXAvY29udHJpYnV0
aW5nL2FkZC1haS1ibG9jawpjaG9yZTogRml4IGRhdGVzIGFuZCByZWludHJvZHVjZSBvbGQgc3R5
bGUgY29weXJpZ2h0CmNob3JlOiBVcGRhdGVzIHRvIENPTlRSSUJVVElORy5hZG9jIC0gUmVtb3Zl
IG9sZCBzdHlsZSBBcGFjaGUgMi4wIGhlYWRlcnMgaW4KZmF2b3VyIG9mIFNQRFggaGVhZGVycyAt
IFVwZGF0ZSBleGFtcGxlIGhlYWRlcnMgdG8gdXNlIG5ldyBTUERYIGhlYWRlcnMgLSBBZGQKS2hy
b25vcyBjb3B5cmlnaHQgZm9yIDIwMjYKY2hvcmU6IEFkZCBBSS1Bc3Npc3RlZCBDb250cmlidXRp
b25zIGFuZCBmaXggQ0xBIHByZS1kaXNjbG9zdXJlCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3Z1bGthbi92dWxrYW4tc2FtcGxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvdnVsa2FuL3Z1bGthbi1zYW1wbGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLXNhbXBsZXNfZ2l0LmJiCmluZGV4IDNkOTY1ZmYyMmUuLmU1M2E3ZGE0
ZGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBs
ZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXNhbXBs
ZXNfZ2l0LmJiCkBAIC05LDcgKzksNyBAQCBTUkNfVVJJID0gImdpdHNtOi8vZ2l0aHViLmNvbS9L
aHJvbm9zR3JvdXAvVnVsa2FuLVNhbXBsZXMuZ2l0O2JyYW5jaD1tYWluO3Byb3RvYwogICAgICAg
ICAgICAiCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICIzODM0NzEx
OTU3NTdhYmRkNDMzMzljNDY0ZGI2MDQ0OTYxOWQ0Zjg0IgorU1JDUkVWID0gImI0ZmI0MzJiODAy
MzRlNTRjZjdiZTc0MTFmMjBiNjU0OTRhNWIwZjUiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JF
R0VYID0gIlRoZXNlIGFyZSBub3QgdGhlIHJlbGVhc2VzIHlvdSdyZSBsb29raW5nIGZvciIKIAot
LSAKMi40Ny4xCgo=

--===============5398093610190215615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="vulkan-samples-changelog.txt"

Merge pull request #1596 from ARM-software/fix/antora-node-version
Pin Node.js version for Antora documentation CI
Add a check for full screen exclusive support to the GPU selection
Load spirv in ShaderModule from data or file, instead of just file.
Fix TOSA RESCALE operands in tensor image aliasing sample
Resolve VVL error about wrong image layout in extensions sample
dynamic_rendering_local_read.
Unify vkb::VulkanException and vkb::common::HPPVulkanException into
vkb::common::VulkanException<bindingType>
Use textureLod instead of the texture
Fix broken links in Tensor and Data Graph examples.
Support Vulkan Loader and VVL on iOS Simulator for SDKs >= 1.4.357
Remove unused PostProcessingComputePass
upgrade clang-tools for CI
Fix disabled FIFO latest ready mode in swapchain recreation
Limit clang-tidy CI check to C/C++ source files
Align all general DebugUtilsMessengerCallbacks as in hpp_hello_triangle.
Fix acquire semaphore handling for suboptimal swapchains
Fix usage of
vkCreateDebugUtilsMessengerEXT/vk::Instance::createDebugUtilsMessengerEXT.
Unify vkb::ShaderModule and vkb::core::HPPShaderModule into
vkb::core::ShaderModule<bindingType>
Use correct compile define
Remove C++20 requirement
Use correct regionCount Fixes #1581
Fix GUI buffer update with deferred allocation
Update assets submodule to include upstream additions
Cleanup on debug callback.
Refactor device extension handling
Add a Gaussian Splat and octomap rendering sample
Add sample demonstrating VK_EXT_layer_settings usage
Change framework.lib from object to static lib.
Adjust wording
Add simple API sample for VK_EXT_present_timing.
Add new sample for VK_EXT_descriptor_heap
Limit number of columns in framework to 120
Add a new sample for VK_EXT_device_fault
add shader quad control sample demonstrating VK_KHR_shader_quad_control
features.
Move call to ApiVulkanSample::submit_frame to after submitting both graphics
command buffers
Unify vkb::PipelineState and vkb::rendering::HPPPipelineState into
vkb::rendering::PipelineState<bindingType>
Add VK_KHR_pipeline_binary sample
Merge pull request #1551 from KhronosGroup/contributing/add-ai-block
chore: Fix dates and reintroduce old style copyright
chore: Updates to CONTRIBUTING.adoc - Remove old style Apache 2.0 headers in
favour of SPDX headers - Update example headers to use new SPDX headers - Add
Khronos copyright for 2026
chore: Add AI-Assisted Contributions and fix CLA pre-disclosure

--===============5398093610190215615==--
