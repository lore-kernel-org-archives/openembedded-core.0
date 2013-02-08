Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U3oHB-0004t9-QK
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 14:46:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2013 05:30:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,629,1355126400"; d="scan'208";a="284499435"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2013 05:30:06 -0800
Message-ID: <5114FDDD.6090902@intel.com>
Date: Fri, 08 Feb 2013 15:30:05 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1360312207.git.sgw@linux.intel.com>
In-Reply-To: <cover.1360312207.git.sgw@linux.intel.com>
Subject: Re: [CONSOLIDATED PULL 00/32] AB Tested set of patches
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
X-List-Received-Date: Fri, 08 Feb 2013 13:46:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Laurentiu Palcu (6):
>   Add pixbufcache class
>   gdk-pixbuf: use the new pixbufcache class
>   librsvg: use the new pixbufcache class
>   gtk-immodules-cache: add weak asignment for GTKIMMODULES_PACKAGES
>   gtk+: use gtk-immodules-cache class
>   gnome-keyring: compile schemas on host

Do not merge this patchset just yet. I'm working on a fall-back solution
in case intercept hook scripts fail so that the postinstalls run at
first boot.

Thanks,
Laurentiu


