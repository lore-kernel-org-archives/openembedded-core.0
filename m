Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web12.7637.1593081762978086519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tkctk1tZ;
 spf=pass (domain: konsulko.com, ip: 209.85.210.68, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f68.google.com with SMTP id 64so4797708oti.5
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 03:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=al7fKZ4x1V7vl14Sqb6NAl6NOtf4asGrrsjEIYdBgIY=;
        b=tkctk1tZq6fdIinPaIfAhf65PyZ72asUV0gk08wPvXZBghycnXrwBYO6TExVyFVP6b
         hfLSZw8IgkYkNqedEUPqrPVvzLYoY4B/KNCWwyXW3cc2fstQzfgd/a2m9/+55Syd6Qqu
         t9RLlnul+yphYWU1GR47z3ZiyYpfl8e034yp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=al7fKZ4x1V7vl14Sqb6NAl6NOtf4asGrrsjEIYdBgIY=;
        b=U19neCPKIwbwb4iwqFLfA4VDbXhRR8MuFV2juv3LQy9Smgtmo9xgzfTyJnPWfZ/t4r
         wSg9GAJyqRyZhePK9uYXIyJkdJOLfyowWHf0DEzRzG7BlBTAXACFFqZ8oHDHyc+jWZzK
         vodfm76SrwqdzE/RuHitZURYnMREJ5xJf6yyi/Pzjn0cyo5qfatNUDLouznw7nMnE0tz
         wloaWoKnV2ToMvO6mRLRJ0oBu8w4+QiWppsSLu+EjqYCQY1Stk+OX7Y0yyKgw/uYipyc
         +mlYU3UttskYb4HQYe0qMb+1BJTKKsqVy6soAWObGTpMrDTW0IAFfXkhK1J7tt73EcbN
         0THg==
X-Gm-Message-State: AOAM531fjz383Se5eRHD9DL1i+syb34NIIcZ5YsKM6m7GEOOUV4+9DIq
	NBGGdUBCKxNhsytYfqwwOqhFl0CnCzDXA3aRUfwUrzDj
X-Google-Smtp-Source: ABdhPJzNOs5kZ+o5zMs6cWNDVB8rAYGs2HqcvSZImQPfyI3G87HYQj4Gtf7thf7KRmScCU0P6/rQpEuzXQKAP1oyDKg=
X-Received: by 2002:a05:6830:22ee:: with SMTP id t14mr26990998otc.92.1593081762142;
 Thu, 25 Jun 2020 03:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200625102145.7139-1-fredrigu@axis.com> <20200625102145.7139-19-fredrigu@axis.com>
In-Reply-To: <20200625102145.7139-19-fredrigu@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 11:42:31 +0100
Message-ID: <CAM9ZRVtNsAz6znQpQcBi4TmaDFFpbgFioG+jmcnQyAf7j2kdWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 18/26] package_manager: Rename RpmPM to PkgPM, etc.
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall <hugo.cedervall@axis.com>, 
	Fredrik Gustafsson <fredrigu@axis.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2020 at 11:22, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
> Rename all *PM classeds to PkgPM for consistency sake and cleanup some

Type: classes.

> naming that now can be improved.
>
> Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> ---
>  meta/lib/oe/package_manager.py                |  4 +--
>  .../package_managers/deb/package_manager.py   |  4 +--
>  meta/lib/oe/package_managers/deb/rootfs.py    | 27 ++++++++++---------
>  meta/lib/oe/package_managers/deb/sdk.py       |  5 ++--
>  .../package_managers/ipk/package_manager.py   |  4 +--
>  meta/lib/oe/package_managers/ipk/rootfs.py    | 21 ++++++++-------
>  meta/lib/oe/package_managers/ipk/sdk.py       |  5 ++--
>  .../package_managers/rpm/package_manager.py   |  4 +--
>  meta/lib/oe/package_managers/rpm/rootfs.py    |  8 +++---
>  meta/lib/oe/package_managers/rpm/sdk.py       |  5 ++--
>  10 files changed, 46 insertions(+), 41 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 36e87ded98..542f4ed3c4 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -325,8 +325,8 @@ class PkgsList(object, metaclass=ABCMeta):
>
>  class RpmPkgsList(PkgsList):
>      def list_pkgs(self):
> -        from oe.package_managers.rpm.package_manager import RpmPM
> -        return RpmPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR'), needfeed=False).list_installed()
> +        from oe.package_managers.rpm.package_manager import PkgPM
> +        return PkgPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR'), needfeed=False).list_installed()
>
>  class OpkgPkgsList(PkgsList):
>      def __init__(self, d, rootfs_dir, config_file):
> diff --git a/meta/lib/oe/package_managers/deb/package_manager.py b/meta/lib/oe/package_managers/deb/package_manager.py
> index d3e384a757..c38821587b 100644
> --- a/meta/lib/oe/package_managers/deb/package_manager.py
> +++ b/meta/lib/oe/package_managers/deb/package_manager.py
> @@ -71,9 +71,9 @@ class OpkgDpkgPM(PackageManager):
>      def _handle_intercept_failure(self, registered_pkgs):
>          self.mark_packages("unpacked", registered_pkgs.split())
>
> -class DpkgPM(OpkgDpkgPM):
> +class PkgPM(OpkgDpkgPM):
>      def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None, deb_repo_workdir="oe-rootfs-repo", filterbydependencies=True):
> -        super(DpkgPM, self).__init__(d, target_rootfs)
> +        super(PkgPM, self).__init__(d, target_rootfs)
>          self.deploy_dir = oe.path.join(self.d.getVar('WORKDIR'), deb_repo_workdir)
>
>          create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_DEB"), "package_write_deb", filterbydependencies)
> diff --git a/meta/lib/oe/package_managers/deb/rootfs.py b/meta/lib/oe/package_managers/deb/rootfs.py
> index 30872aa25e..72703efa32 100644
> --- a/meta/lib/oe/package_managers/deb/rootfs.py
> +++ b/meta/lib/oe/package_managers/deb/rootfs.py
> @@ -3,6 +3,8 @@
>  #
>
>  from oe.rootfs import *
> +from oe.package_managers.deb.manifest import *
> +from oe.package_managers.deb.package_manager import *
>
>  class DpkgOpkgRootfs(Rootfs):
>      def __init__(self, d, progress_reporter=None, logcatcher=None):
> @@ -125,10 +127,8 @@ class PkgRootfs(DpkgOpkgRootfs):
>
>          bb.utils.remove(self.image_rootfs, True)
>          bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
> -        import importlib
> -        self.manifest = importlib.import_module('oe.package_managers.deb.manifest').PkgManifest(d, manifest_dir)
> -        from oe.package_managers.deb.package_manager import DpkgPM
> -        self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
> +        self.manifest = PkgManifest(d, manifest_dir)
> +        self.pm = PkgPM(d, d.getVar('IMAGE_ROOTFS'),
>                           d.getVar('PACKAGE_ARCHS'),
>                           d.getVar('DPKG_ARCH'))
>
> @@ -212,22 +212,23 @@ class OpkgRootfs(DpkgOpkgRootfs):
>          self.log_check_regex = '(exit 1|Collected errors)'
>
>          import importlib
> -        self.manifest = importlib.import_module('oe.package_managers.ipk.manifest').PkgManifest(d, manifest_dir)
> +        self.manifest = importlib.import_module('oe.package_managers.deb.manifest').PkgManifest(d, manifest_dir)
>          self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
>          self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
>
>          self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN') or ""
>          if self._remove_old_rootfs():
>              bb.utils.remove(self.image_rootfs, True)
> -            self.pm = OpkgPM(d,
> -                             self.image_rootfs,
> -                             self.opkg_conf,
> -                             self.pkg_archs)
> +            self.pm = PkgPM(d,
> +                            self.image_rootfs,
> +                            self.opkg_conf,
> +                            self.pkg_archs)
>          else:
> -            self.pm = OpkgPM(d,
> -                             self.image_rootfs,
> -                             self.opkg_conf,
> -                             self.pkg_archs)
> +
> +            self.pm = PkgPM(d,
> +                            self.image_rootfs,
> +                            self.opkg_conf,
> +                            self.pkg_archs)
>              self.pm.recover_packaging_data()
>
>          bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
> diff --git a/meta/lib/oe/package_managers/deb/sdk.py b/meta/lib/oe/package_managers/deb/sdk.py
> index 950455988a..ed9ca68fd5 100644
> --- a/meta/lib/oe/package_managers/deb/sdk.py
> +++ b/meta/lib/oe/package_managers/deb/sdk.py
> @@ -4,6 +4,7 @@
>
>  from oe.sdk import *
>  from oe.package_managers.deb.manifest import *
> +from oe.package_managers.deb.package_manager import *
>
>  class PkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=None):
> @@ -21,13 +22,13 @@ class PkgSdk(Sdk):
>          if "sdk_ext" in d.getVar("BB_RUNTASK"):
>              deb_repo_workdir = "oe-sdk-ext-repo"
>
> -        self.target_pm = DpkgPM(d, self.sdk_target_sysroot,
> +        self.target_pm = PkgPM(d, self.sdk_target_sysroot,
>                                  self.d.getVar("PACKAGE_ARCHS"),
>                                  self.d.getVar("DPKG_ARCH"),
>                                  self.target_conf_dir,
>                                  deb_repo_workdir=deb_repo_workdir)
>
> -        self.host_pm = DpkgPM(d, self.sdk_host_sysroot,
> +        self.host_pm = PkgPM(d, self.sdk_host_sysroot,
>                                self.d.getVar("SDK_PACKAGE_ARCHS"),
>                                self.d.getVar("DEB_SDK_ARCH"),
>                                self.host_conf_dir,
> diff --git a/meta/lib/oe/package_managers/ipk/package_manager.py b/meta/lib/oe/package_managers/ipk/package_manager.py
> index 5d709dd6bc..ad20196016 100644
> --- a/meta/lib/oe/package_managers/ipk/package_manager.py
> +++ b/meta/lib/oe/package_managers/ipk/package_manager.py
> @@ -71,9 +71,9 @@ class OpkgDpkgPM(PackageManager):
>      def _handle_intercept_failure(self, registered_pkgs):
>          self.mark_packages("unpacked", registered_pkgs.split())
>
> -class OpkgPM(OpkgDpkgPM):
> +class PkgPM(OpkgDpkgPM):
>      def __init__(self, d, target_rootfs, config_file, archs, task_name='target', ipk_repo_workdir="oe-rootfs-repo", filterbydependencies=True, prepare_index=True):
> -        super(OpkgPM, self).__init__(d, target_rootfs)
> +        super(PkgPM, self).__init__(d, target_rootfs)
>
>          self.config_file = config_file
>          self.pkg_archs = archs
> diff --git a/meta/lib/oe/package_managers/ipk/rootfs.py b/meta/lib/oe/package_managers/ipk/rootfs.py
> index af7cf8484e..c493b9b387 100644
> --- a/meta/lib/oe/package_managers/ipk/rootfs.py
> +++ b/meta/lib/oe/package_managers/ipk/rootfs.py
> @@ -3,6 +3,8 @@
>  #
>
>  from oe.rootfs import *
> +from oe.package_managers.ipk.manifest import *
> +from oe.package_managers.ipk.package_manager import *
>
>  class DpkgOpkgRootfs(Rootfs):
>      def __init__(self, d, progress_reporter=None, logcatcher=None):
> @@ -119,8 +121,7 @@ class PkgRootfs(DpkgOpkgRootfs):
>          super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
>          self.log_check_regex = '(exit 1|Collected errors)'
>
> -        import importlib
> -        self.manifest = importlib.import_module('oe.package_managers.ipk.manifest').PkgManifest(d, manifest_dir)
> +        self.manifest = PkgManifest(d, manifest_dir)
>          self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
>          self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
>
> @@ -128,15 +129,15 @@ class PkgRootfs(DpkgOpkgRootfs):
>          from oe.package_managers.ipk.package_manager import OpkgPM
>          if self._remove_old_rootfs():
>              bb.utils.remove(self.image_rootfs, True)
> -            self.pm = OpkgPM(d,
> -                             self.image_rootfs,
> -                             self.opkg_conf,
> -                             self.pkg_archs)
> +            self.pm = PkgPM(d,
> +                            self.image_rootfs,
> +                            self.opkg_conf,
> +                            self.pkg_archs)
>          else:
> -            self.pm = OpkgPM(d,
> -                             self.image_rootfs,
> -                             self.opkg_conf,
> -                             self.pkg_archs)
> +            self.pm = PkgPM(d,
> +                            self.image_rootfs,
> +                            self.opkg_conf,
> +                            self.pkg_archs)
>              self.pm.recover_packaging_data()
>
>          bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
> diff --git a/meta/lib/oe/package_managers/ipk/sdk.py b/meta/lib/oe/package_managers/ipk/sdk.py
> index bd7bab6ebe..b237148d15 100644
> --- a/meta/lib/oe/package_managers/ipk/sdk.py
> +++ b/meta/lib/oe/package_managers/ipk/sdk.py
> @@ -4,6 +4,7 @@
>
>  from oe.sdk import *
>  from oe.package_managers.ipk.manifest import *
> +from oe.package_managers.ipk.package_manager import *
>
>  class PkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=None):
> @@ -21,11 +22,11 @@ class PkgSdk(Sdk):
>          if "sdk_ext" in d.getVar("BB_RUNTASK"):
>              ipk_repo_workdir = "oe-sdk-ext-repo"
>
> -        self.target_pm = OpkgPM(d, self.sdk_target_sysroot, self.target_conf,
> +        self.target_pm = PkgPM(d, self.sdk_target_sysroot, self.target_conf,
>                                  self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"),
>                                  ipk_repo_workdir=ipk_repo_workdir)
>
> -        self.host_pm = OpkgPM(d, self.sdk_host_sysroot, self.host_conf,
> +        self.host_pm = PkgPM(d, self.sdk_host_sysroot, self.host_conf,
>                                self.d.getVar("SDK_PACKAGE_ARCHS"),
>                                  ipk_repo_workdir=ipk_repo_workdir)
>
> diff --git a/meta/lib/oe/package_managers/rpm/package_manager.py b/meta/lib/oe/package_managers/rpm/package_manager.py
> index f34190f5bd..306c3336ca 100644
> --- a/meta/lib/oe/package_managers/rpm/package_manager.py
> +++ b/meta/lib/oe/package_managers/rpm/package_manager.py
> @@ -4,7 +4,7 @@
>
>  from oe.package_manager import *
>
> -class RpmPM(PackageManager):
> +class PkgPM(PackageManager):
>      def __init__(self,
>                   d,
>                   target_rootfs,
> @@ -15,7 +15,7 @@ class RpmPM(PackageManager):
>                   rpm_repo_workdir="oe-rootfs-repo",
>                   filterbydependencies=True,
>                   needfeed=True):
> -        super(RpmPM, self).__init__(d, target_rootfs)
> +        super(PkgPM, self).__init__(d, target_rootfs)
>          self.target_vendor = target_vendor
>          self.task_name = task_name
>          if arch_var == None:
> diff --git a/meta/lib/oe/package_managers/rpm/rootfs.py b/meta/lib/oe/package_managers/rpm/rootfs.py
> index 7b9e176bcb..26232e6ffb 100644
> --- a/meta/lib/oe/package_managers/rpm/rootfs.py
> +++ b/meta/lib/oe/package_managers/rpm/rootfs.py
> @@ -3,6 +3,8 @@
>  #
>
>  from oe.rootfs import *
> +from oe.package_managers.rpm.package_manager import *
> +from oe.package_managers.rpm.manifest import *
>
>  class PkgRootfs(Rootfs):
>      def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
> @@ -11,10 +13,8 @@ class PkgRootfs(Rootfs):
>                                 r'|exit 1|ERROR: |Error: |Error |ERROR '\
>                                 r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
>
> -        import importlib
> -        self.manifest = importlib.import_module('oe.package_managers.rpm.manifest').PkgManifest(d, manifest_dir)
> -
> -        self.pm = RpmPM(d,
> +        self.manifest = PkgManifest(d, manifest_dir)
> +        self.pm = PkgPM(d,
>                          d.getVar('IMAGE_ROOTFS'),
>                          self.d.getVar('TARGET_VENDOR')
>                          )
> diff --git a/meta/lib/oe/package_managers/rpm/sdk.py b/meta/lib/oe/package_managers/rpm/sdk.py
> index d2f7447657..abd3ce5569 100644
> --- a/meta/lib/oe/package_managers/rpm/sdk.py
> +++ b/meta/lib/oe/package_managers/rpm/sdk.py
> @@ -4,6 +4,7 @@
>
>  from oe.sdk import *
>  from oe.package_managers.rpm.manifest import *
> +from oe.package_managers.rpm.package_manager import *
>
>  class PkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
> @@ -18,14 +19,14 @@ class PkgSdk(Sdk):
>          if "sdk_ext" in d.getVar("BB_RUNTASK"):
>              rpm_repo_workdir = "oe-sdk-ext-repo"
>
> -        self.target_pm = RpmPM(d,
> +        self.target_pm = PkgPM(d,
>                                 self.sdk_target_sysroot,
>                                 self.d.getVar('TARGET_VENDOR'),
>                                 'target',
>                                 rpm_repo_workdir=rpm_repo_workdir
>                                 )
>
> -        self.host_pm = RpmPM(d,
> +        self.host_pm = PkgPM(d,
>                               self.sdk_host_sysroot,
>                               self.d.getVar('SDK_VENDOR'),
>                               'host',

I think this should be delayed to a later patch series. Let's get
everything moved first using the current naming.


--
Paul Barker
Konsulko Group
