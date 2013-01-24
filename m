Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TyNYv-0002YK-VW
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 15:13:54 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jan 2013 05:58:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,529,1355126400"; d="scan'208";a="277903817"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2013 05:58:19 -0800
Message-ID: <51013F96.80302@intel.com>
Date: Thu, 24 Jan 2013 16:05:10 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
	<20130124134801.GD3012@jama>
In-Reply-To: <20130124134801.GD3012@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Thu, 24 Jan 2013 14:13:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 01/24/2013 03:48 PM, Martin Jansa wrote:
> On Thu, Jan 24, 2013 at 03:36:02PM +0200, Radu Moisan wrote:
>> this fixes a service dependency issue;
>> while graphical.target is the default mode, systemd
>> will try to start display-manager.service which is not
>> available.
> what about images with display-manager available?
>
> meta-efl/recipes-efl/efl/entrance/entrance.service:Alias=display-manager.service
> meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in:Alias=display-manager.service
> meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service:Alias=display-manager.service
>
> ?
>
> Making this change in global PKG_ARCH recipe doesn't look correct (and
> also missing Upstream-Status and SOB line).
>
> Cheers,
>
The problem goes both ways. If we leave it as it is, graphical.target as 
default, what about images that don't need a display manager, like 
core-image-minimal that is in particular the target, for the time being, 
for systemd integration.

Radu


