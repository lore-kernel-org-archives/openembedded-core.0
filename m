Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1THbro-0000qz-WE
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 16:48:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8SEZeWU007274
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2012 07:35:40 -0700 (PDT)
Received: from msp-dhcp5.wrs.com (172.25.34.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 28 Sep 2012 07:35:40 -0700
Message-ID: <5065B5BB.6080108@windriver.com>
Date: Fri, 28 Sep 2012 09:35:39 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348485983-8294-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<1348486253.31293.28.camel@phil-desktop>
	<506054A0.6090309@intel.com>
	<1348825951.32611.30.camel@phil-desktop>
	<5065ACC4.7080505@windriver.com>
	<1348840977.32611.51.camel@phil-desktop>
In-Reply-To: <1348840977.32611.51.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Fix for dynamic linker broken offset
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
X-List-Received-Date: Fri, 28 Sep 2012 14:48:37 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/12 9:02 AM, Phil Blundell wrote:
> On Fri, 2012-09-28 at 08:57 -0500, Mark Hatle wrote:
>> On 9/28/12 4:52 AM, Phil Blundell wrote:
>>> On Mon, 2012-09-24 at 15:40 +0300, Andrei Dinu wrote:
>>>> On 09/24/2012 02:30 PM, Phil Blundell wrote:
>>>>> On Mon, 2012-09-24 at 14:26 +0300, Andrei Dinu wrote:
>>>>>> +-	    *reloc_addr += sym->st_value;
>>>>>> ++	    *reloc_addr = sym->st_value;
>>>>> That patch looks slightly dubious to me.  Are you sure this doesn't
>>>>> introduce any regressions elsewhere?
>>>>>
>>>> I have insufficient data to affirm that it doesn't introduces regressions.
>>>
>>> Presumably it does at least pass the eglibc and binutils testsuites,
>>> right?
>>
>> That patch is a workaround for an ARM issue related to thread local storage and
>> TLS offsets during runtime and prelinking.
>>
>> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=1443
>>
>> Note, this is simply a workaround and not a final solution as it hasn't been
>> vetted upstream.
>
> Right, I understand that.  But this doesn't really answer the question
> "does the workaround break anything else?".

In my testing no.  But I never integrated it with OE, so I never ran the test 
suite Khem was referring to.

--Mark

> p.
>
>



