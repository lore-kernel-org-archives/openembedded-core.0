Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Sj4se-000786-5t
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 10:42:44 +0200
Received: from [192.168.0.49] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id B2AA4600D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 09:22:05 +0100 (BST)
Message-ID: <4FE8223B.3000105@communistcode.co.uk>
Date: Mon, 25 Jun 2012 09:32:59 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FE431E4.6070706@communistcode.co.uk> <4FE4A694.2040504@intel.com>
In-Reply-To: <4FE4A694.2040504@intel.com>
Subject: Re: sgml-common sstate_task_postfunc failure
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
X-List-Received-Date: Mon, 25 Jun 2012 08:42:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 22/06/12 18:08, Scott Garman wrote:
> On 06/22/2012 01:50 AM, Jack Mitchell wrote:
>> I have had issues building sgml-common the past few days with oe-core
>> master. Could anyone shed any light on the debug messages I am receiving
>> and what I could do to go about fixing them.
>>
>> I don't really understand the recipe, it seems to be some sort of
>> surrogate recipe for transferring over specified files.
>
> The sgml catalog generation process has been plagued with race 
> conditions and special cases like requiring SSTATEPOSTINSTFUNCS from 
> the start - the problem is that unlike most packages, we're not 
> installing static files but need to dynamically update the sgml 
> catalog every time a new dtd gets installed.
>
> If this is reproducible, and you've only been experiencing it for the 
> past few days, could you possibly bisect which commit has caused this 
> error?
>
> Scott
>
>> snip...
>>
>

Unfortunately I had not updated or been building for around a month so 
while reproducible on my current build I cannot say when over the last 
month the issue turned up! I will keep updating and keep investigating 
to see if I can come up with a suggestion.

I do have a quite a high parallel build at 12 threads, which has caused 
problems in the past.

Regards,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



