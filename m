Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA3E6041D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 20:07:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jun 2013 13:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,817,1363158000"; d="scan'208";a="349300177"
Received: from unknown (HELO [10.255.13.19]) ([10.255.13.19])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2013 13:06:58 -0700
Message-ID: <51B0EBE2.3020909@linux.intel.com>
Date: Thu, 06 Jun 2013 13:06:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Felipe Tonello <eu@felipetonello.com>
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
	<2054363.UxqkIOrzAJ@helios> <51AF6ED5.4010500@linux.intel.com>
	<14899581.O0scG6jzAS@helios>
	<CAGrhNMzSY-ow4PNzscD31qSW8st1tv9Fjmc9Xxx_Oqa2CjsuJA@mail.gmail.com>
In-Reply-To: <CAGrhNMzSY-ow4PNzscD31qSW8st1tv9Fjmc9Xxx_Oqa2CjsuJA@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jun 2013 20:07:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2013 12:18 PM, Felipe Tonello wrote:
> On Thu, Jun 6, 2013 at 2:54 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Wednesday 05 June 2013 10:01:09 Saul Wold wrote:
>>> On 06/05/2013 09:57 AM, Paul Eggleton wrote:
>>>> On Wednesday 05 June 2013 09:46:49 Saul Wold wrote:
>>>>> On 06/05/2013 02:30 AM, Martin Jansa wrote:
>>>>>> On Wed, Jun 05, 2013 at 07:01:50PM +1000, Jonathan Liu wrote:
>>>>>>> qconfig.pri was not being loaded by qmake properly. This means Qt
>>>>>>> qmake projects are unable to query QT_ARCH, QT_VERSION and other
>>>>>>> variables defined in qconfig.pri.
>>>>>>>
>>>>>>> Export OE_QMAKE_QT_CONFIG, setting it to the location of qconfig.pri
>>>>>>> so that it can be located by qmake.
>>>>>>
>>>>>> There is such patch already:
>>>>>> http://lists.openembedded.org/pipermail/openembedded-core/2013-May/07831
>>>>>> 4.
>>>>>> html
>>>>>
>>>>> Got lost in my queue, adding it for the next MUT.
>>>>
>>>> FWIW I am still concerned by the assertion in the commit message about it
>>>> causing undesirable behaviour. I'd want that checked out and the note
>>>> removed before we look at merging this.
>>>
>>> OK, I will shelf this until I hear more about the testing of this change
>>> regarding the original patch's note.
>>
>> So I tested a rebuild of qt4-x11-free with Felipe's patch and two of
>> Jonathan's ("qt4: fix QMAKE_QT_CONFIG being overwritten with empty value" and
>> "classes/qmake_base: allow parallel make"), and did not observe any unexpected
>> behaviour and buildhistory looks clean for qt itself and fotowall/quicky. So
>> I'd say feel free to throw these into MUT, but I think we need to drop the
>> note.
>>
>
> Awesome.

So can someone put a final updated patch series together.  I am still 
not sure about Jonathans's allow parallel make change, it seemed to have 
the -j option since it's added with a _prepend which is not overriden by 
the = assignment.

Sau!

>
> Thank you,
> Felipe
>
>

