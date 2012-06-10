Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sdqpq-0005gO-6b
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 00:42:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jun 2012 15:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="178137496"
Received: from unknown (HELO helios.localnet) ([10.252.120.99])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2012 15:31:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Date: Sun, 10 Jun 2012 23:31:39 +0100
Message-ID: <5277292.6yLHfnqofK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-24-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <1161C4AE-EBFE-4E7E-871D-16DD313E16C7@gmail.com>
References: <56B3703F-09C3-4A9E-BF97-17DBBBE8C9AF@gmail.com>
	<CAMKF1sowgNZZqCYgJMZv=czABU0r1J+8ELUDQQYY0THwef-QVQ@mail.gmail.com>
	<1161C4AE-EBFE-4E7E-871D-16DD313E16C7@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-xilinx] How to debug the value of ${TARGET_ARCH} in meta-xilinx/classes/xilinx-boot.class
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
X-List-Received-Date: Sun, 10 Jun 2012 22:42:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 03 June 2012 08:31:07 Elvis Dowson wrote:
> On Jun 3, 2012, at 2:48 AM, Khem Raj wrote:
> > What's your default she I guess its not bash
> 
> I have left it as the default Dash shell, as indicated in the yocto 1.2
> setup guidelines, for Ubuntu-12.04 LTS.

Right, that's fine, we definitely do support dash. However if you are adding 
shell functions in your own layer they also need to avoid the use of bashisms, 
and == is one example. FYI here is a reference in case it is useful:

 http://mywiki.wooledge.org/Bashism

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


