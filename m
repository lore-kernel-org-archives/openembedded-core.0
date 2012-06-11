Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se9eF-0002HH-9H
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:47:31 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 11:36:56 -0700
Received: by lbbgh12 with SMTP id gh12so2602263lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 11:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=ZYm9tX5iubnA4ZuRFRao6EMmn5QT7zNDr1uLosx87vQ=;
	b=MdBYfR8f5R+JCHkBT8OmjRPZNUdybqLx0XLceyL50d0n177kaHK0jbmazbQmyCLYGo
	HbmAkQpwW2WbKy1arpmBS+ckjGgA0oOAlteykOp/VardVGK8+vWv3MtZhDYQiWpG+SMN
	0Zz839OaUkYBqRvmqWqJlnAe9v7cNSOQdqcMp9176gVtV3mODHWoMViKE2Jo+OOKnPtY
	UEoJrrRYG+ROOpBHpHBILMHw5MM/F3c6bFIz2kAXeI+IwK4vTSBPX+S1Lu1rPAzzYT28
	uTBeN0uqq8OFXSbhgU8Jix4rFPttt+MsEDZIAlKirV4N0A7IuISpmJ/U8Eq8gbyTbeb3
	MNTQ==
MIME-Version: 1.0
Received: by 10.152.123.244 with SMTP id md20mr18360768lab.0.1339439814292;
	Mon, 11 Jun 2012 11:36:54 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 11:36:54 -0700 (PDT)
In-Reply-To: <cover.1339438568.git.mark.hatle@windriver.com>
References: <cover.1339438568.git.mark.hatle@windriver.com>
Date: Mon, 11 Jun 2012 11:36:54 -0700
Message-ID: <CAPhnLPC3-NZ2qy3t-Fo4WSRyHnNXXs_esNgdD5KqF2zQwp5ciw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmedV12ekk3OxL1f0PHicOEXoAm452rFyUP3uLNDnyz6zhwkNBrzAy5coPHc06ZkPpwrusQ
Subject: Re: [PATCH 0/9 v7] Uprev RPM to 5.4.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jun 2012 18:47:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 11, 2012 at 11:18 AM, Mark Hatle <mark.hatle@windriver.com> wro=
te:
> Fix a regression in rpm dependency generated caused by default settings
> changing. =A0This has been fixed (and verified on the yocto project build
> servers.) =A0This should be the final version....

Ack'd

I've verified that the initial issues around these patches have been fixed.

-b

>
> This has been rebased, and patches 1 and 2 were changed to deal with the
> fix for the macros files.
>
> v6 message follows:
>
> Patch 6/8 was reworked to remove the manifest size check.
> Patch 8/8 is new and includes the manifest check removed from 6/8 as well=
 as
> one that was missed in previous testing.
>
> v5 message follows:
>
> Only 7/7 is new in the version. =A0Due to the removal of the RPMVSF_NOSIG=
NATURES
> flag in RPM5 5.4.9, createrepo also needed to have this flag removed.
>
> v4 message follows:
>
> Only 6/6 is new in this version. =A0RPM 5.4.9 appears to be more demandin=
g
> for both the DB_CONFIG file and empty manifest files. =A0The new patch re=
solves
> this issue by ensuring that the DB_CONFIG is always generated, and empty
> manifest files do not get installed.
>
> Patches 1-5 are identical to the v3 versions.
>
> v3 messages follows:
>
> Rebase of the v2 changes.
>
> Re-disabled the "test" chunk.. =A0this should resolve the hang problem a
> few people have observed.
>
> v2 message follows:
>
> Berkley DB also gets upreved, and a new package ossp-uuid gets added to
> the system.
>
> This was -heavily- tested with and without zypper on IA, and PPC.
>
> In addition a minor performance enhancement with a query operation was ad=
ded.
>
> The uprev also adds the capability of using PACKAGECONFIG settings to tai=
lor
> the behavior of RPM.
>
> V2 changes:
>
> Fix a problem with libuuid.so from util-linux would sometimes be linked i=
nto
> the binary.
>
> Also force libzypp, sat-solver and zypper to refresh via a PR bump.
>
> The following changes since commit ba22e4fcf07eb8007f6d500908d503f1d3dbdd=
16:
>
> =A0nasm: updated to 2.10.01 (2012-06-11 13:55:46 +0100)
>
> are available in the git repository at:
> =A0git://git.pokylinux.org/poky-contrib mhatle/rpm
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dmhatle/rpm
>
> Mark Hatle (9):
> =A0rpm: Upgrade RPM to 5.4.8 =A0(db to 5.3.15)
> =A0rpm: Upgrade RPM to 5.4.9
> =A0ossp-uuid: Add oss-uuid package and RPM 5.4.9 integration
> =A0package_rpm: Add capability to directly query packageorigin
> =A0rpm: Bump PR numbers on componets that require RPM
> =A0rootfs_rpm.bbclass: Update database configuration file
> =A0createrepo: For compatibility w/ RPM 5.4.9 remove RPMVSF_NOSIGNATURES
> =A0 =A0flag
> =A0package_rpm: Verify that the package manifests are not empty
> =A0rpm: Ensure pkgconfig deps don't stray from the package being built
>
> =A0meta/classes/package_rpm.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0105 ++++--
> =A0meta/classes/rootfs_rpm.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 29 --
> =A0.../ossp-uuid/0001-Change-library-name.patch =A0 =A0 =A0 | =A0112 ++++=
+
> =A0...erve-m-option-status-in-v-option-handling.patch | =A0 55 +++
> =A0.../ossp-uuid/0003-Fix-whatis-entries.patch =A0 =A0 =A0 =A0| =A0 51 ++=
+
> =A0.../ossp-uuid/0004-fix-data-uuid-from-string.patch | =A0 36 ++
> =A0.../ossp-uuid/ossp-uuid/uuid-libtool.patch =A0 =A0 =A0 =A0 | =A0 24 +
> =A0.../ossp-uuid/ossp-uuid/uuid-nostrip.patch =A0 =A0 =A0 =A0 | =A0 16 +
> =A0meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb | =A0 58 +++
> =A0.../rpm/rpm/fix_for_automake_1.11.2.patch =A0 =A0 =A0 =A0 =A0| =A0 54 =
---
> =A0.../rpm/rpm/fprint-pointer-fix.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 35 --
> =A0.../rpm/rpm/remove-compiled-tests.patch =A0 =A0 =A0 =A0 =A0 =A0| =A044=
3 --------------------
> =A0meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch =A0 | =A0 22 -
> =A0meta/recipes-devtools/rpm/rpm/rpm-autogen.patch =A0 =A0| =A0 41 +--
> =A0meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch =A0| =A0 16 +-
> =A0.../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch | =A0 12 +-
> =A0meta/recipes-devtools/rpm/rpm/rpm-lua.patch =A0 =A0 =A0 =A0| =A0 29 ++
> =A0meta/recipes-devtools/rpm/rpm/rpm-macros.patch =A0 =A0 | =A0 61 +++
> =A0.../rpm/rpm/rpm-no-perl-urpm.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 43 ++
> =A0meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch =A0 =A0| =A0 36 --
> =A0meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch =A0| =A0 20 +
> =A0.../rpm/rpm/rpm-packageorigin.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 23 +
> =A0.../rpm/rpm/rpm-pkgconfigdeps.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 34 ++
> =A0.../rpm/rpm/rpm-scriptletexechelper.patch =A0 =A0 =A0 =A0 =A0| =A0 33 =
+-
> =A0meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch | =A0 26 +-
> =A0.../rpm/{rpm_5.4.0.bb =3D> rpm_5.4.9.bb} =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
160 ++++----
> =A0.../libzypp/libzypp/libzypp-rpm549.patch =A0 =A0 =A0 =A0 =A0 | =A0 28 =
++
> =A0meta/recipes-extended/libzypp/libzypp_git.bb =A0 =A0 =A0 | =A0 =A03 +-
> =A0meta/recipes-extended/sat-solver/sat-solver_git.bb | =A0 =A02 +-
> =A0meta/recipes-extended/zypper/zypper_git.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0.../createrepo/createrepo/createrepo-rpm549.patch =A0| =A0 19 +
> =A0.../createrepo/createrepo_0.4.11.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A03 +-
> =A0.../db/{db_5.1.19.bb =3D> db_5.3.15.bb} =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A08 +-
> =A033 files changed, 822 insertions(+), 817 deletions(-)
> =A0create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Chan=
ge-library-name.patch
> =A0create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid=
-preserve-m-option-status-in-v-option-handling.patch
> =A0create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-=
whatis-entries.patch
> =A0create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-=
data-uuid-from-string.patch
> =A0create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libt=
ool.patch
> =A0create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nost=
rip.patch
> =A0create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
> =A0delete mode 100644 meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11=
.2.patch
> =A0delete mode 100644 meta/recipes-devtools/rpm/rpm/fprint-pointer-fix.pa=
tch
> =A0delete mode 100644 meta/recipes-devtools/rpm/rpm/remove-compiled-tests=
.patch
> =A0delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch
> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua.patch
> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-macros.patch
> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patc=
h
> =A0delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch
> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch
> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-packageorigin.pat=
ch
> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.pat=
ch
> =A0rename meta/recipes-devtools/rpm/{rpm_5.4.0.bb =3D> rpm_5.4.9.bb} (76%=
)
> =A0create mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-rpm54=
9.patch
> =A0create mode 100644 meta/recipes-support/createrepo/createrepo/createre=
po-rpm549.patch
> =A0rename meta/recipes-support/db/{db_5.1.19.bb =3D> db_5.3.15.bb} (93%)
>
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


