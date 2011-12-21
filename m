Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RdD9c-00037E-Eq
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 04:47:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Dec 2011 19:40:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98622516"
Received: from unknown (HELO envy.home) ([10.255.12.104])
	by fmsmga001.fm.intel.com with ESMTP; 20 Dec 2011 19:40:37 -0800
Message-ID: <4EF15524.4030509@linux.intel.com>
Date: Tue, 20 Dec 2011 19:40:20 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324121806.git.otavio@ossystems.com.br>
	<20d7007632dde53f3a868e8374a45619319213c2.1324121807.git.otavio@ossystems.com.br>
	<4EF150A1.60404@linux.intel.com>
	<CAP9ODKrTMaJugUXTTQYWS0N_S-13jDXCvJ9aP4HL0hjhZYdZgg@mail.gmail.com>
In-Reply-To: <CAP9ODKrTMaJugUXTTQYWS0N_S-13jDXCvJ9aP4HL0hjhZYdZgg@mail.gmail.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH 1/1] connman: disable 'alg-test' building
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
X-List-Received-Date: Wed, 21 Dec 2011 03:47:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 12/20/2011 07:28 PM, Otavio Salvador wrote:
> On Wed, Dec 21, 2011 at 01:21, Darren Hart <dvhart@linux.intel.com
> <mailto:dvhart@linux.intel.com>> wrote:
> 
>     (I understand this is poky related and not oe-core, but as the context
>     for this patch is here, I opted to continue the discussion here.)
> 
> 
> It seems you haven't applied the patch as it shows the message that the
> patch clearly remove.

I did have the commit in my source tree, but something didn't trigger as
a cleanall and rebuild of connman succeeded. The tree was a clean
master, perhaps my sstate had a previous PR=r6 from our earlier testing
or something like that. Strange.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


