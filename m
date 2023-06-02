Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB37C87FDD
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:41 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.7623.1685693431636385776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hHdjhO1K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b288fa0-88ed86b7-0ce2-49df-8e72-d38c64885882-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bACQE0SAHUMFSglNBkyPkCYRkdwyFMwOCZzjqGdjFBw=;
	b=hHdjhO1KculTNObqPwX/r6q3quSikdMj9+nMbqDqZ94DFJ9HyW+09SIxrQiShzEu
	M3ISmO+aZBm/fu+lX/LtBasUvNkicCH10OsG+P8WpwkAmpRXAOw1U/sGjCVxbDp8ZrJ
	DOcKr6CEoBVjDx2MZFJ40Bxf+Psk6T3Z2VWa9BJc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bACQE0SAHUMFSglNBkyPkCYRkdwyFMwOCZzjqGdjFBw=;
	b=hiatU+/E8JP91sbxAbmRX2R+OXIpBF4llu0euFW6+5ZqzmhkzIT29JwYxzEuZicL
	ejocUqFoniQrRN9+PAtRcksttkT6QMQNzdMfrDQOpYpns0MXidXdLwHHnaFolBDDe2r
	7HLFg3GQYw7tauKAx+ned1kCy23X260xYXJx4O6Q=
Content-Type: multipart/mixed; boundary="===============1825112608473301717=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-good: upgrading to 1.22.3 SUCCEEDED
Message-ID: <010101887b288fa0-88ed86b7-0ce2-49df-8e72-d38c64885882-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182272

--===============1825112608473301717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-good* to *1.22.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-good-upgrade-1.22.2-1.22.3.patch
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
--===============1825112608473301717==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-good-upgrade-1.22.2-1.22.3.patch"

RnJvbSA1YjljZTg5YmNhMTM5MGIyMTM1NmM5MTczN2ViMzc2NTBmMmE4MzhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwNDoyMDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1wbHVnaW5zLWdvb2Q6IHVwZ3JhZGUgMS4yMi4yIC0+IDEuMjIuMwoKLS0tCiAu
Li51Z2lucy1nb29kXzEuMjIuMi5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjIu
My5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWdvb2RfMS4yMi4yLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4y
Mi4zLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjIuMi5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjIuMy5iYgpz
aW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIyLjIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29k
XzEuMjIuMy5iYgppbmRleCBhOTM1Mjk0OWI1Li44ZGUxZDFjNWY1IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8x
LjIyLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWdvb2RfMS4yMi4zLmJiCkBAIC04LDcgKzgsNyBAQCBTUkNfVVJJID0gImh0
dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtZ29vZC9nc3Qt
cGx1Z2lucy1nbwogICAgICAgICAgICBmaWxlOi8vMDAwMS1xdC1pbmNsdWRlLWV4dC1xdC1nc3Rx
dGdsLmgtaW5zdGVhZC1vZi1nc3QtZ2wtZ3N0Z2xmLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtdjRsMi1EZWZpbmUtaW9jdGxfcmVxX3QtZm9yLXBvc2l4LWxpbnV4LWNhc2UucGF0Y2gi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3YzhjYzU5NDI1ZjJiMjMyZjYwY2E3ZDEzZTU2ZWRk
NjE1ZGE0ZjcxMWU3M2RkMDFhN2NmZmE0NmU2YmMwY2RkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImFmODExNTRiM2EyZWYzZjRkMmZlYmEzOTVmMjU2OTZmZWVhNmZkMTNlYzYyYzkyZDNjN2E5NzM0
NzA3MTAyNzMiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtcGx1Z2lucy1nb29kLSR7UFZ9IgogCi0t
IAoyLjM5LjIKCg==

--===============1825112608473301717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:232399fa0e1415b01e0bc21eb9f3cabc05ed1abb"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 102 Local 31 Mirrors 0 Missed 71 Current 606 (30% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 625 of 708 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 708 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.22.2-r0/temp/log.do_packagedata_setscene.2866871
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 707 of 708 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_package_setscene)
NOTE: Running task 1920 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1929 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1930 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_fetch)
NOTE: Running task 1931 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1992 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1993 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1994 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: Running task 1995 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_fetch)
NOTE: Running task 2050 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 2060 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_fetch)
NOTE: Running task 2073 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 2083 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_fetch)
NOTE: Running task 2114 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2116 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 2117 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 2118 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 2125 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe ell-0.57-r0: task do_fetch: Started
NOTE: Running task 2168 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Started
NOTE: Running task 2207 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe ell-0.57-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 2233 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 2234 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_unpack)
NOTE: Running task 2235 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: Running task 2236 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2237 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: Running task 2238 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.1-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: Running task 2241 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_write_config)
NOTE: Running task 2251 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: Running task 2252 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Started
NOTE: recipe ofono-2.1-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe taglib-1.13-r0: task do_fetch: Started
NOTE: Running task 2253 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_unpack)
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: Running task 2254 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2255 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 2256 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2257 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_unpack)
NOTE: Running task 2258 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: Running task 2259 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_fetch: Started
NOTE: Running task 2260 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: Running task 2261 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2262 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_unpack)
NOTE: Running task 2263 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2264 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2265 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: Running task 2266 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2267 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: Running task 2268 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2269 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_unpack)
NOTE: Running task 2270 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.57-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.57-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2271 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2272 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_write_config: Started
NOTE: recipe ofono-2.1-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Started
NOTE: Running task 2273 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2274 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2275 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2276 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.57-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: Running task 2277 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2278 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2279 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: Running task 2280 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe ofono-2.1-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: Running task 2281 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_patch)
NOTE: Running task 2282 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_package_setscene: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.57-r0: task do_patch: Started
NOTE: Running task 2283 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2284 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2285 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: Running task 2286 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: Running task 2287 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2288 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.1-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2289 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2290 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 2291 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2293 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2294 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.1-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 2295 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2296 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: Running task 2297 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_generate_toolchain_file)
NOTE: Running task 2298 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2299 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_patch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2300 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2301 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2302 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: Running task 2303 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_generate_toolchain_file)
NOTE: Running task 2304 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2305 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: Running task 2306 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.57-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe ell-0.57-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2307 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: Running task 2308 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2309 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_populate_lic)
NOTE: Running task 2310 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2311 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_configure)
NOTE: Running task 2312 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe ell-0.57-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2313 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2314 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Started
NOTE: recipe ell-0.57-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_populate_lic unihash changed to 2d66a4cb4db3ca6fcf439c76f297f88cd984286b74adfbfcae36c433e8b51e07
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2315 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2316 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe ell-0.57-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2317 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2329 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2330 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Succeeded
NOTE: Running task 2332 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Succeeded
NOTE: Running task 2333 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Succeeded
NOTE: Running task 2334 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2335 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe taglib-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2337 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Failed
NOTE: recipe taglib-1.13-r0: task do_install: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: recipe ell-0.57-r0: task do_configure: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2337 tasks of which 2235 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-src went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-dbg went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-staticdev went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-dev went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-doc went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-locale went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/mobile-broadband-provider-info/1_20221107-r0/temp/log.do_packagedata.2877308
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata) failed with exit code '1'

--===============1825112608473301717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:232399fa0e1415b01e0bc21eb9f3cabc05ed1abb"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 103 Local 32 Mirrors 0 Missed 71 Current 601 (31% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 621 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1914 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1922 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1924 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_fetch)
NOTE: Running task 1925 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1973 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1974 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1977 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_fetch)
NOTE: Running task 1978 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: Running task 2033 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 2042 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_fetch)
NOTE: Running task 2058 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 2065 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_fetch)
NOTE: Running task 2097 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 2098 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 2099 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2100 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 2110 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: Running task 2150 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-base/1.22.2-r0/temp/log.do_packagedata_setscene.2895849
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 703 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_package_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe ell-0.57-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: recipe ell-0.57-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe ofono-2.1-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Started
NOTE: Running task 2185 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: recipe taglib-1.13-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe ofono-2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2186 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: Running task 2187 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_unpack)
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe taglib-1.13-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: Running task 2188 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: Running task 2189 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: Running task 2190 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2191 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_unpack)
NOTE: Running task 2192 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: Running task 2193 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 2194 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2195 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_unpack)
NOTE: Running task 2196 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2197 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2198 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2199 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2200 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2201 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2202 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_unpack)
NOTE: Running task 2203 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2204 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: Running task 2205 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2206 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2207 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2208 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: Running task 2209 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_unpack)
NOTE: Running task 2214 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: Running task 2215 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.57-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe ofono-2.1-r0: task do_unpack: Started
NOTE: Running task 2216 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2229 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 2241 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: Running task 2246 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_write_config)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.57-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2256 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.57-r0: task do_unpack: Succeeded
NOTE: Running task 2257 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: Running task 2258 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2259 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe taglib-1.13-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_write_config: Started
NOTE: Running task 2260 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_patch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 2261 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2262 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe ofono-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2263 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: Running task 2264 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_patch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: Running task 2265 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.57-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2266 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: Running task 2267 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2268 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.1-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2269 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2270 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2271 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 2272 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 2273 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 2274 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.1-r0: task do_patch: Succeeded
NOTE: Running task 2275 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_patch)
NOTE: Running task 2276 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_package_setscene: Started
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: Running task 2277 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_patch: Succeeded
NOTE: Running task 2278 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_generate_toolchain_file)
NOTE: Running task 2279 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2280 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_generate_toolchain_file)
NOTE: Running task 2281 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 2282 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Succeeded
NOTE: Running task 2283 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2284 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2285 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2286 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2287 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: Running task 2288 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2289 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe ell-0.57-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.57-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 2291 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: Running task 2292 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_populate_lic)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2293 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.57-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2294 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2295 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: Running task 2296 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_configure: Started
NOTE: Running task 2297 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe ell-0.57-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2298 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_populate_lic unihash changed to 2d66a4cb4db3ca6fcf439c76f297f88cd984286b74adfbfcae36c433e8b51e07
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.57-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2299 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2311 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2312 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13-r0: task do_configure: Succeeded
NOTE: Running task 2313 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Succeeded
NOTE: Running task 2315 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Succeeded
NOTE: Running task 2316 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2317 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Succeeded
NOTE: Running task 2318 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_install)
NOTE: recipe taglib-1.13-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Failed
NOTE: recipe taglib-1.13-r0: task do_install: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: recipe ell-0.57-r0: task do_configure: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2319 tasks of which 2217 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-src went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-dbg went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-staticdev went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-dev went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-doc went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-locale went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/mobile-broadband-provider-info/1_20221107-r0/temp/log.do_packagedata.2906189
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata) failed with exit code '1'

--===============1825112608473301717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 117 recipes from the core2-32 sysroot...done.
Removing 116 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:232399fa0e1415b01e0bc21eb9f3cabc05ed1abb"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 475 Local 408 Mirrors 0 Missed 67 Current 210 (85% match, 90% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 211 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 218 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 225 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 274 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 941 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 944 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_fetch)
NOTE: Running task 945 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 946 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 959 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_fetch)
NOTE: Running task 960 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 961 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 970 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 971 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_fetch)
NOTE: Running task 974 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 977 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_fetch)
NOTE: Running task 983 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 984 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 985 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 986 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 993 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: Running task 998 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_fetch)
NOTE: Running task 1014 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: Running task 1016 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Started
NOTE: recipe ell-0.57-r0: task do_fetch: Started
NOTE: recipe ofono-2.1-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: Running task 1018 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 1019 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: recipe taglib-1.13-r0: task do_fetch: Started
NOTE: recipe ell-0.57-r0: task do_fetch: Succeeded
NOTE: recipe ofono-2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1020 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_unpack)
NOTE: Running task 1021 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: Running task 1022 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Started
NOTE: recipe taglib-1.13-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: Running task 1023 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_unpack)
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 313 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: Running task 1024 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Succeeded
NOTE: Running task 1025 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_write_config: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 319 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: Running task 1029 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_unpack)
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: Running task 1031 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: Running setscene task 325 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 330 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ofono-2.1-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe ell-0.57-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 1045 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1050 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 1051 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 1052 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: Running task 1053 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_unpack)
NOTE: Running task 1054 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.13-r0: task do_unpack: Started
NOTE: Running task 1055 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Started
NOTE: recipe taglib-1.13-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1056 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.57-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1058 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-base/1.22.2-r0/temp/log.do_packagedata_setscene.2983039
NOTE: Running task 1059 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 334 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_package_setscene)
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe taglib-1.13-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: recipe ofono-2.1-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe ell-0.57-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 339 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 343 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe taglib-1.13-r0: task do_patch: Succeeded
NOTE: recipe ell-0.57-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 350 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 351 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 356 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Succeeded
NOTE: Running task 1086 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 1090 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_patch)
NOTE: Running task 1091 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: Running task 1092 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 1093 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1094 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: Running task 1095 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_patch)
NOTE: Running task 1096 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_deploy_source_date_epoch)
NOTE: Running task 1098 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1099 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 1100 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: Running task 1101 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: Running task 1102 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_patch)
NOTE: Running task 1103 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_generate_toolchain_file)
NOTE: Running task 1104 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1105 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: Running task 1106 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ofono-2.1-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.57-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_patch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1111 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1116 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_generate_toolchain_file)
NOTE: Running task 1117 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1118 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: Running task 1129 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1130 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ofono-2.1-r0: task do_patch: Succeeded
NOTE: Running task 1145 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ell-0.57-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 378 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1154 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1155 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_populate_lic)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: Running task 1156 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1157 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_package_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_populate_lic unihash changed to 2d66a4cb4db3ca6fcf439c76f297f88cd984286b74adfbfcae36c433e8b51e07
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1167 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 384 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 399 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 420 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 472 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 481 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 500 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 507 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 544 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 564 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 565 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 569 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 605 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2089 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2092 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2094 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2095 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2114 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2177 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2178 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2200 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2201 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2243 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata)
NOTE: recipe ell-0.57-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2245 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2246 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 2247 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2248 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: Running task 2249 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_configure)
NOTE: recipe ell-0.57-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2250 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: Running task 2251 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2252 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe taglib-1.13-r0: task do_configure: Started
NOTE: recipe ell-0.57-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2253 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13-r0: task do_configure: Succeeded
NOTE: Running task 2254 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Succeeded
NOTE: Running task 2255 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Succeeded
NOTE: Running task 2256 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Succeeded
NOTE: Running task 2257 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2258 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Succeeded
NOTE: Running task 2259 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2260 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Failed
NOTE: recipe taglib-1.13-r0: task do_install: Started
NOTE: recipe taglib-1.13-r0: task do_install: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Succeeded
NOTE: recipe ell-0.57-r0: task do_configure: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2260 tasks of which 2164 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-src went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-dbg went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-staticdev went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-dev went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-doc went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-locale went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/mobile-broadband-provider-info/1_20221107-r0/temp/log.do_packagedata.3007177
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata) failed with exit code '1'

--===============1825112608473301717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:232399fa0e1415b01e0bc21eb9f3cabc05ed1abb"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 103 Local 32 Mirrors 0 Missed 71 Current 591 (31% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 611 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1902 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1910 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1912 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_fetch)
NOTE: Running task 1913 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1961 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1962 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1963 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: Running task 1966 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_fetch)
NOTE: Running task 2018 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 2027 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_fetch)
NOTE: Running task 2038 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 2047 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_fetch)
NOTE: Running task 2076 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 2077 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 2078 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2079 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 2087 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: Running task 2124 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_fetch)
NOTE: Running task 2152 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: Running task 2181 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_write_config)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe ell-0.57-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: recipe ell-0.57-r0: task do_fetch: Succeeded
NOTE: Running task 2191 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 2192 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2193 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe ofono-2.1-r0: task do_fetch: Started
NOTE: Running task 2194 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Started
NOTE: Running task 2195 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: recipe ofono-2.1-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_fetch: Started
NOTE: Running task 2196 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: Running task 2197 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_unpack)
NOTE: Running task 2198 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: Running task 2199 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe taglib-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 2200 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_unpack)
NOTE: Running task 2201 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-base/1.22.2-r0/temp/log.do_packagedata_setscene.2924549
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 693 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_write_config: Started
NOTE: Running task 2202 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.57-r0: task do_unpack: Started
NOTE: Running task 2203 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.1-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2204 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe ell-0.57-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe ell-0.57-r0: task do_unpack: Succeeded
NOTE: Running task 2205 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2206 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_patch)
NOTE: recipe ofono-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2207 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2208 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: Running task 2209 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_patch)
NOTE: Running task 2210 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 2211 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2212 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2213 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2214 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_unpack)
NOTE: Running task 2215 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2216 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2217 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2218 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: Running task 2219 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2220 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2221 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_unpack)
NOTE: Running task 2222 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2223 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Succeeded
NOTE: Running task 2224 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_patch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe ell-0.57-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: recipe ofono-2.1-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe taglib-1.13-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2225 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2226 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2227 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Started
NOTE: Running task 2228 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2229 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: Running task 2230 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.13-r0: task do_patch: Started
NOTE: Running task 2231 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe ofono-2.1-r0: task do_patch: Succeeded
NOTE: Running task 2232 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: Running task 2233 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2234 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: Running task 2235 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2236 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2237 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.57-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 2238 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.13-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2239 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_generate_toolchain_file)
NOTE: Running task 2240 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 2241 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.57-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2242 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_deploy_source_date_epoch)
NOTE: Running task 2243 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: Running task 2244 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: Running task 2245 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 2246 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_patch)
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2247 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2248 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_package_setscene: Started
NOTE: recipe ell-0.57-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Succeeded
NOTE: Running task 2249 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2250 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_generate_toolchain_file)
NOTE: Running task 2251 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2252 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Succeeded
NOTE: Running task 2253 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2254 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2255 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.57-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2256 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 2257 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2258 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_populate_lic)
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2259 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.57-r0: task do_configure: Started
NOTE: Running task 2260 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2261 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2262 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_populate_lic unihash changed to 2d66a4cb4db3ca6fcf439c76f297f88cd984286b74adfbfcae36c433e8b51e07
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2263 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2275 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata)
NOTE: Running task 2276 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13-r0: task do_configure: Succeeded
NOTE: Running task 2277 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Succeeded
NOTE: Running task 2278 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Succeeded
NOTE: Running task 2279 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Succeeded
NOTE: Running task 2280 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2281 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Succeeded
NOTE: Running task 2282 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2283 of 2378 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Failed
NOTE: recipe taglib-1.13-r0: task do_install: Started
NOTE: recipe taglib-1.13-r0: task do_install: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: recipe ell-0.57-r0: task do_configure: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2283 tasks of which 2181 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-src went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-dbg went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-staticdev went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-dev went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-doc went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-locale went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/mobile-broadband-provider-info/1_20221107-r0/temp/log.do_packagedata.2935433
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata) failed with exit code '1'

--===============1825112608473301717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:232399fa0e1415b01e0bc21eb9f3cabc05ed1abb"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 103 Local 32 Mirrors 0 Missed 71 Current 601 (31% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 621 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-base/1.22.2-r0/temp/log.do_packagedata_setscene.2953987
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 703 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_package_setscene)
NOTE: Running task 1914 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1922 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_fetch)
NOTE: Running task 1923 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1925 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1973 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_fetch)
NOTE: Running task 1974 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1976 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1977 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: Running task 2033 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 2042 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_fetch)
NOTE: Running task 2055 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 2065 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_fetch)
NOTE: Running task 2096 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_fetch)
NOTE: Running task 2097 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2098 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 2099 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 2110 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe ell-0.57-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: Running task 2150 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_fetch)
NOTE: Running task 2186 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_write_config)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.57-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: recipe ofono-2.1-r0: task do_fetch: Started
NOTE: Running task 2206 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 2207 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_unpack)
NOTE: Running task 2208 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: Running task 2209 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2210 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 2211 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.1-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Started
NOTE: Running task 2212 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_unpack)
NOTE: Running task 2213 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: Running task 2214 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe taglib-1.13-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: Running task 2221 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Started
NOTE: Running task 2222 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2223 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2224 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_unpack)
NOTE: Running task 2225 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe taglib-1.13-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: Running task 2226 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: Running task 2227 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2228 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_unpack)
NOTE: Running task 2229 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2230 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2231 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_fetch: Started
NOTE: Running task 2232 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 2233 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe ell-0.57-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: Running task 2234 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_unpack)
NOTE: Running task 2235 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: Running task 2236 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_unpack)
NOTE: Running task 2238 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2239 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.57-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2244 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_write_config)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2247 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe ofono-2.1-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2255 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.2-r0: task do_write_config: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe taglib-1.13-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2256 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.57-r0: task do_unpack: Succeeded
NOTE: Running task 2257 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: Running task 2258 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Started
NOTE: Running task 2259 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_write_config: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2260 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe ell-0.57-r0: task do_patch: Started
NOTE: recipe taglib-1.13-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 2261 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe ofono-2.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_package_setscene: Started
NOTE: Running task 2262 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_patch)
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: Running task 2263 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2264 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Succeeded
NOTE: Running task 2265 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2266 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: Running task 2267 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-2.1-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2268 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_patch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2269 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: Running task 2270 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2271 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Succeeded
NOTE: Running task 2272 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Started
NOTE: Running task 2273 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2274 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_patch)
NOTE: Running task 2275 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.1-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_patch: Succeeded
NOTE: Running task 2276 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2277 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Started
NOTE: recipe taglib-1.13-r0: task do_patch: Succeeded
NOTE: Running task 2278 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_generate_toolchain_file)
NOTE: Running task 2279 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2280 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_patch: Started
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2281 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: Running task 2282 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_generate_toolchain_file)
NOTE: Running task 2283 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2284 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2285 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Succeeded
NOTE: Running task 2286 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2287 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ell-0.57-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: Running task 2288 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: recipe ell-0.57-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2289 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2291 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_populate_lic)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2292 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.57-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2293 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2294 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2295 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2296 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_configure)
NOTE: Running task 2297 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe taglib-1.13-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.57-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb:do_populate_lic unihash changed to 2d66a4cb4db3ca6fcf439c76f297f88cd984286b74adfbfcae36c433e8b51e07
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Started
NOTE: Running task 2298 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.57.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe ell-0.57-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2309 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2311 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2312 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13-r0: task do_configure: Succeeded
NOTE: Running task 2313 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Succeeded
NOTE: Running task 2315 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Succeeded
NOTE: Running task 2316 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2317 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Succeeded
NOTE: Running task 2318 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe taglib-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Failed
NOTE: recipe taglib-1.13-r0: task do_install: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: recipe ell-0.57-r0: task do_configure: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2319 tasks of which 2217 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-src went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-dbg went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-staticdev went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-dev went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-doc went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info-locale went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: QA Issue: Package version for package mobile-broadband-provider-info went backwards which would break package feeds (from 1:20230416-r0 to 1:20221107-r0) [version-going-backwards]
ERROR: mobile-broadband-provider-info-1_20221107-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/mobile-broadband-provider-info/1_20221107-r0/temp/log.do_packagedata.2964441
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata) failed with exit code '1'

--===============1825112608473301717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 18477516 to 18490040 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGSIZE changed from 12939908 to 12949173 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.2.tar.xz file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.3.tar.xz file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.22.2" to "1.22.3"

--===============1825112608473301717==--

