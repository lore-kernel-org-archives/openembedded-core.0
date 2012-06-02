Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Sas0C-0005bO-JO
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 19:20:37 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 02 Jun 2012 10:10:12 -0700
Received: by lahj13 with SMTP id j13so1918506lah.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2012 10:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=xKJ9bS0MW1u2mO7Df5l9UgzmtdQvXw0FAK99sUDfzxQ=;
	b=NK7077qXc/VrDgqXHN0NV+ZgU45G/u4+83Zz8S8DigEFimBAN+bgxkzICzdB6VaLrC
	XCVCJYR2uwnAWQmwLtCe3UwmGPvfqJNsQDzgS0+FBJ4baiJYo0cul7VcjlWWvQmgRDAN
	vzuCnytbUVADxqs4uuKLSDnQP3FU8nEtt3mxKuR1MNjmHASqtfBO5rg4SCs31+NJz7MD
	CNW9Xs62HY3xdsJP75qxlLx3YfCUotVwjAvXdnRuagwuGHzj4iGZLVo6os7XVKOpTX8o
	qWZ8VIo/td4PLxF78pSf69ZG0ulgT/woQuRbBD43fvYX0pr3a7//L2Qj6KOMJYQ3leyZ
	FT6w==
MIME-Version: 1.0
Received: by 10.112.36.163 with SMTP id r3mr3648865lbj.87.1338657010236; Sat,
	02 Jun 2012 10:10:10 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Sat, 2 Jun 2012 10:10:10 -0700 (PDT)
In-Reply-To: <cover.1338500281.git.mark.hatle@windriver.com>
References: <cover.1338500281.git.mark.hatle@windriver.com>
Date: Sat, 2 Jun 2012 10:10:10 -0700
Message-ID: <CAPhnLPD8AUtpP9bT=dUVR1zP9xBNhj3i+u+uaLG3rPHbpo-A2g@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl3OJktVRjg/k3JTg+MI+g4DxxaRUIg0hysbu/Rardciku29UCBQpExwmCSvwiPAP/vw+xi
Subject: Re: [PATCH 0/5 v3] Uprev RPM to 5.4.9
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
X-List-Received-Date: Sat, 02 Jun 2012 17:20:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2012 at 2:42 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
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

Something in this patch set seems to be killing the master_under_test
build of meta-toolchain-gmae.

See: http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/5=
17/steps/shell_68/logs/stdio

-b

>
>
> The following changes since commit e3113827810e98eb1b012f0b280fb917199704=
c1:
>
> =A0webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-0=
5-30 17:37:58 +0100)
>
> are available in the git repository at:
> =A0git://git.pokylinux.org/poky-contrib mhatle/rpm
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dmhatle/rpm
>
> Mark Hatle (5):
> =A0rpm: Upgrade RPM to 5.4.8 =A0(db to 5.3.15)
> =A0rpm: Upgrade RPM to 5.4.9
> =A0ossp-uuid: Add oss-uuid package and RPM 5.4.9 integration
> =A0package_rpm: Add capability to directly query packageorigin
> =A0rpm: Bump PR numbers on componets that require RPM
>
> =A0meta/classes/package_rpm.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 18 +-
> =A0meta/classes/rootfs_rpm.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 22 +-
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
> =A0.../rpm/rpm/rpm-no-perl-urpm.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 43 ++
> =A0meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch =A0 =A0| =A0 36 --
> =A0meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch =A0| =A0 20 +
> =A0.../rpm/rpm/rpm-packageorigin.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 23 +
> =A0.../rpm/rpm/rpm-scriptletexechelper.patch =A0 =A0 =A0 =A0 =A0| =A0 33 =
+-
> =A0meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch | =A0 26 +-
> =A0.../rpm/{rpm_5.4.0.bb =3D> rpm_5.4.9.bb} =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
158 ++++----
> =A0.../libzypp/libzypp/libzypp-rpm549.patch =A0 =A0 =A0 =A0 =A0 | =A0 28 =
++
> =A0meta/recipes-extended/libzypp/libzypp_git.bb =A0 =A0 =A0 | =A0 =A03 +-
> =A0meta/recipes-extended/sat-solver/sat-solver_git.bb | =A0 =A02 +-
> =A0meta/recipes-extended/zypper/zypper_git.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0.../db/{db_5.1.19.bb =3D> db_5.3.15.bb} =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A08 +-
> =A029 files changed, 652 insertions(+), 774 deletions(-)
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
> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patc=
h
> =A0delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch
> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch
> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-packageorigin.pat=
ch
> =A0rename meta/recipes-devtools/rpm/{rpm_5.4.0.bb =3D> rpm_5.4.9.bb} (76%=
)
> =A0create mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-rpm54=
9.patch
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


