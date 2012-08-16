Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24PN-0007yC-91
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:03:01 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Aug 2012 10:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="135069188"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 10:51:02 -0700
Message-ID: <502D3306.2050100@linux.intel.com>
Date: Thu, 16 Aug 2012 10:51:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343959047-24613-1-git-send-email-sen.zhang@windriver.com>
In-Reply-To: <1343959047-24613-1-git-send-email-sen.zhang@windriver.com>
Subject: Re: [PATCH] libxpm-native: add dependency on gettext-native
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
X-List-Received-Date: Thu, 16 Aug 2012 18:03:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2012 06:57 PM, Jesse Zhang wrote:
> libxpm needs xgettext. There can be failures if gettext doesn't get built first
> and it's not available from the host.
>
> The target version doesn't have issues since it will get the dependency
> indirectly.
>
> Jesse Zhang (1):
>    libxpm-native: add dependency on gettext-native
>
>   meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



