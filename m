Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.43852.1599492536037901835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 08:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uKOCU0c8;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id q4so703898pjh.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dYU+HTRNanzvQdMLEzKfo20WpDgQ9zSFRAUUyi/kBZM=;
        b=uKOCU0c87HweXsetXXm5CKCWlPWbLXFv39+n+JPB5VpVCij00yQWmi+vuv33Uia5Yl
         ytW7yP/Wtn8CTJNAa/Wp159Tif3atmIwhSzH7VYy5lCSU0jKSZQzd5MvSLATTasSz3Nj
         JaNhBeApMSNXwjkt5w9fffOLLhz4Uqojy+iuKF9p8LUHb+iENBuqZQatRbjKXlX8oXXD
         0Hb/lgpWpUHBIiQ0+b0DyiX1l2G2shn3zXiRf2YUt1ykE2IQXKPYmqFE9TIjDChbGnuu
         GyxyfqcKoImXnaGecFLI4o3HAsh/W7pMTUJMHp99BfBrf+LOdaJjXTLZEt3n8NYSA9MR
         rGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=dYU+HTRNanzvQdMLEzKfo20WpDgQ9zSFRAUUyi/kBZM=;
        b=FpiUVMo7xpZhe1NUWTUgtPNWC3LF9XLevmZTxBJzTaPn3djrIoBCl0hRvjg8jtrtL6
         hJTNjP0RLFKaLU+ExDf6xH0P3xi9/duRfLuNshWMyWoz6T8I1iC7xMihAtZBu4N6F0H0
         0n4hDTO1y7y7wWpx7UkHB7uceOSsnCuyzqtiATKkATehahykwEyLJL+hdQc8Nnk73DBJ
         Vf7S8UP6ONDQM//ksqUEHBpEnypLHnyYW2CRvBTIMGfikbDS2x4laCMmtLcmUlG0KRRv
         9AkyzOY/Z/BuICYfYE0FDrznvpgmCQaIhby3eFJ+fHlrvAAf1NSFDL+JSsPiJKb1n5UO
         UFgQ==
X-Gm-Message-State: AOAM530qeZ0KFhsXC1b2QxG56urdrYekDHQYNoqDfi05fn7J3uPzcCNF
	49siaS68Y4pVb6pOcN1kFhUmLTWmk0A=
X-Google-Smtp-Source: ABdhPJzCjkKxQUn+75XEUo6Y405usytfrUrA+S9BmUJXMw3dmrp8vAhTImdSqCQqb9NRx2/7knnpTg==
X-Received: by 2002:a17:902:8a85:: with SMTP id p5mr19666370plo.193.1599492534453;
        Mon, 07 Sep 2020 08:28:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:5e2:c7ea:56cb:5d37? ([2601:202:4180:a5c0:5e2:c7ea:56cb:5d37])
        by smtp.gmail.com with ESMTPSA id br22sm7062786pjb.35.2020.09.07.08.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 08:28:53 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 7/8] bind: Add 9.16.x
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20200901152236.9377-1-akuster808@gmail.com>
 <20200901152236.9377-7-akuster808@gmail.com>
 <CAHtQpK7cr7Ht109e_V+Qwy8nb3R3bOthLPq=yr3VBB4vG0XLvA@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <f5ae90fe-02e7-47b5-2166-fe89488678ca@gmail.com>
Date: Mon, 7 Sep 2020 08:28:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHtQpK7cr7Ht109e_V+Qwy8nb3R3bOthLPq=yr3VBB4vG0XLvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/4/20 1:39 AM, Andrey Zhizhikin wrote:
> Hello Armin,
>
> On Tue, Sep 1, 2020 at 5:23 PM akuster <akuster808@gmail.com> wrote:
>> Removed obsolete packageconfig options
>>
>> License change to MPL-2.0
>> https://gitlab.isc.org/isc-projects/bind9/blob/master/LICENSE
>>
>> Refreshed:
>> bind-ensure-searching-for-json-headers-searches-sysr.patch
>> 0001-named-lwresd-V-and-start-log-hide-build-options.patch
>> bind-ensure-searching-for-json-headers-searches-sysr.patch
>>
>> Drop obsolete patch: 0001-configure.in-remove-useless-L-use_openssl-lib.patch
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  ...1-avoid-start-failure-with-bind-user.patch |  27 ++
>>  ...d-V-and-start-log-hide-build-options.patch |  35 ++
>>  ...ching-for-json-headers-searches-sysr.patch |  47 +++
>>  .../bind/bind-9.16.5/bind9                    |   2 +
>>  .../bind/bind-9.16.5/conf.patch               | 330 ++++++++++++++++++
>>  .../bind/bind-9.16.5/generate-rndc-key.sh     |   8 +
>>  ...t.d-add-support-for-read-only-rootfs.patch |  65 ++++
>>  .../make-etc-initd-bind-stop-work.patch       |  42 +++
>>  .../bind/bind-9.16.5/named.service            |  22 ++
>>  meta/recipes-connectivity/bind/bind_9.16.5.bb | 125 +++++++
>>  10 files changed, 703 insertions(+)
>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/0001-avoid-start-failure-with-bind-user.patch
>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch
>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/bind-ensure-searching-for-json-headers-searches-sysr.patch
>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/bind9
>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/conf.patch
>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/init.d-add-support-for-read-only-rootfs.patch
>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/make-etc-initd-bind-stop-work.patch
>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/named.service
>>  create mode 100644 meta/recipes-connectivity/bind/bind_9.16.5.bb
>>
>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.5/0001-avoid-start-failure-with-bind-user.patch
>> new file mode 100644
>> index 00000000000..8db96ec049c
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/0001-avoid-start-failure-with-bind-user.patch
>> @@ -0,0 +1,27 @@
>> +From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Mon, 15 Oct 2018 16:55:09 +0800
>> +Subject: [PATCH] avoid start failure with bind user
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + init.d | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/init.d b/init.d
>> +index b2eec60..6e03936 100644
>> +--- a/init.d
>> ++++ b/init.d
>> +@@ -57,6 +57,7 @@ case "$1" in
>> +       modprobe capability >/dev/null 2>&1 || true
>> +       if [ ! -f /etc/bind/rndc.key ]; then
>> +           /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
>> ++          chown root:bind /etc/bind/rndc.key >/dev/null 2>&1 || true
>> +           chmod 0640 /etc/bind/rndc.key
>> +       fi
>> +       if [ -f /var/run/named/named.pid ]; then
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch
>> new file mode 100644
>> index 00000000000..5bcc16c9b2b
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch
>> @@ -0,0 +1,35 @@
>> +From a3af4a405baf5ff582e82aaba392dd9667d94bdc Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Mon, 27 Aug 2018 21:24:20 +0800
>> +Subject: [PATCH] `named/lwresd -V' and start log hide build options
>> +
>> +The build options expose build path directories, so hide them.
>> +[snip]
>> +$ named -V
>> +|built by make with *** (options are hidden)
>> +[snip]
>> +
>> +Upstream-Status: Inappropriate [oe-core specific]
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +
>> +Refreshed for 9.16.0
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + bin/named/include/named/globals.h | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +Index: bind-9.16.0/bin/named/include/named/globals.h
>> +===================================================================
>> +--- bind-9.16.0.orig/bin/named/include/named/globals.h
>> ++++ bind-9.16.0/bin/named/include/named/globals.h
>> +@@ -69,7 +69,7 @@ EXTERN const char *named_g_version     I
>> + EXTERN const char *named_g_product     INIT(PRODUCT);
>> + EXTERN const char *named_g_description INIT(DESCRIPTION);
>> + EXTERN const char *named_g_srcid       INIT(SRCID);
>> +-EXTERN const char *named_g_configargs  INIT(CONFIGARGS);
>> ++EXTERN const char *named_g_configargs  INIT("*** (options are hidden)");
>> + EXTERN const char *named_g_builder     INIT(BUILDER);
>> + EXTERN in_port_t named_g_port        INIT(0);
>> + EXTERN isc_dscp_t named_g_dscp               INIT(-1);
>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.5/bind-ensure-searching-for-json-headers-searches-sysr.patch
>> new file mode 100644
>> index 00000000000..f9cdc7ca4df
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/bind-ensure-searching-for-json-headers-searches-sysr.patch
>> @@ -0,0 +1,47 @@
>> +From edda20fb5a6e88548f85e39d34d6c074306e15bc Mon Sep 17 00:00:00 2001
>> +From: Paul Gortmaker <paul.gortmaker@windriver.com>
>> +Date: Tue, 9 Jun 2015 11:22:00 -0400
>> +Subject: [PATCH] bind: ensure searching for json headers searches sysroot
>> +
>> +Bind can fail configure by detecting headers w/o libs[1], or
>> +it can fail the host contamination check as per below:
>> +
>> +ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
>> +Rerun configure task after fixing this. The path was 'build/tmp/work/core2-64-poky-linux/bind/9.10.2-r1/build'
>> +ERROR: Function failed: do_qa_configure
>> +ERROR: Logfile of failure stored in: build/tmp/work/core2-64-poky-linux/bind/9.10.2-r1/temp/log.do_configure.5242
>> +ERROR: Task 5 (meta/recipes-connectivity/bind/bind_9.10.2.bb, do_configure) failed with exit code '1'
>> +NOTE: Tasks Summary: Attempted 773 tasks of which 768 didn't need to be rerun and 1 failed.
>> +No currently running tasks (773 of 781)
>> +
>> +Summary: 1 task failed:
>> +  /meta/recipes-connectivity/bind/bind_9.10.2.bb, do_configure
>> +
>> +One way to fix it would be to unconditionally disable json in bind
>> +configure[2] but here we fix it by using the path to where we would
>> +put the header if we had json in the sysroot, in case someone wants
>> +to make use of the combination some day.
>> +
>> +[1] https://trac.macports.org/ticket/45305
>> +[2] https://trac.macports.org/changeset/126406
>> +
>> +Upstream-Status: Inappropriate [OE Specific]
>> +Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>> +
>> +---
>> + configure.ac | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +Index: bind-9.16.4/configure.ac
>> +===================================================================
>> +--- bind-9.16.4.orig/configure.ac
>> ++++ bind-9.16.4/configure.ac
>> +@@ -1232,7 +1232,7 @@ case "$use_lmdb" in
>> +               LMDB_LIBS=""
>> +               ;;
>> +       auto|yes)
>> +-              for d in /usr /usr/local /opt/local
>> ++              for d in "${STAGING_INCDIR}"
>> +               do
>> +                       if test -f "${d}/include/lmdb.h"
>> +                       then
>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/bind9 b/meta/recipes-connectivity/bind/bind-9.16.5/bind9
>> new file mode 100644
>> index 00000000000..968679ff7f7
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/bind9
>> @@ -0,0 +1,2 @@
>> +# startup options for the server
>> +OPTIONS="-u bind"
>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.5/conf.patch
>> new file mode 100644
>> index 00000000000..aad345f9fcf
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/conf.patch
>> @@ -0,0 +1,330 @@
>> +Upstream-Status: Inappropriate [configuration]
>> +
>> +the patch is imported from openembedded project
>> +
>> +11/30/2010 - Qing He <qing.he@intel.com>
>> +
>> +diff -urN bind-9.3.1.orig/conf/db.0 bind-9.3.1/conf/db.0
>> +--- bind-9.3.1.orig/conf/db.0  1970-01-01 01:00:00.000000000 +0100
>> ++++ bind-9.3.1/conf/db.0       2005-07-10 22:14:00.000000000 +0200
>> +@@ -0,0 +1,12 @@
>> ++;
>> ++; BIND reverse data file for broadcast zone
>> ++;
>> ++$TTL  604800
>> ++@     IN      SOA     localhost. root.localhost. (
>> ++                            1         ; Serial
>> ++                       604800         ; Refresh
>> ++                        86400         ; Retry
>> ++                      2419200         ; Expire
>> ++                       604800 )       ; Negative Cache TTL
>> ++;
>> ++@     IN      NS      localhost.
>> +diff -urN bind-9.3.1.orig/conf/db.127 bind-9.3.1/conf/db.127
>> +--- bind-9.3.1.orig/conf/db.127        1970-01-01 01:00:00.000000000 +0100
>> ++++ bind-9.3.1/conf/db.127     2005-07-10 22:14:00.000000000 +0200
>> +@@ -0,0 +1,13 @@
>> ++;
>> ++; BIND reverse data file for local loopback interface
>> ++;
>> ++$TTL  604800
>> ++@     IN      SOA     localhost. root.localhost. (
>> ++                            1         ; Serial
>> ++                       604800         ; Refresh
>> ++                        86400         ; Retry
>> ++                      2419200         ; Expire
>> ++                       604800 )       ; Negative Cache TTL
>> ++;
>> ++@     IN      NS      localhost.
>> ++1.0.0 IN      PTR     localhost.
>> +diff -urN bind-9.3.1.orig/conf/db.empty bind-9.3.1/conf/db.empty
>> +--- bind-9.3.1.orig/conf/db.empty      1970-01-01 01:00:00.000000000 +0100
>> ++++ bind-9.3.1/conf/db.empty   2005-07-10 22:14:00.000000000 +0200
>> +@@ -0,0 +1,14 @@
>> ++; BIND reverse data file for empty rfc1918 zone
>> ++;
>> ++; DO NOT EDIT THIS FILE - it is used for multiple zones.
>> ++; Instead, copy it, edit named.conf, and use that copy.
>> ++;
>> ++$TTL  86400
>> ++@     IN      SOA     localhost. root.localhost. (
>> ++                            1         ; Serial
>> ++                       604800         ; Refresh
>> ++                        86400         ; Retry
>> ++                      2419200         ; Expire
>> ++                        86400 )       ; Negative Cache TTL
>> ++;
>> ++@     IN      NS      localhost.
>> +diff -urN bind-9.3.1.orig/conf/db.255 bind-9.3.1/conf/db.255
>> +--- bind-9.3.1.orig/conf/db.255        1970-01-01 01:00:00.000000000 +0100
>> ++++ bind-9.3.1/conf/db.255     2005-07-10 22:14:00.000000000 +0200
>> +@@ -0,0 +1,12 @@
>> ++;
>> ++; BIND reserve data file for broadcast zone
>> ++;
>> ++$TTL  604800
>> ++@     IN      SOA     localhost. root.localhost. (
>> ++                            1         ; Serial
>> ++                       604800         ; Refresh
>> ++                        86400         ; Retry
>> ++                      2419200         ; Expire
>> ++                       604800 )       ; Negative Cache TTL
>> ++;
>> ++@     IN      NS      localhost.
>> +diff -urN bind-9.3.1.orig/conf/db.local bind-9.3.1/conf/db.local
>> +--- bind-9.3.1.orig/conf/db.local      1970-01-01 01:00:00.000000000 +0100
>> ++++ bind-9.3.1/conf/db.local   2005-07-10 22:14:00.000000000 +0200
>> +@@ -0,0 +1,13 @@
>> ++;
>> ++; BIND data file for local loopback interface
>> ++;
>> ++$TTL  604800
>> ++@     IN      SOA     localhost. root.localhost. (
>> ++                            1         ; Serial
>> ++                       604800         ; Refresh
>> ++                        86400         ; Retry
>> ++                      2419200         ; Expire
>> ++                       604800 )       ; Negative Cache TTL
>> ++;
>> ++@     IN      NS      localhost.
>> ++@     IN      A       127.0.0.1
>> +diff -urN bind-9.3.1.orig/conf/db.root bind-9.3.1/conf/db.root
>> +--- bind-9.3.1.orig/conf/db.root       1970-01-01 01:00:00.000000000 +0100
>> ++++ bind-9.3.1/conf/db.root    2005-07-10 22:14:00.000000000 +0200
>> +@@ -0,0 +1,45 @@
>> ++
>> ++; <<>> DiG 9.2.3 <<>> ns . @a.root-servers.net.
>> ++;; global options:  printcmd
>> ++;; Got answer:
>> ++;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18944
>> ++;; flags: qr aa rd; QUERY: 1, ANSWER: 13, AUTHORITY: 0, ADDITIONAL: 13
>> ++
>> ++;; QUESTION SECTION:
>> ++;.                            IN      NS
>> ++
>> ++;; ANSWER SECTION:
>> ++.                     518400  IN      NS      A.ROOT-SERVERS.NET.
>> ++.                     518400  IN      NS      B.ROOT-SERVERS.NET.
>> ++.                     518400  IN      NS      C.ROOT-SERVERS.NET.
>> ++.                     518400  IN      NS      D.ROOT-SERVERS.NET.
>> ++.                     518400  IN      NS      E.ROOT-SERVERS.NET.
>> ++.                     518400  IN      NS      F.ROOT-SERVERS.NET.
>> ++.                     518400  IN      NS      G.ROOT-SERVERS.NET.
>> ++.                     518400  IN      NS      H.ROOT-SERVERS.NET.
>> ++.                     518400  IN      NS      I.ROOT-SERVERS.NET.
>> ++.                     518400  IN      NS      J.ROOT-SERVERS.NET.
>> ++.                     518400  IN      NS      K.ROOT-SERVERS.NET.
>> ++.                     518400  IN      NS      L.ROOT-SERVERS.NET.
>> ++.                     518400  IN      NS      M.ROOT-SERVERS.NET.
>> ++
>> ++;; ADDITIONAL SECTION:
>> ++A.ROOT-SERVERS.NET.   3600000 IN      A       198.41.0.4
>> ++B.ROOT-SERVERS.NET.   3600000 IN      A       192.228.79.201
>> ++C.ROOT-SERVERS.NET.   3600000 IN      A       192.33.4.12
>> ++D.ROOT-SERVERS.NET.   3600000 IN      A       128.8.10.90
>> ++E.ROOT-SERVERS.NET.   3600000 IN      A       192.203.230.10
>> ++F.ROOT-SERVERS.NET.   3600000 IN      A       192.5.5.241
>> ++G.ROOT-SERVERS.NET.   3600000 IN      A       192.112.36.4
>> ++H.ROOT-SERVERS.NET.   3600000 IN      A       128.63.2.53
>> ++I.ROOT-SERVERS.NET.   3600000 IN      A       192.36.148.17
>> ++J.ROOT-SERVERS.NET.   3600000 IN      A       192.58.128.30
>> ++K.ROOT-SERVERS.NET.   3600000 IN      A       193.0.14.129
>> ++L.ROOT-SERVERS.NET.   3600000 IN      A       198.32.64.12
>> ++M.ROOT-SERVERS.NET.   3600000 IN      A       202.12.27.33
>> ++
>> ++;; Query time: 81 msec
>> ++;; SERVER: 198.41.0.4#53(a.root-servers.net.)
>> ++;; WHEN: Sun Feb  1 11:27:14 2004
>> ++;; MSG SIZE  rcvd: 436
>> ++
>> +diff -urN bind-9.3.1.orig/conf/named.conf bind-9.3.1/conf/named.conf
>> +--- bind-9.3.1.orig/conf/named.conf    1970-01-01 01:00:00.000000000 +0100
>> ++++ bind-9.3.1/conf/named.conf 2005-07-10 22:33:46.000000000 +0200
>> +@@ -0,0 +1,49 @@
>> ++// This is the primary configuration file for the BIND DNS server named.
>> ++//
>> ++// If you are just adding zones, please do that in /etc/bind/named.conf.local
>> ++
>> ++include "/etc/bind/named.conf.options";
>> ++
>> ++// prime the server with knowledge of the root servers
>> ++zone "." {
>> ++      type hint;
>> ++      file "/etc/bind/db.root";
>> ++};
>> ++
>> ++// be authoritative for the localhost forward and reverse zones, and for
>> ++// broadcast zones as per RFC 1912
>> ++
>> ++zone "localhost" {
>> ++      type master;
>> ++      file "/etc/bind/db.local";
>> ++};
>> ++
>> ++zone "127.in-addr.arpa" {
>> ++      type master;
>> ++      file "/etc/bind/db.127";
>> ++};
>> ++
>> ++zone "0.in-addr.arpa" {
>> ++      type master;
>> ++      file "/etc/bind/db.0";
>> ++};
>> ++
>> ++zone "255.in-addr.arpa" {
>> ++      type master;
>> ++      file "/etc/bind/db.255";
>> ++};
>> ++
>> ++// zone "com" { type delegation-only; };
>> ++// zone "net" { type delegation-only; };
>> ++
>> ++// From the release notes:
>> ++//  Because many of our users are uncomfortable receiving undelegated answers
>> ++//  from root or top level domains, other than a few for whom that behaviour
>> ++//  has been trusted and expected for quite some length of time, we have now
>> ++//  introduced the "root-delegations-only" feature which applies delegation-only
>> ++//  logic to all top level domains, and to the root domain.  An exception list
>> ++//  should be specified, including "MUSEUM" and "DE", and any other top level
>> ++//  domains from whom undelegated responses are expected and trusted.
>> ++// root-delegation-only exclude { "DE"; "MUSEUM"; };
>> ++
>> ++include "/etc/bind/named.conf.local";
>> +diff -urN bind-9.3.1.orig/conf/named.conf.local bind-9.3.1/conf/named.conf.local
>> +--- bind-9.3.1.orig/conf/named.conf.local      1970-01-01 01:00:00.000000000 +0100
>> ++++ bind-9.3.1/conf/named.conf.local   2005-07-10 22:14:06.000000000 +0200
>> +@@ -0,0 +1,8 @@
>> ++//
>> ++// Do any local configuration here
>> ++//
>> ++
>> ++// Consider adding the 1918 zones here, if they are not used in your
>> ++// organization
>> ++//include "/etc/bind/zones.rfc1918";
>> ++
>> +diff -urN bind-9.3.1.orig/conf/named.conf.options bind-9.3.1/conf/named.conf.options
>> +--- bind-9.3.1.orig/conf/named.conf.options    1970-01-01 01:00:00.000000000 +0100
>> ++++ bind-9.3.1/conf/named.conf.options 2005-07-10 22:14:06.000000000 +0200
>> +@@ -0,0 +1,24 @@
>> ++options {
>> ++      directory "/var/cache/bind";
>> ++
>> ++      // If there is a firewall between you and nameservers you want
>> ++      // to talk to, you might need to uncomment the query-source
>> ++      // directive below.  Previous versions of BIND always asked
>> ++      // questions using port 53, but BIND 8.1 and later use an unprivileged
>> ++      // port by default.
>> ++
>> ++      // query-source address * port 53;
>> ++
>> ++      // If your ISP provided one or more IP addresses for stable
>> ++      // nameservers, you probably want to use them as forwarders.
>> ++      // Uncomment the following block, and insert the addresses replacing
>> ++      // the all-0's placeholder.
>> ++
>> ++      // forwarders {
>> ++      //      0.0.0.0;
>> ++      // };
>> ++
>> ++      auth-nxdomain no;    # conform to RFC1035
>> ++
>> ++};
>> ++
>> +diff -urN bind-9.3.1.orig/conf/zones.rfc1918 bind-9.3.1/conf/zones.rfc1918
>> +--- bind-9.3.1.orig/conf/zones.rfc1918 1970-01-01 01:00:00.000000000 +0100
>> ++++ bind-9.3.1/conf/zones.rfc1918      2005-07-10 22:14:10.000000000 +0200
>> +@@ -0,0 +1,20 @@
>> ++zone "10.in-addr.arpa"      { type master; file "/etc/bind/db.empty"; };
>> ++
>> ++zone "16.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "17.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "18.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "19.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "20.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "21.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "22.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "23.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "24.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "25.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "26.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "27.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "28.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "29.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "30.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++zone "31.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
>> ++
>> ++zone "168.192.in-addr.arpa" { type master; file "/etc/bind/db.empty"; };
>> +diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
>> +--- bind-9.3.1.orig/init.d     1970-01-01 01:00:00.000000000 +0100
>> ++++ bind-9.3.1/init.d  2005-07-10 23:09:58.000000000 +0200
>> +@@ -0,0 +1,70 @@
>> ++#!/bin/sh
>> ++
>> ++PATH=/sbin:/bin:/usr/sbin:/usr/bin
>> ++
>> ++# for a chrooted server: "-u bind -t /var/lib/named"
>> ++# Don't modify this line, change or create /etc/default/bind9.
>> ++OPTIONS=""
>> ++
>> ++test -f /etc/default/bind9 && . /etc/default/bind9
>> ++
>> ++test -x /usr/sbin/rndc || exit 0
>> ++
>> ++case "$1" in
>> ++    start)
>> ++      echo -n "Starting domain name service: named"
>> ++
>> ++      modprobe capability >/dev/null 2>&1 || true
>> ++      if [ ! -f /etc/bind/rndc.key ]; then
>> ++          /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
>> ++          chmod 0640 /etc/bind/rndc.key
>> ++      fi
>> ++      if [ -f /var/run/named/named.pid ]; then
>> ++          ps `cat /var/run/named/named.pid` > /dev/null && exit 1
>> ++      fi
>> ++
>> ++      # dirs under /var/run can go away on reboots.
>> ++      mkdir -p /var/run/named
>> ++      mkdir -p /var/cache/bind
>> ++      chmod 775 /var/run/named
>> ++      chown root:bind /var/run/named >/dev/null 2>&1 || true
>> ++
>> ++      if [ ! -x /usr/sbin/named ]; then
>> ++          echo "named binary missing - not starting"
>> ++          exit 1
>> ++      fi
>> ++      if start-stop-daemon --start --quiet --exec /usr/sbin/named \
>> ++              --pidfile /var/run/named/named.pid -- $OPTIONS; then
>> ++          if [ -x /sbin/resolvconf ] ; then
>> ++              echo "nameserver 127.0.0.1" | /sbin/resolvconf -a lo
>> ++          fi
>> ++      fi
>> ++      echo "."
>> ++    ;;
>> ++
>> ++    stop)
>> ++      echo -n "Stopping domain name service: named"
>> ++      if [ -x /sbin/resolvconf ]; then
>> ++          /sbin/resolvconf -d lo
>> ++      fi
>> ++      /usr/sbin/rndc stop >/dev/null 2>&1
>> ++      echo "."
>> ++    ;;
>> ++
>> ++    reload)
>> ++      /usr/sbin/rndc reload
>> ++    ;;
>> ++
>> ++    restart|force-reload)
>> ++      $0 stop
>> ++      sleep 2
>> ++      $0 start
>> ++    ;;
>> ++
>> ++    *)
>> ++      echo "Usage: /etc/init.d/bind {start|stop|reload|restart|force-reload}" >&2
>> ++      exit 1
>> ++    ;;
>> ++esac
>> ++
>> ++exit 0
>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
>> new file mode 100644
>> index 00000000000..ef915c0ae5a
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
>> @@ -0,0 +1,8 @@
>> +#!/bin/sh
>> +
>> +if [ ! -s /etc/bind/rndc.key ]; then
>> +    echo -n "Generating /etc/bind/rndc.key:"
>> +    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
>> +    chown root:bind /etc/bind/rndc.key
>> +    chmod 0640 /etc/bind/rndc.key
>> +fi
>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.5/init.d-add-support-for-read-only-rootfs.patch
>> new file mode 100644
>> index 00000000000..11db95ede12
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/init.d-add-support-for-read-only-rootfs.patch
>> @@ -0,0 +1,65 @@
>> +Subject: init.d: add support for read-only rootfs
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + init.d |   40 ++++++++++++++++++++++++++++++++++++++++
>> + 1 file changed, 40 insertions(+)
>> +
>> +diff --git a/init.d b/init.d
>> +index 0111ed4..24677c8 100644
>> +--- a/init.d
>> ++++ b/init.d
>> +@@ -6,8 +6,48 @@ PATH=/sbin:/bin:/usr/sbin:/usr/bin
>> + # Don't modify this line, change or create /etc/default/bind9.
>> + OPTIONS=""
>> +
>> ++test -f /etc/default/rcS && . /etc/default/rcS
>> + test -f /etc/default/bind9 && . /etc/default/bind9
>> +
>> ++# This function is here because it's possible that /var and / are on different partitions.
>> ++is_on_read_only_partition () {
>> ++    DIRECTORY=$1
>> ++    dir=`readlink -f $DIRECTORY`
>> ++    while true; do
>> ++      if [ ! -d "$dir" ]; then
>> ++          echo "ERROR: $dir is not a directory"
>> ++          exit 1
>> ++      else
>> ++          for flag in `awk -v dir=$dir '{ if ($2 == dir) { print "FOUND"; split($4,FLAGS,",") } }; \
>> ++              END { for (f in FLAGS) print FLAGS[f] }' < /proc/mounts`; do
>> ++              [ "$flag" = "FOUND" ] && partition="read-write"
>> ++              [ "$flag" = "ro" ] && { partition="read-only"; break; }
>> ++          done
>> ++          if [ "$dir" = "/" -o -n "$partition" ]; then
>> ++              break
>> ++          else
>> ++              dir=`dirname $dir`
>> ++          fi
>> ++      fi
>> ++    done
>> ++    [ "$partition" = "read-only" ] && echo "yes" || echo "no"
>> ++}
>> ++
>> ++bind_mount () {
>> ++    olddir=$1
>> ++    newdir=$2
>> ++    mkdir -p $olddir
>> ++    cp -a $newdir/* $olddir
>> ++    mount --bind $olddir $newdir
>> ++}
>> ++
>> ++# Deal with read-only rootfs
>> ++if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
>> ++    [ "$VERBOSE" != "no" ] && echo "WARN: start bind service in read-only rootfs"
>> ++    [ `is_on_read_only_partition /etc/bind` = "yes" ] && bind_mount /var/volatile/bind/etc /etc/bind
>> ++    [ `is_on_read_only_partition /var/named` = "yes" ] && bind_mount /var/volatile/bind/named /var/named
>> ++fi
>> ++
>> + test -x /usr/sbin/rndc || exit 0
>> +
>> + case "$1" in
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.5/make-etc-initd-bind-stop-work.patch
>> new file mode 100644
>> index 00000000000..146f3e35db6
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/make-etc-initd-bind-stop-work.patch
>> @@ -0,0 +1,42 @@
>> +bind: make "/etc/init.d/bind stop" work
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +
>> +Add some configurations, make rndc command be able to controls
>> +the named daemon.
>> +
>> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> +---
>> + conf/named.conf |    5 +++++
>> + conf/rndc.conf  |    5 +++++
>> + 2 files changed, 10 insertions(+), 0 deletions(-)
>> + create mode 100644 conf/rndc.conf
>> +
>> +diff --git a/conf/named.conf b/conf/named.conf
>> +index 95829cf..c8899e7 100644
>> +--- a/conf/named.conf
>> ++++ b/conf/named.conf
>> +@@ -47,3 +47,8 @@ zone "255.in-addr.arpa" {
>> + // root-delegation-only exclude { "DE"; "MUSEUM"; };
>> +
>> + include "/etc/bind/named.conf.local";
>> ++include "/etc/bind/rndc.key" ;
>> ++controls {
>> ++      inet 127.0.0.1 allow { localhost; }
>> ++      keys { rndc-key; };
>> ++};
>> +diff --git a/conf/rndc.conf b/conf/rndc.conf
>> +new file mode 100644
>> +index 0000000..a0b481d
>> +--- /dev/null
>> ++++ b/conf/rndc.conf
>> +@@ -0,0 +1,5 @@
>> ++include "/etc/bind/rndc.key";
>> ++options {
>> ++      default-server  localhost;
>> ++      default-key     rndc-key;
>> ++};
>> +
>> +--
>> +1.7.5.4
>> +
>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/named.service b/meta/recipes-connectivity/bind/bind-9.16.5/named.service
>> new file mode 100644
>> index 00000000000..cda56ef0150
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/named.service
>> @@ -0,0 +1,22 @@
>> +[Unit]
>> +Description=Berkeley Internet Name Domain (DNS)
>> +Wants=nss-lookup.target
>> +Before=nss-lookup.target
>> +After=network.target
>> +
>> +[Service]
>> +Type=forking
>> +EnvironmentFile=-/etc/default/bind9
>> +PIDFile=/run/named/named.pid
>> +
>> +ExecStartPre=@SBINDIR@/generate-rndc-key.sh
>> +ExecStart=@SBINDIR@/named $OPTIONS
>> +
>> +ExecReload=@BASE_BINDIR@/sh -c '@SBINDIR@/rndc reload > /dev/null 2>&1 || @BASE_BINDIR@/kill -HUP $MAINPID'
>> +
>> +ExecStop=@BASE_BINDIR@/sh -c '@SBINDIR@/rndc stop > /dev/null 2>&1 || @BASE_BINDIR@/kill -TERM $MAINPID'
>> +
>> +PrivateTmp=true
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> diff --git a/meta/recipes-connectivity/bind/bind_9.16.5.bb b/meta/recipes-connectivity/bind/bind_9.16.5.bb
>> new file mode 100644
>> index 00000000000..9c20ccc6fa2
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind_9.16.5.bb
>> @@ -0,0 +1,125 @@
>> +SUMMARY = "ISC Internet Domain Name Server"
>> +HOMEPAGE = "http://www.isc.org/sw/bind/"
>> +SECTION = "console/network"
>> +
>> +LICENSE = "MPL-2.0"
>> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=188b8d0644bd6835df43b84e3f180be1"
>> +
>> +DEPENDS = "openssl libcap zlib libuv"
>> +
>> +SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
>> +           file://conf.patch \
>> +           file://named.service \
>> +           file://bind9 \
>> +           file://generate-rndc-key.sh \
>> +           file://make-etc-initd-bind-stop-work.patch \
>> +           file://init.d-add-support-for-read-only-rootfs.patch \
>> +           file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
>> +           file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
>> +           file://0001-avoid-start-failure-with-bind-user.patch \
>> +           "
>> +
>> +SRC_URI[sha256sum] = "6378b3e51fef11a8be4794dc48e8111ba92d211c0dfd129a0c296ed06a3dc075"
>> +
>> +UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>> +# stay at 9.16 follow the ESV versions divisible by 4
>> +UPSTREAM_CHECK_REGEX = "(?P<pver>9.(16|20|24|28)(\.\d+)+(-P\d+)*)/"
>> +
>> +inherit autotools update-rc.d systemd useradd pkgconfig multilib_script multilib_header
>> +
>> +MULTILIB_SCRIPTS = "${PN}:${bindir}/bind9-config ${PN}:${bindir}/isc-config.sh"
>> +
>> +# PACKAGECONFIGs readline and libedit should NOT be set at same time
>> +PACKAGECONFIG ?= "readline"
>> +PACKAGECONFIG[httpstats] = "--with-libxml2=${STAGING_DIR_HOST}${prefix},--without-libxml2,libxml2"
>> +PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
>> +PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
>> +PACKAGECONFIG[python3] = "--with-python=yes --with-python-install-dir=${PYTHON_SITEPACKAGES_DIR} , --without-python, python3-ply-native,"
>> +
>> +EXTRA_OECONF = " --with-libtool --disable-devpoll --enable-epoll \
>> +                 --with-gssapi=no --with-lmdb=no --with-zlib \
>> +                 --sysconfdir=${sysconfdir}/bind \
>> +                 --with-openssl=${STAGING_DIR_HOST}${prefix} \
>> +               "
>> +LDFLAGS_append = " -lz"
>> +
>> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native distutils3-base', '', d)}
>> +
>> +# dhcp needs .la so keep them
>> +REMOVE_LIBTOOL_LA = "0"
>> +
>> +USERADD_PACKAGES = "${PN}"
>> +USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
>> +                       --user-group bind"
>> +
>> +INITSCRIPT_NAME = "bind"
>> +INITSCRIPT_PARAMS = "defaults"
>> +
>> +SYSTEMD_SERVICE_${PN} = "named.service"
>> +
>> +do_install_append() {
>> +
>> +       rmdir "${D}${localstatedir}/run"
>> +       rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
>> +       install -d -o bind "${D}${localstatedir}/cache/bind"
>> +       install -d "${D}${sysconfdir}/bind"
>> +       install -d "${D}${sysconfdir}/init.d"
>> +       install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>> +       install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
>> +        if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', 'false', d)}; then
>> +               sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
>> +               ${D}${sbindir}/dnssec-coverage \
>> +               ${D}${sbindir}/dnssec-checkds \
>> +               ${D}${sbindir}/dnssec-keymgr
>> +       fi
>> +
>> +       # Install systemd related files
>> +       install -d ${D}${sbindir}
>> +       install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
>> +       install -d ${D}${systemd_unitdir}/system
>> +       install -m 0644 ${WORKDIR}/named.service ${D}${systemd_unitdir}/system
>> +       sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
>> +              -e 's,@SBINDIR@,${sbindir},g' \
>> +              ${D}${systemd_unitdir}/system/named.service
>> +
>> +       install -d ${D}${sysconfdir}/default
>> +       install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
>> +
>> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>> +               install -d ${D}${sysconfdir}/tmpfiles.d
>> +               echo "d /run/named 0755 bind bind - -" > ${D}${sysconfdir}/tmpfiles.d/bind.conf
>> +       fi
>> +
>> +    oe_multilib_header isc/platform.h
>> +}
>> +
>> +CONFFILES_${PN} = " \
>> +       ${sysconfdir}/bind/named.conf \
>> +       ${sysconfdir}/bind/named.conf.local \
>> +       ${sysconfdir}/bind/named.conf.options \
>> +       ${sysconfdir}/bind/db.0 \
>> +       ${sysconfdir}/bind/db.127 \
>> +       ${sysconfdir}/bind/db.empty \
>> +       ${sysconfdir}/bind/db.local \
>> +       ${sysconfdir}/bind/db.root \
>> +       "
>> +
>> +ALTERNATIVE_${PN}-utils = "nslookup"
>> +ALTERNATIVE_LINK_NAME[nslookup] = "${bindir}/nslookup"
>> +ALTERNATIVE_PRIORITY = "100"
> I'm seeing this failing with busybox:
> update-alternatives: Error: not linking
> /development/yocto-master/build-output/work/imx8mmevk-fsl-linux/image-cmdline-validation/1.0-r0/rootfs/usr/bin/nslookup
> to /bin/busybox.nosuid since
> /development/yocto-master/build-output/work/imx8mmevk-fsl-linux/image-cmdline-validation/1.0-r0/rootfs/usr/bin/nslookup
> exists and is not a link
>
> busybox sets ALTERNATIVE_PRIORITY = "50". Can this be the issue?

That is weird. I would have expected that to be an issue with the old
version too.

Got any steps to reproduce this?

-armin
>
> Going back to bind 9.11.22 seems to solve it...
>
>> +
>> +PACKAGE_BEFORE_PN += "${PN}-utils"
>> +FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/mdig ${bindir}/nslookup ${bindir}/nsupdate"
>> +FILES_${PN}-dev += "${bindir}/isc-config.h"
>> +FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
>> +
>> +PACKAGE_BEFORE_PN += "${PN}-libs"
>> +FILES_${PN}-libs = "${libdir}/*.so* ${libdir}/named/*.so*"
>> +FILES_${PN}-staticdev += "${libdir}/*.la"
>> +
>> +PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-bind', '', d)}"
>> +FILES_python3-bind = "${sbindir}/dnssec-coverage ${sbindir}/dnssec-checkds \
>> +                ${sbindir}/dnssec-keymgr ${PYTHON_SITEPACKAGES_DIR}"
>> +
>> +RDEPENDS_${PN}-dev = ""
>> +RDEPENDS_python3-bind = "python3-core python3-ply"
>> --
>> 2.17.1
>>
>> 
>
>

