Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UQIwM-0004N2-M0
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 16:57:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Apr 2013 07:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,455,1363158000"; d="scan'208";a="320891798"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2013 07:40:05 -0700
Message-ID: <5166CB45.6080701@linux.intel.com>
Date: Thu, 11 Apr 2013 07:40:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Li Wang <li.wang@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	Andrei Dinu <andrei.adrianx.dinu@intel.com>,
	Mark Hatle <mark.hatle@windriver.com>, 
	Bogdan Marinescu <bogdan.a.marinescu@intel.com>,
	Constantin Musca <constantinx.musca@intel.com>, 
	Joe Slater <jslater@windriver.com>,
	"Ashfield, Bruce" <Bruce.Ashfield@windriver.com>, 
	"msm-oss@mcclintock.net" <msm-oss@mcclintock.net>,
	Phil Blundell <philb@gnu.org>, Phil Staub <Phil.Staub@windriver.com>, 
	Jim.Somerville@windriver.com
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Missing Upstream-Status tag in patch files.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 14:57:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



> Li Wang - meta/recipes-gnome/librsvg/librsvg-2.32.1/librsvg-CVE-2011-3146.patch
> Khem Raj - meta/recipes-core/eglibc/eglibc-2.17/eglibc-2.17-r22178.patch
> Khem Raj - meta/recipes-core/eglibc/eglibc-2.17/eglibc-2.17-PR15003-r22243.patch
> Li Wang - meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
> Andrei Dinu - meta/recipes-connectivity/openssh/openssh-6.1p1/openssh-CVE-2011-4327.patch
> Jim Somerville -

Folks,

This is a reminder that patches need to have Upstream-Status and 
Signed-off-by tags in the patches themselves.

Please review this list below (I have most of the people on the To: line 
also) and fix these patches with the required tags.

We want these tags in order to get correct attribution of the patches 
along with how things are working with the Upstream Project itself, as 
we want to continue to reduce the number of patches we carry and help 
improve the upstream project stability.

Thanks for your help with this effort

Sau!


> Richard Purdie - meta/recipes-devtools/qemu/files/3f08ffb4a4741d147634761dc053ed386243a0de.patch
> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-bfd.patch
> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0017-ld-elf-comm-data.exp-Add-XFAIL-for-arm-targets-refer.patch
> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0013-gas-ChangeLog.patch
> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0003-Assemble-all-sources-files-in-each-test.patch
> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0010-bfd-ChangeLog.patch
> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0026-ld-testsuite.patch
> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0005-bfd.patch
> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0012-Fix-TLS-LD-to-LE-optimization-for-x32.patch
> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0018-bfd.patch
> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0014-Fix-opcode-for-64-bit-jecxz.patch
> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0024-bfd.patch
> Bruce Ashfield - meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch
> Mark Hatle - meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch
> Bogdan Marinescu - meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
> Constantin Musca - meta/recipes-devtools/apt/apt-0.9.7.7/no-nls-dpkg.patch
> Constantin Musca - meta/recipes-devtools/apt/apt-0.9.7.7/use-host.patch
> Constantin Musca - meta/recipes-devtools/apt/apt-0.9.7.7/fix-gcc-4.6-null-not-defined.patch
> Joe Slater - meta/recipes-support/curl/curl/configure_ac.patch
> Matthew McClintock - meta/recipes-kernel/oprofile/oprofile/0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch
> Bogdan Marinescu - meta/recipes-kernel/oprofile/oprofile/opstart.patch
> Dexuan Cui - meta/recipes-kernel/oprofile/oprofile/opstart.patch
> Richard Purdie - meta/recipes-kernel/oprofile/oprofile/opstart.patch
> Matthew McClintock - meta/recipes-kernel/oprofile/oprofile/0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch
> Matthew McClintock - meta/recipes-kernel/oprofile/oprofile/0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch
> Phil Staub - meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscalls.patch

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



