Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SE89A-0001vq-Ek
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 01:55:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Mar 2012 16:46:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="124075967"
Received: from unknown (HELO helios.localnet) ([10.252.123.233])
	by orsmga001.jf.intel.com with ESMTP; 31 Mar 2012 16:46:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 01 Apr 2012 00:46:43 +0100
Message-ID: <1607664.qKyoFqIBt3@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1203311910320.12870@oneiric>
References: <alpine.DEB.2.02.1203311910320.12870@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: is "fakeroot" still used as a variable "flag"?
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
X-List-Received-Date: Sat, 31 Mar 2012 23:55:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 31 March 2012 19:12:12 Robert P. J. Day wrote:
>   the bitbake manual lists "fakeroot" as a possible variable flag,
> along with things like "nostamp", "noexec" and so on.  but i don't see
> fakeroot being used as a flag anywhere in the source tree.  has that
> changed?

No, fakeroot is still used - it is a flag for functions indicating fakeroot 
(these days pseudo) should be enabled when the function is executed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


