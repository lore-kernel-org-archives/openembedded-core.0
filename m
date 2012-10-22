Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TQJpU-0008Si-3e
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 17:22:12 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so3667545ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:cc
	:content-type; bh=4mL9uBVQY5Jl1e0x1ghyAAv0+IRbcnXiLGq4NmbI+Q4=;
	b=ZxTER3MsZgYQl+U7Qau7+DAQmxux7UUfKB3KTI0d81cRP3/TJdJgIHD8kgzgwh7NaW
	xMFAdcWZWesx2dV4DRtWJiIcWF+TMS4yAFAp5hqupsALUAOTbRdWEj2iOJWUAsiMPPii
	HerNBcZX1L3FT30I66FQmfIXSxjf7TAqnPj/ivCW5jUYiksFUWu+BzGynafEnNN9bKYA
	kyxdY06n6E9P5xtNvlAX6nSj+ZJGO4NmOsosrGzB74gGz2kzL1qfYn1t3YiZLK3Nbr8P
	hLkhoLpblgBErDrDFiiQtcTbaReYby6P0bxSQ66fzZSHsXNlIrVOqLHQ1KqoS4E+DEIn
	DmHQ==
MIME-Version: 1.0
Received: by 10.50.236.74 with SMTP id us10mr9571323igc.5.1350918526537; Mon,
	22 Oct 2012 08:08:46 -0700 (PDT)
Received: by 10.64.24.179 with HTTP; Mon, 22 Oct 2012 08:08:46 -0700 (PDT)
In-Reply-To: <CAGiJk9eWrfnX68DDVLFcqzmG4fo4xEz=wpyKgjwtcP2__=x+EQ@mail.gmail.com>
References: <50854312.5040502@dresearch-fe.de>
	<CAGiJk9dt0OTOMG5T7DoomCfXxp+FUw15PWTXnaCSm=BJOpfjnw@mail.gmail.com>
	<5085481A.5050909@dresearch-fe.de>
	<CAGiJk9eWrfnX68DDVLFcqzmG4fo4xEz=wpyKgjwtcP2__=x+EQ@mail.gmail.com>
Date: Mon, 22 Oct 2012 17:08:46 +0200
Message-ID: <CAGiJk9fKBw7pZiMkc0Z_6cCUD7KwuPXbaXvAK_bp+wUDkr_6ow@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Profiling binaries?
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
X-List-Received-Date: Mon, 22 Oct 2012 15:22:12 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/22 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> 2012/10/22 Steffen Sledz <sledz@dresearch-fe.de>:
>> On 22.10.2012 15:12, Samuel Stirtzel wrote:
>>> 2012/10/22 Steffen Sledz <sledz@dresearch-fe.de>:
>>>> Just a short question: Does oe[-core] provide a generic method to create packages containing binaries/libraries with profiling support?
>>>>
>>>
>>> Depending on your platform you could use Valgrind [1], or to be more
>>> specific Callgrind [2].
>>>
>>> The recipe is in .../openembedded-core/meta/recipes-devtools/valgrind/
>>> you can check there if your arch/platform is supported.
>>>
>>> [1] http://valgrind.org/
>>> [2] http://valgrind.org/docs/manual/cl-manual.html
>>
>> My question was more related to gcc -pg, gprof & Co.
>>
>
> Sorry forgot to mention that,
> you can use IMAGE_FEATURES += "dev-pkgs"
>
Strange copy and paste mistake, I really should take more time writing mails..

What I meant was you can add
IMAGE_FEATURES += "dbg-pkgs"
to your image, this will ship all debug packages for your installed packages.

Combined with DEBUG_OPTIMIZATION flags this works like a charm, as
Richard already noted.


Usually I am using Callgrind in connection with the graphical tool
KCachegrind [2] for profiling.
But on target profiling is very slow with Callgrind, OProfile is
"marketed" as low overhead profiler...
Didn't know about OProfile or the documentation [1], it definitely
might be worth a try.

[1] http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#platdev-oprofile
[2] http://kcachegrind.sourceforge.net/cgi-bin/show.cgi/KcacheGrindIndex

-- 
Regards
Samuel


