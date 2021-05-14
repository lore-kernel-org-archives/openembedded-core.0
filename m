Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web10.3416.1620958357969048771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 19:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tuxLy9nZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958356; i=@fujitsu.com;
	bh=PvNoAE5UYoPzuibSEcgnCztkIA15XQR5lxHL8vZiRgg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tuxLy9nZ1Vymu3ZzJb9KslJnu+9yulV6ZDHOemZ6HZMkcnF4Jxoy5PkM1X9qt9xNQ
	 wlUtzvBFemV3dxxSD2rZFjmvWaFZfwDTH+k9B2uz/+YoBKd1KhNAAVirEydbrxiZ4C
	 Ae1neAohu/fdbtIYRVzfVJxuXJzYEqcGpg2B6zcyJpmWCMqvBQkqakcrqS3Nt9wCgJ
	 xvb4Y58bHZugDmzHoyOMnK6XKqhwY8/g8cl3GT5E6xFTRk0oGtrynj4qC40+rfcBVq
	 g8yJDgCSgwnjy8KDphmHit1Mms0Wfj6AadSt1I7bEEKcQpS5tkQ1NOj47VggdSowko
	 l9zaguXlK5I0A==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 67/59-45475-39CDD906; Fri, 14 May 2021 02:12:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRqjvpztw
  Eg+/rTS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1owf506yFRzQqtjzeSdzA+NWpS5GLg4hgVlM
  Evf2XWCCcHYzSry5toC1i5GTg01AV+Lc47XsXYwcHCICehJX/4mChIUFrCRmPJ3AAmKzCKhK/
  N69BMzmFfCQWLX7IVirhICCxJSH75kh4oISJ2c+AathFpCQOPjiBTPISAkBRYnZ0+UhyiskZs
  zYxjaBkWcWko5ZSDoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTSNbQ01TUyNNVLrNJN1Est1S1
  PLS7RNdRLLC/WK67MTc5J0ctLLdnECAyilILD13cw3nr9Qe8QoyQHk5Io70nP2QlCfEn5KZUZ
  icUZ8UWlOanFhxhlODiUJHi/35qbICRYlJqeWpGWmQMMaJi0BAePkgjvH5A0b3FBYm5xZjpE6
  hSjK8eztUsWMXNsmLcUSP6/exdI9i84uJqZ42b7odXMQix5+XmpUuK8wreBmgVAmjNK8+BGw6
  LxEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3qsgJ/Bk5pXAXfAK6DgmoONuTJ8FclxJIkJ
  KqoFJ5KdArccWrYV85qzX/jn9fXVEkqWq9twyvVN5qe0GW223L+VxyhCJf5m7QGlJ6P35e4xb
  xGdtXTw7RlOuy2+93X1v47k906ZGqbx4+Up3738JTt+TiVclD6xLLZjfry8wd7NtQpidhKC26
  oXK30+vz74TdzVOMHbJvg+zI9MK3eZxfmO7Uf9NJ/T3OwWdQqWWwgcbzfkPRVox9p4R55j+Q4
  gvcIu3gk7uonWdCdsuZ7jP7irbeTds2fYvC9xe3kipNH3+U4KFweNaVkXcjvslc1wOzXPS3n/
  k1o389rg3V3vvfZPb+IM3scN9/l3D9aUH25M4IoSn5387H/l74rxzYb2CP2NWJqu/uCyzcUW0
  EktxRqKhFnNRcSIAMHE0GkEDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-265.messagelabs.com!1620958354!32275!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22627 invoked from network); 14 May 2021 02:12:34 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-9.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:12:34 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2CYUC002734
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 03:12:34 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:12:32 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] rpcbind: upgrade 1.2.5 -> 1.2.6
Date: Fri, 14 May 2021 10:12:28 +0800
Message-ID: <1620958348-16318-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh rpcbind_add_option_to_fix_port_number.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...pcbind_add_option_to_fix_port_number.patch | 58 +++++++++----------
 .../{rpcbind_1.2.5.bb => rpcbind_1.2.6.bb}    |  4 +-
 2 files changed, 31 insertions(+), 31 deletions(-)
 rename meta/recipes-extended/rpcbind/{rpcbind_1.2.5.bb => rpcbind_1.2.6.bb} (93%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
index 434b6b1c4c..535f9ce20d 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
@@ -15,7 +15,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  3 files changed, 26 insertions(+), 3 deletions(-)
 
 diff --git a/man/rpcbind.8 b/man/rpcbind.8
-index af6200f..2e6146b 100644
+index fbf0ace..66f7c08 100644
 --- a/man/rpcbind.8
 +++ b/man/rpcbind.8
 @@ -11,7 +11,7 @@
@@ -27,17 +27,17 @@ index af6200f..2e6146b 100644
  .Sh DESCRIPTION
  The
  .Nm
-@@ -107,6 +107,8 @@ will automatically add
+@@ -96,6 +96,8 @@ will automatically add
  and if IPv6 is enabled,
  .Li ::1
  to the list.
 +.It Fl p
 +Bind for fixed UDP port number
- .It Fl i
- .Dq Insecure
- mode.
+ If no
+ .Fl h
+ option is specified,
 diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
-index 8aef9e5..c2632a4 100644
+index 1743dad..07a1c75 100644
 --- a/src/rpcb_svc_com.c
 +++ b/src/rpcb_svc_com.c
 @@ -48,6 +48,7 @@
@@ -60,8 +60,8 @@ index 8aef9e5..c2632a4 100644
  	int fd;
  	struct rmtcallfd_list *rmt;
  	SVCXPRT *xprt;
-+	struct __rpc_sockinfo si;
-+	struct t_bind taddr;
++        struct __rpc_sockinfo si;
++        struct t_bind taddr;
  
  	if ((fd = __rpc_nconf2fd(nconf)) == -1) {
  		if (debugging)
@@ -70,23 +70,23 @@ index 8aef9e5..c2632a4 100644
  		return (-1);
  	}
 +
-+	if (fixed_port) {
-+		__rpc_fd2sockinfo(fd, &si);
-+		memset(&taddr, 0, sizeof(taddr));
-+		taddr.addr.maxlen = taddr.addr.len = si.si_alen;
-+		taddr.addr.buf = malloc(si.si_alen);
-+		if (taddr.addr.buf == NULL) {
-+			return -1;
-+		}
-+		*(unsigned short *)(&(taddr.addr.buf[0])) = si.si_af;
-+		*(unsigned short *)(&(taddr.addr.buf[2])) = htons(fixed_port);
-+		xprt = svc_tli_create(fd, nconf, &taddr, RPC_MAXDATASIZE, RPC_MAXDATASIZE);
-+	} else
++        if (fixed_port) {
++                __rpc_fd2sockinfo(fd, &si);
++                memset(&taddr, 0, sizeof(taddr));
++                taddr.addr.maxlen = taddr.addr.len = si.si_alen;
++                taddr.addr.buf = malloc(si.si_alen);
++                if (taddr.addr.buf == NULL) {
++                        return -1;
++                }
++                *(unsigned short *)(&(taddr.addr.buf[0])) = si.si_af;
++                *(unsigned short *)(&(taddr.addr.buf[2])) = htons(fixed_port);
++                xprt = svc_tli_create(fd, nconf, &taddr, RPC_MAXDATASIZE, RPC_MAXDATASIZE);
++        } else
  	xprt = svc_tli_create(fd, 0, (struct t_bind *) 0, 0, 0);
  	if (xprt == NULL) {
  		if (debugging)
 diff --git a/src/rpcbind.c b/src/rpcbind.c
-index 137011b..dc3d2d6 100644
+index 25d8a90..36a95b9 100644
 --- a/src/rpcbind.c
 +++ b/src/rpcbind.c
 @@ -111,6 +111,7 @@ int runasdaemon = 0;
@@ -97,7 +97,7 @@ index 137011b..dc3d2d6 100644
  
  char **hosts = NULL;
  int nhosts = 0;
-@@ -869,7 +870,7 @@ parseargs(int argc, char *argv[])
+@@ -884,7 +885,7 @@ parseargs(int argc, char *argv[])
  {
  	int c;
  	oldstyle_local = 1;
@@ -106,25 +106,25 @@ index 137011b..dc3d2d6 100644
  		switch (c) {
  		case 'a':
  			doabort = 1;	/* when debugging, do an abort on */
-@@ -887,6 +888,9 @@ parseargs(int argc, char *argv[])
+@@ -902,6 +903,9 @@ parseargs(int argc, char *argv[])
  			if (hosts[nhosts - 1] == NULL)
  				errx(1, "Out of memory");
  			break;
-+		case 'p':
-+			fixed_port = atoi(optarg);
-+			break;
++                case 'p':
++                        fixed_port = atoi(optarg);
++                        break;
  		case 'i':
  			insecure = 1;
  			break;
-@@ -905,7 +909,7 @@ parseargs(int argc, char *argv[])
+@@ -920,7 +924,7 @@ parseargs(int argc, char *argv[])
  			break;
  #endif
  		default:	/* error */
 -			fprintf(stderr,	"usage: rpcbind [-adhilswf]\n");
-+			fprintf(stderr,	"usage: rpcbind [-adhpilswf]\n");
++			fprintf(stderr, "usage: rpcbind [-adhpilswf]\n");
  			exit (1);
  		}
  	}
 -- 
-1.9.1
+2.25.1
 
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
similarity index 93%
rename from meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
rename to meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
index ec8f9e48b2..7784ef51e2 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
@@ -16,8 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
           "
-SRC_URI[md5sum] = "ed46f09b9c0fa2d49015f6431bc5ea7b"
-SRC_URI[sha256sum] = "2ce360683963b35c19c43f0ee2c7f18aa5b81ef41c3fdbd15ffcb00b8bffda7a"
+SRC_URI[md5sum] = "2d84ebbb7d6fb1fc3566d2d4b37f214b"
+SRC_URI[sha256sum] = "5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de"
 
 inherit autotools update-rc.d systemd pkgconfig update-alternatives
 
-- 
2.25.1

