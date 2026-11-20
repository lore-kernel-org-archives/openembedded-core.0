Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2609.1795166598792861901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 01:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=cclLj2ED;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1328017-202611200923194e8f6bd4120002074a-eusde3@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202611200923194e8f6bd4120002074a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Nov 2026 10:23:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=jYiqbiMkG73rbVg+DThYUjc1uGg1lPKqRzxJB1pT+LQ=;
 b=cclLj2EDY7Pr1mXw2R61+9uzKZm1rO2mQw13KqsDKKi27jwTwAmm9y7dLMgh04l/GquEhd
 qlCDCoc/m10ClkuY8Kf9BAW2QpMiYbLnn4sfhmyAihgBPjZlaQ+wdkNktIgIxjaW9/+Udmdj
 1Z3OoEpyWi14fPgojH7es7Te1kiQXm1s2fkBOyiGxl/DpuUgk7MpxUFChVfE+NuU91ojM2ul
 wHZ/3/529VxuRh8x8JTRYl3GwoRCbjydyz12RNsLTfFF0uM0N8lPvpGKa5HaxkWmykvUTZ5M
 MZ0f0vOLpnLOwIs1dWGScHUn9zRKNZH4gq+1xi7rD1R79F3wY6XQ0kuQ==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [scarthgap][PATCH 2/2] cve-exclusions: qualify global assessments by product
Date: Fri, 20 Nov 2026 10:23:09 +0100
Message-Id: <20261120092309.4056817-3-peter.tatrai.ext@siemens.com>
In-Reply-To: <20261120092309.4056817-1-peter.tatrai.ext@siemens.com>
References: <20261120092309.4056817-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 09:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250754
Content-Type: text/plain; charset="utf-8"

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

Apply Wrynose product scopes without changing Scarthgap's assessment set
or descriptions. Keep these exclusions out of reports for unrelated
recipes.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 .../distro/include/cve-extra-exclusions.inc   | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index fcef6a1..54bfac3 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -16,11 +16,11 @@
 #
 
 # strace https://nvd.nist.gov/vuln/detail/CVE-2000-0006
-CVE_STATUS[CVE-2000-0006] = "upstream-wontfix: CVE is more than 20 years old \
+CVE_STATUS[CVE-2000-0006] = "upstream-wontfix: cpe:*:strace: CVE is more than 20 years old \
 with no resolution evident. Broken links in CVE database references make resolution impractical."
 
 # epiphany https://nvd.nist.gov/vuln/detail/CVE-2005-0238
-CVE_STATUS[CVE-2005-0238] = "upstream-wontfix: \
+CVE_STATUS[CVE-2005-0238] = "upstream-wontfix: cpe:*:epiphany: \
 The issue here is spoofing of domain names using characters from other character sets. \
 There has been much discussion amongst the epiphany and webkit developers and \
 whilst there are improvements about how domains are handled and displayed to the user \
@@ -28,7 +28,7 @@ there is unlikely ever to be a single fix to webkit or epiphany which addresses
 problem. There isn't any mitigation or fix or way to progress this further."
 
 # glibc https://nvd.nist.gov/vuln/detail/CVE-2010-4756
-CVE_STATUS[CVE-2010-4756] = "upstream-wontfix: \
+CVE_STATUS[CVE-2010-4756] = "upstream-wontfix: cpe:*:glibc: \
 Issue is memory exhaustion via glob() calls, e.g. from within an ftp server \
 Best discussion in https://bugzilla.redhat.com/show_bug.cgi?id=681681 \
 Upstream don't see it as a security issue, ftp servers shouldn't be passing \
@@ -38,7 +38,7 @@ this to libc glob. Upstream have no plans to add BSD's GLOB_LIMIT or similar."
 # go https://nvd.nist.gov/vuln/detail/CVE-2020-29511
 CVE_STATUS_GROUPS += "CVE_STATUS_GO"
 CVE_STATUS_GO = "CVE-2020-29509 CVE-2020-29511"
-CVE_STATUS_GO[status] = "not-applicable-config: \
+CVE_STATUS_GO[status] = "not-applicable-config: cpe:golang:go: \
 The encoding/xml package in go can potentially be used for security exploits if not used correctly \
 CVE applies to a netapp product as well as flagging a general issue. We don't ship anything \
 exposing this interface in an exploitable way"
@@ -50,7 +50,7 @@ CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4
 CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
 CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
-CVE_STATUS_DB[status] = "upstream-wontfix: Since Oracle relicensed bdb, the open source community is slowly but surely \
+CVE_STATUS_DB[status] = "upstream-wontfix: cpe:*:berkeley_db: Since Oracle relicensed bdb, the open source community is slowly but surely \
 replacing bdb with supported and open source friendly alternatives. As a result this CVE is unlikely to ever be fixed."
 
 # Kernel CVEs that are generic but can't be added to the kernel's hand-maintained cve-exclusion.inc
@@ -60,25 +60,25 @@ replacing bdb with supported and open source friendly alternatives. As a result
 # For OE-Core our policy is to stay as close to the kernel stable releases as we can. This should
 # ensure the bulk of the major kernel CVEs are fixed and we don't dive into each individual issue
 # as the stable maintainers are much more able to do that.
-CVE_STATUS[CVE-1999-0524] = "ignored: issue is that ICMP exists, can be filewalled if required"
-CVE_STATUS[CVE-2008-4609] = "ignored: describes design flaws in TCP"
-CVE_STATUS[CVE-2010-4563] = "ignored: low impact, only enables detection of hosts which are sniffing network traffic"
-CVE_STATUS[CVE-2011-0640] = "ignored: requires physical access and any mitigation would mean USB is impractical to use"
+CVE_STATUS[CVE-1999-0524] = "ignored: cpe:*:linux_kernel: issue is that ICMP exists, can be filewalled if required"
+CVE_STATUS[CVE-2008-4609] = "ignored: cpe:*:linux_kernel: describes design flaws in TCP"
+CVE_STATUS[CVE-2010-4563] = "ignored: cpe:*:linux_kernel: low impact, only enables detection of hosts which are sniffing network traffic"
+CVE_STATUS[CVE-2011-0640] = "ignored: cpe:*:linux_kernel: requires physical access and any mitigation would mean USB is impractical to use"
 
 # qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2021-20255
-CVE_STATUS[CVE-2021-20255] = "upstream-wontfix: \
+CVE_STATUS[CVE-2021-20255] = "upstream-wontfix: cpe:*:qemu: \
 There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06098.html \
 qemu maintainers say the patch is incorrect and should not be applied \
 The issue is of low impact, at worst sitting in an infinite loop rather than exploitable."
 
 # qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2019-12067
-CVE_STATUS[CVE-2019-12067] = "upstream-wontfix: \
+CVE_STATUS[CVE-2019-12067] = "upstream-wontfix: cpe:*:qemu: \
 There was a proposed patch but rejected by upstream qemu. It is unclear if the issue can \
 still be reproduced or where exactly any bug is. \
 We'll pick up any fix when upstream accepts one."
 
 # nasm:nasm-native https://nvd.nist.gov/vuln/detail/CVE-2020-18974
-CVE_STATUS[CVE-2020-18974] = "upstream-wontfix: \
+CVE_STATUS[CVE-2020-18974] = "upstream-wontfix: cpe:*:netwide_assembler: \
 It is a fuzzing related buffer overflow. It is of low impact since most devices \
 wouldn't expose an assembler. The upstream is inactive and there is little to be \
 done about the bug, ignore from an OE perspective."
-- 
2.39.5

