Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SyzFb-0005sy-Bo
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 07:56:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Aug 2012 22:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="178205368"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 07 Aug 2012 22:44:23 -0700
Message-ID: <5021FD2C.4030301@intel.com>
Date: Wed, 08 Aug 2012 08:46:20 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1344258422-32173-1-git-send-email-radu.moisan@intel.com>
	<CALbNGRTBW1E6N5F0t3qaT+2BzGO9xeaXLLAFkFz6PE5dFy9=dw@mail.gmail.com>
	<CALbNGRS5mM4mTGsXUw1q+jVxtPZkPjHBGRQqpzaMfH0tx4=1gA@mail.gmail.com>
	<CALbNGRTnMpNr3RAVEWwSh2xM7d03GOd7M8e83RqaEHWZS=ZzLQ@mail.gmail.com>
In-Reply-To: <CALbNGRTnMpNr3RAVEWwSh2xM7d03GOd7M8e83RqaEHWZS=ZzLQ@mail.gmail.com>
Subject: Re: [PATCH] pango: upgrade to upstream stable 1.30.0
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
X-List-Received-Date: Wed, 08 Aug 2012 05:56:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


On 08/07/2012 11:38 PM, Andreas Müller wrote:
> On Tue, Aug 7, 2012 at 4:21 PM, Andreas Müller
> <schnitzeltony@googlemail.com> wrote:
>> On Tue, Aug 7, 2012 at 4:19 PM, Andreas Müller
>> <schnitzeltony@googlemail.com> wrote:
>>> On Mon, Aug 6, 2012 at 3:07 PM, Radu Moisan <radu.moisan@intel.com> wrote:
>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>> ---
>>>>   .../pango/pango-1.28.4/noconst.patch               |  408 --------------------
>>>>   .../multilib-fix-clean.patch                       |    0
>>>>   .../{pango-1.28.4 => pango-1.30.0}/no-tests.patch  |   14 +-
>>>>   .../pango/{pango_1.28.4.bb => pango_1.30.0.bb}     |    9 +-
>>>>   4 files changed, 10 insertions(+), 421 deletions(-)
>>>>   delete mode 100644 meta/recipes-graphics/pango/pango-1.28.4/noconst.patch
>>>>   rename meta/recipes-graphics/pango/{pango-1.28.4 => pango-1.30.0}/multilib-fix-clean.patch (100%)
>>>>   rename meta/recipes-graphics/pango/{pango-1.28.4 => pango-1.30.0}/no-tests.patch (33%)
>>>>   rename meta/recipes-graphics/pango/{pango_1.28.4.bb => pango_1.30.0.bb} (49%)
>>>>
>>> I don't know if it's supposed to, but it does not fix the pango module
>>> issue for me {1].
>>>
>>> Andreas
>>>
>>> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026919.html
>> Sorry - I am on the wrong machine forget my previous mail - will test it here.
>>
> Still manual
>
> pango-querymodules > '/etc/pango/pango.modules'
>
> is required but I don't think it is a pango issue.
I don't have much expertise with pango, but if your remark is not 
particularly related to pango upgrade, then we should have it handled in 
a separate thread, and raise a bug if appropriate.

thanks,
radu


