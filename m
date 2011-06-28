Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QbMlG-00018U-39
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 03:06:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jun 2011 18:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,435,1304319600"; d="scan'208";a="23592716"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2011 18:02:40 -0700
Message-ID: <4E092830.8050002@intel.com>
Date: Tue, 28 Jun 2011 09:02:40 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308973924.git.edwin.zhai@intel.com>	<a9318aee537a684644da1b6c3349e1f339bdf269.1308973924.git.edwin.zhai@intel.com>
	<F8790096-AFE8-4CDA-B025-CE8359FC48BF@dominion.thruhere.net>
In-Reply-To: <F8790096-AFE8-4CDA-B025-CE8359FC48BF@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 28 Jun 2011 01:06:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Koen Kooi wrote:
>
> Op 25 jun 2011, om 05:54 heeft edwin.zhai@intel.com het volgende 
> geschreven:
>
> > From: Zhai Edwin <edwin.zhai@intel.com>
> >
> > glib-networking contains the implementations of certain GLib networking
> > features that cannot be implemented directly in GLib itself because 
> of their
> > dependencies. TLS/SSL support is one of them, which is needed for 
> accessing SSL
> > web page.
> >
> > Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> > ---
> > meta/recipes-sato/web/glib-networking_2.28.7.bb |   21 
> +++++++++++++++++++++
>
> The recipe looks good, but it shouldn't be hidden in recipes-sato/web/
>

 From function level, only web requires TLS or proxy support. But in 
fact, glib-networking is part of glib. How about recipes-core/, like glib?

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


