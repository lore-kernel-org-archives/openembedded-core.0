Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvbA1-0001cC-ND
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 22:31:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2011 13:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41078333"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2011 13:27:07 -0700
Message-ID: <4E52BB9A.2060603@linux.intel.com>
Date: Mon, 22 Aug 2011 13:27:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313993805.git.wenzong.fan@windriver.com>
	<1313999777.7620.13.camel@localhost.localdomain>
	<4E52399C.9020608@mlbassoc.com>
In-Reply-To: <4E52399C.9020608@mlbassoc.com>
Subject: Re: new feature? (for "DL_DIR")
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
X-List-Received-Date: Mon, 22 Aug 2011 20:31:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2011 04:12 AM, Gary Thomas wrote:
> On 2011-08-22 01:56, Ni Qingliang wrote:
>> Do we can assign all package be downloaded from the same path?
>>
>> I want setup one internal server to store the files in upstreamsources,
>> and all developer's PC use it but not the original package address.
>>
>
> Just add these lines to your .conf (I put them in my ${DISTRO}.conf):
> # Provide pre-staged sources
> SOURCE_MIRROR_URL ?= "file:///opt/amltd/poky/sources/"
> INHERIT += "own-mirrors"
>
> Simply point SOURCE_MIRROR_URL at your file cache.
>
You could also use PREMIRRORS in the developer's local.conf, point
PREMIRRORS for packages to your internal server (could be ftp, http or 
file when mounted via NFS).

Sau!


