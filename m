Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B11C61DD5
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 05:57:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.417.1787896668265708707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 22:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gnBnwVJW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Jo8S3vSz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a046f21cb3-cb6839b3-67f6-44d9-87d6-b137b53f2f10-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787896667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YIATd9LC3eMY7eTMGgul/w7rLwol2JRURV/VDtsYn88=;
	b=gnBnwVJWRrcIeldq9bbgRN6gaEmiQURHOvkbdOzgcYiIS2Lz4WrR+CkB4m/j/mmC
	rjl0T2Lra0my7/JaXtW9Zi48kLO79jCRoTV04AnjZPePt1OCWvcR6pc7doTFKP7ZodC
	e8xFTcCcHXQy6uLkMMM+hEp0Xcv5QKDe9GLc69HQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787896667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YIATd9LC3eMY7eTMGgul/w7rLwol2JRURV/VDtsYn88=;
	b=Jo8S3vSzJ1MhNXn/PlkggVClOLaNy4e3kg2sK3HcT6/bFAIaragpycxzrRyIZdwo
	PeFZM/TbUqcCmihKeKvEUWxPWhWX60QK2O7mxaCFvIwdnJlpzi3zRykwixQXZRW+bFK
	m9r8WzyDXTBvl+syz0wD076N06NI49UoLm5cmN/Q=
Content-Type: multipart/mixed; boundary="===============4319448839529504307=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-tools,lttng-ust,lttng-modules: upgrading to
 2.16.0,2.16.0,2.16.0 FAILED
Message-ID: <010101a046f21cb3-cb6839b3-67f6-44d9-87d6-b137b53f2f10-000000@us-west-2.amazonses.com>
Date: Fri, 28 Aug 2026 05:57:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.28-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 05:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244508

--===============4319448839529504307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lttng-tools,lttng-ust,lttng-modules* to *2.16.0,2.16.0,2.16.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-tools failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1986 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-8d6b930f4d11627b90db3e902e382692c38cde15"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:8d6b930f4d11627b90db3e902e382692c38cde15"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
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
Parsing recipes...done.
Parsing of 957 .bb files complete (0 cached, 957 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-8d6b930f4d11627b90db3e902e382692c38cde15"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:8d6b930f4d11627b90db3e902e382692c38cde15"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   8% |###                                 | ETA:  0:00:01
Adding changed files:  17% |######                              | ETA:  0:00:00
Adding changed files:  26% |#########                           | ETA:  0:00:00
Adding changed files:  35% |############                        | ETA:  0:00:00
Adding changed files:  44% |################                    | ETA:  0:00:00
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  80% |#############################       | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-tools/lttng-tools-2.16.0.tar.bz2...
INFO: Rebasing devtool onto 6103c63c0b10dd5c2c35201e95c079db792fc843
WARNING: Command 'git rebase 6103c63c0b10dd5c2c35201e95c079db792fc843' failed:
Auto-merging tests/regression/Makefile.am
CONFLICT (content): Merge conflict in tests/regression/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/lttng-tools
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/lttng-tools/lttng-tools_2.16.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/lttng-tools.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4319448839529504307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="lttng-tools-changelog.txt"

Q2hhbmdlbG9nIGZvciBsdHRuZy10b29sczogMi4xNS4xIC0+IDIuMTYuMApTb3VyY2U6IENoYW5n
ZUxvZwoKIyBTUERYLUZpbGVDb3B5cmlnaHRUZXh0OiAyMDI2IEVmZmljaU9TLCBJbmMKIwojIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBDQy1CWS1TQS00LjAKCjIwMjYtMDgtMjcgbHR0bmctdG9v
bHMgMi4xNi4wIChOYXRpb25hbCBUdWcgb2YgV2FyIERheSkKCSogQ2hhbmdlTG9nOiBtb3ZlIGxp
Y2Vuc2UgaGVhZGVyIHRvIHRoZSB0b3Agb2YgdGhlIGZpbGUKCSogc2Vzc2lvbmQ6IEFsbG93IG1p
c3NpbmcgVVNUIGFwcCBjaGFubmVsIHdoZW4gbW9kaWZ5aW5nIGV2ZW50cwoJKiB0ZXN0czogQWRk
IHJlZ3Jlc3Npb24gdGVzdCBmb3Igc2Vzc2lvbmQgYXNzZXJ0CgkqIHRlc3RzOiBBZGQgZGVidWcg
b3B0aW9uIHRvIEdEQiBzY3JpcHRzIGZvciBhdXRvbWF0aWMgcHJpbnQgc3RhdGVtZW50cwoJKiB0
ZXN0czogQWRkIG9wdGlvbiB0byBsaW1pdCB0aGUgbnVtYmVyIG9mIHRlc3RzIHNraXBwZWQgZm9y
IG1pc3NpbmcgcmVxdWlyZW1lbnRzCgkqIFJlcGxhY2UgcmVtb3ZlZCBQeXRob24gMiBDIEFQSSBt
YWNyb3MgZm9yIFNXSUcgNC41LjAgY29tcGF0aWJpbGl0eQoJKiB0ZXN0czogVXNlIGBvcy53YWxr
KClgIGluc3RlYWQgb2YgYFBhdGgud2FsaygpYCBpbiBgdGVzdF9zaGVsbGNoZWNrYAoJKiB0ZXN0
czogQ2hhbmdlIG1ldGEvdGVzdF9zaGVsbGNoZWNrIHRvIHRlc3Qgc2NyaXB0cyBieSBkZWZhdWx0
CgoyMDI2LTA3LTMwIGx0dG5nLXRvb2xzIDIuMTYuMC1yYzIgKEZyaWVuZHNoaXAgRGF5KQoJKiBV
c2UgdGhlIG9mZmljaWFsICdBdXRvY29uZi1leGNlcHRpb24tbWFjcm8nIFNQRFggTGljZW5zZSBJ
RAoJKiBjb21tb246IGtlZXAgdGhlIGZvcm1hdHRpbmcgdXRpbGl0aWVzIG91dCBvZiBlcnJvci5o
cHAKCSogY29tbW9uOiBtb3ZlIHV0aWxzX2NyZWF0ZV92YWx1ZV9maWxlKCkgdG8gaXRzIG93biBo
ZWFkZXIKCSogc2Vzc2lvbmQ6IGRlcml2ZSBrZXJuZWwgdHJhY2VyIGNhcGFiaWxpdGllcyBmcm9t
IGl0cyBBQkkgdmVyc2lvbgoJKiBGaXg6IHNlc3Npb25kOiB1bmNsZWFyIGVycm9yIHdoZW4gY3Jl
YXRpbmcgYSBtYXAgYWdhaW5zdCBsdHRuZy1tb2R1bGVzIDwgMi4xNgoJKiBGaXg6IGNvbW1vbjog
Y291bnRlciBjb21tYW5kcyB1bmtub3duIHRvIGx0dG5nLW1vZHVsZXMgPCAyLjE2CgkqIHRlc3Rz
OiBBZGQgcmVjb3JkaW5nIHJ1bGUgcHJvcGFnYXRpb24gdGVzdHMKCSogRml4OiB0ZXN0czogcm9i
dXN0IHByb3RvY29sIHRlc3QgaXMgbm90IGRpc3RyaWJ1dGVkIGluIHN0YXRpYyBidWlsZHMKCSog
Rml4OiB0ZXN0czogc3RyZXNzOiBraWxsLXJlbGF5ZCBzY3JpcHRzIGFyZSBub3QgZGlzdHJpYnV0
ZWQKCSogdGVzdHM6IG1hcDogQWRkIGtleSBleGhhdXN0aW9uIHRlc3RzCgkqIEZpeDogc2Vzc2lv
bmQ6IHNjb3BlZCB0cmlnZ2VycyBldmFsdWF0ZWQgaW4gdW5zcGVjaWZpZWQgb3JkZXIKCSogRml4
OiBzZXNzaW9uZDogbWFwIGtleXMgZXhoYXVzdGVkIGluIHVuc3BlY2lmaWVkIG9yZGVyIG9uIGFw
cCBzeW5jCgkqIHRlc3RzOiBtYXA6IGNoZWNrIHRoYXQgbWFwLW9ubHkgc2Vzc2lvbnMgZG9uJ3Qg
c3Bhd24gYSBjb25zdW1lciBkYWVtb24KCSogRml4OiBzZXNzaW9uZDogY29uc3VtZXIgZGFlbW9u
IHNwYXduZWQgZm9yIG1hcC1vbmx5IHNlc3Npb25zCgkqIHRlc3RzOiBBZGQgbWFwIGNoYW5uZWwg
dGVzdHMgZm9yIHRoZSBhZ2VudCBkb21haW5zCgkqIHRlc3RzOiBtYXA6IEFkZCBrZXJuZWwgY291
bnRlcnBhcnQgb2YgdGhlIHJ1bGUgZmlsdGVyIHRlc3QKCSogdGVzdHM6IG1hcDogQWRkIHRlc3Qg
Zm9yIHRoZSBmaWx0ZXJzIG9mIHNldmVyYWwgcnVsZXMgb2YgYSBtYXAgY2hhbm5lbAoJKiBGaXg6
IHNlc3Npb25kOiBhZ2VudCBtYXAgY291bnRlcnMgc3RheSBhdCB6ZXJvCgkqIEZpeDogdXN0LWNv
bnN1bWVyZDogb2xkZXN0IHBhY2tldCBsb3N0IGluIHNuYXBzaG90IG9mIGFjdGl2ZSBjaGFubmVs
CgkqIHRlc3RzOiBGaXggYHRlc3RfdmVybWluYCBvb3QgYnVpbGRzCgkqIHJldXNlOiBBZGQgbWlz
c2luZyBjb3B5cmlnaHQvbGljZW5zZSB0YWdzCgkqIHRlc3RzOiBtaXNzaW5nIG5hbWUgaW4gY29w
eXJpZ2h0IGhlYWRlcgoJKiBGaXg6IHNlc3Npb25kOiByb2xsYmFjayBldmVudCBjb250ZXh0IHdo
ZW4gY2hhbm5lbCBub3RpZmljYXRpb24gcmVnaXN0cmF0aW9uIGZhaWxzCgkqIEZpeDogY29tbW9u
OiBjaGVjayBsb2FkIGRhdGEgdHlwZSBpbiBmaWx0ZXIgZ2xvYmJpbmcgdmFsaWRhdGlvbgoJKiBG
aXg6IGNvbW1vbjogYm91bmQgZmlsdGVyIElSIG5lc3RpbmcgZGVwdGgKCSogRml4OiBzZXNzaW9u
ZDogdmFsaWRhdGUgZmlsdGVyIGJ5dGVjb2RlIGdlbmVyYXRpb24gbGVuZ3RoCgkqIEZpeDogY29t
bW9uOiBoYXJkZW4gdHJpZ2dlci1saXN0IGhlYWRlciBkZWNvZGluZyBhZ2FpbnN0IHNob3J0IHBh
eWxvYWRzCgkqIEZpeDogY29tbW9uOiBib3VuZCBrZXktdGVtcGxhdGUgc2VnbWVudCBjb3VudCBm
cm9tIHBheWxvYWQKCSogRml4OiBjb21tb246IHZhbGlkYXRlIGFjdGlvbiBoZWFkZXIgbGVuZ3Ro
IGJlZm9yZSBkZXJlZmVyZW5jaW5nCgkqIEZpeDogY29tbW9uOiBkYWVtb24gYWJvcnQgb24gaW52
YWxpZCBsb2ctbGV2ZWwtcnVsZSB0eXBlCgkqIEZpeDogY29tbW9uOiB2YWxpZGF0ZSBhY3Rpb24g
bGlzdCBwYXlsb2FkIGxlbmd0aAoJKiBGaXg6IHNlc3Npb25kOiBzYW5pdGl6ZSBhZ2VudCBldmVu
dC1saXN0aW5nIHJlcGx5CgkqIEZpeDogY29tbW9uOiBzYW5pdGl6ZSBldmVudCBleGNsdXNpb24g
Y291bnQgb24gZGVzZXJpYWxpemF0aW9uCgkqIEZpeDogdGVzdHM6IG5vdGlmaWNhdGlvbiBnZW5l
cmF0b3IgdG9nZ2xlIGhhbmdzIG9uIHN1c3BlbmQKCSogdGVzdHM6IGNsb3NlIGV4cG9ydC1tYXBz
IGNvbm5lY3Rpb24gb24gQmFzZUV4Y2VwdGlvbgoJKiB0ZXN0czogYWRkIGx0dG5nX2NvbnN1bWVy
ZF9yZXN1bWUgaGVscGVyCgkqIEZpeDogdGVzdHM6IHJlY2xhaW0gdGltZXIgY2hhbm5lbCBrZXlz
IHVucmVhZGFibGUgb24gczM5MHgKCSogRml4OiBzZXNzaW9uZDogYXBwIGRlcGFydHVyZSBmbHVz
aGVzIGNoYW5uZWxzIG9mIGEgZGVzdHJveWVkIHNlc3Npb24KCSogRml4OiBzZXNzaW9uZDogZGVw
YXJ0aW5nIGFwcCdzIGJ1ZmZlcnMgbm90IGZsdXNoZWQgYnkgc3RvcAoJKiBGaXg6IGNvbnN1bWVy
ZDogY3Jhc2ggd2hlbiBjb25zdW1pbmcgYSBwYWNrZXQgd2l0aCBubyBvdXRwdXQKCSogRml4OiB1
c3QtY29uc3VtZXJkOiBjcmFzaCB3aGVuIGZsdXNoaW5nIGEgc3RyZWFtIHRoYXQgaGFzIG5vIGNo
dW5rCgkqIHRlc3RzOiByZWdyZXNzaW9uIHRlc3QgZm9yIHJvdGF0aW9uIG9mIG5ldmVyLWFjdGl2
ZSBzdHJlYW1zCgkqIEZpeDogY29uc3VtZXJkOiBubyBwYWNrZXQgcHJvZHVjZWQgZm9yIGlkbGUg
c3RyZWFtcyBvbiByb3RhdGlvbgoJKiB0ZXN0czogcmVncmVzc2lvbiB0ZXN0IGZvciBwZXItcHJv
Y2VzcyByZWNsYWltIHRpbWVyIHJlc3VtZQoJKiBGaXg6IHVzdC1jb25zdW1lcmQ6IHJlY2xhaW0g
dGltZXIgcmVzdW1lZCBmb3IgYSBzaW5nbGUgY2hhbm5lbCBvbmx5CgkqIHRlc3RzOiByZWdyZXNz
aW9uIHRlc3QgZm9yIGV4cGxpY2l0IHJlY2xhaW0gd2l0aG91dCBhbiBhZ2UgbGltaXQKCSogRml4
OiB1c3QtY29uc3VtZXJkOiBjcmFzaCBvbiBkZWZlcnJlZCByZWNsYWltIHdpdGhvdXQgYW4gYWdl
IGxpbWl0CgkqIHRlc3RzOiByZWdyZXNzaW9uIHRlc3QgZm9yIHJlY2xhaW0gdGltZXIgcmVzdW1l
IGFmdGVyIGV4cGxpY2l0IHJlY2xhaW0KCSogdGVzdHM6IEZpeCBrZXJuZWwgbW9kdWxlIGxlYWth
Z2UgaW4gYHRlc3RfbWFwX3ZhbHVlX3R5cGVfbXVsdGlsaWJfa2VybmVsLnB5YAoJKiBGaXg6IHVz
dC1jb25zdW1lcmQ6IHJlY2xhaW0gdGltZXIgbm90IHJlc3VtZWQgYWZ0ZXIgZXhwbGljaXQgcmVj
bGFpbQoJKiB0ZXN0czogc2NoZWR1bGVyIHVuaXQgdGVzdHMgZm9yIHJlLWFybWluZyBhIGNhbmNl
bGxlZCB0YXNrCgkqIGNvbW1vbjogcmUtYXJtIGEgY2FuY2VsbGVkIHNjaGVkdWxlciB0YXNrIHdo
ZW4gaXQgaXMgcmVzY2hlZHVsZWQKCSogRml4OiB1c3QtY29uc3VtZXJkOiBsb2NrIGludmVyc2lv
biBiZXR3ZWVuIHJlY2xhaW0gcmVxdWVzdCBhbmQgc2NoZWR1bGVyCgkqIEZpeDogc2Vzc2lvbmQ6
IHVuc2FmZSBzdHJpbmcgY29waWVzIHdoZW4gYnVpbGRpbmcgc2Vzc2lvbiBjb25maWcgcGF0aAoJ
KiBGaXg6IGNvbW1vbjogc3dhcHBlZCBwcm92aWRlci9wcm9iZSBuYW1lcyBpbiBTRFQgdXByb2Jl
IGNvbmZpZyBwYXJzaW5nCgkqIG1pc2M6IFNwbGl0IHZlcm1pbiBjb25maWcgb3V0IG9mIHB5cHJv
amVjdC50b21sCgoyMDI2LTA2LTI0IHwgbHR0bmctdG9vbHMgMi4xNi4wLXJjMSAoTGEgU2FpbnQt
SmVhbiDigJQgRsOqdGUgTmF0aW9uYWxlIGR1IFF1w6liZWMpCk5ldyBmZWF0dXJlcyBhbmQgY2hh
bmdlcyBpbiBMVFRuZyAyLjE2OgogICAg4oCiIE1hcHMgYXJlIHRoZSBtYWluIGZlYXR1cmUgb2Yg
TFRUbmcgMi4xNjogdGhleSBhZGQgYSBuZXcgbGl2ZSBldmVudAogICAgICBjb3VudGVyIGFnZ3Jl
Z2F0aW9uIHBhdGggYWxvbmdzaWRlIGV2ZW50IHJlY29yZGluZy4gVGhleSBsZXQgeW91CiAgICAg
IGNvdW50IGV2ZW50IGFjdGl2aXR5LCBzdWNoIGFzIGhvdyBvZnRlbiBlYWNoIHN5c3RlbSBjYWxs
IGZpcmVzIG9yCiAgICAgIHdoaWNoIGV2ZW50cyBhbiBhcHBsaWNhdGlvbiBlbWl0cyB0aGUgbW9z
dCwgd2l0aG91dCByZWNvcmRpbmcgYQogICAgICBzaW5nbGUgZXZlbnQgcmVjb3JkLgoKICAgICAg
QSBtYXAgY2hhbm5lbCBjb25maWd1cmVzIGEgc2V0IG9mIHBlci1DUFUgY291bnRlcnM6IG5hbWVk
IGludGVnZXIKICAgICAgdmFsdWVzLCBrZXllZCBieSBzdHJpbmdzLCB3aGljaCBhY2N1bXVsYXRl
IG92ZXIgdGltZS4gVW5saWtlIGFuCiAgICAgIGV2ZW50IHJlY29yZCBjaGFubmVsICh0aGUgbmV3
IG5hbWUgZm9yIHdoYXQgdXNlZCB0byBiZSBzaW1wbHkKICAgICAgY2FsbGVkIGEgImNoYW5uZWwi
KSwgYSBtYXAgY2hhbm5lbCBkb2Vzbid0IHJlY29yZCBpbmRpdmlkdWFsCiAgICAgIGV2ZW50cyB0
byByaW5nIGJ1ZmZlcnM7IGluc3RlYWQsIGl0IG1haW50YWlucyBydW5uaW5nIHRvdGFscyB5b3UK
ICAgICAgY2FuIHJlYWQgYXQgYW55IG1vbWVudC4gTWFwIGNoYW5uZWxzIGFuZCBldmVudCByZWNv
cmQgY2hhbm5lbHMgYXJlCiAgICAgIGluZGVwZW5kZW50IGFuZCBtYXkgY29leGlzdCB3aXRoaW4g
dGhlIHNhbWUgcmVjb3JkaW5nIHNlc3Npb24uCgogICAgICBBZGQgYSBtYXAgY2hhbm5lbCB0byBh
IHJlY29yZGluZyBzZXNzaW9uIHdpdGggdGhlIG5ldwogICAgICBsdHRuZy1hZGQtbWFwLWNoYW5u
ZWwoMSkgY29tbWFuZDoKCiAgICAgICAgICAkIGx0dG5nIGFkZC1tYXAtY2hhbm5lbCAtLXR5cGU9
dXNlciBteS1jb3VudGVycwoKICAgICAgUG9wdWxhdGUgaXRzIGNvdW50ZXJzIHdpdGggdGhlIG5l
dyBgaW5jci1tYXAtdmFsdWVgIGFjdGlvbiBvZiB0aGUKICAgICAgbHR0bmctYWRkLXRyaWdnZXIo
MSkgY29tbWFuZC4gVGhlIGAtLWtleWAgb3B0aW9uIGlzIGEgdGVtcGxhdGU6CiAgICAgIExUVG5n
IHN1YnN0aXR1dGVzIHRoZSBge2V2ZW50X25hbWV9YCBhbmQgYHtwcm92aWRlcl9uYW1lfWAKICAg
ICAgcGxhY2Vob2xkZXJzIGZvciBlYWNoIG1hdGNoaW5nIGV2ZW50LCBzbyB0aGF0IGEgc2luZ2xl
IHRyaWdnZXIgY2FuCiAgICAgIGZlZWQgbWFueSBjb3VudGVycy4KCiAgICAgIFJlYWQgdGhlIGN1
cnJlbnQgY291bnRlciB2YWx1ZXMgd2l0aCB0aGUgbmV3IGx0dG5nLXNob3ctbWFwcygxKQogICAg
ICBjb21tYW5kLCB3aGljaCBjYW4gc29ydCwgZmlsdGVyLCBhbmQgc2xpY2UgdGhlIG91dHB1dCBt
YW55IHdheXMKICAgICAgKHBlciBDUFUsIHBlciBvd25lciwgYnkgdXNlciBvciBwcm9jZXNzIElE
LCBieSBrZXksIGFuZCBtb3JlKToKCiAgICAgICAgICAkIGx0dG5nIHNob3ctbWFwcwoKICAgICAg
RXhwb3J0IGV2ZXJ5IGNvdW50ZXIgb2YgZXZlcnkgbWFwIGNoYW5uZWwgYXMgYSBzZWxmLWNvbnRh
aW5lZAogICAgICBTUUxpdGUgc2NyaXB0IHdpdGggdGhlIG5ldyBsdHRuZy1leHBvcnQtbWFwcygx
KSBjb21tYW5kLCB0aGVuCiAgICAgIHF1ZXJ5IHRoZSByYXcgZGF0YSB3aXRoIHRoZSBmdWxsIHBv
d2VyIG9mIFNRTDoKCiAgICAgICAgICAkIGx0dG5nIGV4cG9ydC1tYXBzIHwgc3FsaXRlMyAtYm94
IDptZW1vcnk6CgogICAgICBBIG1hcCBjaGFubmVsIG1heSBob2xkIDMyLWJpdCBvciA2NC1iaXQg
c2lnbmVkIGludGVnZXIgY291bnRlcnMsCiAgICAgIGNhcCBpdHMgbnVtYmVyIG9mIGtleXMsIGFu
ZCBmb2xsb3cgYSBwZXItdXNlciBvciBwZXItcHJvY2VzcwogICAgICBidWZmZXIgb3duZXJzaGlw
IG1vZGVsIGZvciB1c2VyIHNwYWNlIHRyYWNpbmcgd2l0aCB0aGUKICAgICAgYC0tdmFsdWUtdHlw
ZWAsIGAtLW1heC1rZXktY291bnRgLCBhbmQgYC0tYnVmZmVyLW93bmVyc2hpcGAKICAgICAgb3B0
aW9ucyBvZiBsdHRuZy1hZGQtbWFwLWNoYW5uZWwoMSkuCgogICAgICBXaXRoIGEgcGVyLXByb2Nl
c3MgYnVmZmVyIG93bmVyc2hpcCBtb2RlbCwgdGhlCiAgICAgIGAtLWRlYWQtcHJvY2Vzcy1wb2xp
Y3lgIG9wdGlvbiBvZiBsdHRuZy1hZGQtbWFwLWNoYW5uZWwoMSkKICAgICAgY29udHJvbHMgd2hh
dCBoYXBwZW5zIHRvIHRoZSBjb3VudGVycyBvZiBhbiBpbnN0cnVtZW50ZWQgcHJvY2VzcwogICAg
ICB3aGVuIGl0IHRlcm1pbmF0ZXMgd2hpbGUgdGhlIG1hcCBjaGFubmVsIHN0aWxsIGV4aXN0czog
ZWl0aGVyCiAgICAgIGRpc2NhcmQgdGhlbSBvciwgYnkgZGVmYXVsdCwgZm9sZCB0aGVtIGludG8g
dGhlIHNoYXJlZCBjb3VudGVycyBvZgogICAgICB0aGUgbWFwIGNoYW5uZWwuCgogICAg4oCiIFRo
ZSBsdHRuZy1saXN0KDEpIGFuZCBsdHRuZy1zdGF0dXMoMSkgY29tbWFuZHMgbm93IGxpc3QgbWFw
CiAgICAgIGNoYW5uZWxzIGFuZCB0aGVpciBjb25maWd1cmF0aW9uOyBmaWx0ZXIgdGhlbSB3aXRo
IHRoZSBuZXcKICAgICAgYC0tbWFwLWNoYW5uZWxgIG9wdGlvbi4KCiAgICDigKIgVGhlIGx0dG5n
LWNsZWFyKDEpIGNvbW1hbmQgcmVzZXRzIGFsbCB0aGUgY291bnRlcnMgb2YgYSByZWNvcmRpbmcK
ICAgICAgc2Vzc2lvbiB0byAwLCB3aXRob3V0IHJlbW92aW5nIGFueSBhbGxvY2F0ZWQga2V5cy4K
CiAgICDigKIgVGhlIGx0dG5nLXNhdmUoMSkgYW5kIGx0dG5nLWxvYWQoMSkgY29tbWFuZHMgbm93
IHNlcmlhbGl6ZSBhbmQKICAgICAgcmVzdG9yZSB0cmlnZ2Vycy4gU2F2aW5nIGEgcmVjb3JkaW5n
IHNlc3Npb24gY29uZmlndXJhdGlvbiBhbHNvCiAgICAgIHdyaXRlcyBldmVyeSB0cmlnZ2VyIHdo
aWNoIGV4aXN0cyBhdCBzYXZpbmcgdGltZSwgYW5kIGxvYWRpbmcgaXQKICAgICAgcmVjcmVhdGVz
IHRob3NlIHRyaWdnZXJzLiBUaGlzIGlzIHRoZSBvbmx5IHdheSB0byBwcmVzZXJ2ZSB0aGUKICAg
ICAgYGluY3ItbWFwLXZhbHVlYCB0cmlnZ2VycyB3aGljaCBwb3B1bGF0ZSB0aGUgY291bnRlcnMg
b2YgYQogICAgICByZWNvcmRpbmcgc2Vzc2lvbi4gU2tpcCB0aGlzIGJlaGF2aW9yIHdpdGggdGhl
IG5ldyBgLS1uby10cmlnZ2Vyc2AKICAgICAgb3B0aW9uIG9mIGJvdGggY29tbWFuZHMuCgogICAg
ICBsdHRuZy1sb2FkKDEpIGRvZXNuJ3QgcmVzdG9yZSB0aGUgb3JpZ2luYWwgb3duZXIgb2YgYSBs
b2FkZWQKICAgICAgdHJpZ2dlcjogdGhlIFVuaXggdXNlciBydW5uaW5nIHRoZSBjb21tYW5kIGJl
Y29tZXMgdGhlIG93bmVyIG9mCiAgICAgIGV2ZXJ5IGxvYWRlZCB0cmlnZ2VyLCByZWdhcmRsZXNz
IG9mIHdoaWNoIFVuaXggdXNlciBvd25lZCBpdCBhdAogICAgICBzYXZpbmcgdGltZS4KCiAgICDi
gKIgTFRUbmctVVNUIGdhaW5zIEJMT0IgZmllbGQgaW5zdHJ1bWVudGF0aW9uIHN1cHBvcnQgdG8g
cmVjb3JkIGFuCiAgICAgIGFyYml0cmFyeSBzZXF1ZW5jZSBvZiBieXRlcyB0YWdnZWQgd2l0aCBh
biBJQU5BIG1lZGlhIHR5cGUgKGZvcgogICAgICBleGFtcGxlIGBpbWFnZS9qcGVnYCkgd2l0aCB0
aGUgbmV3CiAgICAgIGx0dG5nX3VzdF9maWVsZF9maXhlZF9sZW5ndGhfYmxvYigpIGFuZAogICAg
ICBsdHRuZ191c3RfZmllbGRfdmFyaWFibGVfbGVuZ3RoX2Jsb2IoKSBmaWVsZCBtYWNyb3MuIENU
RiAyCiAgICAgIHN1cHBvcnRzIHRoZSBCTE9CIGZpZWxkIGNsYXNzIGFzIGlzLCBpbmNsdWRpbmcg
dGhlIG1lZGlhIHR5cGU7IGZvcgogICAgICBDVEYgMS44LCBMVFRuZyByZWNvcmRzIHRoZSBieXRl
cyBhcyBhIGJlc3QtZWZmb3J0IGFycmF5IG9mIDgtYml0CiAgICAgIHVuc2lnbmVkIGludGVnZXJz
LCB3aGljaCBsb3NlcyB0aGUgbWVkaWEgdHlwZS4KCiAgICDigKIgUGFzcyB0aGUgbmV3IGAtLXNw
YXduLWNvbnN1bWVyc2Agb3B0aW9uIHRvIHRoZSBsdHRuZy1zZXNzaW9uZCg4KQogICAgICBjb21t
YW5kIHRvIHN0YXJ0IHRoZSBjb25zdW1lciBkYWVtb25zIGltbWVkaWF0ZWx5IGluc3RlYWQgb2YK
ICAgICAgaGF2aW5nIHRoZSBzZXNzaW9uIGRhZW1vbiBzcGF3biB0aGVtIG9uIGZpcnN0IG5lZWQu
CiAgICDigKIgbHR0bmdfc2Vzc2lvbl9hZGRfbWFwX2NoYW5uZWwoKSBhbmQKICAgICAgbHR0bmdf
c2Vzc2lvbl9saXN0X21hcF9jaGFubmVscygpOiBhZGQgYW5kIGVudW1lcmF0ZSBtYXAgY2hhbm5l
bHMuCiAgICDigKIgVGhlIGx0dG5nX21hcF9jaGFubmVsXyooKSwgbHR0bmdfbWFwX2dyb3VwXyoo
KSwgYW5kCiAgICAgIGx0dG5nX21hcF9rZXlfKigpIGZ1bmN0aW9uIGZhbWlsaWVzOiBjb25maWd1
cmUgYW5kIGluc3BlY3QgbWFwCiAgICAgIGNoYW5uZWxzIGFuZCB0aGVpciBrZXlzLgogICAg4oCi
IFRoZSBsdHRuZ19hY3Rpb25faW5jcmVtZW50X21hcF92YWx1ZV8qKCkgZnVuY3Rpb24gZmFtaWx5
OiBidWlsZCB0aGUKICAgICAgbmV3ICJpbmNyZW1lbnQgbWFwIHZhbHVlIiB0cmlnZ2VyIGFjdGlv
biwgYWxvbmcgd2l0aCBzdHJpbmcga2V5CiAgICAgIHRlbXBsYXRlIHV0aWxpdGllcy4KICAgIOKA
oiBOZXcgYExUVE5HX0VWRU5UX0ZJRUxEX1ZBTFVFX1RZUEVfQkxPQmAgZXZlbnQgZmllbGQgdmFs
dWUgdHlwZSB0bwogICAgICBjYXB0dXJlIGFuZCBmaWx0ZXIgb24gQkxPQiBldmVudCBmaWVsZHMg
ZnJvbSB0cmlnZ2Vycy4gR2V0IHRoZQogICAgICBJQU5BIG1lZGlhIHR5cGUsIGxlbmd0aCwgYW5k
IGRhdGEgb2YgYSBjYXB0dXJlZCBCTE9CIGZpZWxkIHdpdGgKICAgICAgbHR0bmdfZXZlbnRfZmll
bGRfdmFsdWVfYmxvYl9nZXRfbWVkaWFfdHlwZSgpLAogICAgICBsdHRuZ19ldmVudF9maWVsZF92
YWx1ZV9ibG9iX2dldF9sZW5ndGgoKSwgYW5kCiAgICAgIGx0dG5nX2V2ZW50X2ZpZWxkX3ZhbHVl
X2Jsb2JfZ2V0X2RhdGEoKS4KICAgIOKAoiBsdHRuZ19yZWdpc3Rlcl9jb25zdW1lcigpIGlzIGRl
cHJlY2F0ZWQgYW5kIG5vdyByZXR1cm5zCiAgICAgIGBMVFROR19FUlJfTk9UX1NVUFBPUlRFRGAu
CiAgICDigKIgTUkgc2NoZW1hIHZlcnNpb24gYnVtcGVkIHRvIDQuMy4K

--===============4319448839529504307==--

