Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QK2Fo-0006dV-L6
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 07:46:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 May 2011 22:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="434093004"
Received: from unknown (HELO [10.255.12.71]) ([10.255.12.71])
	by azsmga001.ch.intel.com with ESMTP; 10 May 2011 22:43:49 -0700
Message-ID: <4DCA221D.8060506@linux.intel.com>
Date: Tue, 10 May 2011 22:43:57 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1305053706-19572-1-git-send-email-tom_rini@mentor.com>
	<BANLkTin42LTK6D9ui-C_SXmWiNLAz1T66Q@mail.gmail.com>
In-Reply-To: <BANLkTin42LTK6D9ui-C_SXmWiNLAz1T66Q@mail.gmail.com>
Subject: Re: [PATCH] create-pull-request: Add -l location switch
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
X-List-Received-Date: Wed, 11 May 2011 05:46:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/10/2011 12:18 PM, Otavio Salvador wrote:
> On Tue, May 10, 2011 at 15:55, Tom Rini <tom_rini@mentor.com> wrote:
>> Add a -l switch that takes an argument of either github or gitorious
>> and will make the cover letter have a fill-in-the-blank of where the
>> changes are on either github or gitorious.
> 
> Another possibility would be to use git config interface to store
> those. You might have something like:
> 
> [oe-core-pull-request]
> mode = github
> user = foo
> 
> or
> 
> [oe-core-pull-request]
> mode = gitorious
> user = bar
> 
> This could be used to fill the fields in a proper way since those are
> predictable.

I was going to suggest something similar.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


