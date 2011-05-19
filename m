Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMswO-00087f-FX
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 04:26:20 +0200
Received: by ewy5 with SMTP id 5so662214ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 19:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=Y+X/Y7pYD/ptHDAhNHRaH0AL8CSe0Dopgvn14c+t+Io=;
	b=RFJ72x7XwqjGbnJX+WnWQ/rMKBRLvgSDNEi0o6At+jwQUtueKO9BozpH6ZzpeJcakG
	uKdVK4S2+w2UeQIxbiMwtU0m7vQe68vI85U0NA/04d6DAdeC1cMedEnlKOJLArqdRxfo
	jFp4rVJbheRsh0gtZ8R1cYSuamVgZGWC0FZKo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=BBFKvCJYd2nS21urpk9MrJ7i1JV9uFqqYGIhcjjTgo+/t0OHYoRv8nJ61E07XxjvLk
	2rQ9na+EGQmVN/ccgJm0VW+gVv1Y7Dx0KxQUZ6JuUAWrvgLJDM5yMG0GSLClN9ru/S1l
	PHlE3eqQMiLboMsI3Ztrp1yVd0/ECVEoyNBAk=
Received: by 10.14.11.203 with SMTP id 51mr829381eex.204.1305771804316; Wed,
	18 May 2011 19:23:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Wed, 18 May 2011 19:22:54 -0700 (PDT)
In-Reply-To: <1305766048.3424.385.camel@rex>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
	<1305734038.18415.108.camel@lenovo.internal.reciva.com>
	<BANLkTikiNW0UEfLM_UtKeekTcrW5UNNfUA@mail.gmail.com>
	<1305738527.18415.126.camel@lenovo.internal.reciva.com>
	<8A91C5F6-313A-4A0F-A18E-094CFC3BB337@dominion.thruhere.net>
	<BANLkTinvqEeyXsiH79UHb3Zhx+qkXZRJ5w@mail.gmail.com>
	<BANLkTinwdO5XBGH=py2iw0kyJt6o77q7rw@mail.gmail.com>
	<CF837081-FAD3-4922-975B-B3CB6DD60533@dominion.thruhere.net>
	<1305766048.3424.385.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 May 2011 19:22:54 -0700
Message-ID: <BANLkTin=a+eKqUW8jVz0w5wjnMnJpWz6ig@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Thu, 19 May 2011 02:26:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 18, 2011 at 5:47 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-05-18 at 20:15 +0200, Koen Kooi wrote:
>> Op 18 mei 2011, om 20:07 heeft Khem Raj het volgende geschreven:
>> > there are certain common parts that can be abstracted
>> > and can be maintained in oe-core so everyone benefits
>> > from it and certain image specific parts can be done in
>> > distros. So keeping common parts in core would still
>> > be better IMO
>>
>> And in OE .dev we split task-boot from task-base to be able to get the
>> benefits from task base without forcing task-boot. OE-core had the
>> same till it got forcefully added to the extra depends last week.
>
> Which was a genuine mistake and I need to merge the patch that is around
> to address that particular issue.
>

http://patches.openembedded.org/patch/4387/

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


