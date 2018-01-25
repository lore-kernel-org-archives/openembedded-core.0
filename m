Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E959C7852C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 20:00:28 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y5so6557359pff.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 12:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nqfMLH42z72mRbdyppagcLcASyQiBpy3YR+VSt9ULfE=;
	b=r03+uJgGFj2TdG/4nBYQa+oxy8CBPv0UJedQmnKnYE7dcTxPbq7ATKTh/f4Vv+oymu
	R7IgXeUh6mpUQdDWsqgGPwkMBB4ehyQ6xsC74XWrU1ufG1SYPqR8+8oe8k9q8gFEWN6E
	qLQ8xWlgRWWArmEsdNMql+n7ZiVNUs6tYW+SG/hVFCWLs9nMtqb9vXL2NTnO3k2/Wx2Y
	VV1RrfYLqh4iG5oq9rqw9O+2Cy2KbT92mi7JuYyuU4TsVyN1D7D0H9gMW20M6cmDIhDb
	gBXi9sztmljqHsiS6fiaV5rM8QMTQ1GFo3bgXd87Y7aSbNYWU79PqwKBQflHSyPxShWm
	fFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nqfMLH42z72mRbdyppagcLcASyQiBpy3YR+VSt9ULfE=;
	b=gzjnnfRRYI4dTQXsav5ABPzff3g15fjJ53aOo7LLBzYO5Txdot1MQeXHWdY3V4QjXI
	pD1k5HKTM41A1FpbH9voUKfb/b+jys7meT+WysJxFhr3qdO7G/AGp41nWzm5hMJ6hyCC
	ZdyxsXOI5V84IJsdD1t+m3IONxSQO9lHEcFz8gYMO4sKIkk7+7Ql9TkQ/p00mJd6C6BT
	fZAvv5MjYDZ0amfBOvsoE4WgUShmABKsYGj1z+A7Fz0LnHCmBZt3HN2kYzaPxrdASwth
	Gz1JTkEnvAqRGKkeZNIg991FITkMEvAO3dp9nuaIQMjBXrCkcBXqDdvexALQuxyUVZWq
	+78g==
X-Gm-Message-State: AKwxytdg93dHR26KQUDRMAEPI+eJLjs1PKpWQm6F5sec6CyurM6Vvs7d
	yCo9B/bnGGPd1BwBHqv7zRJh5SLQQ/3HC1RmgbM=
X-Google-Smtp-Source: AH8x226bkTCEN5UoeYRJELpsNqOs6vjMpD8petPTOFhiisDK3DhIjINBRnJne8gcdSjlNb/JySThy7rQs0xtzviFVPQ=
X-Received: by 2002:a17:902:bd82:: with SMTP id
	q2-v6mr2786208pls.339.1516910425242; 
	Thu, 25 Jan 2018 12:00:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Thu, 25 Jan 2018 11:59:54 -0800 (PST)
In-Reply-To: <1515935110.29722.214.camel@linuxfoundation.org>
References: <20180112162002.9669-1-alexander.kanavin@linux.intel.com>
	<1515935110.29722.214.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Jan 2018 11:59:54 -0800
Message-ID: <CAMKF1srvnbwA9_ZOzxy8QaeCa6_CVOEE2J1H4mMVitMN-T96ig@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH 1/2] ruby: update to 2.4.0
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
X-List-Received-Date: Thu, 25 Jan 2018 20:00:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 14, 2018 at 5:05 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2018-01-12 at 18:20 +0200, Alexander Kanavin wrote:
>> Existing version of ruby-native (2.2.5) was crashing on my machine
>> (and others' too),
>> yet a functional ruby is necessary to upgrade webkit to a version
>> that less vulnerable
>> to Spectre.
>>
>> I've performed the update by copying the ruby recipe directory over
>> from the current
>> pyro tree; if you want to see the list of specific commits, issue
>> this command:
>>
>> git log 99656fecf4fa6e24ba49ecb7f26f893e733818a0 meta/recipes-
>> devtools/ruby
>> (up to commit e593d3aeb2ea5f08d6e0753133fe89e345b339e8)
>
> Fails on musl:
>
> https://autobuilder.yocto.io/builders/nightly-musl/builds/719/steps/BuildImages/logs/stdio
>
> Not sure why ruby-native would fail on musl specifically so could be a
> host issue (its on fedora26).
>

perhaps there is a mix of modules from host and target.?

> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

