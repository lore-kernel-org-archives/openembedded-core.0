Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFCTq-0005BX-KX
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 00:45:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2012 15:36:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="128379276"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2012 15:36:27 -0700
Message-ID: <4F7B7B6B.8090202@linux.intel.com>
Date: Tue, 03 Apr 2012 15:36:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332839233.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1332839233.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] nspr 4.8.9: failed to build on x86_64 board
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
X-List-Received-Date: Tue, 03 Apr 2012 22:45:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/27/2012 02:37 AM, Robert Yang wrote:
> * The test info, tested on:
>    ->  The hosts are:
>       Fedora 16 64bit, Ubuntu 10.10 32bit
>    ->  The MACHINEs are:
>       qemux86, qemux86-64 and qemuarm
>
> // Robert
>
> The following changes since commit d3e0beed9eef53018158c9f999cd20b44629aa61:
>
>    guile: Deal with hardcoded path issues (2012-03-27 00:29:00 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/nspr
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/nspr
>
> Robert Yang (1):
>    nspr 4.8.9: failed to build on x86_64 board
>
>   .../nspr/files/fix-build-on-x86_64.patch           |   51 ++++++++++++++++
>   .../nspr/files/trickly-fix-build-on-x86_64.patch   |   62 ++++++++++++++++++++
>   meta/recipes-support/nspr/nspr_4.8.9.bb            |    4 +-
>   3 files changed, 116 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-support/nspr/files/fix-build-on-x86_64.patch
>   create mode 100644 meta/recipes-support/nspr/files/trickly-fix-build-on-x86_64.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


