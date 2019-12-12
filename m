Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 525017FC22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:15:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z3so3806155wru.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ClbJyeXHKYBlVmcrvge2CswoUo+Y0JlNUT3R+ZIxfQs=;
	b=K9RWxB17vtXMXaXvXCH9+znEJfj6SFQYDTqEnal4hWA29NPfkNtVUV/EHNFASuDHgt
	P8B0eh9DKQ2tiOgb75tOipULeyOKbYyajZoWIyyHwdQKLE0u3xjzrNIOTHh5t1vgj9pE
	bNMJM+YIlR6i8tR1DBpvosqB5ntedlQ+2k+Vs29E6AxOx+9f65UD+mjOOyno5N6KK9zO
	lqZIrgS2+3Rhwk7ijh38aDTBKURbZtsiFUS8/0ZGQbTlIhU22mUciUWhiByPTGgi3QP9
	NE/p+uo8I5K58HgqOBS7j0j8PrbZN+vxQH1N7lCwdGqfpsfhLGNcFPRovZVNFA8xHMeG
	UoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ClbJyeXHKYBlVmcrvge2CswoUo+Y0JlNUT3R+ZIxfQs=;
	b=NI42R3CkzNkHunqRpiK3JUN1quMl6A6nJp7TYH96S02hUP0QH1mq+gXW61iUkQDDQb
	bWJgnwIpt8HeyN29fPpzuIvclIg5PA6opqOoJQQAIwzI06MZqcye4eXe4Qniud39DQ3+
	yfWj/X35aGMFNzhxGMjjgYVGbBYNW+C4aX/jBlpqoYq6rd/k28/icIdUA2o2d/wsalmf
	n5zNnw1mNJRGZ8euHcmWLiNYhLvLzcmpAGXfoVjLveQUsD3B4p1en451JMcXKIWQh/D5
	i9hYyiQzDbVaiQgLIzqBSXf0LJfFQdEEKwiYs9/yJBt8uYk2yP7FrUTG095TjwQYM7SK
	Z61w==
X-Gm-Message-State: APjAAAX5aptp3HexdQYYZxDNarD7P6YPVQn4LfhzAH2zOivar4F1mNbk
	LdO3IMP35u/Y5/5mfrZLoSwHNALA
X-Google-Smtp-Source: APXvYqy12SyVSs5vggnWf9Mien8xekhrUZF8FSYFshsxgcRIsDjK+Fxsiw157oFIeMOymCsXWPYVfw==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr8298929wrr.82.1576174510539;
	Thu, 12 Dec 2019 10:15:10 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.15.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:15:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:35 +0100
Message-Id: <20191212181436.1322-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 29/30] nfs-utils: update to 2.4.2
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
X-List-Received-Date: Thu, 12 Dec 2019 18:15:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop backports, and a musl patch that is no longer needed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...de-order-between-config.h-and-stat.h.patch | 156 ---------------
 .../nfs-utils/clang-format-string.patch       | 183 ------------------
 .../nfs-utils-musl-res_querydomain.patch      |  46 -----
 ...{nfs-utils_2.4.1.bb => nfs-utils_2.4.2.bb} |   9 +-
 4 files changed, 3 insertions(+), 391 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-include-order-between-config.h-and-stat.h.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/clang-format-string.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.4.1.bb => nfs-utils_2.4.2.bb} (94%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-include-order-between-config.h-and-stat.h.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-include-order-between-config.h-and-stat.h.patch
deleted file mode 100644
index 7b0f93535f9..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-include-order-between-config.h-and-stat.h.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From 2fbc62e2a13fc22b6ae4910e295a2c10fb790486 Mon Sep 17 00:00:00 2001
-From: Zoltan Karcagi <zkr7432@gmail.com>
-Date: Mon, 12 Aug 2019 13:27:16 -0400
-Subject: [PATCH] Fix include order between config.h and stat.h
-
-At least on Arch linux ARM, the definition of struct stat in stat.h depends
-on __USE_FILE_OFFSET64. This symbol comes from config.h when defined,
-therefore config.h must always be included before stat.h. Fix all
-occurrences where the order is wrong by moving config.h to the top.
-
-This fixes the client side error "Stale file handle" when mounting from
-a server running Arch Linux ARM.
-
-Signed-off-by: Zoltan Karcagi <zkr7432@gmail.com>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-
-Upstream-Status: Backport
-[http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=2fbc62e2a13fc22b6ae4910e295a2c10fb790486]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- support/misc/nfsd_path.c         | 5 ++++-
- support/misc/xstat.c             | 5 ++++-
- support/nfs/conffile.c           | 8 +++++++-
- utils/blkmapd/device-discovery.c | 8 ++++----
- utils/idmapd/idmapd.c            | 8 ++++----
- 5 files changed, 23 insertions(+), 11 deletions(-)
-
-diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
-index 84e4802..f078a66 100644
---- a/support/misc/nfsd_path.c
-+++ b/support/misc/nfsd_path.c
-@@ -1,3 +1,7 @@
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
-+
- #include <errno.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-@@ -5,7 +9,6 @@
- #include <stdlib.h>
- #include <unistd.h>
- 
--#include "config.h"
- #include "conffile.h"
- #include "xmalloc.h"
- #include "xlog.h"
-diff --git a/support/misc/xstat.c b/support/misc/xstat.c
-index fa04788..4c997ee 100644
---- a/support/misc/xstat.c
-+++ b/support/misc/xstat.c
-@@ -1,3 +1,7 @@
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
-+
- #include <errno.h>
- #include <sys/types.h>
- #include <fcntl.h>
-@@ -5,7 +9,6 @@
- #include <sys/sysmacros.h>
- #include <unistd.h>
- 
--#include "config.h"
- #include "xstat.h"
- 
- #ifdef HAVE_FSTATAT
-diff --git a/support/nfs/conffile.c b/support/nfs/conffile.c
-index b6400be..6ba8a35 100644
---- a/support/nfs/conffile.c
-+++ b/support/nfs/conffile.c
-@@ -500,7 +500,7 @@ conf_readfile(const char *path)
- 
- 	if ((stat (path, &sb) == 0) || (errno != ENOENT)) {
- 		char *new_conf_addr = NULL;
--		size_t sz = sb.st_size;
-+		off_t sz;
- 		int fd = open (path, O_RDONLY, 0);
- 
- 		if (fd == -1) {
-@@ -517,6 +517,11 @@ conf_readfile(const char *path)
- 
- 		/* only after we have the lock, check the file size ready to read it */
- 		sz = lseek(fd, 0, SEEK_END);
-+		if (sz < 0) {
-+			xlog_warn("conf_readfile: unable to determine file size: %s",
-+				  strerror(errno));
-+			goto fail;
-+		}
- 		lseek(fd, 0, SEEK_SET);
- 
- 		new_conf_addr = malloc(sz+1);
-@@ -2162,6 +2167,7 @@ conf_write(const char *filename, const char *section, const char *arg,
- 	ret = 0;
- 
- cleanup:
-+	flush_outqueue(&inqueue, NULL);
- 	flush_outqueue(&outqueue, NULL);
- 
- 	if (buff)
-diff --git a/utils/blkmapd/device-discovery.c b/utils/blkmapd/device-discovery.c
-index e811703..f5f9b10 100644
---- a/utils/blkmapd/device-discovery.c
-+++ b/utils/blkmapd/device-discovery.c
-@@ -26,6 +26,10 @@
-  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
- 
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif /* HAVE_CONFIG_H */
-+
- #include <sys/sysmacros.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-@@ -51,10 +55,6 @@
- #include <errno.h>
- #include <libdevmapper.h>
- 
--#ifdef HAVE_CONFIG_H
--#include "config.h"
--#endif /* HAVE_CONFIG_H */
--
- #include "device-discovery.h"
- #include "xcommon.h"
- #include "nfslib.h"
-diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
-index 62e37b8..267acea 100644
---- a/utils/idmapd/idmapd.c
-+++ b/utils/idmapd/idmapd.c
-@@ -34,6 +34,10 @@
-  *  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
- 
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif /* HAVE_CONFIG_H */
-+
- #include <sys/types.h>
- #include <sys/time.h>
- #include <sys/inotify.h>
-@@ -62,10 +66,6 @@
- #include <libgen.h>
- #include <nfsidmap.h>
- 
--#ifdef HAVE_CONFIG_H
--#include "config.h"
--#endif /* HAVE_CONFIG_H */
--
- #include "xlog.h"
- #include "conffile.h"
- #include "queue.h"
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-format-string.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-format-string.patch
deleted file mode 100644
index 1d693e4142a..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-format-string.patch
+++ /dev/null
@@ -1,183 +0,0 @@
-Clang comes up with more printf format warnings
-Correcting “format string is not a string literal” warning
-requires us to declare that parameter is a printf style 
-format using the attribute flag
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: nfs-utils-2.3.3/support/include/xcommon.h
-===================================================================
---- nfs-utils-2.3.3.orig/support/include/xcommon.h
-+++ nfs-utils-2.3.3/support/include/xcommon.h
-@@ -27,7 +27,7 @@
- 
- /* Functions in sundries.c that are used in mount.c and umount.c  */ 
- char *canonicalize (const char *path);
--void nfs_error (const char *fmt, ...);
-+void nfs_error (const char *fmt, ...) __attribute__((__format__ (__printf__, 1, 2)));
- void *xmalloc (size_t size);
- void *xrealloc(void *p, size_t size);
- void xfree(void *);
-@@ -36,9 +36,9 @@ char *xstrndup (const char *s, int n);
- char *xstrconcat2 (const char *, const char *);
- char *xstrconcat3 (const char *, const char *, const char *);
- char *xstrconcat4 (const char *, const char *, const char *, const char *);
--void die (int errcode, const char *fmt, ...);
-+void die (int errcode, const char *fmt, ...) __attribute__((__format__ (__printf__, 2, 3)));
- 
--extern void die(int err, const char *fmt, ...);
-+extern void die(int err, const char *fmt, ...) __attribute__((__format__ (__printf__, 2, 3)));
- extern void (*at_die)(void);
- 
- /* exit status - bits below are ORed */
-Index: nfs-utils-2.3.3/support/include/xlog.h
-===================================================================
---- nfs-utils-2.3.3.orig/support/include/xlog.h
-+++ nfs-utils-2.3.3/support/include/xlog.h
-@@ -43,10 +43,10 @@ void			xlog_config(int fac, int on);
- void			xlog_sconfig(char *, int on);
- void			xlog_from_conffile(char *);
- int			xlog_enabled(int fac);
--void			xlog(int fac, const char *fmt, ...);
--void			xlog_warn(const char *fmt, ...);
--void			xlog_err(const char *fmt, ...);
--void			xlog_errno(int err, const char *fmt, ...);
--void			xlog_backend(int fac, const char *fmt, va_list args);
-+void			xlog(int fac, const char *fmt, ...) __attribute__((__format__ (__printf__, 2, 3)));
-+void			xlog_warn(const char *fmt, ...) __attribute__((__format__ (__printf__, 1, 2)));
-+void			xlog_err(const char *fmt, ...) __attribute__((__format__ (__printf__, 1, 2)));
-+void			xlog_errno(int err, const char *fmt, ...) __attribute__((__format__ (__printf__, 2, 3)));
-+void			xlog_backend(int fac, const char *fmt, va_list args) __attribute__((__format__ (__printf__, 2, 0)));
- 
- #endif /* XLOG_H */
-Index: nfs-utils-2.3.3/support/nfs/xcommon.c
-===================================================================
---- nfs-utils-2.3.3.orig/support/nfs/xcommon.c
-+++ nfs-utils-2.3.3/support/nfs/xcommon.c
-@@ -93,7 +93,10 @@ nfs_error (const char *fmt, ...) {
- 
-      fmt2 = xstrconcat2 (fmt, "\n");
-      va_start (args, fmt);
-+#pragma clang diagnostic push
-+#pragma clang diagnostic ignored "-Wformat-nonliteral"
-      vfprintf (stderr, fmt2, args);
-+#pragma clang diagnostic pop
-      va_end (args);
-      free (fmt2);
- }
-Index: nfs-utils-2.3.3/utils/exportfs/exportfs.c
-===================================================================
---- nfs-utils-2.3.3.orig/utils/exportfs/exportfs.c
-+++ nfs-utils-2.3.3/utils/exportfs/exportfs.c
-@@ -644,6 +644,7 @@ out:
- 	return result;
- }
- 
-+__attribute__((__format__ (__printf__, 2, 3)))
- static char
- dumpopt(char c, char *fmt, ...)
- {
-Index: nfs-utils-2.3.3/utils/statd/statd.c
-===================================================================
---- nfs-utils-2.3.3.orig/utils/statd/statd.c
-+++ nfs-utils-2.3.3/utils/statd/statd.c
-@@ -136,7 +136,7 @@ static void log_modes(void)
- 	strcat(buf, "TI-RPC ");
- #endif
- 
--	xlog_warn(buf);
-+	xlog_warn("%s", buf);
- }
- 
- /*
-Index: nfs-utils-2.3.3/support/nfs/svc_create.c
-===================================================================
---- nfs-utils-2.3.3.orig/support/nfs/svc_create.c
-+++ nfs-utils-2.3.3/support/nfs/svc_create.c
-@@ -184,7 +184,7 @@ svc_create_sock(const struct sockaddr *s
- 		type = SOCK_STREAM;
- 		break;
- 	default:
--		xlog(D_GENERAL, "%s: Unrecognized bind address semantics: %u",
-+		xlog(D_GENERAL, "%s: Unrecognized bind address semantics: %lu",
- 			__func__, nconf->nc_semantics);
- 		return -1;
- 	}
-Index: nfs-utils-2.3.3/support/nsm/rpc.c
-===================================================================
---- nfs-utils-2.3.3.orig/support/nsm/rpc.c
-+++ nfs-utils-2.3.3/support/nsm/rpc.c
-@@ -182,7 +182,7 @@ nsm_xmit_getport(const int sock, const s
- 	uint32_t xid;
- 	XDR xdr;
- 
--	xlog(D_CALL, "Sending PMAP_GETPORT for %u, %u, udp", program, version);
-+	xlog(D_CALL, "Sending PMAP_GETPORT for %lu, %lu, udp", program, version);
- 
- 	nsm_init_xdrmem(msgbuf, NSM_MAXMSGSIZE, &xdr);
- 	xid = nsm_init_rpc_header(PMAPPROG, PMAPVERS,
-Index: nfs-utils-2.3.3/utils/mountd/cache.c
-===================================================================
---- nfs-utils-2.3.3.orig/utils/mountd/cache.c
-+++ nfs-utils-2.3.3/utils/mountd/cache.c
-@@ -968,8 +968,7 @@ lookup_export(char *dom, char *path, str
- 			} else if (found_type == i && found->m_warned == 0) {
- 				xlog(L_WARNING, "%s exported to both %s and %s, "
- 				     "arbitrarily choosing options from first",
--				     path, found->m_client->m_hostname, exp->m_client->m_hostname,
--				     dom);
-+				     path, found->m_client->m_hostname, exp->m_client->m_hostname);
- 				found->m_warned = 1;
- 			}
- 		}
-Index: nfs-utils-2.3.3/utils/mountd/mountd.c
-===================================================================
---- nfs-utils-2.3.3.orig/utils/mountd/mountd.c
-+++ nfs-utils-2.3.3/utils/mountd/mountd.c
-@@ -213,7 +213,7 @@ static void
- sig_hup (int sig)
- {
- 	/* don't exit on SIGHUP */
--	xlog (L_NOTICE, "Received SIGHUP... Ignoring.\n", sig);
-+	xlog (L_NOTICE, "Received SIGHUP(%d)... Ignoring.\n", sig);
- 	return;
- }
- 
-Index: nfs-utils-2.3.3/utils/statd/rmtcall.c
-===================================================================
---- nfs-utils-2.3.3.orig/utils/statd/rmtcall.c
-+++ nfs-utils-2.3.3/utils/statd/rmtcall.c
-@@ -247,7 +247,7 @@ process_reply(FD_SET_TYPE *rfds)
- 		xlog_warn("%s: service %d not registered on localhost",
- 			__func__, NL_MY_PROG(lp));
- 	} else {
--		xlog(D_GENERAL, "%s: Callback to %s (for %d) succeeded",
-+		xlog(D_GENERAL, "%s: Callback to %s (for %s) succeeded",
- 			__func__, NL_MY_NAME(lp), NL_MON_NAME(lp));
- 	}
- 	nlist_free(&notify, lp);
-Index: nfs-utils-2.3.3/utils/statd/svc_run.c
-===================================================================
---- nfs-utils-2.3.3.orig/utils/statd/svc_run.c
-+++ nfs-utils-2.3.3/utils/statd/svc_run.c
-@@ -53,6 +53,7 @@
- 
- #include <errno.h>
- #include <time.h>
-+#include <inttypes.h>
- #include "statd.h"
- #include "notlist.h"
- 
-@@ -104,8 +105,8 @@ my_svc_run(int sockfd)
- 
- 			tv.tv_sec  = NL_WHEN(notify) - now;
- 			tv.tv_usec = 0;
--			xlog(D_GENERAL, "Waiting for reply... (timeo %d)",
--							tv.tv_sec);
-+			xlog(D_GENERAL, "Waiting for reply... (timeo %jd)",
-+							(intmax_t)tv.tv_sec);
- 			selret = select(FD_SETSIZE, &readfds,
- 				(void *) 0, (void *) 0, &tv);
- 		} else {
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
deleted file mode 100644
index 921f5edc82f..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From caa19231196d73541445728e6813c8fa70345acb Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 26 Jun 2018 15:59:00 +0800
-Subject: [PATCH] nfs-utils: 2.1.1 -> 2.3.1
-
-Fixed:
-configure: error: res_querydomain needed
-
-Upstream-Status: Pending [https://github.com/alpinelinux/aports/blob/master/main/nfs-utils/musl-configure_ac.patch]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- configure.ac | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 50002b4..dcadb23 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -582,10 +582,10 @@ my_am_cflags="\
-  -Wall \
-  -Wextra \
-  $rpcgen_cflags \
-- -Werror=missing-prototypes \
-- -Werror=missing-declarations \
-+ -Wmissing-prototypes \
-+ -Wmissing-declarations \
-  -Werror=format=2 \
-- -Werror=undef \
-+ -Wundef \
-  -Werror=missing-include-dirs \
-  -Werror=strict-aliasing=2 \
-  -Werror=init-self \
-@@ -614,10 +614,9 @@ AC_DEFUN([CHECK_CCSUPPORT], [
- 
- CHECK_CCSUPPORT([-Werror=format-overflow=2], [flg1])
- CHECK_CCSUPPORT([-Werror=int-conversion], [flg2])
--CHECK_CCSUPPORT([-Werror=incompatible-pointer-types], [flg3])
- CHECK_CCSUPPORT([-Werror=misleading-indentation], [flg4])
- 
--AC_SUBST([AM_CFLAGS], ["$my_am_cflags $flg1 $flg2 $flg3 $flg4"])
-+AC_SUBST([AM_CFLAGS], ["$my_am_cflags $flg1 $flg2 $flg4"])
- 
- # Make sure that $ACLOCAL_FLAGS are used during a rebuild
- AC_SUBST([ACLOCAL_AMFLAGS], ["-I $ac_macro_dir \$(ACLOCAL_FLAGS)"])
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.2.bb
similarity index 94%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.2.bb
index eb32bccb57c..df3070bd8b0 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.2.bb
@@ -29,16 +29,13 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils-debianize-start-statd.patch \
            file://bugfix-adjust-statd-service-name.patch \
            file://0001-cacheio-use-intmax_t-for-formatted-IO.patch \
-           file://clang-format-string.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://0001-Don-t-build-tools-with-CC_FOR_BUILD.patch \
-           file://0001-Fix-include-order-between-config.h-and-stat.h.patch \
-"
+           "
 SRC_URI_append_libc-glibc = " file://0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch"
-SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
 
-SRC_URI[md5sum] = "161efe469ec1b06f1c750bd87f8ba6dd"
-SRC_URI[sha256sum] = "85274ada94479b1beba9f8eeffd19f477c53a6710b9998d1192c807854087736"
+SRC_URI[md5sum] = "d427c6b3014e9a04e8498f0598b1c1b9"
+SRC_URI[sha256sum] = "4464737a03d5f73ded2ffefe19d5543ed7b1d6c541985d8acaafdc8025aa1038"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.17.1


