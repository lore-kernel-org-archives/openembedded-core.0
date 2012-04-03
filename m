Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFBoZ-0004dF-E5
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 00:02:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2012 14:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="128368996"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2012 14:53:48 -0700
Message-ID: <4F7B716C.8060506@linux.intel.com>
Date: Tue, 03 Apr 2012 14:53:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332884004-5175-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1332884004-5175-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] procps: don't print error message with kernel 3.0+
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
X-List-Received-Date: Tue, 03 Apr 2012 22:02:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/27/2012 02:33 PM, Andreas Oberritter wrote:
> * All procps tools print a message like this when the kernel
>    version consists of only two numbers:
>
> | Non-standard uts for running kernel:
> | release ... gives version code ...
>
> * Import a patch from Debian to quieten this message.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   .../procps/procps-3.2.8/gnu-kbsd-version.patch     |   44 ++++++++++++++++++++
>   meta/recipes-extended/procps/procps_3.2.8.bb       |    3 +-
>   2 files changed, 46 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-extended/procps/procps-3.2.8/gnu-kbsd-version.patch
>

Merged into OE-Core

Thanks
	Sau!


