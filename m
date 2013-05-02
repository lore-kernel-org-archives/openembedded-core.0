Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UXyL1-0000UM-Rn
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 20:34:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 May 2013 11:16:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,597,1363158000"; d="scan'208";a="327830587"
Received: from unknown (HELO [10.255.12.170]) ([10.255.12.170])
	by fmsmga001.fm.intel.com with ESMTP; 02 May 2013 11:16:44 -0700
Message-ID: <5182AD8C.4080006@linux.intel.com>
Date: Thu, 02 May 2013 11:16:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1367325004-7740-1-git-send-email-schnitzeltony@googlemail.com>
	<1367325004-7740-3-git-send-email-schnitzeltony@googlemail.com>
	<51816D8B.2020102@linux.intel.com> <1367513549.5379.133.camel@ted>
In-Reply-To: <1367513549.5379.133.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH/v2 3/3] core-image-sato: add udev-extraconf
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
X-List-Received-Date: Thu, 02 May 2013 18:34:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/02/2013 09:52 AM, Richard Purdie wrote:
> On Wed, 2013-05-01 at 12:31 -0700, Saul Wold wrote:
>> On 04/30/2013 05:30 AM, Andreas Müller wrote:
>>> as discussed in [1-2]
>>>
>>> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/039025.html
>>> [2] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/039027.html
>>>
>>> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
>>> ---
>>>    meta/recipes-sato/images/core-image-sato.bb |    2 +-
>>>    1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
>>> index e3246d2..76abb17 100644
>>> --- a/meta/recipes-sato/images/core-image-sato.bb
>>> +++ b/meta/recipes-sato/images/core-image-sato.bb
>>> @@ -8,4 +8,4 @@ LICENSE = "MIT"
>>>
>>>    inherit core-image
>>>
>>> -IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
>>> +IMAGE_INSTALL += "packagegroup-core-x11-sato-games udev-extraconf"
>>>
>>
>> I believe that we should also have the udev-extraconf added to the
>> core-image-lsb, I will add a follow-on patch for that.
>
> I'll take changes removing the core dependency however I think one of
> the packagegroups ideally needs this addition, not such which one
> though.
>

After looking at this again, I think it might be more complex, do we 
want the extraconf files unconditionally in for both sysvinit and 
systemd?  There are 2 packagegroups where it would make sense to have 
them for sysvinit based system to have similar behavior as before 
systemd:  packagegroup-core-basic (which feeds the lsb images) and 
packagegroup-core-x11-sato.  It may need to be anonymous code that 
checks for systemd as the udev provider.

Thoughts?

Sau!

> Cheers,
>
> Richard
>
>
>


