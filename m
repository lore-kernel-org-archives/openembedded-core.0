Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T89A0-0003fV-EQ
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 14:20:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Sep 2012 05:07:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,355,1344236400"; d="scan'208";a="188099333"
Received: from unknown (HELO helios.localnet) ([10.252.121.163])
	by orsmga001.jf.intel.com with ESMTP; 02 Sep 2012 05:07:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 02 Sep 2012 13:07:53 +0100
Message-ID: <3830362.NxTCTzAyLx@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <bc9cba103446ace4d9158470cdccd58801a66978.1346584261.git.Martin.Jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
	<bc9cba103446ace4d9158470cdccd58801a66978.1346584261.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] sstate-cache-management.sh: look in meta* above oe-core dir when looking for available tunes
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
X-List-Received-Date: Sun, 02 Sep 2012 12:20:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 02 September 2012 13:13:20 Martin Jansa wrote:
> * many layouts have other layers on the same level as oe-core checkout

This is beginning to indicate that this script really needs to actually know 
something about your configuration rather than trying to guess it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


