Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QoWKV-0001GH-F3
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 09:57:28 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2011 00:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,309,1309762800"; d="scan'208";a="34915479"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by orsmga001.jf.intel.com with ESMTP; 03 Aug 2011 00:53:03 -0700
Message-ID: <4E38FE6C.3010005@intel.com>
Date: Wed, 03 Aug 2011 15:53:16 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311682779.git.edwin.zhai@intel.com>	<73ea8ff94e4bda213df1a5a39615f4cd39899589.1311682779.git.edwin.zhai@intel.com>	<C36AA1E0-9A00-4761-9912-A3AC81367446@dominion.thruhere.net>
	<1311686782.2344.236.camel@rex>
In-Reply-To: <1311686782.2344.236.camel@rex>
Subject: Re: [PATCH 2/3] xinput-calibrator: Add 0.7.5 as new recipe
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
X-List-Received-Date: Wed, 03 Aug 2011 07:57:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Richard Purdie wrote:
>
> On Tue, 2011-07-26 at 14:53 +0200, Koen Kooi wrote:
> > This one looks suspicously like the one in meta-oe. Apart from that,
> > is it really needed in oe-core?
>
> Given that the xcalibrate extension has been removed from the xserver I
> think we're going to either need to migrate the tools like xtscal or
> adopt other tools. Certainly OE-Core should have a consistent story for
> touchscreens...
>

RP,
There is another recipe pointercal-xinput that provides script for 
calibration based on xinput_calibrator's output. So moving xinput, 
xinput_calibrator and pointercal-xinput from meta-oe to oe-core make a 
consistent story?

If no objection, I'll do this...
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


