Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QZHYO-0000BG-2w
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 09:08:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jun 2011 00:05:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,404,1304319600"; d="scan'208";a="18143730"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by orsmga001.jf.intel.com with ESMTP; 22 Jun 2011 00:05:12 -0700
Message-ID: <4E019429.5090208@intel.com>
Date: Wed, 22 Jun 2011 15:05:13 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308639329.git.edwin.zhai@intel.com>
	<DE2EAFBC-F416-444A-B5C8-D8F669756790@dominion.thruhere.net>
In-Reply-To: <DE2EAFBC-F416-444A-B5C8-D8F669756790@dominion.thruhere.net>
Subject: Re: [PATCH 0/1] Remove obsolete gnome-vfs
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
X-List-Received-Date: Wed, 22 Jun 2011 07:08:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Koen Kooi wrote:
>
> Op 21 jun 2011, om 09:12 heeft edwin.zhai@intel.com het volgende 
> geschreven:
>
> > From: Zhai Edwin <edwin.zhai@intel.com>
> >
> > This patch removed obsolete gnome-vfs in favor of GIO/GVFS.
>
> Thanks for the patch! I've gone through meta-oe and only libgnome 
> requires gnome-vfs at this point, but virtually nothing depends on 
> libgnome itself anymore.
>

I have no libgnome on my side. After going through the source tar ball 
of libgnome, I found it's hard coded to depend on gnome-vfs without any 
configure option. And no progress indicated in the migration webpage @ 
http://live.gnome.org/GioPort.

If virtually nothing depends on libgnome, we are safe for this point:)


> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


