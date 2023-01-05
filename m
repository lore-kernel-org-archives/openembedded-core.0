Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BA4C53210
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:42:32 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.15847.1672933342005476455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 07:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout07.t-online.de (Postfix) with SMTP id 6301BBA06;
	Thu,  5 Jan 2023 16:42:20 +0100 (CET)
Received: from [192.168.178.83] ([79.219.228.197]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pDSNn-2DPmIS0; Thu, 5 Jan 2023 16:42:19 +0100
Date: Thu, 05 Jan 2023 16:42:13 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gcr3: update 3.40.0 -> 3.41.1
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <DMR0OR.Q1D80VIV2M3N1@t-online.de>
In-Reply-To: <Y7YD1ZgSe7b+UIBt@mail.local>
References: <20230101142414.463881-1-f_l_k@t-online.de>
	<Y7YD1ZgSe7b+UIBt@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-KnwJBlGIYsELqlEA7tAq"
X-TOI-EXPURGATEID: 150726::1672933339-D924D9D3-2996FEB8/0/0 CLEAN NORMAL
X-TOI-MSGID: 26d27c9e-e5f0-4144-b5ea-84760da63f79
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 15:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175540

--=-KnwJBlGIYsELqlEA7tAq
Content-Type: text/plain; charset=us-ascii; format=flowed

I can't see much in the log. I'll take a closer look when I get a 
chance, but so far I can't reproduce the problem. But I think there is 
no pressure for the update

Am Mi, 4. Jan 2023 um 23:55:17 +0100 schrieb Alexandre Belloni via 
lists.openembedded.org 
<alexandre.belloni=bootlin.com@lists.openembedded.org>:
> This failed on the AB:
> 
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3976/steps/11/logs/stdio>
> 
> On 01/01/2023 15:24:14+0100, Markus Volk wrote:
>>   - remove unneded backport patches
>>   - partly import the patch to fix ssh_agent option from gcr4 recipe
>> 
>>  gcr 3.41.1:
>>  - meson: Fix unknown kw argument in gnome.generate_gir 
>> [GNOME/gcr!68]
>>  - gcr: Add G_SPAWN_CLOEXEC_PIPES flag to all the g_spawn commands
>>  - docs: Port from gtk-doc to gi-docgen [GNOME/gcr!76]
>>  - Unbreak build without systemd [GNOME/gcr!75]
>>  - Several CI fixes
>>  - Updated translations
>> 
>>  gcr 3.41.0:
>>  - Port ssh-agent from gnome-keyring [GNOME/gcr!67]
>>  - build: Fix parallel build failure due to missing marshal 
>> dependency [GNOME/gcr!68]
>>  - Fix warnings by dropping `volatile` for g_once_init_inter 
>> locations [GNOME/gcr!69]
>>  - tests: More robust against GTask unref race condition 
>> [GNOME/gcr!72,GNOME/gcr#84]
>>  - Updated translations
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   ...build-fix-one-parallel-build-failure.patch | 37 -----------
>>   ...ectly-handle-disabled-ssh_agent-opti.patch | 36 +++++++++++
>>   ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch | 61 
>> -------------------
>>   .../gcr/{gcr3_3.40.0.bb => gcr3_3.41.1.bb}    | 17 ++++--
>>   4 files changed, 47 insertions(+), 104 deletions(-)
>>   delete mode 100644 
>> meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
>>   create mode 100644 
>> meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
>>   delete mode 100644 
>> meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
>>   rename meta/recipes-gnome/gcr/{gcr3_3.40.0.bb => gcr3_3.41.1.bb} 
>> (69%)
>> 
>>  diff --git 
>> a/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch 
>> b/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
>>  deleted file mode 100644
>>  index 81c4bdbbcc..0000000000
>>  --- 
>> a/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
>>  +++ /dev/null
>>  @@ -1,37 +0,0 @@
>>  -From cb3708bad88e713e4ccf705cb8c14c5996cd9d06 Mon Sep 17 00:00:00 
>> 2001
>>  -From: Changqing Li <changqing.li@windriver.com 
>> <mailto:changqing.li@windriver.com>>
>>  -Date: Fri, 23 Apr 2021 16:32:38 +0800
>>  -Subject: [PATCH] gcr/meson.build: fix one parallel build failure
>>  -
>>  -ui/gcr-live-search.c includes gcr/gcr-marshal.h. Because missing
>>  -dependency, following error occurred intermittently during doing 
>> parallel
>>  -build:
>>  -
>>  - -o ui/libgcr-ui-3.so.1.0.0.p/gcr-live-search.c.o -c 
>> ../gcr-3.38.1/ui/gcr-live-search.c
>>  -../gcr-3.38.1/ui/gcr-live-search.c:32:10: fatal error: 
>> gcr/gcr-marshal.h: No such file or directory
>>  -   32 | #include "gcr/gcr-marshal.h"
>>  -      |          ^~~~~~~~~~~~~~~~~~~
>>  -compilation terminated.
>>  -
>>  -Upstream-Status: Submitted 
>> [<https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/68/diffs>]
>>  -
>>  -Signed-off-by: Changqing Li <changqing.li@windriver.com 
>> <mailto:changqing.li@windriver.com>>
>>  ----
>>  - gcr/meson.build | 1 +
>>  - 1 file changed, 1 insertion(+)
>>  -
>>  -diff --git a/gcr/meson.build b/gcr/meson.build
>>  -index 06c3a63..d9d4b8f 100644
>>  ---- a/gcr/meson.build
>>  -+++ b/gcr/meson.build
>>  -@@ -181,6 +181,7 @@ gcr_base_dep = declare_dependency(
>>  -   sources: [
>>  -     gcr_enums_gen[1],
>>  -     gcr_oids[1],
>>  -+    gcr_marshal_gen[1],
>>  -   ],
>>  - )
>>  -
>>  ---
>>  -2.17.1
>>  -
>>  diff --git 
>> a/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch 
>> b/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
>>  new file mode 100644
>>  index 0000000000..d3c26d97ae
>>  --- /dev/null
>>  +++ 
>> b/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
>>  @@ -0,0 +1,36 @@
>>  +From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 
>> 2001
>>  +From: Alexander Kanavin <alex@linutronix.de 
>> <mailto:alex@linutronix.de>>
>>  +Date: Wed, 16 Nov 2022 11:27:24 +0100
>>  +Subject: [PATCH 1/2] meson.build: correctly handle disabled 
>> ssh_agent option
>>  +
>>  +Existing code produces these errors:
>>  +| gcr/meson.build:61:0: ERROR: Unable to get the path of a 
>> not-found external program
>>  +| gcr/meson.build:101:5: ERROR: Unknown variable "ssh_add_path".
>>  +
>>  +Signed-off-by: Alexander Kanavin <alex@linutronix.de 
>> <mailto:alex@linutronix.de>>
>>  +
>>  +Upstream-Status: Backport [ 
>> <https://gitlab.gnome.org/GNOME/gcr/-/commit/9b67bb18d8409e0e693cc6000507acbd73a30eab> 
>> ]
>>  +---
>>  + meson.build | 12 ++++++++----
>>  + 1 file changed, 8 insertions(+), 4 deletions(-)
>>  +
>>  +diff --git a/meson.build b/meson.build
>>  +index 3f35173..11d7fa7 100644
>>  +--- a/meson.build
>>  ++++ b/meson.build
>>  +@@ -96,8 +98,10 @@ conf.set('HAVE_TIMEGM', 
>> cc.has_function('timegm'))
>>  + conf.set('HAVE_MLOCK', cc.has_function('mlock'))
>>  + conf.set_quoted('GPG_EXECUTABLE', gpg_path)
>>  + conf.set_quoted('LIBGCRYPT_VERSION', libgcrypt_dep.version())
>>  +-conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
>>  +-conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
>>  ++if get_option('ssh_agent')
>>  ++  conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
>>  ++  conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
>>  ++endif
>>  + conf.set10('WITH_SYSTEMD', with_systemd)
>>  + config_file = configure_file(
>>  +   output: 'config.h',
>>  +--
>>  +2.34.1
>>  +
>>  diff --git 
>> a/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch 
>> b/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
>>  deleted file mode 100644
>>  index ae4e2ac1eb..0000000000
>>  --- 
>> a/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
>>  +++ /dev/null
>>  @@ -1,61 +0,0 @@
>>  -From b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8 Mon Sep 17 00:00:00 
>> 2001
>>  -From: Jakub Jirutka <jakub@jirutka.cz <mailto:jakub@jirutka.cz>>
>>  -Date: Wed, 12 Jan 2022 00:24:20 +0100
>>  -Subject: [PATCH] meson: Fix unknown kw argument in 
>> gnome.generate_gir
>>  -
>>  -This argument has been removed in Meson 0.61.0:
>>  -
>>  -    gck/meson.build:130:2: ERROR: gnome.generate_gir got unknown 
>> keyword arguments "packages"
>>  -
>>  
>> -<https://github.com/mesonbuild/meson/commit/f8fc5cb860465718fe7c79a1bf1fe00659f138de>:
>>  -
>>  -> The packages argument to gnome.generate_gir was allowed, but 
>> never did anything, so stop passing it.
>>  -
>>  -Fixes #89
>>  -Upstream-Status: Backport
>>  -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com 
>> <mailto:alex.kanavin@gmail.com>>
>>  ----
>>  - gck/meson.build | 1 -
>>  - gcr/meson.build | 1 -
>>  - ui/meson.build  | 1 -
>>  - 3 files changed, 3 deletions(-)
>>  -
>>  -diff --git a/gck/meson.build b/gck/meson.build
>>  -index 756b486..a21a1e9 100644
>>  ---- a/gck/meson.build
>>  -+++ b/gck/meson.build
>>  -@@ -131,7 +131,6 @@ if get_option('introspection')
>>  -     sources: gck_gir_sources,
>>  -     namespace: 'Gck',
>>  -     nsversion: '@0@'.format(gck_major_version),
>>  --    packages: gck_deps,
>>  -     export_packages: 'gck-@0@'.format(gck_major_version),
>>  -     includes: [ 'GObject-2.0', 'Gio-2.0' ],
>>  -     header: 'gck/gck.h',
>>  -diff --git a/gcr/meson.build b/gcr/meson.build
>>  -index 2233a44..c83641b 100644
>>  ---- a/gcr/meson.build
>>  -+++ b/gcr/meson.build
>>  -@@ -190,7 +190,6 @@ if get_option('introspection')
>>  -     sources: [ gcr_base_public_sources, gcr_base_headers ],
>>  -     namespace: 'Gcr',
>>  -     nsversion: '@0@'.format(gcr_major_version),
>>  --    packages: gcr_base_deps,
>>  -     export_packages: 'gcr-base-@0@'.format(gcr_major_version),
>>  -     includes: [
>>  -       'GObject-2.0',
>>  -diff --git a/ui/meson.build b/ui/meson.build
>>  -index e656ea2..32ee057 100644
>>  ---- a/ui/meson.build
>>  -+++ b/ui/meson.build
>>  -@@ -152,7 +152,6 @@ if get_option('introspection')
>>  -     export_packages: 'gcr-ui-@0@'.format(gcr_major_version),
>>  -     identifier_prefix: 'Gcr',
>>  -     symbol_prefix: 'gcr',
>>  --    packages: gcr_ui_deps,
>>  -     includes: [
>>  -       'GObject-2.0',
>>  -       'Gio-2.0',
>>  ---
>>  -GitLab
>>  -
>>  diff --git a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb 
>> b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
>>  similarity index 69%
>>  rename from meta/recipes-gnome/gcr/gcr3_3.40.0.bb
>>  rename to meta/recipes-gnome/gcr/gcr3_3.41.1.bb
>>  index 5318768db6..273728f6c8 100644
>>  --- a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
>>  +++ b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
>>  @@ -20,24 +20,27 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>>   inherit gnomebase gtk-icon-cache gtk-doc features_check 
>> upstream-version-is-even vala gobject-introspection gettext mime 
>> mime-xdg
>>   UPSTREAM_CHECK_REGEX = 
>> "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
>> 
>>  -SRC_URI = " \
>>  
>> -	https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=archive 
>> <https://download.gnome.org/sources/gcr/3.40/gcr-$%7BPV%7D.tar.xz;name=archive> 
>> \
>>  -	file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch 
>> <file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch/> \
>>  -	file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch" 
>> <file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch/>
>>  -
>>  -SRC_URI[archive.sha256sum] = 
>> "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
>>  +SRC_URI = 
>> "https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.xz;name=archive 
>> <https://download.gnome.org/sources/gcr/3.41/gcr-$%7BPV%7D.tar.xz;name=archive>"
>>  +SRC_URI += 
>> "file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch" 
>> <file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch/>
>>  +SRC_URI[archive.sha256sum] = 
>> "bb7128a3c2febbfee9c03b90d77d498d0ceb237b0789802d60185c71c4bea24f"
>> 
>>   S = "${WORKDIR}/gcr-${PV}"
>> 
>>   PACKAGECONFIG ??= " \
>>  +	${@bb.utils.filter <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 
>> 'systemd', d)} \
>>   	${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'gtk', '', 
>> d)} \
>>   	${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'wayland', 'gtk', 
>> '', d)} \
>>   "
>>   PACKAGECONFIG[gtk] = "-Dgtk=true,-Dgtk=false,gtk+3"
>>  +PACKAGECONFIG[ssh_agent] = 
>> "-Dssh_agent=true,-Dssh_agent=false,libsecret,openssh"
>>  +#'Use systemd socket activation for server programs'
>>  +PACKAGECONFIG[systemd] = 
>> "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
>> 
>>   FILES:${PN} += " \
>>       ${datadir}/dbus-1 \
>>       ${datadir}/gcr-3 \
>>  +    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
>>  +    ${systemd_user_unitdir}/gcr-ssh-agent.service \
>>   "
>> 
>>   # <http://errors.yoctoproject.org/Errors/Details/20229/>
>>  @@ -50,5 +53,7 @@ do_write_config:append() {
>>       cat >${WORKDIR}/meson-${PN}.cross <<EOF
>>   [binaries]
>>   gpg2 = '${bindir}/gpg2'
>>  +ssh-add = '${bindir}/ssh-add'
>>  +ssh-agent = '${bindir}/ssh-agent'
>>   EOF
>>   }
>>  --
>>  2.34.1
>> 
> 
>> 
>> 
>> 
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com <https://bootlin.com/>
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175511): 
> <https://lists.openembedded.org/g/openembedded-core/message/175511>
> Mute This Topic: <https://lists.openembedded.org/mt/95988912/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-KnwJBlGIYsELqlEA7tAq
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><pre class="tw-data-text tw-text-large tw-ta" data-placeholder="bersetzung" id="tw-target-text" dir="ltr"><span class="Y2IQFc" lang="en">I can't see much in the log. I'll take a closer look when I get a chance, but so far I can't reproduce the problem. But I think there is no pressure for the update</span></pre></div></div><div id="geary-quote" dir="auto"><br>Am Mi, 4. Jan 2023 um 23:55:17 +0100 schrieb Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=bootlin.com@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This failed on the AB:

<a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3976/steps/11/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3976/steps/11/logs/stdio</a>

On 01/01/2023 15:24:14+0100, Markus Volk wrote:
<blockquote>  - remove unneded backport patches
  - partly import the patch to fix ssh_agent option from gcr4 recipe
 
 gcr 3.41.1:
 - meson: Fix unknown kw argument in gnome.generate_gir [GNOME/gcr!68]
 - gcr: Add G_SPAWN_CLOEXEC_PIPES flag to all the g_spawn commands
 - docs: Port from gtk-doc to gi-docgen [GNOME/gcr!76]
 - Unbreak build without systemd [GNOME/gcr!75]
 - Several CI fixes
 - Updated translations
 
 gcr 3.41.0:
 - Port ssh-agent from gnome-keyring [GNOME/gcr!67]
 - build: Fix parallel build failure due to missing marshal dependency [GNOME/gcr!68]
 - Fix warnings by dropping `volatile` for g_once_init_inter locations [GNOME/gcr!69]
 - tests: More robust against GTask unref race condition [GNOME/gcr!72,GNOME/gcr#84]
 - Updated translations
 
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  ...build-fix-one-parallel-build-failure.patch | 37 -----------
  ...ectly-handle-disabled-ssh_agent-opti.patch | 36 +++++++++++
  ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch | 61 -------------------
  .../gcr/{gcr3_3.40.0.bb =&gt; gcr3_3.41.1.bb}    | 17 ++++--
  4 files changed, 47 insertions(+), 104 deletions(-)
  delete mode 100644 meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
  create mode 100644 meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
  delete mode 100644 meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
  rename meta/recipes-gnome/gcr/{gcr3_3.40.0.bb =&gt; gcr3_3.41.1.bb} (69%)
 
 diff --git a/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch b/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
 deleted file mode 100644
 index 81c4bdbbcc..0000000000
 --- a/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
 +++ /dev/null
 @@ -1,37 +0,0 @@
 -From cb3708bad88e713e4ccf705cb8c14c5996cd9d06 Mon Sep 17 00:00:00 2001
 -From: Changqing Li &lt;<a href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>&gt;
 -Date: Fri, 23 Apr 2021 16:32:38 +0800
 -Subject: [PATCH] gcr/meson.build: fix one parallel build failure
 -
 -ui/gcr-live-search.c includes gcr/gcr-marshal.h. Because missing
 -dependency, following error occurred intermittently during doing parallel
 -build:
 -
 - -o ui/libgcr-ui-3.so.1.0.0.p/gcr-live-search.c.o -c ../gcr-3.38.1/ui/gcr-live-search.c
 -../gcr-3.38.1/ui/gcr-live-search.c:32:10: fatal error: gcr/gcr-marshal.h: No such file or directory
 -   32 | #include "gcr/gcr-marshal.h"
 -      |          ^~~~~~~~~~~~~~~~~~~
 -compilation terminated.
 -
 -Upstream-Status: Submitted [<a href="https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/68/diffs">https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/68/diffs</a>]
 -
 -Signed-off-by: Changqing Li &lt;<a href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>&gt;
 ----
 - gcr/meson.build | 1 +
 - 1 file changed, 1 insertion(+)
 -
 -diff --git a/gcr/meson.build b/gcr/meson.build
 -index 06c3a63..d9d4b8f 100644
 ---- a/gcr/meson.build
 -+++ b/gcr/meson.build
 -@@ -181,6 +181,7 @@ gcr_base_dep = declare_dependency(
 -   sources: [
 -     gcr_enums_gen[1],
 -     gcr_oids[1],
 -+    gcr_marshal_gen[1],
 -   ],
 - )
 - 
 --- 
 -2.17.1
 -
 diff --git a/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch b/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
 new file mode 100644
 index 0000000000..d3c26d97ae
 --- /dev/null
 +++ b/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
 @@ -0,0 +1,36 @@
 +From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 2001
 +From: Alexander Kanavin &lt;<a href="mailto:alex@linutronix.de">alex@linutronix.de</a>&gt;
 +Date: Wed, 16 Nov 2022 11:27:24 +0100
 +Subject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent option
 +
 +Existing code produces these errors:
 +| gcr/meson.build:61:0: ERROR: Unable to get the path of a not-found external program
 +| gcr/meson.build:101:5: ERROR: Unknown variable "ssh_add_path".
 +
 +Signed-off-by: Alexander Kanavin &lt;<a href="mailto:alex@linutronix.de">alex@linutronix.de</a>&gt;
 +
 +Upstream-Status: Backport [ <a href="https://gitlab.gnome.org/GNOME/gcr/-/commit/9b67bb18d8409e0e693cc6000507acbd73a30eab">https://gitlab.gnome.org/GNOME/gcr/-/commit/9b67bb18d8409e0e693cc6000507acbd73a30eab</a> ]
 +---
 + meson.build | 12 ++++++++----
 + 1 file changed, 8 insertions(+), 4 deletions(-)
 +
 +diff --git a/meson.build b/meson.build
 +index 3f35173..11d7fa7 100644
 +--- a/meson.build
 ++++ b/meson.build
 +@@ -96,8 +98,10 @@ conf.set('HAVE_TIMEGM', cc.has_function('timegm'))
 + conf.set('HAVE_MLOCK', cc.has_function('mlock'))
 + conf.set_quoted('GPG_EXECUTABLE', gpg_path)
 + conf.set_quoted('LIBGCRYPT_VERSION', libgcrypt_dep.version())
 +-conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
 +-conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
 ++if get_option('ssh_agent')
 ++  conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
 ++  conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
 ++endif
 + conf.set10('WITH_SYSTEMD', with_systemd)
 + config_file = configure_file(
 +   output: 'config.h',
 +-- 
 +2.34.1
 +
 diff --git a/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch b/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
 deleted file mode 100644
 index ae4e2ac1eb..0000000000
 --- a/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
 +++ /dev/null
 @@ -1,61 +0,0 @@
 -From b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8 Mon Sep 17 00:00:00 2001
 -From: Jakub Jirutka &lt;<a href="mailto:jakub@jirutka.cz">jakub@jirutka.cz</a>&gt;
 -Date: Wed, 12 Jan 2022 00:24:20 +0100
 -Subject: [PATCH] meson: Fix unknown kw argument in gnome.generate_gir
 -
 -This argument has been removed in Meson 0.61.0:
 -
 -    gck/meson.build:130:2: ERROR: gnome.generate_gir got unknown keyword arguments "packages"
 -
 -<a href="https://github.com/mesonbuild/meson/commit/f8fc5cb860465718fe7c79a1bf1fe00659f138de">https://github.com/mesonbuild/meson/commit/f8fc5cb860465718fe7c79a1bf1fe00659f138de</a>:
 -
 -&gt; The packages argument to gnome.generate_gir was allowed, but never did anything, so stop passing it.
 -
 -Fixes #89
 -Upstream-Status: Backport
 -Signed-off-by: Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;
 ----
 - gck/meson.build | 1 -
 - gcr/meson.build | 1 -
 - ui/meson.build  | 1 -
 - 3 files changed, 3 deletions(-)
 -
 -diff --git a/gck/meson.build b/gck/meson.build
 -index 756b486..a21a1e9 100644
 ---- a/gck/meson.build
 -+++ b/gck/meson.build
 -@@ -131,7 +131,6 @@ if get_option('introspection')
 -     sources: gck_gir_sources,
 -     namespace: 'Gck',
 -     nsversion: '@0@'.format(gck_major_version),
 --    packages: gck_deps,
 -     export_packages: 'gck-@0@'.format(gck_major_version),
 -     includes: [ 'GObject-2.0', 'Gio-2.0' ],
 -     header: 'gck/gck.h',
 -diff --git a/gcr/meson.build b/gcr/meson.build
 -index 2233a44..c83641b 100644
 ---- a/gcr/meson.build
 -+++ b/gcr/meson.build
 -@@ -190,7 +190,6 @@ if get_option('introspection')
 -     sources: [ gcr_base_public_sources, gcr_base_headers ],
 -     namespace: 'Gcr',
 -     nsversion: '@0@'.format(gcr_major_version),
 --    packages: gcr_base_deps,
 -     export_packages: 'gcr-base-@0@'.format(gcr_major_version),
 -     includes: [
 -       'GObject-2.0',
 -diff --git a/ui/meson.build b/ui/meson.build
 -index e656ea2..32ee057 100644
 ---- a/ui/meson.build
 -+++ b/ui/meson.build
 -@@ -152,7 +152,6 @@ if get_option('introspection')
 -     export_packages: 'gcr-ui-@0@'.format(gcr_major_version),
 -     identifier_prefix: 'Gcr',
 -     symbol_prefix: 'gcr',
 --    packages: gcr_ui_deps,
 -     includes: [
 -       'GObject-2.0',
 -       'Gio-2.0',
 --- 
 -GitLab
 -
 diff --git a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
 similarity index 69%
 rename from meta/recipes-gnome/gcr/gcr3_3.40.0.bb
 rename to meta/recipes-gnome/gcr/gcr3_3.41.1.bb
 index 5318768db6..273728f6c8 100644
 --- a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
 +++ b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
 @@ -20,24 +20,27 @@ GTKDOC_MESON_OPTION = "gtk_doc"
  inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
  UPSTREAM_CHECK_REGEX = "[^\d\.](?P&lt;pver&gt;\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
  
 -SRC_URI = " \
 -	<a href="https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=archive">https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=archive</a> \
 -	<a href="file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch">file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch</a> \
 -	<a href="file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch" "="">file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"</a>
 -
 -SRC_URI[archive.sha256sum] = "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
 +SRC_URI = "<a href="https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.xz;name=archive">https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.xz;name=archive</a>"
 +SRC_URI += "<a href="file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch" "="">file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch"</a>
 +SRC_URI[archive.sha256sum] = "bb7128a3c2febbfee9c03b90d77d498d0ceb237b0789802d60185c71c4bea24f"
  
  S = "${WORKDIR}/gcr-${PV}"
  
  PACKAGECONFIG ??= " \
 +	<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd', d)} \
  	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
  	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
  "
  PACKAGECONFIG[gtk] = "-Dgtk=true,-Dgtk=false,gtk+3"
 +PACKAGECONFIG[ssh_agent] = "-Dssh_agent=true,-Dssh_agent=false,libsecret,openssh"
 +#'Use systemd socket activation for server programs'
 +PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
  
  FILES:${PN} += " \
      ${datadir}/dbus-1 \
      ${datadir}/gcr-3 \
 +    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
 +    ${systemd_user_unitdir}/gcr-ssh-agent.service \
  "
  
  # <a href="http://errors.yoctoproject.org/Errors/Details/20229/">http://errors.yoctoproject.org/Errors/Details/20229/</a>
 @@ -50,5 +53,7 @@ do_write_config:append() {
      cat &gt;${WORKDIR}/meson-${PN}.cross &lt;&lt;EOF
  [binaries]
  gpg2 = '${bindir}/gpg2'
 +ssh-add = '${bindir}/ssh-add'
 +ssh-agent = '${bindir}/ssh-agent'
  EOF
  }
 -- 
 2.34.1
 
</blockquote>
<blockquote> 
 
 
</blockquote>

<div>-- 
</div>Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
<a href="https://bootlin.com">https://bootlin.com</a>
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#175511): <a href="https://lists.openembedded.org/g/openembedded-core/message/175511">https://lists.openembedded.org/g/openembedded-core/message/175511</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/95988912/3618223">https://lists.openembedded.org/mt/95988912/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-KnwJBlGIYsELqlEA7tAq--


