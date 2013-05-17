Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1UdLrC-0004t6-FS
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 16:42:06 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 0573EF81246; Fri, 17 May 2013 08:23:50 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2E442F81244;
	Fri, 17 May 2013 08:23:49 -0600 (MDT)
Message-ID: <51963D78.8010908@mlbassoc.com>
Date: Fri, 17 May 2013 08:23:52 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <51962FFE.3040202@mlbassoc.com> <51963C52.1040004@linux.intel.com>
In-Reply-To: <51963C52.1040004@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Poor first impression
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 14:42:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-05-17 08:18, Saul Wold wrote:
> On 05/17/2013 04:26 PM, Gary Thomas wrote:
>> I just tried to run Poky/Yocto on a fresh Ubuntu 12.04 system.  I knew
>> there would
>> be missing bits and have seen the "sanity" messages in the past, so I
>> thought I'd
>> just carry on.  Today's experience was not pretty and would it not for
>> my experience
>> with this, I would have been very perplexed...
>>
>
> Hey Gary, was this on a 1.4 / Danny Branch or master?  Richard may have done something with master when he made some of the Python3 changes.

Master, updated 2013-05-16

>> Here's what I saw:
>>
>> gthomas@saturn:/local/qemuarm_poky$ bitbake core-image-sato
>> /local/poky-multi/scripts/bitbake: 1: /local/poky-multi/scripts/bitbake:
>> git: not found
>>    File "<string>", line 1
>>      from distutils.version import LooseVersion; import sys;
>> sys.exit(not (LooseVersion('>=') 1.7.5 LooseVersion('')))
>>                                                                                                 ^
>> SyntaxError: invalid syntax
>> /local/poky-multi/scripts/bitbake: 1: /local/poky-multi/scripts/bitbake:
>> git: not found
>>    File "<string>", line 1
>>      from distutils.version import LooseVersion; import sys;
>> sys.exit(not (LooseVersion('>=') 1.7.5 LooseVersion('')))
>>                                                                                                 ^
>> SyntaxError: invalid syntax
>> Traceback (most recent call last):
>>    File "/local/poky-multi/bitbake/bin/bitbake", line 293, in <module>
>>      ret = main()
>>    File "/local/poky-multi/bitbake/bin/bitbake", line 260, in main
>>      event = server.event_queue.get(block=False)
>>    File "/usr/lib/python2.7/multiprocessing/queues.py", line 134, in get
>>      raise Empty
>> Empty
>> Pseudo is not present but is required, building this first before the
>> main build
>> ^CTraceback (most recent call last):
>>    File "/local/poky-multi/bitbake/bin/bitbake", line 293, in <module>
>>      ret = main()
>>    File "/local/poky-multi/bitbake/bin/bitbake", line 260, in main
>>      event = server.event_queue.get(block=False)
>>    File "/usr/lib/python2.7/multiprocessing/queues.py", line 134, in get
>>      raise Empty
>> Empty
>> ERROR:  OE-core's config sanity checker detected a potential
>> misconfiguration.
>>      Either fix the cause of this error or at your own risk disable the
>> checker (see sanity.conf).
>>      Following is the list of potential problems / advisories:
>>
>>      Please install the following missing utilities: C++ Compiler
>> (g++),diffstat,makeinfo,git,gawk,chrpath
>>
>> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
>>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


