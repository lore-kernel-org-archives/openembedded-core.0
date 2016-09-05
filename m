Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD8F77382
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 14:45:42 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id x187so3253688vkx.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 07:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=xEWQ14gbRWpDFN59CUxdAkygKgWZH12WDx6K1GJZp8U=;
	b=gvs6HrqPBrPkIt+lV2yI1ejQzNKn7OP0bTiRXcrk2rn8u9NIvhX5dF8QvwOuFhCNVE
	wiaPEcm1QCbcAEGfbfe6O06ouK6SAROT9CMT5ee3ylUbEakcmvecTQf4NhKyoeQqzdKg
	A8CUKX7fJSu4Msqv8dYmT3RT4nvmseZHjM7XihWrCxeYSWWQooALOXrXg5Y2CtF2pFju
	UYOz4ht1wEDQNKmsWZNO5ptxgMRKetn/OdKr5YwTVm2v3DT5ar4zF7/CRc48hBu6ZJmT
	dV4c86WIa/q1neQmZInA6JOETJcyF1+32jxqxT5zI7FuTUcChfewUh9eRHM/iN7dI6ac
	1lhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=xEWQ14gbRWpDFN59CUxdAkygKgWZH12WDx6K1GJZp8U=;
	b=PKcpjFiR5/21anlxXOmV2iAAHIpeM5hzQFdbh/HbLuRxo9BZriKBp5L83N389BQyd1
	2AbnOrjR9dLoxLvL3ZmMa4abmcOuXTS3eXnJLT2mUhdIDSpJZwLZM0pP4v7xa8UJCwyu
	M1CPAKn9QZJ3YHB0FXE22hujl7nQ5Kxx/FRZZzd2e8EPL4Lr1jWbdYPsiyz5PvRBNzwF
	ALfbEqvjJszhC+QLy0bzNPIJIun0cZkvI0XrwYcQMnY3Xrdy0lR4mglVEd3iZ9rnpw8U
	8N/83s8nQgrMFkH0L7smuHKg1G0h8VC98TQmSmI35PTdITAAOBNMWGpZpLvCbdwtxePV
	L3XQ==
X-Gm-Message-State: AE9vXwNCj7OZ2ESavHUwvvxQo2bajXXQFODX3dIKTlZ+gMAM+YYB0AzbvyW4o0LaOTr7PA==
X-Received: by 10.31.13.197 with SMTP id 188mr22766998vkn.87.1473086743270;
	Mon, 05 Sep 2016 07:45:43 -0700 (PDT)
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com.
	[209.85.217.171]) by smtp.gmail.com with ESMTPSA id
	g194sm4188743vke.19.2016.09.05.07.45.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 07:45:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f171.google.com with SMTP id u68so8276249uau.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 07:45:42 -0700 (PDT)
X-Received: by 10.176.2.10 with SMTP id 10mr11784987uas.79.1473086741799; Mon,
	05 Sep 2016 07:45:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Mon, 5 Sep 2016 07:45:41 -0700 (PDT)
In-Reply-To: <1473086651.20226.14.camel@linuxfoundation.org>
References: <1472639558.29583.70.camel@linuxfoundation.org>
	<CAP9ODKq8Z8z4a7SoZoxzOz8GrEWnsoZZoL8Se++wMMWJp6yzsQ@mail.gmail.com>
	<1473086651.20226.14.camel@linuxfoundation.org>
Date: Mon, 5 Sep 2016 11:45:41 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpGJ3mSZXJgAX2Mi-z_2jFCQp4yJ5WE93K8taCrLQFcbQ@mail.gmail.com>
Message-ID: <CAP9ODKpGJ3mSZXJgAX2Mi-z_2jFCQp4yJ5WE93K8taCrLQFcbQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-modules: Update 2.7.3 -> 2.8.0+master
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
X-List-Received-Date: Mon, 05 Sep 2016 14:45:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 5, 2016 at 11:44 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2016-09-05 at 11:40 -0300, Otavio Salvador wrote:
>> On Wed, Aug 31, 2016 at 7:32 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > We need master for the changes to work with 4.8 kernels.
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> This broken for kernels which does not enable CONFIG_TRACEPOINTS.
>>
>> Up to now, the lttng-modules build were fine if this was disabled
>> just
>> printing a warning on the build. Now it makes build fail.
>>
>> The behaviour changes was made on:
>>
>> https://github.com/lttng/lttng-modules/commit/ca62d279e2e83fd46b8a04e
>> 6ad4471e9f8fc7c47
>
> Hmm, any idea how we should proceed then?

Is there a mechanism to check for a kernel config prior build?

>> Another thing I noticed is that we ought to be using stable-2.8
>> branch or name the recipe accordingly as master is in fact 2.9-pre.
>
> We'll need to rename it then as there are changes in master needed for
> 4.8 kernels which is why I upgraded it in the first place.

No; the 2.8 branch does support 4.8 ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

