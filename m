Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TleTK-0007UG-UX
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 12:39:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Dec 2012 03:24:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,322,1355126400"; d="scan'208";a="267645288"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2012 03:24:43 -0800
Message-ID: <50D2F6D4.5080001@intel.com>
Date: Thu, 20 Dec 2012 13:30:28 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <50D1F76D.4070000@intel.com>
	<20121220104241.GG14543@jama.palm1.palmone.com>
In-Reply-To: <20121220104241.GG14543@jama.palm1.palmone.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
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
X-List-Received-Date: Thu, 20 Dec 2012 11:39:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 12/20/2012 12:42 PM, Martin Jansa wrote:
> On Wed, Dec 19, 2012 at 07:20:45PM +0200, Radu Moisan wrote:
>> Hi guys,
>>       I have prepared a branch on poky-contrib (rmoisan/systemd) where I
>> pulled systemd from meta-openembedded. The goal is to merge this into
>> oe-core, so please take a look and give me your feedback on stuff that
>> needs work or things that I might have done wrong, so that I can prepare
>> it for merge.
>>       At this point core-image-minimal and core-image-sato both boot fine
>> with systemd. There still are a few warnings but not critical(at
>> runtime), at least in my opinion, you may want to take a look at those too.
>>       You can activate systemd by *DISTRO_FEATURES_INITMAN = "systemd"*
> What about upgrade path from meta-systemd?
>
> I've noticed that
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/meta/recipes-connectivity/wpa-supplicant?h=rmoisan/systemd&id=02f4027f7ccddaff3b0316962e7a86a04d31abbc
> does not increment PR at all while
> http://git.openembedded.org/meta-openembedded/tree/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
> PRINC := "${@int(PRINC) + 2}"
I'll take care of this one.
>
> Also I like this commit very much
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/meta/recipes-connectivity/wpa-supplicant?h=rmoisan/systemd&id=216049b154799fc7984c54858a386d7318f99ce0
> but current styleguide thinks something else about consistent whitespace
> usage. So I think this wont be accepted as my change to styleguide
> wasn't.
I think Richard suggested it, but anyway wasn't the recomandation to use 
spaces instead of tabs (I use 4 spaces)? I can revert or change it when 
time comes. Feedback on this will be well appreciated.
> And last thing:
> there is few pending patches for meta-systemd:
> http://patchwork.openembedded.org/project/oe/list/?q=systemd
> Can you check them and merge them if needed? Or will you update your
> systemd* copies if we merge them in meta-oe?
These look very interesting. I'll take a closer look and pull them in as 
appropriate.

Radu


