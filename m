Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA08C982D8
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 05:47:15 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4917.1789710432686680532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 22:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QVR0T/JM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pQSrYrRl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0b30df610-a9c31ba3-cb65-4a05-b81d-a9cc3da1fdc0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789710431;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=cGOL5Cn6+XGZ7BLcJv/1zWHQBNZoIbUe00wiXHvV4gY=;
	b=QVR0T/JMi5M2L8DKM9qjMuM7IugT6hDawMdsbMQCXPNHWU3reolr0aAo9ZB0VU2k
	NHlM3zG8lvX1CBegasASBHYkA/L4D7cg7a6Yse3zDgXWmhvZigIzB85w1v0E2M9ciNp
	B3m9BwT09gNNE+l8+Bdaqan23WKBlRH3HFC5CN5Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789710431;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=cGOL5Cn6+XGZ7BLcJv/1zWHQBNZoIbUe00wiXHvV4gY=;
	b=pQSrYrRlffwadjem0tVpHrRpVu/l451W48gQOgBnrBkHYhIiKAyVS9YOTlP6uKVr
	rgerjtaBYO7cqXNTqgH25vCnfZEDQBgeyRlNiGIl+q7o4ZiYypfqRSTMPOigHIlw/X5
	Ed378uTfJFQw7/EapvmphvF/Uc1bC2NcE7/gvGAE=
Content-Type: multipart/mixed; boundary="===============3676795653510150930=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libdnf: upgrading to 0.76.0 FAILED
Message-ID: <010101a0b30df610-a9c31ba3-cb65-4a05-b81d-a9cc3da1fdc0-000000@us-west-2.amazonses.com>
Date: Fri, 18 Sep 2026 05:47:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 05:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246179

--===============3676795653510150930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdnf* to *0.76.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libdnf failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1993 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-06f598f18755c99a8edd240373f39f468d8a3e28"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:06f598f18755c99a8edd240373f39f468d8a3e28"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 56370b044f6efdfd14240e3dccac62b833dbe027
WARNING: Command 'git rebase 56370b044f6efdfd14240e3dccac62b833dbe027' failed:
Auto-merging libdnf/hy-util.cpp
CONFLICT (content): Merge conflict in libdnf/hy-util.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libdnf
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libdnf/libdnf_0.76.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libdnf.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3676795653510150930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libdnf-changelog.txt"

Changelog for libdnf: 0.75.0 -> 0.76.0
Source: docs/hawkey/changes.rst

GNU General Public License along with this program; if not, see
  <https://www.gnu.org/licenses/>.  Any Red Hat trademarks that are
  incorporated in the source code or documentation are not subject to the GNU
  General Public License and may only be used or replicated with the express
  permission of Red Hat, Inc.

--===============3676795653510150930==--

