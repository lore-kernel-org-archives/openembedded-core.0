Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TjXL3-0006L4-8I
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:38:13 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1376085dak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 07:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=K7BGb8YN5Q6r1lsReTvr2cOGVEfXrflJuYF06AV01C4=;
	b=NZ03eK7fYeokxlL/J6mPeBX01K15nIWyoLD56kbQM9ixV540SzpTlhCIVULHTrzWKu
	scT9LLDt/J1evwR/sfrjDu4iQ0+mq90i+R0XWvUF4jG7RBYG6nCLpN6D006X3J2+FJRX
	GBAFYfslHUPuZdK2NovGlHNKRYFSd7CEV7nzbECx4iJfshNDShLHCRcfwxgXL+XGUtyP
	X8u3jJVHhqlsoLp3sOsQ8guCtj/2Wlsa/dVjCzJeDr/rAfKGTj8DIOlRsBnMM/zcs6nd
	J1sHM4xnTfXgEJuXcZ/hJNowMI7z0Y9iRn96LYwQSuC5w26DN+LxaTt9urCrYG5yV8hi
	/EwA==
MIME-Version: 1.0
Received: by 10.68.252.4 with SMTP id zo4mr16683028pbc.126.1355498615794; Fri,
	14 Dec 2012 07:23:35 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Fri, 14 Dec 2012 07:23:35 -0800 (PST)
In-Reply-To: <1355498223.9104.2.camel@dromedary>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
	<20121116213636.GC3411@jama.jama.net>
	<CAHod+GfAof60ycR5EXosair15O87dvZhnxWSouhdF49x8sZQqQ@mail.gmail.com>
	<20121116222855.GD3411@jama.jama.net>
	<CABcZANnSgJYUvwPFzcHaD-W7aBK+7Q=uh785-sQzbokSrq2UoQ@mail.gmail.com>
	<CAHod+GeYEUMW6z25i0xOEqGvRHfKrWV3TNHyEO8B9ZjFeDEBOA@mail.gmail.com>
	<CABcZANksE98pw4N6hGntTGtm4__gSO1cy4GSx6ULsqkg_yUAZQ@mail.gmail.com>
	<CAP9ODKrzkB0qje_8zcXOfRGcf+T=4yMR2kJJ0Lb2eCa2e9FrJw@mail.gmail.com>
	<CAHod+Gf2ayXp4Zubxh0yiEeOM7wGJ72EVVqY8uma0+y-oYFcdQ@mail.gmail.com>
	<CAP9ODKrQ1XQNwGz2D7HVcDeP1n7ndxCHTkiXD6tZotYLTMfKNA@mail.gmail.com>
	<1355428397.4799.7.camel@dromedary>
	<CAP9ODKrEXv=h0f8vSqdb5H3T0c4N9UuhYu4GHJhi3Vufiz7rKg@mail.gmail.com>
	<1355498223.9104.2.camel@dromedary>
Date: Fri, 14 Dec 2012 13:23:35 -0200
X-Google-Sender-Auth: gab2wqc9a8_G22yCN-J3ITpArdg
Message-ID: <CAP9ODKrW63qaf0xDziMfjNZJqKij=X5XjQfrZ=xppx0oCiqSjg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
Cc: Chris Larson <clarson@kergoth.com>, Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
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
X-List-Received-Date: Fri, 14 Dec 2012 15:38:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2012 at 1:17 PM, Marko Kati=C4=87 <dromede@gmail.com> wrote=
:
> On Thu, 2012-12-13 at 21:30 -0200, Otavio Salvador wrote:
>> On Thu, Dec 13, 2012 at 5:53 PM, Marko Kati=C4=87 <dromede@gmail.com> wr=
ote:
>> > Oh dear, i completely forgot about this patch. It's been sitting in my
>> > local repo for weeks!
>> >
>> > So here's my (hopefully) final solution:
>>
>> The patch seems broken for my e-mail reader (dunno if you pasted it here=
).
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
>> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
> Sorry about that. This one should work.

Please send a full patch, with commit log and everything. The patch
itself seems fine but it would be better to have the final and ready
to apply patch for test and review.

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


