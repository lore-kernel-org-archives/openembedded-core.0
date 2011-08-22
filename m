Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QveJj-0002Dk-T3
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 01:54:08 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Aug 2011 16:49:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,266,1312182000"; 
   d="scan'208";a="9945413"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Aug 2011 16:49:21 -0700
Message-ID: <4E52EB01.3010103@linux.intel.com>
Date: Mon, 22 Aug 2011 16:49:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313571206.git.kai.kang@windriver.com>
In-Reply-To: <cover.1313571206.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/1] at: make at usable for common user
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
X-List-Received-Date: Mon, 22 Aug 2011 23:54:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2011 02:43 AM, Kang Kai wrote:
> From: Kang Kai<kai.kang@windriver.com>
>
> Fixes [Yocto #1297]
>
> The pkg_postinst was added to fix Yocto #675. But it seems not needed
> any more. Remove it then unprivilege user could use at.
>
> The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:
>
>    Fixup remaining bb.msg.domain users (2011-08-15 17:31:52 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/at
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/at
>
> Kang Kai (1):
>    at: make at usable for common user
>
>   meta/recipes-extended/at/at_3.1.12.bb |   26 +++++---------------------
>   1 files changed, 5 insertions(+), 21 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


