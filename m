Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TldCl-00054V-Ee
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 11:18:24 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Dec 2012 02:03:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,322,1355126400"; d="scan'208";a="264918873"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by fmsmga001.fm.intel.com with ESMTP; 20 Dec 2012 02:03:12 -0800
Message-ID: <50D2E3B9.7080506@intel.com>
Date: Thu, 20 Dec 2012 12:08:57 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50D1F76D.4070000@intel.com> <20121219215749.1c511d83@eb-e6520>
	<50D2D1BD.20402@intel.com>
In-Reply-To: <50D2D1BD.20402@intel.com>
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
X-List-Received-Date: Thu, 20 Dec 2012 10:18:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


On 12/20/2012 10:52 AM, Radu Moisan wrote:
>
> On 12/19/2012 10:57 PM, Eric Bénard wrote:
>> Hi,
>>
>> Le Wed, 19 Dec 2012 19:20:45 +0200,
>> Radu Moisan <radu.moisan@intel.com> a écrit :
>>>       I have prepared a branch on poky-contrib (rmoisan/systemd) 
>>> where I
>>> pulled systemd from meta-openembedded. The goal is to merge this into
>>> oe-core, so please take a look and give me your feedback on stuff that
>>> needs work or things that I might have done wrong, so that I can 
>>> prepare
>>> it for merge.
>> a nitpick :
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd&id=02f4027f7ccddaff3b0316962e7a86a04d31abbc 
>>
>> here you add that to lighttpd recipe :
>> + file://lighttpd_fix_for_automake-1.12.patch \
>> + file://lighttpd.service
>> but you don't add the patch
>>
>> then here (several patches later)
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd&id=0b6a5d3f998d2f1bb346c403d512c33ee93052fb 
>>
>> you fix that :
>> - file://lighttpd_fix_for_automake-1.12.patch \
> that was a regression I introduced when I rebased on master a while 
> back. I'll squash it with the initial commit.
     It just got clearer what happened here. So, there was a regression, 
systemd related changes were missing after rebase. However with automake 
patch something alse happened.  Since my initial commit, lighttpd was 
updated to 1.4.32 and it didn't need that patch anymore, so it got 
removed. When I rebased, the patch was removed but the inclusion in .bb 
file didn't so I got an error, which I had to fix.
     For consistency, I'll squash systemd related changes back into the 
first commit, but the removal of automake patch will stay in this last 
patch.

> Radu
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



