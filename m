Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T61iW-0001Ql-0D
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 17:59:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Aug 2012 08:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,321,1344236400"; d="scan'208";a="191856303"
Received: from unknown (HELO [10.255.13.20]) ([10.255.13.20])
	by orsmga002.jf.intel.com with ESMTP; 27 Aug 2012 08:46:55 -0700
Message-ID: <503B966F.3030405@linux.intel.com>
Date: Mon, 27 Aug 2012 08:46:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Mihai Lindner <mihaix.lindner@linux.intel.com>
References: <cover.1345831050.git.mihaix.lindner@linux.intel.com>
In-Reply-To: <cover.1345831050.git.mihaix.lindner@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] grub-efi: fix Nothing PROVIDES 'grub-efi-x86_64-native'
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
X-List-Received-Date: Mon, 27 Aug 2012 15:59:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2012 11:06 AM, Mihai Lindner wrote:
> "ERROR: Nothing PROVIDES 'grub-efi-x86_64-native'" is returned when
> trying to build meta-intel/meta-cedartrail with DEFAULTTUNE = "core2-64"
> Used TRANSLATED_TARGET_ARCH instead of TARGET_ARCH in grub-efi.bbclass
>
> [YOCTO #3013]
>
> Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
> ---
>
> Mihai Lindner (1):
>    grub-efi: fix Nothing PROVIDES 'grub-efi-x86_64-native' error
>
>   meta/classes/grub-efi.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
Merged into OE-Core

Thanks
	Sau!



