Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U8QbG-0001Hp-Qb
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 08:29:51 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Feb 2013 23:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,706,1355126400"; d="scan'208";a="259673683"
Received: from unknown (HELO [10.255.12.136]) ([10.255.12.136])
	by azsmga001.ch.intel.com with ESMTP; 20 Feb 2013 23:13:37 -0800
Message-ID: <5125C921.2030407@linux.intel.com>
Date: Wed, 20 Feb 2013 23:13:37 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: farrah rashid <farrah.rashid@windriver.com>
References: <1361394588-30527-1-git-send-email-farrah.rashid@windriver.com>
In-Reply-To: <1361394588-30527-1-git-send-email-farrah.rashid@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Fix tcp-wrappers for sshd
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
X-List-Received-Date: Thu, 21 Feb 2013 07:29:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/20/2013 01:09 PM, farrah rashid wrote:
> farrah rashid (2):
>    tcp-wrappers: remove size_t.patch
>    tcp-wrappers: add socklen_t.patch
>
>   .../tcp-wrappers/tcp-wrappers-7.6/size_t.patch     |   44 ---------------
>   .../tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch  |   59 ++++++++++++++++++++
>   .../tcp-wrappers/tcp-wrappers_7.6.bb               |    4 +-
>   3 files changed, 61 insertions(+), 46 deletions(-)
>   delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch
>   create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
>

This must be for Danny, please mark that in the patch in the future.

Thanks
	Sau!



