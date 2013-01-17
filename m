Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TvsIL-0003N1-5o
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 17:26:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2013 08:09:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,486,1355126400"; d="scan'208";a="248405396"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2013 08:10:55 -0800
Message-ID: <50F8228E.7060408@intel.com>
Date: Thu, 17 Jan 2013 18:10:54 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1358438019-24046-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1358438019-24046-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: use qemu_run_binary instead of pango-native
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
X-List-Received-Date: Thu, 17 Jan 2013 16:26:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/17/2013 05:53 PM, Constantin Musca wrote:
> - use qemu_run_binary from qemu.bbclass to run pango-querymodules
> - remove pango-native from DEPENDS in order to do not create
> unbuildable dependency chains (e.g. ['gtk+', 'pango', 'pango-native',
> 'cairo-native', 'directfb-native'])
> 
> [YOCTO #3642]
> 
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Acked-by: Laurentiu Palcu <laurentiu.palcu@intel.com>


