Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A67BC433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:04:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.6201.1640012642912495393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:04:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HkdyfUcL;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012641; i=@fujitsu.com;
	bh=Pjtw7WM+eUoEQqEjFmv7AjZ6In54FofJLvY0Se/p8vA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HkdyfUcL8smCd5/H/URwZQ2lJ03NSEKE6rSt/N7Q+rEhkeP79TPw1crCXmLlUxE/M
	 CwbEVwp28bR142Y+j5Kp64CZJIon0bFae63DvO3NXSLHW2eVKdOqKWd5ymdmsbc+PO
	 T8K8kjzehQi25CZgtbd2LEOjwE9s8HhSBpsNCQ+SCB3E43c3SKTgFwtmACS4oede5V
	 LYOQyp6rd3BUpMBFjTDIMYH0e7uXmHifaI4osXVDjl2fuxlkejA69VNfmeOezqSxJQ
	 wfhZ1msXuoEZBqZkylQk6+4acbc5tjRB++2KAHom1JnvCUbyN5x5UYpHe4YfsfXNKM
	 Ux46VlAt1ZjHw==
Received: from [100.115.32.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id D6/9B-23453-16B90C16;
 Mon, 20 Dec 2021 15:04:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MRopsw+0C
  iwcWVNhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8anv99ZC97qVix7tY2pgXGSahcjF4eQwAwm
  iW/tR1khnBOMEi1n/zN2MXJysAmoSUy/dQMowcEhIqAncfWfKEiYWUBF4sXvHnYQW1jAUuLk5
  KVgNouAqsTcnyfAWnkFHCUOz3zPBGJLCChITHn4nhnE5hRwkmg4thjMFgKq+fhhEitEvaDEyZ
  lPWCDmS0gcfPGCGaJXUWL25WYWCLtCYtasNqYJjPyzkLTMQtKygJFpFaNVUlFmekZJbmJmjq6
  hgYGuoaGprrG5rqGlXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6KXl5qySZGYEimFKsK
  72DsWPlT7xCjJAeTkigvv++BRCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvD9nAOUEi1LTUyvSM
  nOA8QGTluDgURLhbQJJ8xYXJOYWZ6ZDpE4xKkqJ88bNAkoIgCQySvPg2mAxeYlRVkqYl5GBgU
  GIpyC1KDezBFX+FaM4B6OSMG86yBSezLwSuOmvgBYzAS1WCt8PsrgkESEl1cBk97o46/28254
  v47deD78XVDONZc3alwkNP8PV9+VvVC/wfPnhwf9Uw76Ff8pyGfdY/Ck6eHPfF9adnxKML6g/
  mbSX2eNslhbD1yePQtYLdU93iZu50O7WKc5VvjOm3vW/47lv+43UFv/vE9MzYzMLChZxf/40S
  zTw7Yfo9zxF6Wpn+WUTp9zJi3727fpxxfQia8Hy912J9nW8/EYzSk7r1u6OesC4SPj8wh4tHk
  u+WwZ3n60wO8VZt6j/0XmPuGvBj3L75fIKGVwY5cOvWB4UDZ+YEarupHfKf3Z5B+dmoxtX49Z
  8dLzI5MNcoBpmUZToP/v/uk1Cvv8nrvassoxYZlx5sPzJxM47bDXn92kpsRRnJBpqMRcVJwIA
  pzEY2kQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1640012640!24401!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14318 invoked from network); 20 Dec 2021 15:04:00 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:04:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BKF3tc0015003
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:04:00 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:03:53 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sysvinit: upgrade 3.00 -> 3.01
Date: Mon, 20 Dec 2021 23:03:39 +0800
Message-ID: <1640012619-3685-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640012619-3685-1-git-send-email-wangmy@fujitsu.com>
References: <1640012619-3685-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:04:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159874

refresh pidof-add-m-option.patch

Changelog:
==========
* Default to showing processes in the uninterruptable state (D).
    The -z flag no longer affects whether processes in D state are shown.
    The -z flag does still toggle whether zombie (Z) processes are shown.

* Removed unnecessary check which is always true from init tab parsing.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sysvinit/pidof-add-m-option.patch         | 32 +++++++++----------
 .../{sysvinit_3.00.bb => sysvinit_3.01.bb}    |  2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-core/sysvinit/{sysvinit_3.00.bb => sysvinit_3.01.bb} (98%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
index 17f72b4829..4386e6f832 100644
--- a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
@@ -1,4 +1,4 @@
-From 6c490ea6579a132fabb7dbd25387bb521f820371 Mon Sep 17 00:00:00 2001
+From 96fb53ef2ccd2580cf0aa565ef1629cb05eae50a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 24 Jul 2013 17:07:22 +0800
 Subject: [PATCH] pidof: add -m option
@@ -21,7 +21,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 65 insertions(+), 3 deletions(-)
 
 diff --git a/man/pidof.8 b/man/pidof.8
-index ebe5f55..2fdc4d3 100644
+index 84ed1e4..ac184da 100644
 --- a/man/pidof.8
 +++ b/man/pidof.8
 @@ -25,6 +25,7 @@ pidof -- find the process ID of a running program.
@@ -32,7 +32,7 @@ index ebe5f55..2fdc4d3 100644
  .RB [ \-o
  .IR omitpid[,omitpid...] ]
  .RB [ \-o
-@@ -76,6 +77,11 @@ is shown. The default separator is a space.
+@@ -79,6 +80,11 @@ is shown. The default separator is a space.
  Tells \fIpidof\fP to omit processes with that process id. The special
  pid \fB%PPID\fP can be used to name the parent process of the \fIpidof\fP
  program, in other words the calling shell or shell script.
@@ -45,10 +45,10 @@ index ebe5f55..2fdc4d3 100644
  .TP
  .B 0
 diff --git a/src/killall5.c b/src/killall5.c
-index 8b5cb38..a664954 100644
+index b0728fa..72289e3 100644
 --- a/src/killall5.c
 +++ b/src/killall5.c
-@@ -126,6 +126,7 @@ typedef struct _s_nfs
+@@ -121,6 +121,7 @@ typedef struct _s_nfs
  
  /* List of processes. */
  PROC *plist;
@@ -56,7 +56,7 @@ index 8b5cb38..a664954 100644
  
  /* List of processes to omit. */
  OMIT *omit;
-@@ -361,6 +362,20 @@ static void clear_mnt(void)
+@@ -356,6 +357,20 @@ static void clear_mnt(void)
  	}
  }
  
@@ -77,15 +77,15 @@ index 8b5cb38..a664954 100644
  /*
   *     Check if path is a shadow off a NFS partition.
   */
-@@ -486,6 +501,7 @@ int readproc(int do_stat)
+@@ -481,6 +496,7 @@ int readproc()
  	DIR		*dir;
  	FILE		*fp;
  	PROC		*p, *n;
 +	OMIT		*o, *m;
  	struct dirent	*d;
- 	struct stat	st;
  	char		path[PATH_MAX+1];
-@@ -733,6 +749,17 @@ int readproc(int do_stat)
+ 	char		buf[PATH_MAX+1];
+@@ -670,6 +686,17 @@ int readproc()
  		p->next = plist;
  		plist = p;
  		p->pid = pid;
@@ -103,7 +103,7 @@ index 8b5cb38..a664954 100644
  	}
  	closedir(dir);
  
-@@ -944,6 +971,26 @@ PIDQ_HEAD *pidof(char *prog)
+@@ -870,6 +897,26 @@ PIDQ_HEAD *pidof(char *prog)
  	return q;
  }
  
@@ -130,7 +130,7 @@ index 8b5cb38..a664954 100644
  /* Give usage message and exit. */
  void usage(void)
  {
-@@ -994,6 +1041,7 @@ void nsyslog(int pri, char *fmt, ...)
+@@ -920,6 +967,7 @@ void nsyslog(int pri, char *fmt, ...)
  #define PIDOF_OMIT	0x02
  #define PIDOF_NETFS	0x04
  #define PIDOF_QUIET     0x08
@@ -138,7 +138,7 @@ index 8b5cb38..a664954 100644
  
  /*
   *	Pidof functionality.
-@@ -1011,6 +1059,7 @@ int main_pidof(int argc, char **argv)
+@@ -937,6 +985,7 @@ int main_pidof(int argc, char **argv)
  	char		tmp[512];
          char            sep = ' ';
  
@@ -146,7 +146,7 @@ index 8b5cb38..a664954 100644
  	omit = (OMIT*)0;
  	nlist = (NFS*)0;
  	opterr = 0;
-@@ -1018,7 +1067,7 @@ int main_pidof(int argc, char **argv)
+@@ -944,7 +993,7 @@ int main_pidof(int argc, char **argv)
  	if ((token = getenv("PIDOF_NETFS")) && (strcmp(token,"no") != 0))
  		flags |= PIDOF_NETFS;
  
@@ -155,7 +155,7 @@ index 8b5cb38..a664954 100644
  		case '?':
  			nsyslog(LOG_ERR,"invalid options on command line!\n");
  			closelog();
-@@ -1069,6 +1118,9 @@ int main_pidof(int argc, char **argv)
+@@ -995,6 +1044,9 @@ int main_pidof(int argc, char **argv)
                  case 'z':
                          list_dz_processes = TRUE;
                          break;
@@ -165,7 +165,7 @@ index 8b5cb38..a664954 100644
  		case 'n':
  			flags |= PIDOF_NETFS;
  			break;
-@@ -1100,10 +1152,13 @@ int main_pidof(int argc, char **argv)
+@@ -1026,10 +1078,13 @@ int main_pidof(int argc, char **argv)
  			pid_t spid = 0;
  			while ((p = get_next_from_pid_q(q))) {
  				if ((flags & PIDOF_OMIT) && omit) {
@@ -181,7 +181,7 @@ index 8b5cb38..a664954 100644
  					}
  
  					/*
-@@ -1145,6 +1200,7 @@ int main_pidof(int argc, char **argv)
+@@ -1071,6 +1126,7 @@ int main_pidof(int argc, char **argv)
  		printf("\n");
          }
  
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.00.bb b/meta/recipes-core/sysvinit/sysvinit_3.01.bb
similarity index 98%
rename from meta/recipes-core/sysvinit/sysvinit_3.00.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.01.bb
index 264944797d..9952f834ec 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.00.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.01.bb
@@ -21,7 +21,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[sha256sum] = "ed6bc20adb6735389841e7d3eb8650fa750c76af20bf4ed73b1330a4d4c14017"
+SRC_URI[sha256sum] = "68b11a4772cdacce5fb65a4cbead324a2ce3999d138b4ff61dc2d59e57ef5793"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.25.1


