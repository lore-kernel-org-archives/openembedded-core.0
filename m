Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RBYmR-00016w-In
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 23:13:31 +0200
Received: (qmail 27276 invoked by uid 1003); 5 Oct 2011 21:07:55 -0000
Received: from unknown (HELO ?192.168.1.108?)
	(philip@opensdr.com@96.240.183.10)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	5 Oct 2011 21:07:55 -0000
Message-ID: <4E8CC72B.4000506@balister.org>
Date: Wed, 05 Oct 2011 17:07:55 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.22) Gecko/20110906 Fedora/3.1.14-1.fc14 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4E8B6564.4090002@balister.org>
	<4E8B67C5.8050602@intel.com>	<4E8B6C17.80509@balister.org>
	<4E8B6D47.9000600@intel.com>	<4E8B8C05.5050508@windriver.com>
	<4E8C662B.4090300@balister.org>
	<1763F0CC-3233-4C5B-A933-7A00805D7CF4@dominion.thruhere.net>
In-Reply-To: <1763F0CC-3233-4C5B-A933-7A00805D7CF4@dominion.thruhere.net>
Subject: Re: Bringing an image from OE to OE-Core
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
X-List-Received-Date: Wed, 05 Oct 2011 21:13:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/05/2011 12:20 PM, Koen Kooi wrote:
>
>
> Op 5 okt. 2011 om 09:14 heeft Philip Balister<philip@balister.org>  het volgende geschreven:
>
>> On 10/04/2011 06:43 PM, Mark Hatle wrote:
>>> On 10/4/11 3:32 PM, Saul Wold wrote:
>>>> On 10/04/2011 01:27 PM, Philip Balister wrote:
>>>>> On 10/04/2011 04:08 PM, Saul Wold wrote:
>>>>>> On 10/04/2011 12:58 PM, Philip Balister wrote:
>>>>>>> I'm about to start bringing some images I use from OE to OE-core. The
>>>>>>> first issue I saw is there is no task-proper-tools in oe-core (where
>>>>>>> oe-core means the set of layers created by the Angstrom setup scripts).
>>>>>>>
>>>>>> Philip,
>>>>>>
>>>>>> Have you looked at task-core-basic, it is supposed to be more of a
>>>>>> desktop like set of tools, the idea being it's heavier weight than core,
>>>>>> will move to supporting the non-graphical part of LSB.
>>>>>>
>>>>>> Another caveat for task-core-basic is that it's the largetest non-gplv3
>>>>>> task that is used by core-image-basic.
>>>>>>
>>>>>> Does this task approach what you are looking for?
>>>>>
>>>>> It looks like a start, but I notice it brings in rpm. I'm not sure if I
>>>>> want that. I would have thought that the package manager would be a
>>>>> distro decision.
>>>>>
>>>> That's a bug that I would certainly take a patch for, unless rpm is
>>>> required as part of LSB, that will need to be verified.
>>>
>>> The ability to install RPM packages is required by the LSB.  The LSB does not
>>> require RPM however.  (yes I know, odd requirement, but with things like alien
>>> it's doable on debian systems.)
>>>
>>> But yes, RPM is included to satisfy that requirement.
>>
>> This is beginning to look like a trickier problem than I would like. Between oe-core and meta-angstrom, there are a number of tasks/images to start from, but they each have something I don't like:
>>
>> 1) I do not want rpm in the image. This would confuse my customer base.
>> 2) I am tired of dropbear, I want openssh only.
>
> fwiw 0.53 fixed most of my problems (e.g x11 forwarding), does it fix your issues as well?

It is more that users know openssh and sometimes have issues with 
dropbear. And image size is not an issue.

Philip


