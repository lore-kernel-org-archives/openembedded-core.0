Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4yYF-0002FM-N6
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:24:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by azsmga101.ch.intel.com with ESMTP; 24 Aug 2012 11:12:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="190927464"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2012 11:12:02 -0700
Message-ID: <5037C3F2.9060005@linux.intel.com>
Date: Fri, 24 Aug 2012 11:12:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1345702391-27078-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1345702391-27078-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Telepathy package upgrades
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
X-List-Received-Date: Fri, 24 Aug 2012 18:24:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2012 11:13 PM, Constantin Musca wrote:
> This is another set of package upgrades compiled on all architectures
> and tested using core-image-sato-sdk.
>
> Constantin Musca (2):
>    telepathy-glib: update to 0.19.6
>    telepathy-idle: upgrade to 0.1.12
>
>   ...Fix-a-race-in-_gen-reentrant-methods.list.patch |   42 --------------------
>   ...thy-glib_0.19.2.bb => telepathy-glib_0.19.6.bb} |    9 ++---
>   .../fix-svc-gtk-doc.h-target.patch                 |   37 +++++++++++++++++
>   ...thy-idle_0.1.11.bb => telepathy-idle_0.1.12.bb} |    9 +++--
>   4 files changed, 46 insertions(+), 51 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-glib/0001-Fix-a-race-in-_gen-reentrant-methods.list.patch
>   rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.2.bb => telepathy-glib_0.19.6.bb} (68%)
>   create mode 100644 meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/fix-svc-gtk-doc.h-target.patch
>   rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.11.bb => telepathy-idle_0.1.12.bb} (72%)
>

Merged into OE-Core

Thanks
	Sau!



