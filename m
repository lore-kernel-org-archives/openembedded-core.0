Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SStsx-0003Is-4J
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:44:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 May 2012 10:34:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99047635"
Received: from unknown (HELO [10.255.12.250]) ([10.255.12.250])
	by AZSMGA002.ch.intel.com with ESMTP; 11 May 2012 10:34:14 -0700
Message-ID: <4FAD4D96.6020809@linux.intel.com>
Date: Fri, 11 May 2012 10:34:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336579481.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1336579481.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/2] Import the blacklist functionality from meta-oe
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
X-List-Received-Date: Fri, 11 May 2012 17:44:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2012 09:08 AM, Mark Hatle wrote:
> This imports the blacklist class from meta-oe, and then a subseqent patch
> revises it to use the OE variable and change the message generation.
>
> Once accepted into oe-core, a patch for meta-oe will be generated to remove
> it from there.
>
> The following changes since commit 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:
>
>    kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/blacklist
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/blacklist
>
> Mark Hatle (2):
>    blacklist: fix typo in name
>    blacklist.bbclass: Rename to OE_BLACKLIST and minor cleanup
>
>   meta/classes/blacklist.bbclass |   23 +++++++++++++++++++++++
>   1 files changed, 23 insertions(+), 0 deletions(-)
>   create mode 100644 meta/classes/blacklist.bbclass
>

This was merged with the Updated PNBLACKLIST Name

Thanks

Sau!


