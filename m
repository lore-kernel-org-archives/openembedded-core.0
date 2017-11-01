Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id AED9D60291
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 01:55:09 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g6so799231pgn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 18:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=E3ZbGjTL206vTtypYyzrGqi0Ind7D8EDIENqv4z/FOk=;
	b=N44Mjf8H4mkIYWFVvyO0z8hF9MjAyGt+zTacolzqcbq/QZ8Lj4vh20KodZqwlK1G72
	yJorNo0+UGef182YmyxIz021mJ3xkZ5InFjenrMhDaVhCbYTA/3FNFmZmGeFOVsqO8Y7
	BhGnRjlxDO2HEUFCxa9kwUxXNZA6fmj1sSH72tR681Aqs4TW7jiwAF3B0kn6faOAe7UI
	Jq1Bc/WBCxrdJpWfbXJWp6NQE8bV6+ycaLK6NE9z97lYIXunXZLYgx2CsYnd0NpI825V
	A0XiO6vnpsToXRA43L3kksFAp0hud35CFT1A1gf7HG5N5l1Nl5F/dXbvGKvkAxp0poPW
	PK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=E3ZbGjTL206vTtypYyzrGqi0Ind7D8EDIENqv4z/FOk=;
	b=ivfome7K+kFzLgxOjZiRFmBT+5Ro/Z3yhLAFRYhkc7WSjF1GKa9woGFLBJv0H8KoH4
	Mfdn1TIrzKDjwmqyBpuvl3uFI+cZrvjPCYhM0yuu26ESWrT9EEJ8c8i/aJizbWkpFSI4
	XtlFo6JnCyU4fjEHHOI2DCB4mHRLahlXh+uYkyClqNY/zZvccP5xn2Ubdx+RAbubcv9O
	F7HAqOiONkVYrleGQo7PgGS4Jo2Wo/zOxItYFWwwXRJGqCLAAYzFa0+rk5cEhRvJCr0Q
	GfceHTEm+MJYhU9KgGhX3EUnM09os6zbVIpXcZOkZRA6LNVhDnkMZh9JLgy8bP4U+j2g
	nCwg==
X-Gm-Message-State: AMCzsaWQbDJ4Pm6uHP8LhqBOMH9wIfGxwQbjBLDl+7ex1h5zFzJKK+Bx
	o2/E6ZFYrZphoi/duBYff063RvihXtJP/v04OSU=
X-Google-Smtp-Source: ABhQp+SpyKQBWY3FYUkCq9o2vzGbWzXVjPXKUCahzV3xIQDJhmtVTsX4fr1pslZkb2uHfbDZ+K+kDqtQokcVgtjewYQ=
X-Received: by 10.99.51.72 with SMTP id z69mr4067855pgz.317.1509501310150;
	Tue, 31 Oct 2017 18:55:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 31 Oct 2017 18:54:39 -0700 (PDT)
In-Reply-To: <dba12417-71af-c0ba-0010-62c6be98c92b@windriver.com>
References: <cover.1509431793.git.dengke.du@windriver.com>
	<3ce7730efecfc08d8eb8b8cae1cfe6eea9539bf1.1509431793.git.dengke.du@windriver.com>
	<CAMKF1soRxzZDsVbr8dCdkY-o9AGJW4mZQmpJBv6CM5mCnJcRiA@mail.gmail.com>
	<dba12417-71af-c0ba-0010-62c6be98c92b@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Oct 2017 18:54:39 -0700
Message-ID: <CAMKF1spxsbh+tQPhYVuiAn9_Nw_c+m8SHNEeWERH5huAbLQerw@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] avahi: upgrade to 0.7
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
X-List-Received-Date: Wed, 01 Nov 2017 01:55:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2017 at 6:35 PM, Dengke Du <dengke.du@windriver.com> wrote:
>
>
> On 2017=E5=B9=B411=E6=9C=8801=E6=97=A5 03:20, Khem Raj wrote:
>>
>> On Mon, Oct 30, 2017 at 11:44 PM, Dengke Du <dengke.du@windriver.com>
>> wrote:
>>>
>>> Delete the unneeded patch, because the upstream contains the needed
>>> changes.
>>> The new version of avahi 0.7 use "/run" directory to place some run-tim=
e
>>> variable data, not /var/run, so in avahi.inc, we should remove the "/ru=
n"
>>> not "/var/run".
>>
>> if var/run is not empty then the content should be deleted as well.
>
>
> Hi Khem,
>
> Yes, but the installation would not create the /var/run directory.
>
>

OK thanks for confirming

>>
>>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>>> ---
>>>   .../avahi/{avahi-ui_0.6.32.bb =3D> avahi-ui_0.7.bb}  |  6 ++---
>>>   meta/recipes-connectivity/avahi/avahi.inc          | 11 +++-----
>>>   .../avahi/{avahi_0.6.32.bb =3D> avahi_0.7.bb}        |  6 ++---
>>>   ...c-install-GtkBuilder-interface-files-for-.patch | 29
>>> ---------------------
>>>   .../files/avahi-fix-resource-unavaiable.patch      | 30
>>> ----------------------
>>>   5 files changed, 7 insertions(+), 75 deletions(-)
>>>   rename meta/recipes-connectivity/avahi/{avahi-ui_0.6.32.bb =3D>
>>> avahi-ui_0.7.bb} (89%)
>>>   rename meta/recipes-connectivity/avahi/{avahi_0.6.32.bb =3D>
>>> avahi_0.7.bb} (78%)
>>>   delete mode 100644
>>> meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuil=
der-interface-files-for-.patch
>>>   delete mode 100644
>>> meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.pat=
ch
>>>
>>> diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
>>> b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
>>> similarity index 89%
>>> rename from meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
>>> rename to meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
>>> index ac36461..5648e38 100644
>>> --- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
>>> +++ b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
>>> @@ -9,9 +9,8 @@ require avahi.inc
>>>   inherit distro_features_check
>>>   ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>>>
>>> -SRC_URI +=3D
>>> "file://0001-configure.ac-install-GtkBuilder-interface-files-for-.patch=
"
>>> -SRC_URI[md5sum] =3D "22b5e705d3eabb31d26f2e1e7b074013"
>>> -SRC_URI[sha256sum] =3D
>>> "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
>>> +SRC_URI[md5sum] =3D "d76c59d0882ac6c256d70a2a585362a6"
>>> +SRC_URI[sha256sum] =3D
>>> "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
>>>
>>>   DEPENDS +=3D "avahi"
>>>
>>> @@ -52,7 +51,6 @@ do_install_append () {
>>>          rm ${D}${libdir}/pkgconfig/avahi-g*
>>>          rm ${D}${sbindir} -rf
>>>          rm ${D}${datadir}/avahi/a*
>>> -       rm ${D}${datadir}/avahi/s*
>>>          rm ${D}${datadir}/locale/ -rf
>>>          rm ${D}${datadir}/dbus* -rf
>>>          rm ${D}${mandir}/man1/a*
>>> diff --git a/meta/recipes-connectivity/avahi/avahi.inc
>>> b/meta/recipes-connectivity/avahi/avahi.inc
>>> index 7814464..e9819bf 100644
>>> --- a/meta/recipes-connectivity/avahi/avahi.inc
>>> +++ b/meta/recipes-connectivity/avahi/avahi.inc
>>> @@ -33,11 +33,11 @@ PACKAGECONFIG[gtk3] =3D
>>> "--enable-gtk3,--disable-gtk3,gtk+3"
>>>   PACKAGECONFIG[pygtk] =3D "--enable-pygtk,--disable-pygtk,"
>>>
>>>   USERADD_PACKAGES =3D "avahi-daemon avahi-autoipd"
>>> -USERADD_PARAM_avahi-daemon =3D "--system --home /var/run/avahi-daemon =
\
>>> +USERADD_PARAM_avahi-daemon =3D "--system --home /run/avahi-daemon \
>>>                                 --no-create-home --shell /bin/false \
>>>                                 --user-group avahi"
>>>
>>> -USERADD_PARAM_avahi-autoipd =3D "--system --home /var/run/avahi-autoip=
d \
>>> +USERADD_PARAM_avahi-autoipd =3D "--system --home /run/avahi-autoipd \
>>>                                 --no-create-home --shell /bin/false \
>>>                                 --user-group \
>>>                                 -c \"Avahi autoip daemon\" \
>>> @@ -125,12 +125,7 @@ INITSCRIPT_PARAMS_avahi-dnsconfd =3D "defaults 22 =
19"
>>>
>>>   do_install() {
>>>          autotools_do_install
>>> -
>>> -       # don't install /var/run when populating rootfs. Do it through
>>> volatile
>>> -       # /var/run of current version is empty, so just remove it.
>>> -       # if /var/run become non-empty in the future, need to install i=
t
>>> via volatile
>>> -       rm -rf ${D}${localstatedir}/run
>>> -       rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
>>> +       rm -rf ${D}/run
>>>          rm -rf ${D}${datadir}/dbus-1/interfaces
>>>          test -d ${D}${datadir}/dbus-1 && rmdir
>>> --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
>>>          rm -rf ${D}${libdir}/avahi
>>> diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.32.bb
>>> b/meta/recipes-connectivity/avahi/avahi_0.7.bb
>>> similarity index 78%
>>> rename from meta/recipes-connectivity/avahi/avahi_0.6.32.bb
>>> rename to meta/recipes-connectivity/avahi/avahi_0.7.bb
>>> index bfa6304..7c91f10 100644
>>> --- a/meta/recipes-connectivity/avahi/avahi_0.6.32.bb
>>> +++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
>>> @@ -12,10 +12,8 @@ LIC_FILES_CHKSUM =3D
>>> "file://LICENSE;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
>>>
>>> file://avahi-daemon/main.c;endline=3D21;md5=3D9ee77368c5407af77caaef1b0=
7285969 \
>>>
>>> file://avahi-client/client.h;endline=3D23;md5=3Df4ac741a25c4f434039ba3e=
18c8674cf"
>>>
>>> -SRC_URI +=3D "file://avahi-fix-resource-unavaiable.patch"
>>> -
>>> -SRC_URI[md5sum] =3D "22b5e705d3eabb31d26f2e1e7b074013"
>>> -SRC_URI[sha256sum] =3D
>>> "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
>>> +SRC_URI[md5sum] =3D "d76c59d0882ac6c256d70a2a585362a6"
>>> +SRC_URI[sha256sum] =3D
>>> "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
>>>
>>>   DEPENDS +=3D "intltool-native"
>>>
>>> diff --git
>>> a/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBu=
ilder-interface-files-for-.patch
>>> b/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBu=
ilder-interface-files-for-.patch
>>> deleted file mode 100644
>>> index 942607a..0000000
>>> ---
>>> a/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBu=
ilder-interface-files-for-.patch
>>> +++ /dev/null
>>> @@ -1,29 +0,0 @@
>>> -From 6ff255eff4fea6350b5e0462fee176fadc26fc1c Mon Sep 17 00:00:00 2001
>>> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>> -Date: Sun, 12 Jun 2016 18:32:49 +0300
>>> -Subject: [PATCH] configure.ac: install GtkBuilder interface files for
>>> GTK+3
>>> - too
>>> -
>>> -Upstream-Status: Submitted [https://github.com/lathiat/avahi/pull/130]
>>> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>>> ----
>>> - configure.ac | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/configure.ac b/configure.ac
>>> -index 87a9a17..9860dcc 100644
>>> ---- a/configure.ac
>>> -+++ b/configure.ac
>>> -@@ -965,7 +965,7 @@ AC_SUBST(avahi_socket)
>>> - #
>>> - # Avahi interfaces dir
>>> - #
>>> --if test "x$HAVE_PYTHON_DBUS" =3D "xyes" -o "x$HAVE_GTK" =3D "xyes"; t=
hen
>>> -+if test "x$HAVE_PYTHON_DBUS" =3D "xyes" -o "x$HAVE_GTK" =3D "xyes" -o
>>> "x$HAVE_GTK3" =3D "xyes"; then
>>> -       interfacesdir=3D"${datadir}/${PACKAGE}/interfaces/"
>>> -       AC_SUBST(interfacesdir)
>>> - fi
>>> ---
>>> -2.8.1
>>> -
>>> diff --git
>>> a/meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.p=
atch
>>> b/meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.p=
atch
>>> deleted file mode 100644
>>> index 5a2fd75..0000000
>>> ---
>>> a/meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.p=
atch
>>> +++ /dev/null
>>> @@ -1,30 +0,0 @@
>>> -Upstream-Status: Backport
>>> -
>>> -Backport from:
>>> -https://github.com/experimental-platform/platform-hostname-avahi/pull/=
9
>>> -
>>> -It sometimes fails to run avahi with error: "Could not receive return
>>> value
>>> -from daemon process". It has same root cause with
>>> -https://github.com/lxc/lxc/issues/25.
>>> -
>>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ----
>>> -From 5150983102ad5ad43f0dae203cb332c168eb5a71 Mon Sep 17 00:00:00 2001
>>> -From: Hinnerk Haardt <haardt@information-control.de>
>>> -Date: Thu, 17 Dec 2015 11:52:19 +0100
>>> -Subject: [PATCH] Fix `chroot.c: fork() failed: Resource temporarily
>>> - unavailable` as per https://github.com/lxc/lxc/issues/25.
>>> -
>>> ----
>>> - avahi-daemon/avahi-daemon.conf | 1 -
>>> - 1 file changed, 1 deletion(-)
>>> -
>>> -diff --git a/avahi-daemon/avahi-daemon.conf
>>> b/avahi-daemon/avahi-daemon.conf
>>> -index 95166f8..3d5b7a6 100644
>>> ---- a/avahi-daemon/avahi-daemon.conf
>>> -+++ b/avahi-daemon/avahi-daemon.conf
>>> -@@ -65,4 +65,3 @@ rlimit-data=3D4194304
>>> - rlimit-fsize=3D0
>>> - rlimit-nofile=3D768
>>> - rlimit-stack=3D4194304
>>> --rlimit-nproc=3D3
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

