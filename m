Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QbN2M-0001OS-IY
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 03:24:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Jun 2011 18:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,435,1304319600"; d="scan'208";a="19047464"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by orsmga002.jf.intel.com with ESMTP; 27 Jun 2011 18:20:38 -0700
Message-ID: <4E092C66.5020202@intel.com>
Date: Tue, 28 Jun 2011 09:20:38 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308973924.git.edwin.zhai@intel.com>	<a9318aee537a684644da1b6c3349e1f339bdf269.1308973924.git.edwin.zhai@intel.com>
	<E1CE6B81-087C-421B-8B2D-3FB66713E99C@dominion.thruhere.net>
In-Reply-To: <E1CE6B81-087C-421B-8B2D-3FB66713E99C@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] glib-networking: Add 2.28.7 as new recipe
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
X-List-Received-Date: Tue, 28 Jun 2011 01:24:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Koen Kooi wrote:
>
> Op 25 jun 2011, om 05:54 heeft edwin.zhai@intel.com het volgende 
> geschreven:
>
> > From: Zhai Edwin <edwin.zhai@intel.com>
> >
> > +SRC_URI = 
> "${GNOME_MIRROR}/glib-networking/2.28/glib-networking-${PV}.tar.bz2"
>
> No 'name' parameter
>
I'll change it to

+SRC_URI = "${GNOME_MIRROR}/${PN}/2.28/${PN}-${PV}.tar.bz2"

> > +SRC_URI[archive.md5sum] = "c10e51571d03c10111a37bcd21fbf777"
> > +SRC_URI[archive.sha256sum] = 
> "98bedfbd530c4b1b53c91025fe82290bafd289d249e4eb549c3b90d23a76021c"
>
> 'archive' as name paramater, leading to:
>

My fault, will remove it.

> WARNING: Missing SRC_URI checksum for 
> /OE/tentacle/sources/downloads/glib-networking-2.28.7.tar.bz2, 
> consider adding to the recipe:
>
> SRC_URI[md5sum] = "c10e51571d03c10111a37bcd21fbf777"
> SRC_URI[sha256sum] = 
> "98bedfbd530c4b1b53c91025fe82290bafd289d249e4eb549c3b90d23a76021c"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


