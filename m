Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UQjzD-0001Vh-3n
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 21:50:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 Apr 2013 12:32:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,464,1363158000"; d="scan'208";a="285467155"
Received: from unknown (HELO [10.255.14.4]) ([10.255.14.4])
	by azsmga001.ch.intel.com with ESMTP; 12 Apr 2013 12:32:36 -0700
Message-ID: <51686154.2080608@linux.intel.com>
Date: Fri, 12 Apr 2013 12:32:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <5166CB45.6080701@linux.intel.com>
	<1365786104.7011.112.camel@phil-desktop.brightsign>
In-Reply-To: <1365786104.7011.112.camel@phil-desktop.brightsign>
Cc: Jim.Somerville@windriver.com, Phil Staub <Phil.Staub@windriver.com>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>, "Ashfield,
	Bruce" <Bruce.Ashfield@windriver.com>, Phil Blundell <philb@gnu.org>,
	Joe Slater <jslater@windriver.com>,
	Constantin Musca <constantinx.musca@intel.com>
Subject: Re: Missing Upstream-Status tag in patch files.
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
X-List-Received-Date: Fri, 12 Apr 2013 19:50:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2013 10:01 AM, Phil Blundell wrote:
> On Thu, 2013-04-11 at 07:40 -0700, Saul Wold wrote:
>>
>>> Li Wang - meta/recipes-gnome/librsvg/librsvg-2.32.1/librsvg-CVE-2011-3146.patch
>>> Khem Raj - meta/recipes-core/eglibc/eglibc-2.17/eglibc-2.17-r22178.patch
>>> Khem Raj - meta/recipes-core/eglibc/eglibc-2.17/eglibc-2.17-PR15003-r22243.patch
>>> Li Wang - meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
>>> Andrei Dinu - meta/recipes-connectivity/openssh/openssh-6.1p1/openssh-CVE-2011-4327.patch
>>> Jim Somerville -
>>
>> Folks,
>>
>> This is a reminder that patches need to have Upstream-Status and
>> Signed-off-by tags in the patches themselves.
>>
>> Please review this list below (I have most of the people on the To: line
>> also) and fix these patches with the required tags.
>
> Saul
>
> You included me in the To: field but I can't see any patches listed
> below with my name against them.  Can you be more specific about which
> ones (if any) you want me to fix?
>
I think it was likely a mistake based on thunderbird's autofill when I 
was adding Phil Staub.

> Also, I seem to recall that the actual rule is that the patch just needs
> to contain details of who wrote it, not necessarily a Signed-off-by line
> necessarily.  Has that policy changed?
>
Who wrote it, but also who Signed-off-by on including the patch into the 
releass. That removes the extra step of digging into git logs in the 
case of people using the tarball and not having the git history.


Sau!

> thanks
>
> p.
>
>>
>> We want these tags in order to get correct attribution of the patches
>> along with how things are working with the Upstream Project itself, as
>> we want to continue to reduce the number of patches we carry and help
>> improve the upstream project stability.
>>
>> Thanks for your help with this effort
>>
>> Sau!
>>
>>
>>> Richard Purdie - meta/recipes-devtools/qemu/files/3f08ffb4a4741d147634761dc053ed386243a0de.patch
>>> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-bfd.patch
>>> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0017-ld-elf-comm-data.exp-Add-XFAIL-for-arm-targets-refer.patch
>>> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0013-gas-ChangeLog.patch
>>> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0003-Assemble-all-sources-files-in-each-test.patch
>>> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0010-bfd-ChangeLog.patch
>>> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0026-ld-testsuite.patch
>>> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0005-bfd.patch
>>> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0012-Fix-TLS-LD-to-LE-optimization-for-x32.patch
>>> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0018-bfd.patch
>>> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0014-Fix-opcode-for-64-bit-jecxz.patch
>>> Khem Raj - meta/recipes-devtools/binutils/binutils-2.23.1/backport/0024-bfd.patch
>>> Bruce Ashfield - meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch
>>> Mark Hatle - meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch
>>> Bogdan Marinescu - meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
>>> Constantin Musca - meta/recipes-devtools/apt/apt-0.9.7.7/no-nls-dpkg.patch
>>> Constantin Musca - meta/recipes-devtools/apt/apt-0.9.7.7/use-host.patch
>>> Constantin Musca - meta/recipes-devtools/apt/apt-0.9.7.7/fix-gcc-4.6-null-not-defined.patch
>>> Joe Slater - meta/recipes-support/curl/curl/configure_ac.patch
>>> Matthew McClintock - meta/recipes-kernel/oprofile/oprofile/0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch
>>> Bogdan Marinescu - meta/recipes-kernel/oprofile/oprofile/opstart.patch
>>> Dexuan Cui - meta/recipes-kernel/oprofile/oprofile/opstart.patch
>>> Richard Purdie - meta/recipes-kernel/oprofile/oprofile/opstart.patch
>>> Matthew McClintock - meta/recipes-kernel/oprofile/oprofile/0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch
>>> Matthew McClintock - meta/recipes-kernel/oprofile/oprofile/0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch
>>> Phil Staub - meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscalls.patch
>>
>
>


