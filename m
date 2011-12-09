Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RZ6Uc-0007dP-2C
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:52:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Dec 2011 11:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="84120905"
Received: from unknown (HELO envy.home) ([10.255.12.30])
	by azsmga001.ch.intel.com with ESMTP; 09 Dec 2011 11:45:33 -0800
Message-ID: <4EE2656D.7090706@linux.intel.com>
Date: Fri, 09 Dec 2011 11:45:49 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<abe8db681be0a2ec0ada964957236a5f0511d746.1323358819.git.otavio@ossystems.com.br>
	<CAMKF1spMGdCj6-hU96gfvvQOgUwOerRtNGgFZk=5jDhAD96tTQ@mail.gmail.com>
	<CAP9ODKrH8hZ=fiD82vJMMopJ1grKEcZw07pPy7a1PNFtb_gq0w@mail.gmail.com>
In-Reply-To: <CAP9ODKrH8hZ=fiD82vJMMopJ1grKEcZw07pPy7a1PNFtb_gq0w@mail.gmail.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH 3/3] scripts/send-pull-request: allow sending of patches without a cover letter
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
X-List-Received-Date: Fri, 09 Dec 2011 19:52:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/09/2011 11:36 AM, Otavio Salvador wrote:
> On Fri, Dec 9, 2011 at 17:34, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     why do you want to avoid cover letter ? or is it for other layers
>     other than oe-core
> 
> 
> When it is a single patch makes no sense to send a cover letter that
> most of time we just write the same of first commit.

Well, you could just use git-send-email when there is only 1 patch. I
had considered having the tool create only a single email if there was
only 1 patch. However, in the end, I just send the cover letter with the
pull requrest and let the single patch follow. It works fine and is
consistent with the other patches, even if it is a degenerate case.

So I don't think this is necessary really, but if it works for you and
doesn't get abused, I'm fine with it. Perhaps only allowing this if
there is indeed only 1 patch would be better.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


