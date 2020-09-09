Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.9963.1599695616503845746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 16:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W1r4mZHU;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id d9so3578140pfd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 16:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:autocrypt:organization:subject:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=amKhS1v6nDx3xHRNGpW2INGG3bPtjyz2p/iF3MmRa18=;
        b=W1r4mZHUlgxdZSRLFPk3xZ6UfnckuGAAD/4sfO19myy+4YOLA9YXp5B9Vl7Z+NfGvT
         DAvFnt/wH2GgrVtUWcmiBXbhScG5BFl/NTODWUf0vsOZehojfXX2wG+IeHr9FRGO4ebQ
         3tEdDFQKB1Vc3oW74MjBe85tf2O3nltgYYIFkhs8YbD2tvmrU3urtyPPivBpq27jsf1R
         cAbTfAHgQXAyntv+IAy/jCw4fHFlo/dLX9pPXbfe+RJrHUlf3ej7EryoHYv497G9h/ig
         60UCAqVFFrObh2Ux16WjhgtqFtn3FmM5havtJcWFOWuzQyvDSi+T3dlQg5UD1w+Odw/m
         NKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:autocrypt:organization
         :subject:message-id:date:user-agent:mime-version:in-reply-to;
        bh=amKhS1v6nDx3xHRNGpW2INGG3bPtjyz2p/iF3MmRa18=;
        b=F+ZWoc4VHuHHddhVvNpxjj7QOL8rmXMmYj805FaTmSof98JyLhACFm3YbLzCMLHPfg
         ZlhMX3uLg70ob/WAlSRje8wc00THGqexZsWXDM2nQgNpFLV68TQ8KOGmtpNumBuJl+bs
         NSegML4ZqWGzNQE8Bb5lf2NdCWv9p0BHcaqkeyWxuJIVSV/I/7WelnMxG2eoVnEOlfj1
         Ne/ycZOv+fdLY/6Ns+xBD/heUGres7u0SswyrFAmS6IS5N4dGpnM7iEVXpZaEFwxz1dp
         wFutzW8CzMUSYBtolY9tqNeZVo0sittfoqai411o1Mn0Pbl03Csho7VaPkvxmF0kKPBJ
         3Uvw==
X-Gm-Message-State: AOAM533Z5KOYGLSkeWl2BQto8scmAWX4oQBI/qW6tUC5EIWMe+1+z5xv
	hSNBVPhcu+YqGo4fHeIvbhHX/Mm/9wKh2Q==
X-Google-Smtp-Source: ABdhPJxn6JZ+K13rCva28FSuaLGA5LUoyshhKd14EAw0mKz8qpXiHjufIDSfemCCUEtncdjU5MmdHA==
X-Received: by 2002:a62:7a53:: with SMTP id v80mr2769341pfc.129.1599695614703;
        Wed, 09 Sep 2020 16:53:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ff6e? ([2601:646:9200:4e0::ff6e])
        by smtp.gmail.com with ESMTPSA id j144sm3881701pfd.106.2020.09.09.16.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 16:53:33 -0700 (PDT)
To: Andrey Zhizhikin <andrey.z@gmail.com>, akuster808 <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20200901152236.9377-1-akuster808@gmail.com>
 <20200901152236.9377-7-akuster808@gmail.com>
 <CAHtQpK7cr7Ht109e_V+Qwy8nb3R3bOthLPq=yr3VBB4vG0XLvA@mail.gmail.com>
 <f5ae90fe-02e7-47b5-2166-fe89488678ca@gmail.com>
 <CAHtQpK5V9nm5+woTpPM-p-Rtzj5sjc+pJ0X-fSf4BCaSD0Vc1w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Subject: Re: [OE-core] [PATCH 7/8] bind: Add 9.16.x
Message-ID: <fb3a5e6d-bae5-7b33-b1e7-61205b130b14@gmail.com>
Date: Wed, 9 Sep 2020 16:53:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHtQpK5V9nm5+woTpPM-p-Rtzj5sjc+pJ0X-fSf4BCaSD0Vc1w@mail.gmail.com>
X-Groupsio-MsgNum: 142335
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="VNHVwojHFTPZpM9CyiP1Af2A7ujiqmk7R"

--VNHVwojHFTPZpM9CyiP1Af2A7ujiqmk7R
Content-Type: multipart/mixed; boundary="tOaEXcI8Zm7Kn1SyFKAqartRTMzivqCDp";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>, akuster808 <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <fb3a5e6d-bae5-7b33-b1e7-61205b130b14@gmail.com>
Subject: Re: [OE-core] [PATCH 7/8] bind: Add 9.16.x
References: <20200901152236.9377-1-akuster808@gmail.com>
 <20200901152236.9377-7-akuster808@gmail.com>
 <CAHtQpK7cr7Ht109e_V+Qwy8nb3R3bOthLPq=yr3VBB4vG0XLvA@mail.gmail.com>
 <f5ae90fe-02e7-47b5-2166-fe89488678ca@gmail.com>
 <CAHtQpK5V9nm5+woTpPM-p-Rtzj5sjc+pJ0X-fSf4BCaSD0Vc1w@mail.gmail.com>
In-Reply-To: <CAHtQpK5V9nm5+woTpPM-p-Rtzj5sjc+pJ0X-fSf4BCaSD0Vc1w@mail.gmail.com>

--tOaEXcI8Zm7Kn1SyFKAqartRTMzivqCDp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/7/20 2:17 PM, Andrey Zhizhikin wrote:
> On Mon, Sep 7, 2020 at 5:28 PM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>>
>> On 9/4/20 1:39 AM, Andrey Zhizhikin wrote:
>>> Hello Armin,
>>>
>>> On Tue, Sep 1, 2020 at 5:23 PM akuster <akuster808@gmail.com> wrote:
>>>> Removed obsolete packageconfig options
>>>>
>>>> License change to MPL-2.0
>>>> https://gitlab.isc.org/isc-projects/bind9/blob/master/LICENSE
>>>>
>>>> Refreshed:
>>>> bind-ensure-searching-for-json-headers-searches-sysr.patch
>>>> 0001-named-lwresd-V-and-start-log-hide-build-options.patch
>>>> bind-ensure-searching-for-json-headers-searches-sysr.patch
>>>>
>>>> Drop obsolete patch: 0001-configure.in-remove-useless-L-use_openssl-l=
ib.patch
>>>>
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>  ...1-avoid-start-failure-with-bind-user.patch |  27 ++
>>>>  ...d-V-and-start-log-hide-build-options.patch |  35 ++
>>>>  ...ching-for-json-headers-searches-sysr.patch |  47 +++
>>>>  .../bind/bind-9.16.5/bind9                    |   2 +
>>>>  .../bind/bind-9.16.5/conf.patch               | 330 ++++++++++++++++=
++
>>>>  .../bind/bind-9.16.5/generate-rndc-key.sh     |   8 +
>>>>  ...t.d-add-support-for-read-only-rootfs.patch |  65 ++++
>>>>  .../make-etc-initd-bind-stop-work.patch       |  42 +++
>>>>  .../bind/bind-9.16.5/named.service            |  22 ++
>>>>  meta/recipes-connectivity/bind/bind_9.16.5.bb | 125 +++++++
>>>>  10 files changed, 703 insertions(+)
>>>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/0001-a=
void-start-failure-with-bind-user.patch
>>>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/0001-n=
amed-lwresd-V-and-start-log-hide-build-options.patch
>>>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/bind-e=
nsure-searching-for-json-headers-searches-sysr.patch
>>>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/bind9
>>>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/conf.p=
atch
>>>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/genera=
te-rndc-key.sh
>>>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/init.d=
-add-support-for-read-only-rootfs.patch
>>>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/make-e=
tc-initd-bind-stop-work.patch
>>>>  create mode 100644 meta/recipes-connectivity/bind/bind-9.16.5/named.=
service
>>>>  create mode 100644 meta/recipes-connectivity/bind/bind_9.16.5.bb
>>>>
>>>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/0001-avoid-st=
art-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16=
.5/0001-avoid-start-failure-with-bind-user.patch
>>>> new file mode 100644
>>>> index 00000000000..8db96ec049c
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/0001-avoid-start-fai=
lure-with-bind-user.patch
>>>> @@ -0,0 +1,27 @@
>>>> +From 31dde3562f287429eea94b77250d184818b49063 Mon Sep 17 00:00:00 20=
01
>>>> +From: Chen Qi <Qi.Chen@windriver.com>
>>>> +Date: Mon, 15 Oct 2018 16:55:09 +0800
>>>> +Subject: [PATCH] avoid start failure with bind user
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> +---
>>>> + init.d | 1 +
>>>> + 1 file changed, 1 insertion(+)
>>>> +
>>>> +diff --git a/init.d b/init.d
>>>> +index b2eec60..6e03936 100644
>>>> +--- a/init.d
>>>> ++++ b/init.d
>>>> +@@ -57,6 +57,7 @@ case "$1" in
>>>> +       modprobe capability >/dev/null 2>&1 || true
>>>> +       if [ ! -f /etc/bind/rndc.key ]; then
>>>> +           /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
>>>> ++          chown root:bind /etc/bind/rndc.key >/dev/null 2>&1 || tru=
e
>>>> +           chmod 0640 /etc/bind/rndc.key
>>>> +       fi
>>>> +       if [ -f /var/run/named/named.pid ]; then
>>>> +--
>>>> +2.7.4
>>>> +
>>>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/0001-named-lw=
resd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/b=
ind/bind-9.16.5/0001-named-lwresd-V-and-start-log-hide-build-options.patch
>>>> new file mode 100644
>>>> index 00000000000..5bcc16c9b2b
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/0001-named-lwresd-V-=
and-start-log-hide-build-options.patch
>>>> @@ -0,0 +1,35 @@
>>>> +From a3af4a405baf5ff582e82aaba392dd9667d94bdc Mon Sep 17 00:00:00 20=
01
>>>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>>>> +Date: Mon, 27 Aug 2018 21:24:20 +0800
>>>> +Subject: [PATCH] `named/lwresd -V' and start log hide build options
>>>> +
>>>> +The build options expose build path directories, so hide them.
>>>> +[snip]
>>>> +$ named -V
>>>> +|built by make with *** (options are hidden)
>>>> +[snip]
>>>> +
>>>> +Upstream-Status: Inappropriate [oe-core specific]
>>>> +
>>>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> +
>>>> +Refreshed for 9.16.0
>>>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>> +
>>>> +---
>>>> + bin/named/include/named/globals.h | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +Index: bind-9.16.0/bin/named/include/named/globals.h
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +--- bind-9.16.0.orig/bin/named/include/named/globals.h
>>>> ++++ bind-9.16.0/bin/named/include/named/globals.h
>>>> +@@ -69,7 +69,7 @@ EXTERN const char *named_g_version     I
>>>> + EXTERN const char *named_g_product     INIT(PRODUCT);
>>>> + EXTERN const char *named_g_description INIT(DESCRIPTION);
>>>> + EXTERN const char *named_g_srcid       INIT(SRCID);
>>>> +-EXTERN const char *named_g_configargs  INIT(CONFIGARGS);
>>>> ++EXTERN const char *named_g_configargs  INIT("*** (options are hidde=
n)");
>>>> + EXTERN const char *named_g_builder     INIT(BUILDER);
>>>> + EXTERN in_port_t named_g_port        INIT(0);
>>>> + EXTERN isc_dscp_t named_g_dscp               INIT(-1);
>>>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/bind-ensure-s=
earching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/b=
ind/bind-9.16.5/bind-ensure-searching-for-json-headers-searches-sysr.patch
>>>> new file mode 100644
>>>> index 00000000000..f9cdc7ca4df
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/bind-ensure-searchin=
g-for-json-headers-searches-sysr.patch
>>>> @@ -0,0 +1,47 @@
>>>> +From edda20fb5a6e88548f85e39d34d6c074306e15bc Mon Sep 17 00:00:00 20=
01
>>>> +From: Paul Gortmaker <paul.gortmaker@windriver.com>
>>>> +Date: Tue, 9 Jun 2015 11:22:00 -0400
>>>> +Subject: [PATCH] bind: ensure searching for json headers searches sy=
sroot
>>>> +
>>>> +Bind can fail configure by detecting headers w/o libs[1], or
>>>> +it can fail the host contamination check as per below:
>>>> +
>>>> +ERROR: This autoconf log indicates errors, it looked at host include=
 and/or library paths while determining system capabilities.
>>>> +Rerun configure task after fixing this. The path was 'build/tmp/work=
/core2-64-poky-linux/bind/9.10.2-r1/build'
>>>> +ERROR: Function failed: do_qa_configure
>>>> +ERROR: Logfile of failure stored in: build/tmp/work/core2-64-poky-li=
nux/bind/9.10.2-r1/temp/log.do_configure.5242
>>>> +ERROR: Task 5 (meta/recipes-connectivity/bind/bind_9.10.2.bb, do_con=
figure) failed with exit code '1'
>>>> +NOTE: Tasks Summary: Attempted 773 tasks of which 768 didn't need to=
 be rerun and 1 failed.
>>>> +No currently running tasks (773 of 781)
>>>> +
>>>> +Summary: 1 task failed:
>>>> +  /meta/recipes-connectivity/bind/bind_9.10.2.bb, do_configure
>>>> +
>>>> +One way to fix it would be to unconditionally disable json in bind
>>>> +configure[2] but here we fix it by using the path to where we would
>>>> +put the header if we had json in the sysroot, in case someone wants
>>>> +to make use of the combination some day.
>>>> +
>>>> +[1] https://trac.macports.org/ticket/45305
>>>> +[2] https://trac.macports.org/changeset/126406
>>>> +
>>>> +Upstream-Status: Inappropriate [OE Specific]
>>>> +Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>>>> +
>>>> +---
>>>> + configure.ac | 2 +-
>>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> +
>>>> +Index: bind-9.16.4/configure.ac
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +--- bind-9.16.4.orig/configure.ac
>>>> ++++ bind-9.16.4/configure.ac
>>>> +@@ -1232,7 +1232,7 @@ case "$use_lmdb" in
>>>> +               LMDB_LIBS=3D""
>>>> +               ;;
>>>> +       auto|yes)
>>>> +-              for d in /usr /usr/local /opt/local
>>>> ++              for d in "${STAGING_INCDIR}"
>>>> +               do
>>>> +                       if test -f "${d}/include/lmdb.h"
>>>> +                       then
>>>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/bind9 b/meta/=
recipes-connectivity/bind/bind-9.16.5/bind9
>>>> new file mode 100644
>>>> index 00000000000..968679ff7f7
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/bind9
>>>> @@ -0,0 +1,2 @@
>>>> +# startup options for the server
>>>> +OPTIONS=3D"-u bind"
>>>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/conf.patch b/=
meta/recipes-connectivity/bind/bind-9.16.5/conf.patch
>>>> new file mode 100644
>>>> index 00000000000..aad345f9fcf
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/conf.patch
>>>> @@ -0,0 +1,330 @@
>>>> +Upstream-Status: Inappropriate [configuration]
>>>> +
>>>> +the patch is imported from openembedded project
>>>> +
>>>> +11/30/2010 - Qing He <qing.he@intel.com>
>>>> +
>>>> +diff -urN bind-9.3.1.orig/conf/db.0 bind-9.3.1/conf/db.0
>>>> +--- bind-9.3.1.orig/conf/db.0  1970-01-01 01:00:00.000000000 +0100
>>>> ++++ bind-9.3.1/conf/db.0       2005-07-10 22:14:00.000000000 +0200
>>>> +@@ -0,0 +1,12 @@
>>>> ++;
>>>> ++; BIND reverse data file for broadcast zone
>>>> ++;
>>>> ++$TTL  604800
>>>> ++@     IN      SOA     localhost. root.localhost. (
>>>> ++                            1         ; Serial
>>>> ++                       604800         ; Refresh
>>>> ++                        86400         ; Retry
>>>> ++                      2419200         ; Expire
>>>> ++                       604800 )       ; Negative Cache TTL
>>>> ++;
>>>> ++@     IN      NS      localhost.
>>>> +diff -urN bind-9.3.1.orig/conf/db.127 bind-9.3.1/conf/db.127
>>>> +--- bind-9.3.1.orig/conf/db.127        1970-01-01 01:00:00.000000000=
 +0100
>>>> ++++ bind-9.3.1/conf/db.127     2005-07-10 22:14:00.000000000 +0200
>>>> +@@ -0,0 +1,13 @@
>>>> ++;
>>>> ++; BIND reverse data file for local loopback interface
>>>> ++;
>>>> ++$TTL  604800
>>>> ++@     IN      SOA     localhost. root.localhost. (
>>>> ++                            1         ; Serial
>>>> ++                       604800         ; Refresh
>>>> ++                        86400         ; Retry
>>>> ++                      2419200         ; Expire
>>>> ++                       604800 )       ; Negative Cache TTL
>>>> ++;
>>>> ++@     IN      NS      localhost.
>>>> ++1.0.0 IN      PTR     localhost.
>>>> +diff -urN bind-9.3.1.orig/conf/db.empty bind-9.3.1/conf/db.empty
>>>> +--- bind-9.3.1.orig/conf/db.empty      1970-01-01 01:00:00.000000000=
 +0100
>>>> ++++ bind-9.3.1/conf/db.empty   2005-07-10 22:14:00.000000000 +0200
>>>> +@@ -0,0 +1,14 @@
>>>> ++; BIND reverse data file for empty rfc1918 zone
>>>> ++;
>>>> ++; DO NOT EDIT THIS FILE - it is used for multiple zones.
>>>> ++; Instead, copy it, edit named.conf, and use that copy.
>>>> ++;
>>>> ++$TTL  86400
>>>> ++@     IN      SOA     localhost. root.localhost. (
>>>> ++                            1         ; Serial
>>>> ++                       604800         ; Refresh
>>>> ++                        86400         ; Retry
>>>> ++                      2419200         ; Expire
>>>> ++                        86400 )       ; Negative Cache TTL
>>>> ++;
>>>> ++@     IN      NS      localhost.
>>>> +diff -urN bind-9.3.1.orig/conf/db.255 bind-9.3.1/conf/db.255
>>>> +--- bind-9.3.1.orig/conf/db.255        1970-01-01 01:00:00.000000000=
 +0100
>>>> ++++ bind-9.3.1/conf/db.255     2005-07-10 22:14:00.000000000 +0200
>>>> +@@ -0,0 +1,12 @@
>>>> ++;
>>>> ++; BIND reserve data file for broadcast zone
>>>> ++;
>>>> ++$TTL  604800
>>>> ++@     IN      SOA     localhost. root.localhost. (
>>>> ++                            1         ; Serial
>>>> ++                       604800         ; Refresh
>>>> ++                        86400         ; Retry
>>>> ++                      2419200         ; Expire
>>>> ++                       604800 )       ; Negative Cache TTL
>>>> ++;
>>>> ++@     IN      NS      localhost.
>>>> +diff -urN bind-9.3.1.orig/conf/db.local bind-9.3.1/conf/db.local
>>>> +--- bind-9.3.1.orig/conf/db.local      1970-01-01 01:00:00.000000000=
 +0100
>>>> ++++ bind-9.3.1/conf/db.local   2005-07-10 22:14:00.000000000 +0200
>>>> +@@ -0,0 +1,13 @@
>>>> ++;
>>>> ++; BIND data file for local loopback interface
>>>> ++;
>>>> ++$TTL  604800
>>>> ++@     IN      SOA     localhost. root.localhost. (
>>>> ++                            1         ; Serial
>>>> ++                       604800         ; Refresh
>>>> ++                        86400         ; Retry
>>>> ++                      2419200         ; Expire
>>>> ++                       604800 )       ; Negative Cache TTL
>>>> ++;
>>>> ++@     IN      NS      localhost.
>>>> ++@     IN      A       127.0.0.1
>>>> +diff -urN bind-9.3.1.orig/conf/db.root bind-9.3.1/conf/db.root
>>>> +--- bind-9.3.1.orig/conf/db.root       1970-01-01 01:00:00.000000000=
 +0100
>>>> ++++ bind-9.3.1/conf/db.root    2005-07-10 22:14:00.000000000 +0200
>>>> +@@ -0,0 +1,45 @@
>>>> ++
>>>> ++; <<>> DiG 9.2.3 <<>> ns . @a.root-servers.net.
>>>> ++;; global options:  printcmd
>>>> ++;; Got answer:
>>>> ++;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18944
>>>> ++;; flags: qr aa rd; QUERY: 1, ANSWER: 13, AUTHORITY: 0, ADDITIONAL:=
 13
>>>> ++
>>>> ++;; QUESTION SECTION:
>>>> ++;.                            IN      NS
>>>> ++
>>>> ++;; ANSWER SECTION:
>>>> ++.                     518400  IN      NS      A.ROOT-SERVERS.NET.
>>>> ++.                     518400  IN      NS      B.ROOT-SERVERS.NET.
>>>> ++.                     518400  IN      NS      C.ROOT-SERVERS.NET.
>>>> ++.                     518400  IN      NS      D.ROOT-SERVERS.NET.
>>>> ++.                     518400  IN      NS      E.ROOT-SERVERS.NET.
>>>> ++.                     518400  IN      NS      F.ROOT-SERVERS.NET.
>>>> ++.                     518400  IN      NS      G.ROOT-SERVERS.NET.
>>>> ++.                     518400  IN      NS      H.ROOT-SERVERS.NET.
>>>> ++.                     518400  IN      NS      I.ROOT-SERVERS.NET.
>>>> ++.                     518400  IN      NS      J.ROOT-SERVERS.NET.
>>>> ++.                     518400  IN      NS      K.ROOT-SERVERS.NET.
>>>> ++.                     518400  IN      NS      L.ROOT-SERVERS.NET.
>>>> ++.                     518400  IN      NS      M.ROOT-SERVERS.NET.
>>>> ++
>>>> ++;; ADDITIONAL SECTION:
>>>> ++A.ROOT-SERVERS.NET.   3600000 IN      A       198.41.0.4
>>>> ++B.ROOT-SERVERS.NET.   3600000 IN      A       192.228.79.201
>>>> ++C.ROOT-SERVERS.NET.   3600000 IN      A       192.33.4.12
>>>> ++D.ROOT-SERVERS.NET.   3600000 IN      A       128.8.10.90
>>>> ++E.ROOT-SERVERS.NET.   3600000 IN      A       192.203.230.10
>>>> ++F.ROOT-SERVERS.NET.   3600000 IN      A       192.5.5.241
>>>> ++G.ROOT-SERVERS.NET.   3600000 IN      A       192.112.36.4
>>>> ++H.ROOT-SERVERS.NET.   3600000 IN      A       128.63.2.53
>>>> ++I.ROOT-SERVERS.NET.   3600000 IN      A       192.36.148.17
>>>> ++J.ROOT-SERVERS.NET.   3600000 IN      A       192.58.128.30
>>>> ++K.ROOT-SERVERS.NET.   3600000 IN      A       193.0.14.129
>>>> ++L.ROOT-SERVERS.NET.   3600000 IN      A       198.32.64.12
>>>> ++M.ROOT-SERVERS.NET.   3600000 IN      A       202.12.27.33
>>>> ++
>>>> ++;; Query time: 81 msec
>>>> ++;; SERVER: 198.41.0.4#53(a.root-servers.net.)
>>>> ++;; WHEN: Sun Feb  1 11:27:14 2004
>>>> ++;; MSG SIZE  rcvd: 436
>>>> ++
>>>> +diff -urN bind-9.3.1.orig/conf/named.conf bind-9.3.1/conf/named.conf
>>>> +--- bind-9.3.1.orig/conf/named.conf    1970-01-01 01:00:00.000000000=
 +0100
>>>> ++++ bind-9.3.1/conf/named.conf 2005-07-10 22:33:46.000000000 +0200
>>>> +@@ -0,0 +1,49 @@
>>>> ++// This is the primary configuration file for the BIND DNS server n=
amed.
>>>> ++//
>>>> ++// If you are just adding zones, please do that in /etc/bind/named.=
conf.local
>>>> ++
>>>> ++include "/etc/bind/named.conf.options";
>>>> ++
>>>> ++// prime the server with knowledge of the root servers
>>>> ++zone "." {
>>>> ++      type hint;
>>>> ++      file "/etc/bind/db.root";
>>>> ++};
>>>> ++
>>>> ++// be authoritative for the localhost forward and reverse zones, an=
d for
>>>> ++// broadcast zones as per RFC 1912
>>>> ++
>>>> ++zone "localhost" {
>>>> ++      type master;
>>>> ++      file "/etc/bind/db.local";
>>>> ++};
>>>> ++
>>>> ++zone "127.in-addr.arpa" {
>>>> ++      type master;
>>>> ++      file "/etc/bind/db.127";
>>>> ++};
>>>> ++
>>>> ++zone "0.in-addr.arpa" {
>>>> ++      type master;
>>>> ++      file "/etc/bind/db.0";
>>>> ++};
>>>> ++
>>>> ++zone "255.in-addr.arpa" {
>>>> ++      type master;
>>>> ++      file "/etc/bind/db.255";
>>>> ++};
>>>> ++
>>>> ++// zone "com" { type delegation-only; };
>>>> ++// zone "net" { type delegation-only; };
>>>> ++
>>>> ++// From the release notes:
>>>> ++//  Because many of our users are uncomfortable receiving undelegat=
ed answers
>>>> ++//  from root or top level domains, other than a few for whom that =
behaviour
>>>> ++//  has been trusted and expected for quite some length of time, we=
 have now
>>>> ++//  introduced the "root-delegations-only" feature which applies de=
legation-only
>>>> ++//  logic to all top level domains, and to the root domain.  An exc=
eption list
>>>> ++//  should be specified, including "MUSEUM" and "DE", and any other=
 top level
>>>> ++//  domains from whom undelegated responses are expected and truste=
d.
>>>> ++// root-delegation-only exclude { "DE"; "MUSEUM"; };
>>>> ++
>>>> ++include "/etc/bind/named.conf.local";
>>>> +diff -urN bind-9.3.1.orig/conf/named.conf.local bind-9.3.1/conf/name=
d.conf.local
>>>> +--- bind-9.3.1.orig/conf/named.conf.local      1970-01-01 01:00:00.0=
00000000 +0100
>>>> ++++ bind-9.3.1/conf/named.conf.local   2005-07-10 22:14:06.000000000=
 +0200
>>>> +@@ -0,0 +1,8 @@
>>>> ++//
>>>> ++// Do any local configuration here
>>>> ++//
>>>> ++
>>>> ++// Consider adding the 1918 zones here, if they are not used in you=
r
>>>> ++// organization
>>>> ++//include "/etc/bind/zones.rfc1918";
>>>> ++
>>>> +diff -urN bind-9.3.1.orig/conf/named.conf.options bind-9.3.1/conf/na=
med.conf.options
>>>> +--- bind-9.3.1.orig/conf/named.conf.options    1970-01-01 01:00:00.0=
00000000 +0100
>>>> ++++ bind-9.3.1/conf/named.conf.options 2005-07-10 22:14:06.000000000=
 +0200
>>>> +@@ -0,0 +1,24 @@
>>>> ++options {
>>>> ++      directory "/var/cache/bind";
>>>> ++
>>>> ++      // If there is a firewall between you and nameservers you wan=
t
>>>> ++      // to talk to, you might need to uncomment the query-source
>>>> ++      // directive below.  Previous versions of BIND always asked
>>>> ++      // questions using port 53, but BIND 8.1 and later use an unp=
rivileged
>>>> ++      // port by default.
>>>> ++
>>>> ++      // query-source address * port 53;
>>>> ++
>>>> ++      // If your ISP provided one or more IP addresses for stable
>>>> ++      // nameservers, you probably want to use them as forwarders.
>>>> ++      // Uncomment the following block, and insert the addresses re=
placing
>>>> ++      // the all-0's placeholder.
>>>> ++
>>>> ++      // forwarders {
>>>> ++      //      0.0.0.0;
>>>> ++      // };
>>>> ++
>>>> ++      auth-nxdomain no;    # conform to RFC1035
>>>> ++
>>>> ++};
>>>> ++
>>>> +diff -urN bind-9.3.1.orig/conf/zones.rfc1918 bind-9.3.1/conf/zones.r=
fc1918
>>>> +--- bind-9.3.1.orig/conf/zones.rfc1918 1970-01-01 01:00:00.000000000=
 +0100
>>>> ++++ bind-9.3.1/conf/zones.rfc1918      2005-07-10 22:14:10.000000000=
 +0200
>>>> +@@ -0,0 +1,20 @@
>>>> ++zone "10.in-addr.arpa"      { type master; file "/etc/bind/db.empty=
"; };
>>>> ++
>>>> ++zone "16.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "17.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "18.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "19.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "20.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "21.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "22.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "23.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "24.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "25.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "26.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "27.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "28.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "29.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "30.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++zone "31.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty=
"; };
>>>> ++
>>>> ++zone "168.192.in-addr.arpa" { type master; file "/etc/bind/db.empty=
"; };
>>>> +diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
>>>> +--- bind-9.3.1.orig/init.d     1970-01-01 01:00:00.000000000 +0100
>>>> ++++ bind-9.3.1/init.d  2005-07-10 23:09:58.000000000 +0200
>>>> +@@ -0,0 +1,70 @@
>>>> ++#!/bin/sh
>>>> ++
>>>> ++PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
>>>> ++
>>>> ++# for a chrooted server: "-u bind -t /var/lib/named"
>>>> ++# Don't modify this line, change or create /etc/default/bind9.
>>>> ++OPTIONS=3D""
>>>> ++
>>>> ++test -f /etc/default/bind9 && . /etc/default/bind9
>>>> ++
>>>> ++test -x /usr/sbin/rndc || exit 0
>>>> ++
>>>> ++case "$1" in
>>>> ++    start)
>>>> ++      echo -n "Starting domain name service: named"
>>>> ++
>>>> ++      modprobe capability >/dev/null 2>&1 || true
>>>> ++      if [ ! -f /etc/bind/rndc.key ]; then
>>>> ++          /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
>>>> ++          chmod 0640 /etc/bind/rndc.key
>>>> ++      fi
>>>> ++      if [ -f /var/run/named/named.pid ]; then
>>>> ++          ps `cat /var/run/named/named.pid` > /dev/null && exit 1
>>>> ++      fi
>>>> ++
>>>> ++      # dirs under /var/run can go away on reboots.
>>>> ++      mkdir -p /var/run/named
>>>> ++      mkdir -p /var/cache/bind
>>>> ++      chmod 775 /var/run/named
>>>> ++      chown root:bind /var/run/named >/dev/null 2>&1 || true
>>>> ++
>>>> ++      if [ ! -x /usr/sbin/named ]; then
>>>> ++          echo "named binary missing - not starting"
>>>> ++          exit 1
>>>> ++      fi
>>>> ++      if start-stop-daemon --start --quiet --exec /usr/sbin/named \
>>>> ++              --pidfile /var/run/named/named.pid -- $OPTIONS; then
>>>> ++          if [ -x /sbin/resolvconf ] ; then
>>>> ++              echo "nameserver 127.0.0.1" | /sbin/resolvconf -a lo
>>>> ++          fi
>>>> ++      fi
>>>> ++      echo "."
>>>> ++    ;;
>>>> ++
>>>> ++    stop)
>>>> ++      echo -n "Stopping domain name service: named"
>>>> ++      if [ -x /sbin/resolvconf ]; then
>>>> ++          /sbin/resolvconf -d lo
>>>> ++      fi
>>>> ++      /usr/sbin/rndc stop >/dev/null 2>&1
>>>> ++      echo "."
>>>> ++    ;;
>>>> ++
>>>> ++    reload)
>>>> ++      /usr/sbin/rndc reload
>>>> ++    ;;
>>>> ++
>>>> ++    restart|force-reload)
>>>> ++      $0 stop
>>>> ++      sleep 2
>>>> ++      $0 start
>>>> ++    ;;
>>>> ++
>>>> ++    *)
>>>> ++      echo "Usage: /etc/init.d/bind {start|stop|reload|restart|forc=
e-reload}" >&2
>>>> ++      exit 1
>>>> ++    ;;
>>>> ++esac
>>>> ++
>>>> ++exit 0
>>>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc=
-key.sh b/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
>>>> new file mode 100644
>>>> index 00000000000..ef915c0ae5a
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/generate-rndc-key.sh
>>>> @@ -0,0 +1,8 @@
>>>> +#!/bin/sh
>>>> +
>>>> +if [ ! -s /etc/bind/rndc.key ]; then
>>>> +    echo -n "Generating /etc/bind/rndc.key:"
>>>> +    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
>>>> +    chown root:bind /etc/bind/rndc.key
>>>> +    chmod 0640 /etc/bind/rndc.key
>>>> +fi
>>>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/init.d-add-su=
pport-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16=
.5/init.d-add-support-for-read-only-rootfs.patch
>>>> new file mode 100644
>>>> index 00000000000..11db95ede12
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/init.d-add-support-f=
or-read-only-rootfs.patch
>>>> @@ -0,0 +1,65 @@
>>>> +Subject: init.d: add support for read-only rootfs
>>>> +
>>>> +Upstream-Status: Inappropriate [oe specific]
>>>> +
>>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> +---
>>>> + init.d |   40 ++++++++++++++++++++++++++++++++++++++++
>>>> + 1 file changed, 40 insertions(+)
>>>> +
>>>> +diff --git a/init.d b/init.d
>>>> +index 0111ed4..24677c8 100644
>>>> +--- a/init.d
>>>> ++++ b/init.d
>>>> +@@ -6,8 +6,48 @@ PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
>>>> + # Don't modify this line, change or create /etc/default/bind9.
>>>> + OPTIONS=3D""
>>>> +
>>>> ++test -f /etc/default/rcS && . /etc/default/rcS
>>>> + test -f /etc/default/bind9 && . /etc/default/bind9
>>>> +
>>>> ++# This function is here because it's possible that /var and / are o=
n different partitions.
>>>> ++is_on_read_only_partition () {
>>>> ++    DIRECTORY=3D$1
>>>> ++    dir=3D`readlink -f $DIRECTORY`
>>>> ++    while true; do
>>>> ++      if [ ! -d "$dir" ]; then
>>>> ++          echo "ERROR: $dir is not a directory"
>>>> ++          exit 1
>>>> ++      else
>>>> ++          for flag in `awk -v dir=3D$dir '{ if ($2 =3D=3D dir) { pr=
int "FOUND"; split($4,FLAGS,",") } }; \
>>>> ++              END { for (f in FLAGS) print FLAGS[f] }' < /proc/moun=
ts`; do
>>>> ++              [ "$flag" =3D "FOUND" ] && partition=3D"read-write"
>>>> ++              [ "$flag" =3D "ro" ] && { partition=3D"read-only"; br=
eak; }
>>>> ++          done
>>>> ++          if [ "$dir" =3D "/" -o -n "$partition" ]; then
>>>> ++              break
>>>> ++          else
>>>> ++              dir=3D`dirname $dir`
>>>> ++          fi
>>>> ++      fi
>>>> ++    done
>>>> ++    [ "$partition" =3D "read-only" ] && echo "yes" || echo "no"
>>>> ++}
>>>> ++
>>>> ++bind_mount () {
>>>> ++    olddir=3D$1
>>>> ++    newdir=3D$2
>>>> ++    mkdir -p $olddir
>>>> ++    cp -a $newdir/* $olddir
>>>> ++    mount --bind $olddir $newdir
>>>> ++}
>>>> ++
>>>> ++# Deal with read-only rootfs
>>>> ++if [ "$ROOTFS_READ_ONLY" =3D "yes" ]; then
>>>> ++    [ "$VERBOSE" !=3D "no" ] && echo "WARN: start bind service in r=
ead-only rootfs"
>>>> ++    [ `is_on_read_only_partition /etc/bind` =3D "yes" ] && bind_mou=
nt /var/volatile/bind/etc /etc/bind
>>>> ++    [ `is_on_read_only_partition /var/named` =3D "yes" ] && bind_mo=
unt /var/volatile/bind/named /var/named
>>>> ++fi
>>>> ++
>>>> + test -x /usr/sbin/rndc || exit 0
>>>> +
>>>> + case "$1" in
>>>> +--
>>>> +1.7.9.5
>>>> +
>>>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/make-etc-init=
d-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.5/make-et=
c-initd-bind-stop-work.patch
>>>> new file mode 100644
>>>> index 00000000000..146f3e35db6
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/make-etc-initd-bind-=
stop-work.patch
>>>> @@ -0,0 +1,42 @@
>>>> +bind: make "/etc/init.d/bind stop" work
>>>> +
>>>> +Upstream-Status: Inappropriate [configuration]
>>>> +
>>>> +Add some configurations, make rndc command be able to controls
>>>> +the named daemon.
>>>> +
>>>> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>>> +---
>>>> + conf/named.conf |    5 +++++
>>>> + conf/rndc.conf  |    5 +++++
>>>> + 2 files changed, 10 insertions(+), 0 deletions(-)
>>>> + create mode 100644 conf/rndc.conf
>>>> +
>>>> +diff --git a/conf/named.conf b/conf/named.conf
>>>> +index 95829cf..c8899e7 100644
>>>> +--- a/conf/named.conf
>>>> ++++ b/conf/named.conf
>>>> +@@ -47,3 +47,8 @@ zone "255.in-addr.arpa" {
>>>> + // root-delegation-only exclude { "DE"; "MUSEUM"; };
>>>> +
>>>> + include "/etc/bind/named.conf.local";
>>>> ++include "/etc/bind/rndc.key" ;
>>>> ++controls {
>>>> ++      inet 127.0.0.1 allow { localhost; }
>>>> ++      keys { rndc-key; };
>>>> ++};
>>>> +diff --git a/conf/rndc.conf b/conf/rndc.conf
>>>> +new file mode 100644
>>>> +index 0000000..a0b481d
>>>> +--- /dev/null
>>>> ++++ b/conf/rndc.conf
>>>> +@@ -0,0 +1,5 @@
>>>> ++include "/etc/bind/rndc.key";
>>>> ++options {
>>>> ++      default-server  localhost;
>>>> ++      default-key     rndc-key;
>>>> ++};
>>>> +
>>>> +--
>>>> +1.7.5.4
>>>> +
>>>> diff --git a/meta/recipes-connectivity/bind/bind-9.16.5/named.service=
 b/meta/recipes-connectivity/bind/bind-9.16.5/named.service
>>>> new file mode 100644
>>>> index 00000000000..cda56ef0150
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/bind/bind-9.16.5/named.service
>>>> @@ -0,0 +1,22 @@
>>>> +[Unit]
>>>> +Description=3DBerkeley Internet Name Domain (DNS)
>>>> +Wants=3Dnss-lookup.target
>>>> +Before=3Dnss-lookup.target
>>>> +After=3Dnetwork.target
>>>> +
>>>> +[Service]
>>>> +Type=3Dforking
>>>> +EnvironmentFile=3D-/etc/default/bind9
>>>> +PIDFile=3D/run/named/named.pid
>>>> +
>>>> +ExecStartPre=3D@SBINDIR@/generate-rndc-key.sh
>>>> +ExecStart=3D@SBINDIR@/named $OPTIONS
>>>> +
>>>> +ExecReload=3D@BASE_BINDIR@/sh -c '@SBINDIR@/rndc reload > /dev/null =
2>&1 || @BASE_BINDIR@/kill -HUP $MAINPID'
>>>> +
>>>> +ExecStop=3D@BASE_BINDIR@/sh -c '@SBINDIR@/rndc stop > /dev/null 2>&1=
 || @BASE_BINDIR@/kill -TERM $MAINPID'
>>>> +
>>>> +PrivateTmp=3Dtrue
>>>> +
>>>> +[Install]
>>>> +WantedBy=3Dmulti-user.target
>>>> diff --git a/meta/recipes-connectivity/bind/bind_9.16.5.bb b/meta/rec=
ipes-connectivity/bind/bind_9.16.5.bb
>>>> new file mode 100644
>>>> index 00000000000..9c20ccc6fa2
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/bind/bind_9.16.5.bb
>>>> @@ -0,0 +1,125 @@
>>>> +SUMMARY =3D "ISC Internet Domain Name Server"
>>>> +HOMEPAGE =3D "http://www.isc.org/sw/bind/"
>>>> +SECTION =3D "console/network"
>>>> +
>>>> +LICENSE =3D "MPL-2.0"
>>>> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D188b8d0644bd6835df43b84=
e3f180be1"
>>>> +
>>>> +DEPENDS =3D "openssl libcap zlib libuv"
>>>> +
>>>> +SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz=
 \
>>>> +           file://conf.patch \
>>>> +           file://named.service \
>>>> +           file://bind9 \
>>>> +           file://generate-rndc-key.sh \
>>>> +           file://make-etc-initd-bind-stop-work.patch \
>>>> +           file://init.d-add-support-for-read-only-rootfs.patch \
>>>> +           file://bind-ensure-searching-for-json-headers-searches-sy=
sr.patch \
>>>> +           file://0001-named-lwresd-V-and-start-log-hide-build-optio=
ns.patch \
>>>> +           file://0001-avoid-start-failure-with-bind-user.patch \
>>>> +           "
>>>> +
>>>> +SRC_URI[sha256sum] =3D "6378b3e51fef11a8be4794dc48e8111ba92d211c0dfd=
129a0c296ed06a3dc075"
>>>> +
>>>> +UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
>>>> +# stay at 9.16 follow the ESV versions divisible by 4
>>>> +UPSTREAM_CHECK_REGEX =3D "(?P<pver>9.(16|20|24|28)(\.\d+)+(-P\d+)*)/=
"
>>>> +
>>>> +inherit autotools update-rc.d systemd useradd pkgconfig multilib_scr=
ipt multilib_header
>>>> +
>>>> +MULTILIB_SCRIPTS =3D "${PN}:${bindir}/bind9-config ${PN}:${bindir}/i=
sc-config.sh"
>>>> +
>>>> +# PACKAGECONFIGs readline and libedit should NOT be set at same time
>>>> +PACKAGECONFIG ?=3D "readline"
>>>> +PACKAGECONFIG[httpstats] =3D "--with-libxml2=3D${STAGING_DIR_HOST}${=
prefix},--without-libxml2,libxml2"
>>>> +PACKAGECONFIG[readline] =3D "--with-readline=3D-lreadline,,readline"
>>>> +PACKAGECONFIG[libedit] =3D "--with-readline=3D-ledit,,libedit"
>>>> +PACKAGECONFIG[python3] =3D "--with-python=3Dyes --with-python-instal=
l-dir=3D${PYTHON_SITEPACKAGES_DIR} , --without-python, python3-ply-native,"
>>>> +
>>>> +EXTRA_OECONF =3D " --with-libtool --disable-devpoll --enable-epoll \
>>>> +                 --with-gssapi=3Dno --with-lmdb=3Dno --with-zlib \
>>>> +                 --sysconfdir=3D${sysconfdir}/bind \
>>>> +                 --with-openssl=3D${STAGING_DIR_HOST}${prefix} \
>>>> +               "
>>>> +LDFLAGS_append =3D " -lz"
>>>> +
>>>> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3nat=
ive distutils3-base', '', d)}
>>>> +
>>>> +# dhcp needs .la so keep them
>>>> +REMOVE_LIBTOOL_LA =3D "0"
>>>> +
>>>> +USERADD_PACKAGES =3D "${PN}"
>>>> +USERADD_PARAM_${PN} =3D "--system --home ${localstatedir}/cache/bind=
 --no-create-home \
>>>> +                       --user-group bind"
>>>> +
>>>> +INITSCRIPT_NAME =3D "bind"
>>>> +INITSCRIPT_PARAMS =3D "defaults"
>>>> +
>>>> +SYSTEMD_SERVICE_${PN} =3D "named.service"
>>>> +
>>>> +do_install_append() {
>>>> +
>>>> +       rmdir "${D}${localstatedir}/run"
>>>> +       rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
>>>> +       install -d -o bind "${D}${localstatedir}/cache/bind"
>>>> +       install -d "${D}${sysconfdir}/bind"
>>>> +       install -d "${D}${sysconfdir}/init.d"
>>>> +       install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>>>> +       install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
>>>> +        if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', =
'false', d)}; then
>>>> +               sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
>>>> +               ${D}${sbindir}/dnssec-coverage \
>>>> +               ${D}${sbindir}/dnssec-checkds \
>>>> +               ${D}${sbindir}/dnssec-keymgr
>>>> +       fi
>>>> +
>>>> +       # Install systemd related files
>>>> +       install -d ${D}${sbindir}
>>>> +       install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
>>>> +       install -d ${D}${systemd_unitdir}/system
>>>> +       install -m 0644 ${WORKDIR}/named.service ${D}${systemd_unitdi=
r}/system
>>>> +       sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
>>>> +              -e 's,@SBINDIR@,${sbindir},g' \
>>>> +              ${D}${systemd_unitdir}/system/named.service
>>>> +
>>>> +       install -d ${D}${sysconfdir}/default
>>>> +       install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
>>>> +
>>>> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',=
 'false', d)}; then
>>>> +               install -d ${D}${sysconfdir}/tmpfiles.d
>>>> +               echo "d /run/named 0755 bind bind - -" > ${D}${syscon=
fdir}/tmpfiles.d/bind.conf
>>>> +       fi
>>>> +
>>>> +    oe_multilib_header isc/platform.h
>>>> +}
>>>> +
>>>> +CONFFILES_${PN} =3D " \
>>>> +       ${sysconfdir}/bind/named.conf \
>>>> +       ${sysconfdir}/bind/named.conf.local \
>>>> +       ${sysconfdir}/bind/named.conf.options \
>>>> +       ${sysconfdir}/bind/db.0 \
>>>> +       ${sysconfdir}/bind/db.127 \
>>>> +       ${sysconfdir}/bind/db.empty \
>>>> +       ${sysconfdir}/bind/db.local \
>>>> +       ${sysconfdir}/bind/db.root \
>>>> +       "
>>>> +
>>>> +ALTERNATIVE_${PN}-utils =3D "nslookup"
>>>> +ALTERNATIVE_LINK_NAME[nslookup] =3D "${bindir}/nslookup"
>>>> +ALTERNATIVE_PRIORITY =3D "100"
>>> I'm seeing this failing with busybox:
>>> update-alternatives: Error: not linking
>>> /development/yocto-master/build-output/work/imx8mmevk-fsl-linux/image-=
cmdline-validation/1.0-r0/rootfs/usr/bin/nslookup
>>> to /bin/busybox.nosuid since
>>> /development/yocto-master/build-output/work/imx8mmevk-fsl-linux/image-=
cmdline-validation/1.0-r0/rootfs/usr/bin/nslookup
>>> exists and is not a link
>>>
>>> busybox sets ALTERNATIVE_PRIORITY =3D "50". Can this be the issue?
>>
>> That is weird. I would have expected that to be an issue with the old
>> version too.
>>
>> Got any steps to reproduce this?
>=20
> Sorry for delayed response here, it took me some time but I've finally
> figured the setup to reproduce the issue.
>=20
> I've used the "vanilla" Poky from master, added IMAGE_INSTALL +=3D
> "bind-utils" to core-image-minimal and switched from RPM to IPK
> format. The last thing turned out to be the trigger for the issue, as
> with RPM package format I was not able to reproduce the issue, and
> this was cause of the delay here.
>=20
> After the above is done - following error is produced:
> WARNING: core-image-minimal-1.0-r0 do_rootfs: busybox.postinst
> returned 1, marking as unpacked only, configuration required on
> target.
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of
> ['busybox'] have failed. If the intention is to defer them to first
> boot,
> then please place them into pkg_postinst_ontarget_${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
> Details of the failure are in
> /development/projects/poky-vanilla/poky/build/tmp/work/qemux86_64-poky-l=
inux/core-image-minimal/1.0-r0/temp/log.do_rootfs.
> ERROR: Logfile of failure stored in:
> /development/projects/poky-vanilla/poky/build/tmp/work/qemux86_64-poky-l=
inux/core-image-minimal/1.0-r0/temp/log.do_rootfs.6423
> ERROR: Task (/development/projects/poky-vanilla/poky/meta/recipes-core/i=
mages/core-image-minimal.bb:do_rootfs)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 3554 tasks of which 3552 didn't need to
> be rerun and 1 failed.
>=20
> Summary: 1 task failed:
>   /development/projects/poky-vanilla/poky/meta/recipes-core/images/core-=
image-minimal.bb:do_rootfs
> ed:
>=20
> 'nslookup' is definitely comming from the bind-utils package, and the
> only thing I've noted so far it that in bind-9.11.22 result binary
> name in ${D} is [nslookup.bind], which is different from the one
> provided in bind-9.16.5 - [nslookup].
>=20
> In case of previous bind version - both versions seems to be
> installed, and the symlink is fixed onto the nslookup.bind. In the
> current version though - I guess that the real binary is installed
> instead, making symlink operation to fail during update-alternative.

If it is competing with busybox then perhaps priority for bind to
provide nslookup should be higher than busybox. Can you try that ?

>=20
>=20
>=20
>>
>> -armin
>>>
>>> Going back to bind 9.11.22 seems to solve it...
>>>
>>>> +
>>>> +PACKAGE_BEFORE_PN +=3D "${PN}-utils"
>>>> +FILES_${PN}-utils =3D "${bindir}/host ${bindir}/dig ${bindir}/mdig $=
{bindir}/nslookup ${bindir}/nsupdate"
>>>> +FILES_${PN}-dev +=3D "${bindir}/isc-config.h"
>>>> +FILES_${PN} +=3D "${sbindir}/generate-rndc-key.sh"
>>>> +
>>>> +PACKAGE_BEFORE_PN +=3D "${PN}-libs"
>>>> +FILES_${PN}-libs =3D "${libdir}/*.so* ${libdir}/named/*.so*"
>>>> +FILES_${PN}-staticdev +=3D "${libdir}/*.la"
>>>> +
>>>> +PACKAGE_BEFORE_PN +=3D "${@bb.utils.contains('PACKAGECONFIG', 'pytho=
n3', 'python3-bind', '', d)}"
>>>> +FILES_python3-bind =3D "${sbindir}/dnssec-coverage ${sbindir}/dnssec=
-checkds \
>>>> +                ${sbindir}/dnssec-keymgr ${PYTHON_SITEPACKAGES_DIR}"
>>>> +
>>>> +RDEPENDS_${PN}-dev =3D ""
>>>> +RDEPENDS_python3-bind =3D "python3-core python3-ply"
>>>> --
>>>> 2.17.1
>>>>
>>>>
>>>
>>>
>>
>=20
>=20
> --
> Regards,
> Andrey.
>=20
>=20
>=20
>=20


--tOaEXcI8Zm7Kn1SyFKAqartRTMzivqCDp--

--VNHVwojHFTPZpM9CyiP1Af2A7ujiqmk7R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCX1lq9wAKCRC7BTNVkZ0z
FO2aAJ4g1ZpNUWx7CxVh0eMpOovo4FxqLACgg00gOz84GdKZngqm+kol2M3qaMA=
=6uC9
-----END PGP SIGNATURE-----

--VNHVwojHFTPZpM9CyiP1Af2A7ujiqmk7R--
