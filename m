Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TyMbb-0005pl-0u
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 14:12:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Jan 2013 04:57:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,529,1355126400"; d="scan'208";a="247893925"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 24 Jan 2013 04:57:00 -0800
Message-ID: <51013136.7040807@intel.com>
Date: Thu, 24 Jan 2013 15:03:50 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50FFFF81.8010203@communistcode.co.uk> <510102F4.70108@intel.com>
	<CAJTo0LZfGGSdQwKMshr8PNUVZfk4Nwhr67-9iFbGw2=V=YqN8g@mail.gmail.com>
	<510124FE.6040901@intel.com>
	<lyd2wug4c0.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51012A68.806@intel.com>
	<ly8v7ig2td.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <ly8v7ig2td.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Thu, 24 Jan 2013 13:12:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 01/24/2013 02:53 PM, Enrico Scholz wrote:
> Radu Moisan <radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> writes:
>
>>> /run is part of systemd's api and mounted very early internally by
>>> systemd.  This mountpoint must exist in the filesystem and it will
>>> probably not work when it is symlink into /var/volatile which gets
>>> mounted later.
>> Isn't systemd looking into fstab.systemd for mount points?
> not for /run or /proc or so. In src/core/mount-setup.c there is a
> 'mount_table[]' list which is evaluated before fstab is parsed.  You
> can override this by setting $SYSTEMD_SKIP_API_MOUNTS but this will
> create other problems.
>
>
ok, thanks Enrico, this clears the picture for me.
Well then it looks like Jack's problems is coming from some other place.

Radu


