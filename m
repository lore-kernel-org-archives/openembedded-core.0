Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Sm8Zl-0004sF-Me
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 21:15:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 12:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="161070836"
Received: from unknown (HELO envy.home) ([10.255.13.50])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2012 12:04:50 -0700
Message-ID: <4FF341FA.5070507@linux.intel.com>
Date: Tue, 03 Jul 2012 12:03:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <441e9c9457b3f888162fe83793df551a6ee97697.1341259773.git.dvhart@linux.intel.com>
	<CAMKF1srEBy_rLPp_DGr9zQ9WwRqma5JX6qRd6szBPQOf-AOv1A@mail.gmail.com>
	<4FF242B8.1000401@linux.intel.com> <4FF274EC.7030005@gmail.com>
In-Reply-To: <4FF274EC.7030005@gmail.com>
X-Enigmail-Version: 1.4.2
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [RFC PATCH] grub-efi: Do not use help2man
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
X-List-Received-Date: Tue, 03 Jul 2012 19:15:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 07/02/2012 09:28 PM, Khem Raj wrote:
> On 7/2/2012 5:54 PM, Darren Hart wrote:
>> I added HELP2MAN='true' to EXTRA_OECONF and it failed in the
>> same way.
> 
> 
> hmmm export it I dont know passing in extra_oeconf will work

OK, I wasn't sure how to gurantee an environment export to
autotools_do_configure from the grub-efi recipe, so as a test I just
added the assignment to the top of autotools_do_configure() directly:

export HELP2MAN='true'

Building grub-efi-i586-native fails in the same way.

I didn't see anything in the configure script that suggested to be
that I could override this with an env variable - did you spot
something I missed?

- -- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJP80H6AAoJEKbMaAwKp364nVEH/Rf6E/ePZgjPuRWzxTC5IMG0
4Xwf/rzBJXwkdnRbcWoGY63x7jUN8jCgLhYEPmFDQerB6nMstCrWp4gcc/4AADdK
SGcPFT7XKa+cOA95uAFRj96SAM6S63IojFQh0Oi98xJB6Hqc3iOIrmCwmCsDn9lM
ts5DDSCN5x5GAS6XJL0B63shcft9eeaeaQzx/nnZPQbRnGxZRazbTWIDnaPI6gqI
Cs7Jz6BwV5eczk4iSzNtjAjnGWeTvou3bp//rni+qMcKgttuj6nKMEc60IAQC/h3
WXsdsODq+ZHRJQRFYzdVOMXtBg6fiSZa4nV1hy7ppeBzEVh7JgfP/Ou3OZT+NMQ=
=ywCB
-----END PGP SIGNATURE-----


