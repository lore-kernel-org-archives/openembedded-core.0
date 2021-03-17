Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.448.1615941683387145093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 17:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=w0YmNXxo;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.41, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f41.google.com with SMTP id j7so67013wrd.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 17:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gLgTRL0lgfg7HP3WQEP5JkK8CSpa9TWaOwokKwi6sg4=;
        b=w0YmNXxonbg5lrBxct0yeNNdSs4/KsD/910R0KRdVJdNxZOjnX+j56XseveDZ8tJJZ
         mql5ljASYvbsqHDljTL9Mw1IlP8s01ql1w8Jdf0P/On2cHOiq7daidrmsLwZBEnB+TsK
         zW0g3Z38NyKNvyW1+cGBvsqJebw5VzYa9RMOu5ApmX7dLDZOnGcO3B6O3fAX+Km+nGbH
         DMbUBFyxu2KKn0VCnRVrRzXr9BMtvdaoySsvbvNFbp8M2IEWNETZmTlNVGbY5Uw1XOlD
         /oYa7XPszGcyJVUqp34Pi63cKhYPZvjv79dAzZHh1pmFfGHH1wN/HIv9kW7B1xW8xCNF
         XbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gLgTRL0lgfg7HP3WQEP5JkK8CSpa9TWaOwokKwi6sg4=;
        b=PRg3+UhVI19KgGwctLGuPXLWZVgqEek5yP0b894Vu3jNTIiV7zn9jOJP0CnJB4+Yxy
         +lE+rgDTEgpNwKc6uK10gp13HVzbvZ/DqvASzUj0EDWUDxuc0BC98kSzgxs6wbR4T35p
         AaoUqI+zDRy7rLd7RHlQP8U339y2tTMjU/YViMGDNLIPjKH/hpq0bxtEJFzg9yugC8lF
         gciFGWufC7QKm9ray8l8XQlfz5BR2+VsJhsFHpkqrCYB2ZxsbCyQHvYeveyzf9WM2uzg
         JsGkj9qiLVzs/ru8nm/sq+Y9M8T5TqE98lv5Ij6tEaCueIOcFpmXNMwX7fipncijOYfH
         YwOA==
X-Gm-Message-State: AOAM5325g9tJTJCiJl7l/HDm5ljI0QpL7yNgiKdo7Y2lyY8hZ3bBOKWr
	5qLLQiB0c3iukRS9DA8XUeTiqx4LyZUZPVkyGNb62A==
X-Google-Smtp-Source: ABdhPJzO1cQPAeQ079skwtKcaojtHig4U5JH4GD/KiLL13l/hCgJYD1eHUCoMpil4S4LzRnCGrx8hW1Y2cb4oNJGpC0=
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr1516141wrv.329.1615941681729;
 Tue, 16 Mar 2021 17:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615937397.git.steve@sakoman.com> <20210317002229.GM18041@denix.org>
In-Reply-To: <20210317002229.GM18041@denix.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 16 Mar 2021 14:41:08 -1000
Message-ID: <CAOSpxdZzNNi3n=hhyzUm5zhpxLGY3BE9va5XVu_9cp4t1Boowg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/38] Pull request (cover letter only)
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 2:22 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> Steve,
>
> Thanks. Did you forget to revert this:
> http://cgit.openembedded.org/openembedded-core-contrib/commit/meta/lib/o=
e/sstatesig.py?h=3Dstable/dunfell-next&id=3De0c1db170fdd6c1d78fdfce017feae2=
6c96fac29

Nope, didn't forget!  It is in the next group of patches (in
stable/dunfell-nut):

https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/dun=
fell-nut

Steve

> On Tue, Mar 16, 2021 at 01:31:34PM -1000, Steve Sakoman wrote:
> > The following changes since commit f5965d74822513e1edfc796b646e8a1ca2a=
50d65:
> >
> >   yocto-uninative.inc: version 3.0 incorporate seccomp filter workarou=
nd (2021-03-08 06:42:30 -1000)
> >
> > are available in the Git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-=
next
> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstab=
le/dunfell-next
> >
> > Bruce Ashfield (3):
> >   linux-yocto/5.4: update to v5.4.99
> >   linux-yocto/5.4: update to v5.4.101
> >   linux-yocto/5.4: update to v5.4.103
> >
> > Charlie Davies (1):
> >   bitbake-bblayers/create: Fix incorrect priority help message
> >
> > Chen Qi (2):
> >   python3-jinja2: set CVE_PRODUCT
> >   cups: use /run instead /var/run in systemd's unit file
> >
> > Dorinda (7):
> >   meta/recipes-rt: Add HOMEPAGE / DESCRIPTION
> >   meta-skeleton: Add HOMEPAGE / DESCRIPTION
> >   meta/recipes-extended: Add HOMEPAGE / DESCRIPTION
> >   meta/recipes-support: Add HOMEPAGE / DESCRIPTION
> >   meta/recipes-kernel: Add HOMEPAGE / DESCRIPTION
> >   meta/recipes-multimedia: Add HOMEPAGE / DESCRIPTION
> >   meta/recipes-graphics: Add HOMEPAGE / DESCRIPTION
> >
> > Dorinda Bassey (1):
> >   meta/recipes-devtools: Add HOMEPAGE / DESCRIPTION
> >
> > Florian Bezdeka (1):
> >   wic: Warn if an ext filesystem affected by the Y2038 problem is used
> >
> > Jon Mason (1):
> >   runqemu: use "raw" instead of "bin" for ovmf
> >
> > Khem Raj (3):
> >   oeqa/pam: Need shadow installed for the tests
> >   rxvt-unicode: Do not use throw specifications
> >   dtc: Fix array-bounds error
> >
> > Meh Mbeh Ida Delphine (6):
> >   recipes-gnome: Add missing HOMEPAGE and DESCRIPTION for recipes
> >   recipes-graphics: Add missing HOMEPAGE and DESCRIPTION for recipes.
> >   recipes-kernel: Add missing HOMEPAGE and DESCRIPTION for recipes.
> >   recipes-multimedia: Add missing HOMEPAGE and DESCRIPTION for recipes=
.
> >   recipes-sato: Add missing HOMEPAGE and DESCRIPTION for recipes
> >   recipes-support: Add missing HOMEPAGE and DESCRIPTION for recipes
> >
> > Minjae Kim (2):
> >   wpa-supplicant: fix CVE-2021-27803
> >   qemu: fix CVE-2021-20203
> >
> > Purushottam Choudhary (1):
> >   shadow: whitelist CVE-2013-4235
> >
> > Richard Purdie (6):
> >   libid3tag: Fix reproducibility issue
> >   syslinux: Fix reproducibility issues
> >   swig: Fix reproducibility issue
> >   efivar: Fix reproducibility issue
> >   selftest/reproducible: Add ability to pull some objects from sstate
> >   build-appliance-image: Drop kernel module handling
> >
> > Ross Burton (2):
> >   ptest-packagelists: remove libinput-ptest
> >   insane: don't check for a warning string that is never output
> >
> > Ulrich =C3=96lmann (1):
> >   local.conf.sample: fix typo
> >
> > Yi Fan Yu (1):
> >   valgrind: Increase timeout duration 30 -> 90 s
> >
> >  .../baremetal-helloworld_git.bb               |  1 +
> >  .../recipes-kernel/hello-mod/hello-mod_0.1.bb |  1 +
> >  .../linux/linux-yocto-custom.bb               |  2 +-
> >  .../images/core-image-multilib-example.bb     |  3 +-
> >  .../recipes-skeleton/service/service_0.1.bb   |  1 +
> >  meta/classes/insane.bbclass                   | 22 +-----
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  meta/conf/local.conf.sample                   |  2 +-
> >  meta/lib/bblayers/create.py                   |  2 +-
> >  meta/lib/oeqa/runtime/cases/pam.py            |  3 +
> >  meta/lib/oeqa/selftest/cases/reproducible.py  | 16 +++-
> >  .../efivar/efivar/determinism.patch           | 18 +++++
> >  meta/recipes-bsp/efivar/efivar_37.bb          |  1 +
> >  .../wpa-supplicant/CVE-2021-27803.patch       | 54 ++++++++++++++
> >  .../wpa-supplicant/wpa-supplicant_2.9.bb      |  1 +
> >  .../images/build-appliance-image_15.0.0.bb    |  8 +-
> >  .../python/python3-jinja2_2.11.2.bb           |  3 +
> >  .../python/python3-pygobject_3.34.0.bb        |  2 +
> >  .../python/python3-scons_3.1.2.bb             |  1 +
> >  meta/recipes-devtools/qemu/qemu.inc           |  1 +
> >  .../qemu/qemu/CVE-2021-20203.patch            | 74 ++++++++++++++++++=
+
> >  .../swig/swig/determinism.patch               | 19 +++++
> >  meta/recipes-devtools/swig/swig_3.0.12.bb     |  1 +
> >  .../syslinux/syslinux/determinism.patch       | 22 ++++++
> >  .../syslinux/syslinux_6.04-pre2.bb            |  5 ++
> >  ...est-wrapper-to-support-PTEST-formats.patch |  9 ++-
> >  meta/recipes-extended/bash/bash.inc           |  1 +
> >  meta/recipes-extended/bc/bc_1.07.1.bb         |  1 +
> >  .../cracklib/cracklib_2.9.5.bb                |  3 +-
> >  meta/recipes-extended/cups/cups.inc           |  1 +
> >  .../cwautomacros/cwautomacros_20110201.bb     |  1 +
> >  meta/recipes-extended/ed/ed_1.15.bb           |  1 +
> >  meta/recipes-extended/grep/grep_3.4.bb        |  1 +
> >  .../libsolv/libsolv_0.7.10.bb                 |  1 +
> >  .../lighttpd/lighttpd_1.4.55.bb               |  1 +
> >  .../logrotate/logrotate_3.15.1.bb             |  3 +-
> >  meta/recipes-extended/lzip/lzip_1.21.bb       |  1 +
> >  meta/recipes-extended/man-db/man-db_2.9.0.bb  |  1 +
> >  meta/recipes-extended/mc/mc_4.8.23.bb         |  1 +
> >  meta/recipes-extended/mdadm/mdadm_4.1.bb      |  1 +
> >  .../mingetty/mingetty_1.08.bb                 |  1 +
> >  meta/recipes-extended/parted/parted_3.3.bb    |  1 +
> >  .../perl/libconvert-asn1-perl_0.27.bb         |  2 +
> >  .../perl/libtimedate-perl_2.30.bb             |  1 +
> >  meta/recipes-extended/quota/quota_4.05.bb     |  1 +
> >  meta/recipes-extended/sed/sed_4.8.bb          |  1 +
> >  meta/recipes-extended/shadow/shadow.inc       |  1 +
> >  meta/recipes-extended/shadow/shadow_4.8.1.bb  |  5 +-
> >  .../texinfo-dummy-native.bb                   |  1 +
> >  meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
> >  meta/recipes-extended/xinetd/xinetd_2.3.15.bb |  1 +
> >  meta/recipes-extended/xz/xz_5.2.4.bb          |  1 +
> >  meta/recipes-extended/zip/zip_3.0.bb          |  1 +
> >  .../recipes-gnome/epiphany/epiphany_3.34.4.bb |  3 +
> >  .../gnome/adwaita-icon-theme_3.34.3.bb        |  2 +
> >  .../libnotify/libnotify_0.7.8.bb              |  4 +
> >  .../libsecret/libsecret_0.20.1.bb             |  1 +
> >  .../clutter/clutter-gst-3.0.inc               |  4 +
> >  .../clutter/clutter-gtk-1.0.inc               |  5 ++
> >  meta/recipes-graphics/kmscube/kmscube_git.bb  |  6 +-
> >  .../mini-x-session/mini-x-session_0.1.bb      |  1 +
> >  meta/recipes-graphics/mx/mx.inc               |  6 ++
> >  meta/recipes-graphics/piglit/piglit_git.bb    |  2 +
> >  .../startup-notification_0.12.bb              |  5 +-
> >  .../ttf-fonts/ttf-bitstream-vera_1.10.bb      |  1 +
> >  .../vulkan/vulkan-headers_1.1.126.0.bb        |  4 +
> >  .../vulkan/vulkan-tools_1.1.126.0.bb          |  1 +
> >  meta/recipes-graphics/waffle/waffle_1.6.0.bb  |  8 +-
> >  .../pointercal-xinput_0.0.bb                  |  3 +
> >  meta/recipes-kernel/blktrace/blktrace_git.bb  |  5 ++
> >  meta/recipes-kernel/cryptodev/cryptodev.inc   |  5 ++
> >  .../dtc/0001-fdtdump-Fix-gcc11-warning.patch  | 35 +++++++++
> >  meta/recipes-kernel/dtc/dtc_1.6.0.bb          |  2 +
> >  .../kern-tools/kern-tools-native_git.bb       |  4 +
> >  .../linux-firmware/linux-firmware_20210208.bb |  4 +
> >  .../linux-libc-headers/linux-libc-headers.inc |  2 +
> >  .../linux/linux-yocto-rt_5.4.bb               |  6 +-
> >  .../linux/linux-yocto-tiny_5.4.bb             |  8 +-
> >  meta/recipes-kernel/linux/linux-yocto.inc     |  1 +
> >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++---
> >  .../lttng/lttng-modules_2.11.6.bb             |  1 +
> >  .../lttng/lttng-tools_2.11.5.bb               |  1 +
> >  .../make-mod-scripts/make-mod-scripts_1.0.bb  |  1 +
> >  .../systemtap/systemtap-uprobes_git.bb        |  2 +-
> >  .../recipes-kernel/systemtap/systemtap_git.bb |  3 +
> >  .../alsa/alsa-lib_1.2.1.2.bb                  |  2 +
> >  .../alsa/alsa-plugins_1.2.1.bb                |  3 +
> >  .../alsa/alsa-tools_1.1.7.bb                  |  3 +
> >  .../alsa/alsa-topology-conf_1.2.1.bb          |  3 +
> >  .../alsa/alsa-ucm-conf_1.2.1.2.bb             |  3 +
> >  .../alsa/alsa-utils_1.2.1.bb                  |  2 +
> >  .../gstreamer/gst-examples_1.16.0.bb          |  3 +
> >  .../gstreamer/gstreamer1.0-libav_1.16.3.bb    |  2 +
> >  .../gstreamer/gstreamer1.0-omx_1.16.3.bb      |  1 +
> >  .../gstreamer1.0-plugins-bad_1.16.3.bb        |  4 +
> >  .../gstreamer1.0-plugins-base_1.16.3.bb       |  3 +
> >  .../gstreamer1.0-plugins-good_1.16.3.bb       |  4 +
> >  .../gstreamer1.0-plugins-ugly_1.16.3.bb       |  4 +
> >  .../gstreamer/gstreamer1.0-python_1.16.3.bb   |  2 +
> >  .../gstreamer/gstreamer1.0-vaapi_1.16.3.bb    |  1 +
> >  meta/recipes-multimedia/lame/lame_3.100.bb    |  3 +-
> >  .../recipes-multimedia/liba52/liba52_0.7.4.bb |  3 +
> >  .../libid3tag/libid3tag/cflags_filter.patch   | 21 ++++++
> >  .../libid3tag/libid3tag_0.15.1b.bb            |  1 +
> >  .../libpng/libpng_1.6.37.bb                   |  3 +
> >  .../libsamplerate/libsamplerate0_0.1.9.bb     |  1 +
> >  .../libsndfile/libsndfile1_1.0.28.bb          |  3 +
> >  meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  4 +
> >  .../mpeg2dec/mpeg2dec_0.5.1.bb                |  6 +-
> >  .../pulseaudio/pulseaudio.inc                 |  2 +
> >  meta/recipes-rt/rt-tests/rt-tests_1.1.bb      |  3 +-
> >  .../images/core-image-sato-dev.bb             |  1 +
> >  .../images/core-image-sato-ptest-fast.bb      |  1 +
> >  .../images/core-image-sato-sdk-ptest.bb       |  1 +
> >  .../images/core-image-sato-sdk.bb             |  1 +
> >  meta/recipes-sato/images/core-image-sato.bb   |  1 +
> >  meta/recipes-sato/l3afpad/l3afpad_git.bb      |  4 +
> >  .../matchbox-desktop/matchbox-desktop_2.2.bb  |  1 +
> >  .../matchbox-keyboard_0.1.1.bb                |  1 +
> >  .../matchbox-panel-2/matchbox-panel-2_2.11.bb |  2 +
> >  .../packagegroup-core-x11-sato.bb             |  2 +
> >  meta/recipes-sato/pcmanfm/pcmanfm_1.3.1.bb    |  1 +
> >  meta/recipes-sato/puzzles/puzzles_git.bb      |  1 +
> >  .../rxvt-unicode/rxvt-unicode.inc             |  1 +
> >  ...emove-deprecated-throw-specification.patch | 30 ++++++++
> >  .../rxvt-unicode/rxvt-unicode_9.22.bb         |  4 +-
> >  meta/recipes-support/apr/apr_1.7.0.bb         |  8 +-
> >  .../argp-standalone/argp-standalone_1.3.bb    |  1 +
> >  meta/recipes-support/aspell/aspell_0.60.8.bb  | 13 +++-
> >  .../recipes-support/atk/at-spi2-atk_2.34.1.bb |  2 +
> >  .../atk/at-spi2-core_2.34.0.bb                |  6 +-
> >  meta/recipes-support/atk/atk_2.34.1.bb        |  1 +
> >  meta/recipes-support/attr/acl_2.2.53.bb       |  5 +-
> >  meta/recipes-support/attr/attr.inc            |  6 +-
> >  .../bash-completion/bash-completion_2.10.bb   |  7 +-
> >  meta/recipes-support/boost/boost.inc          |  4 +
> >  .../consolekit/consolekit_0.4.6.bb            |  2 +
> >  meta/recipes-support/curl/curl_7.69.1.bb      |  4 +
> >  meta/recipes-support/db/db_5.3.28.bb          |  1 +
> >  .../debianutils/debianutils_4.9.1.bb          |  5 ++
> >  .../diffoscope/diffoscope_136.bb              |  5 ++
> >  .../recipes-support/enchant/enchant2_2.2.8.bb |  3 +
> >  meta/recipes-support/fribidi/fribidi_1.0.9.bb |  6 ++
> >  meta/recipes-support/gdbm/gdbm_1.18.1.bb      |  3 +
> >  .../gnome-desktop-testing_2018.1.bb           |  4 +
> >  meta/recipes-support/gnupg/gnupg_2.2.20.bb    |  5 ++
> >  meta/recipes-support/gnutls/gnutls_3.6.14.bb  |  4 +-
> >  .../recipes-support/gnutls/libtasn1_4.16.0.bb |  2 +
> >  .../iso-codes/iso-codes_4.4.bb                |  3 +
> >  meta/recipes-support/itstool/itstool_2.0.6.bb |  4 +
> >  .../libassuan/libassuan_2.5.3.bb              |  3 +
> >  .../libatomic-ops/libatomic-ops_7.6.10.bb     |  1 +
> >  meta/recipes-support/libcap/libcap_2.32.bb    |  4 +-
> >  .../libcheck/libcheck_0.14.0.bb               |  5 ++
> >  .../libcroco/libcroco_0.6.13.bb               |  3 +
> >  .../libdaemon/libdaemon_0.14.bb               |  4 +
> >  .../libevdev/libevdev_1.8.0.bb                |  3 +
> >  .../libevent/libevent_2.1.11.bb               |  5 ++
> >  .../recipes-support/libexif/libexif_0.6.22.bb |  3 +
> >  .../libfm/libfm-extra_1.3.1.bb                |  1 +
> >  meta/recipes-support/libfm/libfm_1.3.1.bb     |  2 +
> >  .../libgcrypt/libgcrypt_1.8.5.bb              |  3 +
> >  .../libgpg-error/libgpg-error_1.37.bb         |  1 +
> >  meta/recipes-support/libical/libical_3.0.7.bb |  4 +
> >  meta/recipes-support/libksba/libksba_1.3.5.bb |  5 ++
> >  meta/recipes-support/libnl/libnl_3.5.0.bb     |  5 ++
> >  .../libproxy/libproxy_0.4.15.bb               |  4 +
> >  meta/recipes-support/libpsl/libpsl_0.21.0.bb  |  6 ++
> >  .../libsoup/libsoup-2.4_2.68.4.bb             |  2 +
> >  .../recipes-support/liburcu/liburcu_0.11.1.bb |  3 +
> >  meta/recipes-support/libusb/libusb1_1.0.22.bb |  2 +
> >  .../recipes-support/libxslt/libxslt_1.1.34.bb |  5 ++
> >  meta/recipes-support/lz4/lz4_1.9.2.bb         |  1 +
> >  meta/recipes-support/lzo/lzo_2.10.bb          |  2 +
> >  meta/recipes-support/lzop/lzop_1.04.bb        |  1 +
> >  meta/recipes-support/mpfr/mpfr_4.0.2.bb       |  1 +
> >  meta/recipes-support/nettle/nettle_3.5.1.bb   |  1 +
> >  meta/recipes-support/npth/npth_1.6.bb         |  1 +
> >  .../p11-kit/p11-kit_0.23.22.bb                |  2 +
> >  meta/recipes-support/popt/popt_1.16.bb        |  1 +
> >  meta/recipes-support/re2c/re2c_1.0.1.bb       |  4 +-
> >  meta/recipes-support/serf/serf_1.3.9.bb       |  5 ++
> >  .../shared-mime-info/shared-mime-info_git.bb  |  1 +
> >  meta/recipes-support/sqlite/sqlite3.inc       |  1 +
> >  meta/recipes-support/taglib/taglib_1.11.1.bb  |  1 +
> >  meta/recipes-support/vim/vim.inc              |  4 +
> >  meta/recipes-support/vte/vte_0.58.3.bb        |  2 +
> >  scripts/lib/wic/canned-wks/common.wks.inc     |  2 +-
> >  scripts/lib/wic/canned-wks/directdisk-gpt.wks |  2 +-
> >  scripts/lib/wic/canned-wks/mkefidisk.wks      |  2 +-
> >  scripts/lib/wic/misc.py                       |  1 +
> >  scripts/lib/wic/partition.py                  | 38 ++++++++++
> >  scripts/runqemu                               |  2 +
> >  193 files changed, 772 insertions(+), 90 deletions(-)
> >  create mode 100644 meta/recipes-bsp/efivar/efivar/determinism.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-suppl=
icant/CVE-2021-27803.patch
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20203.pat=
ch
> >  create mode 100644 meta/recipes-devtools/swig/swig/determinism.patch
> >  create mode 100644 meta/recipes-devtools/syslinux/syslinux/determinis=
m.patch
> >  create mode 100644 meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11=
-warning.patch
> >  create mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/cflags=
_filter.patch
> >  create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-l=
ibev-remove-deprecated-throw-specification.patch
> >
> > --
> > 2.25.1
> >
>
> >
> >=20
> >
