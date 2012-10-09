Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TLXPa-0003uY-JZ
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 12:51:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Oct 2012 03:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,560,1344236400"; d="scan'208";a="224101042"
Received: from unknown (HELO helios.localnet) ([10.252.122.38])
	by orsmga002.jf.intel.com with ESMTP; 09 Oct 2012 03:38:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: jackie.huang@windriver.com
Date: Tue, 09 Oct 2012 11:38:32 +0100
Message-ID: <2072868.bxk9nbbmYZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-31-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <cover.1349689653.git.jackie.huang@windriver.com>
References: <cover.1349689653.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] ruby: Add from OE-Classic and update to 1.9.3-p194
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
X-List-Received-Date: Tue, 09 Oct 2012 10:51:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jackie,

On Tuesday 09 October 2012 14:36:53 jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> * I sent this months ago but was told that oe-core is not the right place,
>   however, we think it makes sense to add ruby to complete the scripting
>   language set of: python, perl, ruby, so I re-send it.

I have to say, my opinion is the same now as it was then. Ruby support is 
certainly useful to have, and we have had requests for it; but unlike Perl and 
Python which are needed by many other things, nothing we have in OE-Core 
actually needs Ruby; thus it really belongs in another layer IMHO.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


