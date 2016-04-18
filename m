Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 30D9A606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 09:52:28 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id a6so22091614vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 02:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=kySsAQ6NogQxC35kfxm9vGmBfGGJzwwzUcbbzxXzG2g=;
	b=G3SKc+TF6fti4xhWMoDKWPGHm5GJN76jPbUfve8ZeWY24hP2aTLqoEAQsvaQ1ikXpY
	TnXKR0bzP9fJkHzwPvVJqSwyeRlGxeQyIggNduitKEEPIWNdw7nkOQb6oZ+I1+BAx7fv
	dEGxXyVBKsOXrEQ2OVjcxt2a18OGlWXhflwaj3pHq9b6frZeJcO7KIeOYUrTypJ5dJ7F
	JD0MvOKnGfMLr7OCYVFIOyTnpJEuXinO8UED9IUKyyFSEtaTO5tYd8wOuSKw4xIA9jS0
	IGWXCJ5UKVIz9sHBs5ltkbMr5kA6A3HTR8wDJkstg7MrDr9NJB26cCJu3Uy3i4plEcAW
	vmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=kySsAQ6NogQxC35kfxm9vGmBfGGJzwwzUcbbzxXzG2g=;
	b=UJ5qgetaiiALH4DmN8WdC/AkzIVrK61ibi30azd7zQtsoQ6LN1IzAIQSffGhLVDBks
	e/h/1YgBn26I11e849v1DbkC2Vp2eCFed54XvPhOa0mc2tCFdXhbhJjNHsPpz1ZpFa8m
	P5idB/ZU9Z3pzVb8Z2utaGXST3ijpMjIFqw8Zh8Je0WE7ZsV1R8dxvAqOVlZD6nEr+fG
	09drSZWnONu+hpZiQ1ytM1QMA3jqnEgFuFGwbIbo8Du4iyeV0xYoee3JFIfLzzjDfYbl
	GLtAwAjWEoMvkT5Y4JLp0sPKZiKo957i+1vlbVvNqgazg55to9cgdq+dBaPynQr0XlQV
	7oUQ==
X-Gm-Message-State: AOPr4FXj+kAs1aEr87fQ5HRkMVdgDNBVrfoYW8jvn/lAGUJU8aPwyfkMGsUA9mi2nl82JLlXxfETagGuQG3a5g==
MIME-Version: 1.0
X-Received: by 10.159.36.15 with SMTP id 15mr5091950uaq.48.1460973149569; Mon,
	18 Apr 2016 02:52:29 -0700 (PDT)
Received: by 10.176.2.141 with HTTP; Mon, 18 Apr 2016 02:52:29 -0700 (PDT)
In-Reply-To: <5714AA1E.9020505@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
Date: Mon, 18 Apr 2016 11:52:29 +0200
Message-ID: <CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Mon, 18 Apr 2016 09:52:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 11:34 AM, Hongxu Jia <hongxu.jia@windriver.com> wro=
te:
> On 04/18/2016 05:15 PM, Andreas M=C3=BCller wrote:
>>
>> So remote debugging is no more available for standard settings. I am
>> tempted to send a revert: Installing -dbg causes bloated images and
>> debugging on machine is slow and last resort only.
>
>
> I think we support remote debugging better since -fdebug-prefix-map used,
> It is easy to construct sources paths.
>
> Yours remote debug was limited to original build environment.
>
> //Hongxu
>
>> Andreas
>
OK I checked the documentation for this. You say setting sysroot is
broken now. How exactly is your suggested option for *remote*
debugging? And please note: Installing -dbg packages is not an option:

* It explodes image's size
* problems are caused by having only one -dbg per recipe: due to
dependencies conflicting packages are installed causing build to break
* it is terribly slow: All source code is transferred by network
during debugging
* a quick starting up of debugger is impossible - a new image has to be cre=
ated.

Andreas

