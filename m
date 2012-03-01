Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S37H5-00077z-9d
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 15:46:31 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Mar 2012 06:38:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="72311998"
Received: from unknown (HELO helios.localnet) ([10.252.123.90])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Mar 2012 06:37:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 01 Mar 2012 14:37:58 +0000
Message-ID: <27160280.DeolcF7eDi@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <CAGiJk9fNChJRLzHTLptShp+duFZy+o2bf_Enz6_kv_v-httwxg@mail.gmail.com>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
	<BFD998F2-6D5D-4E7D-8006-C133F0DF9C98@dominion.thruhere.net>
	<CAGiJk9fNChJRLzHTLptShp+duFZy+o2bf_Enz6_kv_v-httwxg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Thu, 01 Mar 2012 14:46:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 01 March 2012 15:15:11 Samuel Stirtzel wrote:
> For the packages kconfig_compiler (needs libkdecore) and
> makekdewidgets (needs libkdecore and libkdeui) it might work, as long
> as the programs got their libraries.
> Since building kdelibs native in OpenEmbedded would need a "full
> featured" Qt-native and the other dependencies it would cause a lot
> overhead.
> Building libkdecore and kconfig_compiler alone works, but libkdeui
> pulls "everything" else in.

Ouch :( I can imagine trying to break these up would be quite tricky. Perhaps 
it's something we have to live with for the time being. If we do rely on 
external executables, then we should check and error out as early as possible 
if the required executables don't exist.

> > No testlab in oe-core, but buildhistory pretty much does the same:
> > http://dominion.thruhere.net/koen/cms/the-testlab-strikes-again
> Thanks, I will look into that.

FYI there's very basic documentation for buildhistory here:

  http://wiki.yoctoproject.org/wiki/Buildhistory

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


