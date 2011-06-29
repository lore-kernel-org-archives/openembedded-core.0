Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QbjZB-0007ex-Rj
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 03:27:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2011 18:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,440,1304319600"; d="scan'208";a="21709368"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2011 18:24:03 -0700
Message-ID: <4E0A7EB2.5070502@intel.com>
Date: Wed, 29 Jun 2011 09:24:02 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1309246787.git.edwin.zhai@intel.com>	<2c83cbe9b56b589ad8786d8d371c2d85810b31f2.1309246787.git.edwin.zhai@intel.com>
	<1309269269.20015.295.camel@rex>
In-Reply-To: <1309269269.20015.295.camel@rex>
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
X-List-Received-Date: Wed, 29 Jun 2011 01:27:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen said missing of gnomebase.bbclass may be introduced by some hacks 
in one merge.


Richard Purdie wrote:
>
> On Tue, 2011-06-28 at 15:42 +0800, edwin.zhai@intel.com wrote:
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
> >  .../glib-networking/glib-networking_2.28.7.bb      |   21 
> ++++++++++++++++++++
> >  1 files changed, 21 insertions(+), 0 deletions(-)
> >  create mode 100644 
> meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
>
> I merged this patch but we should revisit the issue of the gnome bbclass
> files in a subsequent patch.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


