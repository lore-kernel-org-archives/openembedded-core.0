Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB58CC6FD3F
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.10894.1663251513936523012
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kvkQzgcb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101834183ffd7-35e3087f-c06a-4636-9104-4fc71fb8f184-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251513;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=2vsiKAKr+Wys7XUXAqYuECN55ggpJJmoUZ0G2ogEghQ=;
	b=kvkQzgcbX1b8nfpsAjGZQ1tok/naGWOM1NHEEevJCgcWjoykG0pGSHx7ybYEfb5O
	DCLyJm6G/Xv3/FuEt6yo4mhYo2SzhLcrUSKfkzVNKMrFHG4+2c/+3EHkaXXanEaj99x
	LWl7ibZMjHW6nGOC54uq4SUeHvA/pOFtFDLj/Bgs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251513;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=2vsiKAKr+Wys7XUXAqYuECN55ggpJJmoUZ0G2ogEghQ=;
	b=Zi3XOcNRnfP9CJA1gxVZhpX5NfBcLDK8VROe9TOmwiyGO+RncoCZ2vsmmruE/gMv
	TTFfUf4cqE5/An/SiAa85f2VLpKRzD7RcXyhLYzTo9afy5I6XN6f4pcn/KgNca1X4wt
	GiCXxWXkxOYkiv27xnTGG2IkbtHASh0qiFxrNdWg=
Content-Type: multipart/mixed; boundary="===============0458146153163834628=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] tzdata: upgrading to 2022c FAILED
Message-ID: 
 <010101834183ffd7-35e3087f-c06a-4636-9104-4fc71fb8f184-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:33 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170742

--===============0458146153163834628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tzdata* to *2022c* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzdata-upgrade-2022b-2022c.patch
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
--===============0458146153163834628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (883 cached, 2 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2dc54b077819d38264ef3b9171df1471c3349588"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2dc54b077819d38264ef3b9171df1471c3349588"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 5 Mirrors 0 Missed 9 Current 101 (35% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 337 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: Running task 341 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzcode-native-2022c-r0: task do_fetch: Started
NOTE: recipe tzdata-2022c-r0: task do_fetch: Started
WARNING: tzcode-native-2022c-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022c.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzcode-native-2022c-r0: task do_fetch: Failed
WARNING: tzdata-2022c-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022c.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzdata-2022c-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 479 tasks of which 477 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch
Summary: There were 3 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: tzcode-native-2022c-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022c.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022c.tar.gz.tmp' has sha256 checksum '6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe' when 'f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzcode-native-2022c-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022c.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/tzcode-native/2022c-r0/temp/log.do_fetch.1062610
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: tzdata-2022c-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022c.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022c.tar.gz.tmp' has sha256 checksum '6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe' when 'f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzdata-2022c-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022c.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/tzdata/2022c-r0/temp/log.do_fetch.1062609
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============0458146153163834628==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzdata-upgrade-2022b-2022c.patch"

RnJvbSBlYzZmNmNjMDM2NzM0YTgxNGQ2NTI3YTg4M2NhYTBhZTk1NDAzMTQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTA6NTY6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
emRhdGE6IHVwZ3JhZGUgMjAyMmIgLT4gMjAyMmMKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3RpbWV6b25lL3RpbWV6b25lLmluYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RpbWV6b25l
L3RpbWV6b25lLmluYwppbmRleCAyYjk1NmNmN2MwLi5iMWJlZTRiMDQ0IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUvdGltZXpvbmUuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMKQEAgLTYsNyArNiw3IEBAIFNFQ1RJ
T04gPSAiYmFzZSIKIExJQ0VOU0UgPSAiUEQgJiBCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1jNjc5YzlkNmIwMmJjMjc1N2IzZWFmOGY1M2M0M2Zi
YSIKIAotUFYgPSAiMjAyMmIiCitQViA9ICIyMDIyYyIKIAogU1JDX1VSSSA9IiBodHRwOi8vd3d3
LmlhbmEub3JnL3RpbWUtem9uZXMvcmVwb3NpdG9yeS9yZWxlYXNlcy90emNvZGUke1BWfS50YXIu
Z3o7bmFtZT10emNvZGUgXAogICAgICAgICAgICBodHRwOi8vd3d3LmlhbmEub3JnL3RpbWUtem9u
ZXMvcmVwb3NpdG9yeS9yZWxlYXNlcy90emRhdGEke1BWfS50YXIuZ3o7bmFtZT10emRhdGEgXApA
QCAtMTQsNiArMTQsNiBAQCBTUkNfVVJJID0iIGh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25l
cy9yZXBvc2l0b3J5L3JlbGVhc2VzL3R6Y29kZSR7UFZ9LnRhci5negogCiBVUFNUUkVBTV9DSEVD
S19VUkkgPSAiaHR0cDovL3d3dy5pYW5hLm9yZy90aW1lLXpvbmVzIgogCi1TUkNfVVJJW3R6Y29k
ZS5zaGEyNTZzdW1dID0gImJhYjIwZDk0M2U1OWEzMjE4NDM1ZjQ4ZDg2OGE0ZTU1MmYxOGQ2ZDdm
M2RkMTI4NjYwYzU2NjBjODBiOGEwNWYiCitTUkNfVVJJW3R6Y29kZS5zaGEyNTZzdW1dID0gIjNl
N2NlMWYzNjIwY2MwNDgxOTA3YzdlMDc0ZDY5OTEwNzkzMjg1YmZmZTBjYTMzMWVmMWE2ZDFhZTNl
YTkwY2MiCiBTUkNfVVJJW3R6ZGF0YS5zaGEyNTZzdW1dID0gImY1OTBlYWYwNGEzOTUyNDU0MjZj
MmJlNGZhZTcxYzE0M2FlYTVjZWJjMTEwODhiN2EwYTU3MDQ0NjFkZjM5N2QiCiAKLS0gCjIuMzEu
MQoK

--===============0458146153163834628==--

