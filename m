Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sup6F-0004gT-OA
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 20:17:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2012 11:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="172302360"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2012 11:05:24 -0700
Message-ID: <5012D864.1090208@linux.intel.com>
Date: Fri, 27 Jul 2012 11:05:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343387245.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1343387245.git.laurentiu.palcu@intel.com>
Subject: Re: [PATCH 0/6] relocatable SDK
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
X-List-Received-Date: Fri, 27 Jul 2012 18:17:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2012 04:21 AM, Laurentiu Palcu wrote:
> Hi,
>
> This patchset adds relocatable SDK functionality. Instead of a tarball, the
> output of "bitbake meta-toolchain/meta-toolchain-sdk" will be a self extracting
> archive.
>
> The user will then execute the .sh script and give it the target
> directory for SDK installation (default is /opt/poky). The installer will then
> extract the embedded tarball to the user provided location and will set up the
> SDK: change the paths in the environment script, change the dynamic loader path
> in all binaries and, also, change the ls.so.cache path in the dynamic loader
> itself, together with the SYSDIR paths/lengths.
>
> With that, no more root privileges are needed in order to install the SDK.
>
> Thanks,
> Laurentiu
>
> The following changes since commit 651b223c5fc93c7504e304e954b9ae4640ed47c6:
>
>    usbutils: avoid dependency on bash (2012-07-26 18:52:00 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib lpalcu/relocatable_sdk
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/relocatable_sdk
>
> Laurentiu Palcu (6):
>    eglibc: relocatable SDK changes
>    binutils: relocatable SDK: change PT_INTERP section size
>    scripts: add script for relocating the SDK
>    populate_sdk_base.bbclass: create self-extracting archive
>    relocatable.bbclass: split it up, to reuse code
>    package.bbclass: change RPATHs for nativesdk packages
>
>   meta/classes/chrpath.bbclass                       |   89 +++++++++
>   meta/classes/package.bbclass                       |    5 +
>   meta/classes/populate_sdk_base.bbclass             |   82 ++++++++
>   meta/classes/relocatable.bbclass                   |   91 +--------
>   .../eglibc/eglibc-2.15/relocatable_sdk.patch       |   70 +++++++
>   meta/recipes-core/eglibc/eglibc_2.15.bb            |    6 +-
>   .../binutils/binutils-crosssdk_2.22.bb             |    5 +
>   .../binutils/binutils/relocatable_sdk.patch        |   13 ++
>   scripts/relocate_sdk.py                            |  200 ++++++++++++++++++++
>   9 files changed, 470 insertions(+), 91 deletions(-)
>   create mode 100644 meta/classes/chrpath.bbclass
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/relocatable_sdk.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
>   create mode 100755 scripts/relocate_sdk.py
>
Your patches need to have Upstream-Status and Signed-off-by: added along 
with a header explaining why the patch is needed.

Just a quick first pass review, there may be more comments as I review 
deeper.

Sau!



