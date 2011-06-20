Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QYXlU-0002kj-FH
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 08:15:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Jun 2011 23:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,391,1304319600"; d="scan'208";a="15392792"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by azsmga001.ch.intel.com with ESMTP; 19 Jun 2011 23:11:42 -0700
Message-ID: <4DFEE49D.7030002@intel.com>
Date: Mon, 20 Jun 2011 14:11:41 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <F2ABCA33-0CC1-4583-B929-2ED7E27B8C00@dominion.thruhere.net>
	<39FFEDDE-06E2-4AF5-91BA-F3160145A04F@dominion.thruhere.net>
In-Reply-To: <39FFEDDE-06E2-4AF5-91BA-F3160145A04F@dominion.thruhere.net>
Subject: Re: Moving oe-core GNOME recipes over to meta-gnome
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
X-List-Received-Date: Mon, 20 Jun 2011 06:15:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen,
I have checked the build log,  following should be in the keep list:

gconf-dbus
gnome-common
gnome-desktop
gnome-doc-utils
gnome-keyring
gnome-mime-data
gnome-vfs
libgnome-keyring

Thanks,
edwin

Koen Kooi wrote:
>
> Op 9 jun 2011, om 12:50 heeft Koen Kooi het volgende geschreven:
>
> > Hi,
> >
> > There are a number of non-sato GNOME recipes still in oe-core that 
> should be moved over to meta-gnome. Metacity is one of those. Could 
> the yocto people please draw up a list of the recipes they want to 
> keep in oe-core and I will send patches to remove the others.
>
> Any movement on this?
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


