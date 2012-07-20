Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Ss9uW-0002a9-Sx
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 11:54:13 +0200
Received: from localhost ([127.0.0.1]:58604 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1Ss9jV-00056e-R2; Fri, 20 Jul 2012 09:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=REjceHdcdsrkP0qCGx1ft9iEka0=; b=YhtjdceG+foZDlLK5iBFjfXQ/aQj
	UJ/OVQX8EBOvgahDjyj+sL2rDpsMFxPkKn2qLXawnY1yN6h6h+lZjlVWpdfk0zZd
	TIw7wUxei2jYQNSgdtAAgktYU5kt8GGQt7E53IGuKOL+hwizmYXwUkEz3RRJAZeK
	mOcACFVfcsR8ozs=
Received: from [195.171.99.130] (port=44453 helo=[192.168.0.42])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1Ss9ef-0004xH-Mv; Fri, 20 Jul 2012 09:37:49 +0000
Message-ID: <50092732.7030806@communistcode.co.uk>
Date: Fri, 20 Jul 2012 10:38:58 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1342606005.30680.17.camel@ted>
	<50081D62.9000204@communistcode.co.uk>
	<20120719152341.GL3331@jama.jama.net>
In-Reply-To: <20120719152341.GL3331@jama.jama.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: PLEASE READ: Major change landing shortly (python whitespace)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 20 Jul 2012 09:54:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 19/07/12 16:23, Martin Jansa wrote:
> On Thu, Jul 19, 2012 at 03:44:50PM +0100, Jack Mitchell wrote:
>> On 18/07/12 11:06, Richard Purdie wrote:
>>> snip
>>>
>>> So I am going to:
>>>
>>> a) Try and flush through as many pending patches as I can.
>>> b) Check in a warning into bitbake master and increase its version
>>> c) Require that version in OE-Core
>>> d) Commit a significant set of whitespace changes to OE-Core, resolving
>>> all the warnings for OE-Core.
>>>
>>> I plan to do this, tomorrow, Thursday.
>>>
>> Richard,
>>
>> I think I've hit an issue with the white spaces today:
>>
>>      NOTE: Resolving any missing task queue dependencies
>>      NOTE: Preparing runqueue
>>      NOTE: Executing RunQueue Tasks
>>      NOTE: Running task 1 of 2 (ID: 0,
>> virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/bison/bison_2.5.bb,
>>      do_clean)
>>      NOTE: package bison-native-2.5-r2: task do_clean: Started
>>      ERROR: Error executing a python function in
>> /mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/bison/bison_2.5.bb:
>>      OSError: [Errno 39] Directory not empty:
>> '/mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/bison-native-2.5-r2/temp'
> Do you think that this directory is full of white spaces? :)
>
> I don't think this is related to todays white space changes, because I
> see errors like this from time to time..
>
> Cheers,
>
>
>>      ERROR: The stack trace of python calls that resulted in this
>>      exception/failure was:
>>      ERROR:   File "do_clean", line 16, in <module>
>>      ERROR:
>>      ERROR:   File "do_clean", line 6, in do_clean
>>      ERROR:
>>      ERROR:   File
>> "/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/lib/oe/path.py",
>>      line 94, in remove
>>      ERROR:     shutil.rmtree(name)
>>      ERROR:
>>      ERROR:   File "/usr/lib/python2.7/shutil.py", line 245, in rmtree
>>      ERROR:     rmtree(fullname, ignore_errors, onerror)
>>      ERROR:
>>      ERROR:   File "/usr/lib/python2.7/shutil.py", line 254, in rmtree
>>      ERROR:     onerror(os.rmdir, path, sys.exc_info())
>>      ERROR:
>>      ERROR:   File "/usr/lib/python2.7/shutil.py", line 252, in rmtree
>>      ERROR:     os.rmdir(path)
>>      ERROR:
>>      ERROR: The code that was being executed was:
>>      ERROR:      0012:    for f in (d.getVar('CLEANFUNCS', True) or
>>      '').split():
>>      ERROR:      0013:        bb.build.exec_func(f, d)
>>      ERROR:      0014:
>>      ERROR:      0015:
>>      ERROR:  *** 0016:do_clean(d)
>>      ERROR:      0017:
>>      ERROR: (file: 'do_clean', lineno: 16, function: <module>)
>>      ERROR:      0002:def do_clean(d):
>>      ERROR:      0003:    """clear the build and temp directories"""
>>      ERROR:      0004:    dir =
>> d.expand("/mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/bison-native-2.5-r2")
>>      ERROR:      0005:    bb.note("Removing " + dir)
>>      ERROR:  *** 0006:    oe.path.remove(dir)
>>      ERROR:      0007:
>>      ERROR:      0008:    dir = "%s.*" %
>> bb.data.expand(d.getVar('STAMP'), d)
>>      ERROR:      0009:    bb.note("Removing " + dir)
>>      ERROR:      0010:    oe.path.remove(dir)
>>      ERROR: (file: 'do_clean', lineno: 6, function: do_clean)
>>      ERROR: Function failed: do_clean
>>      NOTE: package bison-native-2.5-r2: task do_clean: Failed
>>      ERROR: Task 0
>> (virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/bison/bison_2.5.bb,
>>      do_clean) failed with exit code '1'
>>      NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
>>      rerun and 1 failed.
>>
>>      Summary: 1 task failed:
>> virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtools/bison/bison_2.5.bb,
>>      do_clean
>>      Summary: There was 1 WARNING message shown.
>>      Summary: There were 37 ERROR messages shown, returning a non-zero
>>      exit code.
>>
>>
>> Cheers,
>> Jack.
>>
>> -- 
>>
>>     Jack Mitchell (jack@embed.me.uk)
>>     Embedded Systems Engineer
>>     http://www.embed.me.uk
>>
>> --
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Ok, so I should just rm -rf the Bison directory and have another go? 
I've never seen this before and it happened as soon as I pulled the 
white-space changes along with the error looking to be in the python 
function so I assumed a mishap somewhere...

My python isn't great and the trace made it look like it was pointing to 
failures with all the inconsistent spacing in the trace output.

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



