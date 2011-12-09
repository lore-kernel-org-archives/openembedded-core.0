Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RZ66i-0006my-Ei
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:27:45 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2011 11:20:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94472207"
Received: from unknown (HELO envy.home) ([10.255.12.30])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2011 11:20:49 -0800
Message-ID: <4EE25FA0.2050500@linux.intel.com>
Date: Fri, 09 Dec 2011 11:21:04 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<e27fba3b38877fb7420c58a3e35cdbcef1cb767a.1323358819.git.otavio@ossystems.com.br>
	<4EE25E38.3060704@linux.intel.com>
	<CAP9ODKpr=xgxfJcrzsbv8q+VQh8oQOdKjQurev7hVjiMAv1PkA@mail.gmail.com>
In-Reply-To: <CAP9ODKpr=xgxfJcrzsbv8q+VQh8oQOdKjQurev7hVjiMAv1PkA@mail.gmail.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH 2/3] dosfstools: update native to 2.11
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
X-List-Received-Date: Fri, 09 Dec 2011 19:27:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 12/09/2011 11:17 AM, Otavio Salvador wrote:
> On Fri, Dec 9, 2011 at 17:15, Darren Hart <dvhart@linux.intel.com
> <mailto:dvhart@linux.intel.com>> wrote:
> 
>     What are these licensing issues, and are they no longer an issue?
> 
> 
> Newer dosfstools is GPLv3.

So pulling this in would mean we can't build live images when building
non GPLv3 images? We are looking to revamp the image creation, but until
then I can't agree to this.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


