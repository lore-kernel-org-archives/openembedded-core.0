Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UboeM-0004DL-If
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:02:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 13 May 2013 01:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,660,1363158000"; d="scan'208";a="333137872"
Received: from unknown (HELO [10.255.12.238]) ([10.255.12.238])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2013 01:44:18 -0700
Message-ID: <5190A7E2.2000804@linux.intel.com>
Date: Mon, 13 May 2013 11:44:18 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<3529451.hQA8zCVn47@helios> <51909DB8.3060407@linux.intel.com>
	<11599561.3zUhJSzPUZ@helios>
In-Reply-To: <11599561.3zUhJSzPUZ@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Mon, 13 May 2013 09:03:11 -0000
X-List-Received-Date: Mon, 13 May 2013 09:03:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/13/2013 11:33 AM, Paul Eggleton wrote:
> On Monday 13 May 2013 11:00:56 Saul Wold wrote:
>> On 05/12/2013 10:55 PM, Paul Eggleton wrote:
>>> On Sunday 12 May 2013 19:54:50 Phil Blundell wrote:
>>>> On Sun, 2013-05-12 at 08:40 -0700, Saul Wold wrote:
>>>>> On 05/12/2013 06:27 AM, Otavio Salvador wrote:
>>>>>> I think so, it'd be good to have it in oe-core and allow use of vpn :)
>>>>>
>>>>> I would like to see what the full dependency set looks like for these,
>>>>> clearly there is the vpnc, openvpn, l2tp and pptp recipes, but what else
>>>>> and what licenses are they under.
>>>>
>>>> I don't think we necessarily want openvpn, l2tpd and suchlike in
>>>> oe-core.  None of those things seem very "core" to me (in an embedded
>>>> context) and testing them seems like it would be a bit of a challenge.
>>>
>>> I agree, these don't belong in OE-Core. We already have them in meta-
>>> networking.
>>
>> This is what I get for replying to an email while traveling overseas and
>> not being 100% clear about my points.
>>
>> I was more interested in the dependencies then actually thinking about
>> including them in OE-Core,that was not my intent.
>>
>> This would would allow us to better understand if those recipes not in
>> meta-networking could be moved from meta-oe to meta-networking.
>> Currently, I think vpnc and pptp are in meta-networking, not the other 2.
>
> They are all in meta-networking (xl2tpd, pptp-linux and vpnc have always been
> there, openvpn got moved in mid-April).
>
I guess I did not have the latest meta-oe, I was looking in the wrong 
place again!  Looks like this can work out.

Sau!

> Cheers,
> Paul
>


