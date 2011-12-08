Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYiiX-0003zg-6x
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 19:29:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Dec 2011 10:22:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="85078814"
Received: from unknown (HELO [10.255.12.35]) ([10.255.12.35])
	by orsmga002.jf.intel.com with ESMTP; 08 Dec 2011 10:22:21 -0800
Message-ID: <4EE1005D.7030701@linux.intel.com>
Date: Thu, 08 Dec 2011 10:22:21 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323212403.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1323212403.git.andrea.adami@gmail.com>
Subject: Re: [PATCH 0/2] rework jffs2 images creation, add jffs2 summary
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
X-List-Received-Date: Thu, 08 Dec 2011 18:29:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2011 03:23 PM, Andrea Adami wrote:
> * The first patch adds support for the creation of
> * jffs2 summary images for a faster mount.
> * The second patch forces the --no-cleanmarkers option
> * to further improve boot time.
>
> Andrea Adami (2):
>    image_types.bbclass: implement jffs2 summary images (sum.jffs2)
>    image_types.bbclass: disable cleanmarkers for jffs2 images
>
>   meta/classes/image_types.bbclass |    7 +++++--
>   1 files changed, 5 insertions(+), 2 deletions(-)
>
Merged to OE-Core

Thanks
	Sau!


