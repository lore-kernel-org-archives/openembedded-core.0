Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.3784.1603943523646476663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 20:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=av9nkjPn;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id z33so1063175qth.8
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 20:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iQXq5VXdYpZOPI1cHwywHLW8jz92QenJ/uiSIXNrlOY=;
        b=av9nkjPnVANKzMaf4j4PBTWppSCXOhaLS4Z7RpmcF9/hbydwO4R95Top1ilOtmwY2H
         +EvwUXrslhs61/05Z6zB5hZT9zu81AAMpi7tjCpiUJIoD3/puYiZzvEra9X/b4Wr6CM4
         So6aDbL2ievRQ/72A9sJ6yY56Km/WI5PdrOJJethku1hn1mYWHoQ/e4ir8kJWShCAqkt
         XFT3QInK8NKubg8jKwugKFeW7mQajWTCjOt42Z6J2HZBrCSzNIpEIjh9ecOpEH+GPKOB
         7jVl+sZR+OQ3yQwVipHqjJuD+keEyA0oDb9bWETLgBBMMZj3y/9EoPIxCW/U9n3pLIKA
         p+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iQXq5VXdYpZOPI1cHwywHLW8jz92QenJ/uiSIXNrlOY=;
        b=CJuo55oOpipjCoEZLLcdppvN8Cjr7Zz53b3qotmeeHLVdqdYR8csnPtYt7GecUcf67
         C/CNSRSH8mDNcl0fGuxG+NrhmxE5f1XgyHD3TH8zRSgGZVMYvcQOaIOIkOVTjc8UtB+7
         ZFcxGRmINnZNn6yWRCwNWYmB2Y/4wiSh7vjKcRyWajglzV6TQRo1NescJr8LykQ8NxrE
         q0gZ13qnSgUDOPBbdh6mv1/6Gz/UwN9beVcVIuW9/0lsqL8G2jCQSDulxYM++2BznUq8
         6zL/PwYts2yU/vGllOz03NtPbyag2RH9BD+m4Z68Rtpc4VhT70UYllBCdJi6LHADuaQk
         nj5w==
X-Gm-Message-State: AOAM532Ocviaq8x7m2UhJDHbm7Yjnb8FKCcMYwVjb4UnuOBZRfqq0xhd
	MBwBXbnQKIvs1ueajoxLXdeAsEBFH0g5I9AYGCU=
X-Google-Smtp-Source: ABdhPJwGTw7dpqcBoQjXekRDGpg5XRXLxU/LYdwe57isqhamQ3V7lxKqlPPMaBzGjZTpDrqLv34YLz0QYHmsRgKgQs8=
X-Received: by 2002:a05:622a:1cb:: with SMTP id t11mr458242qtw.378.1603943522641;
 Wed, 28 Oct 2020 20:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201028210558.21070-1-alex.kanavin@gmail.com> <20201028210558.21070-2-alex.kanavin@gmail.com>
In-Reply-To: <20201028210558.21070-2-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 28 Oct 2020 20:51:36 -0700
Message-ID: <CAMKF1srczW3hZ1_4eof7WnPPvGF=8Ukh-sJAQJPZGNn1Md8Amw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/33] glib-2.0: upgrade 2.64.5 -> 2.66.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I think this needs to accommodate/delete patch added by
https://lists.openembedded.org/g/openembedded-core/message/143792?p=,,,20,0,0,0::Created,,glib-2.0,20,2,0,77821523

since we are needing it on dunfell, I would say reverting it along
with this upgrade on master is preferred.

On Wed, Oct 28, 2020 at 2:06 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...-correctly-when-building-with-mingw3.patch | 20 +++++++++----------
>  .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
>  ...{glib-2.0_2.64.5.bb => glib-2.0_2.66.1.bb} |  2 +-
>  3 files changed, 12 insertions(+), 12 deletions(-)
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.64.5.bb => glib-2.0_2.66.1.bb} (95%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> index d075cd3f23..d6765b163b 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> @@ -1,4 +1,4 @@
> -From d3334e83ae0da9ca184eb9c8daf0854544ece023 Mon Sep 17 00:00:00 2001
> +From 333809ded70ad4e3470b7134e3fac1a42ff48e61 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 13 Feb 2019 15:32:05 +0100
>  Subject: [PATCH] Set host_machine correctly when building with mingw32
> @@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   4 files changed, 9 insertions(+), 6 deletions(-)
>
>  diff --git a/gio/tests/meson.build b/gio/tests/meson.build
> -index dab65d2..e8bb2ee 100644
> +index 3a19c82..b762835 100644
>  --- a/gio/tests/meson.build
>  +++ b/gio/tests/meson.build
>  @@ -12,7 +12,7 @@ test_c_args = [
> @@ -26,7 +26,7 @@ index dab65d2..e8bb2ee 100644
>     common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library ('secur32')]
>   endif
>
> -@@ -132,7 +132,7 @@ else
> +@@ -133,7 +133,7 @@ else
>   endif
>
>   #  Test programs buildable on UNIX only
> @@ -35,7 +35,7 @@ index dab65d2..e8bb2ee 100644
>     gio_tests += {
>       'file' : {},
>       'gdbus-peer' : {
> -@@ -384,7 +384,7 @@ if host_machine.system() != 'windows'
> +@@ -385,7 +385,7 @@ if host_machine.system() != 'windows'
>   endif # unix
>
>   #  Test programs buildable on Windows only
> @@ -44,7 +44,7 @@ index dab65d2..e8bb2ee 100644
>     gio_tests += {'win32-streams' : {}}
>   endif
>
> -@@ -454,7 +454,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
> +@@ -455,7 +455,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
>     }
>   endif
>
> @@ -54,10 +54,10 @@ index dab65d2..e8bb2ee 100644
>       'gdbus-example-unix-fd-client' : {
>         'install' : false,
>  diff --git a/glib/tests/meson.build b/glib/tests/meson.build
> -index 3dedafc..94605e6 100644
> +index 6eb23e8..36eb919 100644
>  --- a/glib/tests/meson.build
>  +++ b/glib/tests/meson.build
> -@@ -134,7 +134,7 @@ if glib_conf.has('HAVE_EVENTFD')
> +@@ -137,7 +137,7 @@ if glib_conf.has('HAVE_EVENTFD')
>     }
>   endif
>
> @@ -67,7 +67,7 @@ index 3dedafc..94605e6 100644
>       glib_tests += {
>         'gpoll' : {
>  diff --git a/meson.build b/meson.build
> -index e1b4b79..afb6eaa 100644
> +index 47f3a5c..7ea7ad1 100644
>  --- a/meson.build
>  +++ b/meson.build
>  @@ -32,6 +32,9 @@ else
> @@ -78,8 +78,8 @@ index e1b4b79..afb6eaa 100644
>  +  host_system = 'windows'
>  +endif
>
> - glib_version = meson.project_version()
> - glib_api_version = '2.0'
> + if host_system == 'darwin'
> +   ios_test_code = '''#include <TargetConditionals.h>
>  diff --git a/tests/meson.build b/tests/meson.build
>  index 6741f8f..12fdc90 100644
>  --- a/tests/meson.build
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> index fe87482ae2..07e37acf7d 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> @@ -1,4 +1,4 @@
> -From 2a715765c6ceb2e8b4cc42e060aee75016111d1a Mon Sep 17 00:00:00 2001
> +From 75c0423e1dc34fa20de70bc9932625fd0de4a912 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Fri, 11 Mar 2016 15:35:55 +0000
>  Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
> similarity index 95%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
> index a30c5215be..52c7e42fbd 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
> @@ -21,7 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>
>  SRC_URI_append_class-native = " file://relocate-modules.patch"
>
> -SRC_URI[sha256sum] = "9cbd5bd2715ead1c28d53c46f7b7b6ff6166f5887b772c1a9e3bf2910cfecc11"
> +SRC_URI[sha256sum] = "a269ffe69fbcc3a21ff1acb1b6146b2a5723499d6e2de33ae16ccb6d2438ef60"
>
>  # Find any meson cross files in FILESPATH that are relevant for the current
>  # build (using siteinfo) and add them to EXTRA_OEMESON.
> --
> 2.29.0
>
>
> 
>
