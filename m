Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QYfEj-00022u-Cj
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 16:13:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jun 2011 07:10:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,394,1304319600"; d="scan'208";a="18404871"
Received: from unknown (HELO helios.localnet) ([10.255.16.236])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2011 07:10:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Cliff Brake <cliff.brake@gmail.com>
Date: Mon, 20 Jun 2011 15:10:22 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <E1QXzLA-0004Ca-IU@happy.bec-systems.com>
	<201106181840.38875.paul.eggleton@linux.intel.com>
	<BANLkTi=zfbd=Z0nXhjsE8Z+qr90u6V+Law@mail.gmail.com>
In-Reply-To: <BANLkTi=zfbd=Z0nXhjsE8Z+qr90u6V+Law@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201106201510.22897.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: OE Changelog for 2011-06-6 to 2011-06-13
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
X-List-Received-Date: Mon, 20 Jun 2011 14:13:57 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 20 June 2011 14:48:45 Cliff Brake wrote:
> Can you describe how the bitbake and oe-core directories are
> synchronized to content in the poky repo?

Sure. Richard can correct me on this, but my understanding is at the moment he 
has a bunch of scripts that grab changes from the local clones of the source 
repositories as patches, which are then applied on top of the Poky repository. 
Richard runs these scripts periodically. Some time soon these scripts will be 
replaced by the combo layer tool that Ke posted last week.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


