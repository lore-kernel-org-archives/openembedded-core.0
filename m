Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T1jU5-0006z3-21
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 21:42:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7FJUVT6006264
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 12:30:31 -0700 (PDT)
Received: from msp-dhcp58.wrs.com (172.25.34.58) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 15 Aug 2012 12:30:31 -0700
Message-ID: <502BF8DF.7060803@windriver.com>
Date: Wed, 15 Aug 2012 14:30:39 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <2404459.dJBf5OQotX@helios>
	<1345029924.23275.444.camel@phil-desktop>
	<4456392.mCXMPqtakO@helios> <502BE4F2.9080305@windriver.com>
	<CABcZANnh2HzOrmeRr49BT7GXh47oUqTRHYfi1W-pk=OoO5mD+A@mail.gmail.com>
In-Reply-To: <CABcZANnh2HzOrmeRr49BT7GXh47oUqTRHYfi1W-pk=OoO5mD+A@mail.gmail.com>
Subject: Re: RFC: OE-Core task rework
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
X-List-Received-Date: Wed, 15 Aug 2012 19:42:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/12 2:12 PM, Chris Larson wrote:
> On Wed, Aug 15, 2012 at 11:05 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>    * The tasks can be used and referred to on the target if desired, not
>>> just
>>> when you compose the image (i.e. task packages are produced and thus the
>>> package manager knows about them).
>>
>>
>> I think this is a key advantage.  Again, if we think of these tasks as
>> logical groups of functionality, it gives an image developer (or installer)
>> the ability to say "I need booting, discrete commands, python, perl, and LSB
>> compliance." and get a system in the end that -should- work.
>>
>> The image/installer should always be able to specify individual recipes as
>> well, but often inexperienced users won't know that they need two or three
>> recipes (that don't have actual dependencies on each other) to get a
>> functionally complete answer.
>
> It seems like you're arguing in favor of the ability to add groups of
> packages to an image, which no one disagrees with, and isn't really
> relevant to the bit you're quoting. The bit that tasks add that
> package groups / image features don't is the ability to add them after
> the fact at runtime, not image creation time.
>

It's both.. cross image creation, and on-target image creation (and updates). 
During runtime, some folks will want to add "features" to the system...  these 
are not what I would consider "image" features, but what we call task recipes today.

I.e. I have a base system, and a vendor says I need LSB compatibility -- 
assuming I have the right distro features set, I should be able to select one or 
more LSB "tasks" and suddenly I'm LSB compliant, without having to know all of 
the individual packages required.

--Mark


