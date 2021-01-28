Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.20979.1611814772837780312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 22:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m92BV/8L;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id t43so1618827uad.7
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 22:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g+pF6rbFNZWosAB+cfLN4HBWmzt4EEDGd7qL8iendCU=;
        b=m92BV/8LAChbJkZcvECw/omX8yFJB7VV9WIGWE1hMITnEVZeVCgcs4aVASHNMle5v/
         TH3XyUqSGWFo9T0boDwNzpuUK25hoFKRFSx6bDKQbXZkDpCKXSWkb8D/49CSrQo7I6CL
         d5B01NJzwM+5qkb/zhs+29+TyMASN7no4MScjPF0b83Zu0rYUVkatHRKhWRN1o5t5mfE
         MZKDgAe7nNssnlwxuxeBGk0PThUoh5Y11piPDxdrk7z8YAB8trzEeGBe4+LbunPiPNfa
         02XaBv1CGBOPzJM9CiU5W6Sn3q5AJLZgyIsFvGOptn1XkpsKyRi7V9dULdFBr1sq5pRR
         5s6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g+pF6rbFNZWosAB+cfLN4HBWmzt4EEDGd7qL8iendCU=;
        b=fMBsQpwh2rqNaWXLRMxk2UXPT4zInBhVTdpqdeHqtLCAJnGZrWd++rRlb2VmKRbiZe
         yDWsX/fd1+oRY8CuhEYnukTpaA3zGPXSELcGkzay3sM2+fVOQcuyCnx9phWOf/ps72wt
         T4KDfPdWDvex8OCGjGfBxlTKcMuF36cruMBNh99epCoxnRsrPkcWQo0g5EH1R6hczrR1
         R8XcYxfitqKXppfsoof81FELGar/n6Pn84EXcC2nTKrtlwQPOgscGZCCxU1gyoycamfW
         yy4ZchxQvKSSBZgO0VlwZu5MHxvNaRoS7RnXmm35vid5rr9Jgx5Gus73vXSX17WpOWJi
         gUbg==
X-Gm-Message-State: AOAM530pt9jZw0oHmEQYxCs3jfyGfMF8tn813vJd7ePEB8NttACoC937
	u+2vilfX+fimBEdz4OOPBAdBL2wKd+k31Aj4krM=
X-Google-Smtp-Source: ABdhPJwVyobsI5bFt0qA9mXKjh7TnQvQAyGHGhF6elsycstlZc5O+hLNmNZOMMQtUS08x0uJYbTCRt0a5BZk67PtRIs=
X-Received: by 2002:ab0:6507:: with SMTP id w7mr10307504uam.93.1611814771384;
 Wed, 27 Jan 2021 22:19:31 -0800 (PST)
MIME-Version: 1.0
References: <1611810598-10529-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1611810598-10529-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 28 Jan 2021 07:19:20 +0100
Message-ID: <CANNYZj-dXsXopcKXOR5vpoQJmMfB53=PCci5cVt5gNfgwBY71w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bind: upgrade 9.16.10 -> 9.16.11
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e464fb05b9efde3b"

--000000000000e464fb05b9efde3b
Content-Type: text/plain; charset="UTF-8"

Patches are copied and not renamed. License change is not explained. Please
read the commit before submitting.

Alex

On Thu 28. Jan 2021 at 6.11, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> rename directory of patches.
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...1-avoid-start-failure-with-bind-user.patch |  27 ++
>  ...d-V-and-start-log-hide-build-options.patch |  35 ++
>  ...ching-for-json-headers-searches-sysr.patch |  47 +++
>  .../bind/bind-9.16.11/bind9                   |   2 +
>  .../bind/bind-9.16.11/conf.patch              | 330 ++++++++++++++++++
>  .../bind/bind-9.16.11/generate-rndc-key.sh    |   8 +
>  ...t.d-add-support-for-read-only-rootfs.patch |  65 ++++
>  .../make-etc-initd-bind-stop-work.patch       |  42 +++
>  .../bind/bind-9.16.11/named.service           |  22 ++
>  .../bind/{bind_9.16.10.bb => bind_9.16.11.bb} |   4 +-
>  10 files changed, 580 insertions(+), 2 deletions(-)
>  create mode 100644
> meta/recipes-connectivity/bind/bind-9.16.11/0001-avoid-start-failure-with-bind-user.patch
>  create mode 100644
> meta/recipes-connectivity/bind/bind-9.16.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
>  create mode 100644
> meta/recipes-connectivity/bind/bind-9.16.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.11/bind9
>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.11/conf.patch
>  create mode 100644
> meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key.sh
>  create mode 100644
> meta/recipes-connectivity/bind/bind-9.16.11/init.d-add-support-for-read-only-rootfs.patch
>  create mode 100644
> meta/recipes-connectivity/bind/bind-9.16.11/make-etc-initd-bind-stop-work.patch
>  create mode 100644
> meta/recipes-connectivity/bind/bind-9.16.11/named.service
>  rename meta/recipes-connectivity/bind/{bind_9.16.10.bb => bind_9.16.11.bb}
> (96%)
>
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.16.11/0001-avoid-start-failure-with-bind-user.patch
> b/meta/recipes-connectivity/bind/bind-9.16.11/0001-avoid-start-failure-with-bind-user.patch
> new file mode 100644
> index 0000000000..8db96ec049
> --- /dev/null
> +++
> b/meta/recipes-connectivity/bind/bind-9.16.11/0001-avoid-start-failure-with-bind-user.patch
> @@ -0,0 +1,27 @@
> +From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Mon, 15 Oct 2018 16:55:09 +0800
> +Subject: [PATCH] avoid start failure with bind user
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + init.d | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/init.d b/init.d
> +index b2eec60..6e03936 100644
> +--- a/init.d
> ++++ b/init.d
> +@@ -57,6 +57,7 @@ case "$1" in
> +       modprobe capability >/dev/null 2>&1 || true
> +       if [ ! -f /etc/bind/rndc.key ]; then
> +           /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
> ++          chown root:bind /etc/bind/rndc.key >/dev/null 2>&1 || true
> +           chmod 0640 /etc/bind/rndc.key
> +       fi
> +       if [ -f /var/run/named/named.pid ]; then
> +--
> +2.7.4
> +
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.16.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> b/meta/recipes-connectivity/bind/bind-9.16.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> new file mode 100644
> index 0000000000..5bcc16c9b2
> --- /dev/null
> +++
> b/meta/recipes-connectivity/bind/bind-9.16.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> @@ -0,0 +1,35 @@
> +From a3af4a405baf5ff582e82aaba392dd9667d94bdc Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 27 Aug 2018 21:24:20 +0800
> +Subject: [PATCH] `named/lwresd -V' and start log hide build options
> +
> +The build options expose build path directories, so hide them.
> +[snip]
> +$ named -V
> +|built by make with *** (options are hidden)
> +[snip]
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
> +Refreshed for 9.16.0
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + bin/named/include/named/globals.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: bind-9.16.0/bin/named/include/named/globals.h
> +===================================================================
> +--- bind-9.16.0.orig/bin/named/include/named/globals.h
> ++++ bind-9.16.0/bin/named/include/named/globals.h
> +@@ -69,7 +69,7 @@ EXTERN const char *named_g_version     I
> + EXTERN const char *named_g_product     INIT(PRODUCT);
> + EXTERN const char *named_g_description INIT(DESCRIPTION);
> + EXTERN const char *named_g_srcid       INIT(SRCID);
> +-EXTERN const char *named_g_configargs  INIT(CONFIGARGS);
> ++EXTERN const char *named_g_configargs  INIT("*** (options are hidden)");
> + EXTERN const char *named_g_builder     INIT(BUILDER);
> + EXTERN in_port_t named_g_port        INIT(0);
> + EXTERN isc_dscp_t named_g_dscp               INIT(-1);
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.16.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
> b/meta/recipes-connectivity/bind/bind-9.16.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
> new file mode 100644
> index 0000000000..f9cdc7ca4d
> --- /dev/null
> +++
> b/meta/recipes-connectivity/bind/bind-9.16.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
> @@ -0,0 +1,47 @@
> +From edda20fb5a6e88548f85e39d34d6c074306e15bc Mon Sep 17 00:00:00 2001
> +From: Paul Gortmaker <paul.gortmaker@windriver.com>
> +Date: Tue, 9 Jun 2015 11:22:00 -0400
> +Subject: [PATCH] bind: ensure searching for json headers searches sysroot
> +
> +Bind can fail configure by detecting headers w/o libs[1], or
> +it can fail the host contamination check as per below:
> +
> +ERROR: This autoconf log indicates errors, it looked at host include
> and/or library paths while determining system capabilities.
> +Rerun configure task after fixing this. The path was
> 'build/tmp/work/core2-64-poky-linux/bind/9.10.2-r1/build'
> +ERROR: Function failed: do_qa_configure
> +ERROR: Logfile of failure stored in:
> build/tmp/work/core2-64-poky-linux/bind/9.10.2-r1/temp/log.do_configure.5242
> +ERROR: Task 5 (meta/recipes-connectivity/bind/bind_9.10.2.bb,
> do_configure) failed with exit code '1'
> +NOTE: Tasks Summary: Attempted 773 tasks of which 768 didn't need to be
> rerun and 1 failed.
> +No currently running tasks (773 of 781)
> +
> +Summary: 1 task failed:
> +  /meta/recipes-connectivity/bind/bind_9.10.2.bb, do_configure
> +
> +One way to fix it would be to unconditionally disable json in bind
> +configure[2] but here we fix it by using the path to where we would
> +put the header if we had json in the sysroot, in case someone wants
> +to make use of the combination some day.
> +
> +[1] https://trac.macports.org/ticket/45305
> +[2] https://trac.macports.org/changeset/126406
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> +
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: bind-9.16.4/configure.ac
> +===================================================================
> +--- bind-9.16.4.orig/configure.ac
> ++++ bind-9.16.4/configure.ac
> +@@ -1232,7 +1232,7 @@ case "$use_lmdb" in
> +               LMDB_LIBS=""
> +               ;;
> +       auto|yes)
> +-              for d in /usr /usr/local /opt/local
> ++              for d in "${STAGING_INCDIR}"
> +               do
> +                       if test -f "${d}/include/lmdb.h"
> +                       then
> diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/bind9
> b/meta/recipes-connectivity/bind/bind-9.16.11/bind9
> new file mode 100644
> index 0000000000..968679ff7f
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind-9.16.11/bind9
> @@ -0,0 +1,2 @@
> +# startup options for the server
> +OPTIONS="-u bind"
> diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/conf.patch
> b/meta/recipes-connectivity/bind/bind-9.16.11/conf.patch
> new file mode 100644
> index 0000000000..aad345f9fc
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind-9.16.11/conf.patch
> @@ -0,0 +1,330 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +the patch is imported from openembedded project
> +
> +11/30/2010 - Qing He <qing.he@intel.com>
> +
> +diff -urN bind-9.3.1.orig/conf/db.0 bind-9.3.1/conf/db.0
> +--- bind-9.3.1.orig/conf/db.0  1970-01-01 01:00:00.000000000 +0100
> ++++ bind-9.3.1/conf/db.0       2005-07-10 22:14:00.000000000 +0200
> +@@ -0,0 +1,12 @@
> ++;
> ++; BIND reverse data file for broadcast zone
> ++;
> ++$TTL  604800
> ++@     IN      SOA     localhost. root.localhost. (
> ++                            1         ; Serial
> ++                       604800         ; Refresh
> ++                        86400         ; Retry
> ++                      2419200         ; Expire
> ++                       604800 )       ; Negative Cache TTL
> ++;
> ++@     IN      NS      localhost.
> +diff -urN bind-9.3.1.orig/conf/db.127 bind-9.3.1/conf/db.127
> +--- bind-9.3.1.orig/conf/db.127        1970-01-01 01:00:00.000000000 +0100
> ++++ bind-9.3.1/conf/db.127     2005-07-10 22:14:00.000000000 +0200
> +@@ -0,0 +1,13 @@
> ++;
> ++; BIND reverse data file for local loopback interface
> ++;
> ++$TTL  604800
> ++@     IN      SOA     localhost. root.localhost. (
> ++                            1         ; Serial
> ++                       604800         ; Refresh
> ++                        86400         ; Retry
> ++                      2419200         ; Expire
> ++                       604800 )       ; Negative Cache TTL
> ++;
> ++@     IN      NS      localhost.
> ++1.0.0 IN      PTR     localhost.
> +diff -urN bind-9.3.1.orig/conf/db.empty bind-9.3.1/conf/db.empty
> +--- bind-9.3.1.orig/conf/db.empty      1970-01-01 01:00:00.000000000 +0100
> ++++ bind-9.3.1/conf/db.empty   2005-07-10 22:14:00.000000000 +0200
> +@@ -0,0 +1,14 @@
> ++; BIND reverse data file for empty rfc1918 zone
> ++;
> ++; DO NOT EDIT THIS FILE - it is used for multiple zones.
> ++; Instead, copy it, edit named.conf, and use that copy.
> ++;
> ++$TTL  86400
> ++@     IN      SOA     localhost. root.localhost. (
> ++                            1         ; Serial
> ++                       604800         ; Refresh
> ++                        86400         ; Retry
> ++                      2419200         ; Expire
> ++                        86400 )       ; Negative Cache TTL
> ++;
> ++@     IN      NS      localhost.
> +diff -urN bind-9.3.1.orig/conf/db.255 bind-9.3.1/conf/db.255
> +--- bind-9.3.1.orig/conf/db.255        1970-01-01 01:00:00.000000000 +0100
> ++++ bind-9.3.1/conf/db.255     2005-07-10 22:14:00.000000000 +0200
> +@@ -0,0 +1,12 @@
> ++;
> ++; BIND reserve data file for broadcast zone
> ++;
> ++$TTL  604800
> ++@     IN      SOA     localhost. root.localhost. (
> ++                            1         ; Serial
> ++                       604800         ; Refresh
> ++                        86400         ; Retry
> ++                      2419200         ; Expire
> ++                       604800 )       ; Negative Cache TTL
> ++;
> ++@     IN      NS      localhost.
> +diff -urN bind-9.3.1.orig/conf/db.local bind-9.3.1/conf/db.local
> +--- bind-9.3.1.orig/conf/db.local      1970-01-01 01:00:00.000000000 +0100
> ++++ bind-9.3.1/conf/db.local   2005-07-10 22:14:00.000000000 +0200
> +@@ -0,0 +1,13 @@
> ++;
> ++; BIND data file for local loopback interface
> ++;
> ++$TTL  604800
> ++@     IN      SOA     localhost. root.localhost. (
> ++                            1         ; Serial
> ++                       604800         ; Refresh
> ++                        86400         ; Retry
> ++                      2419200         ; Expire
> ++                       604800 )       ; Negative Cache TTL
> ++;
> ++@     IN      NS      localhost.
> ++@     IN      A       127.0.0.1
> +diff -urN bind-9.3.1.orig/conf/db.root bind-9.3.1/conf/db.root
> +--- bind-9.3.1.orig/conf/db.root       1970-01-01 01:00:00.000000000 +0100
> ++++ bind-9.3.1/conf/db.root    2005-07-10 22:14:00.000000000 +0200
> +@@ -0,0 +1,45 @@
> ++
> ++; <<>> DiG 9.2.3 <<>> ns . @a.root-servers.net.
> ++;; global options:  printcmd
> ++;; Got answer:
> ++;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18944
> ++;; flags: qr aa rd; QUERY: 1, ANSWER: 13, AUTHORITY: 0, ADDITIONAL: 13
> ++
> ++;; QUESTION SECTION:
> ++;.                            IN      NS
> ++
> ++;; ANSWER SECTION:
> ++.                     518400  IN      NS      A.ROOT-SERVERS.NET.
> ++.                     518400  IN      NS      B.ROOT-SERVERS.NET.
> ++.                     518400  IN      NS      C.ROOT-SERVERS.NET.
> ++.                     518400  IN      NS      D.ROOT-SERVERS.NET.
> ++.                     518400  IN      NS      E.ROOT-SERVERS.NET.
> ++.                     518400  IN      NS      F.ROOT-SERVERS.NET.
> ++.                     518400  IN      NS      G.ROOT-SERVERS.NET.
> ++.                     518400  IN      NS      H.ROOT-SERVERS.NET.
> ++.                     518400  IN      NS      I.ROOT-SERVERS.NET.
> ++.                     518400  IN      NS      J.ROOT-SERVERS.NET.
> ++.                     518400  IN      NS      K.ROOT-SERVERS.NET.
> ++.                     518400  IN      NS      L.ROOT-SERVERS.NET.
> ++.                     518400  IN      NS      M.ROOT-SERVERS.NET.
> ++
> ++;; ADDITIONAL SECTION:
> ++A.ROOT-SERVERS.NET.   3600000 IN      A       198.41.0.4
> ++B.ROOT-SERVERS.NET.   3600000 IN      A       192.228.79.201
> ++C.ROOT-SERVERS.NET.   3600000 IN      A       192.33.4.12
> ++D.ROOT-SERVERS.NET.   3600000 IN      A       128.8.10.90
> ++E.ROOT-SERVERS.NET.   3600000 IN      A       192.203.230.10
> ++F.ROOT-SERVERS.NET.   3600000 IN      A       192.5.5.241
> ++G.ROOT-SERVERS.NET.   3600000 IN      A       192.112.36.4
> ++H.ROOT-SERVERS.NET.   3600000 IN      A       128.63.2.53
> ++I.ROOT-SERVERS.NET.   3600000 IN      A       192.36.148.17
> ++J.ROOT-SERVERS.NET.   3600000 IN      A       192.58.128.30
> ++K.ROOT-SERVERS.NET.   3600000 IN      A       193.0.14.129
> ++L.ROOT-SERVERS.NET.   3600000 IN      A       198.32.64.12
> ++M.ROOT-SERVERS.NET.   3600000 IN      A       202.12.27.33
> ++
> ++;; Query time: 81 msec
> ++;; SERVER: 198.41.0.4#53(a.root-servers.net.)
> ++;; WHEN: Sun Feb  1 11:27:14 2004
> ++;; MSG SIZE  rcvd: 436
> ++
> +diff -urN bind-9.3.1.orig/conf/named.conf bind-9.3.1/conf/named.conf
> +--- bind-9.3.1.orig/conf/named.conf    1970-01-01 01:00:00.000000000 +0100
> ++++ bind-9.3.1/conf/named.conf 2005-07-10 22:33:46.000000000 +0200
> +@@ -0,0 +1,49 @@
> ++// This is the primary configuration file for the BIND DNS server named.
> ++//
> ++// If you are just adding zones, please do that in
> /etc/bind/named.conf.local
> ++
> ++include "/etc/bind/named.conf.options";
> ++
> ++// prime the server with knowledge of the root servers
> ++zone "." {
> ++      type hint;
> ++      file "/etc/bind/db.root";
> ++};
> ++
> ++// be authoritative for the localhost forward and reverse zones, and for
> ++// broadcast zones as per RFC 1912
> ++
> ++zone "localhost" {
> ++      type master;
> ++      file "/etc/bind/db.local";
> ++};
> ++
> ++zone "127.in-addr.arpa" {
> ++      type master;
> ++      file "/etc/bind/db.127";
> ++};
> ++
> ++zone "0.in-addr.arpa" {
> ++      type master;
> ++      file "/etc/bind/db.0";
> ++};
> ++
> ++zone "255.in-addr.arpa" {
> ++      type master;
> ++      file "/etc/bind/db.255";
> ++};
> ++
> ++// zone "com" { type delegation-only; };
> ++// zone "net" { type delegation-only; };
> ++
> ++// From the release notes:
> ++//  Because many of our users are uncomfortable receiving undelegated
> answers
> ++//  from root or top level domains, other than a few for whom that
> behaviour
> ++//  has been trusted and expected for quite some length of time, we have
> now
> ++//  introduced the "root-delegations-only" feature which applies
> delegation-only
> ++//  logic to all top level domains, and to the root domain.  An
> exception list
> ++//  should be specified, including "MUSEUM" and "DE", and any other top
> level
> ++//  domains from whom undelegated responses are expected and trusted.
> ++// root-delegation-only exclude { "DE"; "MUSEUM"; };
> ++
> ++include "/etc/bind/named.conf.local";
> +diff -urN bind-9.3.1.orig/conf/named.conf.local
> bind-9.3.1/conf/named.conf.local
> +--- bind-9.3.1.orig/conf/named.conf.local      1970-01-01
> 01:00:00.000000000 +0100
> ++++ bind-9.3.1/conf/named.conf.local   2005-07-10 22:14:06.000000000 +0200
> +@@ -0,0 +1,8 @@
> ++//
> ++// Do any local configuration here
> ++//
> ++
> ++// Consider adding the 1918 zones here, if they are not used in your
> ++// organization
> ++//include "/etc/bind/zones.rfc1918";
> ++
> +diff -urN bind-9.3.1.orig/conf/named.conf.options
> bind-9.3.1/conf/named.conf.options
> +--- bind-9.3.1.orig/conf/named.conf.options    1970-01-01
> 01:00:00.000000000 +0100
> ++++ bind-9.3.1/conf/named.conf.options 2005-07-10 22:14:06.000000000 +0200
> +@@ -0,0 +1,24 @@
> ++options {
> ++      directory "/var/cache/bind";
> ++
> ++      // If there is a firewall between you and nameservers you want
> ++      // to talk to, you might need to uncomment the query-source
> ++      // directive below.  Previous versions of BIND always asked
> ++      // questions using port 53, but BIND 8.1 and later use an
> unprivileged
> ++      // port by default.
> ++
> ++      // query-source address * port 53;
> ++
> ++      // If your ISP provided one or more IP addresses for stable
> ++      // nameservers, you probably want to use them as forwarders.
> ++      // Uncomment the following block, and insert the addresses
> replacing
> ++      // the all-0's placeholder.
> ++
> ++      // forwarders {
> ++      //      0.0.0.0;
> ++      // };
> ++
> ++      auth-nxdomain no;    # conform to RFC1035
> ++
> ++};
> ++
> +diff -urN bind-9.3.1.orig/conf/zones.rfc1918 bind-9.3.1/conf/zones.rfc1918
> +--- bind-9.3.1.orig/conf/zones.rfc1918 1970-01-01 01:00:00.000000000 +0100
> ++++ bind-9.3.1/conf/zones.rfc1918      2005-07-10 22:14:10.000000000 +0200
> +@@ -0,0 +1,20 @@
> ++zone "10.in-addr.arpa"      { type master; file "/etc/bind/db.empty"; };
> ++
> ++zone "16.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "17.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "18.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "19.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "20.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "21.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "22.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "23.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "24.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "25.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "26.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "27.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "28.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "29.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "30.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++zone "31.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
> ++
> ++zone "168.192.in-addr.arpa" { type master; file "/etc/bind/db.empty"; };
> +diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
> +--- bind-9.3.1.orig/init.d     1970-01-01 01:00:00.000000000 +0100
> ++++ bind-9.3.1/init.d  2005-07-10 23:09:58.000000000 +0200
> +@@ -0,0 +1,70 @@
> ++#!/bin/sh
> ++
> ++PATH=/sbin:/bin:/usr/sbin:/usr/bin
> ++
> ++# for a chrooted server: "-u bind -t /var/lib/named"
> ++# Don't modify this line, change or create /etc/default/bind9.
> ++OPTIONS=""
> ++
> ++test -f /etc/default/bind9 && . /etc/default/bind9
> ++
> ++test -x /usr/sbin/rndc || exit 0
> ++
> ++case "$1" in
> ++    start)
> ++      echo -n "Starting domain name service: named"
> ++
> ++      modprobe capability >/dev/null 2>&1 || true
> ++      if [ ! -f /etc/bind/rndc.key ]; then
> ++          /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
> ++          chmod 0640 /etc/bind/rndc.key
> ++      fi
> ++      if [ -f /var/run/named/named.pid ]; then
> ++          ps `cat /var/run/named/named.pid` > /dev/null && exit 1
> ++      fi
> ++
> ++      # dirs under /var/run can go away on reboots.
> ++      mkdir -p /var/run/named
> ++      mkdir -p /var/cache/bind
> ++      chmod 775 /var/run/named
> ++      chown root:bind /var/run/named >/dev/null 2>&1 || true
> ++
> ++      if [ ! -x /usr/sbin/named ]; then
> ++          echo "named binary missing - not starting"
> ++          exit 1
> ++      fi
> ++      if start-stop-daemon --start --quiet --exec /usr/sbin/named \
> ++              --pidfile /var/run/named/named.pid -- $OPTIONS; then
> ++          if [ -x /sbin/resolvconf ] ; then
> ++              echo "nameserver 127.0.0.1" | /sbin/resolvconf -a lo
> ++          fi
> ++      fi
> ++      echo "."
> ++    ;;
> ++
> ++    stop)
> ++      echo -n "Stopping domain name service: named"
> ++      if [ -x /sbin/resolvconf ]; then
> ++          /sbin/resolvconf -d lo
> ++      fi
> ++      /usr/sbin/rndc stop >/dev/null 2>&1
> ++      echo "."
> ++    ;;
> ++
> ++    reload)
> ++      /usr/sbin/rndc reload
> ++    ;;
> ++
> ++    restart|force-reload)
> ++      $0 stop
> ++      sleep 2
> ++      $0 start
> ++    ;;
> ++
> ++    *)
> ++      echo "Usage: /etc/init.d/bind
> {start|stop|reload|restart|force-reload}" >&2
> ++      exit 1
> ++    ;;
> ++esac
> ++
> ++exit 0
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key.sh
> b/meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key.sh
> new file mode 100644
> index 0000000000..633e29c0e6
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +if [ ! -s /etc/bind/rndc.key ]; then
> +    echo -n "Generating /etc/bind/rndc.key:"
> +    /usr/sbin/rndc-confgen -a -b 512
> +    chown root:bind /etc/bind/rndc.key
> +    chmod 0640 /etc/bind/rndc.key
> +fi
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.16.11/init.d-add-support-for-read-only-rootfs.patch
> b/meta/recipes-connectivity/bind/bind-9.16.11/init.d-add-support-for-read-only-rootfs.patch
> new file mode 100644
> index 0000000000..11db95ede1
> --- /dev/null
> +++
> b/meta/recipes-connectivity/bind/bind-9.16.11/init.d-add-support-for-read-only-rootfs.patch
> @@ -0,0 +1,65 @@
> +Subject: init.d: add support for read-only rootfs
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + init.d |   40 ++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 40 insertions(+)
> +
> +diff --git a/init.d b/init.d
> +index 0111ed4..24677c8 100644
> +--- a/init.d
> ++++ b/init.d
> +@@ -6,8 +6,48 @@ PATH=/sbin:/bin:/usr/sbin:/usr/bin
> + # Don't modify this line, change or create /etc/default/bind9.
> + OPTIONS=""
> +
> ++test -f /etc/default/rcS && . /etc/default/rcS
> + test -f /etc/default/bind9 && . /etc/default/bind9
> +
> ++# This function is here because it's possible that /var and / are on
> different partitions.
> ++is_on_read_only_partition () {
> ++    DIRECTORY=$1
> ++    dir=`readlink -f $DIRECTORY`
> ++    while true; do
> ++      if [ ! -d "$dir" ]; then
> ++          echo "ERROR: $dir is not a directory"
> ++          exit 1
> ++      else
> ++          for flag in `awk -v dir=$dir '{ if ($2 == dir) { print
> "FOUND"; split($4,FLAGS,",") } }; \
> ++              END { for (f in FLAGS) print FLAGS[f] }' < /proc/mounts`;
> do
> ++              [ "$flag" = "FOUND" ] && partition="read-write"
> ++              [ "$flag" = "ro" ] && { partition="read-only"; break; }
> ++          done
> ++          if [ "$dir" = "/" -o -n "$partition" ]; then
> ++              break
> ++          else
> ++              dir=`dirname $dir`
> ++          fi
> ++      fi
> ++    done
> ++    [ "$partition" = "read-only" ] && echo "yes" || echo "no"
> ++}
> ++
> ++bind_mount () {
> ++    olddir=$1
> ++    newdir=$2
> ++    mkdir -p $olddir
> ++    cp -a $newdir/* $olddir
> ++    mount --bind $olddir $newdir
> ++}
> ++
> ++# Deal with read-only rootfs
> ++if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
> ++    [ "$VERBOSE" != "no" ] && echo "WARN: start bind service in
> read-only rootfs"
> ++    [ `is_on_read_only_partition /etc/bind` = "yes" ] && bind_mount
> /var/volatile/bind/etc /etc/bind
> ++    [ `is_on_read_only_partition /var/named` = "yes" ] && bind_mount
> /var/volatile/bind/named /var/named
> ++fi
> ++
> + test -x /usr/sbin/rndc || exit 0
> +
> + case "$1" in
> +--
> +1.7.9.5
> +
> diff --git
> a/meta/recipes-connectivity/bind/bind-9.16.11/make-etc-initd-bind-stop-work.patch
> b/meta/recipes-connectivity/bind/bind-9.16.11/make-etc-initd-bind-stop-work.patch
> new file mode 100644
> index 0000000000..146f3e35db
> --- /dev/null
> +++
> b/meta/recipes-connectivity/bind/bind-9.16.11/make-etc-initd-bind-stop-work.patch
> @@ -0,0 +1,42 @@
> +bind: make "/etc/init.d/bind stop" work
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Add some configurations, make rndc command be able to controls
> +the named daemon.
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + conf/named.conf |    5 +++++
> + conf/rndc.conf  |    5 +++++
> + 2 files changed, 10 insertions(+), 0 deletions(-)
> + create mode 100644 conf/rndc.conf
> +
> +diff --git a/conf/named.conf b/conf/named.conf
> +index 95829cf..c8899e7 100644
> +--- a/conf/named.conf
> ++++ b/conf/named.conf
> +@@ -47,3 +47,8 @@ zone "255.in-addr.arpa" {
> + // root-delegation-only exclude { "DE"; "MUSEUM"; };
> +
> + include "/etc/bind/named.conf.local";
> ++include "/etc/bind/rndc.key" ;
> ++controls {
> ++      inet 127.0.0.1 allow { localhost; }
> ++      keys { rndc-key; };
> ++};
> +diff --git a/conf/rndc.conf b/conf/rndc.conf
> +new file mode 100644
> +index 0000000..a0b481d
> +--- /dev/null
> ++++ b/conf/rndc.conf
> +@@ -0,0 +1,5 @@
> ++include "/etc/bind/rndc.key";
> ++options {
> ++      default-server  localhost;
> ++      default-key     rndc-key;
> ++};
> +
> +--
> +1.7.5.4
> +
> diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/named.service
> b/meta/recipes-connectivity/bind/bind-9.16.11/named.service
> new file mode 100644
> index 0000000000..cda56ef015
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind-9.16.11/named.service
> @@ -0,0 +1,22 @@
> +[Unit]
> +Description=Berkeley Internet Name Domain (DNS)
> +Wants=nss-lookup.target
> +Before=nss-lookup.target
> +After=network.target
> +
> +[Service]
> +Type=forking
> +EnvironmentFile=-/etc/default/bind9
> +PIDFile=/run/named/named.pid
> +
> +ExecStartPre=@SBINDIR@/generate-rndc-key.sh
> +ExecStart=@SBINDIR@/named $OPTIONS
> +
> +ExecReload=@BASE_BINDIR@/sh -c '@SBINDIR@/rndc reload > /dev/null 2>&1
> || @BASE_BINDIR@/kill -HUP $MAINPID'
> +
> +ExecStop=@BASE_BINDIR@/sh -c '@SBINDIR@/rndc stop > /dev/null 2>&1 ||
> @BASE_BINDIR@/kill -TERM $MAINPID'
> +
> +PrivateTmp=true
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-connectivity/bind/bind_9.16.10.bb
> b/meta/recipes-connectivity/bind/bind_9.16.11.bb
> similarity index 96%
> rename from meta/recipes-connectivity/bind/bind_9.16.10.bb
> rename to meta/recipes-connectivity/bind/bind_9.16.11.bb
> index 71194a61bf..3b76a1f5cd 100644
> --- a/meta/recipes-connectivity/bind/bind_9.16.10.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.16.11.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://www.isc.org/bind/"
>  SECTION = "console/network"
>
>  LICENSE = "MPL-2.0"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4673dc07337cace3b93c65e9ffe57b60"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ef10b4de6371115dcecdc38ca2af4561"
>
>  DEPENDS = "openssl libcap zlib libuv"
>
> @@ -19,7 +19,7 @@ SRC_URI = "
> https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
>             file://0001-avoid-start-failure-with-bind-user.patch \
>             "
>
> -SRC_URI[sha256sum] =
> "bc47fc019c6205e6a6bfb839c544a1472321df0537ba905b846a4cbffe3362b3"
> +SRC_URI[sha256sum] =
> "0111f64dd7d8f515cfa129e181cce96ff82070d1b27f11a21f6856110d0699c1"
>
>  UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>  # stay at 9.16 follow the ESV versions divisible by 4
> --
> 2.25.1
>
>
>
>
> 
>
>

--000000000000e464fb05b9efde3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Patches are copied and not renamed. License change is not=
 explained. Please read the commit before submitting.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu 28. Jan 2021 at 6.11, Wang Mi=
ngyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com">wangmy@cn.fujitsu.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)">rename directory of patches.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" ta=
rget=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...1-avoid-start-failure-with-bind-user.patch |=C2=A0 27 ++<br>
=C2=A0...d-V-and-start-log-hide-build-options.patch |=C2=A0 35 ++<br>
=C2=A0...ching-for-json-headers-searches-sysr.patch |=C2=A0 47 +++<br>
=C2=A0.../bind/bind-9.16.11/bind9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../bind/bind-9.16.11/conf.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 330 ++++++++++++++++++<br>
=C2=A0.../bind/bind-9.16.11/generate-rndc-key.sh=C2=A0 =C2=A0 |=C2=A0 =C2=
=A08 +<br>
=C2=A0...t.d-add-support-for-read-only-rootfs.patch |=C2=A0 65 ++++<br>
=C2=A0.../make-etc-initd-bind-stop-work.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 42 +++<br>
=C2=A0.../bind/bind-9.16.11/named.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 22 ++<br>
=C2=A0.../bind/{<a href=3D"http://bind_9.16.10.bb" rel=3D"noreferrer" targ=
et=3D"_blank">bind_9.16.10.bb</a> =3D&gt; <a href=3D"http://bind_9.16.11.bb=
" rel=3D"noreferrer" target=3D"_blank">bind_9.16.11.bb</a>} |=C2=A0 =C2=A04=
 +-<br>
=C2=A010 files changed, 580 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind-9.16.11/0001-=
avoid-start-failure-with-bind-user.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind-9.16.11/0001-=
named-lwresd-V-and-start-log-hide-build-options.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind-9.16.11/bind-=
ensure-searching-for-json-headers-searches-sysr.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind-9.16.11/bind9=
<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind-9.16.11/conf.=
patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind-9.16.11/gener=
ate-rndc-key.sh<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind-9.16.11/init.=
d-add-support-for-read-only-rootfs.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind-9.16.11/make-=
etc-initd-bind-stop-work.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/bind/bind-9.16.11/named=
.service<br>
=C2=A0rename meta/recipes-connectivity/bind/{<a href=3D"http://bind_9.16.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.16.10.bb</a> =3D&gt; <a h=
ref=3D"http://bind_9.16.11.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.=
16.11.bb</a>} (96%)<br>
<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/0001-avoid-start-=
failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.11/=
0001-avoid-start-failure-with-bind-user.patch<br>
new file mode 100644<br>
index 0000000000..8db96ec049<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/bind/bind-9.16.11/0001-avoid-start-failure=
-with-bind-user.patch<br>
@@ -0,0 +1,27 @@<br>
+From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001<br=
>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_bla=
nk">Qi.Chen@windriver.com</a>&gt;<br>
+Date: Mon, 15 Oct 2018 16:55:09 +0800<br>
+Subject: [PATCH] avoid start failure with bind user<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" targe=
t=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+---<br>
+ init.d | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/init.d b/init.d<br>
+index b2eec60..6e03936 100644<br>
+--- a/init.d<br>
++++ b/init.d<br>
+@@ -57,6 +57,7 @@ case &quot;$1&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0modprobe capability &gt;/dev/null 2&gt;&amp;1 =
|| true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -f /etc/bind/rndc.key ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/sbin/rndc-confgen -a -b 512=
 -r /dev/urandom<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chown root:bind /etc/bind/rndc.key &g=
t;/dev/null 2&gt;&amp;1 || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 0640 /etc/bind/rndc.key<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f /var/run/named/named.pid ]; then<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/0001-named-lwresd=
-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/=
bind-9.16.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch<br>
new file mode 100644<br>
index 0000000000..5bcc16c9b2<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/bind/bind-9.16.11/0001-named-lwresd-V-and-=
start-log-hide-build-options.patch<br>
@@ -0,0 +1,35 @@<br>
+From a3af4a405baf5ff582e82aaba392dd9667d94bdc Mon Sep 17 00:00:00 2001<br=
>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=
=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+Date: Mon, 27 Aug 2018 21:24:20 +0800<br>
+Subject: [PATCH] `named/lwresd -V&#39; and start log hide build options<b=
r>
+<br>
+The build options expose build path directories, so hide them.<br>
+[snip]<br>
+$ named -V<br>
+|built by make with *** (options are hidden)<br>
+[snip]<br>
+<br>
+Upstream-Status: Inappropriate [oe-core specific]<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com"=
 target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+<br>
+Refreshed for 9.16.0<br>
+Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" tar=
get=3D"_blank">akuster@mvista.com</a>&gt;<br>
+<br>
+---<br>
+ bin/named/include/named/globals.h | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+Index: bind-9.16.0/bin/named/include/named/globals.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- bind-9.16.0.orig/bin/named/include/named/globals.h<br>
++++ bind-9.16.0/bin/named/include/named/globals.h<br>
+@@ -69,7 +69,7 @@ EXTERN const char *named_g_version=C2=A0 =C2=A0 =C2=A0I=
<br>
+ EXTERN const char *named_g_product=C2=A0 =C2=A0 =C2=A0INIT(PRODUCT);<br>
+ EXTERN const char *named_g_description INIT(DESCRIPTION);<br>
+ EXTERN const char *named_g_srcid=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT(SRCID);<=
br>
+-EXTERN const char *named_g_configargs=C2=A0 INIT(CONFIGARGS);<br>
++EXTERN const char *named_g_configargs=C2=A0 INIT(&quot;*** (options are =
hidden)&quot;);<br>
+ EXTERN const char *named_g_builder=C2=A0 =C2=A0 =C2=A0INIT(BUILDER);<br>
+ EXTERN in_port_t named_g_port=C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT(0);<br>
+ EXTERN isc_dscp_t named_g_dscp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0INIT(-1);<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/bind-ensure-searc=
hing-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/=
bind-9.16.11/bind-ensure-searching-for-json-headers-searches-sysr.patch<br>
new file mode 100644<br>
index 0000000000..f9cdc7ca4d<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/bind/bind-9.16.11/bind-ensure-searching-fo=
r-json-headers-searches-sysr.patch<br>
@@ -0,0 +1,47 @@<br>
+From edda20fb5a6e88548f85e39d34d6c074306e15bc Mon Sep 17 00:00:00 2001<br=
>
+From: Paul Gortmaker &lt;<a href=3D"mailto:paul.gortmaker@windriver.com" =
target=3D"_blank">paul.gortmaker@windriver.com</a>&gt;<br>
+Date: Tue, 9 Jun 2015 11:22:00 -0400<br>
+Subject: [PATCH] bind: ensure searching for json headers searches sysroot=
<br>
+<br>
+Bind can fail configure by detecting headers w/o libs[1], or<br>
+it can fail the host contamination check as per below:<br>
+<br>
+ERROR: This autoconf log indicates errors, it looked at host include and/=
or library paths while determining system capabilities.<br>
+Rerun configure task after fixing this. The path was &#39;build/tmp/work/=
core2-64-poky-linux/bind/9.10.2-r1/build&#39;<br>
+ERROR: Function failed: do_qa_configure<br>
+ERROR: Logfile of failure stored in: build/tmp/work/core2-64-poky-linux/b=
ind/9.10.2-r1/temp/log.do_configure.5242<br>
+ERROR: Task 5 (meta/recipes-connectivity/bind/<a href=3D"http://bind_9.10=
.2.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.10.2.bb</a>, do_configur=
e) failed with exit code &#39;1&#39;<br>
+NOTE: Tasks Summary: Attempted 773 tasks of which 768 didn&#39;t need to =
be rerun and 1 failed.<br>
+No currently running tasks (773 of 781)<br>
+<br>
+Summary: 1 task failed:<br>
+=C2=A0 /meta/recipes-connectivity/bind/<a href=3D"http://bind_9.10.2.bb" =
rel=3D"noreferrer" target=3D"_blank">bind_9.10.2.bb</a>, do_configure<br>
+<br>
+One way to fix it would be to unconditionally disable json in bind<br>
+configure[2] but here we fix it by using the path to where we would<br>
+put the header if we had json in the sysroot, in case someone wants<br>
+to make use of the combination some day.<br>
+<br>
+[1] <a href=3D"https://trac.macports.org/ticket/45305" rel=3D"noreferrer"=
 target=3D"_blank">https://trac.macports.org/ticket/45305</a><br>
+[2] <a href=3D"https://trac.macports.org/changeset/126406" rel=3D"norefer=
rer" target=3D"_blank">https://trac.macports.org/changeset/126406</a><br>
+<br>
+Upstream-Status: Inappropriate [OE Specific]<br>
+Signed-off-by: Paul Gortmaker &lt;<a href=3D"mailto:paul.gortmaker@windri=
ver.com" target=3D"_blank">paul.gortmaker@windriver.com</a>&gt;<br>
+<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">con=
figure.ac</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+Index: bind-9.16.4/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- bind-9.16.4.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
++++ bind-9.16.4/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=
=3D"_blank">configure.ac</a><br>
+@@ -1232,7 +1232,7 @@ case &quot;$use_lmdb&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LMDB_LIBS=3D&quot;=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0auto|yes)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in /usr /usr/loca=
l /opt/local<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in &quot;${STAGIN=
G_INCDIR}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0if test -f &quot;${d}/include/lmdb.h&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0then<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/bind9 b/meta/reci=
pes-connectivity/bind/bind-9.16.11/bind9<br>
new file mode 100644<br>
index 0000000000..968679ff7f<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/bind/bind-9.16.11/bind9<br>
@@ -0,0 +1,2 @@<br>
+# startup options for the server<br>
+OPTIONS=3D&quot;-u bind&quot;<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/conf.patch b/meta=
/recipes-connectivity/bind/bind-9.16.11/conf.patch<br>
new file mode 100644<br>
index 0000000000..aad345f9fc<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/bind/bind-9.16.11/conf.patch<br>
@@ -0,0 +1,330 @@<br>
+Upstream-Status: Inappropriate [configuration]<br>
+<br>
+the patch is imported from openembedded project<br>
+<br>
+11/30/2010 - Qing He &lt;<a href=3D"mailto:qing.he@intel.com" target=3D"_=
blank">qing.he@intel.com</a>&gt;<br>
+<br>
+diff -urN bind-9.3.1.orig/conf/db.0 bind-9.3.1/conf/db.0<br>
+--- bind-9.3.1.orig/conf/db.0=C2=A0 1970-01-01 01:00:00.000000000 +0100<b=
r>
++++ bind-9.3.1/conf/db.0=C2=A0 =C2=A0 =C2=A0 =C2=A02005-07-10 22:14:00.00=
0000000 +0200<br>
+@@ -0,0 +1,12 @@<br>
++;<br>
++; BIND reverse data file for broadcast zone<br>
++;<br>
++$TTL=C2=A0 604800<br>
++@=C2=A0 =C2=A0 =C2=A0IN=C2=A0 =C2=A0 =C2=A0 SOA=C2=A0 =C2=A0 =C2=A0local=
host. root.localhost. (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Serial<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0604800=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Refresh<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 86400=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Retry<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2419200=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Expire<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0604800 )=C2=A0 =C2=A0 =C2=A0 =C2=A0; Negative Cache TTL<br>
++;<br>
++@=C2=A0 =C2=A0 =C2=A0IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 local=
host.<br>
+diff -urN bind-9.3.1.orig/conf/db.127 bind-9.3.1/conf/db.127<br>
+--- bind-9.3.1.orig/conf/db.127=C2=A0 =C2=A0 =C2=A0 =C2=A0 1970-01-01 01:=
00:00.000000000 +0100<br>
++++ bind-9.3.1/conf/db.127=C2=A0 =C2=A0 =C2=A02005-07-10 22:14:00.0000000=
00 +0200<br>
+@@ -0,0 +1,13 @@<br>
++;<br>
++; BIND reverse data file for local loopback interface<br>
++;<br>
++$TTL=C2=A0 604800<br>
++@=C2=A0 =C2=A0 =C2=A0IN=C2=A0 =C2=A0 =C2=A0 SOA=C2=A0 =C2=A0 =C2=A0local=
host. root.localhost. (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Serial<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0604800=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Refresh<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 86400=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Retry<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2419200=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Expire<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0604800 )=C2=A0 =C2=A0 =C2=A0 =C2=A0; Negative Cache TTL<br>
++;<br>
++@=C2=A0 =C2=A0 =C2=A0IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 local=
host.<br>
++1.0.0 IN=C2=A0 =C2=A0 =C2=A0 PTR=C2=A0 =C2=A0 =C2=A0localhost.<br>
+diff -urN bind-9.3.1.orig/conf/db.empty bind-9.3.1/conf/db.empty<br>
+--- bind-9.3.1.orig/conf/db.empty=C2=A0 =C2=A0 =C2=A0 1970-01-01 01:00:00=
.000000000 +0100<br>
++++ bind-9.3.1/conf/db.empty=C2=A0 =C2=A02005-07-10 22:14:00.000000000 +0=
200<br>
+@@ -0,0 +1,14 @@<br>
++; BIND reverse data file for empty rfc1918 zone<br>
++;<br>
++; DO NOT EDIT THIS FILE - it is used for multiple zones.<br>
++; Instead, copy it, edit named.conf, and use that copy.<br>
++;<br>
++$TTL=C2=A0 86400<br>
++@=C2=A0 =C2=A0 =C2=A0IN=C2=A0 =C2=A0 =C2=A0 SOA=C2=A0 =C2=A0 =C2=A0local=
host. root.localhost. (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Serial<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0604800=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Refresh<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 86400=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Retry<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2419200=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Expire<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 86400 )=C2=A0 =C2=A0 =C2=A0 =C2=A0; Negative Cache TTL<br>
++;<br>
++@=C2=A0 =C2=A0 =C2=A0IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 local=
host.<br>
+diff -urN bind-9.3.1.orig/conf/db.255 bind-9.3.1/conf/db.255<br>
+--- bind-9.3.1.orig/conf/db.255=C2=A0 =C2=A0 =C2=A0 =C2=A0 1970-01-01 01:=
00:00.000000000 +0100<br>
++++ bind-9.3.1/conf/db.255=C2=A0 =C2=A0 =C2=A02005-07-10 22:14:00.0000000=
00 +0200<br>
+@@ -0,0 +1,12 @@<br>
++;<br>
++; BIND reserve data file for broadcast zone<br>
++;<br>
++$TTL=C2=A0 604800<br>
++@=C2=A0 =C2=A0 =C2=A0IN=C2=A0 =C2=A0 =C2=A0 SOA=C2=A0 =C2=A0 =C2=A0local=
host. root.localhost. (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Serial<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0604800=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Refresh<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 86400=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Retry<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2419200=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Expire<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0604800 )=C2=A0 =C2=A0 =C2=A0 =C2=A0; Negative Cache TTL<br>
++;<br>
++@=C2=A0 =C2=A0 =C2=A0IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 local=
host.<br>
+diff -urN bind-9.3.1.orig/conf/db.local bind-9.3.1/conf/db.local<br>
+--- bind-9.3.1.orig/conf/db.local=C2=A0 =C2=A0 =C2=A0 1970-01-01 01:00:00=
.000000000 +0100<br>
++++ bind-9.3.1/conf/db.local=C2=A0 =C2=A02005-07-10 22:14:00.000000000 +0=
200<br>
+@@ -0,0 +1,13 @@<br>
++;<br>
++; BIND data file for local loopback interface<br>
++;<br>
++$TTL=C2=A0 604800<br>
++@=C2=A0 =C2=A0 =C2=A0IN=C2=A0 =C2=A0 =C2=A0 SOA=C2=A0 =C2=A0 =C2=A0local=
host. root.localhost. (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Serial<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0604800=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Refresh<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 86400=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Retry<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2419200=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; Expire<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0604800 )=C2=A0 =C2=A0 =C2=A0 =C2=A0; Negative Cache TTL<br>
++;<br>
++@=C2=A0 =C2=A0 =C2=A0IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 local=
host.<br>
++@=C2=A0 =C2=A0 =C2=A0IN=C2=A0 =C2=A0 =C2=A0 A=C2=A0 =C2=A0 =C2=A0 =C2=A0=
127.0.0.1<br>
+diff -urN bind-9.3.1.orig/conf/db.root bind-9.3.1/conf/db.root<br>
+--- bind-9.3.1.orig/conf/db.root=C2=A0 =C2=A0 =C2=A0 =C2=A01970-01-01 01:=
00:00.000000000 +0100<br>
++++ bind-9.3.1/conf/db.root=C2=A0 =C2=A0 2005-07-10 22:14:00.000000000 +0=
200<br>
+@@ -0,0 +1,45 @@<br>
++<br>
++; &lt;&lt;&gt;&gt; DiG 9.2.3 &lt;&lt;&gt;&gt; ns . @<a href=3D"http://a.=
root-servers.net" rel=3D"noreferrer" target=3D"_blank">a.root-servers.net</=
a>.<br>
++;; global options:=C2=A0 printcmd<br>
++;; Got answer:<br>
++;; -&gt;&gt;HEADER&lt;&lt;- opcode: QUERY, status: NOERROR, id: 18944<br=
>
++;; flags: qr aa rd; QUERY: 1, ANSWER: 13, AUTHORITY: 0, ADDITIONAL: 13<b=
r>
++<br>
++;; QUESTION SECTION:<br>
++;.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS<br>
++<br>
++;; ANSWER SECTION:<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://A.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">A.ROOT=
-SERVERS.NET</a>.<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://B.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">B.ROOT=
-SERVERS.NET</a>.<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://C.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">C.ROOT=
-SERVERS.NET</a>.<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://D.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">D.ROOT=
-SERVERS.NET</a>.<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://E.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">E.ROOT=
-SERVERS.NET</a>.<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://F.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">F.ROOT=
-SERVERS.NET</a>.<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://G.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">G.ROOT=
-SERVERS.NET</a>.<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://H.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">H.ROOT=
-SERVERS.NET</a>.<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://I.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">I.ROOT=
-SERVERS.NET</a>.<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://J.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">J.ROOT=
-SERVERS.NET</a>.<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://K.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">K.ROOT=
-SERVERS.NET</a>.<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://L.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">L.ROOT=
-SERVERS.NET</a>.<br>
++.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0518400=C2=A0 IN=C2=A0 =C2=A0 =C2=A0 NS=C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://M.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blank">M.ROOT=
-SERVERS.NET</a>.<br>
++<br>
++;; ADDITIONAL SECTION:<br>
++<a href=3D"http://A.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">A.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0198.41.0.4<br>
++<a href=3D"http://B.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">B.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0192.228.79.201<br>
++<a href=3D"http://C.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">C.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0192.33.4.12<br>
++<a href=3D"http://D.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">D.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0128.8.10.90<br>
++<a href=3D"http://E.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">E.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0192.203.230.10<br>
++<a href=3D"http://F.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">F.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0192.5.5.241<br>
++<a href=3D"http://G.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">G.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0192.112.36.4<br>
++<a href=3D"http://H.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">H.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0128.63.2.53<br>
++<a href=3D"http://I.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">I.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0192.36.148.17<br>
++<a href=3D"http://J.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">J.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0192.58.128.30<br>
++<a href=3D"http://K.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">K.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0193.0.14.129<br>
++<a href=3D"http://L.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">L.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0198.32.64.12<br>
++<a href=3D"http://M.ROOT-SERVERS.NET" rel=3D"noreferrer" target=3D"_blan=
k">M.ROOT-SERVERS.NET</a>.=C2=A0 =C2=A03600000 IN=C2=A0 =C2=A0 =C2=A0 A=C2=
=A0 =C2=A0 =C2=A0 =C2=A0202.12.27.33<br>
++<br>
++;; Query time: 81 msec<br>
++;; SERVER: 198.41.0.4#53(<a href=3D"http://a.root-servers.net" rel=3D"no=
referrer" target=3D"_blank">a.root-servers.net</a>.)<br>
++;; WHEN: Sun Feb=C2=A0 1 11:27:14 2004<br>
++;; MSG SIZE=C2=A0 rcvd: 436<br>
++<br>
+diff -urN bind-9.3.1.orig/conf/named.conf bind-9.3.1/conf/named.conf<br>
+--- bind-9.3.1.orig/conf/named.conf=C2=A0 =C2=A0 1970-01-01 01:00:00.0000=
00000 +0100<br>
++++ bind-9.3.1/conf/named.conf 2005-07-10 22:33:46.000000000 +0200<br>
+@@ -0,0 +1,49 @@<br>
++// This is the primary configuration file for the BIND DNS server named.=
<br>
++//<br>
++// If you are just adding zones, please do that in /etc/bind/named.conf.=
local<br>
++<br>
++include &quot;/etc/bind/named.conf.options&quot;;<br>
++<br>
++// prime the server with knowledge of the root servers<br>
++zone &quot;.&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 type hint;<br>
++=C2=A0 =C2=A0 =C2=A0 file &quot;/etc/bind/db.root&quot;;<br>
++};<br>
++<br>
++// be authoritative for the localhost forward and reverse zones, and for=
<br>
++// broadcast zones as per RFC 1912<br>
++<br>
++zone &quot;localhost&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 type master;<br>
++=C2=A0 =C2=A0 =C2=A0 file &quot;/etc/bind/db.local&quot;;<br>
++};<br>
++<br>
++zone &quot;127.in-addr.arpa&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 type master;<br>
++=C2=A0 =C2=A0 =C2=A0 file &quot;/etc/bind/db.127&quot;;<br>
++};<br>
++<br>
++zone &quot;0.in-addr.arpa&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 type master;<br>
++=C2=A0 =C2=A0 =C2=A0 file &quot;/etc/bind/db.0&quot;;<br>
++};<br>
++<br>
++zone &quot;255.in-addr.arpa&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 type master;<br>
++=C2=A0 =C2=A0 =C2=A0 file &quot;/etc/bind/db.255&quot;;<br>
++};<br>
++<br>
++// zone &quot;com&quot; { type delegation-only; };<br>
++// zone &quot;net&quot; { type delegation-only; };<br>
++<br>
++// From the release notes:<br>
++//=C2=A0 Because many of our users are uncomfortable receiving undelegat=
ed answers<br>
++//=C2=A0 from root or top level domains, other than a few for whom that =
behaviour<br>
++//=C2=A0 has been trusted and expected for quite some length of time, we=
 have now<br>
++//=C2=A0 introduced the &quot;root-delegations-only&quot; feature which =
applies delegation-only<br>
++//=C2=A0 logic to all top level domains, and to the root domain.=C2=A0 A=
n exception list<br>
++//=C2=A0 should be specified, including &quot;MUSEUM&quot; and &quot;DE&=
quot;, and any other top level<br>
++//=C2=A0 domains from whom undelegated responses are expected and truste=
d.<br>
++// root-delegation-only exclude { &quot;DE&quot;; &quot;MUSEUM&quot;; };=
<br>
++<br>
++include &quot;/etc/bind/named.conf.local&quot;;<br>
+diff -urN bind-9.3.1.orig/conf/named.conf.local bind-9.3.1/conf/named.con=
f.local<br>
+--- bind-9.3.1.orig/conf/named.conf.local=C2=A0 =C2=A0 =C2=A0 1970-01-01 =
01:00:00.000000000 +0100<br>
++++ bind-9.3.1/conf/named.conf.local=C2=A0 =C2=A02005-07-10 22:14:06.0000=
00000 +0200<br>
+@@ -0,0 +1,8 @@<br>
++//<br>
++// Do any local configuration here<br>
++//<br>
++<br>
++// Consider adding the 1918 zones here, if they are not used in your<br>
++// organization<br>
++//include &quot;/etc/bind/zones.rfc1918&quot;;<br>
++<br>
+diff -urN bind-9.3.1.orig/conf/named.conf.options bind-9.3.1/conf/named.c=
onf.options<br>
+--- bind-9.3.1.orig/conf/named.conf.options=C2=A0 =C2=A0 1970-01-01 01:00=
:00.000000000 +0100<br>
++++ bind-9.3.1/conf/named.conf.options 2005-07-10 22:14:06.000000000 +020=
0<br>
+@@ -0,0 +1,24 @@<br>
++options {<br>
++=C2=A0 =C2=A0 =C2=A0 directory &quot;/var/cache/bind&quot;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // If there is a firewall between you and nameserve=
rs you want<br>
++=C2=A0 =C2=A0 =C2=A0 // to talk to, you might need to uncomment the quer=
y-source<br>
++=C2=A0 =C2=A0 =C2=A0 // directive below.=C2=A0 Previous versions of BIND=
 always asked<br>
++=C2=A0 =C2=A0 =C2=A0 // questions using port 53, but BIND 8.1 and later =
use an unprivileged<br>
++=C2=A0 =C2=A0 =C2=A0 // port by default.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // query-source address * port 53;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // If your ISP provided one or more IP addresses fo=
r stable <br>
++=C2=A0 =C2=A0 =C2=A0 // nameservers, you probably want to use them as fo=
rwarders.=C2=A0 <br>
++=C2=A0 =C2=A0 =C2=A0 // Uncomment the following block, and insert the ad=
dresses replacing <br>
++=C2=A0 =C2=A0 =C2=A0 // the all-0&#39;s placeholder.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // forwarders {<br>
++=C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=A0 0.0.0.0;<br>
++=C2=A0 =C2=A0 =C2=A0 // };<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 auth-nxdomain no;=C2=A0 =C2=A0 # conform to RFC1035=
<br>
++<br>
++};<br>
++<br>
+diff -urN bind-9.3.1.orig/conf/zones.rfc1918 bind-9.3.1/conf/zones.rfc191=
8<br>
+--- bind-9.3.1.orig/conf/zones.rfc1918 1970-01-01 01:00:00.000000000 +010=
0<br>
++++ bind-9.3.1/conf/zones.rfc1918=C2=A0 =C2=A0 =C2=A0 2005-07-10 22:14:10=
.000000000 +0200<br>
+@@ -0,0 +1,20 @@<br>
++zone &quot;10.in-addr.arpa&quot;=C2=A0 =C2=A0 =C2=A0 { type master; file=
 &quot;/etc/bind/db.empty&quot;; };<br>
++ <br>
++zone &quot;16.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;17.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;18.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;19.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;20.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;21.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;22.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;23.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;24.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;25.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;26.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;27.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;28.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;29.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;30.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++zone &quot;31.172.in-addr.arpa&quot;=C2=A0 { type master; file &quot;/et=
c/bind/db.empty&quot;; };<br>
++<br>
++zone &quot;168.192.in-addr.arpa&quot; { type master; file &quot;/etc/bin=
d/db.empty&quot;; };<br>
+diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d<br>
+--- bind-9.3.1.orig/init.d=C2=A0 =C2=A0 =C2=A01970-01-01 01:00:00.0000000=
00 +0100<br>
++++ bind-9.3.1/init.d=C2=A0 2005-07-10 23:09:58.000000000 +0200<br>
+@@ -0,0 +1,70 @@<br>
++#!/bin/sh<br>
++<br>
++PATH=3D/sbin:/bin:/usr/sbin:/usr/bin<br>
++<br>
++# for a chrooted server: &quot;-u bind -t /var/lib/named&quot;<br>
++# Don&#39;t modify this line, change or create /etc/default/bind9.<br>
++OPTIONS=3D&quot;&quot;<br>
++<br>
++test -f /etc/default/bind9 &amp;&amp; . /etc/default/bind9<br>
++<br>
++test -x /usr/sbin/rndc || exit 0<br>
++<br>
++case &quot;$1&quot; in<br>
++=C2=A0 =C2=A0 start)<br>
++=C2=A0 =C2=A0 =C2=A0 echo -n &quot;Starting domain name service: named&q=
uot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 modprobe capability &gt;/dev/null 2&gt;&amp;1 || tr=
ue<br>
++=C2=A0 =C2=A0 =C2=A0 if [ ! -f /etc/bind/rndc.key ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/sbin/rndc-confgen -a -b 512 -r /=
dev/urandom<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 0640 /etc/bind/rndc.key<br>
++=C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 if [ -f /var/run/named/named.pid ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ps `cat /var/run/named/named.pid` &gt=
; /dev/null &amp;&amp; exit 1<br>
++=C2=A0 =C2=A0 =C2=A0 fi<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 # dirs under /var/run can go away on reboots.<br>
++=C2=A0 =C2=A0 =C2=A0 mkdir -p /var/run/named<br>
++=C2=A0 =C2=A0 =C2=A0 mkdir -p /var/cache/bind<br>
++=C2=A0 =C2=A0 =C2=A0 chmod 775 /var/run/named<br>
++=C2=A0 =C2=A0 =C2=A0 chown root:bind /var/run/named &gt;/dev/null 2&gt;&=
amp;1 || true<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if [ ! -x /usr/sbin/named ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;named binary missing - not=
 starting&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
++=C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 if start-stop-daemon --start --quiet --exec /usr/sb=
in/named \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pidfile /var/run/name=
d/named.pid -- $OPTIONS; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -x /sbin/resolvconf ] ; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;nameserver 1=
27.0.0.1&quot; | /sbin/resolvconf -a lo<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 echo &quot;.&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
++=C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 stop)<br>
++=C2=A0 =C2=A0 =C2=A0 echo -n &quot;Stopping domain name service: named&q=
uot;<br>
++=C2=A0 =C2=A0 =C2=A0 if [ -x /sbin/resolvconf ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sbin/resolvconf -d lo<br>
++=C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 /usr/sbin/rndc stop &gt;/dev/null 2&gt;&amp;1<br>
++=C2=A0 =C2=A0 =C2=A0 echo &quot;.&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
++=C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 reload)<br>
++=C2=A0 =C2=A0 =C2=A0 /usr/sbin/rndc reload<br>
++=C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 restart|force-reload)<br>
++=C2=A0 =C2=A0 =C2=A0 $0 stop<br>
++=C2=A0 =C2=A0 =C2=A0 sleep 2<br>
++=C2=A0 =C2=A0 =C2=A0 $0 start<br>
++=C2=A0 =C2=A0 ;;<br>
++=C2=A0 =C2=A0 <br>
++=C2=A0 =C2=A0 *)<br>
++=C2=A0 =C2=A0 =C2=A0 echo &quot;Usage: /etc/init.d/bind {start|stop|relo=
ad|restart|force-reload}&quot; &gt;&amp;2<br>
++=C2=A0 =C2=A0 =C2=A0 exit 1<br>
++=C2=A0 =C2=A0 ;;<br>
++esac<br>
++<br>
++exit 0<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key=
.sh b/meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key.sh<br>
new file mode 100644<br>
index 0000000000..633e29c0e6<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key.sh<br>
@@ -0,0 +1,8 @@<br>
+#!/bin/sh<br>
+<br>
+if [ ! -s /etc/bind/rndc.key ]; then<br>
+=C2=A0 =C2=A0 echo -n &quot;Generating /etc/bind/rndc.key:&quot;<br>
+=C2=A0 =C2=A0 /usr/sbin/rndc-confgen -a -b 512<br>
+=C2=A0 =C2=A0 chown root:bind /etc/bind/rndc.key<br>
+=C2=A0 =C2=A0 chmod 0640 /etc/bind/rndc.key<br>
+fi<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/init.d-add-suppor=
t-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.11/=
init.d-add-support-for-read-only-rootfs.patch<br>
new file mode 100644<br>
index 0000000000..11db95ede1<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/bind/bind-9.16.11/init.d-add-support-for-r=
ead-only-rootfs.patch<br>
@@ -0,0 +1,65 @@<br>
+Subject: init.d: add support for read-only rootfs<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" targe=
t=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+---<br>
+ init.d |=C2=A0 =C2=A040 ++++++++++++++++++++++++++++++++++++++++<br>
+ 1 file changed, 40 insertions(+)<br>
+<br>
+diff --git a/init.d b/init.d<br>
+index 0111ed4..24677c8 100644<br>
+--- a/init.d<br>
++++ b/init.d<br>
+@@ -6,8 +6,48 @@ PATH=3D/sbin:/bin:/usr/sbin:/usr/bin<br>
+ # Don&#39;t modify this line, change or create /etc/default/bind9.<br>
+ OPTIONS=3D&quot;&quot;<br>
+ <br>
++test -f /etc/default/rcS &amp;&amp; . /etc/default/rcS<br>
+ test -f /etc/default/bind9 &amp;&amp; . /etc/default/bind9<br>
+ <br>
++# This function is here because it&#39;s possible that /var and / are on=
 different partitions.<br>
++is_on_read_only_partition () {<br>
++=C2=A0 =C2=A0 DIRECTORY=3D$1<br>
++=C2=A0 =C2=A0 dir=3D`readlink -f $DIRECTORY`<br>
++=C2=A0 =C2=A0 while true; do<br>
++=C2=A0 =C2=A0 =C2=A0 if [ ! -d &quot;$dir&quot; ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: $dir is not a direc=
tory&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for flag in `awk -v dir=3D$dir &#39;{=
 if ($2 =3D=3D dir) { print &quot;FOUND&quot;; split($4,FLAGS,&quot;,&quot;=
) } }; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 END { for (f in FLAGS) =
print FLAGS[f] }&#39; &lt; /proc/mounts`; do<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$flag&quot; =3D=
 &quot;FOUND&quot; ] &amp;&amp; partition=3D&quot;read-write&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$flag&quot; =3D=
 &quot;ro&quot; ] &amp;&amp; { partition=3D&quot;read-only&quot;; break; }<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$dir&quot; =3D &quot;/&quo=
t; -o -n &quot;$partition&quot; ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir=3D`dirname $dir`<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 done<br>
++=C2=A0 =C2=A0 [ &quot;$partition&quot; =3D &quot;read-only&quot; ] &amp;=
&amp; echo &quot;yes&quot; || echo &quot;no&quot;<br>
++}<br>
++<br>
++bind_mount () {<br>
++=C2=A0 =C2=A0 olddir=3D$1<br>
++=C2=A0 =C2=A0 newdir=3D$2<br>
++=C2=A0 =C2=A0 mkdir -p $olddir<br>
++=C2=A0 =C2=A0 cp -a $newdir/* $olddir<br>
++=C2=A0 =C2=A0 mount --bind $olddir $newdir<br>
++}<br>
++<br>
++# Deal with read-only rootfs<br>
++if [ &quot;$ROOTFS_READ_ONLY&quot; =3D &quot;yes&quot; ]; then<br>
++=C2=A0 =C2=A0 [ &quot;$VERBOSE&quot; !=3D &quot;no&quot; ] &amp;&amp; ec=
ho &quot;WARN: start bind service in read-only rootfs&quot;<br>
++=C2=A0 =C2=A0 [ `is_on_read_only_partition /etc/bind` =3D &quot;yes&quot=
; ] &amp;&amp; bind_mount /var/volatile/bind/etc /etc/bind<br>
++=C2=A0 =C2=A0 [ `is_on_read_only_partition /var/named` =3D &quot;yes&quo=
t; ] &amp;&amp; bind_mount /var/volatile/bind/named /var/named<br>
++fi<br>
++<br>
+ test -x /usr/sbin/rndc || exit 0<br>
+ <br>
+ case &quot;$1&quot; in<br>
+-- <br>
+1.7.9.5<br>
+<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/make-etc-initd-bi=
nd-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.11/make-etc-i=
nitd-bind-stop-work.patch<br>
new file mode 100644<br>
index 0000000000..146f3e35db<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/bind/bind-9.16.11/make-etc-initd-bind-stop=
-work.patch<br>
@@ -0,0 +1,42 @@<br>
+bind: make &quot;/etc/init.d/bind stop&quot; work<br>
+<br>
+Upstream-Status: Inappropriate [configuration]<br>
+<br>
+Add some configurations, make rndc command be able to controls<br>
+the named daemon.<br>
+<br>
+Signed-off-by: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com" ta=
rget=3D"_blank">rongqing.li@windriver.com</a>&gt;<br>
+---<br>
+ conf/named.conf |=C2=A0 =C2=A0 5 +++++<br>
+ conf/rndc.conf=C2=A0 |=C2=A0 =C2=A0 5 +++++<br>
+ 2 files changed, 10 insertions(+), 0 deletions(-)<br>
+ create mode 100644 conf/rndc.conf<br>
+<br>
+diff --git a/conf/named.conf b/conf/named.conf<br>
+index 95829cf..c8899e7 100644<br>
+--- a/conf/named.conf<br>
++++ b/conf/named.conf<br>
+@@ -47,3 +47,8 @@ zone &quot;255.in-addr.arpa&quot; {<br>
+ // root-delegation-only exclude { &quot;DE&quot;; &quot;MUSEUM&quot;; };=
<br>
+ <br>
+ include &quot;/etc/bind/named.conf.local&quot;;<br>
++include &quot;/etc/bind/rndc.key&quot; ;<br>
++controls {<br>
++=C2=A0 =C2=A0 =C2=A0 inet 127.0.0.1 allow { localhost; }<br>
++=C2=A0 =C2=A0 =C2=A0 keys { rndc-key; };<br>
++};<br>
+diff --git a/conf/rndc.conf b/conf/rndc.conf<br>
+new file mode 100644<br>
+index 0000000..a0b481d<br>
+--- /dev/null<br>
++++ b/conf/rndc.conf<br>
+@@ -0,0 +1,5 @@<br>
++include &quot;/etc/bind/rndc.key&quot;;<br>
++options {<br>
++=C2=A0 =C2=A0 =C2=A0 default-server=C2=A0 localhost;<br>
++=C2=A0 =C2=A0 =C2=A0 default-key=C2=A0 =C2=A0 =C2=A0rndc-key;<br>
++};<br>
+<br>
+-- <br>
+1.7.5.4<br>
+<br>
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/named.service b/m=
eta/recipes-connectivity/bind/bind-9.16.11/named.service<br>
new file mode 100644<br>
index 0000000000..cda56ef015<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/bind/bind-9.16.11/named.service<br>
@@ -0,0 +1,22 @@<br>
+[Unit]<br>
+Description=3DBerkeley Internet Name Domain (DNS)<br>
+Wants=3Dnss-lookup.target<br>
+Before=3Dnss-lookup.target<br>
+After=3Dnetwork.target<br>
+<br>
+[Service]<br>
+Type=3Dforking<br>
+EnvironmentFile=3D-/etc/default/bind9<br>
+PIDFile=3D/run/named/named.pid<br>
+<br>
+ExecStartPre=3D@SBINDIR@/generate-rndc-key.sh<br>
+ExecStart=3D@SBINDIR@/named $OPTIONS<br>
+<br>
+ExecReload=3D@BASE_BINDIR@/sh -c &#39;@SBINDIR@/rndc reload &gt; /dev/nul=
l 2&gt;&amp;1 || @BASE_BINDIR@/kill -HUP $MAINPID&#39;<br>
+<br>
+ExecStop=3D@BASE_BINDIR@/sh -c &#39;@SBINDIR@/rndc stop &gt; /dev/null 2&=
gt;&amp;1 || @BASE_BINDIR@/kill -TERM $MAINPID&#39;<br>
+<br>
+PrivateTmp=3Dtrue<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
diff --git a/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.16.10=
.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.16.10.bb</a> b/meta/recipe=
s-connectivity/bind/<a href=3D"http://bind_9.16.11.bb" rel=3D"noreferrer" t=
arget=3D"_blank">bind_9.16.11.bb</a><br>
similarity index 96%<br>
rename from meta/recipes-connectivity/bind/<a href=3D"http://bind_9.16.10.=
bb" rel=3D"noreferrer" target=3D"_blank">bind_9.16.10.bb</a><br>
rename to meta/recipes-connectivity/bind/<a href=3D"http://bind_9.16.11.bb=
" rel=3D"noreferrer" target=3D"_blank">bind_9.16.11.bb</a><br>
index 71194a61bf..3b76a1f5cd 100644<br>
--- a/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.16.10.bb" re=
l=3D"noreferrer" target=3D"_blank">bind_9.16.10.bb</a><br>
+++ b/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.16.11.bb" re=
l=3D"noreferrer" target=3D"_blank">bind_9.16.11.bb</a><br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://www.isc.org/bind/" r=
el=3D"noreferrer" target=3D"_blank">https://www.isc.org/bind/</a>&quot;<br>
=C2=A0SECTION =3D &quot;console/network&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;MPL-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D4673dc07337cace3b93c65e=
9ffe57b60&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3Def10b4de6371115dcecdc38=
ca2af4561&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;openssl libcap zlib libuv&quot;<br>
<br>
@@ -19,7 +19,7 @@ SRC_URI =3D &quot;<a href=3D"https://ftp.isc.org/isc/bin=
d9/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_bla=
nk">https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-avoid-start-failure-=
with-bind-user.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;bc47fc019c6205e6a6bfb839c544a1472321df0537ba=
905b846a4cbffe3362b3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0111f64dd7d8f515cfa129e181cce96ff82070d1b27f=
11a21f6856110d0699c1&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://ftp.isc.org/isc/bind=
9/" rel=3D"noreferrer" target=3D"_blank">https://ftp.isc.org/isc/bind9/</a>=
&quot;<br>
=C2=A0# stay at 9.16 follow the ESV versions divisible by 4<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000e464fb05b9efde3b--
