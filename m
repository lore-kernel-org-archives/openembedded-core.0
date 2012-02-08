Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rv4MH-0005Rh-1q
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 11:02:37 +0100
Received: by qadz30 with SMTP id z30so3678054qad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 01:54:33 -0800 (PST)
Received: by 10.229.76.76 with SMTP id b12mr10935713qck.81.1328694873409;
	Wed, 08 Feb 2012 01:54:33 -0800 (PST)
Received: from [128.224.170.202] ([89.121.200.106])
	by mx.google.com with ESMTPS id ef1sm286596qab.19.2012.02.08.01.54.31
	(version=SSLv3 cipher=OTHER); Wed, 08 Feb 2012 01:54:32 -0800 (PST)
Message-ID: <4F324659.6000201@gherzan.ro>
Date: Wed, 08 Feb 2012 11:54:33 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F25501F.9000606@emagii.com>
	<CAMKF1so1dzbo3_YN-pJqn-axFAUazqkdKgFU+CUh3dSbWgYF2Q@mail.gmail.com>
	<4F26678A.1050803@gherzan.ro> <4F310EEE.80905@emagii.com>
	<20120207224006.GA13125@sakrah.homelinux.org>
	<4F323E94.2040307@emagii.com>
In-Reply-To: <4F323E94.2040307@emagii.com>
Subject: Re: bitbake -c clean <package> fails
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
X-List-Received-Date: Wed, 08 Feb 2012 10:02:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2012 11:21 AM, Ulf Samuelsson wrote:
> On 2012-02-07 23:40, Khem Raj wrote:
>>>> Clean it's just a "clean". As in "make clean". So after a clean
>>>> you will typically have configure, compile etc.
>>>> "cleanall" = remove unpacked + remove source. So after a clean you
>>>> will tipically have fetch.
>>> I have tried clean, cleansstate and cleanall.
>>> All of them remove the source directory.
>> if you are talking about ${S} then yes but relevant content in 
>> ${DL_DIR} are only removed
>> with cleanall
>>
>
> Yes, when I work on the kernel, I do not want to restart from unpack.
> I would like to edit the existing ${S}and then restart a compile.
> Once the compile succeeds, I want to deploy.
> Once the kernel does what it is supposed to, I generate a patch
> which is then added to the recipe.
>
> At that time, I want to cleansstate and rebuild/retest.
> To come around this problem right now, my kernel recipe generates a 
> script
> in ${S}, which will compile the kernel image and then copies it directly
> to my tftp directory. 
Why don't you play along with sstate files? Detele what you need and it 
will be forced to re<stage>.

@g


