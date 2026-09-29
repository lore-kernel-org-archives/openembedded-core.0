Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD55CA5FB4
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1832.1790662721656098422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G1xplL7G;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Evm3ovap;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0ebd0bc72-8b7e9018-339a-43b3-b9ce-5513837335b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662720;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=/mbotIfcffx+d1gNUY9FpZoZTZWzgZCLRApomPsnd18=;
	b=G1xplL7G3SwB5IL4f8QfRYqojI09AukdcYJ13kUG2nMFBKPpGK1iG+g8p13NKFc8
	0k9mgRghhZ//snlcFaCqYDR4SlzvReuSf2TY5fKXfGZ9N770vjNzGIF8E6aZGI7oXU0
	0A7NE8zsps8GWYGsP8vgNoumEKA2efdZt4x1YUio=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662720;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=/mbotIfcffx+d1gNUY9FpZoZTZWzgZCLRApomPsnd18=;
	b=Evm3ovapxNcTYtDOsEjw4DRidiLw5adBDCllfbgr0J7MJqhgz8JD0PnpiJcwu6W6
	peyJhqcEivndeUXNSKe5QaqG2hdbkoILQanztD3P3kM/7c+KkK3n29N/3Om54g1wIr/
	ljjk4Zk0UC2iPSMi6WiZFkyOGyeW4YGr/YqPSffE=
Content-Type: multipart/mixed; boundary="===============4560843000040821057=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] igt-gpu-tools: upgrading to 2.6 FAILED
Message-ID: <010101a0ebd0bc72-8b7e9018-339a-43b3-b9ce-5513837335b6-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246829

--===============4560843000040821057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *igt-gpu-tools* to *2.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe igt-gpu-tools failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-f04a77ac63fa9afc7fde0c14aa91a2595fd35630"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:f04a77ac63fa9afc7fde0c14aa91a2595fd35630"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 916c79cfb7675ca01607dcd821f8c49d4f633a6f
WARNING: Command 'git rebase 916c79cfb7675ca01607dcd821f8c49d4f633a6f' failed:
Auto-merging lib/meson.build
CONFLICT (content): Merge conflict in lib/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/igt-gpu-tools
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/igt-gpu-tools/igt-gpu-tools_2.6.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/igt-gpu-tools.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/igt-gpu-tools.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4560843000040821057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="igt-gpu-tools-changelog.txt"

UmVsZWFzZSAyLjYgKDIwMjYtMDktMjgpCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKR2VuZXJh
bCBjaGFuZ2VzOgotIFJlbW92ZWQgeGVfZXVkZWJ1ZyBmcm9tIG1lc29uLiAoRG9taW5payBLYXJv
bCBQacSFdGtvd3NraSkKRGV2b3BzIGNoYW5nZXM6Ci0gQnVtcGVkIERlYmlhbiB2ZXJzaW9uIHRv
IGJvb2t3b3JtIGFuZCBGZWRvcmEgdG8gbGF0ZXN0IDQ0IChLYW1pbCBLb25pZWN6bnkpClJ1bm5l
ciBjaGFuZ2VzOgotIE5ldyBpZ3RfcnVubmVyIG9wdGlvbiAtLXNhdmUtcmVzdWx0cy1hZnRlci1l
YWNoLXRlc3QuIChLYW1pbCBLb25pZWN6bnkpCkxpYnJhcnkgY2hhbmdlczoKLSBDb250aW51ZWQg
cmVmYWN0b3Igb2YgZGlzcGxheSBsaWJyYXJ5IGNvZGUuIChKYW5pIE5pa3VsYSkKCi0gTmV3IHBs
YXRmb3JtIGZpbHRlcmluZyBoZWxwZXJzIGZvciBza2lwcGluZyB0ZXN0cyB3aXRob3V0IG1vZGlm
eWluZyB0ZXN0CiAgc291cmNlIGNvZGUuIChWaXRhbHkgUHJvc3lhaykKCi0gSW1wcm92ZWQgc2V0
dGluZyB1cCB0aGUgcmVuZGVyIGFuZCBjb21wdXRlIHBpcGVsaW5lcyBmb3IgSW50ZWwgR1BVcy4g
KEphbgogIE1hc2xhaykKClRlc3QgY2hhbmdlczoKLSBJbXByb3ZlZCBkaXNwbGF5IHRlc3Rpbmcg
ZHVyaW5nIHN1c3BlbmQuIChNaWNoYcWCIEdyemVsYWspCi0gQWRkZWQgc3VidGVzdCBmb3IgQkFD
S0dST1VORF9DT0xPUiBjcnRjIHByb3BlcnR5LiAoTWFhcnRlbiBMYW5raG9yc3QpCgotIE5ldyB0
ZXN0IGZvciBIRE1JIFRNRFMgYXVkaW8gYmFuZHdpZHRoIGNvbnN0cmFpbnRzIG9uIEludGVsIEdQ
VXMuIChTd2F0aQogIFNoYXJtYSkKCi0gQWRkZWQgc3VidGVzdCBmb3IgQ29udGVudCBNYXRjaCBS
ZWZyZXNoIFJhdGUgKENNUlIpIGFjcm9zcyBib3RoIGZpeGVkIGFuZAogIHZpZGVvIHRpbWluZyBk
aXNwbGF5IG1vZGVzLiAoTmFsYWRhbGEgUmFtYW5haWR1KQoKLSBOZXcgWGUgcGFnZSBvZmZsaW5l
IHRlc3RzIG9uIEludGVsIENSSSBHUFVzLiAoVGVqYXMgVXBhZGh5YXkpCi0gQWRkZWQgdGVzdCBj
b3ZlcmFnZSBmb3IgRklYRURfTUFUUklYIGNvbG9yb3BzIGZvciBDU0MuIChIYXJyeSBXZW50bGFu
ZCkKLSBBZGRlZCBHVCByZXNldCBzdWJtaXQgc3RyZXNzIHN1YnRlc3QuIChOaXNoaXQgU2hhcm1h
KQoKLSBOZXcgdGVzdHMgZm9yIFNSSU9WIEdHVFQgYWNjZXNzZXMgYnkgUEYgYW5kIFZGcyBvbiBY
ZS4gKFBpb3RyIFBpw7Nya293c2tpLAogIE1hcmNpbiBCZXJuYXRvd2ljeiBhbmQgTHVrYXN6IExh
Z3VuYSkuCgotIEFkZGVkIEZJWEVEX01BVFJJWCBjb2xvcm9wIHN1YnRlc3RzLiAoU3dhdGkgU2hh
cm1hKQotIEFkZGVkIFVIQlItdG8tSEJSIGZhbGxiYWNrIHN1YnRlc3QgZm9yIFVIQlItY2FwYWJs
ZSBEUCBjb25uZWN0b3JzLihTb3dtaXlhIFMpCi0gSW1wcm92ZWQgS01TIHRlc3RzIG9uIE1lZGlh
VGVrLiAoSmFzb24tSkggTGluKQotIEFkZGVkIHVzZXIgZmVuY2Ugbm8gc2lnbmFsIHN1YnRlc3Qg
Zm9yIEludGVsIFhlIGRyaXZlci4gKFByaXlhbmthIERhbmRhbXVkaSkKLSBJbXByb3ZlZCB1c2Vy
cHRyIHN0cmVzcyB0ZXN0IGZvciBhbWRncHUuIChWaXRhbHkgUHJvc3lhaykKLSBJbXByb3ZlZCBY
ZSBPQSB0ZXN0aW5nLiAoVW1lc2ggTmVybGlnZSBSYW1hcHBhKQotIEltcHJvdmVkIEZCQyBoYW5k
bGluZyBpbiBkaXNwbGF5IHRlc3RzLiAoVmlub2QgR292aW5kYXBpbGxhaSkKLSBJbXByb3ZlZCBh
bWRncHUgcmVzZXQgdGVzdHMuIChKZXNzZSBaaGFuZykKLSBBZGRlZCBzdWJ0ZXN0IHRvIHZhbGlk
YXRlIFlVVjQyMCB3aXRoIERDM0NPLiAoSmVldmFuIEIpCi0gUG9ydGVkIGRtYWJ1ZiB0ZXN0cyB0
byBLVW5pdC4gKEtyenlzenRvZiBOaWVtaWVjKQotIEFkZGVkIGRpc3BsYXkgZmVhdHVyZSBkaXNj
b3Zlcnkgc3VidGVzdHMgZm9yIEhEUiwgVlJSIGFuZCBEU0MuIChTd2F0aSBTaGFybWEpCi0gQWRk
ZWQgUGFudGhvciBzcGFyc2UgVk1fQklORCB0ZXN0cy4gKEFkcmnDoW4gTGFydW1iZSkKLSBFeHRl
bmRlZCBCTyB0ZXN0cyB0byBjb3ZlciBHRU1fSU5GTyBhbmQgY2FjaGUgZmxhZ3Mgb24gTVNNLiAo
Sml0dGEgVmlnbmFuKQotIE5ldyB0ZXN0cyBmb3IgUEVSRkNOVFJfQ09ORklHIGlvY3RsIG9uIE1T
TSBHUFVzLiAoUm9iIENsYXJrKQoKLSBOZXcgdGVzdHMgZm9yIFBvd2VyVlIgSW1hZ2luYXRpb24g
R1BVcy4gKERvbmFsZCBSb2Jzb24sIE1hdHQgQ29zdGVyLAogIFJvYmVydCBNYXp1ciwgRnJhbmsg
QmlubnMgYW5kIFNhcmFoIFdhbGtlcikKClRvb2xzIGNoYW5nZXM6Ci0gRml4ZWQgZ3B1dG9wIG9u
IFBhbnRob3IuIChEZWJvcmFoIEJyb3V3ZXIpCgotIFJlbmFtZWQgQU1EIHRvb2wgdG8gaWd0X2hk
bWlfY29tcGxpYW5jZSBhbmQgaW1wcm92ZWQgaXQgdG8gd29yayBvbiBJbnRlbCBHUFVzCiAgKFN3
YXRpIFNoYXJtYSkKCi0gSW1wcm92ZW1lbnRzIGluIGFtZF9oZG1pX2NvbXBsaWFuY2UuIChGYW5n
emhpIFp1byBhbmQgTWFyayBCcm9hZHdvcnRoKQoKLSBEZWNyZWFzZWQgbnVtYmVyIG9mIGR5bmFt
aWNhbGx5IGxpbmtlZCBsaWJyYXJpZXMgaW4gbWFueSB0b29scy4gKFNlYmFzdGlhbgogIEJyemV6
aW5rYSkKCkFuZCBtYW55IG90aGVyIGJ1ZyBmaXhlcywgaW1wcm92ZW1lbnRzLCBjbGVhbnVwcyBh
bmQgbmV3IHRlc3RzLgo=

--===============4560843000040821057==--

