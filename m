Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7o0K-0005bL-Cy
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 14:12:36 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2012 06:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77397482"
Received: from unknown (HELO helios.localnet) ([10.252.123.190])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2012 06:03:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Mar 2012 13:03:24 +0000
Message-ID: <1464522.1Gj9RCK92m@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <CADkTA4OdMwB4gPNaYF7paaY9TLZV5YuQgqAVXzK4wT1pCxtrCw@mail.gmail.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<2970280.1QavEf7R15@helios>
	<CADkTA4OdMwB4gPNaYF7paaY9TLZV5YuQgqAVXzK4wT1pCxtrCw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] linux-yocto-tiny: add dependency on xz-native
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
X-List-Received-Date: Wed, 14 Mar 2012 13:12:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 March 2012 08:59:34 Bruce Ashfield wrote:
> You could audit the constructed .config as well, since that's the final word
> on whether it actually makes it into the kernel build, but also not really
> required here.

This is what I wanted to do, but I'm assuming the config construction happens 
far too late to add the dependency.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


