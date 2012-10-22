Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQIGi-0001lM-M5
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 15:42:12 +0200
Received: from localhost ([127.0.0.1]:34938 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQI3j-00013Q-Ra
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 13:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=awqh6ohjSLksF+pIlqX4JF/YZ+M=; b=xlO9eatfaCJ7781l+RG9cOa3VDUx
	E0p92u0OfHlOgx1TEVW806kKbcyvZx9fj7g8AKtSuUMU6uedM89kVNl4p3jN5pNt
	5q+mi5qzfRmQqFreJDHNelt7R/fDmRff+yI9Vooy/aLmao1bW7zoJ/BNNE2cP6o+
	H37QlXRSuZUuj9g=
Received: from [195.171.99.130] (port=40463 helo=[192.168.0.67])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQI3j-00013N-Nr
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 13:28:47 +0000
Message-ID: <50854A83.2050106@communistcode.co.uk>
Date: Mon, 22 Oct 2012 14:30:43 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50854312.5040502@dresearch-fe.de>
	<CAGiJk9dt0OTOMG5T7DoomCfXxp+FUw15PWTXnaCSm=BJOpfjnw@mail.gmail.com>
	<5085481A.5050909@dresearch-fe.de>
	<CAGiJk9eWrfnX68DDVLFcqzmG4fo4xEz=wpyKgjwtcP2__=x+EQ@mail.gmail.com>
In-Reply-To: <CAGiJk9eWrfnX68DDVLFcqzmG4fo4xEz=wpyKgjwtcP2__=x+EQ@mail.gmail.com>
Subject: Re: Profiling binaries?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 13:42:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 22/10/12 14:23, Samuel Stirtzel wrote:
> 2012/10/22 Steffen Sledz <sledz@dresearch-fe.de>:
>> On 22.10.2012 15:12, Samuel Stirtzel wrote:
>>> 2012/10/22 Steffen Sledz <sledz@dresearch-fe.de>:
>>>> Just a short question: Does oe[-core] provide a generic method to create packages containing binaries/libraries with profiling support?
>>>>
>>> Depending on your platform you could use Valgrind [1], or to be more
>>> specific Callgrind [2].
>>>
>>> The recipe is in .../openembedded-core/meta/recipes-devtools/valgrind/
>>> you can check there if your arch/platform is supported.
>>>
>>> [1] http://valgrind.org/
>>> [2] http://valgrind.org/docs/manual/cl-manual.html
>> My question was more related to gcc -pg, gprof & Co.
>>
> Sorry forgot to mention that,
> you can use IMAGE_FEATURES += "dev-pkgs"
>

Section 5.15 has some interesting tidbits of profiling. There are a few 
5,x sections so look at them all the find the profiling one ;)

http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



