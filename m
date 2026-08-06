Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3998CC55838
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 06:24:14 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13882.1785997453278226987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 23:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aZ/TapdG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=toOCO1D5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019fd5be6404-7c9e91da-7c97-4007-9132-06fd086deac0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785997452;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=GtvxkEudD+SqAJfJZzfgukmIPw4ddupfCljLWNMpwPE=;
	b=aZ/TapdGGg3T6fq+fCjJNNpkjURi6exwY5T8pbgCvvNDP0ZX9QSlkyU5VyXpQX+u
	x6dvZUKV4aYx8st81JRZrJTvhBDivlsSGVPApzzXaMZ/m057sfx8gjT9jt5aCAw7zYk
	BIZ36kcnr36sY/I/uS7iVv/FuRb+SRLPfCbJ1Br0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785997452;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=GtvxkEudD+SqAJfJZzfgukmIPw4ddupfCljLWNMpwPE=;
	b=toOCO1D5XgFIUPQ02DDBOVtz912sD6LGkXRP40YRYA0ZKNqvl4tg35Gr2z4yrrh5
	DvNAKKpmvqg3c3QrJ4Yc2ZkzNWsHQaUHMG11Azm/7ZKoBgWXrcZJVjWbTK6Fxg8Zmaq
	zSw85bPxfyk2r/I8a++QIwUrgOmcd3afGYw7aWK8=
Content-Type: multipart/mixed; boundary="===============8688095791726073829=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 10.5.0 SUCCEEDED
Message-ID: <0101019fd5be6404-7c9e91da-7c97-4007-9132-06fd086deac0-000000@us-west-2.amazonses.com>
Date: Thu, 6 Aug 2026 06:24:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.06-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 06:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242901

--===============8688095791726073829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dhcpcd* to *10.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.3.2-10.5.0.patch
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

-- >8 --
From 2d10a2ccb2f0f6ab1e04729aeb431ce50c337155 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 6 Aug 2026 05:28:57 +0000
Subject: [PATCH] dhcpcd: upgrade 10.3.2 -> 10.5.0

1d608519 pkgsrc gpg2 now installs as gpg
6f3dcb38 Fix a compile error for SMALL builds
78b9286f DHCP: deconfigure even when state is NULL or NONE
e3363cf4 control: remove unprivileged socket
8b312918 Build all the targets on macos
a7935e28 options: Introduce policy groups
59b32c80 privsep: Fix compile without INET
1f593762 dhcp: add configurable backoff parameters for DHCPv4 (#593)
b6588aa6 IPv4: uset old_ia when adding an address causes early removal
5733d3c5 DHCPv6: When deprecating addresses, restart on prefix deletions
2f00c7bf DHCPv6: Prefix exclude option can be 17 octets (#671)
708b4a56 IPv6ND: Free routeinfo when it expires (#670)
78ea09ed control: Avoid hangup in the recvdata path
7240d832 script: Fix buffer over and under flows in script_buftoenv
7891a22d capsicum: Avoid some overflow issues in privsep sysctl
a52bc9f6 IPv6: Fix numerous issues extending temporary address times
d28c9717 DHCP6: Fix configuring the suffix to delegated prefixes (#665)
2752331f vsio: Allow zero length options
b746a5bd eloop: Fix compile warning where UTIME_MAX is a calculation
12d2e981 workflows: limit to read only
22f39097 eloop: Improve timespecdiff
e1387b5c configure: Don't define _BSD_SOURCE for explicit_zero()
77a6d6fe ipv6: Only regen temp addrs with sufficent pltime
93e1a81f hooks: don't read past truncated ip6 address starting fe
764bb43a auth: Ensure remaining dlen matches hash digest length
cc05008e auth: clear keys with memset_explicit
99804fbe privsep: Check data is terminated when a string
1199f7fa ARP: Iterate over states safely as the cb could remove ours
e636ba2b DHCP: Sanitise messages from servers for output
26e4325d Fix CI build
69f10757 udev: Ensure we have a subsystem, action and ifname
7cc5caaa hooks: Quote assignment of compat vars correctly
4f426005 ARP: check we have enough to read the frame header
805fe4ac ND: Enforce require and reject policy
a92f79b0 DHCP6: Ensure IA_PD Prefix Length is valid
06f84e4a ND6: fix OOB reject mask for an undefined option
6e51c1e2 options: Fix userclass boundary
7efb4fe0 linux: Ensure NLA data boundaries are valid
393c3509 privsep: ps_root_readfile should return the real file size
e7d1013d timezone: disallow directory traversal
56fdb163 privsep: Simplify readerror
cfac52dc privsep: Remove PS_BUFLEN
ddc57fe8 script: Use correct buffer length variable (#641)
2d2d28e7 sun: Enable building for privsep
c64f7076 privsep: Don't open PF_INET socket for each ioctl
82bbc038 BPF: fix libpcap compile
74d818b5 DHCP6: guard against an interface delegated too disappearing
cd0864bf options: Remove some const to fix compile warnings
ecdac6bc privsep: guard setproctitle and only use compat on linux
da9a2457 privsep: avoid a compile warning on systems without setproctitle
4fc8cb8b DHCP: Don't add a trailing : on vendor if no machine arch
025e128e DHCP: Don't really expire the lease when testing
f64a7ad7 privsep: Add ps_root_gethostname
7143fc37 privsep: Always seed arc4random
5417ec90 if: if_init inits the interface from

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../{dhcpcd_10.3.2.bb => dhcpcd_10.5.0.bb}    |   6 +-
 ...mprove-the-sitation-of-working-with-.patch |  14 +-
 ...-conflict-error-when-enable-multilib.patch |   6 +-
 ...e-INCLUDEDIR-to-prevent-build-issues.patch |  10 +-
 .../dhcpcd/files/CVE-2026-56113.patch         |  92 ----------
 .../dhcpcd/files/CVE-2026-56114.patch         |  34 ----
 .../dhcpcd/files/CVE-2026-56116.patch         |  31 ----
 .../dhcpcd/files/CVE-2026-56117.patch         | 167 ------------------
 8 files changed, 16 insertions(+), 344 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.3.2.bb => dhcpcd_10.5.0.bb} (91%)
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.0.bb
similarity index 91%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.0.bb
index cc12b4a005..73f55969cd 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.0.bb
@@ -15,13 +15,9 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
-           file://CVE-2026-56113.patch \
-           file://CVE-2026-56114.patch \
-           file://CVE-2026-56116.patch \
-           file://CVE-2026-56117.patch \
            "
 
-SRCREV = "243ad84ac67a87d631ff7eb83b2eed2727acebb5"
+SRCREV = "1d608519abb398006b77f11c7b720147adf4cfcc"
 
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 7e04b5c303..04c1d92897 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From c91f9cdc0ef56fa64f6ffdd811cc5b0e41991b2e Mon Sep 17 00:00:00 2001
+From a3e397d3764fdb779e2f995b690ba365956612f5 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
@@ -27,10 +27,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 13 insertions(+), 4 deletions(-)
 
 diff --git a/hooks/20-resolv.conf b/hooks/20-resolv.conf
-index bd0b0df5..9c7721de 100644
+index 6aae9cc1..0fbcc9e8 100644
 --- a/hooks/20-resolv.conf
 +++ b/hooks/20-resolv.conf
-@@ -11,8 +11,12 @@ nocarrier_roaming_dir="$state_dir/roaming"
+@@ -14,8 +14,12 @@ nocarrier_roaming_dir="$state_dir/roaming"
  NL="
  "
  : ${resolvconf:=resolvconf}
@@ -43,9 +43,9 @@ index bd0b0df5..9c7721de 100644
  else
  	have_resolvconf=false
  fi
-@@ -69,8 +73,13 @@ build_resolv_conf()
+@@ -72,8 +76,13 @@ build_resolv_conf()
  	else
- 		echo "# /etc/resolv.conf.tail can replace this line" >> "$cf"
+ 		printf '%s\n' "# /etc/resolv.conf.tail can replace this line" >> "$cf"
  	fi
 -	if change_file /etc/resolv.conf "$cf"; then
 -		chmod 644 /etc/resolv.conf
@@ -59,7 +59,7 @@ index bd0b0df5..9c7721de 100644
  	fi
  	rm -f "$cf"
  }
-@@ -179,7 +188,7 @@ add_resolv_conf()
+@@ -182,7 +191,7 @@ add_resolv_conf()
  	for x in ${new_domain_name_servers}; do
  		conf="${conf}nameserver $x$NL"
  	done
@@ -68,7 +68,7 @@ index bd0b0df5..9c7721de 100644
  		[ -n "$ifmetric" ] && export IF_METRIC="$ifmetric"
  		printf %s "$conf" | "$resolvconf" -a "$ifname"
  		return $?
-@@ -195,7 +204,7 @@ add_resolv_conf()
+@@ -198,7 +207,7 @@ add_resolv_conf()
  
  remove_resolv_conf()
  {
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index 9d3065a48b..c2afb83b54 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From dd892eba0147120efdcae923746c444a9d2a76d2 Mon Sep 17 00:00:00 2001
+From d3e517be04e660d72233cde91b44c3cf705126e2 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -29,10 +29,10 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
-index ebbf06c0..c7ffee6b 100644
+index 26d37772..1b13dc4e 100644
 --- a/src/dhcpcd.8.in
 +++ b/src/dhcpcd.8.in
-@@ -826,7 +826,7 @@ Configuration file for dhcpcd.
+@@ -825,7 +825,7 @@ Configuration file for dhcpcd.
  If you always use the same options, put them here.
  .It Pa @SCRIPT@
  Bourne shell script that is run to configure or de-configure an interface.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index bebc79831d..69ebc6026f 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From 0775eb1b965bbf9b0efb0b1c42c3adf3d8cd31cb Mon Sep 17 00:00:00 2001
+From 278ef78e007ab74c701961e108262d9d733a3975 Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -11,10 +11,10 @@ Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
  1 file changed, 5 deletions(-)
 
 diff --git a/configure b/configure
-index e9c08f18..3f0770b7 100755
+index 32bf96ef..ab4aa901 100755
 --- a/configure
 +++ b/configure
-@@ -26,7 +26,6 @@ BUILD=
+@@ -29,7 +29,6 @@ BUILD=
  HOST=
  HOSTCC=
  TARGET=
@@ -22,7 +22,7 @@ index e9c08f18..3f0770b7 100755
  DEBUG=
  FORK=
  STATIC=
-@@ -89,7 +88,6 @@ for x do
+@@ -93,7 +92,6 @@ for x do
  	--mandir) MANDIR=$var;;
  	--datadir) DATADIR=$var;;
  	--with-ccopts|CFLAGS) CFLAGS=$var;;
@@ -30,7 +30,7 @@ index e9c08f18..3f0770b7 100755
  	CC) CC=$var;;
  	CPPFLAGS) CPPFLAGS=$var;;
  	PKG_CONFIG) PKG_CONFIG=$var;;
-@@ -346,9 +344,6 @@ if [ -n "$CPPFLAGS" ]; then
+@@ -356,9 +354,6 @@ if [ -n "$CPPFLAGS" ]; then
  	echo "CPPFLAGS=" >>$CONFIG_MK
  	echo "CPPFLAGS+=	$CPPFLAGS" >>$CONFIG_MK
  fi
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
deleted file mode 100644
index 14095685ed..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From f0e7f32646004a472f8322bcee4a38416f88a130 Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Tue, 23 Jun 2026 02:17:10 +0100
-Subject: [PATCH] DHCPv6: When deprecating addresses, restart on prefix
- deletions
-
-As that might invalidate the next address to iterate on.
-
-Reported-by: CuB3y0nd <root@cubeyond.net>
-
-(cherry picked from commit 5733d3c59a5651f64357ac11c98b4f39895c8d25)
-
-CVE: CVE-2026-56113
-Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/5733d3c59a5651f64357ac11c98b4f39895c8d25]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
----
- src/dhcp6.c | 21 ++++++++++++++++++---
- 1 file changed, 18 insertions(+), 3 deletions(-)
-
-diff --git a/src/dhcp6.c b/src/dhcp6.c
-index 91341994..8a8a20a0 100644
---- a/src/dhcp6.c
-+++ b/src/dhcp6.c
-@@ -2593,12 +2593,13 @@ dhcp6_findia(struct interface *ifp, struct dhcp6_message *m, size_t l,
- }
- 
- #ifndef SMALL
--static void
-+static bool
- dhcp6_deprecatedele(struct ipv6_addr *ia)
- {
- 	struct ipv6_addr *da, *dan, *dda;
- 	struct timespec now;
- 	struct dhcp6_state *state;
-+	bool freed = false;
- 
- 	timespecclear(&now);
- 	TAILQ_FOREACH_SAFE(da, &ia->pd_pfxs, pd_next, dan) {
-@@ -2624,11 +2625,14 @@ dhcp6_deprecatedele(struct ipv6_addr *ia)
- 			if (IN6_ARE_ADDR_EQUAL(&dda->addr, &da->addr))
- 				break;
- 		}
--		if (dda != NULL) {
-+		if (dda != ia && dda != NULL) {
- 			TAILQ_REMOVE(&state->addrs, dda, next);
- 			ipv6_freeaddr(dda);
-+			freed = true;
- 		}
- 	}
-+
-+	return freed;
- }
- #endif
- 
-@@ -2636,7 +2640,11 @@ static void
- dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
- {
- 	struct ipv6_addr *ia, *ian;
-+#ifndef SMALL
-+	bool again;
-+#endif
- 
-+again:
- 	TAILQ_FOREACH_SAFE(ia, addrs, next, ian) {
- 		if (ia->flags & IPV6_AF_EXTENDED)
- 			;
-@@ -2658,7 +2666,9 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
- 		/* If we delegated from this prefix, deprecate or remove
- 		 * the delegations. */
- 		if (ia->flags & IPV6_AF_PFXDELEGATION)
--			dhcp6_deprecatedele(ia);
-+			again = dhcp6_deprecatedele(ia);
-+		else
-+			again = false;
- #endif
- 
- 		if (ia->flags & IPV6_AF_REQUEST) {
-@@ -2671,6 +2681,11 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
- 		if (!(ia->flags & IPV6_AF_EXTENDED))
- 			ipv6_deleteaddr(ia);
- 		ipv6_freeaddr(ia);
-+#ifndef SMALL
-+		/* Deletion may invalidate the next pointer so restart */
-+		if (again)
-+			goto again;
-+#endif
- 	}
- }
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
deleted file mode 100644
index a6b8a44515..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2e27969699676e664898c8f82e2c047762fc426f Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Tue, 23 Jun 2026 02:06:55 +0100
-Subject: [PATCH] DHCPv6: Prefix exclude option can be 17 octets (#671)
-
-Well that's a simple off by one error
-
-Reported-by: CuB3y0nd <root@cubeyond.net>
-
-(cherry picked from commit 2f00c7bfc408b6582d331932dfa47829c4819029)
-
-CVE: CVE-2026-56114
-Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
----
- src/dhcp6.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/dhcp6.c b/src/dhcp6.c
-index 8a8a20a0..5e497cfd 100644
---- a/src/dhcp6.c
-+++ b/src/dhcp6.c
-@@ -1093,7 +1093,7 @@ dhcp6_makemessage(struct interface *ifp)
- 
- 				/* RFC6603 Section 4.2 */
- 				if (ap->prefix_exclude_len) {
--					uint8_t exb[16], *ep, u8;
-+					uint8_t exb[17], *ep, u8;
- 					const uint8_t *pp;
- 
- 					n = (size_t)((ap->prefix_exclude_len -
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
deleted file mode 100644
index 2d8345cf18..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ae33c2d8fc7319a2957acd6e8efad99116b68dc6 Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Tue, 23 Jun 2026 00:34:58 +0100
-Subject: [PATCH] IPv6ND: Free routeinfo when it expires (#670)
-
-Reported-by: CuB3y0nd <root@cubeyond.net>
-
-(cherry picked from commit 708b4a56bae080a5b18c2e0c4c6fbe103131a2b0)
-
-CVE: CVE-2026-56116
-Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/708b4a56bae080a5b18c2e0c4c6fbe103131a2b0]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
----
- src/ipv6nd.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ipv6nd.c b/src/ipv6nd.c
-index ccf71241..557ff50e 100644
---- a/src/ipv6nd.c
-+++ b/src/ipv6nd.c
-@@ -1789,6 +1789,7 @@ ipv6nd_expirera(void *arg)
- 				logwarnx("%s: expired route %s",
- 				    rap->iface->name, rinfo->sprefix);
- 				TAILQ_REMOVE(&rap->rinfos, rinfo, next);
-+				free(rinfo);
- 			}
- 		}
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
deleted file mode 100644
index 6ef86204f2..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From b7bf047e30217e144235a6b00d4c81afbcc5d6ab Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Mon, 22 Jun 2026 23:41:53 +0100
-Subject: [PATCH] control: Avoid hangup in the recvdata path
-
-Instead return an error and bubble it up where it can be
-hangup / freed more cleanly.
-
-Reported-by: CuB3y0nd <root@cubeyond.net>
-
-(cherry picked from commit 78ea09ed1633a583dbcde6e7bab9df4639ec8a34)
-
-CVE: CVE-2026-56117
-Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/78ea09ed1633a583dbcde6e7bab9df4639ec8a34]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
----
- src/control.c         | 47 ++++++++++++++++++++++++-------------------
- src/control.h         |  2 +-
- src/privsep-control.c |  7 ++++++-
- 3 files changed, 33 insertions(+), 23 deletions(-)
-
-diff --git a/src/control.c b/src/control.c
-index ec1c633c..e6115f66 100644
---- a/src/control.c
-+++ b/src/control.c
-@@ -115,10 +115,8 @@ control_handle_read(struct fd_list *fd)
- 	bytes = read(fd->fd, buffer, sizeof(buffer) - 1);
- 	if (bytes == -1)
- 		logerr(__func__);
--	if (bytes == -1 || bytes == 0) {
--		control_hangup(fd);
--		return -1;
--	}
-+	if (bytes == -1 || bytes == 0)
-+		return (int)bytes;
- 
- #ifdef PRIVSEP
- 	if (IN_PRIVSEP(fd->ctx)) {
-@@ -134,15 +132,13 @@ control_handle_read(struct fd_list *fd)
- 		if (err == 1 &&
- 		    ps_ctl_sendargs(fd, buffer, (size_t)bytes) == -1) {
- 			logerr(__func__);
--			control_free(fd);
- 			return -1;
- 		}
--		return 0;
-+		return 1;
- 	}
- #endif
- 
--	control_recvdata(fd, buffer, (size_t)bytes);
--	return 0;
-+	return control_recvdata(fd, buffer, (size_t)bytes);
- }
- 
- static int
-@@ -205,23 +201,31 @@ static void
- control_handle_data(void *arg, unsigned short events)
- {
- 	struct fd_list *fd = arg;
-+	int err;
- 
- 	if (!(events & (ELE_READ | ELE_WRITE | ELE_HANGUP)))
- 		logerrx("%s: unexpected event 0x%04x", __func__, events);
- 
- 	if (events & ELE_WRITE && !(events & ELE_HANGUP)) {
--		if (control_handle_write(fd) == -1)
--			return;
-+		err = control_handle_write(fd);
-+		if (err == -1)
-+			goto hangup;
- 	}
- 	if (events & ELE_READ) {
--		if (control_handle_read(fd) == -1)
--			return;
-+		err = control_handle_read(fd);
-+		if (err == -1 || err == 0)
-+			goto hangup;
- 	}
- 	if (events & ELE_HANGUP)
--		control_hangup(fd);
-+		goto hangup;
-+
-+	return;
-+
-+hangup:
-+	control_hangup(fd);
- }
- 
--void
-+int
- control_recvdata(struct fd_list *fd, char *data, size_t len)
- {
- 	char *p = data, *e;
-@@ -243,12 +247,13 @@ control_recvdata(struct fd_list *fd, char *data, size_t len)
- 			if (e == NULL) {
- 				errno = EINVAL;
- 				logerrx("%s: no terminator", __func__);
--				return;
-+				return -1;
- 			}
--			if ((size_t)argc >= sizeof(argvp) / sizeof(argvp[0])) {
-+			if ((size_t)argc + 1 >=
-+			    sizeof(argvp) / sizeof(argvp[0])) {
- 				errno = ENOBUFS;
- 				logerrx("%s: no arg buffer", __func__);
--				return;
-+				return -1;
- 			}
- 			*ap++ = p;
- 			argc++;
-@@ -268,12 +273,12 @@ control_recvdata(struct fd_list *fd, char *data, size_t len)
- 		*ap = NULL;
- 		if (dhcpcd_handleargs(fd->ctx, fd, argc, argvp) == -1) {
- 			logerr(__func__);
--			if (errno != EINTR && errno != EAGAIN) {
--				control_free(fd);
--				return;
--			}
-+			if (errno != EINTR && errno != EAGAIN)
-+				return -1;
- 		}
- 	}
-+
-+	return 1;
- }
- 
- struct fd_list *
-diff --git a/src/control.h b/src/control.h
-index ef592268..1f09fc8f 100644
---- a/src/control.h
-+++ b/src/control.h
-@@ -76,5 +76,5 @@ struct fd_list *control_new(struct dhcpcd_ctx *, int, unsigned int);
- void control_free(struct fd_list *);
- void control_delete(struct fd_list *);
- int control_queue(struct fd_list *, void *, size_t);
--void control_recvdata(struct fd_list *fd, char *, size_t);
-+int control_recvdata(struct fd_list *fd, char *, size_t);
- #endif
-diff --git a/src/privsep-control.c b/src/privsep-control.c
-index b9ea7f9c..3cdeedea 100644
---- a/src/privsep-control.c
-+++ b/src/privsep-control.c
-@@ -110,6 +110,7 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, struct msghdr *msg)
- 	struct iovec *iov = msg->msg_iov;
- 	struct fd_list *fd;
- 	unsigned int fd_flags = FD_SENDLEN;
-+	int err;
- 
- 	switch (psm->ps_flags) {
- 	case PS_CTL_PRIV:
-@@ -133,7 +134,11 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, struct msghdr *msg)
- 		if (fd == NULL)
- 			return -1;
- 		ctx->ps_control_client = fd;
--		control_recvdata(fd, iov->iov_base, iov->iov_len);
-+		err = control_recvdata(fd, iov->iov_base, iov->iov_len);
-+		if (err == -1 || err == 0) {
-+			control_free(fd);
-+			ctx->ps_control_client = NULL;
-+		}
- 		break;
- 	case PS_CTL_EOF:
- 		ctx->ps_control_client = NULL;
--- 
-2.43.0
-
-- 
2.47.1


--===============8688095791726073829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="dhcpcd-changelog.txt"

Changelog for dhcpcd: 10.3.2 -> 10.5.0

1d608519 pkgsrc gpg2 now installs as gpg
6f3dcb38 Fix a compile error for SMALL builds
78b9286f DHCP: deconfigure even when state is NULL or NONE
e3363cf4 control: remove unprivileged socket
8b312918 Build all the targets on macos
a7935e28 options: Introduce policy groups
59b32c80 privsep: Fix compile without INET
1f593762 dhcp: add configurable backoff parameters for DHCPv4 (#593)
b6588aa6 IPv4: uset old_ia when adding an address causes early removal
5733d3c5 DHCPv6: When deprecating addresses, restart on prefix deletions
2f00c7bf DHCPv6: Prefix exclude option can be 17 octets (#671)
708b4a56 IPv6ND: Free routeinfo when it expires (#670)
78ea09ed control: Avoid hangup in the recvdata path
7240d832 script: Fix buffer over and under flows in script_buftoenv
7891a22d capsicum: Avoid some overflow issues in privsep sysctl
a52bc9f6 IPv6: Fix numerous issues extending temporary address times
d28c9717 DHCP6: Fix configuring the suffix to delegated prefixes (#665)
2752331f vsio: Allow zero length options
b746a5bd eloop: Fix compile warning where UTIME_MAX is a calculation
12d2e981 workflows: limit to read only
22f39097 eloop: Improve timespecdiff
e1387b5c configure: Don't define _BSD_SOURCE for explicit_zero()
77a6d6fe ipv6: Only regen temp addrs with sufficent pltime
93e1a81f hooks: don't read past truncated ip6 address starting fe
764bb43a auth: Ensure remaining dlen matches hash digest length
cc05008e auth: clear keys with memset_explicit
99804fbe privsep: Check data is terminated when a string
1199f7fa ARP: Iterate over states safely as the cb could remove ours
e636ba2b DHCP: Sanitise messages from servers for output
26e4325d Fix CI build
69f10757 udev: Ensure we have a subsystem, action and ifname
7cc5caaa hooks: Quote assignment of compat vars correctly
4f426005 ARP: check we have enough to read the frame header
805fe4ac ND: Enforce require and reject policy
a92f79b0 DHCP6: Ensure IA_PD Prefix Length is valid
06f84e4a ND6: fix OOB reject mask for an undefined option
6e51c1e2 options: Fix userclass boundary
7efb4fe0 linux: Ensure NLA data boundaries are valid
393c3509 privsep: ps_root_readfile should return the real file size
e7d1013d timezone: disallow directory traversal
56fdb163 privsep: Simplify readerror
cfac52dc privsep: Remove PS_BUFLEN
ddc57fe8 script: Use correct buffer length variable (#641)
2d2d28e7 sun: Enable building for privsep
c64f7076 privsep: Don't open PF_INET socket for each ioctl
82bbc038 BPF: fix libpcap compile
74d818b5 DHCP6: guard against an interface delegated too disappearing
cd0864bf options: Remove some const to fix compile warnings
ecdac6bc privsep: guard setproctitle and only use compat on linux
da9a2457 privsep: avoid a compile warning on systems without setproctitle
4fc8cb8b DHCP: Don't add a trailing : on vendor if no machine arch
025e128e DHCP: Don't really expire the lease when testing
f64a7ad7 privsep: Add ps_root_gethostname
7143fc37 privsep: Always seed arc4random
5417ec90 if: if_init inits the interface from the kernel
90664561 privsep: Test defines for all ioctls
840f56dc route: Use HAVE_RT_MISSFILTER rather than a generic BSD define
a0bd514f time.h always pulls in struct timespec
337720de script: add ifxname as the escaped string
fa4de4f8 privsep: smaller buffer size without INET6
75f164c4 dhcp-common: Escape ifname for lease file
201fd4cc privsep: Don't abort if we don't need a fdwaiter
d610eb1e dhcpcd: Don't add a link_fd if we don't have one.
7cb7fe53 route: Rework rt structure so sockaddrs are pointers (#621)
4bbe25e2 compat: Add support for getprogname(3)
082d1f2c script: Don't assume AF_PACKET of if not AF_LINK
db3abc18 BPF: Improve headers
f70106a8 eloop: mark eloop as UNUSED for waitfd and ppoll
2d3c7315 Adapt codebase for new pidfile
c25c098d pidfile: Import latest from NetBSD
15ff549a eloop: set errno = EBADF rather than calling close if waitfd == -1
20ec0df6 Darwin: Add initial support for macOS (#613)
162e68b9 eloop: fix USE_PPOLL define
62018896 privsep: Adapt to new eloop_waitfd()
6b8d4e11 eloop: Add eloop_openfdwaiter() and eloop_closefdwaiter()
61b64b96 DHCP6: Delete the eloop event before closing an ia listener socket
97595a0f eloop: always remove event from list on delete
9a298fd9 Merge pull request #610 from NetworkConfiguration/esc_ifname
3836b16c hooks: Escape interface names and use printf
0a523884 Merge pull request #607 from NetworkConfiguration/bpf
31500c92 BPF: Correct libpcap warning
8be31c09 BPF: Add a DLPI interface
d5c735f7 BPF: Test for pcap_set_immediate_mode()
860563a8 BPF: harden libpcap on BSD
9b20807b BPF: Use pcap_setwritefilter() and pcap_lockfilter()
2f22f3af BPF: Address review comments
6ae07424 BPF: Add support for libpcap
79a49d0a BPF: Fixup comment to indicate this could be used outside of dhcpcd
542c426f BPF: Simplify by splitting OS specifics into own files
e91fd575 privsep: Change IPC to use SOCK_STREAM (#604)
a4b78bfd format: Ensure <netinet/icmp6.h> comes before <netinet/in.h>
676846fe eloop: Bring in updated from dhcpsd
52faca15 Format code with clang-format v19 (#601)
5524da4c Add missing SPDX-License tags (#591)

--===============8688095791726073829==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.3.2-10.5.0.patch"

RnJvbSAyZDEwYTJjY2IyZjBmNmFiMWUwNDcyOWFlYjQzMWNlNTBjMzM3MTU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNiBBdWcgMjAyNiAwNToyODo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRo
Y3BjZDogdXBncmFkZSAxMC4zLjIgLT4gMTAuNS4wCgoxZDYwODUxOSBwa2dzcmMgZ3BnMiBub3cg
aW5zdGFsbHMgYXMgZ3BnCjZmM2RjYjM4IEZpeCBhIGNvbXBpbGUgZXJyb3IgZm9yIFNNQUxMIGJ1
aWxkcwo3OGI5Mjg2ZiBESENQOiBkZWNvbmZpZ3VyZSBldmVuIHdoZW4gc3RhdGUgaXMgTlVMTCBv
ciBOT05FCmUzMzYzY2Y0IGNvbnRyb2w6IHJlbW92ZSB1bnByaXZpbGVnZWQgc29ja2V0CjhiMzEy
OTE4IEJ1aWxkIGFsbCB0aGUgdGFyZ2V0cyBvbiBtYWNvcwphNzkzNWUyOCBvcHRpb25zOiBJbnRy
b2R1Y2UgcG9saWN5IGdyb3Vwcwo1OWIzMmM4MCBwcml2c2VwOiBGaXggY29tcGlsZSB3aXRob3V0
IElORVQKMWY1OTM3NjIgZGhjcDogYWRkIGNvbmZpZ3VyYWJsZSBiYWNrb2ZmIHBhcmFtZXRlcnMg
Zm9yIERIQ1B2NCAoIzU5MykKYjY1ODhhYTYgSVB2NDogdXNldCBvbGRfaWEgd2hlbiBhZGRpbmcg
YW4gYWRkcmVzcyBjYXVzZXMgZWFybHkgcmVtb3ZhbAo1NzMzZDNjNSBESENQdjY6IFdoZW4gZGVw
cmVjYXRpbmcgYWRkcmVzc2VzLCByZXN0YXJ0IG9uIHByZWZpeCBkZWxldGlvbnMKMmYwMGM3YmYg
REhDUHY2OiBQcmVmaXggZXhjbHVkZSBvcHRpb24gY2FuIGJlIDE3IG9jdGV0cyAoIzY3MSkKNzA4
YjRhNTYgSVB2Nk5EOiBGcmVlIHJvdXRlaW5mbyB3aGVuIGl0IGV4cGlyZXMgKCM2NzApCjc4ZWEw
OWVkIGNvbnRyb2w6IEF2b2lkIGhhbmd1cCBpbiB0aGUgcmVjdmRhdGEgcGF0aAo3MjQwZDgzMiBz
Y3JpcHQ6IEZpeCBidWZmZXIgb3ZlciBhbmQgdW5kZXIgZmxvd3MgaW4gc2NyaXB0X2J1ZnRvZW52
Cjc4OTFhMjJkIGNhcHNpY3VtOiBBdm9pZCBzb21lIG92ZXJmbG93IGlzc3VlcyBpbiBwcml2c2Vw
IHN5c2N0bAphNTJiYzlmNiBJUHY2OiBGaXggbnVtZXJvdXMgaXNzdWVzIGV4dGVuZGluZyB0ZW1w
b3JhcnkgYWRkcmVzcyB0aW1lcwpkMjhjOTcxNyBESENQNjogRml4IGNvbmZpZ3VyaW5nIHRoZSBz
dWZmaXggdG8gZGVsZWdhdGVkIHByZWZpeGVzICgjNjY1KQoyNzUyMzMxZiB2c2lvOiBBbGxvdyB6
ZXJvIGxlbmd0aCBvcHRpb25zCmI3NDZhNWJkIGVsb29wOiBGaXggY29tcGlsZSB3YXJuaW5nIHdo
ZXJlIFVUSU1FX01BWCBpcyBhIGNhbGN1bGF0aW9uCjEyZDJlOTgxIHdvcmtmbG93czogbGltaXQg
dG8gcmVhZCBvbmx5CjIyZjM5MDk3IGVsb29wOiBJbXByb3ZlIHRpbWVzcGVjZGlmZgplMTM4N2I1
YyBjb25maWd1cmU6IERvbid0IGRlZmluZSBfQlNEX1NPVVJDRSBmb3IgZXhwbGljaXRfemVybygp
Cjc3YTZkNmZlIGlwdjY6IE9ubHkgcmVnZW4gdGVtcCBhZGRycyB3aXRoIHN1ZmZpY2VudCBwbHRp
bWUKOTNlMWE4MWYgaG9va3M6IGRvbid0IHJlYWQgcGFzdCB0cnVuY2F0ZWQgaXA2IGFkZHJlc3Mg
c3RhcnRpbmcgZmUKNzY0YmI0M2EgYXV0aDogRW5zdXJlIHJlbWFpbmluZyBkbGVuIG1hdGNoZXMg
aGFzaCBkaWdlc3QgbGVuZ3RoCmNjMDUwMDhlIGF1dGg6IGNsZWFyIGtleXMgd2l0aCBtZW1zZXRf
ZXhwbGljaXQKOTk4MDRmYmUgcHJpdnNlcDogQ2hlY2sgZGF0YSBpcyB0ZXJtaW5hdGVkIHdoZW4g
YSBzdHJpbmcKMTE5OWY3ZmEgQVJQOiBJdGVyYXRlIG92ZXIgc3RhdGVzIHNhZmVseSBhcyB0aGUg
Y2IgY291bGQgcmVtb3ZlIG91cnMKZTYzNmJhMmIgREhDUDogU2FuaXRpc2UgbWVzc2FnZXMgZnJv
bSBzZXJ2ZXJzIGZvciBvdXRwdXQKMjZlNDMyNWQgRml4IENJIGJ1aWxkCjY5ZjEwNzU3IHVkZXY6
IEVuc3VyZSB3ZSBoYXZlIGEgc3Vic3lzdGVtLCBhY3Rpb24gYW5kIGlmbmFtZQo3Y2M1Y2FhYSBo
b29rczogUXVvdGUgYXNzaWdubWVudCBvZiBjb21wYXQgdmFycyBjb3JyZWN0bHkKNGY0MjYwMDUg
QVJQOiBjaGVjayB3ZSBoYXZlIGVub3VnaCB0byByZWFkIHRoZSBmcmFtZSBoZWFkZXIKODA1ZmU0
YWMgTkQ6IEVuZm9yY2UgcmVxdWlyZSBhbmQgcmVqZWN0IHBvbGljeQphOTJmNzliMCBESENQNjog
RW5zdXJlIElBX1BEIFByZWZpeCBMZW5ndGggaXMgdmFsaWQKMDZmODRlNGEgTkQ2OiBmaXggT09C
IHJlamVjdCBtYXNrIGZvciBhbiB1bmRlZmluZWQgb3B0aW9uCjZlNTFjMWUyIG9wdGlvbnM6IEZp
eCB1c2VyY2xhc3MgYm91bmRhcnkKN2VmYjRmZTAgbGludXg6IEVuc3VyZSBOTEEgZGF0YSBib3Vu
ZGFyaWVzIGFyZSB2YWxpZAozOTNjMzUwOSBwcml2c2VwOiBwc19yb290X3JlYWRmaWxlIHNob3Vs
ZCByZXR1cm4gdGhlIHJlYWwgZmlsZSBzaXplCmU3ZDEwMTNkIHRpbWV6b25lOiBkaXNhbGxvdyBk
aXJlY3RvcnkgdHJhdmVyc2FsCjU2ZmRiMTYzIHByaXZzZXA6IFNpbXBsaWZ5IHJlYWRlcnJvcgpj
ZmFjNTJkYyBwcml2c2VwOiBSZW1vdmUgUFNfQlVGTEVOCmRkYzU3ZmU4IHNjcmlwdDogVXNlIGNv
cnJlY3QgYnVmZmVyIGxlbmd0aCB2YXJpYWJsZSAoIzY0MSkKMmQyZDI4ZTcgc3VuOiBFbmFibGUg
YnVpbGRpbmcgZm9yIHByaXZzZXAKYzY0ZjcwNzYgcHJpdnNlcDogRG9uJ3Qgb3BlbiBQRl9JTkVU
IHNvY2tldCBmb3IgZWFjaCBpb2N0bAo4MmJiYzAzOCBCUEY6IGZpeCBsaWJwY2FwIGNvbXBpbGUK
NzRkODE4YjUgREhDUDY6IGd1YXJkIGFnYWluc3QgYW4gaW50ZXJmYWNlIGRlbGVnYXRlZCB0b28g
ZGlzYXBwZWFyaW5nCmNkMDg2NGJmIG9wdGlvbnM6IFJlbW92ZSBzb21lIGNvbnN0IHRvIGZpeCBj
b21waWxlIHdhcm5pbmdzCmVjZGFjNmJjIHByaXZzZXA6IGd1YXJkIHNldHByb2N0aXRsZSBhbmQg
b25seSB1c2UgY29tcGF0IG9uIGxpbnV4CmRhOWEyNDU3IHByaXZzZXA6IGF2b2lkIGEgY29tcGls
ZSB3YXJuaW5nIG9uIHN5c3RlbXMgd2l0aG91dCBzZXRwcm9jdGl0bGUKNGZjOGNiOGIgREhDUDog
RG9uJ3QgYWRkIGEgdHJhaWxpbmcgOiBvbiB2ZW5kb3IgaWYgbm8gbWFjaGluZSBhcmNoCjAyNWUx
MjhlIERIQ1A6IERvbid0IHJlYWxseSBleHBpcmUgdGhlIGxlYXNlIHdoZW4gdGVzdGluZwpmNjRh
N2FkNyBwcml2c2VwOiBBZGQgcHNfcm9vdF9nZXRob3N0bmFtZQo3MTQzZmMzNyBwcml2c2VwOiBB
bHdheXMgc2VlZCBhcmM0cmFuZG9tCjU0MTdlYzkwIGlmOiBpZl9pbml0IGluaXRzIHRoZSBpbnRl
cmZhY2UgZnJvbQoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJh
Y3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0
byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi97ZGhjcGNkXzEwLjMuMi5iYiA9PiBkaGNwY2RfMTAu
NS4wLmJifSAgICB8ICAgNiArLQogLi4ubXByb3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdp
dGgtLnBhdGNoIHwgIDE0ICstCiAuLi4tY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGls
aWIucGF0Y2ggfCAgIDYgKy0KIC4uLmUtSU5DTFVERURJUi10by1wcmV2ZW50LWJ1aWxkLWlzc3Vl
cy5wYXRjaCB8ICAxMCArLQogLi4uL2RoY3BjZC9maWxlcy9DVkUtMjAyNi01NjExMy5wYXRjaCAg
ICAgICAgIHwgIDkyIC0tLS0tLS0tLS0KIC4uLi9kaGNwY2QvZmlsZXMvQ1ZFLTIwMjYtNTYxMTQu
cGF0Y2ggICAgICAgICB8ICAzNCAtLS0tCiAuLi4vZGhjcGNkL2ZpbGVzL0NWRS0yMDI2LTU2MTE2
LnBhdGNoICAgICAgICAgfCAgMzEgLS0tLQogLi4uL2RoY3BjZC9maWxlcy9DVkUtMjAyNi01NjEx
Ny5wYXRjaCAgICAgICAgIHwgMTY3IC0tLS0tLS0tLS0tLS0tLS0tLQogOCBmaWxlcyBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCAzNDQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9kaGNwY2Qve2RoY3BjZF8xMC4zLjIuYmIgPT4gZGhjcGNkXzEwLjUuMC5i
Yn0gKDkxJSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Ro
Y3BjZC9maWxlcy9DVkUtMjAyNi01NjExMy5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzL0NWRS0yMDI2LTU2MTE0LnBhdGNoCiBk
ZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMv
Q1ZFLTIwMjYtNTYxMTYucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2RoY3BjZC9maWxlcy9DVkUtMjAyNi01NjExNy5wYXRjaAoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8xMC4zLjIuYmIgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuNS4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2Ro
Y3BjZF8xMC4zLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNk
L2RoY3BjZF8xMC41LjAuYmIKaW5kZXggY2MxMmI0YTAwNS4uNzNmNTU5NjljZCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjMuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuNS4wLmJiCkBAIC0x
NSwxMyArMTUsOSBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vTmV0d29ya0NvbmZpZ3Vy
YXRpb24vZGhjcGNkO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYQogICAgICAgICAgICBmaWxlOi8v
ZGhjcGNkLnNlcnZpY2UgXAogICAgICAgICAgICBmaWxlOi8vZGhjcGNkQC5zZXJ2aWNlIFwKICAg
ICAgICAgICAgZmlsZTovLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4tZW5h
YmxlLW11bHRpbGliLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL0NWRS0yMDI2LTU2MTEzLnBh
dGNoIFwKLSAgICAgICAgICAgZmlsZTovL0NWRS0yMDI2LTU2MTE0LnBhdGNoIFwKLSAgICAgICAg
ICAgZmlsZTovL0NWRS0yMDI2LTU2MTE2LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL0NWRS0y
MDI2LTU2MTE3LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAiMjQzYWQ4NGFjNjdh
ODdkNjMxZmY3ZWI4M2IyZWVkMjcyN2FjZWJiNSIKK1NSQ1JFViA9ICIxZDYwODUxOWFiYjM5ODAw
NmI3N2YxMWM3YjcyMDE0N2FkZjRjZmNjIgogCiAjIERvZXNuJ3QgdXNlIGF1dG9tYWtlIHNvIHdl
IGNhbid0IGRvIG91dC1vZi10cmVlIGJ1aWxkcwogaW5oZXJpdCBwa2djb25maWcgYXV0b3Rvb2xz
LWJyb2tlbnNlcCBzeXN0ZW1kIHVzZXJhZGQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0
YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
ZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Yt
d29ya2luZy13aXRoLS5wYXRjaAppbmRleCA3ZTA0YjVjMzAzLi4wNGMxZDkyODk3IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLTIwLXJlc29s
di5jb25mLWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmctd2l0aC0ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29u
Zi1pbXByb3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBjOTFmOWNkYzBlZjU2ZmE2NGY2ZmZkZDgxMWNjNWIwZTQxOTkxYjJlIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhM2UzOTdkMzc2NGZkYjc3OWUyZjk5NWI2OTBiYTM2
NTk1NjYxMmY1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hl
bkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCA5IE5vdiAyMDIyIDE2OjMzOjE4ICswODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIDIwLXJlc29sdi5jb25mOiBpbXByb3ZlIHRoZSBzaXRhdGlvbiBvZiB3
b3JraW5nIHdpdGggc3lzdGVtZApAQCAtMjcsMTAgKzI3LDEwIEBAIFNpZ25lZC1vZmYtYnk6IENo
ZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2hvb2tzLzIwLXJlc29sdi5j
b25mIGIvaG9va3MvMjAtcmVzb2x2LmNvbmYKLWluZGV4IGJkMGIwZGY1Li45Yzc3MjFkZSAxMDA2
NDQKK2luZGV4IDZhYWU5Y2MxLi4wZmJjYzllOCAxMDA2NDQKIC0tLSBhL2hvb2tzLzIwLXJlc29s
di5jb25mCiArKysgYi9ob29rcy8yMC1yZXNvbHYuY29uZgotQEAgLTExLDggKzExLDEyIEBAIG5v
Y2Fycmllcl9yb2FtaW5nX2Rpcj0iJHN0YXRlX2Rpci9yb2FtaW5nIgorQEAgLTE0LDggKzE0LDEy
IEBAIG5vY2Fycmllcl9yb2FtaW5nX2Rpcj0iJHN0YXRlX2Rpci9yb2FtaW5nIgogIE5MPSIKICAi
CiAgOiAke3Jlc29sdmNvbmY6PXJlc29sdmNvbmZ9CkBAIC00Myw5ICs0Myw5IEBAIGluZGV4IGJk
MGIwZGY1Li45Yzc3MjFkZSAxMDA2NDQKICBlbHNlCiAgCWhhdmVfcmVzb2x2Y29uZj1mYWxzZQog
IGZpCi1AQCAtNjksOCArNzMsMTMgQEAgYnVpbGRfcmVzb2x2X2NvbmYoKQorQEAgLTcyLDggKzc2
LDEzIEBAIGJ1aWxkX3Jlc29sdl9jb25mKCkKICAJZWxzZQotIAkJZWNobyAiIyAvZXRjL3Jlc29s
di5jb25mLnRhaWwgY2FuIHJlcGxhY2UgdGhpcyBsaW5lIiA+PiAiJGNmIgorIAkJcHJpbnRmICcl
c1xuJyAiIyAvZXRjL3Jlc29sdi5jb25mLnRhaWwgY2FuIHJlcGxhY2UgdGhpcyBsaW5lIiA+PiAi
JGNmIgogIAlmaQogLQlpZiBjaGFuZ2VfZmlsZSAvZXRjL3Jlc29sdi5jb25mICIkY2YiOyB0aGVu
CiAtCQljaG1vZCA2NDQgL2V0Yy9yZXNvbHYuY29uZgpAQCAtNTksNyArNTksNyBAQCBpbmRleCBi
ZDBiMGRmNS4uOWM3NzIxZGUgMTAwNjQ0CiAgCWZpCiAgCXJtIC1mICIkY2YiCiAgfQotQEAgLTE3
OSw3ICsxODgsNyBAQCBhZGRfcmVzb2x2X2NvbmYoKQorQEAgLTE4Miw3ICsxOTEsNyBAQCBhZGRf
cmVzb2x2X2NvbmYoKQogIAlmb3IgeCBpbiAke25ld19kb21haW5fbmFtZV9zZXJ2ZXJzfTsgZG8K
ICAJCWNvbmY9IiR7Y29uZn1uYW1lc2VydmVyICR4JE5MIgogIAlkb25lCkBAIC02OCw3ICs2OCw3
IEBAIGluZGV4IGJkMGIwZGY1Li45Yzc3MjFkZSAxMDA2NDQKICAJCVsgLW4gIiRpZm1ldHJpYyIg
XSAmJiBleHBvcnQgSUZfTUVUUklDPSIkaWZtZXRyaWMiCiAgCQlwcmludGYgJXMgIiRjb25mIiB8
ICIkcmVzb2x2Y29uZiIgLWEgIiRpZm5hbWUiCiAgCQlyZXR1cm4gJD8KLUBAIC0xOTUsNyArMjA0
LDcgQEAgYWRkX3Jlc29sdl9jb25mKCkKK0BAIC0xOTgsNyArMjA3LDcgQEAgYWRkX3Jlc29sdl9j
b25mKCkKICAKICByZW1vdmVfcmVzb2x2X2NvbmYoKQogIHsKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0
LWVycm9yLXdoZW4tZW5hYmxlLW11bHRpbGliLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1l
bmFibGUtbXVsdGlsaWIucGF0Y2gKaW5kZXggOWQzMDY1YTQ4Yi4uYzJhZmI4M2I1NCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2Qu
OC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1kaGNwY2QuOC1GaXgtY29u
ZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUtbXVsdGlsaWIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGRkODkyZWJhMDE0NzEyMGVmZGNhZTkyMzc0NmM0NDRhOWQyYTc2ZDIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGQzZTUxN2JlMDRlNjYwZDcyMjMzY2RlOTFiNDRjM2NmNzA1MTI2
ZTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMZWkgTWFvaHVpIDxsZWltYW9odWlA
ZnVqaXRzdS5jb20+CiBEYXRlOiBGcmksIDEwIE1hciAyMDIzIDAzOjQ4OjQ2ICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGRoY3BjZC44OiBGaXggY29uZmxpY3QgZXJyb3Igd2hlbiBlbmFibGUgbXVs
dGlsaWIuCkBAIC0yOSwxMCArMjksMTAgQEAgU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVp
bWFvaHVpQGZ1aml0c3UuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2RoY3BjZC44LmluIGIvc3JjL2RoY3BjZC44
LmluCi1pbmRleCBlYmJmMDZjMC4uYzdmZmVlNmIgMTAwNjQ0CitpbmRleCAyNmQzNzc3Mi4uMWIx
M2RjNGUgMTAwNjQ0CiAtLS0gYS9zcmMvZGhjcGNkLjguaW4KICsrKyBiL3NyYy9kaGNwY2QuOC5p
bgotQEAgLTgyNiw3ICs4MjYsNyBAQCBDb25maWd1cmF0aW9uIGZpbGUgZm9yIGRoY3BjZC4KK0BA
IC04MjUsNyArODI1LDcgQEAgQ29uZmlndXJhdGlvbiBmaWxlIGZvciBkaGNwY2QuCiAgSWYgeW91
IGFsd2F5cyB1c2UgdGhlIHNhbWUgb3B0aW9ucywgcHV0IHRoZW0gaGVyZS4KICAuSXQgUGEgQFND
UklQVEAKICBCb3VybmUgc2hlbGwgc2NyaXB0IHRoYXQgaXMgcnVuIHRvIGNvbmZpZ3VyZSBvciBk
ZS1jb25maWd1cmUgYW4gaW50ZXJmYWNlLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1wcmV2ZW50LWJ1
aWxkLWlzc3Vlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVz
LzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVudC1idWlsZC1pc3N1ZXMucGF0Y2gKaW5k
ZXggYmViYzc5ODMxZC4uNjllYmM2MDI2ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1wcmV2ZW50LWJ1
aWxkLWlzc3Vlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9m
aWxlcy8wMDAxLXJlbW92ZS1JTkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNzdWVzLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwNzc1ZWIxYjk2NWJiZjliMGVmYjBiMWM0MmMzYWRmM2Q4
Y2QzMWNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNzhlZjc4ZTAwN2FiNzRjNzAx
OTYxZTEwODI2MmQ5ZDczM2EzOTc1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU3Rl
ZmFubyBDYXBwYSA8c3RlZmFuby5jYXBwYS5rczg5QGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMTMg
SmFuIDIwMTkgMDE6NTA6NTIgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmVtb3ZlIElOQ0xVREVE
SVIgdG8gcHJldmVudCBidWlsZCBpc3N1ZXMKQEAgLTExLDEwICsxMSwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBTdGVmYW5vIENhcHBhIDxzdGVmYW5vLmNhcHBhLmtzODlAZ21haWwuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29u
ZmlndXJlCi1pbmRleCBlOWMwOGYxOC4uM2YwNzcwYjcgMTAwNzU1CitpbmRleCAzMmJmOTZlZi4u
YWI0YWE5MDEgMTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZpZ3VyZQotQEAgLTI2
LDcgKzI2LDYgQEAgQlVJTEQ9CitAQCAtMjksNyArMjksNiBAQCBCVUlMRD0KICBIT1NUPQogIEhP
U1RDQz0KICBUQVJHRVQ9CkBAIC0yMiw3ICsyMiw3IEBAIGluZGV4IGU5YzA4ZjE4Li4zZjA3NzBi
NyAxMDA3NTUKICBERUJVRz0KICBGT1JLPQogIFNUQVRJQz0KLUBAIC04OSw3ICs4OCw2IEBAIGZv
ciB4IGRvCitAQCAtOTMsNyArOTIsNiBAQCBmb3IgeCBkbwogIAktLW1hbmRpcikgTUFORElSPSR2
YXI7OwogIAktLWRhdGFkaXIpIERBVEFESVI9JHZhcjs7CiAgCS0td2l0aC1jY29wdHN8Q0ZMQUdT
KSBDRkxBR1M9JHZhcjs7CkBAIC0zMCw3ICszMCw3IEBAIGluZGV4IGU5YzA4ZjE4Li4zZjA3NzBi
NyAxMDA3NTUKICAJQ0MpIENDPSR2YXI7OwogIAlDUFBGTEFHUykgQ1BQRkxBR1M9JHZhcjs7CiAg
CVBLR19DT05GSUcpIFBLR19DT05GSUc9JHZhcjs7Ci1AQCAtMzQ2LDkgKzM0NCw2IEBAIGlmIFsg
LW4gIiRDUFBGTEFHUyIgXTsgdGhlbgorQEAgLTM1Niw5ICszNTQsNiBAQCBpZiBbIC1uICIkQ1BQ
RkxBR1MiIF07IHRoZW4KICAJZWNobyAiQ1BQRkxBR1M9IiA+PiRDT05GSUdfTUsKICAJZWNobyAi
Q1BQRkxBR1MrPQkkQ1BQRkxBR1MiID4+JENPTkZJR19NSwogIGZpCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy9DVkUtMjAyNi01NjExMy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzL0NWRS0yMDI2LTU2MTEzLnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAxNDA5NTY4NWVkLi4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzL0NWRS0yMDI2LTU2
MTEzLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsOTIgKzAsMCBAQAotRnJvbSBmMGU3ZjMyNjQ2
MDA0YTQ3MmY4MzIyYmNlZTRhMzg0MTZmODhhMTMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogUm95IE1hcnBsZXMgPHJveUBtYXJwbGVzLm5hbWU+Ci1EYXRlOiBUdWUsIDIzIEp1biAy
MDI2IDAyOjE3OjEwICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIERIQ1B2NjogV2hlbiBkZXByZWNh
dGluZyBhZGRyZXNzZXMsIHJlc3RhcnQgb24gcHJlZml4Ci0gZGVsZXRpb25zCi0KLUFzIHRoYXQg
bWlnaHQgaW52YWxpZGF0ZSB0aGUgbmV4dCBhZGRyZXNzIHRvIGl0ZXJhdGUgb24uCi0KLVJlcG9y
dGVkLWJ5OiBDdUIzeTBuZCA8cm9vdEBjdWJleW9uZC5uZXQ+Ci0KLShjaGVycnkgcGlja2VkIGZy
b20gY29tbWl0IDU3MzNkM2M1OWE1NjUxZjY0MzU3YWMxMWM5OGI0ZjM5ODk1YzhkMjUpCi0KLUNW
RTogQ1ZFLTIwMjYtNTYxMTMKLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0
aHViLmNvbS9OZXR3b3JrQ29uZmlndXJhdGlvbi9kaGNwY2QvY29tbWl0LzU3MzNkM2M1OWE1NjUx
ZjY0MzU3YWMxMWM5OGI0ZjM5ODk1YzhkMjVdCi1TaWduZWQtb2ZmLWJ5OiBUaGVvIEdhaWdlIChT
Y2huZWlkZXIgRWxlY3RyaWMpIDx0Z2FpZ2Uub3BlbnNvdXJjZUB3aXRla2lvLmNvbT4KLS0tLQot
IHNyYy9kaGNwNi5jIHwgMjEgKysrKysrKysrKysrKysrKysrLS0tCi0gMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvZGhj
cDYuYyBiL3NyYy9kaGNwNi5jCi1pbmRleCA5MTM0MTk5NC4uOGE4YTIwYTAgMTAwNjQ0Ci0tLS0g
YS9zcmMvZGhjcDYuYwotKysrIGIvc3JjL2RoY3A2LmMKLUBAIC0yNTkzLDEyICsyNTkzLDEzIEBA
IGRoY3A2X2ZpbmRpYShzdHJ1Y3QgaW50ZXJmYWNlICppZnAsIHN0cnVjdCBkaGNwNl9tZXNzYWdl
ICptLCBzaXplX3QgbCwKLSB9Ci0gCi0gI2lmbmRlZiBTTUFMTAotLXN0YXRpYyB2b2lkCi0rc3Rh
dGljIGJvb2wKLSBkaGNwNl9kZXByZWNhdGVkZWxlKHN0cnVjdCBpcHY2X2FkZHIgKmlhKQotIHsK
LSAJc3RydWN0IGlwdjZfYWRkciAqZGEsICpkYW4sICpkZGE7Ci0gCXN0cnVjdCB0aW1lc3BlYyBu
b3c7Ci0gCXN0cnVjdCBkaGNwNl9zdGF0ZSAqc3RhdGU7Ci0rCWJvb2wgZnJlZWQgPSBmYWxzZTsK
LSAKLSAJdGltZXNwZWNjbGVhcigmbm93KTsKLSAJVEFJTFFfRk9SRUFDSF9TQUZFKGRhLCAmaWEt
PnBkX3BmeHMsIHBkX25leHQsIGRhbikgewotQEAgLTI2MjQsMTEgKzI2MjUsMTQgQEAgZGhjcDZf
ZGVwcmVjYXRlZGVsZShzdHJ1Y3QgaXB2Nl9hZGRyICppYSkKLSAJCQlpZiAoSU42X0FSRV9BRERS
X0VRVUFMKCZkZGEtPmFkZHIsICZkYS0+YWRkcikpCi0gCQkJCWJyZWFrOwotIAkJfQotLQkJaWYg
KGRkYSAhPSBOVUxMKSB7Ci0rCQlpZiAoZGRhICE9IGlhICYmIGRkYSAhPSBOVUxMKSB7Ci0gCQkJ
VEFJTFFfUkVNT1ZFKCZzdGF0ZS0+YWRkcnMsIGRkYSwgbmV4dCk7Ci0gCQkJaXB2Nl9mcmVlYWRk
cihkZGEpOwotKwkJCWZyZWVkID0gdHJ1ZTsKLSAJCX0KLSAJfQotKwotKwlyZXR1cm4gZnJlZWQ7
Ci0gfQotICNlbmRpZgotIAotQEAgLTI2MzYsNyArMjY0MCwxMSBAQCBzdGF0aWMgdm9pZAotIGRo
Y3A2X2RlcHJlY2F0ZWFkZHJzKHN0cnVjdCBpcHY2X2FkZHJoZWFkICphZGRycykKLSB7Ci0gCXN0
cnVjdCBpcHY2X2FkZHIgKmlhLCAqaWFuOwotKyNpZm5kZWYgU01BTEwKLSsJYm9vbCBhZ2FpbjsK
LSsjZW5kaWYKLSAKLSthZ2FpbjoKLSAJVEFJTFFfRk9SRUFDSF9TQUZFKGlhLCBhZGRycywgbmV4
dCwgaWFuKSB7Ci0gCQlpZiAoaWEtPmZsYWdzICYgSVBWNl9BRl9FWFRFTkRFRCkKLSAJCQk7Ci1A
QCAtMjY1OCw3ICsyNjY2LDkgQEAgZGhjcDZfZGVwcmVjYXRlYWRkcnMoc3RydWN0IGlwdjZfYWRk
cmhlYWQgKmFkZHJzKQotIAkJLyogSWYgd2UgZGVsZWdhdGVkIGZyb20gdGhpcyBwcmVmaXgsIGRl
cHJlY2F0ZSBvciByZW1vdmUKLSAJCSAqIHRoZSBkZWxlZ2F0aW9ucy4gKi8KLSAJCWlmIChpYS0+
ZmxhZ3MgJiBJUFY2X0FGX1BGWERFTEVHQVRJT04pCi0tCQkJZGhjcDZfZGVwcmVjYXRlZGVsZShp
YSk7Ci0rCQkJYWdhaW4gPSBkaGNwNl9kZXByZWNhdGVkZWxlKGlhKTsKLSsJCWVsc2UKLSsJCQlh
Z2FpbiA9IGZhbHNlOwotICNlbmRpZgotIAotIAkJaWYgKGlhLT5mbGFncyAmIElQVjZfQUZfUkVR
VUVTVCkgewotQEAgLTI2NzEsNiArMjY4MSwxMSBAQCBkaGNwNl9kZXByZWNhdGVhZGRycyhzdHJ1
Y3QgaXB2Nl9hZGRyaGVhZCAqYWRkcnMpCi0gCQlpZiAoIShpYS0+ZmxhZ3MgJiBJUFY2X0FGX0VY
VEVOREVEKSkKLSAJCQlpcHY2X2RlbGV0ZWFkZHIoaWEpOwotIAkJaXB2Nl9mcmVlYWRkcihpYSk7
Ci0rI2lmbmRlZiBTTUFMTAotKwkJLyogRGVsZXRpb24gbWF5IGludmFsaWRhdGUgdGhlIG5leHQg
cG9pbnRlciBzbyByZXN0YXJ0ICovCi0rCQlpZiAoYWdhaW4pCi0rCQkJZ290byBhZ2FpbjsKLSsj
ZW5kaWYKLSAJfQotIH0KLSAKLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzL0NWRS0yMDI2LTU2MTE0LnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvQ1ZFLTIwMjYtNTYxMTQucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGE2YjhhNDQ1MTUuLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvQ1ZFLTIwMjYtNTYxMTQucGF0
Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNCArMCwwIEBACi1Gcm9tIDJlMjc5Njk2OTk2NzZlNjY0
ODk4YzhmODJlMmMwNDc3NjJmYzQyNmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBS
b3kgTWFycGxlcyA8cm95QG1hcnBsZXMubmFtZT4KLURhdGU6IFR1ZSwgMjMgSnVuIDIwMjYgMDI6
MDY6NTUgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gREhDUHY2OiBQcmVmaXggZXhjbHVkZSBvcHRp
b24gY2FuIGJlIDE3IG9jdGV0cyAoIzY3MSkKLQotV2VsbCB0aGF0J3MgYSBzaW1wbGUgb2ZmIGJ5
IG9uZSBlcnJvcgotCi1SZXBvcnRlZC1ieTogQ3VCM3kwbmQgPHJvb3RAY3ViZXlvbmQubmV0Pgot
Ci0oY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCAyZjAwYzdiZmM0MDhiNjU4MmQzMzE5MzJkZmE0
NzgyOWM0ODE5MDI5KQotCi1DVkU6IENWRS0yMDI2LTU2MTE0Ci1VcHN0cmVhbS1TdGF0dXM6IEJh
Y2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vTmV0d29ya0NvbmZpZ3VyYXRpb24vZGhjcGNkL2Nv
bW1pdC8yZjAwYzdiZmM0MDhiNjU4MmQzMzE5MzJkZmE0NzgyOWM0ODE5MDI5XQotU2lnbmVkLW9m
Zi1ieTogVGhlbyBHYWlnZSAoU2NobmVpZGVyIEVsZWN0cmljKSA8dGdhaWdlLm9wZW5zb3VyY2VA
d2l0ZWtpby5jb20+Ci0tLS0KLSBzcmMvZGhjcDYuYyB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9kaGNwNi5j
IGIvc3JjL2RoY3A2LmMKLWluZGV4IDhhOGEyMGEwLi41ZTQ5N2NmZCAxMDA2NDQKLS0tLSBhL3Ny
Yy9kaGNwNi5jCi0rKysgYi9zcmMvZGhjcDYuYwotQEAgLTEwOTMsNyArMTA5Myw3IEBAIGRoY3A2
X21ha2VtZXNzYWdlKHN0cnVjdCBpbnRlcmZhY2UgKmlmcCkKLSAKLSAJCQkJLyogUkZDNjYwMyBT
ZWN0aW9uIDQuMiAqLwotIAkJCQlpZiAoYXAtPnByZWZpeF9leGNsdWRlX2xlbikgewotLQkJCQkJ
dWludDhfdCBleGJbMTZdLCAqZXAsIHU4OwotKwkJCQkJdWludDhfdCBleGJbMTddLCAqZXAsIHU4
OwotIAkJCQkJY29uc3QgdWludDhfdCAqcHA7Ci0gCi0gCQkJCQluID0gKHNpemVfdCkoKGFwLT5w
cmVmaXhfZXhjbHVkZV9sZW4gLQotLS0gCi0yLjQzLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvQ1ZFLTIwMjYtNTYxMTYucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy9DVkUtMjAyNi01NjExNi5wYXRjaApk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMmQ4MzQ1Y2YxOC4uMDAwMDAwMDAwMAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy9DVkUtMjAyNi01NjExNi5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDMxICswLDAgQEAKLUZyb20gYWUzM2MyZDhmYzczMTlh
Mjk1N2FjZDZlOGVmYWQ5OTExNmI2OGRjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IFJveSBNYXJwbGVzIDxyb3lAbWFycGxlcy5uYW1lPgotRGF0ZTogVHVlLCAyMyBKdW4gMjAyNiAw
MDozNDo1OCArMDEwMAotU3ViamVjdDogW1BBVENIXSBJUHY2TkQ6IEZyZWUgcm91dGVpbmZvIHdo
ZW4gaXQgZXhwaXJlcyAoIzY3MCkKLQotUmVwb3J0ZWQtYnk6IEN1QjN5MG5kIDxyb290QGN1YmV5
b25kLm5ldD4KLQotKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgNzA4YjRhNTZiYWUwODBhNWIx
OGMyZTBjNGM2ZmJlMTAzMTMxYTJiMCkKLQotQ1ZFOiBDVkUtMjAyNi01NjExNgotVXBzdHJlYW0t
U3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL05ldHdvcmtDb25maWd1cmF0aW9u
L2RoY3BjZC9jb21taXQvNzA4YjRhNTZiYWUwODBhNWIxOGMyZTBjNGM2ZmJlMTAzMTMxYTJiMF0K
LVNpZ25lZC1vZmYtYnk6IFRoZW8gR2FpZ2UgKFNjaG5laWRlciBFbGVjdHJpYykgPHRnYWlnZS5v
cGVuc291cmNlQHdpdGVraW8uY29tPgotLS0tCi0gc3JjL2lwdjZuZC5jIHwgMSArCi0gMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCi0KLWRpZmYgLS1naXQgYS9zcmMvaXB2Nm5kLmMgYi9z
cmMvaXB2Nm5kLmMKLWluZGV4IGNjZjcxMjQxLi41NTdmZjUwZSAxMDA2NDQKLS0tLSBhL3NyYy9p
cHY2bmQuYwotKysrIGIvc3JjL2lwdjZuZC5jCi1AQCAtMTc4OSw2ICsxNzg5LDcgQEAgaXB2Nm5k
X2V4cGlyZXJhKHZvaWQgKmFyZykKLSAJCQkJbG9nd2FybngoIiVzOiBleHBpcmVkIHJvdXRlICVz
IiwKLSAJCQkJICAgIHJhcC0+aWZhY2UtPm5hbWUsIHJpbmZvLT5zcHJlZml4KTsKLSAJCQkJVEFJ
TFFfUkVNT1ZFKCZyYXAtPnJpbmZvcywgcmluZm8sIG5leHQpOwotKwkJCQlmcmVlKHJpbmZvKTsK
LSAJCQl9Ci0gCQl9Ci0gCi0tLSAKLTIuNDMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy9DVkUtMjAyNi01NjExNy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzL0NWRS0yMDI2LTU2MTE3LnBhdGNoCmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA2ZWY4NjIwNGYyLi4wMDAwMDAwMDAwCi0tLSBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzL0NWRS0yMDI2LTU2MTE3LnBhdGNo
CisrKyAvZGV2L251bGwKQEAgLTEsMTY3ICswLDAgQEAKLUZyb20gYjdiZjA0N2UzMDIxN2UxNDQy
MzVhNmIwMGQ0YzgxYWZiY2M1ZDZhYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFJv
eSBNYXJwbGVzIDxyb3lAbWFycGxlcy5uYW1lPgotRGF0ZTogTW9uLCAyMiBKdW4gMjAyNiAyMzo0
MTo1MyArMDEwMAotU3ViamVjdDogW1BBVENIXSBjb250cm9sOiBBdm9pZCBoYW5ndXAgaW4gdGhl
IHJlY3ZkYXRhIHBhdGgKLQotSW5zdGVhZCByZXR1cm4gYW4gZXJyb3IgYW5kIGJ1YmJsZSBpdCB1
cCB3aGVyZSBpdCBjYW4gYmUKLWhhbmd1cCAvIGZyZWVkIG1vcmUgY2xlYW5seS4KLQotUmVwb3J0
ZWQtYnk6IEN1QjN5MG5kIDxyb290QGN1YmV5b25kLm5ldD4KLQotKGNoZXJyeSBwaWNrZWQgZnJv
bSBjb21taXQgNzhlYTA5ZWQxNjMzYTU4M2RiY2RlNmU3YmFiOWRmNDYzOWVjOGEzNCkKLQotQ1ZF
OiBDVkUtMjAyNi01NjExNwotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRo
dWIuY29tL05ldHdvcmtDb25maWd1cmF0aW9uL2RoY3BjZC9jb21taXQvNzhlYTA5ZWQxNjMzYTU4
M2RiY2RlNmU3YmFiOWRmNDYzOWVjOGEzNF0KLVNpZ25lZC1vZmYtYnk6IFRoZW8gR2FpZ2UgKFNj
aG5laWRlciBFbGVjdHJpYykgPHRnYWlnZS5vcGVuc291cmNlQHdpdGVraW8uY29tPgotLS0tCi0g
c3JjL2NvbnRyb2wuYyAgICAgICAgIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLQotIHNyYy9jb250cm9sLmggICAgICAgICB8ICAyICstCi0gc3JjL3ByaXZz
ZXAtY29udHJvbC5jIHwgIDcgKysrKysrLQotIDMgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9u
cygrKSwgMjMgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvY29udHJvbC5jIGIvc3Jj
L2NvbnRyb2wuYwotaW5kZXggZWMxYzYzM2MuLmU2MTE1ZjY2IDEwMDY0NAotLS0tIGEvc3JjL2Nv
bnRyb2wuYwotKysrIGIvc3JjL2NvbnRyb2wuYwotQEAgLTExNSwxMCArMTE1LDggQEAgY29udHJv
bF9oYW5kbGVfcmVhZChzdHJ1Y3QgZmRfbGlzdCAqZmQpCi0gCWJ5dGVzID0gcmVhZChmZC0+ZmQs
IGJ1ZmZlciwgc2l6ZW9mKGJ1ZmZlcikgLSAxKTsKLSAJaWYgKGJ5dGVzID09IC0xKQotIAkJbG9n
ZXJyKF9fZnVuY19fKTsKLS0JaWYgKGJ5dGVzID09IC0xIHx8IGJ5dGVzID09IDApIHsKLS0JCWNv
bnRyb2xfaGFuZ3VwKGZkKTsKLS0JCXJldHVybiAtMTsKLS0JfQotKwlpZiAoYnl0ZXMgPT0gLTEg
fHwgYnl0ZXMgPT0gMCkKLSsJCXJldHVybiAoaW50KWJ5dGVzOwotIAotICNpZmRlZiBQUklWU0VQ
Ci0gCWlmIChJTl9QUklWU0VQKGZkLT5jdHgpKSB7Ci1AQCAtMTM0LDE1ICsxMzIsMTMgQEAgY29u
dHJvbF9oYW5kbGVfcmVhZChzdHJ1Y3QgZmRfbGlzdCAqZmQpCi0gCQlpZiAoZXJyID09IDEgJiYK
LSAJCSAgICBwc19jdGxfc2VuZGFyZ3MoZmQsIGJ1ZmZlciwgKHNpemVfdClieXRlcykgPT0gLTEp
IHsKLSAJCQlsb2dlcnIoX19mdW5jX18pOwotLQkJCWNvbnRyb2xfZnJlZShmZCk7Ci0gCQkJcmV0
dXJuIC0xOwotIAkJfQotLQkJcmV0dXJuIDA7Ci0rCQlyZXR1cm4gMTsKLSAJfQotICNlbmRpZgot
IAotLQljb250cm9sX3JlY3ZkYXRhKGZkLCBidWZmZXIsIChzaXplX3QpYnl0ZXMpOwotLQlyZXR1
cm4gMDsKLSsJcmV0dXJuIGNvbnRyb2xfcmVjdmRhdGEoZmQsIGJ1ZmZlciwgKHNpemVfdClieXRl
cyk7Ci0gfQotIAotIHN0YXRpYyBpbnQKLUBAIC0yMDUsMjMgKzIwMSwzMSBAQCBzdGF0aWMgdm9p
ZAotIGNvbnRyb2xfaGFuZGxlX2RhdGEodm9pZCAqYXJnLCB1bnNpZ25lZCBzaG9ydCBldmVudHMp
Ci0gewotIAlzdHJ1Y3QgZmRfbGlzdCAqZmQgPSBhcmc7Ci0rCWludCBlcnI7Ci0gCi0gCWlmICgh
KGV2ZW50cyAmIChFTEVfUkVBRCB8IEVMRV9XUklURSB8IEVMRV9IQU5HVVApKSkKLSAJCWxvZ2Vy
cngoIiVzOiB1bmV4cGVjdGVkIGV2ZW50IDB4JTA0eCIsIF9fZnVuY19fLCBldmVudHMpOwotIAot
IAlpZiAoZXZlbnRzICYgRUxFX1dSSVRFICYmICEoZXZlbnRzICYgRUxFX0hBTkdVUCkpIHsKLS0J
CWlmIChjb250cm9sX2hhbmRsZV93cml0ZShmZCkgPT0gLTEpCi0tCQkJcmV0dXJuOwotKwkJZXJy
ID0gY29udHJvbF9oYW5kbGVfd3JpdGUoZmQpOwotKwkJaWYgKGVyciA9PSAtMSkKLSsJCQlnb3Rv
IGhhbmd1cDsKLSAJfQotIAlpZiAoZXZlbnRzICYgRUxFX1JFQUQpIHsKLS0JCWlmIChjb250cm9s
X2hhbmRsZV9yZWFkKGZkKSA9PSAtMSkKLS0JCQlyZXR1cm47Ci0rCQllcnIgPSBjb250cm9sX2hh
bmRsZV9yZWFkKGZkKTsKLSsJCWlmIChlcnIgPT0gLTEgfHwgZXJyID09IDApCi0rCQkJZ290byBo
YW5ndXA7Ci0gCX0KLSAJaWYgKGV2ZW50cyAmIEVMRV9IQU5HVVApCi0tCQljb250cm9sX2hhbmd1
cChmZCk7Ci0rCQlnb3RvIGhhbmd1cDsKLSsKLSsJcmV0dXJuOwotKwotK2hhbmd1cDoKLSsJY29u
dHJvbF9oYW5ndXAoZmQpOwotIH0KLSAKLS12b2lkCi0raW50Ci0gY29udHJvbF9yZWN2ZGF0YShz
dHJ1Y3QgZmRfbGlzdCAqZmQsIGNoYXIgKmRhdGEsIHNpemVfdCBsZW4pCi0gewotIAljaGFyICpw
ID0gZGF0YSwgKmU7Ci1AQCAtMjQzLDEyICsyNDcsMTMgQEAgY29udHJvbF9yZWN2ZGF0YShzdHJ1
Y3QgZmRfbGlzdCAqZmQsIGNoYXIgKmRhdGEsIHNpemVfdCBsZW4pCi0gCQkJaWYgKGUgPT0gTlVM
TCkgewotIAkJCQllcnJubyA9IEVJTlZBTDsKLSAJCQkJbG9nZXJyeCgiJXM6IG5vIHRlcm1pbmF0
b3IiLCBfX2Z1bmNfXyk7Ci0tCQkJCXJldHVybjsKLSsJCQkJcmV0dXJuIC0xOwotIAkJCX0KLS0J
CQlpZiAoKHNpemVfdClhcmdjID49IHNpemVvZihhcmd2cCkgLyBzaXplb2YoYXJndnBbMF0pKSB7
Ci0rCQkJaWYgKChzaXplX3QpYXJnYyArIDEgPj0KLSsJCQkgICAgc2l6ZW9mKGFyZ3ZwKSAvIHNp
emVvZihhcmd2cFswXSkpIHsKLSAJCQkJZXJybm8gPSBFTk9CVUZTOwotIAkJCQlsb2dlcnJ4KCIl
czogbm8gYXJnIGJ1ZmZlciIsIF9fZnVuY19fKTsKLS0JCQkJcmV0dXJuOwotKwkJCQlyZXR1cm4g
LTE7Ci0gCQkJfQotIAkJCSphcCsrID0gcDsKLSAJCQlhcmdjKys7Ci1AQCAtMjY4LDEyICsyNzMs
MTIgQEAgY29udHJvbF9yZWN2ZGF0YShzdHJ1Y3QgZmRfbGlzdCAqZmQsIGNoYXIgKmRhdGEsIHNp
emVfdCBsZW4pCi0gCQkqYXAgPSBOVUxMOwotIAkJaWYgKGRoY3BjZF9oYW5kbGVhcmdzKGZkLT5j
dHgsIGZkLCBhcmdjLCBhcmd2cCkgPT0gLTEpIHsKLSAJCQlsb2dlcnIoX19mdW5jX18pOwotLQkJ
CWlmIChlcnJubyAhPSBFSU5UUiAmJiBlcnJubyAhPSBFQUdBSU4pIHsKLS0JCQkJY29udHJvbF9m
cmVlKGZkKTsKLS0JCQkJcmV0dXJuOwotLQkJCX0KLSsJCQlpZiAoZXJybm8gIT0gRUlOVFIgJiYg
ZXJybm8gIT0gRUFHQUlOKQotKwkJCQlyZXR1cm4gLTE7Ci0gCQl9Ci0gCX0KLSsKLSsJcmV0dXJu
IDE7Ci0gfQotIAotIHN0cnVjdCBmZF9saXN0ICoKLWRpZmYgLS1naXQgYS9zcmMvY29udHJvbC5o
IGIvc3JjL2NvbnRyb2wuaAotaW5kZXggZWY1OTIyNjguLjFmMDlmYzhmIDEwMDY0NAotLS0tIGEv
c3JjL2NvbnRyb2wuaAotKysrIGIvc3JjL2NvbnRyb2wuaAotQEAgLTc2LDUgKzc2LDUgQEAgc3Ry
dWN0IGZkX2xpc3QgKmNvbnRyb2xfbmV3KHN0cnVjdCBkaGNwY2RfY3R4ICosIGludCwgdW5zaWdu
ZWQgaW50KTsKLSB2b2lkIGNvbnRyb2xfZnJlZShzdHJ1Y3QgZmRfbGlzdCAqKTsKLSB2b2lkIGNv
bnRyb2xfZGVsZXRlKHN0cnVjdCBmZF9saXN0ICopOwotIGludCBjb250cm9sX3F1ZXVlKHN0cnVj
dCBmZF9saXN0ICosIHZvaWQgKiwgc2l6ZV90KTsKLS12b2lkIGNvbnRyb2xfcmVjdmRhdGEoc3Ry
dWN0IGZkX2xpc3QgKmZkLCBjaGFyICosIHNpemVfdCk7Ci0raW50IGNvbnRyb2xfcmVjdmRhdGEo
c3RydWN0IGZkX2xpc3QgKmZkLCBjaGFyICosIHNpemVfdCk7Ci0gI2VuZGlmCi1kaWZmIC0tZ2l0
IGEvc3JjL3ByaXZzZXAtY29udHJvbC5jIGIvc3JjL3ByaXZzZXAtY29udHJvbC5jCi1pbmRleCBi
OWVhN2Y5Yy4uM2NkZWVkZWEgMTAwNjQ0Ci0tLS0gYS9zcmMvcHJpdnNlcC1jb250cm9sLmMKLSsr
KyBiL3NyYy9wcml2c2VwLWNvbnRyb2wuYwotQEAgLTExMCw2ICsxMTAsNyBAQCBwc19jdGxfZGlz
cGF0Y2godm9pZCAqYXJnLCBzdHJ1Y3QgcHNfbXNnaGRyICpwc20sIHN0cnVjdCBtc2doZHIgKm1z
ZykKLSAJc3RydWN0IGlvdmVjICppb3YgPSBtc2ctPm1zZ19pb3Y7Ci0gCXN0cnVjdCBmZF9saXN0
ICpmZDsKLSAJdW5zaWduZWQgaW50IGZkX2ZsYWdzID0gRkRfU0VORExFTjsKLSsJaW50IGVycjsK
LSAKLSAJc3dpdGNoIChwc20tPnBzX2ZsYWdzKSB7Ci0gCWNhc2UgUFNfQ1RMX1BSSVY6Ci1AQCAt
MTMzLDcgKzEzNCwxMSBAQCBwc19jdGxfZGlzcGF0Y2godm9pZCAqYXJnLCBzdHJ1Y3QgcHNfbXNn
aGRyICpwc20sIHN0cnVjdCBtc2doZHIgKm1zZykKLSAJCWlmIChmZCA9PSBOVUxMKQotIAkJCXJl
dHVybiAtMTsKLSAJCWN0eC0+cHNfY29udHJvbF9jbGllbnQgPSBmZDsKLS0JCWNvbnRyb2xfcmVj
dmRhdGEoZmQsIGlvdi0+aW92X2Jhc2UsIGlvdi0+aW92X2xlbik7Ci0rCQllcnIgPSBjb250cm9s
X3JlY3ZkYXRhKGZkLCBpb3YtPmlvdl9iYXNlLCBpb3YtPmlvdl9sZW4pOwotKwkJaWYgKGVyciA9
PSAtMSB8fCBlcnIgPT0gMCkgewotKwkJCWNvbnRyb2xfZnJlZShmZCk7Ci0rCQkJY3R4LT5wc19j
b250cm9sX2NsaWVudCA9IE5VTEw7Ci0rCQl9Ci0gCQlicmVhazsKLSAJY2FzZSBQU19DVExfRU9G
OgotIAkJY3R4LT5wc19jb250cm9sX2NsaWVudCA9IE5VTEw7Ci0tLSAKLTIuNDMuMAotCi0tIAoy
LjQ3LjEKCg==

--===============8688095791726073829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.3.2" to "10.5.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1383696 to 1421696 (+3%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.3.2 [default] to 10.5.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.3.2" to "10.5.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.3.2 [default] to 10.5.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.3.2" to "10.5.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PKGSIZE changed from 67121 to 68511 (+2%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.3.2 [default] to 10.5.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.3.2" to "10.5.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.3.2 [default] to 10.5.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.3.2" to "10.5.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1122801 to 1153555 (+3%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: FILELIST: directory renamed /usr/src/debug/dhcpcd/10.3.2/vendor -> /usr/src/debug/dhcpcd/10.5.0/vendor, directory renamed /usr/src/debug/dhcpcd/10.3.2/src/dev -> /usr/src/debug/dhcpcd/10.5.0/src/dev, directory renamed /usr/src/debug/dhcpcd/10.3.2/compat/crypt_openssl -> /usr/src/debug/dhcpcd/10.5.0/compat/crypt_openssl, removed "/usr/src/debug/dhcpcd/10.3.2/src/bpf.h /usr/src/debug/dhcpcd/10.3.2/src/dhcpcd-embedded.h /usr/src/debug/dhcpcd/10.3.2/compat/_strtoi.h /usr/src/debug/dhcpcd/10.3.2/src/privsep-inet.h /usr/src/debug/dhcpcd/10.3.2/src/control.h /usr/src/debug/dhcpcd/10.3.2/src/dhcpcd-embedded.c /usr/src/debug/dhcpcd/10.3.2/src/bpf.c /usr/src/debug/dhcpcd/10.3.2/src/privsep-inet.c /usr/src/debug/dhcpcd/10.3.2/compat/bitops.h /usr/src/debug/dhcpcd/10.3.2/src/if.h /usr/src/debug/dhcpcd/10.3.2/src/dhcp6.c /usr/src/debug/dhcpcd/10.3.2/src/privsep-root.h /usr/src/debug/dhcpcd/10.3.2/src/ipv6.h /usr/src/debug/dhcpcd/10.3.2/src/privsep-
 root.c /usr/src/debug/dhcpcd/10.3.2/src/dhcp6.h /usr/src/debug/dhcpcd/10.3.2/src/if.c /usr/src/debug/dhcpcd/10.3.2/src/arp.h /usr/src/debug/dhcpcd/10.3.2/src/dev.h /usr/src/debug/dhcpcd/10.3.2/src/auth.h /usr/src/debug/dhcpcd/10.3.2/src/dhcp.h /usr/src/debug/dhcpcd/10.3.2/src/duid.c /usr/src/debug/dhcpcd/10.3.2/src/dev.c /usr/src/debug/dhcpcd/10.3.2/src/eloop.h /usr/src/debug/dhcpcd/10.3.2/compat/consttime_memequal.h /usr/src/debug/dhcpcd/10.3.2/src/arp.c /usr/src/debug/dhcpcd/10.3.2/src/eloop.c /usr/src/debug/dhcpcd/10.3.2/src/dhcp.c /usr/src/debug/dhcpcd/10.3.2/src/auth.c /usr/src/debug/dhcpcd/10.3.2/src/duid.h /usr/src/debug/dhcpcd/10.3.2/src/script.h /usr/src/debug/dhcpcd/10.3.2/src/privsep-bpf.c /usr/src/debug/dhcpcd/10.3.2/src/route.c /usr/src/debug/dhcpcd/10.3.2/src/ipv4ll.h /usr/src/debug/dhcpcd/10.3.2/src/privsep-bpf.h /usr/src/debug/dhcpcd/10.3.2/src/route.h /usr/src/debug/dhcpcd/10.3.2/src/dhcp-common.c /usr/src/debug/dhcpcd/10.3.2/src/if-options.c /usr/src/debug/dhcpcd/1
 0.3.2/src/common.h /usr/src/debug/dhcpcd/10.3.2/compat/endian.h /usr/src/debug/dhcpcd/10.3.2/compat/setproctitle.c /usr/src/debug/dhcpcd/10.3.2/src/sa.c /usr/src/debug/dhcpcd/10.3.2/src/dhcp-common.h /usr/src/debug/dhcpcd/10.3.2/compat/setproctitle.h /usr/src/debug/dhcpcd/10.3.2/src/sa.h /usr/src/debug/dhcpcd/10.3.2/src/if-options.h /usr/src/debug/dhcpcd/10.3.2/src/privsep-control.c /usr/src/debug/dhcpcd/10.3.2/src/privsep-linux.c /usr/src/debug/dhcpcd/10.3.2/src/privsep-control.h /usr/src/debug/dhcpcd/10.3.2/compat/strtoi.h /usr/src/debug/dhcpcd/10.3.2/compat/pidfile.h /usr/src/debug/dhcpcd/10.3.2/src/ipv4.c /usr/src/debug/dhcpcd/10.3.2/src/ipv4.h /usr/src/debug/dhcpcd/10.3.2/compat/pidfile.c /usr/src/debug/dhcpcd/10.3.2/src/logerr.h /usr/src/debug/dhcpcd/10.3.2/src/script.c /usr/src/debug/dhcpcd/10.3.2/src/common.c /usr/src/debug/dhcpcd/10.3.2/src/dhcpcd.c /usr/src/debug/dhcpcd/10.3.2/src/if-linux.c /usr/src/debug/dhcpcd/10.3.2/src/ipv4ll.c /usr/src/debug/dhcpcd/10.3.2/src/ipv6.c 
 /usr/src/debug/dhcpcd/10.3.2/src/control.c /usr/src/debug/dhcpcd/10.3.2/src/ipv6nd.h /usr/src/debug/dhcpcd/10.3.2/src/ipv6nd.c /usr/src/debug/dhcpcd/10.3.2/src/logerr.c /usr/src/debug/dhcpcd/10.3.2/src/privsep.c /usr/src/debug/dhcpcd/10.3.2/src/dhcpcd.h /usr/src/debug/dhcpcd/10.3.2/src/privsep.h", added "/usr/src/debug/dhcpcd/10.5.0/src/bpf.h /usr/src/debug/dhcpcd/10.5.0/src/dhcpcd-embedded.h /usr/src/debug/dhcpcd/10.5.0/compat/_strtoi.h /usr/src/debug/dhcpcd/10.5.0/src/privsep-inet.h /usr/src/debug/dhcpcd/10.5.0/src/ipv4ll.h /usr/src/debug/dhcpcd/10.5.0/src/dhcpcd-embedded.c /usr/src/debug/dhcpcd/10.5.0/src/bpf.c /usr/src/debug/dhcpcd/10.5.0/src/ipv6.h /usr/src/debug/dhcpcd/10.5.0/src/privsep-inet.c /usr/src/debug/dhcpcd/10.5.0/compat/bitops.h /usr/src/debug/dhcpcd/10.5.0/src/if.h /usr/src/debug/dhcpcd/10.5.0/src/dhcp6.c /usr/src/debug/dhcpcd/10.5.0/src/privsep-root.h /usr/src/debug/dhcpcd/10.5.0/src/control.h /usr/src/debug/dhcpcd/10.5.0/src/privsep-root.c /usr/src/debug/dhcpcd/10
 .5.0/src/dhcp6.h /usr/src/debug/dhcpcd/10.5.0/src/if.c /usr/src/debug/dhcpcd/10.5.0/compat/getprogname.c /usr/src/debug/dhcpcd/10.5.0/src/arp.h /usr/src/debug/dhcpcd/10.5.0/src/dev.h /usr/src/debug/dhcpcd/10.5.0/src/auth.h /usr/src/debug/dhcpcd/10.5.0/src/dhcp.h /usr/src/debug/dhcpcd/10.5.0/src/duid.c /usr/src/debug/dhcpcd/10.5.0/src/dev.c /usr/src/debug/dhcpcd/10.5.0/src/eloop.h /usr/src/debug/dhcpcd/10.5.0/compat/consttime_memequal.h /usr/src/debug/dhcpcd/10.5.0/compat/getprogname.h /usr/src/debug/dhcpcd/10.5.0/src/arp.c /usr/src/debug/dhcpcd/10.5.0/src/dhcp.c /usr/src/debug/dhcpcd/10.5.0/src/auth.c /usr/src/debug/dhcpcd/10.5.0/src/duid.h /usr/src/debug/dhcpcd/10.5.0/src/eloop.c /usr/src/debug/dhcpcd/10.5.0/src/privsep-bpf.c /usr/src/debug/dhcpcd/10.5.0/src/route.c /usr/src/debug/dhcpcd/10.5.0/src/privsep-bpf.h /usr/src/debug/dhcpcd/10.5.0/src/bpf-linux.c /usr/src/debug/dhcpcd/10.5.0/src/logerr.h /usr/src/debug/dhcpcd/10.5.0/src/dhcp-common.c /usr/src/debug/dhcpcd/10.5.0/src/route
 .h /usr/src/debug/dhcpcd/10.5.0/src/if-options.c /usr/src/debug/dhcpcd/10.5.0/compat/endian.h /usr/src/debug/dhcpcd/10.5.0/compat/setproctitle.c /usr/src/debug/dhcpcd/10.5.0/src/sa.c /usr/src/debug/dhcpcd/10.5.0/src/dhcp-common.h /usr/src/debug/dhcpcd/10.5.0/compat/setproctitle.h /usr/src/debug/dhcpcd/10.5.0/src/sa.h /usr/src/debug/dhcpcd/10.5.0/src/if-options.h /usr/src/debug/dhcpcd/10.5.0/src/privsep-control.c /usr/src/debug/dhcpcd/10.5.0/src/script.h /usr/src/debug/dhcpcd/10.5.0/src/common.h /usr/src/debug/dhcpcd/10.5.0/src/privsep-linux.c /usr/src/debug/dhcpcd/10.5.0/src/privsep-control.h /usr/src/debug/dhcpcd/10.5.0/compat/strtoi.h /usr/src/debug/dhcpcd/10.5.0/compat/pidfile.h /usr/src/debug/dhcpcd/10.5.0/compat/getpeereid.h /usr/src/debug/dhcpcd/10.5.0/src/ipv4.c /usr/src/debug/dhcpcd/10.5.0/compat/getpeereid.c /usr/src/debug/dhcpcd/10.5.0/compat/pidfile.c /usr/src/debug/dhcpcd/10.5.0/src/ipv4.h /usr/src/debug/dhcpcd/10.5.0/src/script.c /usr/src/debug/dhcpcd/10.5.0/src/common.
 c /usr/src/debug/dhcpcd/10.5.0/src/dhcpcd.c /usr/src/debug/dhcpcd/10.5.0/src/if-linux.c /usr/src/debug/dhcpcd/10.5.0/src/ipv4ll.c /usr/src/debug/dhcpcd/10.5.0/src/ipv6.c /usr/src/debug/dhcpcd/10.5.0/src/control.c /usr/src/debug/dhcpcd/10.5.0/src/ipv6nd.c /usr/src/debug/dhcpcd/10.5.0/src/logerr.c /usr/src/debug/dhcpcd/10.5.0/src/privsep.c /usr/src/debug/dhcpcd/10.5.0/src/ipv6nd.h /usr/src/debug/dhcpcd/10.5.0/src/privsep.h /usr/src/debug/dhcpcd/10.5.0/src/dhcpcd.h"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.3.2 [default] to 10.5.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.3.2" to "10.5.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.3.2 [default] to 10.5.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd: PV changed from "10.3.2" to "10.5.0"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 469558 to 482996 (+3%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.3.2 [default] to 10.5.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd: PV changed from "10.3.2" to "10.5.0"
packages/x86-64-v3-poky-linux/dhcpcd: PKGV changed from 10.3.2 [default] to 10.5.0 [default]
packages/x86-64-v3-poky-linux/dhcpcd: SRC_URI changed from "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master;tag=v10.3.2 file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch file://dhcpcd.service file://dhcpcd@.service file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch file://CVE-2026-56113.patch file://CVE-2026-56114.patch file://CVE-2026-56116.patch file://CVE-2026-56117.patch" to "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master;tag=v10.5.0 file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch file://dhcpcd.service file://dhcpcd@.service file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch"

--===============8688095791726073829==--

