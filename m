Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web09.6145.1618968398570602329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 18:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K/UnAWd6;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id e25so10951186oii.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 18:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=XwC+COXJqvS+EaiUObXx5voQt47UTKlJDLZQP96a2oY=;
        b=K/UnAWd6KznkksUYkc8HfqBhhdv/YGwSZcA/uL0mqLIP/4MBfl61kK2BgejGeX2P9M
         oSvB62iCff1KcO4tVS4xx5bV4H4FPAn5IupZDiScT2GVsW+Pzi2JJU0DgRpDxJdXjiyb
         qWcfYx2F7CklHACaWgbP61/J054rwrmJH69R9t8Cm2rUx0ogUY4s1yGxNcYLdPqQzTnj
         lmMhSrafVW5EvrGQFPKXrPKLgt3J45gHH+OQ3j4vA39mwaaNJe7kSBbFvISIwtIevzgN
         6NazeasoB03h8CDA1nVxviugiSm9ZatQgCoUBL62epKw0j/8kTRqAnPRG7WIS+h0e84C
         DMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=XwC+COXJqvS+EaiUObXx5voQt47UTKlJDLZQP96a2oY=;
        b=mnXm+xj255COOz8zde1WmMTDqFwOmrc0U/gLMHQ74CaSaTFqQoMpvbpganH0aXXF/r
         DhSOCllr1qyWWrXDaFV0YHKqdPaNZm9bHSZKHP6MMDFN7G/uC+g5oYKw/4k4vru4dRF1
         BO+wnBP/6lVotL0WUW4UkMgJ+kV+NJjb/1acaHKZJjpUGgvtHLBfFoAOrE1coeE/u9+G
         aeRXc+pi0lY0qhdPjFvK3qA+T2mjMn8EepKnKb9BLupLOViW/575hjheHFqf79zMBywB
         b9L41lxA8GEYB2oQP9DbR3i1xYH/Lk/kGoqjyHIkSdDijGQoeIi7i9CD1cXSKMv9wnRS
         kTOA==
X-Gm-Message-State: AOAM532v4kzd9Eeil2yqvKjfoYtsSPTan+eBThyG+PBnJoPtGbHPWoOg
	+xf1zRYFwi96xfNRuYKPz0U=
X-Google-Smtp-Source: ABdhPJxcB7OMI6nDnRqsXC5zFUkqBqaUXUpd0HZzp2GXl7ehmDPvAHYOvdcPsrGnNrOCBElxPhZNvQ==
X-Received: by 2002:aca:4749:: with SMTP id u70mr4914831oia.34.1618968397920;
        Tue, 20 Apr 2021 18:26:37 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id v22sm193622oop.4.2021.04.20.18.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 18:26:37 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH v3] seatd: add seatd recipe
To: Randy Li <ayaka@soulik.info>, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, contact@emersion.fr, kl@kl.wtf
References: <20210420234341.182745-1-ayaka@soulik.info>
Message-ID: <50825f3b-3c5f-1b51-d01f-eb850cca4da3@gmail.com>
Date: Tue, 20 Apr 2021 20:26:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210420234341.182745-1-ayaka@soulik.info>
Content-Type: multipart/alternative;
 boundary="------------F5C84C57A73E523FEABCA9C3"
Content-Language: en-US

--------------F5C84C57A73E523FEABCA9C3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/20/21 6:43 PM, Randy Li wrote:
> Seat management takes care of mediating access to shared devices
> (graphics, input), without requiring the applications needing access to
> be root.
>
> weston would depend on it as well as wlroots.
>
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>   ...build-fixup-standalone-without-seatd.patch | 71 +++++++++++++++++++
>   meta/recipes-core/seatd/libseat/init          | 50 +++++++++++++
>   meta/recipes-core/seatd/libseat_0.5.0.bb      | 43 +++++++++++
>   3 files changed, 164 insertions(+)
>   create mode 100644 meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
>   create mode 100644 meta/recipes-core/seatd/libseat/init
>   create mode 100644 meta/recipes-core/seatd/libseat_0.5.0.bb
>
> diff --git a/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch b/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
> new file mode 100644
> index 0000000000..66e1ac73ab
> --- /dev/null
> +++ b/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
> @@ -0,0 +1,71 @@
> +From 084df8ab271ce4b09c1ef5d9c5a859b2d02d20e7 Mon Sep 17 00:00:00 2001
> +From: ayaka <ayaka@soulik.info>
> +Date: Mon, 19 Apr 2021 22:15:46 +0800
> +Subject: [PATCH] build: fixup standalone without seatd
> +
> +I think that server option means the same thing as seatd, so I
> +get rid of it.

I don't understand the purpose of this patch; why do we need to get rid 
of the server?

> +---
> + meson.build       | 10 +++++-----
> + meson_options.txt |  1 -
> + 2 files changed, 5 insertions(+), 6 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 7a70cb6..a2166c5 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -104,10 +104,11 @@ server_files = [
> +
> + with_seatd = get_option('seatd') == 'enabled'
> + with_builtin = get_option('builtin') == 'enabled'
> +-with_server = get_option('server') == 'enabled'
> +
> +-if with_seatd
> ++if with_seatd or with_builtin
> + 	private_files += 'libseat/backend/seatd.c'
> ++endif
> ++if with_seatd
> + 	add_project_arguments('-DSEATD_ENABLED=1', language: 'c')
> + endif
> +
> +@@ -189,7 +190,7 @@ libseat = declare_dependency(
> + 	variables: libseat_vars,
> + )
> +
> +-if with_server
> ++if with_seatd
> + 	executable(
> + 		'seatd',
> + 		[ server_files, 'seatd/seatd.c' ],
> +@@ -221,7 +222,7 @@ foreach name, value : tests
> + 		include_directories: [include_directories('.', 'include')]))
> + endforeach
> +
> +-if with_server
> ++if with_seatd
> + 	scdoc = dependency('scdoc', required: get_option('man-pages'), version: '>= 1.9.7', native: true)
> + else
> + 	scdoc = disabler()
> +@@ -252,7 +253,6 @@ endif
> + summary({
> + 	'seatd': with_seatd,
> + 	'builtin': with_builtin,
> +-	'server': with_server,
> + 	'systemd': logind.found() and logind_provider == 'systemd',
> + 	'elogind': logind.found() and logind_provider == 'elogind',
> + }, bool_yn: true)
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 144ce7a..c61d473 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -1,7 +1,6 @@
> + option('logind', type: 'combo', choices: ['auto', 'disabled', 'elogind', 'systemd'], value: 'auto', description: 'logind support')
> + option('seatd', type: 'combo', choices: ['enabled', 'disabled'], value: 'enabled', description: 'seatd support')
> + option('builtin', type: 'combo', choices: ['enabled', 'disabled'], value: 'disabled', description: 'builtin seatd server')
> +-option('server', type: 'combo', choices: ['enabled', 'disabled'], value: 'enabled', description: 'seatd server')
> + option('examples', type: 'combo', choices: ['enabled', 'disabled'], value: 'disabled', description: 'libseat example programs')
> + option('man-pages', type: 'feature', value: 'auto', description: 'Generate and install man pages')
> + option('defaultpath', type: 'string', value: '', description: 'Default location for seatd socket (empty for default)')
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-core/seatd/libseat/init b/meta/recipes-core/seatd/libseat/init
> new file mode 100644
> index 0000000000..8c9d77255d
> --- /dev/null
> +++ b/meta/recipes-core/seatd/libseat/init
> @@ -0,0 +1,50 @@
> +#!/bin/sh
> +#
> +### BEGIN INIT INFO
> +# Provides:          seatd
> +# Short-Description: Start seat management daemon
> +# Required-Start:    $local_fs $remote_fs
> +# Required-Stop:     $local_fs $remote_fs
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +### END INIT INFO
> +
> +PATH=/bin:/usr/bin:/sbin:/usr/sbin
> +
> +test -x /usr/bin/seatd || exit 0
> +
> +# For configuration of the init script use the file
> +# /etc/default/seatd, do not edit this init script.
> +
> +seatd_group="seatd"
> +
> +[ -e /etc/default/seatd ] && . /etc/default/seatd
> +
> +NAME=seatd
> +DAEMON=/usr/bin/seatd
> +STOP_RETRY_SCHEDULE='TERM/10/forever/KILL/1'
> +
> +. /etc/init.d/functions
> +
> +case "$1" in
> +  start)
> +    start-stop-daemon --start --backgroud --quiet --pidfile /var/run/$NAME.pid \
> +	    --exec $DAEMON -- -g $seatd_group
> +    ;;
> +
> +  stop)
> +    killproc $NAME
> +    ;;
> +
> +  restart)
> +    $0 stop
> +    sleep 1
> +    $0 start
> +    ;;
> +  *)
> +    echo "Usage: $0 {start|stop|restart}"
> +    exit 1
> +
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-core/seatd/libseat_0.5.0.bb b/meta/recipes-core/seatd/libseat_0.5.0.bb
> new file mode 100644
> index 0000000000..8067d32a26
> --- /dev/null
> +++ b/meta/recipes-core/seatd/libseat_0.5.0.bb
> @@ -0,0 +1,43 @@
> +SUMMARY = "Seat management daemon and library"
> +HOMEPAGE = "https://git.sr.ht/~kennylevinsen/seatd"
> +SECTION = "base"
> +
> +DESCRIPTION = "A minimal seat management daemon, and a universal seat management \
> +library. Seat management takes care of mediating access to shared devices \
> +(graphics, input), without requiring the applications needing access to be root."
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=3;md5=6a01e8ccc65bea4e8bfa79b09ea1444c"
> +
> +SRCREV = "5535c2c3b19b42ebfe4c451600059e9418e401a6"
> +SRCBRANCH = "master"
> +SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=http;branch=${SRCBRANCH} \
> +           file://0001-build-fixup-standalone-without-seatd.patch \
> +           file://init"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig meson useradd update-rc.d
> +
> +PACKAGECONFIG ??= "${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', 'systemd', 'seatd', d)}"
> +
> +PACKAGECONFIG[seatd] = "-Dseatd=enabled, -Dseatd=disabled"
> +PACKAGECONFIG[systemd] = "-Dlogind=systemd, -Dlogind=disabled, systemd dbus"
> +
> +PACKAGES += "seatd"
> +
> +FILES_${PN} = "${libdir}/lib*${SOLIBS}"
> +FILES_seatd = "${bindir}/seatd ${sysconfdir}"
> +
> +do_install_append() {
> +	if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
> +		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/seatd
> +	fi
> +}
> +
> +INITSCRIPT_NAME = "seatd"
> +INITSCRIPT_PARAMS = "start 8 5 2 . stop 21 0 1 6 ."
> +
> +USERADD_PACKAGES = "seatd"
> +
> +GROUPADD_PARAM_seatd = "-r seatd"
>
> 
>

--------------F5C84C57A73E523FEABCA9C3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/20/21 6:43 PM, Randy Li wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210420234341.182745-1-ayaka@soulik.info">
      <pre class="moz-quote-pre" wrap="">Seat management takes care of mediating access to shared devices
(graphics, input), without requiring the applications needing access to
be root.

weston would depend on it as well as wlroots.

Signed-off-by: Randy Li <a class="moz-txt-link-rfc2396E" href="mailto:ayaka@soulik.info">&lt;ayaka@soulik.info&gt;</a>
---
 ...build-fixup-standalone-without-seatd.patch | 71 +++++++++++++++++++
 meta/recipes-core/seatd/libseat/init          | 50 +++++++++++++
 meta/recipes-core/seatd/libseat_0.5.0.bb      | 43 +++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
 create mode 100644 meta/recipes-core/seatd/libseat/init
 create mode 100644 meta/recipes-core/seatd/libseat_0.5.0.bb

diff --git a/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch b/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
new file mode 100644
index 0000000000..66e1ac73ab
--- /dev/null
+++ b/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
@@ -0,0 +1,71 @@
+From 084df8ab271ce4b09c1ef5d9c5a859b2d02d20e7 Mon Sep 17 00:00:00 2001
+From: ayaka <a class="moz-txt-link-rfc2396E" href="mailto:ayaka@soulik.info">&lt;ayaka@soulik.info&gt;</a>
+Date: Mon, 19 Apr 2021 22:15:46 +0800
+Subject: [PATCH] build: fixup standalone without seatd
+
+I think that server option means the same thing as seatd, so I
+get rid of it.</pre>
    </blockquote>
    <p>I don't understand the purpose of this patch; why do we need to
      get rid of the server?<br>
    </p>
    <blockquote type="cite"
      cite="mid:20210420234341.182745-1-ayaka@soulik.info">
      <pre class="moz-quote-pre" wrap="">
+---
+ meson.build       | 10 +++++-----
+ meson_options.txt |  1 -
+ 2 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 7a70cb6..a2166c5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -104,10 +104,11 @@ server_files = [
+ 
+ with_seatd = get_option('seatd') == 'enabled'
+ with_builtin = get_option('builtin') == 'enabled'
+-with_server = get_option('server') == 'enabled'
+ 
+-if with_seatd
++if with_seatd or with_builtin
+ 	private_files += 'libseat/backend/seatd.c'
++endif
++if with_seatd
+ 	add_project_arguments('-DSEATD_ENABLED=1', language: 'c')
+ endif
+ 
+@@ -189,7 +190,7 @@ libseat = declare_dependency(
+ 	variables: libseat_vars,
+ )
+ 
+-if with_server
++if with_seatd
+ 	executable(
+ 		'seatd',
+ 		[ server_files, 'seatd/seatd.c' ],
+@@ -221,7 +222,7 @@ foreach name, value : tests
+ 		include_directories: [include_directories('.', 'include')]))
+ endforeach
+ 
+-if with_server
++if with_seatd
+ 	scdoc = dependency('scdoc', required: get_option('man-pages'), version: '&gt;= 1.9.7', native: true)
+ else
+ 	scdoc = disabler()
+@@ -252,7 +253,6 @@ endif
+ summary({
+ 	'seatd': with_seatd,
+ 	'builtin': with_builtin,
+-	'server': with_server,
+ 	'systemd': logind.found() and logind_provider == 'systemd',
+ 	'elogind': logind.found() and logind_provider == 'elogind',
+ }, bool_yn: true)
+diff --git a/meson_options.txt b/meson_options.txt
+index 144ce7a..c61d473 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,7 +1,6 @@
+ option('logind', type: 'combo', choices: ['auto', 'disabled', 'elogind', 'systemd'], value: 'auto', description: 'logind support')
+ option('seatd', type: 'combo', choices: ['enabled', 'disabled'], value: 'enabled', description: 'seatd support')
+ option('builtin', type: 'combo', choices: ['enabled', 'disabled'], value: 'disabled', description: 'builtin seatd server')
+-option('server', type: 'combo', choices: ['enabled', 'disabled'], value: 'enabled', description: 'seatd server')
+ option('examples', type: 'combo', choices: ['enabled', 'disabled'], value: 'disabled', description: 'libseat example programs')
+ option('man-pages', type: 'feature', value: 'auto', description: 'Generate and install man pages')
+ option('defaultpath', type: 'string', value: '', description: 'Default location for seatd socket (empty for default)')
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/seatd/libseat/init b/meta/recipes-core/seatd/libseat/init
new file mode 100644
index 0000000000..8c9d77255d
--- /dev/null
+++ b/meta/recipes-core/seatd/libseat/init
@@ -0,0 +1,50 @@
+#!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides:          seatd
+# Short-Description: Start seat management daemon
+# Required-Start:    $local_fs $remote_fs
+# Required-Stop:     $local_fs $remote_fs
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+### END INIT INFO
+
+PATH=/bin:/usr/bin:/sbin:/usr/sbin
+
+test -x /usr/bin/seatd || exit 0
+
+# For configuration of the init script use the file
+# /etc/default/seatd, do not edit this init script.
+
+seatd_group="seatd"
+
+[ -e /etc/default/seatd ] &amp;&amp; . /etc/default/seatd
+
+NAME=seatd
+DAEMON=/usr/bin/seatd
+STOP_RETRY_SCHEDULE='TERM/10/forever/KILL/1'
+
+. /etc/init.d/functions
+
+case "$1" in
+  start)
+    start-stop-daemon --start --backgroud --quiet --pidfile /var/run/$NAME.pid \
+	    --exec $DAEMON -- -g $seatd_group
+    ;;
+
+  stop)
+    killproc $NAME
+    ;;
+
+  restart)
+    $0 stop
+    sleep 1
+    $0 start
+    ;;
+  *)
+    echo "Usage: $0 {start|stop|restart}"
+    exit 1
+
+esac
+
+exit 0
diff --git a/meta/recipes-core/seatd/libseat_0.5.0.bb b/meta/recipes-core/seatd/libseat_0.5.0.bb
new file mode 100644
index 0000000000..8067d32a26
--- /dev/null
+++ b/meta/recipes-core/seatd/libseat_0.5.0.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Seat management daemon and library"
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://git.sr.ht/~kennylevinsen/seatd">"https://git.sr.ht/~kennylevinsen/seatd"</a>
+SECTION = "base"
+
+DESCRIPTION = "A minimal seat management daemon, and a universal seat management \
+library. Seat management takes care of mediating access to shared devices \
+(graphics, input), without requiring the applications needing access to be root."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;beginline=3;md5=6a01e8ccc65bea4e8bfa79b09ea1444c">"file://LICENSE;beginline=3;md5=6a01e8ccc65bea4e8bfa79b09ea1444c"</a>
+
+SRCREV = "5535c2c3b19b42ebfe4c451600059e9418e401a6"
+SRCBRANCH = "master"
+SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=http;branch=${SRCBRANCH} \
+           <a class="moz-txt-link-freetext" href="file://0001-build-fixup-standalone-without-seatd.patch">file://0001-build-fixup-standalone-without-seatd.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://init">file://init</a>"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig meson useradd update-rc.d
+
+PACKAGECONFIG ??= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','systemd','systemd','seatd',d)}">"${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', 'systemd', 'seatd', d)}"</a>
+
+PACKAGECONFIG[seatd] = "-Dseatd=enabled, -Dseatd=disabled"
+PACKAGECONFIG[systemd] = "-Dlogind=systemd, -Dlogind=disabled, systemd dbus"
+
+PACKAGES += "seatd"
+
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+FILES_seatd = "${bindir}/seatd ${sysconfdir}"
+
+do_install_append() {
+	if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
+		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/seatd
+	fi
+}
+
+INITSCRIPT_NAME = "seatd"
+INITSCRIPT_PARAMS = "start 8 5 2 . stop 21 0 1 6 ."
+
+USERADD_PACKAGES = "seatd"
+
+GROUPADD_PARAM_seatd = "-r seatd"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F5C84C57A73E523FEABCA9C3--
