Return-Path: <pascal.huerst@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A97837FE56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 13:36:13 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so2882689wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 05:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=99BHYjLbrmcXoR+rHr3V/S0wD6W7ezen5TGlIwaCzYA=;
	b=MDnEKcELG5CzTekgjlQG1sHJ9rxLnleYmuln/jaT4dRKOHL3ne5VY4TDgjqNtzK1NR
	AqiTuJmpFoKq4nVc49G+WlBR57zh6y4gJgaM80yzhr0/+6roZv2Boav8pw4vdH/LGNsl
	z5AM1AOZOBYwhwpng4dvQ++SM+H8crP7Ynxs1pkRNWeF/Lreg8RWY+VbcM3h+Itt2uza
	VkfocZppHOTeN2VUB+M7DzU8ECvWhJEYP1XS3U9Jz0yYe4WkvjcJhWbiZ9ReNfrQUjmm
	beBRz9Gzjaw3EwW788ISE7yqXRPHjEITSz+02sL3tViGU3WE7Sj9CsjTO5Pb7MW064Og
	px/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:references:from:autocrypt:subject
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=99BHYjLbrmcXoR+rHr3V/S0wD6W7ezen5TGlIwaCzYA=;
	b=kvKKt3Sf0aXCxLlAxnWufVII7QkDPfc0H9tNjGcEeaD6Ey5h09Ez1H/Fc4Dls5HrP3
	QNErOdficO68eDIVqfJBdFSsKZMFA2Kb1+2ghKIkDoI1ANqQtnQFHd33DMRHAB1paVjC
	62J+plXdtDmfFtt7XSrVhrK3Er+mQ2JTCfqe8mpXZ056WmTZm81HOErhxh1wyw3RymRv
	dwYam5t7O9oODwOyyt7UxbM7U8e66oIja5QnQuHTRK55LNnEkhQ3ppEBqZsYdGcXj8n1
	PlrkWVyL43USbqIA4EK9qprVwk/ow7AGXBXg1OvSonvGLw1uUgKhL89JfLkMT58tC6hm
	HZ6Q==
X-Gm-Message-State: APjAAAWDPOppygSJNqOLOcygIraxo98C0UUBm+VMtBd4RsaeSGbQF8SL
	oLcbjXHzpvUcp6AL6Pw8pGw=
X-Google-Smtp-Source: APXvYqyXQnWhXgc3OBo/CVsivwEfM4/yvragaH0Mbr/c9YOdpHS9BFpy0mY0BapMD7fao/mkCzFB2Q==
X-Received: by 2002:a7b:c74c:: with SMTP id w12mr4999335wmk.1.1578576974321;
	Thu, 09 Jan 2020 05:36:14 -0800 (PST)
Received: from [10.10.222.52] ([194.162.236.226])
	by smtp.googlemail.com with ESMTPSA id
	d14sm8210185wru.9.2020.01.09.05.36.13
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 09 Jan 2020 05:36:13 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
	<f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
	<d7dbdb87-d763-2ae0-923f-d293d6c24d27@gmail.com>
	<a9e23045b333589e58bb1e771a508bd39a347dc6.camel@linuxfoundation.org>
From: Pascal Huerst <pascal.huerst@gmail.com>
Autocrypt: addr=pascal.huerst@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <1789ead7-ff8f-8e2c-2aa6-7824388579c5@gmail.com>
Date: Thu, 9 Jan 2020 14:36:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <a9e23045b333589e58bb1e771a508bd39a347dc6.camel@linuxfoundation.org>
Cc: Rich Persaud <persaur@gmail.com>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Thu, 09 Jan 2020 13:36:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 09/01/2020 13:08, Richard Purdie wrote:
> On Thu, 2020-01-09 at 12:59 +0100, Pascal Huerst wrote:
>> On 09/01/2020 11:51, Richard Purdie wrote> I did look at and think a bit
>> about your patch. The trouble for me (as
>>> the bitbake maintainer) is that:
>>>
>>> a) it isn't clear/obvious from the variable name what it does (or even 
>>>    from the code)
>>> b) it adds yet more options to the fetcher which increases the test 
>>>    matrix and possible ways things can break
>>> c) the test doesn't actually test it does what its supposed to (no 
>>>    check is made on which output is downloaded for a given revision)
>>
>> I certainly wouldn't insist on the name and considered it a proposal,
>> but you're right, it's not obvious at all. As for test-ability, I can
>> relate to your concerns and understand that you don't want to maintain a
>> corner-case like this - Which leads me to the conclusion that we should
>> probably rethink our internal concept for release builds...
>>
>>> Some of these can be fixed, some are much harder and I can't decide if
>>> supporting this kind of edge case is going to be an overall good thing
>>> for the project or not. I don't want to give you false hope by fixing
>>> c) only to say "no".
>>
>> Understandable.
>>
>>> Add in Khem's valid concerns about reproducibility and it makes it a
>>> tough one even to give feedback on.
>>>
>>> If we have a ton of users saying "yes we really need this", that would
>>> help but I haven't seen that as yet...
>>
>> Fair enough.
>>
>> Thanks for your thoughts!
> 
> FWIW I do want to see the system used to do things like this. I've kind
> of envisaged you'd do it "up front" though. For example it should be
> trivial for a script to use tinfoil, iterate through and generate an
> include file of the revisions you want, using the fetcher calls.

Sure. Writing some scripts to do the job was my first intend, but then I
was aiming for something that could potentially be merged upstream. But
I guess I underestimated the overall implications...

> Yes, its slightly more annoying to generate the config, then build it
> but if it stops the core becoming unmaintainable with corner cases,
> that could be the right decision.
> 
> If you do something like that it would be great to share it so others
> can see what you did and be able to build off it...

Sure. Will do.

