Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB82EC5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 07:24:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49436.1786433028699051689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 00:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CI0Xp3cl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lxBp32YT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019fefb4de2d-ad8e06a7-7623-464b-9202-f335af551e5c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786433035;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bSYSNeEFrB8fHn9q13uB5mImkpdBSLJN20Ea6zuJvKI=;
	b=CI0Xp3clW59E1EEin1DJohWopMl1zfc8dhogNTdB1/u6rI485aKo08yOYUluON7w
	YC7Cx1+wUxCAMh5zKMe8lG05uu9aEbpCC42GboI5CukQZ28VZv1aOksJzSabOpufHXc
	H8hLbIRuWUCBrYGysrVOLvJ+1FgZolF4kMH4Jwss=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786433035;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bSYSNeEFrB8fHn9q13uB5mImkpdBSLJN20Ea6zuJvKI=;
	b=lxBp32YTIqRtSISx1wO4EfvxF0k7UYJ8dikpA9Fnab6/qp1y7hKKIMj07B9psSds
	HMxWhuvZ1XBk4C08NFthwolZVW+vboDN1JZYYuCNC8uTeI0jkTLcOAjllQRInNzK03y
	F0VFlYASeI36mPZAOVdF1rcIQ6ER8VwOpdzW9+F8=
Content-Type: multipart/mixed; boundary="===============8564994448733918104=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apr-util: upgrading to 1.6.5 FAILED
Message-ID: <0101019fefb4de2d-ad8e06a7-7623-464b-9202-f335af551e5c-000000@us-west-2.amazonses.com>
Date: Tue, 11 Aug 2026 07:23:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243166

--===============8564994448733918104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *apr-util* to *1.6.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe apr-util failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-6b46d76dd91d5187112b59b2a46b00dedbe7084c"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6b46d76dd91d5187112b59b2a46b00dedbe7084c"
meta-yocto-bsp       
meta-poky            = "master:0afedb9b1195525861f9140d6f33e9cd4118b199"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/recipetool/tmp-recipetool-7rf8z65l.bb: tmp-recipetool-7rf8z65l: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-7rf8z65l-CLOSED"
done.
Parsing of 957 .bb files complete (0 cached, 957 parsed). 1988 targets, 40 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-6b46d76dd91d5187112b59b2a46b00dedbe7084c"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6b46d76dd91d5187112b59b2a46b00dedbe7084c"
meta-yocto-bsp       
meta-poky            = "master:0afedb9b1195525861f9140d6f33e9cd4118b199"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-7rf8z65l: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-7rf8z65l-CLOSED"
WARNING: tmp-recipetool-7rf8z65l: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-7rf8z65l-CLOSED"
WARNING: tmp-recipetool-7rf8z65l: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-7rf8z65l-CLOSED"
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: tmp-recipetool-7rf8z65l: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-7rf8z65l-CLOSED"
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://archive.apache.org/dist/apr/apr-util-1.6.5.tar.gz...
INFO: Rebasing devtool onto c7c983069eaca301b7d015b563a961809749b1d6
WARNING: Command 'git rebase c7c983069eaca301b7d015b563a961809749b1d6' failed:
Auto-merging test/testxlate.c
CONFLICT (content): Merge conflict in test/testxlate.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/apr-util
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/apr-util/apr-util_1.6.5.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/apr-util.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8564994448733918104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="apr-util-changelog.txt"

Q2hhbmdlbG9nIGZvciBhcHItdXRpbDogMS42LjMgLT4gMS42LjUKU291cmNlOiBDSEFOR0VTCgpD
aGFuZ2VzIHdpdGggQVBSLXV0aWwgMS42LjUKCiAgKikgRml4IG9yYWNsZSBEQkQgY29tcGlsYXRp
b24gZXJyb3JzIGludHJvZHVjZWQgaW4gMS42LjQuIFBSIDcwMTcwLgoKQ2hhbmdlcyB3aXRoIEFQ
Ui11dGlsIDEuNi40CgogICopIFNFQ1VSSVRZOiBDVkUtMjAyNi0zNDUwMjogSGVhcCBidWZmZXIg
b3ZlcmZsb3cgaW4gQVBSIG1lbWNhY2hlZAogICAgIGNsaWVudCAoY3ZlLm1pdHJlLm9yZykKICAg
ICBIZWFwLWJhc2VkIEJ1ZmZlciBPdmVyZmxvdyB2dWxuZXJhYmlsaXR5IGluIEFwYWNoZSBQb3J0
YWJsZQogICAgIFJ1bnRpbWUgVXRpbGl0eSBtZW1jYWNoZWQgY2xpZW50CiAgICAgVGhpcyBpc3N1
ZSBhZmZlY3RzIEFwYWNoZSBQb3J0YWJsZSBSdW50aW1lIFV0aWxpdHk6IGZyb20gMS4zLjAKICAg
ICB0aHJvdWdoIDEuNi4zLgogICAgIENyZWRpdHM6IEVsaGFuYW4gSGFlbmVsCgogICopIFNFQ1VS
SVRZOiBDVkUtMjAyNi0zNDUwMTogQXBhY2hlIFBvcnRhYmxlIFJ1bnRpbWUgVXRpbGl0eTogSGVh
cAogICAgIGJ1ZmZlciBvdmVyZmxvdyBpbiBBUFIgcmVkaXMgY2xpZW50IChjdmUubWl0cmUub3Jn
KQogICAgIEhlYXAtYmFzZWQgQnVmZmVyIE92ZXJmbG93IHZ1bG5lcmFiaWxpdHkgaW4gQXBhY2hl
IFBvcnRhYmxlCiAgICAgUnVudGltZSBVdGlsaXR5IHJlZGlzIGNsaWVudC4KICAgICBUaGlzIGlz
c3VlIGFmZmVjdHMgQXBhY2hlIFBvcnRhYmxlIFJ1bnRpbWUgVXRpbGl0eTogZnJvbSAxLjYuMAog
ICAgIHRocm91Z2ggMS42LjMuCiAgICAgVXNlcnMgYXJlIHJlY29tbWVuZGVkIHRvIHVwZ3JhZGUg
dG8gdmVyc2lvbiAxLjYuNCwgd2hpY2ggZml4ZXMKICAgICB0aGUgaXNzdWUuCiAgICAgQ3JlZGl0
czogRWxoYW5hbiBIYWVuZWwKCiAgKikgU0VDVVJJVFk6IENWRS0yMDI2LTM0MTkxOiBBcGFjaGUg
UG9ydGFibGUgUnVudGltZSBVdGlsaXR5OiBTUUwKICAgICBJbmplY3Rpb24gaW4gYXByX2RiZF9v
cmFjbGUgKGN2ZS5taXRyZS5vcmcpCiAgICAgSW1wcm9wZXIgTmV1dHJhbGl6YXRpb24gb2YgU3Bl
Y2lhbCBFbGVtZW50cyB1c2VkIGluIGFuIFNRTAogICAgIENvbW1hbmQgKCdTUUwgSW5qZWN0aW9u
JykgdnVsbmVyYWJpbGl0eSBpbiBBcGFjaGUgUG9ydGFibGUKICAgICBSdW50aW1lIFV0aWxpdHkg
dmlhIGFwcl9kYmRfb3JhY2xlIHByb3ZpZGVyLgogICAgIFRoaXMgaXNzdWUgYWZmZWN0cyBBcGFj
aGUgUG9ydGFibGUgUnVudGltZSBVdGlsaXR5OiBmcm9tIDEuNi4wCiAgICAgdGhyb3VnaCAxLjYu
My4KICAgICBVc2VycyBhcmUgcmVjb21tZW5kZWQgdG8gdXBncmFkZSB0byB2ZXJzaW9uIDEuNi40
LCB3aGljaCBmaXhlcwogICAgIHRoZSBpc3N1ZS4KICAgICBDcmVkaXRzOiBFbGhhbmFuIEhhZW5l
bAoKICAqKSBTRUNVUklUWTogQ1ZFLTIwMjYtMzIzMjc6IEFwYWNoZSBQb3J0YWJsZSBSdW50aW1l
IFV0aWxpdHk6CiAgICAgYXByLXV0aWwgWE1MIHN0YWNrIHJlY3Vyc2lvbiBjcmFzaCAoY3ZlLm1p
dHJlLm9yZykKICAgICBBIGJ1ZyBpbiBBUFItdXRpbCB2ZXJzaW9uIDEuNi4zIChhbmQgZWFybGll
cikgYWxsb3dzIGEgc3RhY2sKICAgICByZWN1cnNpb24gYXR0YWNrIGFnYWluc3QgYW55IGxpYnJh
cnkgY29uc3VtZXIgd2hpY2ggcGFyc2VzIFhNTAogICAgIGZyb20gdW50cnVzdGVkIHNvdXJjZXMg
YW5kIHVzZXMgdGhlwqBhcHJfeG1sX3F1b3RlX2VsZW0oKQogICAgIGZ1bmN0aW9uLgogICAgIFVz
ZXJzIGFyZSByZWNvbW1lbmRlZCB0byB1cGdyYWRlIHRvIHZlcnNpb24gMS42LjQsIHdoaWNoIGZp
eGVzCiAgICAgdGhpcyBpc3N1ZS4KICAgICBDcmVkaXRzOiBZb3VuZ2h5byBDaG8gQCBDSVNMYWIs
IFNlb3VsVGVjaAoKICAqKSBTRUNVUklUWTogQ1ZFLTIwMjUtNDk1MDY6IGFwcl9wYXNzd29yZF92
YWxpZGF0ZSgpIHZ1bG5lcmFibGUgdG8KICAgICB0aW1pbmcgYXR0YWNrIChjdmUubWl0cmUub3Jn
KQogICAgIEFQUi11dGlsIHZlcnNpb25zIDEuNi4zIChhbmQgZWFybGllcikgZnVuY3Rpb24KICAg
ICBhcHJfcGFzc3dvcmRfdmFsaWRhdGUoKSB3YXMgbm90IGNvbnN0YW50LXRpbWUgd2l0aCByZWdh
cmRzIHRvCiAgICAgaGFzaGVzIG9yIHBhc3N3b3JkcyBjb21wYXJpc29ucywgcG90ZW50aWFsbHkg
bGVha2luZyB0aGVpcgogICAgIGNvbnRlbnQgdmlhIGEgc2lkZSBjaGFubmVsIHRpbWluZyBhdHRh
Y2sgcGFydGljdWxhcmx5IG9uCiAgICAgcGxhdGZvcm1zIHdpdGhvdXQgY3J5cHQoKSBzdWNoIGFz
wqDCoFdpbmRvd3MsIEJlT1MsIE5ldFdhcmUsIG9yCiAgICAgQW5kcm9pZC4KICAgICBVc2VycyBh
cmUgcmVjb21tZW5kZWQgdG8gdXBncmFkZSB0byB2ZXJzaW9uIDEuNi40LCB3aGljaCBmaXhlcwog
ICAgIHRoaXMgaXNzdWUuCiAgICAgQ3JlZGl0czogTWljaGFlbCBSb3dsZXkgPG1pY2hhZWwgY3Np
cnQuZ2xvYmFsPgoKICAqKSBhcHJfYnJpZ2FkZTogRG9uJ3Qgc3BsaXQgdGhlIGZpbmFsIExGIGlu
IGFwcl9icmlnYWRlX3NwbGl0X2xpbmUoKSB0bwogICAgIGF2b2lkIHByb2R1Y2luZyBhbiBlbXB0
eSBidWNrZXQuICBQUiA2NDI3MwogICAgIFtCYXJuaW0gRHp3aWxsbyA8ZHp3aWxsbyBzdHJhdG8u
ZGU+LCBKb2UgT3J0b25dCgogICopIGFwcl9icmlnYWRlOiBNZXRhZGF0YSBidWNrZXRzIGFyZSBu
b3cgaWdub3JlZCBpbgogICAgIGFwcl9icmlnYWRlX3NwbGl0X2xpbmUsIGFwcl9icmlnYWRlX2Zs
YXR0ZW4gYW5kCiAgICAgYXByX2JyaWdhZGVfdG9faW92ZWMsIGZpeGluZyBwb3NzaWJsZSB1bmRl
ZmluZWQgYmVoYXZpb3VyLiAgUFIgNjgyNzgKICAgICBbQmVuIEthbGx1cyA8YmVuamFtaW4ucC5r
YWxsdXMuZ3IgZGFydG1vdXRoLmVkdT4sIEpvZSBPcnRvbl0KCiAgKikgYXByX2NyeXB0b19vcGVu
c3NsOiBDb21wYXRpYmlsaXR5IHdpdGggT3BlblNTTCAzLiAgW1lhbm4gWWxhdmljXQoKICAqKSBh
cHJfY3J5cHRvX29wZW5zc2w6IHVzZSBPUEVOU1NMX2luaXRfY3J5cHRvKCkgdG8gaW5pdGlhbGlz
ZSBPcGVuU1NMCiAgICAgb24gdmVyc2lvbnMgMS4xKy4gW0dyYWhhbSBMZWdnZXR0XQoKICAqKSBh
cHJfbWVtY2FjaGU6IEZpeCBuYW1lIGxvb2t1cCB0byBhbGxvdyBJUHY2IGFzIHdlbGwgYXMgSVB2
NC4KICAgICBbTHVib3MgVWhsaWFyaWsgPGx1aGxpYXJpIHJlZGhhdC5jb20+XQoKICAqKSBjb25m
aWd1cmU6IEZpeCBCZXJrZWxleSBEQiBkZXRlY3Rpb24gd2l0aCBjb21waWxlcnMgZW5mb3JjaW5n
CiAgICAgc3RyaWN0IEM5OSBjb21wbGlhbmNlLiAgUFIgNjYzOTYuCiAgICAgW0Zsb3JpYW4gV2Vp
bWVyIDxmd2VpbWVyIHJlZGhhdC5jb20+XQoKQ2hhbmdlcyB3aXRoIEFQUi11dGlsIDEuNi4zCgog
ICopIENvcnJlY3QgYSBwYWNrYWdpbmcgaXNzdWUgaW4gMS42LjIuIFRoZSBjb250ZW50cyBvZiB0
aGUgcmVsZWFzZSB3ZXJlCiAgICAgY29ycmVjdCwgYnV0IHRoZSB0b3AgbGV2ZWwgZGlyZWN0b3J5
IHdhcyBtaXNuYW1lZC4K

--===============8564994448733918104==--

