Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1Vak-0000y8-KW
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 05:47:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2011 20:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,348,1312182000"; d="scan'208";a="46631414"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by azsmga001.ch.intel.com with ESMTP; 07 Sep 2011 20:42:49 -0700
Message-ID: <4E6839B9.8040009@linux.intel.com>
Date: Wed, 07 Sep 2011 20:42:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1315025121.31478.140.camel@elmorro>
In-Reply-To: <1315025121.31478.140.camel@elmorro>
Subject: Re: [PATCH 0/2] systemtap: upgrade to 1.6
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
X-List-Received-Date: Thu, 08 Sep 2011 03:47:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2011 09:45 PM, Tom Zanussi wrote:
> This patchset upgrades systemtap to 1.6.  The 1.6 version of
> systemtap also has improved support for arm, so this also
> enables it for arm and adds it to qemuarm.
>
> This upgrade was successfully tested on qemux86, qemux86-64,
> qemuppc, qemuarm, and sugarbay.  The results and the tests
> can be found at the end of the systemtap section on the yocto
> wiki:
>
> https://wiki.yoctoproject.org/wiki/Tracing_and_Profiling#systemtap
>
> Tom Zanussi (2):
>    systemtap: upgrade to 1.6
>    task-core-tools: add systemtap to qemuarm
>
>   meta/recipes-core/tasks/task-core-tools.bb         |    4 +-
>   .../fix_for_compilation_with_gcc-4.6.0.patch       |  119
> --------------------
>   meta/recipes-kernel/systemtap/systemtap_git.bb     |   15 +--
>   3 files changed, 9 insertions(+), 129 deletions(-)
>   delete mode 100644
> meta/recipes-kernel/systemtap/systemtap/fix_for_compilation_with_gcc-4.6.0.patch
>
>
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


