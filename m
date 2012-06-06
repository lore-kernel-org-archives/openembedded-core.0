Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ScITH-0008OB-I8
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 17:48:31 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Jun 2012 08:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108566815"
Received: from unknown (HELO [10.255.12.144]) ([10.255.12.144])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Jun 2012 08:38:02 -0700
Message-ID: <4FCF7959.3070102@linux.intel.com>
Date: Wed, 06 Jun 2012 08:38:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Valentin Popa <valentin.popa@intel.com>
References: <1338960862-17401-1-git-send-email-sgw@linux.intel.com>
	<CAJTo0LY0QBDM5O8t9tvyMxnCnFWBSM3ct7AZZU8W4YZd7Ke-Pw@mail.gmail.com>
In-Reply-To: <CAJTo0LY0QBDM5O8t9tvyMxnCnFWBSM3ct7AZZU8W4YZd7Ke-Pw@mail.gmail.com>
Subject: Re: [PATCH] gnomebase: add GNOME_COMPRESS_TYPE variable
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
X-List-Received-Date: Wed, 06 Jun 2012 15:48:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2012 03:46 AM, Burton, Ross wrote:
> On 6 June 2012 06:34, Saul Wold<sgw@linux.intel.com>  wrote:
>> Upstream Gnome projects are starting to migrate to the .xz compress format,
>> so we need to add this to allow recipes to override the default of .bz2 as
>> the upstreams make the transition.
>
> Considering all future tarballs are going to be .xz, would it make
> sense to default to .xz and fix the recipes where there isn't a .xz?
>
I think until we get a predominant number of the gnome packages updated 
there is not much point in doing that as it would require extra recipe 
edits.  I think if we can do a batch update and then switch the default 
that would make more sense.  I will leave that up to the new gnome 
recipe maintainer Valentin.

Sau!

> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


