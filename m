Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWDnk-00009G-Qk
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 22:32:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Jun 2011 13:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,360,1304319600"; d="scan'208";a="13037343"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2011 13:28:35 -0700
Message-ID: <4DF672F2.2030909@linux.intel.com>
Date: Mon, 13 Jun 2011 13:28:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
In-Reply-To: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Where is atom-pc.conf hiding?
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
X-List-Received-Date: Mon, 13 Jun 2011 20:32:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/13/2011 11:31 AM, Koen Kooi wrote:
> Hi,
>
> Khem was asking if I could reproduce the recent x86 breakage he was seeing[1] and I ran into another bug:
>
> koen@dominion:/OE/tentacle/sources/meta-intel$ git blame meta-n450/conf/machine/n450.conf  | grep atom
> 158f88d7 (Saul Wold   2011-01-03 15:33:52 -0800  6) require conf/machine/atom-pc.conf
>
meta-yocto seems to be the place you need to look!

I hope that the layering tools can help to detect and inform folks of 
this like of dependency.

Sau!
(yes another tentacle to keep track of!)


> koen@dominion:/OE/tentacle/sources/meta-intel$ !find
> find . -name "atom-pc.conf"
> koen@dominion:/OE/tentacle/sources/meta-intel$
>
> So let's drop down a level and try other layers:
>
> koen@dominion:/OE/tentacle/sources/meta-intel$ cd ..
> koen@dominion:/OE/tentacle/sources$ ls -1 | grep meta
> meta-angstrom/
> meta-efikamx/
> meta-intel/
> meta-nslu2/
> meta-openembedded/
> meta-openpandora/
> meta-shr/
> meta-smartphone/
> meta-texasinstruments/
> meta-xilinx/
> koen@dominion:/OE/tentacle/sources$ find . -name "atom-pc.conf"
> koen@dominion:/OE/tentacle/sources$
>
> Still nothing. So where is it hiding?
>
> regards,
>
> Koen
>
> [1] The bugs:
>
> 20:22<khem>  MACHINE=4 bitbake console-image
> 20:22<khem>  try any nonexisting machine
> 20:22<khem>  no error nothing
>
> and:
>
> 20:23<khem>  so any x86 arch in angstrom is not parsable
> 20:23<khem>  and it seems to be culminating from various factors
> 20:24<khem>  if I remove inheriting rm_work it starts to work
> 20:24<khem>  if I remove BASE_PACKAGE_ARCH = "all" from allarch.bbclass it starts to work
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


