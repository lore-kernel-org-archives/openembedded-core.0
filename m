Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RsJTW-00058P-T1
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 20:34:43 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Jan 2012 11:26:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="102355537"
Received: from unknown (HELO envy.home) ([10.255.14.180])
	by orsmga001.jf.intel.com with ESMTP; 31 Jan 2012 11:26:47 -0800
Message-ID: <4F28405A.7090902@linux.intel.com>
Date: Tue, 31 Jan 2012 11:26:18 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F24F822.1010102@emagii.com>
	<1327974653.1334.0.camel@localhost.localdomain>
	<CAMKF1soXjPuoroZR5kkvzD5vT+QXy-==peaSa+hV2Xore+E_VA@mail.gmail.com>
	<07E1C9D5-7CD1-4A0F-8C0A-0916826E7935@dominion.thruhere.net>
	<CAMKF1sqhkRdWYDuHwq_4tSgdwvskBSLe94o5DTUnK6BzPZG7Cw@mail.gmail.com>
In-Reply-To: <CAMKF1sqhkRdWYDuHwq_4tSgdwvskBSLe94o5DTUnK6BzPZG7Cw@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: module.init-tools-3.16.tar.bz2 no longer available at kernel.org
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
X-List-Received-Date: Tue, 31 Jan 2012 19:34:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/31/2012 12:58 AM, Khem Raj wrote:
> On Mon, Jan 30, 2012 at 11:57 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>
>> Like the one in meta-oe? http://cgit.openembedded.org/meta-openembedded/commit/?id=2292ac565c220f2112a07abd563c6a9ee34dc662
> 
> slightly better ;) Since I was intending to replace complete
> module-init-tools (including cross recipes) with kmod.
> 
> have a look at top 3 patches on
> 
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc-fixes

Hi Khem,

For kmod-cross and kmod-native, I thought the agreed upon PR bump method
was something like:

PR := "${@int(INC_PR) + 1}"

Was it not?

kmod.inc does "gtkdocize --docdir....", but I don't see a DEPENDS to
ensure gtkdocize exists.

Looking forward to seeing these in oe-core.

--
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


