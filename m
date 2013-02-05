Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U2dKj-0003dY-I6
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 08:52:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Feb 2013 23:36:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="286671169"
Received: from costin-desktop (HELO [10.237.105.152]) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2013 23:36:57 -0800
Message-ID: <5110B6CE.1050504@intel.com>
Date: Tue, 05 Feb 2013 09:37:50 +0200
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: Peter Seebach <peter.seebach@windriver.com>
References: <1359977606-15432-1-git-send-email-constantinx.musca@intel.com>
	<20130204122309.12582d0b@e6410-2> <1360020111.14071.172.camel@ted>
	<20130204172705.0e18d279@e6410-2> <1360021079.14071.174.camel@ted>
	<20130204175024.3af7b9b2@e6410-2>
In-Reply-To: <20130204175024.3af7b9b2@e6410-2>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: fix sqlite path and package missing files
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
X-List-Received-Date: Tue, 05 Feb 2013 07:52:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2013 01:50 AM, Peter Seebach wrote:
> On Mon, 4 Feb 2013 23:37:59 +0000
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>
>> Agreed. Can someone send me a patch which makes it all work please? :)
> I probably can. I think the 1.4.3 patch I sent out recently (sgw was
> looking at it, but the binaries weren't up on the downloads server yet)
> probably covers most of it, but not the case where sqlite-libdir isn't
> lib, which is probably (??) a target-only case.
>
> Can someone show me a test case where it fails, so I can add that to my
> pile of pseudo test cases, and then stare at it for a while?
>
> -s
Here's a test case:
     1. local.conf:
         MACHINE = "qemux86-64"
         require conf/multilib.conf
         MULTILIBS = "multilib:lib32"
         DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

     2. build pseudo

Cheers,
Constantin


