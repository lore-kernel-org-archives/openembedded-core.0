Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RfzW5-0006le-PI
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 20:50:25 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Dec 2011 11:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101078327"
Received: from unknown (HELO [10.255.13.80]) ([10.255.13.80])
	by fmsmga001.fm.intel.com with ESMTP; 28 Dec 2011 11:43:07 -0800
Message-ID: <4EFB714B.30206@linux.intel.com>
Date: Wed, 28 Dec 2011 11:43:07 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CACW_hTbBoB4yaN0W+H3WuW9GXYFGD6+FxQ5BMbKe+a2-pqc_Hw@mail.gmail.com>
In-Reply-To: <CACW_hTbBoB4yaN0W+H3WuW9GXYFGD6+FxQ5BMbKe+a2-pqc_Hw@mail.gmail.com>
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: non-fetching recipes
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
X-List-Received-Date: Wed, 28 Dec 2011 19:50:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/2011 02:33 AM, Frans Meulenbroeks wrote:
> Hi,
>
> I noticed that several recipes are non-fetchers. These are mostly the
> ones with sources hosted on kernel.org <http://kernel.org>.
> Is there an issue with kernel.org <http://kernel.org> again?
>
It's not down again, a number of the sources have not been restored or 
have been moved, still trying to track some of this down.

There should be source mirrors at the yoctoproject.org website as well 
as the openembedded,org site (not sure if this full url).

> I noticed this for oe classic where libpam and util-linux-ng did not
> fetch (as well as opkg-utils but that one is from openmoko).
> oe maintenance branch seems to have the same problems as well as using
> binutils 2.21 which is not available any more. master does not have this
> as it has been moved to 2.21a.
>
> I'm crossposting this to oe-core, because I noticed it uses the same
> location for libpam (and probably util-linux).
>
> Someone might want to run some fetchalls.
>
We do run a nightly fetch, but I think we have our mirror set so we 
don't see the full fails, it might be a good idea to figure out the 
complete failure set right now with no PREMIRROR or MIRRRORs.

I will look into this.

Sau!


> Frans.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


