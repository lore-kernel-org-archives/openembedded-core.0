Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0zq9-0007d1-EP
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 19:25:57 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Feb 2012 10:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110466006"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by azsmga001.ch.intel.com with ESMTP; 24 Feb 2012 10:17:32 -0800
Message-ID: <4F47D43C.3030204@linux.intel.com>
Date: Fri, 24 Feb 2012 10:17:32 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1329175337.git.andrei@gherzan.ro>
In-Reply-To: <cover.1329175337.git.andrei@gherzan.ro>
Subject: Re: [PATCH v2 0/2] NSPR with tests and patch for RPATH
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
X-List-Received-Date: Fri, 24 Feb 2012 18:25:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2012 03:24 PM, Andrei Gherzan wrote:
> 1. Create a separate commit for removing RPATH from binaries
> 2. Add QA warning in patch
> 3. Minor tweaks in bbfile
> 4. Install tests in ${libdir}/nspr/tests
>
> The following changes since commit 7d0fc3b5ffc2806d921567dbdad3de056069896a:
>
>    nspr: Integrate version 4.8.9 (2012-02-13 22:49:19 +0200)
>
> are available in the git repository at:
>    git@git.gherzan.ro:agherzan/yocto-dev devel
>
> Andrei Gherzan (2):
>    nspr: Compile nspr with tests
>    nspr: Add patch in order to remove rpath from binaries
>
>   .../nspr/files/remove-rpath-from-tests.patch       |   26 ++++
>   meta/recipes-support/nspr/nspr_4.8.9.bb            |  136 +++++++++++++++++++-
>   2 files changed, 158 insertions(+), 4 deletions(-)
>   create mode 100644 meta/recipes-support/nspr/files/remove-rpath-from-tests.patch
>
Merged into OE-core

Thanks
	Sau!


