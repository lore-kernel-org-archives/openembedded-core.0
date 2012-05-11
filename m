Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SStuD-0003LF-3a
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:45:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 May 2012 10:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99048224"
Received: from unknown (HELO [10.255.12.250]) ([10.255.12.250])
	by AZSMGA002.ch.intel.com with ESMTP; 11 May 2012 10:35:32 -0700
Message-ID: <4FAD4DE4.3050703@linux.intel.com>
Date: Fri, 11 May 2012 10:35:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336594657.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1336594657.git.peter.seebach@windriver.com>
Subject: Re: [PATCH 0/1] sanity.bbclass: Avoid empty $PATH components
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
X-List-Received-Date: Fri, 11 May 2012 17:45:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2012 01:19 PM, Peter Seebach wrote:
> Empty components (including $PATHs starting or ending with a colon)
> have the same harmful effects as a "." in $PATH.
>
> The following changes since commit 8de7f8045f28aecfe796afcdb013c557ce9d1372:
>    Martin Jansa (1):
>          kmod: fix upgrade path from module-init-tools
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib seebs/cleanup
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/cleanup
>
> Peter Seebach (1):
>    sanity.bbclass: Detect empty $PATH components too
>
>   meta/classes/sanity.bbclass |    5 +++--
>   1 files changed, 3 insertions(+), 2 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

Merged into OE-Core

Thanks
	Sau!


