Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB6860778
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 01:07:47 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id j19-v6so12159668ljc.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 18:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nxFD5j2ycT1VHsJiIDAOYRleLILzXTF86uXzSLSgzcU=;
	b=lJBZ6l0Px3vUyxNzv8M1mu8cpgf3xRukNYoRu6fHsqkDda7zQAMW+c//UskdQRBy1j
	0FQOO0aIxTAz+kdNimfidoZp8dkHYdTfFns99fG2ygRLoOumuirWthdPihYFvrq6QlQC
	bAoUtsV53KcgzYWpaM3F3b84n2mc1ZGbFtkUBAuk34H4Te8M/hadFWUuqXGa/XJIH3PY
	lbDBayKUVAkoI/TNP7MmxnLMjAIvyueGgAZI5kVLKUx25SrEUKSbZxR+EUr6qlIu3+4f
	VYgTmaCyw1bHZgk5zHVbHk+PKoQJq07NErye4P/X+oP0fm3FEb25J2om6vRGRqEY2UEq
	8iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nxFD5j2ycT1VHsJiIDAOYRleLILzXTF86uXzSLSgzcU=;
	b=lNENaemt8looNwNbILTotwWUZV/CnEd1kI54FL06BCLZA/s6HHKwmkEmzLLbZEncMr
	PrCp4kdn8BwdlNMihify3zAGW+p+LjQTJDXyc2XWhVvVxTAVmQcI3fhUvEyZyOi7iKi3
	fBUmjsOI5JReyssRU0hqylepNDXYsQSoKoQRqjD7I7HorC/cO/9Mjft0D76vlM34x/T+
	dYb/vYNnjUIXP2Wpon8ElcqtodKKp3uwOPxw1NYfdEOGAGyLDHRGBmJnHs+2KMW4TGV6
	0fZ+U2w4ThOkSVDXcf7ixEMFSSGxELHPIg6AydUsxHpfSsamF7Q3glgQS+csS89VpYV8
	Qu7Q==
X-Gm-Message-State: AOUpUlFDVGTfvZPnE4i/nQN6vzn0E4vrNQc9SdnKSmUFCFoHOy5CkGMF
	hH/qswwUIuBnEplI1aB/Daoiq9u4BJRGTwR8y85gag==
X-Google-Smtp-Source: AAOMgpfDMqqPNtfiyd0ATCASfKJ3lXjXSXhNLnfR6QdN8OnV4Fexc1BAbl58C66NjlGmj4gzr0FKq0BegNUcbDqOp4s=
X-Received: by 2002:a2e:6a04:: with SMTP id
	f4-v6mr14947799ljc.109.1532999268477; 
	Mon, 30 Jul 2018 18:07:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 18:07:47
	-0700 (PDT)
In-Reply-To: <b0cb192801eb2e85702f319ad0a0cf33bbd2c239.camel@linuxfoundation.org>
References: <1531151586-30557-1-git-send-email-bruce.ashfield@windriver.com>
	<8e3f9ec13333061ecb0125e153df668abe8da1b9.camel@linuxfoundation.org>
	<1cc72609-d849-f8a3-6524-1f7d9ad214c3@windriver.com>
	<b0cb192801eb2e85702f319ad0a0cf33bbd2c239.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 30 Jul 2018 22:07:47 -0300
Message-ID: <CADkTA4MMXEsggwEQHrfQF32ERY+2o9a1_0VsK1upxzcxn+g8Ew@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Tue, 31 Jul 2018 01:07:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 30, 2018 at 7:26 PM,  <richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2018-07-26 at 10:04 -0400, Bruce Ashfield wrote:
>> > https://autobuilder.yocto.io/builders/nightly-multilib/builds/1139/
>> > steps/BuildImages_4/logs/stdio
>> >
>> > Error: Transaction check error:
>> >    file /usr/bin/libtool from install of libtool-2.4.6-r0.0.i586
>> > conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64
>> >    file /usr/bin/libtoolize from install of libtool-2.4.6-r0.0.i586
>> > conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64
>> >
>>
>> And that leaves this error.
>>
>> I've not been able to reproduce it, and I've been looking at the
>> elfutils RDEPENDS that is part of kernel devsrc, since that is what
>> pulls in libtool as a DEPENDS.
>
> I've just sent out two patches which together should fix this one, they
> did locally at least...

Nice. I see them!

I have a v2 of this patch ready to go, but am out of the office for
the next few days. When I'm to my final vacation destination, I'll log
into my build machine and send that patch.

Bruce

>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

