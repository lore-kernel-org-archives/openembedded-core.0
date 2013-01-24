Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TyM9U-0001rh-Fp
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:43:33 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Jan 2013 04:26:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,529,1355126400"; d="scan'208";a="276069497"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2013 04:27:58 -0800
Message-ID: <51012A68.806@intel.com>
Date: Thu, 24 Jan 2013 14:34:48 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50FFFF81.8010203@communistcode.co.uk> <510102F4.70108@intel.com>
	<CAJTo0LZfGGSdQwKMshr8PNUVZfk4Nwhr67-9iFbGw2=V=YqN8g@mail.gmail.com>
	<510124FE.6040901@intel.com>
	<lyd2wug4c0.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyd2wug4c0.fsf@ensc-virt.intern.sigma-chemnitz.de>
Subject: Re: systemd: /run directory not created
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
X-List-Received-Date: Thu, 24 Jan 2013 12:43:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 01/24/2013 02:20 PM, Enrico Scholz wrote:
> Radu Moisan <radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> writes:
>
>>>> Possibly because /run was a link created by the initscripts which
>>>> are now disabled when systemd is the init manager. I'll look into
>>>> this and update 00-create-volatile.conf so that systemd will handle
>>>> the link creation in stead.
>>> I wonder how my images booted...  initscripts is sysvinit specific,
>>> the systemd startup should handle this somehow.
>>>
>>> (insert standard argument that we should adopt /run across all init
>>> systems)
> yes; that's the best way.  Make /var/run a symlink pointing to /run.
>
>
>> This is exactly what I was looking for. /run shouldn't be there, yet
>> somehow it is. I was looking into how/where systemd is creating /run
>> but no lead for now.
> /run is part of systemd's api and mounted very early internally by
> systemd.  This mountpoint must exist in the filesystem and it will
> probably not work when it is symlink into /var/volatile which gets
> mounted later.
>
>
Isn't systemd looking into fstab.systemd for mount points?

Radu


