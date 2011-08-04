Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1Qp07s-00054F-Kl
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:46:24 +0200
Received: by wyg30 with SMTP id 30so1545402wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 08:42:01 -0700 (PDT)
Received: by 10.227.198.73 with SMTP id en9mr880189wbb.0.1312472520940;
	Thu, 04 Aug 2011 08:42:00 -0700 (PDT)
Received: from [172.20.1.16] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id es3sm1030160wbb.23.2011.08.04.08.41.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Aug 2011 08:42:00 -0700 (PDT)
Message-Id: <6D81583F-E000-4875-9BB3-0ADFA7CC2A4D@dominion.thruhere.net>
From: Koen Kooi <koen@beagleboard.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E3AAEB3.6070907@linux.intel.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Thu, 4 Aug 2011 17:41:52 +0200
References: <1311846297-30202-1-git-send-email-koen@dominion.thruhere.net>	<1311846558.30326.420.camel@phil-desktop>
	<D489697C-D752-4255-8110-9AC1468D4D87@dominion.thruhere.net>
	<4E3AAEB3.6070907@linux.intel.com>
X-Mailer: Apple Mail (2.936)
Subject: Re: [PATCHv2] gst-plugins: partially sync packaging with OE .dev
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
X-List-Received-Date: Thu, 04 Aug 2011 15:46:24 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 4 aug 2011, om 16:37 heeft Saul Wold het volgende geschreven:

> On 07/28/2011 03:14 AM, Koen Kooi wrote:
>>
>> Op 28 jul. 2011, om 11:49 heeft Phil Blundell het volgende  
>> geschreven:
>>
>>> On Thu, 2011-07-28 at 11:44 +0200, Koen Kooi wrote:
>>>> +ALLOW_EMPTY = "1"
>>>
>>> Is that necessary?  You seem to be setting ALLOW_EMPTY_${PN}- 
>>> meta=1 in
>>> your python code anyway.
>>
>> In OE classic that was to keep ${PN} alive after all libs and apps  
>> were removed, I'm not sure we need it in OE-core.
>>
> Koen,
>
> Are you re-submitting a v2 pf this patch or do you still want it to  
> go as is?

As is would be fine for me.


