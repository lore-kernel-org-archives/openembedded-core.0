Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Puqtd-0005wj-HG
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:35:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p22IXngQ001075
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Mar 2011 10:33:49 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 2 Mar 2011 10:33:48 -0800
Message-ID: <4D6E8D8B.7030906@windriver.com>
Date: Wed, 2 Mar 2011 12:33:47 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.14) Gecko/20110221 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4D6E7EB1.5080602@windriver.com> <1299088802.26736.10715.camel@rex>
	<BED5DD21-1E73-4DB2-9E29-17E70DF7344C@dominion.thruhere.net>
In-Reply-To: <BED5DD21-1E73-4DB2-9E29-17E70DF7344C@dominion.thruhere.net>
X-Originating-IP: [172.25.36.227]
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Wed, 02 Mar 2011 18:35:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 3/2/11 12:27 PM, Koen Kooi wrote:
> 
> Op 2 mrt 2011, om 19:00 heeft Richard Purdie het volgende geschreven:
> 
>> Thanks for starting this thread Mark, I've also just been looking at
>> this question so its timely.
>>
>> On Wed, 2011-03-02 at 11:30 -0600, Mark Hatle wrote:
>>> I finally got a chance to look at the oe-core and where it currently is..  Some
>>> suggestions below:
>>>
>>> LICENSE file, this may need to be cleaned up to only cover the components
>>> actually in the oe-core.
>>>
>>> README likely needs some revision
>>>
>>> README.hardware needs a lot of revision.  Anything outside of support for QEMU
>>> should be removed.
>>>
>>> The meta-demoapps and meta-rt components, will those be staying or going?
>>>
>>> The meta/recipes.txt needs to be verified as still what we want -- I assume it
>>> is at this point..
>>>
>>> meta/recipes-...  sato, qt, gnome, I thought were going elsewhere?
>>>
>>> Do the items in the "scripts" need to be renamed or is Poky being kept in the
>>> naming?  Same with the poky-init-build-env?
>>>
>>> Then I also assume the items in the documentation directory need to be cleaned
>>> up as well...
>>>
>>> Let me know what you'd like me to try and tackle -- or if we need to bring these
>>> items up at the TSC for recommendation.
>>
>> I'm proposing this change so far:
>>
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/roorg&id=891ad22536b49d4fee066a5865ad730f791d36e9
>>
>> with those relocated files being removed from oe-core. Any objections to
>> that to start with? 
> 
> Why not put the recipes in meta-oe? I have need for e.g eds-dbus and would like to have that in meta-oe.

If it's acceptable within meta-oe (I don't see why this wouldn't be) it
certainly can be added there as well.. however, I was assuming the default was
meta-yocto and it not going into meta-oe until a separate merge step, process,
etc..  meta-oe would be made up of the existing OE components (not in core)
initially...

--Mark

> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



