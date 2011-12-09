Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RZ5od-0005yn-Tr
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:09:05 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2011 11:01:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100576554"
Received: from unknown (HELO [10.255.13.9]) ([10.255.13.9])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2011 11:01:50 -0800
Message-ID: <4EE25B1E.1060603@linux.intel.com>
Date: Fri, 09 Dec 2011 11:01:50 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1322607016.git.sgw@linux.intel.com>
	<234071f22c2183ea28cda55bac8f68cb47e8f0e1.1322607016.git.sgw@linux.intel.com>
	<1323456167.25802.5.camel@mattotaupa>
	<4EE25863.20906@windriver.com>
In-Reply-To: <4EE25863.20906@windriver.com>
Subject: Re: [PATCH 06/26] xinit: Update to 1.3.1
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
X-List-Received-Date: Fri, 09 Dec 2011 19:09:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 09/12/11 10:50, Mark Hatle wrote:
> On 12/9/11 12:42 PM, Paul Menzel wrote:
>> Dear Saul,
>>
>>
>> Am Dienstag, den 29.11.2011, 15:00 -0800 schrieb Saul Wold:
>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> ---
>>>   .../xorg-app/{xinit_1.3.0.bb =>  xinit_1.3.1.bb}    |    6 +++---
>>>   1 files changed, 3 insertions(+), 3 deletions(-)
>>>   rename meta/recipes-graphics/xorg-app/{xinit_1.3.0.bb => 
>>> xinit_1.3.1.bb} (80%)
>>>
>>> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
>>> b/meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
>>> similarity index 80%
>>> rename from meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
>>> rename to meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
>>> index 08dfe12..2ddebe6 100644
>>> --- a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
>>> +++ b/meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
>>> @@ -13,11 +13,11 @@ LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=0d4b5eef75f1584ccbdc5e4a34314407"
>>>   PR = "r2"
>>
>> when upgrading recipes please remember to reset `PR` to 0. I just
>> spotted that now when looking through the “recent” changes [1].
> 
> I have not been doing that.  When I asked a while back the response I
> got was mixed and what I took from it is that PR (on a package upgrade)
> is up to the discretion of the person performing the upgrade.
> 
> If reseting to 0 is/should be the official policy, then we really need
> to document it as part of the patch/update guidelines..

My understanding is that the differing of opinion is between:
a) setting the PR = "0" in the recipe
b) deleting the PR entry from the recipe

Both of which set PR to 0, which I always understood to be 'policy'
unless there's a reason not to (usually meta-oe compatibility) but each
have their proponents for what makes most sense.

Regards,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


