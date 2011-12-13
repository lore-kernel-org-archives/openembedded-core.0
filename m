Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Raan7-0002pf-Mh
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 23:25:41 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Dec 2011 14:18:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="46886544"
Received: from unknown (HELO [10.255.12.219]) ([10.255.12.219])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Dec 2011 14:18:44 -0800
Message-ID: <4EE7CF44.7070207@linux.intel.com>
Date: Tue, 13 Dec 2011 14:18:44 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323807692.git.josh@linux.intel.com>
	<CAMKF1soA84UGCpx12gsTU_aL0uGSYau_=qoLDXkj9fRrhtGLmQ@mail.gmail.com>
	<4EE7B848.3070405@linux.intel.com> <5518182.4uSUpxrDi7@helios>
In-Reply-To: <5518182.4uSUpxrDi7@helios>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 4/5] clutter_git: update to 1.8.2 tag
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
X-List-Received-Date: Tue, 13 Dec 2011 22:25:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2011 01:20 PM, Paul Eggleton wrote:
> On Tuesday 13 December 2011 12:40:40 Joshua Lock wrote:
>> On 13/12/11 12:34, Khem Raj wrote:
>>> On Tue, Dec 13, 2011 at 12:24 PM, Joshua Lock<josh@linux.intel.com>
> wrote:
>>>> -SRCREV = "39db46123ed6bbbc3e6ad359a64d4d344ca9e11b"
>>>> -PV = "1.8.0+git${SRCPV}"
>>>> +# the 1.8.2 tag
>>>> +SRCREV = "9041ea42655dfc1422ce88eab931382dd400d13a"
>>>> +PV = "1.8.2+git${SRCPV}"
>>>
>>> you could also use the tag name instead of SHA for SRCREV I think
>>
>> Indeed we can, however we've seen problems which I can't recall the
>> details of in the past when doing so. Therefore I decided to avoid it
>> this time.
>
> It does work, it just forces a fetch on every parse which is not really
> desirable. It's really no hardship to use the SHA1 especially if it's
> accompanied by a comment with the corresponding tag.
>
It will also break BB_NO_NETWORK builds with a tag, because of that 
fetch lookup, to it's preferred to use the SHA SRCREV with a Tag Comment.

Sau!

> Cheers,
> Paul
>


