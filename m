Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCYGI-0005eh-WE
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 17:56:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Sep 2012 08:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="145115197"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2012 08:44:23 -0700
Message-ID: <505350D6.3060808@linux.intel.com>
Date: Fri, 14 Sep 2012 08:44:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>
References: <cover.1347556625.git.andrei@gherzan.ro>
In-Reply-To: <cover.1347556625.git.andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/1] Round up ROOTFS_SIZE after base_size check
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
X-List-Received-Date: Fri, 14 Sep 2012 15:56:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 10:18 AM, Andrei Gherzan wrote:
> V3:
> Do the whole thing in the same awk
>
> The following changes since commit 0f55a5868457300a3defc7fa7451ef191d19e018:
>
>    adt-installer: Allow changing YOCTOADT_REPO (2012-09-05 23:28:10 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ag/rootfs_size
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/rootfs_size
>
> Andrei Gherzan (1):
>    image_types.bbclass: Round up ROOTFS_SIZE after base_size check
>
>   meta/classes/image_types.bbclass |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



