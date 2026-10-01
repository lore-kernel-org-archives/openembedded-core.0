Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077AECA5FCE
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 06:31:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5424.1790836300712896956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 23:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=O1px8g4t;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UzeNqLZQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0f629570e-6eec2140-ee11-42e1-aba9-ae8d3ba81fb2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790836299;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=pL0qJjqCX7r1bzI7fkfMtBXH9hZF96UnArfl8G4uR5o=;
	b=O1px8g4t4UOCP25tVwM1A6uyjs04oZ5ImGMyeSrqgK8klFjIdBS/fGbv8Oja3g4v
	O5nO1RGih2u/YTN/GMCZ2fdLdDrZ5uBuISuOJopvLRteHSLXAIY9uMWbs42hGuFbhrI
	BpJ1Z16kTjPAlL6seYTnvafHINYDOEie7oIdBmPQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790836299;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=pL0qJjqCX7r1bzI7fkfMtBXH9hZF96UnArfl8G4uR5o=;
	b=UzeNqLZQj3Tjhnq7DXAPmHFsrPabT8zy8HS9KLAFEC8XpEEPCeLQWW68uenKfS6r
	44jr1rNYMstVALHFhMGGkg3JvLSSvCXP2saEoz1lmx0MSjJJOifWyjD0UpniVLfTdOh
	VzFoNH7op0TZxDJCU0DfHgAnkP+PtYcRiga91EXk=
Content-Type: multipart/mixed; boundary="===============3525013811631017977=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] kea: upgrading to 3.2.1 FAILED
Message-ID: <010101a0f629570e-6eec2140-ee11-42e1-aba9-ae8d3ba81fb2-000000@us-west-2.amazonses.com>
Date: Thu, 1 Oct 2026 06:31:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 06:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247003

--===============3525013811631017977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kea* to *3.2.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe kea failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-cc1439c446d7df4f3cdaa38e8d78865b6518d5ca"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:cc1439c446d7df4f3cdaa38e8d78865b6518d5ca"
meta-yocto-bsp       
meta-poky            = "master:01f504740bcfa42ff53f4b3341a0dcee275fa6bd"
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
Parsing of 960 .bb files complete (0 cached, 960 parsed). 1992 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-cc1439c446d7df4f3cdaa38e8d78865b6518d5ca"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:cc1439c446d7df4f3cdaa38e8d78865b6518d5ca"
meta-yocto-bsp       
meta-poky            = "master:01f504740bcfa42ff53f4b3341a0dcee275fa6bd"
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
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://ftp.isc.org/isc/kea/3.2.1/kea-3.2.1.tar.xz...
INFO: Rebasing devtool onto b48cb5a17f950727bc9a986607ae22df242a6807
WARNING: Command 'git rebase b48cb5a17f950727bc9a986607ae22df242a6807' failed:
Auto-merging src/lib/asiolink/openssl_tls.h
CONFLICT (content): Merge conflict in src/lib/asiolink/openssl_tls.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/kea
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/kea/kea_3.2.1.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/kea.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/kea.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3525013811631017977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="kea-changelog.txt"

Kea 3.2.1 (stable) released on September 30, 2026

2511.[bug]tmark
Related name change requests (NCRs), are now
sent by kea-dhcp4 and kea-dhcp6 in a single
message to kea-dhcp-ddns.  This ensures that
kea-dhcp-ddns processes them in the order they
were received.
(Gitlab #4806, #3005)

2510.[bug]tmark
Modified kea-dhcp-ddns to avoid starting a
transaction for a request if there is already
a transaction for the request's FQDN or ip address.
Prior to this it used the DHCID to guard against
concurrent work.
(Gitlab #4805,#4585)

2509.[func]tmark
Modified kea-dhcp4 and kea-dhcp6 to avoid
scheduling unnecessary DDNS entry removals
when renewing leases.
(Gitlab #4804, #4794)

2508.[bug]fdupont
Made lexical analyzers more robust with null characters
in input, e.g. in server or agent configuration files.
(Gitlab #4795,#4739)

2507.[build]fdupont
Added OpenSSL 4.0.x support.
(Gitlab #4756, #4673)

2506.[bug]tmark
Improved handling of special characters
in values written to memfile lease database.
(Gitlab #4787, #4393)

2505.[bug]razvan, fdupont
Fixed bugs related to out of bound container access which can
cause Kea to crash if -D_GLIBCXX_ASSERTIONS flag is used at
compilation time. This affected perfdhcp, host_cache hook
library, kea-dhcp4, kea-dhcp6, kea-dhcp-ddns and kea-netconf.
Thank you to Joseph Bisch (joseph.bisch@gmail.com) for reporting
this issue.
(Gitlab #4783,#4741,#4708)

2504.[bug]fdupont
Made parsing of DHCPv6 relayed messages stricter:
now truncated RELAY-FORW and RELAY-REPLY headers
cause the whole message to be dropped. Thank you to
Qifan Zhang from Palo Alto Networks for reporting
the issue.
(Gitlab #4752,#4560,#4735)

2503.[bug]fdupont
Set the broadcast flag in DHCPNAK responses to relayed
DHCPREQUEST queries as required by RFC 2131 4.3.2.
Thank you to Florian Krieger from Frauscher Sensor Technology
Group GmbH for reporting the issue.
(Gitlab #4751,#4424)

2502.[bug]razvan,tmark
Corrected MLM_MYSQL_FETCH_FAILURE to 1 so MySQL
selectQuery and host lookups detect mysql_stmt_fetch
errors instead of silently ignoring them.
(Gitlab #4754,#4658)

2501.[bug]fdupont,tmark
Fixed an issue in debug-level logging of dropped packets
that could cause the server to crash under heavy load.
Applies to both kea-dhcp4 and kea-dhcp6.
(Gitlab #4750,#4755,#4719,#4748)

2500.[bug]fdupont,tmark
Removed spurious DHCP_RECEIVE4_UNKNOWN and
DHCP_RECEIVE6_UNKNOWN warnings sent for instance
when a command is received. This bug was introduced
in 3.2.0 release.
(Gitlab #4749, #4674)

2499.[build]razvan
The library version numbers have been bumped up for the Kea 3.2.1
stable release.
(Gitlab #4811)

2498.[bug]tmark
Improved handling of special characters
in values written to memfile lease database.
(Gitlab #4787,#4393)

--===============3525013811631017977==--

