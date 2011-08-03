Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qoin0-0001xC-0g
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:15:42 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qoiim-0005pA-F1 from Tom_Rini@mentor.com ;
	Wed, 03 Aug 2011 14:11:20 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 3 Aug 2011 14:11:14 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 3 Aug 2011 14:11:14 -0700
Message-ID: <4E39B95F.8030108@mentor.com>
Date: Wed, 3 Aug 2011 14:10:55 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, Saul Wold <sgw@linux.intel.com>
References: <cover.1311807353.git.tom_rini@mentor.com>	<7954213.WCcvt5c9xE@perseus>	<4E3496FB.7050605@mentor.com>	<1651296.NY6EmKFV0b@perseus>
	<4E35A9F1.701@mentor.com> <4E36DF12.1060208@mentor.com>
In-Reply-To: <4E36DF12.1060208@mentor.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 03 Aug 2011 21:11:14.0620 (UTC)
	FILETIME=[E0D29FC0:01CC5221]
Subject: Re: [PATCH 2/9] tcl: Add tcl_cv_api_serial to siteinfo
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
X-List-Received-Date: Wed, 03 Aug 2011 21:15:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 08/01/2011 10:14 AM, Tom Rini wrote:
> On 07/31/2011 12:16 PM, Tom Rini wrote:
>> On 07/30/2011 05:56 PM, Khem Raj wrote:
>>> On Saturday, July 30, 2011 04:42:51 PM Tom Rini wrote:
>>>> On 07/30/2011 10:33 AM, Khem Raj wrote:
>>>>> On Wednesday, July 27, 2011 03:56:46 PM Tom Rini wrote:
>>>>>> This comes from oe.dev which had this set for arm-linux only.  Bump PR
>>>>>> since this changes how builds happen.
>>>>>
>>>>> if you are clubbing them in right site files then this variable is for
>>>>> deciding what serial API(termios or termio or sgtty) to use its not
>>>>> dependent on libc imo.
>>>>
>>>> Where do you think it should go?  common-linux?
>>> yes
>>
>> k, I'll v2 just this patch, tomorrow.
> 
> OK,
> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-siteinfo-round-2-v2
> and
> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/commit/?h=trini/update-siteinfo-round-2-v2&id=d8f714075dcbe37ef21b17639f91a8faeb868bf1
> in particular.

Due to not paying enough attention, I had pushed only a partial branch
to the v2 branch.  v3 has everything, really.

-- 
Tom Rini
Mentor Graphics Corporation


