Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlEKy-0002Cb-2F
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 07:40:37 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jan 2012 22:33:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106270317"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2012 22:32:59 -0800
Message-ID: <4F0E7E9B.8040805@linux.intel.com>
Date: Wed, 11 Jan 2012 22:32:59 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326176214.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1326176214.git.lianhao.lu@intel.com>
Subject: Re: [PRService/meta V3 0/3] new PRService features in meta
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
X-List-Received-Date: Thu, 12 Jan 2012 06:40:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2012 10:22 PM, Lianhao Lu wrote:
> V3: Using event handler instead of new tasks to interfacing to bitbake.
> V2: Using bb.fatal instead of bb.FuncFailed.
>
> NOTE: This set of patches added supporting for new features in meta layer.
> It should work together with another branch of patches in bitbake.
>      git://git.pokylinux.org/poky-contrib llu/PRService_bitbake
>
> It supports the export/import AUTOPR values from/to PRservice to lockdown
> the PR values for release. The typical usage scenario is:
>
> 1. UserA enabled the PRService and run buildings. The PRService will
> record the AUTOPR values(which will be included in the finale PKGR) for
> different packages the userA builds.
>
> 2. UserA runs "bitbake-prserv-tool export<file>" to export the AUTOPR
> values from the current PRService into an exported inc file.
>
> 3. UserB gets the exported inc file and runs the command
> "bitbake -R<exported file>  target" to lockdown and reproduce the same AUTOPR
> when generating packages.
>
> 4. UserB may run "bitbake-prserv-tool import<file>" to import the exported
> AUTOPR values back into his own PRService. The AUTOPR values will be
> incremented from there.
>
> This set of changes also supports the per-recipe based PRSERV_HOST and
> PRSERV_PORT.
>
> This set of changes makes the basichash instead of the basic as the default
> signature generator.
>
> The following changes since commit fff18970706913e7fd7f4a119d798dddb44b388a:
>    Gary Thomas (1):
>          base-files: filesystems: fix mount order
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/PRService_oecore
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/PRService_oecore
>
> Lianhao Lu (3):
>    meta/PRService: Added export/import fuctions.
>    package.bbclass: per recipe PRSERV_HOST support
Merged these first 2 as infrastructure

>    conf/bitbake.conf: basichash as default signature.
>
Held off on this, please enable it in poky.conf first for more testing 
in poky first.

Thanks
	Sau!

>   meta/classes/package.bbclass  |   21 +++++++-
>   meta/classes/prexport.bbclass |   45 ++++++++++++++++
>   meta/classes/primport.bbclass |   17 ++++++
>   meta/classes/prserv.bbclass   |   36 +++++--------
>   meta/conf/bitbake.conf        |    6 +-
>   meta/conf/prexport.conf       |    1 +
>   meta/conf/primport.conf       |    1 +
>   meta/lib/oe/prservice.py      |  113 +++++++++++++++++++++++++++++++++++++++++
>   scripts/bitbake-prserv-tool   |   57 +++++++++++++++++++++
>   9 files changed, 269 insertions(+), 28 deletions(-)
>   create mode 100644 meta/classes/prexport.bbclass
>   create mode 100644 meta/classes/primport.bbclass
>   create mode 100644 meta/conf/prexport.conf
>   create mode 100644 meta/conf/primport.conf
>   create mode 100644 meta/lib/oe/prservice.py
>   create mode 100755 scripts/bitbake-prserv-tool
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


