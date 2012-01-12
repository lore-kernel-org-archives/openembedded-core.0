Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlN5K-0007pq-NK
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 17:01:03 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2012 22:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95015743"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2012 22:30:25 -0800
Message-ID: <4F0E7E01.2050701@linux.intel.com>
Date: Wed, 11 Jan 2012 22:30:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326018213-10060-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1326018213-10060-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] libiconv_1.14.bb: Fix build failure
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
X-List-Received-Date: Thu, 12 Jan 2012 16:01:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2012 02:23 AM, Khem Raj wrote:
> Currently libiconv is failing after upgrade to 1.14
> this patch fixes the problem. It uses relocatable
> gnulib module which should be added.
>
> Delete unpackaged files.
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../libiconv-1.14/add-relocatable-module.patch     | 5008 ++++++++++++++++++++
>   meta/recipes-support/libiconv/libiconv_1.14.bb     |    8 +-
>   2 files changed, 5015 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-support/libiconv/libiconv-1.14/add-relocatable-module.patch
>
Merged into OE-Core

Thanks
	Sau!



