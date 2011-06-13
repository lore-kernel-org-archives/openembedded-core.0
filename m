Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QWDlI-00005f-P5
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 22:29:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Jun 2011 13:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,360,1304319600"; d="scan'208";a="13036692"
Received: from vorpal.jf.intel.com (HELO [10.7.199.151]) ([10.7.199.151])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2011 13:26:01 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 13:29:51 -0700
In-Reply-To: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
References: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2 (3.0.2-2.fc15) 
Message-ID: <1307996991.1964.8.camel@vorpal.jf.intel.com>
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 13 Jun 2011 20:29:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-13 at 20:31 +0200, Koen Kooi wrote:
> Hi,
> 
> Khem was asking if I could reproduce the recent x86 breakage he was seeing[1] and I ran into another bug:
> 
> koen@dominion:/OE/tentacle/sources/meta-intel$ git blame meta-n450/conf/machine/n450.conf  | grep atom
> 158f88d7 (Saul Wold   2011-01-03 15:33:52 -0800  6) require conf/machine/atom-pc.conf
> 
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

meta-yocto:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/machine/atom-pc.conf

Joshua
-- 
Joshua Lock
        Yocto Project Build Monkey
        Intel Open Source Technology Centre



