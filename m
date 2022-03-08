Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69E2C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 10:36:27 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.6797.1646735786567515941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 02:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iQiEbAIY;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646735784; i=@fujitsu.com;
	bh=5vPPqbOAm0pZxzAwr3Gu1FEyjs5KVYvDYHdYWjHrDSI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iQiEbAIYOm0XvQ/nFVaZds1LM4cf9sqRzO/vDit0iNe62USnKktrlf8naakXOGIL7
	 5Wn8QNw+rIVk5jnYCxgVz3x7brBok2offXRuEnUkt7WURjXYD41ofGZBNto0nGT2ap
	 wUmUbumVE+voO0mcWbD2dalk8Wb004fmrKXkBhKPZNI1CaeC+YpI+CEo28DZG4WbE7
	 1DTdZXZqxy35TQJ6us3E34POXCQxp/0jAj7sqMGmfdEuZ7++uJLuG9dBR5JqBuPl9L
	 pq+L0DfSE9xhNd7YqYoDPPgh435l+FmeP3apPkGCULEcWBiJiVh0eDbEs8OnUSTh/O
	 gfLfYiWGodI/Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRXeFoXq
  SwfWFshZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b+c+eZC5rFKhYuXsXYwNgn3MXIxSEkMJ1J
  YsaW0ywQznFGiV9LOtm7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x6wEmEBB4l3k
  6axgdgsQPErj38ygZTzCjhJdPWBlUgIKEhMefieGcTmFHCWmLmhkQ2kRAio5P8ufpAwr4CgxM
  mZT1ggpktIHHzxghmiVVFi9uVmFgi7QmLWrDamCYz8s5C0zELSsoCRaRWjdVJRZnpGSW5iZo6
  uoYGBrqGhqa6xka6hhaVeYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgQKYU
  K+zdwXh55U+9Q4ySHExKorz1bOpJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR49+gD5QSLUtNTK
  9Iyc4DRAZOW4OBREuEt1QJK8xYXJOYWZ6ZDpE4xKkqJ864B6RMASWSU5sG1wSLyEqOslDAvIw
  MDgxBPQWpRbmYJqvwrRnEORiVh3tcgU3gy80rgpr8CWswEtNjOSA1kcUkiQkqqgcmhVSo9LPi
  SkE3q1R86LWeunvV6vG/rT60YceUYTdtdip3nFk1Y11CV0PHN94OppFfvfb0j/4wvi9w79d2C
  ud5h1tl2Zc5PfsyHRSs7qp9afW9/lTZR1iM6/hjDgo+CL1enuEldvNP0Jsh+/sQN2/UPFlvMs
  dfOCeGuWcW28ILCyR0cFk993uvfONxrpdNxuiLR1ep30OYnNyc1+hrPu7A57Xzxkfmhn77tbF
  C+XCuyX89exem7nnr1XX+Od+qvPEMkljQyqj4xWpJheKbggEz0qqy3jixm0skNE6dWvLp70sn
  l2TmlHD0+Re65K7ferQrZHbHb2vHtk4Dte5cr3F5i/K3dr49NyMxhc9fPnUosxRmJhlrMRcWJ
  AH4fAQVDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1646735784!6898!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18787 invoked from network); 8 Mar 2022 10:36:24 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Mar 2022 10:36:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 228AaILG013458
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Mar 2022 10:36:24 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Mar 2022 10:36:19 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH] sudo: upgrade 1.9.9 -> 1.9.10
Date: Tue, 8 Mar 2022 18:36:08 +0800
Message-ID: <1646735768-59031-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646735768-59031-1-git-send-email-wangmy@fujitsu.com>
References: <1646735768-59031-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 10:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162900

Changelog:
=========
Added new log_passwords and passprompt_regex sudoers options.

Added new log_passwords and passprompt_regex settings to sudo_logsrvd that
operate like the sudoers options when logging terminal input.

Fixed several few bugs in the cvtsudoers utility when merging multiple
sudoers sources.

Fixed a bug in sudo_logsrvd parsing the sudo_logsrvd.conf file, where the
retry_interval in the [relay] section was not being recognized.

Restored the pre-1.9.9 behavior of not performing authentication when sudo's
-n option is specified.

On systems with /proc, if the /proc/self/stat (Linux) or /proc/pid/psinfo
(other systems) file is missing or invalid, sudo will now check file
descriptors 0-2 to determine the user's terminal. Bug #1020.

Fixed a compilation problem on Debian kFreeBSD. Bug #1021.

Fixed a crash in sudo_logsrvd when running in relay mode if an alert message
is received.

Fixed an issue that resulting in "problem with defaults entries" email to
be sent if a user ran sudo when the sudoers entry in the nsswitch.conf file
includes "sss" but no sudo provider is configured in /etc/sssd/sssd.conf. Bug #1022.

Updated the warning displayed when the invoking user is not allowed to run sudo.

Fixed a bug where the user-specified command timeout was not being honored if
the sudoers rule did not also specify a timeout.

Added support for using POSIX extended regular expressions in sudoers rules.

A user may now only run sudo -U otheruser -l if they have a "sudo ALL"
privilege where the RunAs user contains either root or otheruser.

The sudo lecture is now displayed immediately before the password prompt.

Sudo now uses its own closefrom() emulation on Linux systems.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/sudo/{sudo_1.9.9.bb => sudo_1.9.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.9.bb => sudo_1.9.10.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.9.bb b/meta/recipes-extended/sudo/sudo_1.9.10.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.9.bb
rename to meta/recipes-extended/sudo/sudo_1.9.10.bb
index d7d71bb364..aa0d814ed7 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.9.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.10.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "6d6ee863a3bc26c87661093a74ec63e10fd031ceba714642d21636dfe25e3e00"
+SRC_URI[sha256sum] = "44a1461098e7c7b8e6ac597499c24fb2e43748c0c139a8b4944e57d1349a64f4"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.25.1


