Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SuVEW-0004h5-DI
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 23:04:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6QKr09b028474
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 13:53:00 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.34) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 26 Jul 2012 13:52:59 -0700
Message-ID: <5011AE2B.6060108@windriver.com>
Date: Thu, 26 Jul 2012 15:52:59 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343328564-3644-1-git-send-email-sgw@linux.intel.com>
	<1343329086.4470.56.camel@x121e.pbcl.net>
	<CAMKF1so+OJTjN+fRP8DJK2zCNKUyTFYJ==zUMkRm1+-6FkYCvg@mail.gmail.com>
	<1343335085.9574.32.camel@ted>
In-Reply-To: <1343335085.9574.32.camel@ted>
Subject: Re: [PATCH] package.bbclass: Let pn be eglibc for eglibc-locale
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
X-List-Received-Date: Thu, 26 Jul 2012 21:04:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/12 3:38 PM, Richard Purdie wrote:
> On Thu, 2012-07-26 at 13:16 -0700, Khem Raj wrote:
>> On Thu, Jul 26, 2012 at 11:58 AM, Phil Blundell <philb@gnu.org> wrote:
>>>
>>> Bletch!  There must surely be some way to solve this problem without
>>> hacking recipe names into package.bbclass.
>>
>> Yes making eglibc-locale base package to be non empty. So if we put in
>> something there that it never turns out to be empty is one way
>
> Well, having things depending on eglibc-locale-locale is wrong in many
> ways :/. eglibc is just the only package we split the locale generation
> into a separate recipe for.
>
> A more generic check in there which would work for multiple libcs would
> be:
>
> if pn.endswith("-locale"):
>      pn = pn[:-7]

This sounds like a good alternative.  It still enables breakups of the locales, 
if appropriate, with the only rule being that the core part of the name be 
consistent with whatever it's targeting.

i.e. eglibc and eglibc-locale

> the other alternative which comes to mind would be so set a variable
> with the name we want used there, defaulting it to PN.

I had suggested changing the PN of the eglibc-locale to "eglibc", but I believe 
Khem ran into a number of problems doing this.

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
>



