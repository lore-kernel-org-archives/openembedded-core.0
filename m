Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 788AD6023B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 15:23:37 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wp4so7766721obc.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 08:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ZH+UgAfsFhNOspHMYmHS1hPU4QkfIWYcUENvsMdlhT8=;
	b=mSXqvtpU4WaRBA+IKu4fhb9GkmodsizygClZFq8D4ej7X3NmF4bGprHNcM9Kw4pXuX
	ax7SKmrQK9d/zMzpcR7HOWsOnQhYu10qRGrW+wh0GBOMHJJZBTtwUxAneMyBp/WKM1hq
	L1x+XCpLtLA9kJtbiOOFtL3GX9EWHADe22coq+wXWzGDKTuWNANjB7PuKEq9gp+7/Wnr
	V1BQkfj5thU1auHZK712dpGZ63kyVWohUr8NBEcE/GCr+IbU6LmW1rVkCojUB0VF9T3l
	+G+T1XZWA33uKHmt+Ft/IDNDgtK4kbiyWHy1q3uRuXEp1cGHW6dTmFdjIptWtnvumu6K
	6OJg==
MIME-Version: 1.0
X-Received: by 10.60.60.5 with SMTP id d5mr35249236oer.0.1379517818646; Wed,
	18 Sep 2013 08:23:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 18 Sep 2013 08:23:38 -0700 (PDT)
In-Reply-To: <lytxhitawh.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
	<ly38p2urzf.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4N+LdRpRW-497U0K8ZTFbFvy5Yr+2QznKbcg0yxSaBPww@mail.gmail.com>
	<lytxhitawh.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Wed, 18 Sep 2013 12:23:38 -0300
X-Google-Sender-Auth: Hjja0Sm0bZZSDSc7HOYVlOw5pIo
Message-ID: <CAP9ODKqWGteXc+_kR5o6rmifWXmnKD3vUjQkOUzxR1Fp+Bkqmg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add LDFLAGS to allow build of old kernels without patching
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
X-List-Received-Date: Wed, 18 Sep 2013 15:23:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 18, 2013 at 12:19 PM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Bruce Ashfield <bruce.ashfield-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> writes:
>
>>>> +LDFLAGS="-ldl -lutil"
>>>
>>> What is with -Wl,-as-needed or the gnu-hash ldflags which are applied
>>> usually?  Perhaps, hacks like
>>
>> We don't want to influence the perf build from the build system, unless we
>> absolutely have to. We want to use the flags and configs that are contained
>> within the kernel, just as we do with anything from the kernel tree in
>> general.
>
> Userspace programs should always be built with optimization flags of the
> build system.  E.g. it would be wrong when packages override our idea of
> optimization (-Os/-O2/-O6), generation of debug symbols or stripping of
> debug symbols.
>
> Kernel itself is an exception because it is tied very much to gcc and
> its behaviour.  But things like
>
> | CFLAGS = -fno-omit-frame-pointer -ggdb3
>
> in the perf Makefile must be overridable by the build system.

I don't agree on this. perf is tied to kernel and part of its code so
I think same exception rule apply for it as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

