Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SS6mo-0002OY-9z
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 15:18:34 +0200
Received: by dalh21 with SMTP id h21so264279dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 06:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TPHbRVWLiSG5olfx04rMOUNUXujogjxayV/Q4i5igbk=;
	b=uioD0sDSn4FdyQL5oONKYD0iJ7T3NlNkelenx/2xGHOdyhpn6Xi4yzFBei/aDMf3Fn
	VWwpqklrtU/IXtWw6kjZX5wz9LqSACqKL2FfIZcri9c2Me4cD5n5b3eOGujnaNK1+q+S
	hv3hfa5I68yD82f28vwycWq8tGAbdC0v4GZTZZ2WIUCChx6oOzLZ0BKWIG9uT2lrt7WH
	jYOQVQvuFio2kmWbNPpnOvfhRlS48HO+/JjtRBKvkqzqR65ZIdCfZIjIcoMyxDY85jNm
	nUnwqFY4ifyzMwYhsbOdJWXbP6qd0APvqVE2I4/QlpZ/RjSJlJulzedhKuwMbpLMWSDB
	ZhAw==
MIME-Version: 1.0
Received: by 10.68.191.230 with SMTP id hb6mr8908444pbc.167.1336568920678;
	Wed, 09 May 2012 06:08:40 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Wed, 9 May 2012 06:08:40 -0700 (PDT)
In-Reply-To: <CADkTA4NF0VtWXRg6--vXVfPabtOemx8j4N0Aa2C_+v8a1b8jhA@mail.gmail.com>
References: <cover.1336504721.git.bruce.ashfield@windriver.com>
	<1336546278.30349.26.camel@ted>
	<CADkTA4NF0VtWXRg6--vXVfPabtOemx8j4N0Aa2C_+v8a1b8jhA@mail.gmail.com>
Date: Wed, 9 May 2012 09:08:40 -0400
Message-ID: <CADkTA4OZ+EnnW=4LWnUo5vkw1MQ6f+kpsySHBqpuMNcHEWo9EQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: saul.wold@intel.com
Subject: Re: [PATCH 0/1] kernel-yocto: export GUILT_BASE
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
X-List-Received-Date: Wed, 09 May 2012 13:18:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 9, 2012 at 8:42 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Wed, May 9, 2012 at 2:51 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2012-05-08 at 15:23 -0400, Bruce Ashfield wrote:
>>> Richard/Saul,
>>>
>>> As Frans Meulenbroeks noted this morning, guilt wasn't functional
>>> in the devshell. The fix was simple enough, and by ensuring that
>>> GUILT_BASE is exported, it works without any extra steps now.
>>>
>>> I wasn't sure if there a better way to call 'up' to the base
>>> method, so I repeated the call to oe_terminal in the do_devshell()
>>> in kernel-yocto.bbclass.
>>>
>>> If there's another approach, let me know and I'll respin the patch.
>>
>> Can't you just set:
>>
>> GUILT_BASE = "meta"
>
> Will that export to the subshell ? I didn't try it .. since I didn't
> think it would.
> I'll give that a go here :)

With just that set in kernel-yocto.bbclass, and I launch devshell, I get this:

% guilt applied
Patches directory doesn't exist, try guilt-init

So unless I misunderstood what you are suggesting, I still need that explicit
export.

Cheers,

Bruce


>
> Bruce
>
>>
>> ?
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


