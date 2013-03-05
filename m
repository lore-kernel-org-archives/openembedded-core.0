Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UCvKg-0005sx-Fq
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 18:07:31 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Mar 2013 08:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,787,1355126400"; d="scan'208";a="209116625"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Mar 2013 08:50:19 -0800
Message-ID: <5136224A.90308@intel.com>
Date: Tue, 05 Mar 2013 18:50:18 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1362494304-10179-1-git-send-email-laurentiu.palcu@intel.com>
	<1362494304-10179-2-git-send-email-laurentiu.palcu@intel.com>
	<1362495026.22501.129.camel@phil-desktop.brightsign>
	<CAJTo0LbDi_P7t1Pof0UGLfKzFxnxsOi4ATR43x8KUVe9=Q44NA@mail.gmail.com>
In-Reply-To: <CAJTo0LbDi_P7t1Pof0UGLfKzFxnxsOi4ATR43x8KUVe9=Q44NA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa: rename mesa-dri recipe to just mesa
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
X-List-Received-Date: Tue, 05 Mar 2013 17:07:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks. I'll make the changes and resend. Also, I'll squash the commits
into a single one to be easily bisectable.

Laurentiu

On 03/05/2013 05:00 PM, Burton, Ross wrote:
> Man, Phil was quick today.  I'll throw away my draft and reply to this
> instead...
> 
> On 5 March 2013 14:50, Phil Blundell <pb@pbcl.net> wrote:
>>> -# for mesa-dri and mesa-xlib
>>> +# for mesa and mesa-xlib
>>>  FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
>>
>> Presumably you don't need that anymore.
> 
> I thought I had this fixed a month ago, but obviously it didn't get
> merged - probably lost in the ELC madness.
> 
>>> -# this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
>>> +# this needs to be lower than -1 because all mesa have -1 and git version has highest PV, but shouldn't be default
>>>  DEFAULT_PREFERENCE = "-2"
>>
>> Is that comment still true?
> 
> I was just saying to Laurentiu off-list that only mesa_git should have
> a preference of -1, as there isn't mesa-dri/mesa-xlib to complicate
> matters anymore.
> 
>> Also, the commit message for this patch is exceptionally terse.  Please
>> explain why this renaming is a desirable thing.
> 
> It's desirable because "dri" is redundant, there isn't any
> alternative.  It's a build of mesa, so let's call it mesa.
> 
> Ross
> 


