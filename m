Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3A4BF776F0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 01:18:42 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id p64so448951pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 18:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=JH+qu7No9f61pQ9/QFutY78dymi5xeBD5XzKaetjCJc=;
	b=LnROfLkcdwlhJgR+Y5aybZGvVi3e9/qlHKv0U5RxChkVvMuMZ/3EQiHSr9/lIhkFLA
	FarjjG3NQoa3aTqpYDy7IMg0sOWGis0NohHjZFoMiWMgIp/p+ISlQf2EVKI8aTZm7td2
	LUsL7XcaYOX39e2kTW63EFAnTVX4JQUR5jMA+DPcrD48a2KX+mb+oTfHkDo6wYQ6v5OD
	nJBxZpZV5yq+ZruQoiDwfX2kWJtDpmkdgQhkdT6uavPuW62FXMF9HN6kICUfO/rR6661
	AKrtLCM/KJ/y7lyJcrMrOrhLojdVdEhIz8uMz4wB+YslHQNPdbYogtekZrJn5nrveHXL
	CsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=JH+qu7No9f61pQ9/QFutY78dymi5xeBD5XzKaetjCJc=;
	b=h8KTGn++QyatFTYGpiFl3w2zWC7YQDA9Co2CygS4jxffjxzUTBTivFRyLFxImqsKKV
	U/n65wYZoLyyogrmi4fso71o46tPtJrc5J0fp+3WWnW7aYx1IW3fgUL4x8geclqlO/+R
	PuA3IPj+dRRY8icC8IKSRoYtpyS2GgtsAgPYRPqC0+WaQ6FUvioatPyBM6t4pyQTkcOL
	kmXjNVxW3sO6AIQ9SP9UQ03GdOzmFSDYZya9n3MSRjvQWjXB1s6LZ59FIThcI/krfDgg
	GZLVkxAFlX4d7Q277aBaPobRcqweq5PShohfRyYU2dzS+txKqWQaO+DO3AFfvuRpC217
	0tFw==
X-Gm-Message-State: AE9vXwOJGv+pnhr8fMLgnE1D2wzdadM2OAYX0hhcmmYmvxF6BZlMeh8KltLvxbJ+Z86FXA==
X-Received: by 10.98.135.204 with SMTP id i195mr2626844pfe.144.1473211123333; 
	Tue, 06 Sep 2016 18:18:43 -0700 (PDT)
Received: from [10.22.11.169] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	ww14sm43811244pac.34.2016.09.06.18.18.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Sep 2016 18:18:42 -0700 (PDT)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <1470256891-20386-1-git-send-email-tanuk@iki.fi>
	<1473156037.3139.82.camel@iki.fi>
	<8545e7af-49ad-8975-01d6-ed9d2cc6c577@gmail.com>
	<CAP71WjzGB=GOXnwMCV0eZ0MHH76L8fbg3oOokVqxmiSGCXFjDw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <58059020-a29f-e160-9db9-c8b6a865ea70@gmail.com>
Date: Tue, 6 Sep 2016 18:18:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjzGB=GOXnwMCV0eZ0MHH76L8fbg3oOokVqxmiSGCXFjDw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][krogoth] pulseaudio: fix crash when disconnecting bluetooth devices
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
X-List-Received-Date: Wed, 07 Sep 2016 01:18:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Nicolas,


On 09/06/2016 09:08 AM, Nicolas Dechesne wrote:
> On Tue, Sep 6, 2016 at 5:44 PM, akuster808 <akuster808@gmail.com> wrote:
>> On 09/06/2016 03:00 AM, Tanu Kaskinen wrote:
>>> Ping? I sent this patch for krogoth (and a similar patch for jethro)
>>> about a month ago, but it hasn't been applied yet. This is the first
>>> time I'm sending patches for past releases - are there other hoops to
>>> jump through than adding the [krogoth] tag to the mail subject?
>> I have this sitting in my krogoth-next contrib branch. Did that right before
>> my holiday so I did not send out a message.
> while it is actually useful (and easy) to monitor master-next branch
> since it's in the main repo, it's not the same for the stable -next
> branches.

Correct. There are no next branches for the stable releases. It has been 
brought up before to have a common location for maintainers to push so 
it can be documented and then the community at large will know where to 
look without asking.

> Could these branches be pushed in the main repo or could we
> have a link in a handy place?
git://git.yoctoproject.org/poky-contrib akuster/krogoth-next

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akuster/krogoth-next

>
> and in the short term, where is the current krogoth-next branch?
>
> thx

I hope this helps.
- Armin


