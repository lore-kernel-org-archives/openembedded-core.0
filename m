Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QhSAf-0004fn-DF
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 22:06:05 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QhPEy-00026Y-Rg from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 09:58:20 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 14 Jul 2011 09:58:20 -0700
Received: from [172.30.80.17] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 14 Jul 2011 09:58:19 -0700
Message-ID: <4E1F2027.5050700@mentor.com>
Date: Thu, 14 Jul 2011 09:58:15 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1310583666.git.tom_rini@mentor.com>
	<1310654527.20015.1174.camel@rex>
In-Reply-To: <1310654527.20015.1174.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 14 Jul 2011 16:58:20.0567 (UTC)
	FILETIME=[3C1EE270:01CC4247]
Subject: Re: [PATCH 0/3] siteinfo.bbclass re-merge
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
X-List-Received-Date: Thu, 14 Jul 2011 20:06:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/14/2011 07:42 AM, Richard Purdie wrote:
> On Wed, 2011-07-13 at 12:05 -0700, Tom Rini wrote:
>> Hey all,
>>
>> This is the second of two pull requests.  This doesn't depend on the first
>> request, it's just splitting changes up.  There's three changes here.  First,
>> site/ix86-common was setting the wrong value for unsigned int.  Second,
>> change perl to use SITEINFO variables rather than functions.  Third, bring
>> in the various changes in siteinfo.bbclass that have been in oe.dev.  This
>> last part will, I hope, also make dealing with multilib-specific siteinfo
>> stuff easier (also alternative ABIs like x32).
>>
>> My next step is to work on merging and verifying as much as possible
>> the site files in oe-core and oe.dev.
>>
>> The following changes since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:
>>   Saul Wold (1):
>>         libx11: ensure nativesdk uses correct DEPENDS and XCB flags
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib trini/update-siteinfo
>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-siteinfo
>>
>> Tom Rini (3):
>>   site/ix86-common: Fix ac_cv_sizeof_unsigned_char definition
>>   perl: Use SITEINFO variables not functions
> 
> I've merged these two.
> 
>>   siteinfo.bbclass: Port over oe.dev logic for site files
> 
> I'm still in the process of reviewing this as its not easy to see
> everything thats changing in there...

Yeah, sorry, I just couldn't break it down anymore.  I can say I did a
world before and after on qemux86, diff'd config.logs and didn't see
anything other than the ix86-common bugfix in differences.

-- 
Tom Rini
Mentor Graphics Corporation


