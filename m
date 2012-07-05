Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SmqT6-0005ny-5j
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 20:07:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jul 2012 10:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188845695"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2012 10:56:42 -0700
Message-ID: <4FF5D55A.3070000@linux.intel.com>
Date: Thu, 05 Jul 2012 10:56:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341338051.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1341338051.git.tom.zanussi@intel.com>
Subject: Re: [PATCH 0/9] perf: enable Perl and Python bindings, and perf TUI
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
X-List-Received-Date: Thu, 05 Jul 2012 18:07:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 11:10 AM, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>
> This patchset enables the Perl and Python bindings for perf, as well as
> the perf TUI (text-based UI).
>
> These can be separately enabled on a machine basis by adding
> 'perf-scripting' and/or 'perf-tui' to the machine's MACHINE_FEATURES.
> The default is to completely disable all scripting and TUI features.
>
> There are also a couple patches that fix other problems noticed along
> the way.
>
> These changes need corresponding changes made to linux-yocto and posted
> separately on the yocto and linux-yocto mailing lists.
>
> This patchset has been build- and run-tested on the following machines:
>
> qemux86
> qemux86-64
> qemuarm
> sugarbay
> crownbay
>
> The following changes since commit 644ad4bf1e30fcee4b9d5abb819046d1f2193d27:
>    Scott Rifenbark (1):
>          documentation/bsp-guide/bsp.xml: Yocto term paring
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib.git tzanussi/perf-scripting
>    http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/perf-scripting
>
> Tom Zanussi (9):
>    perl: keep original libperl location
>    perl: add @STAGINGDIR@ for config.sh substitions
>    perl: use @STAGINGDIR@ in config.sh
>    perf: enable Python bindings
>    perf: enable Perl binding
>    perf: add libexec/perf-core and contents
The above where all merged into OE-Core
>    perf: add perf-scripting MACHINE_FEATURE
Not Merged
>    qemumachines: make MACHINE_FEATURES append follow qemu.inc include
Merged into OE-Core
>    perf: add perf-tui MACHINE_FEATURE
>
Not Merged

Thanks
	Sau!


>   meta/conf/machine/qemux86-64.conf                |    4 +-
>   meta/conf/machine/qemux86.conf                   |    4 +-
>   meta/recipes-devtools/perl/perl-5.14.2/config.sh |    2 +-
>   meta/recipes-devtools/perl/perl_5.14.2.bb        |    4 ++-
>   meta/recipes-kernel/perf/perf_3.4.bb             |   36 ++++++++++++++++++++--
>   5 files changed, 41 insertions(+), 9 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



