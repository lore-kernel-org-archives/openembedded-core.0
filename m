Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S9z23-0007en-Do
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 14:23:23 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Mar 2012 06:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141861004"
Received: from unknown (HELO helios.localnet) ([10.252.123.195])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2012 06:14:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 20 Mar 2012 13:14:28 +0000
Message-ID: <27193241.TpUGZafhRb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <C78FED4E-E3C7-4369-9622-0A4C6AA009DC@dominion.thruhere.net>
References: <1332241255-5083-1-git-send-email-koen@dominion.thruhere.net>
	<1812139.SkpSglmEkv@helios>
	<C78FED4E-E3C7-4369-9622-0A4C6AA009DC@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] buildhistory: remove duplicate entries from dot graph
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
X-List-Received-Date: Tue, 20 Mar 2012 13:23:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 20 March 2012 13:11:38 Koen Kooi wrote:
> I think I know why [2] doesn't work:
> 
> koen@dominion:/data/ssd/OE/buildhistory$ echo b c a | sort
> b c a
> koen@dominion:/data/ssd/OE/buildhistory$ echo -e b\\nc\\na | sort
> a
> b
> c

Ah, yes, that would explain it. I've primarily been testing with rpm for which 
list_package_depends produces the output on separate lines, whereas the ipk 
version is all on one line; it only matters when doing the sort. Oops!

> Let me know how you want me to respin this series, each commit is an RFC on
> its own.

If you wouldn't mind I think the easiest thing is to drop the sort/uniq on the 
depends/recommends and just rely on the one at the end that you're adding. It 
does mean we'll have a one-time resort of the recommends and depends together 
but at least it will work properly for all package backends.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


