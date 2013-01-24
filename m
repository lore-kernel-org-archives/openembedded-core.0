Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TyLnB-0000tT-Ic
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:20:31 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jan 2013 04:04:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,529,1355126400"; d="scan'208";a="276061744"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2013 04:04:52 -0800
Message-ID: <510124FE.6040901@intel.com>
Date: Thu, 24 Jan 2013 14:11:42 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <50FFFF81.8010203@communistcode.co.uk> <510102F4.70108@intel.com>
	<CAJTo0LZfGGSdQwKMshr8PNUVZfk4Nwhr67-9iFbGw2=V=YqN8g@mail.gmail.com>
In-Reply-To: <CAJTo0LZfGGSdQwKMshr8PNUVZfk4Nwhr67-9iFbGw2=V=YqN8g@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 24 Jan 2013 12:20:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 01/24/2013 02:01 PM, Burton, Ross wrote:
> On 24 January 2013 09:46, Radu Moisan <radu.moisan@intel.com> wrote:
>> Possibly because /run was a link created by the initscripts which are now
>> disabled when systemd is the init manager. I'll look into this and update
>> 00-create-volatile.conf so that systemd will handle the link creation in
>> stead.
> I wonder how my images booted...  initscripts is sysvinit specific,
> the systemd startup should handle this somehow.
>
> (insert standard argument that we should adopt /run across all init systems)
>
This is exactly what I was looking for. /run shouldn't be there, yet 
somehow it is. I was looking into how/where systemd is creating /run but 
no lead for now.

Radu


