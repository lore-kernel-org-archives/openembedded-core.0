Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5168C5AC67
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 06:06:43 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.865.1786169196261107795
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 23:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X7Zs6sG+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WOAiC9Vr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019fdffafad1-55dd94ae-9920-4f42-8598-144266689fcb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786169195;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=bK9tpQcNByVEkQXRr7OuR4bp0i/HatY+Aq3sbi3fvf0=;
	b=X7Zs6sG+EwUCgg3vo9wGiJkcOPuRJ5pSBj0+XPj+3BBv8QfNGFP9oj7LbUnfSE1A
	4b2jPykxeXg6GVxyMCRLlvxopnz7FDWQNSM6htmgxR7+3uquM03Sm0jmkUC4+nOipXL
	wW0awuZYGg4Oh7f03ANF7wdQ1CNrhlo2TcveqiEU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786169195;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=bK9tpQcNByVEkQXRr7OuR4bp0i/HatY+Aq3sbi3fvf0=;
	b=WOAiC9Vrjg+u4ZzADiRXHPH74vj6M7LysGsQaZSBbuqvCJ6fRlM/KcT/oKS8UrrG
	DCq2nbw2pbUZyzLoeF4qPxaioi1vGVGIaXPKRybF1744TfbJb0AI28OdX+TxVcA1fJa
	817nKmLJkBeA7uv6/KPvqgeOfp3tbns9Q0ju8l1c=
Content-Type: multipart/mixed; boundary="===============1236349151123273136=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] wpa-supplicant: upgrading to 2.12 FAILED
Message-ID: <0101019fdffafad1-55dd94ae-9920-4f42-8598-144266689fcb-000000@us-west-2.amazonses.com>
Date: Sat, 8 Aug 2026 06:06:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.08-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 06:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243029

--===============1236349151123273136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wpa-supplicant* to *2.12* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe wpa-supplicant failed.
NOTE: Reconnecting to bitbake server...
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
DISTRO_VERSION       = "6.0.99+snapshot-20f678d825d1b8a1e8bfa88dedd51eb628c96d51"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:20f678d825d1b8a1e8bfa88dedd51eb628c96d51"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
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
Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/recipetool/tmp-recipetool-l0pxcj2d.bb: tmp-recipetool-l0pxcj2d: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-l0pxcj2d-CLOSED"
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
DISTRO_VERSION       = "6.0.99+snapshot-20f678d825d1b8a1e8bfa88dedd51eb628c96d51"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:20f678d825d1b8a1e8bfa88dedd51eb628c96d51"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-l0pxcj2d: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-l0pxcj2d-CLOSED"
WARNING: tmp-recipetool-l0pxcj2d: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-l0pxcj2d-CLOSED"
WARNING: tmp-recipetool-l0pxcj2d: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-l0pxcj2d-CLOSED"
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: tmp-recipetool-l0pxcj2d: LICENSE is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.
LICENSE = "LicenseRef-tmp-recipetool-l0pxcj2d-CLOSED"
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  30% |###########                         | ETA:  0:00:00
Adding changed files:  61% |######################              | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://w1.fi/releases/wpa_supplicant-2.12.tar.gz...
INFO: Rebasing devtool onto 41da7143767ce04b6e40f1050a74f3323c013a90
WARNING: Command 'git rebase 41da7143767ce04b6e40f1050a74f3323c013a90' failed:
Auto-merging wpa_supplicant/defconfig
CONFLICT (content): Merge conflict in wpa_supplicant/defconfig

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/wpa-supplicant
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/wpa-supplicant/wpa-supplicant_2.12.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/wpa-supplicant.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1236349151123273136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="wpa-supplicant-changelog.txt"

Changelog for wpa-supplicant: 2.11 -> 2.12
Source: wpa_supplicant/ChangeLog

2026-08-07 - v2.12
	* support RSN overriding (e.g., WPA3-Personal Compatibility Mode)
	* improve BSS transition management support
	* EHT/IEEE 802.11be/Wi-Fi 7
	  - more complete support
	  - fix message validation issues that could enable DoS attacks
	* support Wi-Fi Direct R2
	* support Wi-Fi Aware (add synchronized NAN; extend USD support)
	* support Proximity Ranging
	* support SPP A-MSDU negotiation
	* support IEEE 802.11bi functionality
	  - changing SAE password identifiers
	  - EPPKE
	  - IEEE 802.1X/EAP in Authentication frames
	  - Association frame encryption
	  - PMKID privacy
	* enable layer 2/Wi-Fi multicast filtering for all networks (not
	  just some Passpoint networks which enabled this before)
	* wpa_gui: port to Qt6
	* support OpenSSL 3.0 API changes
	* EAP-TEAP: protocol changes based on RFC 9930; this is not compatible
	  with previous versions
	* maintain configuration file permissions when writing updated
	  configuration
	* add option to validate PKCS#11/OpenSC engine and module paths
	* fix PMKSA caching to enforce network context to avoid misuse of
	  unexpected PMKSA cache entries
	* fix a potential DoS attack in SAE processing of an unexpected element
	* fix incomplete bounds checking of mesh AMPE messages that could have
	  resulted in DoS attacks and memory corruption
	* a large number of other fixes, cleanup, and extensions

--===============1236349151123273136==--

