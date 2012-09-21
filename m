Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TFBkr-0005OY-N3
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:31:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Sep 2012 15:18:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="196222287"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2012 15:18:40 -0700
Message-ID: <505CE7C0.6090905@linux.intel.com>
Date: Fri, 21 Sep 2012 15:18:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Cristian Iorga <cristian.iorga@intel.com>
References: <1348038415-18757-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1348038415-18757-1-git-send-email-cristian.iorga@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/2] qemux86 and qemux86-64 with KVM, paravirt and virtio
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
X-List-Received-Date: Fri, 21 Sep 2012 22:31:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2012 12:06 AM, Cristian Iorga wrote:
> qemux86 and qemux86-64 have been updated with
> support for KVM, paravirt and virtio drivers.
> linux-yocto_3.4.bb recipe have been bumped to 3,
> as two changes went in (was previously at 1).
>
> Cristian Iorga (2):
>    qemux86: Support for KVM, paravirt and virtio added
>    qemux86-64: Support for KVM, paravirt and virtio added
>
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb |    4 +++-
>   scripts/runqemu                              |   16 +++++++++++++++-
>   scripts/runqemu-internal                     |   18 +++++++++++++-----
>   3 files changed, 31 insertions(+), 7 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



