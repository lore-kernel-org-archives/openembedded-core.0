Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SmLAd-0005WA-Kb
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 10:42:47 +0200
Received: from [192.168.0.41] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id C5752601BD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2012 09:19:46 +0100 (BST)
Message-ID: <4FF3FFB1.8020807@communistcode.co.uk>
Date: Wed, 04 Jul 2012 09:32:49 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FF320DD.8090301@palm.com> <4FF32E93.9050802@communistcode.co.uk>
	<2056870.tdrijsDPYL@helios> <4FF3FEFE.3000103@communistcode.co.uk>
In-Reply-To: <4FF3FEFE.3000103@communistcode.co.uk>
Subject: Re: local.conf & bblayers.conf changes...
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
X-List-Received-Date: Wed, 04 Jul 2012 08:42:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/12 09:29, Jack Mitchell wrote:
> On 03/07/12 20:22, Paul Eggleton wrote:
>> On Tuesday 03 July 2012 18:40:35 Jack Mitchell wrote:
>>> What I did was create a new build directory and do a diff between my
>>> current config and the newly generated config.
>>>
>>> I couldn't find the reference local.conf file that bitbake tells you to
>>> compare against...
>>
>> It's in meta(-yocto)/conf/local.conf.sample.
>>
>> Cheers,
>> Paul
>>
>
> Indeed it is, I think I was looking in the bitbake directory 
> originally...
>
> I seem to remember the help message being confusing/contradictory but 
> I can't find it now.
>
> Cheers,
>

Found it:

    "Your version of bblayers.conf was generated from an older version
    of bblayers.conf.sample and there have been updates made to this
    file. Please compare the two files and merge any changes before
    continuing.\nMatching the version numbers will remove this
    message.\n\"meld conf/bblayers.conf conf/bblayers.conf.sample\" is a
    good way to visualise the changes.\n"

What confused me was that there was no mention of where 
conf/bblayers.conf.sample file was, I assumed it was a bitbake 
controlled conf file rather than a distro controlled conf file, hence 
searching the bitbake directory.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



