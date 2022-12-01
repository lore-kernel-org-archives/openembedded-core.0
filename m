Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DBEC6371B
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.46830.1669908627808832258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=An61oT8R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010184ce4f7def-e041dbfd-9fad-4509-a0ed-c7e4b734be59-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908627;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=OJm4/xH2vZS2I9WnB12U4Wrv7oODY++/oNsHNJDNEwc=;
	b=An61oT8RmJnS6lUH69iLlNydKcnK4kgwmmqOARJUtQBCUO1uQ7AewnowX865NuxZ
	Q9NDQ/G16vAVuxthw9EpbsmFpY9lh+AVxxF+6DEYEazY1e5jm/YdqWbOat1Fb7FUrWx
	WhGu4jAfrFzEi2KRJjbFg8FJdl/5RWD8BQo9bHGc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908627;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=OJm4/xH2vZS2I9WnB12U4Wrv7oODY++/oNsHNJDNEwc=;
	b=jyahZz+mXEK9kzf41gxSasWdXB/HD9jG0CHbq9lHUtgvzD317MXpY9CMVm0EdPXC
	uhkI4RxJpDtlcehNbK+vU6mKxlcxnD/cgg/h9JKQE5hJZBaIvsT5ncVLgoD4nrO2jMt
	2XoSCL9LNr6vDCG7qbtZaGAkLeVGHsZttMDG1zbA=
Content-Type: multipart/mixed; boundary="===============8376762239726174996=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] tzdata: upgrading to 2022g FAILED
Message-ID: <01010184ce4f7def-e041dbfd-9fad-4509-a0ed-c7e4b734be59-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174165

--===============8376762239726174996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tzdata* to *2022g* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tzdata-upgrade-2022d-2022g.patch
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
--===============8376762239726174996==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tzdata-upgrade-2022d-2022g.patch"

RnJvbSAzNDkyNzcyYWY1ZDhjMzBlNTY2ZjUxNTg1YTRhNTI3ODYzODY5MmU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMToxMTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR6
ZGF0YTogdXBncmFkZSAyMDIyZCAtPiAyMDIyZwoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
dGltZXpvbmUvdGltZXpvbmUuaW5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC90aW1lem9uZS90aW1lem9uZS5pbmMgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGltZXpvbmUv
dGltZXpvbmUuaW5jCmluZGV4IGQzYzc4ZTkxNTcuLjM5Yjk0NjI2MGYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC90aW1lem9uZS90aW1lem9uZS5pbmMKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3RpbWV6b25lL3RpbWV6b25lLmluYwpAQCAtNiw3ICs2LDcgQEAgU0VDVElP
TiA9ICJiYXNlIgogTElDRU5TRSA9ICJQRCAmIEJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM2NzljOWQ2YjAyYmMyNzU3YjNlYWY4ZjUzYzQzZmJh
IgogCi1QViA9ICIyMDIyZCIKK1BWID0gIjIwMjJnIgogCiBTUkNfVVJJID0iIGh0dHA6Ly93d3cu
aWFuYS5vcmcvdGltZS16b25lcy9yZXBvc2l0b3J5L3JlbGVhc2VzL3R6Y29kZSR7UFZ9LnRhci5n
ejtuYW1lPXR6Y29kZSBcCiAgICAgICAgICAgIGh0dHA6Ly93d3cuaWFuYS5vcmcvdGltZS16b25l
cy9yZXBvc2l0b3J5L3JlbGVhc2VzL3R6ZGF0YSR7UFZ9LnRhci5nejtuYW1lPXR6ZGF0YSBcCkBA
IC0xNCw2ICsxNCw2IEBAIFNSQ19VUkkgPSIgaHR0cDovL3d3dy5pYW5hLm9yZy90aW1lLXpvbmVz
L3JlcG9zaXRvcnkvcmVsZWFzZXMvdHpjb2RlJHtQVn0udGFyLmd6CiAKIFVQU1RSRUFNX0NIRUNL
X1VSSSA9ICJodHRwOi8vd3d3LmlhbmEub3JnL3RpbWUtem9uZXMiCiAKLVNSQ19VUklbdHpjb2Rl
LnNoYTI1NnN1bV0gPSAiZDY0NGJhMGY5Mzg4OTkzNzRlYThjYjU1NGUzNWZiNGFmYTBmN2JkN2I3
MTZjNjE3NzdjZDAwNTAwYjg3NTllMCIKK1NSQ19VUklbdHpjb2RlLnNoYTI1NnN1bV0gPSAiOTYx
MGJiMGI5NjU2ZmY0MDRjMzYxYTQxZjMyODZkYTUzMDY0YjU0NjlkODRmMDBjOWNiMjMxNGM4NjE0
ZGE3NCIKIFNSQ19VUklbdHpkYXRhLnNoYTI1NnN1bV0gPSAiNmVjZGJlZTI3ZmE0M2RjZmE0OWYz
ZDRmZDhiYjFkZmVmNTRjOTBkYTFhYmNkODJjOWFiY2YyZGM0ZjMyMWRlMCIKIAotLSAKMi4zMS4x
Cgo=

--===============8376762239726174996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1668 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (886 cached, 2 parsed). 1668 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ec71070bbc9bebbd05fcb68f1123680201193328"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 10 Local 1 Mirrors 0 Missed 9 Current 105 (10% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 337 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch)
NOTE: Running task 341 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch)
NOTE: recipe tzcode-native-2022g-r0: task do_fetch: Started
NOTE: recipe tzdata-2022g-r0: task do_fetch: Started
WARNING: tzcode-native-2022g-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022g.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzcode-native-2022g-r0: task do_fetch: Failed
WARNING: tzdata-2022g-r0 do_fetch: Checksum failure encountered with download of http://www.iana.org/time-zones/repository/releases/tzdata2022g.tar.gz;name=tzdata - will attempt other sources if available
NOTE: recipe tzdata-2022g-r0: task do_fetch: Failed
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
ERROR: tzcode-native-2022g-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022g.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022g.tar.gz.tmp' has sha256 checksum '4491db8281ae94a84d939e427bdd83dc389f26764d27d9a5c52d782c16764478' when '6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "4491db8281ae94a84d939e427bdd83dc389f26764d27d9a5c52d782c16764478"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzcode-native-2022g-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022g.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/tzcode-native/2022g-r0/temp/log.do_fetch.3295381
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzcode-native.bb:do_fetch) failed with exit code '1'
ERROR: tzdata-2022g-r0 do_fetch: Fetcher failure for URL: 'http://www.iana.org/time-zones/repository/releases/tzdata2022g.tar.gz;name=tzdata'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/tzdata2022g.tar.gz.tmp' has sha256 checksum '4491db8281ae94a84d939e427bdd83dc389f26764d27d9a5c52d782c16764478' when '6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tzdata.sha256sum] = "4491db8281ae94a84d939e427bdd83dc389f26764d27d9a5c52d782c16764478"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: tzdata-2022g-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.iana.org/time-zones/repository/releases/tzdata2022g.tar.gz;name=tzdata')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/tzdata/2022g-r0/temp/log.do_fetch.3295380
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_fetch) failed with exit code '1'

--===============8376762239726174996==--

