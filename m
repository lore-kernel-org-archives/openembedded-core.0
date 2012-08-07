Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Sycq6-0006AK-VN
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 08:00:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Aug 2012 22:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="203747528"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2012 22:48:35 -0700
Message-ID: <5020ACA7.4060500@intel.com>
Date: Tue, 07 Aug 2012 08:50:31 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
	<20120803161915.399D1203B3D@gemini.denx.de>
	<501F63FF.1070401@intel.com>
	<20120806074542.A63C0203FD8@gemini.denx.de>
	<501FC96A.8000400@intel.com>
	<20120806134641.E98B3203FD8@gemini.denx.de>
	<501FD013.5040000@intel.com>
	<20120806141351.8D649203FD8@gemini.denx.de>
In-Reply-To: <20120806141351.8D649203FD8@gemini.denx.de>
Subject: Re: [PATCH][RFC] u-boot: Upgrade to upstream stable 2012.07
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
X-List-Received-Date: Tue, 07 Aug 2012 06:00:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I meant, set with the correct value. "i386-linux-" is preloaded into 
CROSS_COMPILE and then at do_compile() "gcc" is appended to it.
Is there in interest, to actually build u-boot in devshell?

Radu

On 08/06/2012 05:13 PM, Wolfgang Denk wrote:
> Dear Radu,
>
> In message <501FD013.5040000@intel.com> you wrote:
>> CROSS_COMPILE is set in EXTRA_OEMAKE which is used in oe-runmake()
>> within do_compile()
>> Running devshell is achieved in do_devshell() which is run after
>> do_patch() but before do_compile(), that's why in devshell CROSS_COMPILE
>> is not (yet) set.
> But CROSS_COMPILE _is_ set (and apparently has the value
> "i386-linux-".
>
> The problem is that PATH is not set such that it contains any such
> file as i386-linux-gcc.
>
>
> Best regards,
>
> Wolfgang Denk
>



