Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuU6v-0002i5-Vy
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:52:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2012 12:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173628062"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2012 12:41:05 -0700
Message-ID: <50119D51.6040602@linux.intel.com>
Date: Thu, 26 Jul 2012 12:41:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1207230557520.20099@oneiric>
	<50119A1B.5050403@linux.intel.com>
	<CABcZAN=ovSNo96CmpA7jygJPTxD6Vp_QE80buXQxc4x4+NnnMg@mail.gmail.com>
In-Reply-To: <CABcZAN=ovSNo96CmpA7jygJPTxD6Vp_QE80buXQxc4x4+NnnMg@mail.gmail.com>
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: libxp: Change superfluous "+=" to simple "=" when using _append
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
X-List-Received-Date: Thu, 26 Jul 2012 19:52:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2012 12:34 PM, Chris Larson wrote:
> On Thu, Jul 26, 2012 at 12:27 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 07/23/2012 02:59 AM, Robert P. J. Day wrote:
>>>
>>>
>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>
>>> ---
>>>
>>> diff --git a/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
>>> b/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
>>> index 349dad1..dbd4609 100644
>>> --- a/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
>>> +++ b/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
>>> @@ -15,7 +15,7 @@ PE = "1"
>>>
>>>    XORG_PN = "libXp"
>>>
>>> -CFLAGS_append += " -I ${S}/include/X11/XprintUtil -I
>>> ${S}/include/X11/extensions"
>>> +CFLAGS_append = " -I ${S}/include/X11/XprintUtil -I
>>> ${S}/include/X11/extensions"
>>>
>>>    SRC_URI += "file://fix-cast-error.patch"
>>>
>>>
>> Merged into OE-Core
>
> A second janitorial-type task would be to find and remove unnecessary
> uses of _append entirely. This one for example, it's highly unlikely a
> += wouldn't do the job here. :)

Mind filing that as a Janitor bug?

Sau!

>



