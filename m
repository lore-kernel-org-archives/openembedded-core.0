Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TBNBt-0007c0-Ka
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 11:55:33 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Sep 2012 02:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,402,1344236400"; d="scan'208";a="220650425"
Received: from unknown (HELO helios.localnet) ([10.252.121.164])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2012 02:43:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 10:43 +0100
Message-ID: <3086135.RchMtsNZeX@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CA+chaQcONF6wXFADzuYMCo4kZuWj6fNQ+d4fcvU54yaywz+jtA@mail.gmail.com>
References: <1346855269.21985.57.camel@ted> <1346884973.21985.137.camel@ted>
	<CA+chaQcONF6wXFADzuYMCo4kZuWj6fNQ+d4fcvU54yaywz+jtA@mail.gmail.com>
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] sanity.bbclass: Move back to running at ConfigParsed time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 09:55:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 11 September 2012 08:39:39 Martin Jansa wrote:
> Today with latest oe-core and bitbake I've set MACHINE=pitz (instead
> of spitz) and the output doesn't look very tidy. Shows couple of DEBUG
> entries even without debug enabled and then actuall ERROR, see
> attached log.

I've just sent a patch to the bitbake list that fixes this, as well as a patch 
to the OE-Core list that gets rid of the not particularly useful tune check 
failures when MACHINE is invalid.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


