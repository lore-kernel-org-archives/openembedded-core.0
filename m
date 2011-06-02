Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QSBN0-0003rl-HI
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 19:07:42 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QSBJu-0004Uv-7P from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 10:04:30 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 2 Jun 2011 10:00:51 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 2 Jun 2011 10:04:29 -0700
Message-ID: <4DE7C29A.2030609@mentor.com>
Date: Thu, 2 Jun 2011 10:04:26 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1306944074.2529.107.camel@phil-desktop>	<1306944235.2529.109.camel@phil-desktop>	<5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>	<1306945014.2529.113.camel@phil-desktop>	<4DE66D53.30505@windriver.com>	<1306947245.2529.148.camel@phil-desktop>	<4DE66FC6.4030607@windriver.com>	<1306959728.3119.5.camel@lenovo.internal.reciva.com>	<4DE6B685.6060501@mentor.com>	<20110601220659.GA4601@rhein.zuhause.netz>	<4DE6BBC2.5070509@mentor.com>
	<1307005695.2529.164.camel@phil-desktop>
In-Reply-To: <1307005695.2529.164.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 02 Jun 2011 17:00:51.0657 (UTC)
	FILETIME=[A0D3E390:01CC2146]
Subject: Re: dbus-native --with-x
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
X-List-Received-Date: Thu, 02 Jun 2011 17:07:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/02/2011 02:08 AM, Phil Blundell wrote:
> On Wed, 2011-06-01 at 15:22 -0700, Tom Rini wrote:
>> On 06/01/2011 03:07 PM, Henning Heinold wrote:
>>> On Wed, Jun 01, 2011 at 03:00:37PM -0700, Tom Rini wrote:
>>>> On 06/01/2011 01:22 PM, Phil Blundell wrote:
>>>>> On Wed, 2011-06-01 at 11:58 -0500, Mark Hatle wrote:
>>>>>> It "should" be as simple and adding --without-perl and --without-python to the
>>>>>> configuration line...  but I haven't tried it.
>>>>>
>>>>> Turns out that rpm-native already does this, but (like the dbus case)
>>>>> there is no matching logic to get the DEPENDS right.
>>>>>
>>>>> Another instance of a similar thing appears to be sqlite3-native, which
>>>>> DEPENDS on tcl-native even though it's configured --without-tcl.
>>>>
>>>> Since this keeps coming up, maybe it needs a comment.  sqlite3 needs
>>>> tcl-native (tclsh) to generate a header file.  No tclsh, no sqlite3.
>>>
>>> I thought that is diffrent with 3.7.x version of sqlite3.
>>
>> Nope.  That's what I checked this against.  In oe.dev
>> a2c3af2d608b1b713018d688b00e03873a538993 is where we set all of this right.
> 
> Actually, it looks to me like Henning is right.  In 3.7.6.2, which seems
> to be what we have in oe-core right now, I can't find any trace of the
> old tcl script that was being used for header generation.  Which file(s)
> did you find the tcl requirement in?

I guess I've just gone crazy (or crazier if you prefer) and I can't find
it anymore in 3.7.x.

-- 
Tom Rini
Mentor Graphics Corporation


