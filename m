Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QbX6q-0003m6-Jz
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 14:09:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Jun 2011 05:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,437,1304319600"; d="scan'208";a="21009388"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by orsmga001.jf.intel.com with ESMTP; 28 Jun 2011 05:05:58 -0700
Message-ID: <4E09C3A7.4080601@intel.com>
Date: Tue, 28 Jun 2011 20:05:59 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1309246787.git.edwin.zhai@intel.com>	<2c83cbe9b56b589ad8786d8d371c2d85810b31f2.1309246787.git.edwin.zhai@intel.com>	<1309252319.21613.330.camel@phil-desktop>
	<0FACC81C-8E9B-4A6D-A33E-C9D8383F8B0B@dominion.thruhere.net>
In-Reply-To: <0FACC81C-8E9B-4A6D-A33E-C9D8383F8B0B@dominion.thruhere.net>
Subject: Re: [PATCH 1/3] glib-networking: Add 2.28.7 as new recipe
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
X-List-Received-Date: Tue, 28 Jun 2011 12:09:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Koen Kooi wrote:
>
> Op 28 jun 2011, om 11:11 heeft Phil Blundell het volgende geschreven:
>
> > On Tue, 2011-06-28 at 15:42 +0800, edwin.zhai@intel.com wrote:
> >> +SRC_URI = "${GNOME_MIRROR}/${PN}/2.28/${PN}-${PV}.tar.bz2"
> >
> > FYI, gnome.bbclass will do this for you and will also figure out the
> > "2.28" part automatically.
>
> THat will also drag in a ton of deps,
>

yes.
>
> gnomebase.bbclass in meta-oe does a better job :)
>

There is no gnomebase.bbclass in yocto. I can sync with it in future.


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


