Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48614.1795412254202115046
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YyyoNmC5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i8krkO4F;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a206e8da59-de8f30aa-7703-4cc3-879d-7424a4880834-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795412253;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gFQR0lidV1KcEKHpLLxYG3qLAKnoFAQfi7xMAFPoVJo=;
	b=YyyoNmC5TPH12ctdAhhRTmI8FawYSDys/7gN/9cGZ3Vtu39W6kwY38KYn39oVqne
	Hc+0NYX2BvaKWRWjM4JtxiHbxreBM72uiyBAlOy4Y2Y7FcPbkyy9dLAOPx2M2seoAq4
	8Ag9OpLpAnHUEII8eAVS/pwr97kIw57ojxjfUIpU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795412253;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gFQR0lidV1KcEKHpLLxYG3qLAKnoFAQfi7xMAFPoVJo=;
	b=i8krkO4FBqHCACIvVPYhnFj6Mp7HLv91Are+4KC8Arud008bbytQ70B/nItk6BoZ
	05LmLa5uBFh0Uz8qly/ipQYwLTIAgTuAniJ3gOUty1jrNpXR95+ZcIcZdacmRhavL6h
	pnm8r7LOF0lMlCyOWc8IQ6kf0EpS+tZ++0Gn+ByQ=
Content-Type: multipart/mixed; boundary="===============5802174430708966937=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sumanth Gavini <sumanth.gavini@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.20.4 SUCCEEDED
Message-ID: <010101a206e8da59-de8f30aa-7703-4cc3-879d-7424a4880834-000000@us-west-2.amazonses.com>
Date: Mon, 23 Nov 2026 05:37:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.23-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 05:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250885

--===============5802174430708966937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.20.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.20.3-4.20.4.patch
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
From ce714a732b7522e9f4d7488059193d5a993a4647 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 23 Nov 2026 05:25:07 +0000
Subject: [PATCH] shadow: upgrade 4.20.3 -> 4.20.4

---
 ...cd_flush_cache-Fix-type-of-parameter.patch | 30 -------------------
 .../shadow/files/notallylog.patch             |  2 +-
 .../{shadow_4.20.3.bb => shadow_4.20.4.bb}    |  4 +--
 3 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch
 rename meta/recipes-extended/shadow/{shadow_4.20.3.bb => shadow_4.20.4.bb} (97%)

diff --git a/meta/recipes-extended/shadow/files/0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch b/meta/recipes-extended/shadow/files/0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch
deleted file mode 100644
index e873cdaffd..0000000000
--- a/meta/recipes-extended/shadow/files/0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b8d3549a49acfe967f45aebaf06d474c82c46d22 Mon Sep 17 00:00:00 2001
-From: Alejandro Colomar <alx@kernel.org>
-Date: Wed, 30 Sep 2026 19:12:01 +0200
-Subject: [PATCH] lib/nscd.h: nscd_flush_cache(): Fix type of parameter
-
-Fixes: deef7d84c3e4 (2026-09-09; "lib/nscd.h: nscd_flush_cache(): Define as static inline function")
-Closes: <https://github.com/shadow-maint/shadow/issues/1763>
-Reported-by: <https://github.com/Bonnietwin>
-Tested-by: <https://github.com/Bonnietwin>
-Signed-off-by: Alejandro Colomar <alx@kernel.org>
-
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/b8d3549a49acfe967f45aebaf06d474c82c46d22]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- lib/nscd.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/nscd.h b/lib/nscd.h
-index fda3b1cb..30b56720 100644
---- a/lib/nscd.h
-+++ b/lib/nscd.h
-@@ -8,7 +8,7 @@
- extern int nscd_flush_cache (const char *service);
- #else
- static inline int
--nscd_flush_cache(MAYBE_UNUSED int _1)
-+nscd_flush_cache(MAYBE_UNUSED const char *_1)
- {
- 	return 0;
- }
diff --git a/meta/recipes-extended/shadow/files/notallylog.patch b/meta/recipes-extended/shadow/files/notallylog.patch
index b3b30026ce..5a51d03692 100644
--- a/meta/recipes-extended/shadow/files/notallylog.patch
+++ b/meta/recipes-extended/shadow/files/notallylog.patch
@@ -1,4 +1,4 @@
-From a7d45933186754a1190509b46c51c56d48089004 Mon Sep 17 00:00:00 2001
+From 9cb5b470b3d704dc6b987a67d08a622b79702212 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 21 Apr 2026 11:30:52 +0100
 Subject: [PATCH] shadow: Disable tallylog execution
diff --git a/meta/recipes-extended/shadow/shadow_4.20.3.bb b/meta/recipes-extended/shadow/shadow_4.20.4.bb
similarity index 97%
rename from meta/recipes-extended/shadow/shadow_4.20.3.bb
rename to meta/recipes-extended/shadow/shadow_4.20.4.bb
index 683a284aad..5725dd391c 100644
--- a/meta/recipes-extended/shadow/shadow_4.20.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.20.4.bb
@@ -14,7 +14,7 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
-           file://0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch \
+           file://login_defs_pam.sed \
            "
 
 SRC_URI:append:class-target = " \
@@ -24,7 +24,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://notallylog.patch \
            "
-SRC_URI[sha256sum] = "39006c9daf9228ddda9156605201fc9f59c43f9fdecc83c78bbe0e72d9ffd58c"
+SRC_URI[sha256sum] = "041728ec7eaf1c4d45b5a861ce28f66a42d156a6a04ae725336bf4c997b74885"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.47.1


--===============5802174430708966937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/shadow: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow: SRC_URI changed from "https://github.com/shadow-maint/shadow/releases/download/4.20.3/shadow-4.20.3.tar.gz file://pam.d/chfn file://pam.d/chpasswd file://pam.d/chsh file://pam.d/login file://pam.d/newusers file://pam.d/passwd file://pam.d/su file://useradd file://0001-lib-nscd.h-nscd_flush_cache-Fix-type-of-parameter.patch file://login_defs_pam.sed" to "https://github.com/shadow-maint/shadow/releases/download/4.20.4/shadow-4.20.4.tar.gz file://pam.d/chfn file://pam.d/chpasswd file://pam.d/chsh file://pam.d/login file://pam.d/newusers file://pam.d/passwd file://pam.d/su file://useradd file://login_defs_pam.sed file://login_defs_pam.sed"
packages/x86-64-v3-poky-linux/shadow/shadow-base: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-base: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-dbg: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-dbg: PKGSIZE changed from 7922200 to 7917848 (-0%)
packages/x86-64-v3-poky-linux/shadow/shadow-dbg: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-dev: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-dev: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-doc: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-doc: PKGSIZE changed from 275684 to 274878 (-0%)
packages/x86-64-v3-poky-linux/shadow/shadow-doc: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-bs: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-bs: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ca: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ca: PKGSIZE changed from 70829 to 70415 (-1%)
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ca: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-cs: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-cs: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-da: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-da: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-de: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-de: PKGSIZE changed from 79886 to 79411 (-1%)
packages/x86-64-v3-poky-linux/shadow/shadow-locale-de: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-dz: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-dz: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-el: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-el: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-es: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-es: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-eu: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-eu: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-fi: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-fi: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-fr: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-fr: PKGSIZE changed from 72315 to 71889 (-1%)
packages/x86-64-v3-poky-linux/shadow/shadow-locale-fr: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-gl: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-gl: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-he: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-he: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-hu: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-hu: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-id: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-id: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-it: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-it: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ja: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ja: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ka: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ka: PKGSIZE changed from 108071 to 107547 (-0%)
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ka: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-kk: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-kk: PKGSIZE changed from 92083 to 91619 (-1%)
packages/x86-64-v3-poky-linux/shadow/shadow-locale-kk: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-km: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-km: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ko: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ko: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-nb: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-nb: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ne: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ne: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-nl: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-nl: PKGSIZE changed from 76977 to 76539 (-1%)
packages/x86-64-v3-poky-linux/shadow/shadow-locale-nl: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-nn: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-nn: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-pl: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-pl: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-pt-br: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-pt-br: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-pt: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-pt: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ro: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ro: PKGSIZE changed from 80201 to 79739 (-1%)
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ro: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ru: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-ru: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-sk: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-sk: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-sq: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-sq: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-sv: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-sv: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-tl: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-tl: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-tr: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-tr: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-uk: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-uk: PKGSIZE changed from 95970 to 95413 (-1%)
packages/x86-64-v3-poky-linux/shadow/shadow-locale-uk: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-vi: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-vi: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-zh-cn: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-zh-cn: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-locale-zh-tw: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-locale-zh-tw: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-src: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-src: PKGSIZE changed from 1107046 to 1107095 (+0%)
packages/x86-64-v3-poky-linux/shadow/shadow-src: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow-src: FILELIST: directory renamed /usr/src/debug/shadow/4.20.3/lib/alloc -> /usr/src/debug/shadow/4.20.4/lib/alloc, directory renamed /usr/src/debug/shadow/4.20.3/lib/string/strcmp -> /usr/src/debug/shadow/4.20.4/lib/string/strcmp, directory renamed /usr/src/debug/shadow/4.20.3/lib/search/cmp -> /usr/src/debug/shadow/4.20.4/lib/search/cmp, directory renamed /usr/src/debug/shadow/4.20.3/lib/string/strdup -> /usr/src/debug/shadow/4.20.4/lib/string/strdup, directory renamed /usr/src/debug/shadow/4.20.3/lib/atoi/strtoi -> /usr/src/debug/shadow/4.20.4/lib/atoi/strtoi, directory renamed /usr/src/debug/shadow/4.20.3/lib/string/ctype -> /usr/src/debug/shadow/4.20.4/lib/string/ctype, directory renamed /usr/src/debug/shadow/4.20.3/libsubid -> /usr/src/debug/shadow/4.20.4/libsubid, directory renamed /usr/src/debug/shadow/4.20.3/lib/string/strcpy -> /usr/src/debug/shadow/4.20.4/lib/string/strcpy, directory renamed /usr/src/debug/shadow/4.20.3/lib/string
 /sprintf -> /usr/src/debug/shadow/4.20.4/lib/string/sprintf, directory renamed /usr/src/debug/shadow/4.20.3/lib/string/memset -> /usr/src/debug/shadow/4.20.4/lib/string/memset, directory renamed /usr/src/debug/shadow/4.20.3/lib/fs/mkstemp -> /usr/src/debug/shadow/4.20.4/lib/fs/mkstemp, directory renamed /usr/src/debug/shadow/4.20.3/lib/string/strspn -> /usr/src/debug/shadow/4.20.4/lib/string/strspn, directory renamed /usr/src/debug/shadow/4.20.3/lib/shadow/passwd -> /usr/src/debug/shadow/4.20.4/lib/shadow/passwd, directory renamed /usr/src/debug/shadow/4.20.3/lib/io -> /usr/src/debug/shadow/4.20.4/lib/io, directory renamed /usr/src/debug/shadow/4.20.3/lib/shadow/group -> /usr/src/debug/shadow/4.20.4/lib/shadow/group, directory renamed /usr/src/debug/shadow/4.20.3/lib -> /usr/src/debug/shadow/4.20.4/lib, directory renamed /usr/src/debug/shadow/4.20.3/lib/time -> /usr/src/debug/shadow/4.20.4/lib/time, directory renamed /usr/src/debug/shadow/4.20.3/lib/atoi -> /usr/src/debug/shadow/4.2
 0.4/lib/atoi, directory renamed /usr/src/debug/shadow/4.20.3/lib/shadow/gshadow -> /usr/src/debug/shadow/4.20.4/lib/shadow/gshadow, directory renamed /usr/src/debug/shadow/4.20.3/lib/string/strchr -> /usr/src/debug/shadow/4.20.4/lib/string/strchr, directory renamed /usr/src/debug/shadow/4.20.3/lib/io/fgets -> /usr/src/debug/shadow/4.20.4/lib/io/fgets, directory renamed /usr/src/debug/shadow/4.20.3/lib/fs/readlink -> /usr/src/debug/shadow/4.20.4/lib/fs/readlink, directory renamed /usr/src/debug/shadow/4.20.3/src -> /usr/src/debug/shadow/4.20.4/src, directory renamed /usr/src/debug/shadow/4.20.3/lib/string -> /usr/src/debug/shadow/4.20.4/lib/string, directory renamed /usr/src/debug/shadow/4.20.3/lib/shadow/grp -> /usr/src/debug/shadow/4.20.4/lib/shadow/grp, directory renamed /usr/src/debug/shadow/4.20.3/lib/search/sort -> /usr/src/debug/shadow/4.20.4/lib/search/sort, directory renamed /usr/src/debug/shadow/4.20.3/lib/search/l -> /usr/src/debug/shadow/4.20.4/lib/search/l, directory ren
 amed /usr/src/debug/shadow/4.20.3/lib/string/strtok -> /usr/src/debug/shadow/4.20.4/lib/string/strtok, directory renamed /usr/src/debug/shadow/4.20.3/lib/shadow/shadow -> /usr/src/debug/shadow/4.20.4/lib/shadow/shadow, added "/usr/src/debug/shadow/4.20.4/lib/fs/open/open.c /usr/src/debug/shadow/4.20.4/lib/fs/open/open.h"
packages/x86-64-v3-poky-linux/shadow/shadow-staticdev: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow-staticdev: PKGV changed from 4.20.3 [default] to 4.20.4 [default]
packages/x86-64-v3-poky-linux/shadow/shadow: PV changed from "4.20.3" to "4.20.4"
packages/x86-64-v3-poky-linux/shadow/shadow: PKGSIZE changed from 2144073 to 2148169 (+0%)
packages/x86-64-v3-poky-linux/shadow/shadow: PKGV changed from 4.20.3 [default] to 4.20.4 [default]

--===============5802174430708966937==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.20.3-4.20.4.patch"

RnJvbSBjZTcxNGE3MzJiNzUyMmU5ZjRkNzQ4ODA1OTE5M2Q1YTk5M2E0NjQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjMgTm92IDIwMjYgMDU6MjU6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkb3c6IHVwZ3JhZGUgNC4yMC4zIC0+IDQuMjAuNAoKLS0tCiAuLi5jZF9mbHVzaF9jYWNoZS1G
aXgtdHlwZS1vZi1wYXJhbWV0ZXIucGF0Y2ggfCAzMCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
c2hhZG93L2ZpbGVzL25vdGFsbHlsb2cucGF0Y2ggICAgICAgICAgICAgfCAgMiArLQogLi4uL3tz
aGFkb3dfNC4yMC4zLmJiID0+IHNoYWRvd180LjIwLjQuYmJ9ICAgIHwgIDQgKy0tCiAzIGZpbGVz
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy8wMDAxLWxpYi1uc2NkLmgt
bnNjZF9mbHVzaF9jYWNoZS1GaXgtdHlwZS1vZi1wYXJhbWV0ZXIucGF0Y2gKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3tzaGFkb3dfNC4yMC4zLmJiID0+IHNoYWRvd180LjIw
LjQuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9m
aWxlcy8wMDAxLWxpYi1uc2NkLmgtbnNjZF9mbHVzaF9jYWNoZS1GaXgtdHlwZS1vZi1wYXJhbWV0
ZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzLzAwMDEtbGliLW5z
Y2QuaC1uc2NkX2ZsdXNoX2NhY2hlLUZpeC10eXBlLW9mLXBhcmFtZXRlci5wYXRjaApkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTg3M2NkYWZmZC4uMDAwMDAwMDAwMAotLS0gYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzLzAwMDEtbGliLW5zY2QuaC1uc2NkX2ZsdXNo
X2NhY2hlLUZpeC10eXBlLW9mLXBhcmFtZXRlci5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDMw
ICswLDAgQEAKLUZyb20gYjhkMzU0OWE0OWFjZmU5NjdmNDVhZWJhZjA2ZDQ3NGM4MmM0NmQyMiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFsZWphbmRybyBDb2xvbWFyIDxhbHhAa2Vy
bmVsLm9yZz4KLURhdGU6IFdlZCwgMzAgU2VwIDIwMjYgMTk6MTI6MDEgKzAyMDAKLVN1YmplY3Q6
IFtQQVRDSF0gbGliL25zY2QuaDogbnNjZF9mbHVzaF9jYWNoZSgpOiBGaXggdHlwZSBvZiBwYXJh
bWV0ZXIKLQotRml4ZXM6IGRlZWY3ZDg0YzNlNCAoMjAyNi0wOS0wOTsgImxpYi9uc2NkLmg6IG5z
Y2RfZmx1c2hfY2FjaGUoKTogRGVmaW5lIGFzIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb24iKQotQ2xv
c2VzOiA8aHR0cHM6Ly9naXRodWIuY29tL3NoYWRvdy1tYWludC9zaGFkb3cvaXNzdWVzLzE3NjM+
Ci1SZXBvcnRlZC1ieTogPGh0dHBzOi8vZ2l0aHViLmNvbS9Cb25uaWV0d2luPgotVGVzdGVkLWJ5
OiA8aHR0cHM6Ly9naXRodWIuY29tL0Jvbm5pZXR3aW4+Ci1TaWduZWQtb2ZmLWJ5OiBBbGVqYW5k
cm8gQ29sb21hciA8YWx4QGtlcm5lbC5vcmc+Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQg
W2h0dHBzOi8vZ2l0aHViLmNvbS9zaGFkb3ctbWFpbnQvc2hhZG93L2NvbW1pdC9iOGQzNTQ5YTQ5
YWNmZTk2N2Y0NWFlYmFmMDZkNDc0YzgyYzQ2ZDIyXQotU2lnbmVkLW9mZi1ieTogSmFpcGF1bCBD
aGVlcm5hbSA8amFpcGF1bC5jaGVlcm5hbUBlc3QudGVjaD4KLS0tLQotIGxpYi9uc2NkLmggfCAy
ICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRp
ZmYgLS1naXQgYS9saWIvbnNjZC5oIGIvbGliL25zY2QuaAotaW5kZXggZmRhM2IxY2IuLjMwYjU2
NzIwIDEwMDY0NAotLS0tIGEvbGliL25zY2QuaAotKysrIGIvbGliL25zY2QuaAotQEAgLTgsNyAr
OCw3IEBACi0gZXh0ZXJuIGludCBuc2NkX2ZsdXNoX2NhY2hlIChjb25zdCBjaGFyICpzZXJ2aWNl
KTsKLSAjZWxzZQotIHN0YXRpYyBpbmxpbmUgaW50Ci0tbnNjZF9mbHVzaF9jYWNoZShNQVlCRV9V
TlVTRUQgaW50IF8xKQotK25zY2RfZmx1c2hfY2FjaGUoTUFZQkVfVU5VU0VEIGNvbnN0IGNoYXIg
Kl8xKQotIHsKLSAJcmV0dXJuIDA7Ci0gfQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3NoYWRvdy9maWxlcy9ub3RhbGx5bG9nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3NoYWRvdy9maWxlcy9ub3RhbGx5bG9nLnBhdGNoCmluZGV4IGIzYjMwMDI2Y2UuLjVhNTFkMDM2
OTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvbm90YWxs
eWxvZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL25vdGFs
bHlsb2cucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE3ZDQ1OTMzMTg2NzU0YTExOTA1MDli
NDZjNTFjNTZkNDgwODkwMDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDljYjViNDcw
YjNkNzA0ZGM2Yjk4N2E2N2QwOGE2MjJiNzk3MDIyMTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Zz4KIERhdGU6IFR1ZSwgMjEgQXByIDIwMjYgMTE6MzA6NTIgKzAxMDAKIFN1YmplY3Q6IFtQQVRD
SF0gc2hhZG93OiBEaXNhYmxlIHRhbGx5bG9nIGV4ZWN1dGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4yMC4zLmJiIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4yMC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMjAuMy5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4yMC40LmJiCmluZGV4
IDY4M2EyODRhYWQuLjU3MjVkZDM5MWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zaGFkb3cvc2hhZG93XzQuMjAuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hh
ZG93L3NoYWRvd180LjIwLjQuYmIKQEAgLTE0LDcgKzE0LDcgQEAgR0lUSFVCX0JBU0VfVVJJID0g
Imh0dHBzOi8vZ2l0aHViLmNvbS9zaGFkb3ctbWFpbnQvc2hhZG93L3JlbGVhc2VzIgogU1JDX1VS
SSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUH0udGFyLmd6IFwKICAg
ICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAncGFtJywgJyR7
UEFNX1NSQ19VUkl9JywgJycsIGQpfSBcCiAgICAgICAgICAgIGZpbGU6Ly91c2VyYWRkIFwKLSAg
ICAgICAgICAgZmlsZTovLzAwMDEtbGliLW5zY2QuaC1uc2NkX2ZsdXNoX2NhY2hlLUZpeC10eXBl
LW9mLXBhcmFtZXRlci5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9sb2dpbl9kZWZzX3BhbS5z
ZWQgXAogICAgICAgICAgICAiCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLXRhcmdldCA9ICIgXApA
QCAtMjQsNyArMjQsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiIFwKIFNSQ19V
Ukk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgXAogICAgICAgICAgICBmaWxlOi8vbm90YWxseWxv
Zy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzOTAwNmM5ZGFm
OTIyOGRkZGE5MTU2NjA1MjAxZmM5ZjU5YzQzZjlmZGVjYzgzYzc4YmJlMGU3MmQ5ZmZkNThjIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjA0MTcyOGVjN2VhZjFjNGQ0NWI1YTg2MWNlMjhmNjZhNDJk
MTU2YTZhMDRhZTcyNTMzNmJmNGM5OTdiNzQ4ODUiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJy
ZWxlYXNlcy90YWcvdj8oP1A8cHZlcj5cZCsoXC5cZCspKykkIgogCiAjIEFkZGl0aW9uYWwgUG9s
aWN5IGZpbGVzIGZvciBQQU0KLS0gCjIuNDcuMQoK

--===============5802174430708966937==--
