Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T5vve-0005DO-Pr
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 11:48:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Aug 2012 02:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,318,1344236400"; d="scan'208";a="191742251"
Received: from unknown (HELO helios.localnet) ([10.252.121.136])
	by orsmga002.jf.intel.com with ESMTP; 27 Aug 2012 02:36:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Mon, 27 Aug 2012 10:36:04 +0100
Message-ID: <1365367.9tL33RJjyz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAOHjBZtdvx616YgP-HeXE6xFgrP0y42BJEfPh5r6uTRmoCYQnw@mail.gmail.com>
References: <CAOHjBZtdvx616YgP-HeXE6xFgrP0y42BJEfPh5r6uTRmoCYQnw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How can I append .inc files?
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
X-List-Received-Date: Mon, 27 Aug 2012 09:48:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 27 August 2012 10:05:15 Giuseppe Condorelli wrote:
> Is there a way to append (in private layer) the .inc files other than the
> .bb (bbappend)?

You can't - you can only supply your own version of the inc file (provided that 
you can ensure your version is found first via BBPATH), or bbappend every 
recipe that includes them - the latter is preferred.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


