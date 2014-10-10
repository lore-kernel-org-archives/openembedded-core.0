Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F69A6FBB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 00:53:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9A0r4IA017044
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Oct 2014 17:53:04 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 9 Oct 2014 17:53:04 -0700
Message-ID: <54372DEF.7080101@windriver.com>
Date: Thu, 9 Oct 2014 19:53:03 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1412891594-9608-1-git-send-email-otavio@ossystems.com.br>	<543719D4.9080308@windriver.com>
	<CAP9ODKqHaOc6W0+WpyrdhQjXWaD++MdfMiUFWh0aKZVC0uJq8Q@mail.gmail.com>
In-Reply-To: <CAP9ODKqHaOc6W0+WpyrdhQjXWaD++MdfMiUFWh0aKZVC0uJq8Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] toolchain-scripts.bbclass: Allow sourcing of subscript for environment
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
X-List-Received-Date: Fri, 10 Oct 2014 00:53:06 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/14, 7:41 PM, Otavio Salvador wrote:
> On Thu, Oct 9, 2014 at 8:27 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 10/9/14, 4:53 PM, Otavio Salvador wrote:
>>>
>>> Sometimes we require extra environment settings to be available on the
>>> environment for proper SDK work. This were done, in past, using
>>> '_append' tasks however with the split of the environment in a
>>> canadian package this has been broken.
>>>
>>> The easier and more flexible solution is to use environment subscripts
>>> which are sources by the main script. These are now looked at:
>>>
>>>    $OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh
>>>
>>> and sourced.
>>>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>>
>> I really like this approach.  However, is there any way for the subscripts
>> to be arch specific?
>
> I think we can plan on that but this would be 1.8 material IMO. This
> is enough for what we need today and can easily be improved in future
> work. What do you think?
>

I think it's a fairly low risk change..  I'm certainly not against it.

--Mark

