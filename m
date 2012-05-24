Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXe3A-0006jA-Cy
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 21:50:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2012 12:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="147462624"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by azsmga001.ch.intel.com with ESMTP; 24 May 2012 12:40:05 -0700
Message-ID: <4FBE8E94.7020908@linux.intel.com>
Date: Thu, 24 May 2012 12:40:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337298293.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1337298293.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/5 v2] Uprev RPM to 5.4.9
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
X-List-Received-Date: Thu, 24 May 2012 19:50:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Mark,

This needs a rebase after Robert's patch to rpm 5.4.0 for the arch issue.

Thanks
	Sau!


On 05/17/2012 04:46 PM, Mark Hatle wrote:
> Berkley DB also gets upreved, and a new package ossp-uuid gets added to
> the system.
>
> This was -heavily- tested with and without zypper on IA, and PPC.
>
> In addition a minor performance enhancement with a query operation was added.
>
> The uprev also adds the capability of using PACKAGECONFIG settings to tailor
> the behavior of RPM.
>
> V2 changes:
>
> Fix a problem with libuuid.so from util-linux would sometimes be linked into
> the binary.
>
> Also force libzypp, sat-solver and zypper to refresh via a PR bump.
>
> The following changes since commit 7163ebd92a799b8f000b2b6f303b20de468b5f90:
>
>    Revert "kmod: Use base_libdir for installing libkmod" (2012-05-17 21:12:33 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/rpm
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm
>
> Mark Hatle (5):
>    rpm: Upgrade RPM to 5.4.8  (db to 5.3.15)
>    rpm: Upgrade RPM to 5.4.9
>    ossp-uuid: Add oss-uuid package and RPM 5.4.9 integration
>    package_rpm: Add capability to directly query packageorigin
>    rpm: Bump PR numbers on componnets that require RPM
>
>   meta/classes/package_rpm.bbclass                   |   18 +-
>   meta/classes/rootfs_rpm.bbclass                    |   22 +-
>   .../ossp-uuid/0001-Change-library-name.patch       |  112 +++++
>   ...erve-m-option-status-in-v-option-handling.patch |   55 +++
>   .../ossp-uuid/0003-Fix-whatis-entries.patch        |   51 +++
>   .../ossp-uuid/0004-fix-data-uuid-from-string.patch |   36 ++
>   .../ossp-uuid/ossp-uuid/uuid-libtool.patch         |   24 +
>   .../ossp-uuid/ossp-uuid/uuid-nostrip.patch         |   16 +
>   meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |   58 +++
>   .../rpm/rpm/fix_for_automake_1.11.2.patch          |   54 ---
>   .../rpm/rpm/fprint-pointer-fix.patch               |   35 --
>   .../rpm/rpm/remove-compiled-tests.patch            |  443 --------------------
>   meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch   |   22 -
>   meta/recipes-devtools/rpm/rpm/rpm-autogen.patch    |   41 +--
>   meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch  |   16 +-
>   .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch |   12 +-
>   meta/recipes-devtools/rpm/rpm/rpm-lua.patch        |   29 ++
>   .../rpm/rpm/rpm-no-perl-urpm.patch                 |   43 ++
>   meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch    |   36 --
>   meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch  |   20 +
>   .../rpm/rpm/rpm-packageorigin.patch                |   23 +
>   .../rpm/rpm/rpm-scriptletexechelper.patch          |   33 +-
>   meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch |   26 +-
>   .../rpm/{rpm_5.4.0.bb =>  rpm_5.4.9.bb}             |  159 ++++----
>   .../libzypp/libzypp/libzypp-rpm549.patch           |   28 ++
>   meta/recipes-extended/libzypp/libzypp_git.bb       |    3 +-
>   meta/recipes-extended/sat-solver/sat-solver_git.bb |    2 +-
>   meta/recipes-extended/zypper/zypper_git.bb         |    2 +-
>   .../db/{db_5.1.19.bb =>  db_5.3.15.bb}              |    8 +-
>   29 files changed, 653 insertions(+), 774 deletions(-)
>   create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Change-library-name.patch
>   create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid-preserve-m-option-status-in-v-option-handling.patch
>   create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-whatis-entries.patch
>   create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-data-uuid-from-string.patch
>   create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libtool.patch
>   create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nostrip.patch
>   create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
>   delete mode 100644 meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch
>   delete mode 100644 meta/recipes-devtools/rpm/rpm/fprint-pointer-fix.patch
>   delete mode 100644 meta/recipes-devtools/rpm/rpm/remove-compiled-tests.patch
>   delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua.patch
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patch
>   delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
>   rename meta/recipes-devtools/rpm/{rpm_5.4.0.bb =>  rpm_5.4.9.bb} (76%)
>   create mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch
>   rename meta/recipes-support/db/{db_5.1.19.bb =>  db_5.3.15.bb} (93%)
>


