Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 75E6D7F94C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:04:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47GrLP2VnXzD5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 15:04:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574085885;
	bh=GaHXk+C5gX0r7kyYKRShqtxiNtY1vjVkMQALaX4p+bU=;
	h=From:To:Subject:Date:From;
	b=Y5jGdLUrGMCHW6jLk1T1FXK8ktgEFhHgKBPGQ6snFDceXslCHIeBJUhRlWZpsp6QU
	3v8cwyvRWI4jgv8ieL5A7d82xwDM8NYRtlWqyBTiAragOTV1qDwbtqVRBh/FyqWY+7
	gXOZSgJ2hXBy10iWMsRSnNdJBxLDVTpQCDfnqzBms1cfa3avd8FzUrDfV8LWtgacix
	YXFVjU2VDpdFHvuPzaQXqULkLsspVJ54uQD3pllHv2d3j1gz6Mvk3R94WBmmwr1zp1
	6Z2VF2Fu5e6MVbjNEjWLVCRSXBTiDvYsI6eHum0CI4sjRowWBBZRtUX/u+/NY3Extb
	rcC1iEkXVVaCYXzabKXZOURPTOqIBjIupxcyIXllkkQ3ze7HY04+gVi8Oo7sD0woii
	UsMC+F4yv9fEJ4lW+R/8Itq12hPUHt6CCXtWEFdjUyxFGdKyi0bpiGOxUDAM+O1ytn
	+omzj19nI1BhyDqfuiRGXKOeOkyzSAF/dQG4+lYxeTI+EUKjeBj0gdZAYeiRvW+Rod
	ou2UpSUnGyzI+vAVMBkKnbuk3T2zVffUZC+IBJMpzxCBLQFtLGdNX2WZ2SutS+ZEfl
	JgzIg3zew7rVoYXzTbIt8C7MHVOgE9N5EgLzQaMes3/0LG3+jknCt3x9MpqqQfUwcN
	7/3JFM/4lqYeIxdw0MLRdL6U=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:04:43 +0200
Message-Id: <20191118140443.5661-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] bind: Whitelist CVE-2019-6470
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2019 14:04:46 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
v2: better comment text
---
 meta/recipes-connectivity/bind/bind_9.11.5-P4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
index 3e2412dfa4..0897706346 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
@@ -37,6 +37,10 @@ UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
 UPSTREAM_CHECK_REGEX = "(?P<pver>9.(11|16|20|24|28)(\.\d+)+(-P\d+)*)/"
 
+# BIND >= 9.11.2 need dhcpd >= 4.4.0,
+# don't report it here since dhcpd is already recent enough.
+CVE_CHECK_WHITELIST += "CVE-2019-6470"
+
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_script
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/bind9-config ${PN}:${bindir}/isc-config.sh"
-- 
2.17.1


