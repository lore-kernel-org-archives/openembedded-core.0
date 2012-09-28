Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1THaE5-0004o8-LA
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 15:03:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2012 05:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,502,1344236400"; d="scan'208";a="150260900"
Received: from costin-desktop (HELO [10.237.105.60]) ([10.237.105.60])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2012 05:50:24 -0700
Message-ID: <5065904E.9080208@intel.com>
Date: Fri, 28 Sep 2012 14:55:58 +0300
From: Constantin Musca <constantinx.musca@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1348820316-20012-1-git-send-email-constantinx.musca@intel.com>
	<CAJTo0LaDts7hbUCELdCvJ-Gbt1bcO-rQuYGPk744r-wUP1EFwA@mail.gmail.com>
	<50656473.2040409@intel.com>
	<CAJTo0Lb7bqrjKDr-cQLSuKB2bsKoNo=zbzd3WC9cq16bKmu7LQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lb7bqrjKDr-cQLSuKB2bsKoNo=zbzd3WC9cq16bKmu7LQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libnss-mdns: fix mDNS resolving speed
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
X-List-Received-Date: Fri, 28 Sep 2012 13:03:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/28/2012 12:46 PM, Burton, Ross wrote:
> On 28 September 2012 09:48, Constantin Musca
> <constantinx.musca@intel.com> wrote:
>>> Have you tested this works?  Last time I saw this worked on
>>> (Christian, iirc) the "solution" wasn't actually working.
>> I tested it pinging a host.local and it works. What else should I test ?
> Check that there is a speed improvement - before it would attempt a
> DNS lookup so I'd have a couple of seconds waiting before the quick
> mDNS lookup.  With the fix all .local domains should be very quick on
> the first resolution.
>
> Ross

Tests:

1. Without fix:
real     0m4.461s
user    0m0.034s
sys      0m0.086s

2. With fix:
real    0m0.842s
user   0m0.066s
sys     0m0.122s

As you can see, there is a speed improvement.

Cheers,
Constantin





