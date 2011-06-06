Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QTYfr-0002St-OM
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 14:12:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p56C9XWZ007368
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 05:09:34 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 6 Jun 2011 05:09:33 -0700
Message-ID: <4DECC37C.2010003@windriver.com>
Date: Mon, 6 Jun 2011 07:09:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1307331820.git.scott.a.garman@intel.com>	<300cfa12d67e37c81fbbcdaba5c7d7686a191cfe.1307331820.git.scott.a.garman@intel.com>	<1307347216.3131.5.camel@lenovo.internal.reciva.com>
	<1307357181.7672.3.camel@rex>
In-Reply-To: <1307357181.7672.3.camel@rex>
Subject: Re: [PATCH 3/4] tar: upgrade to v1.26
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
X-List-Received-Date: Mon, 06 Jun 2011 12:12:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/6/11 5:46 AM, Richard Purdie wrote:
> On Mon, 2011-06-06 at 09:00 +0100, Phil Blundell wrote:
>> On Sun, 2011-06-05 at 21:49 -0700, Scott Garman wrote:
>>>  SECTION = "base"
>>> +PRIORITY = "optional"
>>
>> Seeing this sort of thing makes me wonder whether SECTION and PRIORITY
>> actually belong in the core metadata at all.  It seems as though the
>> determination of what exactly is "standard" vs "optional" is a matter of
>> distro policy and this would be better done in the distro config files.
>>
>> Also, just on a pragmatic issue, the two values above are actually what
>> bitbake.conf sets as default anyway so there isn't much to be gained by
>> specifying them in the recipe as well.
> 
> I have to admit I keep wondering about these.
> 
> PRIORITY does seem a bit of a pointless variable in the default metadata
> and I'm borderline in favour of dropping it and leaving it to any
> distros who want to use it, maybe sharing an include file.

I agree as well, PRIORITY seems a bit iffy at this point.

> SECTION does at least start to become useful in an image generation UI
> as a way to group packages roughly by type which makes me think it has a
> good default usecase (and OE-Core did clean up the values of it to at
> least be consistent).

I think the value of SECTION needs to remain.  It's being used to group the
packages (as Richard mentions...)

Just my 2-cents.

--Mark

> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



