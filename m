Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8731.1793269813858591155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 03:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Xmb4nQ7n;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9053; q=dns/txt;
  s=iport01; t=1793269813; x=1794479413;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EbYqkTABKHSgV97/qNmsVJKkM3Wz0FvA5sPramM0R7E=;
  b=Xmb4nQ7nnGw5DQh0tkZm5Ocra+TrVgRjL1VOcTEcUvAkLqS+uFP9BCD+
   30VhACfOdgQ4hPqOcbyimhSC+lZkbMrwmp4uYbioJ2EY/XgUttCKSIa4E
   eYKO9v0BCvolvZDwJktvztsXyLqOg24ScYMhs/aiqDVZmVmgvs5M0z/Vk
   FzCqfB2JuSX5EL3X4KKg6shwEuD4cbHC35HNEwBgvtOW1hC+ne77G+exR
   XO+xaOc4Wr/KjsEj8I+LcgcZcdeVUjzdy71uR0yHrJmNgKRxLQpPmnBQ7
   fh1UW4OV4OZT0T7DSnKpr+V+Nfh6ElHFcWmheJdqxBLP5SpULh0Tq3e8s
   Q==;
X-CSE-ConnectionGUID: NHcnOr/NQICflBwmPHwDyA==
X-CSE-MsgGUID: KGw/fI/GT/mI5TwEP7n7hw==
X-IPAS-Result: =?us-ascii?q?A0AnAAAiH+Nq/5T/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJA4xviVmeH4F+DwEBAQ9EDQQBAYUFjh4CJjQJDgECBAMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEqCwEYAS0sAwECWiMhGoJoA?=
 =?us-ascii?q?YJ0AxG0TIF5M4EBgykBPwJDUNszAQsUAQWBMwGFP4gjXRgBhH0nGxuBcoEUA?=
 =?us-ascii?q?YE7gi6BBYFcAoIGhh8EgiJ6EoFaHoYyhl4Ch1NIgR4DWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQcbBgWBHYEegRmBB12BKylgASGBCIF2AoJRggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJCIIEgkBExouC4EaNTwJJkEVDGQLGgViCAINDHY5EDEgJjIEA?=
 =?us-ascii?q?x0YDUgRLDcVGQQ+bgeRXYMHB1MoEwETGIERVwEUAQ8fHJMbCJAWgiGhDwoog?=
 =?us-ascii?q?3aMIpU6GjOqbwuYfY4KiRCMQ32EaYFoPIFZcBWDIglKGQ+OLgsLg2AzhB1Dy?=
 =?us-ascii?q?UcnMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:B5SjdarhEJPd4pzgNvMqyxsAh2FeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnSOf2ONzSmL98gat7k9BgGucDcnYc1TFBl+Hg0FiNBouPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8kI35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sBXCmdp7
 7s+EREmYBSpmOeO4K2XW8A506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHWHJgMxxbB/
 Qoq+UzaLQ5dOv3Y5gbC91PxuvDipXz9B4INQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWja1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:dO0CGa9gm0ruz3GWMJtuk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3AobscS2lATluY15NMzSCGJIeIxLXXOVv9x3H3OQi?=
 =?us-ascii?q?eMEdCRrm/Vlqo2LxIguM7zg=3D=3D?=
X-Talos-MUID: 9a23:jbVLjQRdS7PXm3cFRXTPqy4lOuYvzJjpDWFQrYorg5aCaixvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,184,1787011200"; 
   d="scan'208";a="541511813"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Oct 2026 10:30:12 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id C951018000173;
	Thu, 29 Oct 2026 10:30:12 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 719CBCC1611; Thu, 29 Oct 2026 03:30:12 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH v2 1/3] lrzsz: fix CVE-2026-105841
Date: Thu, 29 Oct 2026 03:30:10 -0700
Message-Id: <20261029103012.2335950-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 10:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248930
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

When invoked under a suffixed name such as lrztar, lrz passes
sender-controlled filenames to popen() without shell escaping.
A malicious sender can use this to execute commands with the
receiving user's privileges.
Backport upstream commit [1], which removes this pipe-execution
mode, addressing the vulnerability described in [2].

[1] https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359aec96121215bd
[2] https://security-tracker.debian.org/tracker/CVE-2026-105841

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2:
- corrected the advisory reference in commit messsage
---
 .../lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch | 267 ++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |   1 +
 2 files changed, 268 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch
new file mode 100644
index 00000000000..268218fb8a6
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch
@@ -0,0 +1,267 @@
+From 9eef71ce20fda2b345ef8431359aec96121215bd Mon Sep 17 00:00:00 2001
+From: Uwe Ohse at akiar <uwe@ohse.de>
+Date: Mon, 10 Aug 2026 17:55:28 +0200
+Subject: [PATCH] remove topipe 'feature'
+
+CVE: CVE-2026-105841
+Upstream-Status: Backport [https://github.com/UweOhse/lrzsz/commit/9eef71ce20fda2b345ef8431359aec96121215bd]
+
+Backport Changes:
+- Retained sys2() and exec2() and their declarations because 0.12.20
+  still calls them in its separate, opt-in ZCOMMAND handling. Removing
+  them as upstream does causes undefined references when linking lrz.
+- Omitted NEWS because its 0.13.0 release-note hunk conflicts with the
+  0.12.20 release history and is not needed for the security fix.
+
+(cherry picked from commit 9eef71ce20fda2b345ef8431359aec96121215bd)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/lrz.c | 193 ++++++++++++++++++++++--------------------------------
+ 1 file changed, 79 insertions(+), 114 deletions(-)
+
+diff --git a/src/lrz.c b/src/lrz.c
+index ae3c62d..9c08a3d 100644
+--- a/src/lrz.c
++++ b/src/lrz.c
+@@ -76,7 +76,6 @@ int skip_if_not_found;
+ char *Pathname;
+ const char *program_name;		/* the name by which we were called */
+ 
+-int Topipe=0;
+ int MakeLCPathname=TRUE;	/* make received pathname lower case */
+ int Verbose=0;
+ int Quiet=0;		/* overrides logic that would otherwise set verbose */
+@@ -803,9 +802,6 @@ fubar:
+ 			shortname ? shortname : "no.name", protname());
+ #endif
+ 	canit(STDOUT_FILENO);
+-	if (Topipe && fout) {
+-		pclose(fout);  return ERROR;
+-	}
+ 	if (fout)
+ 		fclose(fout);
+ 
+@@ -1286,111 +1282,89 @@ procheader(char *name, struct zm_fileinfo *zi)
+ 	if (!zmodem_requested && MakeLCPathname && !IsAnyLower(name_static)
+ 	  && !(zi->mode&UNIXFILE))
+ 		uncaps(name_static);
+-	if (Topipe > 0) {
+-		if (Pathname)
+-			free(Pathname);
+-		Pathname=malloc((PATH_MAX)*2);
+-		if (!Pathname)
+-			error(1,0,_("out of memory"));
+-		sprintf(Pathname, "%s %s", program_name+2, name_static);
+-		if (Verbose) {
+-			vstringf("%s: %s %s\n",
+-				_("Topipe"),
+-				Pathname, Thisbinary?"BIN":"ASCII");
+-		}
+-		if ((fout=popen(Pathname, "w")) == NULL)
+-			return ERROR;
+-	} else {
+-		if (protocol==ZM_XMODEM)
+-			/* we don't have the filename yet */
+-			return OK; /* dummy */
+-		if (Pathname)
+-			free(Pathname);
+-		Pathname=malloc((PATH_MAX)*2);
+-		if (!Pathname)
+-			error(1,0,_("out of memory"));
+-		strcpy(Pathname, name_static);
+-		if (Verbose) {
+-			/* overwrite the "waiting to receive" line */
+-			vstring("\r                                                                     \r");
+-			vstringf(_("Receiving: %s\n"), name_static);
+-		}
+-		checkpath(name_static);
+-		if (Nflag)
+-		{
+-			/* cast because we might not have a prototyp for strdup :-/ */
+-			free(name_static);
+-			name_static=(char *) strdup("/dev/null");
+-			if (!name_static)
+-			{
+-				fprintf(stderr,"%s: %s\n", program_name, _("out of memory"));
+-				exit(1);
+-			}
+-		}
+-#ifdef OMEN
+-		/* looks like a security hole -- uwe */
+-		if (name_static[0] == '!' || name_static[0] == '|') {
+-			if ( !(fout = popen(name_static+1, "w"))) {
+-				return ERROR;
+-			}
+-			Topipe = -1;  return(OK);
+-		}
+-#endif
+-		if (Thisbinary && zconv==ZCRESUM) {
+-			struct stat st;
+-			fout = fopen(name_static, "r+");
+-			if (fout && 0==fstat(fileno(fout),&st))
+-			{
+-				int can_resume=TRUE;
+-				if (zmanag==ZF1_ZMCRC) {
+-					int r=do_crc_check(fout,zi->bytes_total,st.st_size);
+-					if (r==ERROR) {
+-						fclose(fout);
+-						return ZFERR;
+-					}
+-					if (r==ZCRC_DIFFERS) {
+-						can_resume=FALSE;
+-					}
+-				}
+-				if ((unsigned long)st.st_size > zi->bytes_total) {
+-					can_resume=FALSE;
+-				}
+-				/* retransfer whole blocks */
+-				zi->bytes_skipped = st.st_size & ~(1023);
+-				if (can_resume) {
+-					if (fseek(fout, (long) zi->bytes_skipped, SEEK_SET)) {
+-						fclose(fout);
+-						return ZFERR;
+-					}
+-				}
+-				else
+-					zi->bytes_skipped=0; /* resume impossible, file has changed */
+-				goto buffer_it;
+-			}
+-			zi->bytes_skipped=0;
+-			if (fout)
+-				fclose(fout);
+-		}
+-		fout = fopen(name_static, openmode);
++
++        if (protocol==ZM_XMODEM)
++                /* we don't have the filename yet */
++                return OK; /* dummy */
++        if (Pathname)
++                free(Pathname);
++        Pathname=malloc((PATH_MAX)*2);
++        if (!Pathname)
++                error(1,0,_("out of memory"));
++        strcpy(Pathname, name_static);
++        if (Verbose) {
++                /* overwrite the "waiting to receive" line */
++                vstring("\r                                                                     \r");
++                vstringf(_("Receiving: %s\n"), name_static);
++        }
++        checkpath(name_static);
++        if (Nflag)
++        {
++                /* cast because we might not have a prototyp for strdup :-/ */
++                free(name_static);
++                name_static=(char *) strdup("/dev/null");
++                if (!name_static)
++                {
++                        fprintf(stderr,"%s: %s\n", program_name, _("out of memory"));
++                        exit(1);
++                }
++        }
++
++        if (Thisbinary && zconv==ZCRESUM) {
++                struct stat st;
++                fout = fopen(name_static, "r+");
++                if (fout && 0==fstat(fileno(fout),&st))
++                {
++                        int can_resume=TRUE;
++                        if (zmanag==ZF1_ZMCRC) {
++                                int r=do_crc_check(fout,zi->bytes_total,st.st_size);
++                                if (r==ERROR) {
++                                        fclose(fout);
++                                        return ZFERR;
++                                }
++                                if (r==ZCRC_DIFFERS) {
++                                        can_resume=FALSE;
++                                }
++                        }
++                        if ((unsigned long)st.st_size > zi->bytes_total) {
++                                can_resume=FALSE;
++                        }
++                        /* retransfer whole blocks */
++                        zi->bytes_skipped = st.st_size & ~(1023);
++                        if (can_resume) {
++                                if (fseek(fout, (long) zi->bytes_skipped, SEEK_SET)) {
++                                        fclose(fout);
++                                        return ZFERR;
++                                }
++                        }
++                        else
++                                zi->bytes_skipped=0; /* resume impossible, file has changed */
++                        goto buffer_it;
++                }
++                zi->bytes_skipped=0;
++                if (fout)
++                        fclose(fout);
++        }
++        fout = fopen(name_static, openmode);
+ #ifdef ENABLE_MKDIR
+-		if ( !fout && Restricted < 2) {
+-			if (make_dirs(name_static))
+-				fout = fopen(name_static, openmode);
+-		}
++        if ( !fout && Restricted < 2) {
++                if (make_dirs(name_static))
++                        fout = fopen(name_static, openmode);
++        }
+ #endif
+-		if ( !fout)
+-		{
++        if ( !fout)
++        {
+ #ifdef ENABLE_SYSLOG
+-			int e=errno;
++                int e=errno;
+ #endif
+-			zpfatal(_("cannot open %s"), name_static);
+-			DO_SYSLOG((LOG_ERR,"%s: cannot open: %s",
+-				protname(),strerror(e)));
+-			return ERROR;
+-		}
+-	}
++                zpfatal(_("cannot open %s"), name_static);
++                DO_SYSLOG((LOG_ERR,"%s: cannot open: %s",
++                        protname(),strerror(e)));
++                return ERROR;
++        }
++
+ buffer_it:
+-	if (Topipe == 0) {
++	{
+ 		static char *s=NULL;
+ 		static size_t last_length=0;
+ #if defined(F_GETFD) && defined(F_SETFD) && defined(O_SYNC)
+@@ -1550,8 +1524,7 @@ report(int sct)
+ }
+ 
+ /*
+- * If called as [-][dir/../]vrzCOMMAND set Verbose to 1
+- * If called as [-][dir/../]rzCOMMAND set the pipe flag
++ * If called as [-][dir/../]vrz set Verbose to 1
+  * If called as rb use YMODEM protocol
+  */
+ static void
+@@ -1576,8 +1549,6 @@ chkinvok(const char *s)
+ 		protocol=ZM_XMODEM;
+ 	if (s[0]=='r' && (s[1]=='b' || s[1]=='y'))
+ 		protocol=ZM_YMODEM;
+-	if (s[2] && protocol!=ZM_XMODEM)
+-		Topipe = 1;
+ }
+ 
+ /*
+@@ -2207,12 +2178,6 @@ static int
+ closeit(struct zm_fileinfo *zi)
+ {
+ 	int ret;
+-	if (Topipe) {
+-		if (pclose(fout)) {
+-			return ERROR;
+-		}
+-		return OK;
+-	}
+ 	if (in_tcpsync) {
+ 		rewind(fout);
+ 		if (!fgets(tcp_buf,sizeof(tcp_buf),fout)) {
+-- 
+2.35.6
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 042cf7fbaca..403266743e0 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://0001-Fix-cross-compilation-using-autoconf-detected-AR.patch \
            file://0001-Fix-build-with-GCC-15.patch \
            file://0001-lrzsz-convert-K-R-function-definitions-to-ANSI-C-pro.patch \
+           file://CVE-2026-105841.patch \
            "
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
 
-- 
2.35.6

