Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TQIBp-0001bI-R0
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 15:37:09 +0200
Received: by mail-oa0-f47.google.com with SMTP id h1so2360508oag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UuQREYl0VNJR4hw91TT3mCmwhSwVxhy4r9252HTsVJI=;
	b=A7cnJCahEcyNdZazfZpwu09UhOOi0rZbVIykXfJnG9GGNVhfTwmVWSwKG9MslcA263
	2whS6ZdW9jNPU1c7k2g4A2G1ooR/HqXY25o7CMFVOjGZdd4+cnqSqVFckbRwyWzfbIE0
	ABpQ5R26g7vTpu2f7OB7PjI8t8nVjUO+6icuJZxuPXg9WtXGAgtphpthB2EEkP4ciJ0x
	/c+OCHjHFHtIwDC6ndxbtMFZc17AGa5Ffs6CC7kWy+MqnCCNZFPXwbguIEANl/ceH7VG
	NxDR8tdwKAzcmO7Pa3rJKR0/ucs8diJu+U1Cfiv0/Fo/qXAUigS7APA1MSRuH98RGDUN
	WZeg==
MIME-Version: 1.0
Received: by 10.182.47.66 with SMTP id b2mr6834491obn.34.1350912224727; Mon,
	22 Oct 2012 06:23:44 -0700 (PDT)
Received: by 10.76.25.227 with HTTP; Mon, 22 Oct 2012 06:23:44 -0700 (PDT)
In-Reply-To: <5085481A.5050909@dresearch-fe.de>
References: <50854312.5040502@dresearch-fe.de>
	<CAGiJk9dt0OTOMG5T7DoomCfXxp+FUw15PWTXnaCSm=BJOpfjnw@mail.gmail.com>
	<5085481A.5050909@dresearch-fe.de>
Date: Mon, 22 Oct 2012 15:23:44 +0200
Message-ID: <CAGiJk9eWrfnX68DDVLFcqzmG4fo4xEz=wpyKgjwtcP2__=x+EQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
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
X-List-Received-Date: Mon, 22 Oct 2012 13:37:10 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/22 Steffen Sledz <sledz@dresearch-fe.de>:
> On 22.10.2012 15:12, Samuel Stirtzel wrote:
>> 2012/10/22 Steffen Sledz <sledz@dresearch-fe.de>:
>>> Just a short question: Does oe[-core] provide a generic method to create packages containing binaries/libraries with profiling support?
>>>
>>
>> Depending on your platform you could use Valgrind [1], or to be more
>> specific Callgrind [2].
>>
>> The recipe is in .../openembedded-core/meta/recipes-devtools/valgrind/
>> you can check there if your arch/platform is supported.
>>
>> [1] http://valgrind.org/
>> [2] http://valgrind.org/docs/manual/cl-manual.html
>
> My question was more related to gcc -pg, gprof & Co.
>

Sorry forgot to mention that,
you can use IMAGE_FEATURES += "dev-pkgs"

-- 
Regards
Samuel


