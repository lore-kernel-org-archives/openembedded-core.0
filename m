Return-Path: <abuse@basmevissen.nl>
X-Greylist: delayed 471 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 Oct 2018 16:09:51 UTC
Received: from hosting.emcodev.net (hosting.emcodev.net [178.18.92.162])
	by mail.openembedded.org (Postfix) with ESMTP id C99E279C47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 16:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id 990F712B654;
	Wed, 31 Oct 2018 17:02:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at hosting.emcodev.net
Received: from hosting.emcodev.net ([127.0.0.1])
	by localhost (hosting.emcodev.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8sW4yBJJ_Piz; Wed, 31 Oct 2018 17:01:58 +0100 (CET)
Received: from emcodev.nl (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id C777F12AFB9;
	Wed, 31 Oct 2018 17:01:57 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 31 Oct 2018 17:01:56 +0100
From: Bas Mevissen <abuse@basmevissen.nl>
To: Scott Rifenbark <srifenbark@gmail.com>
In-Reply-To: <CAFNP8Otrxa9Zaxb=hMdZrFe-OvUcbf1noC-bMLhmzEj-CUa7CQ@mail.gmail.com>
References: <2829165.0Ht5z2aexs@localhost.localdomain>
	<CAFNP8OvFy2n7SMe5de66EcdM3URFm-b+dpcqS09hW0CMa9rNaA@mail.gmail.com>
	<25f056c7-d6ba-499f-8bf4-b8d1470fff4b@gmail.com>
	<CAFNP8Otrxa9Zaxb=hMdZrFe-OvUcbf1noC-bMLhmzEj-CUa7CQ@mail.gmail.com>
Message-ID: <78c58d5e96a03191114ccf8376344097@basmevissen.nl>
X-Sender: abuse@basmevissen.nl
User-Agent: Roundcube Webmail/1.3.7
Cc: yocto.user.mailinglist@gmail.com,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto discussion list <yocto@yoctoproject.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [yocto] 2.6 migration guide
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
X-List-Received-Date: Wed, 31 Oct 2018 16:09:52 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2018-10-31 16:50, Scott Rifenbark wrote:

> Can you tell me why "123456" is also not removed?  That string contains 
> instances of "123" and "456"


Because it removes all occurrences of the list value "123" and not of 
value "123456" or any part of it. Otherwise, it would be impossible to 
use this function to only remove, say, "1" from a long list of numbers. 
(here 'value' is not limited to a number).

-- Bas.

> 
> Thanks,
> Scott
> 
> On Wed, Oct 31, 2018 at 12:15 AM Robert Berger 
> <yocto.user.mailinglist@gmail.com> wrote:
> 
>> Hi Scott,
>> 
>> On 31.10.18 00:06, Scott Rifenbark wrote:
>>> 
>>> I have an initial section at
>>> https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#moving-to-the-yocto-project-2.6-release,
>>> which is based on Richard's input.  I am sure there are more items.
>> 
>> You might want to add a link to the bitbake manual or some example 
>> from
>> there for the new functionality of _remove operator:
>> 
>> http://git.openembedded.org/bitbake/tree/doc/bitbake-user-manual/bitbake-user-manual-metadata.xml?id=c0a23dd9155c50a6b7df796980bc7b612cac7994#n334
>> 
>> FOO = "123 456 789 123456 123 456 123 456"
>> FOO_remove = "123"
>> FOO_remove = "456"
>> 
>> FOO is now: "  789 123456    " instead of "789 123456"
>> 
>>> 
>>> Thanks,
>>> Scott
>> 
>> Regards,
>> 
>> Robert



