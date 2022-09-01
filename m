Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8653C6FA9D
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:56 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.12459.1662040786867902367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BKGWi/cx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010182f959c4a6-68ba7bcb-dd11-468f-b6a9-117706547f06-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040786;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=hPmGjtu9ke9qWmyzHCDakkEDsHvRd947wjx8XBmq/co=;
	b=BKGWi/cxuE/fvlVAeA6Ee6VgQvhlGFFwMsu5jEWp5nMlN8JL8qPWe29nLuRUu54t
	9sagIMglmuwICGtw0iaR5YDqu+EplJrfEm2KJ7b+2BIEz8Jq+L6iU5EZYk0hVmQpj1Q
	1T6x88N/fpeJ7Ealg/IM0IIyHsdzoIBKqlrOZ3jo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040786;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=hPmGjtu9ke9qWmyzHCDakkEDsHvRd947wjx8XBmq/co=;
	b=OGc1ZNC2cWTJEUL60HC6u6FllexuvjTxznhP4S4ZHNGo+GpDJGei1bQZ6PUCnk1G
	rsu7UVEePHUv+Kj+C3Wa/34mpch84W3Tf6n21sC3l/ApJezJhBMG1X1PFkvnaDJjbo3
	wm/UO5luml78xRr+LIT0JFblUaPgGF39rY2MWvYA=
Content-Type: multipart/mixed; boundary="===============7256597242801685610=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] tzdata: upgrading to 2022c FAILED
Message-ID: 
 <01010182f959c4a6-68ba7bcb-dd11-468f-b6a9-117706547f06-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170186

--===============7256597242801685610==
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
--===============7256597242801685610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (882 cached, 2 parsed). 1658 targets, 36 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-88160061eeae5ec57d7481d1bd2e77007263225b"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:88160061eeae5ec57d7481d1bd2e77007263225b"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 9 Local 0 Mirrors 0 Missed 9 Current 106 (0% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 337 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: Running task 341 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzcode-native-2022c-r0: task do_fetch: Started
NOTE: recipe tzdata-2022c-r0: task do_fetch: Started
WARNING: tzcode-native-2022c-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022c.tar.gz
Cleaning and trying again.
WARNING: tzcode-native-2022c-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022c.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022c.tar.gz_bad-checksum_6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe
WARNING: tzcode-native-2022c-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022c.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzcode-native-2022c-r0: task do_fetch: Failed
WARNING: tzdata-2022c-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022c.tar.gz
Cleaning and trying again.
WARNING: tzdata-2022c-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022c.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022c.tar.gz_bad-checksum_6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe
WARNING: tzdata-2022c-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022c.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzdata-2022c-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 479 tasks of which 477 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch
Summary: There were 7 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: tzcode-native-2022c-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022c.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022c.tar.gz' has sha256 checksum '6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe' when 'f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzcode-native-2022c-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022c.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/tzcode-native/2022c-r0/temp/log.do_fetch.964331
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: tzdata-2022c-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022c.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022c.tar.gz' has sha256 checksum '6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe' when 'f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzdata-2022c-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022c.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/tzdata/2022c-r0/temp/log.do_fetch.964330
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============7256597242801685610==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzdata-upgrade-2022b-2022c.patch"

RnJvbSA3YjgwMGZlZjA5MjE1MWM0OTgzNjhjY2ZiYmVlYjU0ZGU2ZDAyNzU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwODoxNTowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR6
ZGF0YTogdXBncmFkZSAyMDIyYiAtPiAyMDIyYwoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
dGltZXpvbmUvdGltZXpvbmUuaW5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC90aW1lem9uZS90aW1lem9uZS5pbmMgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUv
dGltZXpvbmUuaW5jCmluZGV4IDJiOTU2Y2Y3YzAuLmIxYmVlNGIwNDQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3RpbWV6b25lL3RpbWV6b25lLmluYwpAQCAtNiw3ICs2LDcgQEAgU0VDVElP
TiA9ICJiYXNlIgogTElDRU5TRSA9ICJQRCAmIEJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM2NzljOWQ2YjAyYmMyNzU3YjNlYWY4ZjUzYzQzZmJh
IgogCi1QViA9ICIyMDIyYiIKK1BWID0gIjIwMjJjIgogCiBTUkNfVVJJID0iIGh0dHA6Ly93d3cu
aWFuYS5vcmcvdGltZS16b25lcy9yZXBvc2l0b3J5L3JlbGVhc2VzL3R6Y29kZSR7UFZ9LnRhci5n
ejtuYW1lPXR6Y29kZSBcCiAgICAgICAgICAgIGh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25l
cy9yZXBvc2l0b3J5L3JlbGVhc2VzL3R6ZGF0YSR7UFZ9LnRhci5nejtuYW1lPXR6ZGF0YSBcCkBA
IC0xNCw2ICsxNCw2IEBAIFNSQ19VUkkgPSIgaHR0cDovL3d3dy5pYW5hLm9yZy90aW1lLXpvbmVz
L3JlcG9zaXRvcnkvcmVsZWFzZXMvdHpjb2RlJHtQVn0udGFyLmd6CiAKIFVQU1RSRUFNX0NIRUNL
X1VSSSA9ICJodHRwOi8vd3d3LmlhbmEub3JnL3RpbWUtem9uZXMiCiAKLVNSQ19VUklbdHpjb2Rl
LnNoYTI1NnN1bV0gPSAiYmFiMjBkOTQzZTU5YTMyMTg0MzVmNDhkODY4YTRlNTUyZjE4ZDZkN2Yz
ZGQxMjg2NjBjNTY2MGM4MGI4YTA1ZiIKK1NSQ19VUklbdHpjb2RlLnNoYTI1NnN1bV0gPSAiM2U3
Y2UxZjM2MjBjYzA0ODE5MDdjN2UwNzRkNjk5MTA3OTMyODViZmZlMGNhMzMxZWYxYTZkMWFlM2Vh
OTBjYyIKIFNSQ19VUklbdHpkYXRhLnNoYTI1NnN1bV0gPSAiZjU5MGVhZjA0YTM5NTI0NTQyNmMy
YmU0ZmFlNzFjMTQzYWVhNWNlYmMxMTA4OGI3YTBhNTcwNDQ2MWRmMzk3ZCIKIAotLSAKMi4zMS4x
Cgo=

--===============7256597242801685610==--

