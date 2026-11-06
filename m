Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2432.1793956886987921934
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 01:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HYVjTTl1;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8902; q=dns/txt;
  s=iport01; t=1793956887; x=1795166487;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UbZ3GKT4skvr+Ddhxqmw7baSV3a2OZLyHS4iK0kH5/A=;
  b=HYVjTTl1ngZAlDI4tgcrtxAr1taWVWEu1ux/owSWEtRFE2VV3zqxt76m
   /OsQB/yX6y3vbiQxBpWauNWy98T3JnzArU3v+1IUqi84kq34EmX61qgNH
   P/2h7DXotmmjlm/Yn2swMibbUirFSb8EtxJzd7nASXqbJGn1MGNdlnpZZ
   S5JaF1d4z904RKooO/ER4lIp6TG/A3meCnSS4iySvkFn4ZbNqImbbOnbQ
   2qeXlkIYAUHt5YlBviJJN0wrNEDGEeqL7X5D02DsykpmLOUM33ZmztTMy
   gZXIgwmZLkyGYWtEsiasLvJ0MTFclGm16qb/l7WcKjy9P1SpGlS3YWeBD
   g==;
X-CSE-ConnectionGUID: cIqM5FPkSZ+hx2KTTiNzjg==
X-CSE-MsgGUID: vb7ndh2FQRGDGHt01mqjXw==
X-IPAS-Result: =?us-ascii?q?A0BFAgDpmu1q/4r/Ja1aHgEBCxIMggULgld1YENJA5Qng?=
 =?us-ascii?q?iGeJIF+DwEBAQ9EDQQBAYUFjh8CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBLQsBGAFZAwECWiMhGoJoAYJ0AxG8KoF5M4EBg?=
 =?us-ascii?q?ykBPwJDUNszAQsUAYE4hUCII10YAYR9JxsbgXKBFAGBO4IugQWBXAKCBoYgB?=
 =?us-ascii?q?IIiehKBWh6GIoZYAoFRhnlIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QcbBgWBHYEegRKBB12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZAsaBWEIAg0MdDkQMB4kLwUcJj4bCi8YDUgRLDcVG?=
 =?us-ascii?q?QQ+bgeSPYMLB1MoEwETGIERVwEUAQ8fHJMbCJAWgiGhEQoog3iMJJU6GjOqc?=
 =?us-ascii?q?QuYfY4KiRGMQ32EaYFoPIFZcBWDIglKGQ+OLgsLg2AzhB1DxmUmMgIJAy8BA?=
 =?us-ascii?q?QcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:GIvmw6gXUmS4FWdTInNtuPmHX161NhEKZh0ujC45NGQN5FlHY01je
 htvCGuGaPrcZWD3LtklO9nj9kwH7JXUx9dhSAU9qC5nFiJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvre8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUT2/9SXE929
 scqazAdNDO/u+OQ0rC0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQd/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIJoHRHJkMxx3wS
 mTu4W6mBB0abvKm8xWp3VKw3rbKhCHLR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:xcXm16qw0TvMy5g0jkpXJPQaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3AbeO2rWjAw1cwXlc3QOfeR9ilqjJueVzE6Sr+G0y?=
 =?us-ascii?q?DOyVpWOe2dWOR3rFmnJ87?=
X-Talos-MUID: 9a23:xE5gxAXxgQT5oEPq/CHm2zduNJ1G2p6BJG8tjc1fvtCGBTMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545314113"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 09:21:26 +0000
Received: from sjc-ads-7857.cisco.com (sjc-ads-7857.cisco.com [10.30.222.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 8312F180001F2
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 09:21:25 +0000 (GMT)
Received: by sjc-ads-7857.cisco.com (Postfix, from userid 1887505)
	id 293EFCC161E; Fri,  6 Nov 2026 01:21:25 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH  1/3] lrzsz: fix CVE-2026-105841
Date: Fri,  6 Nov 2026 01:21:23 -0800
Message-Id: <20261106092125.2587191-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7857.cisco.com [10.30.222.144];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.222.144, sjc-ads-7857.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249626
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
 .../lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch | 266 ++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |   1 +
 2 files changed, 267 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch
new file mode 100644
index 0000000000..000cb9b832
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105841.patch
@@ -0,0 +1,266 @@
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
index 042cf7fbac..403266743e 100644
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

