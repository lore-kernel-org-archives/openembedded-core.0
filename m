Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7qus-000882-Mo
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 17:19:10 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2012 09:10:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="120977230"
Received: from unknown (HELO [10.255.15.152]) ([10.255.15.152])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2012 09:09:24 -0700
Message-ID: <4F60C2B3.5030606@linux.intel.com>
Date: Wed, 14 Mar 2012 09:09:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331713807.git.sgw@linux.intel.com>
	<1331731615.18586.26.camel@ted>
In-Reply-To: <1331731615.18586.26.camel@ted>
Subject: Re: [PATCH 00/14] Warning Fixes and some Updates
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
X-List-Received-Date: Wed, 14 Mar 2012 16:19:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2012 06:26 AM, Richard Purdie wrote:
> On Wed, 2012-03-14 at 01:33 -0700, Saul Wold wrote:
>> Richard,
>>
>> This has some warning fixes along with some update.
>>
>> Biggest change is to bitbake.conf, which re-orders PACKAGE and addes
>> ${libdir}/${BPN}/*.a to the staticdev list, this was seen in a number
>> of packages and seems to make sense.  But I would understand if there
>> are other issues I am not aware of.
>>
>> The FILES_${PN} was grabbing from ${libdir}/${BPN}/* so we needed to
>> get the staticdev in before that.
>
> I replied to this patch. If we do take it in, it needs some very
> specific testing data.
>
The problem with sending patches late!  I thought about this around 
6:00am and would deal with it when I woke!  I will run a world build 
with package history enabled before and after this change and see what 
the output is like.

>> Saul Wold (14):
>>    owl-video: Fix unpackaged file warning
>>    ltp: Package static library in -staticdev
>>    quilt: Fix docs packaging warnings
>>    autoconf: remove emacs mode files to fix warnings
>>    rpm: Package python-rpm static archive correctly
>>    distro_tracking: Updates for manual checks
>>    avahi: Update to 0.6.31
>>    man-pages: Update to 3.36
>>    libgalago: Fix package warnings by not packaging autopackage
>>    man: fix configure issue to solve warnings
>
> I took these, thank.
>
>>   gpgme: fix packaging warnings
>
> I'd like to see a small tweak to this one (I've replied to the patch)
>
Tweak sent to the list.

>>   python: package static libraries correctly in -staticdev
>
> I meant not to take this after the comment from Martin but accidentally
> did. I therefore followed up with a fix to the generator script so this
> one is merged and dealt with.
>
Thanks, I had not noticed that this was auto-generated.

>>    bitbake.conf: Modify PACKAGE list ordering to insert -staticdev file
>>      before PN
>
> I've replied about this one.
>
>>   qt4: package static libraries correctly to fix warnings
>
> I've held off this one as Martin reported an issue.
>
I think Martin provided a fix for this on the list, it looks fine.

We are getting there with warnings, my last world build was down to 
around 260 warnings.

Thanks
	Sau!

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


