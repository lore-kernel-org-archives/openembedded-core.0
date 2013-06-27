Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 42ADD6AD3B;
	Thu, 27 Jun 2013 02:49:12 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id ma3so258636pbc.35
	for <multiple recipients>; Wed, 26 Jun 2013 19:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=exqXSJ2aeNfCi/TBXkpTMg28lZV8RU0HD0e5efPf5Fo=;
	b=hFXypF3UOLVzVBvw/qaryKLACIi7jZesafpf/0g0tl8CTsrJ3lH9kDN4P/39EnXWU8
	iceXPpIr+A7Sxb3Bbpcz+74OW/BmFStuzoUAQwjRjlYKL5Jovpn+Cn8LFvLpdO9ZKG5v
	jsmZAIxNaixwilGidp3hbwUbk3gxmPg9dQuz4IKL5pUnXpKH1yyAy0v0hAzquBb2fr4Q
	AUbt6mkyfvgEunQrzxYQTHMdpvE+c0rtB8ENPSMxuS2PjxXv1pKSHO0FwrMm79rtRTBN
	JZifxTg7WAA7nvfgMIBZjZUD33ZLgXZrsVBN7qEu6ySngmUy4sedubAIWYYExrOWrUoG
	uhkg==
X-Received: by 10.68.36.230 with SMTP id t6mr3698960pbj.15.1372301353343;
	Wed, 26 Jun 2013 19:49:13 -0700 (PDT)
Received: from [172.23.5.122] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id kc8sm840689pbc.18.2013.06.26.19.49.11
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Jun 2013 19:49:12 -0700 (PDT)
Message-ID: <51CBA826.3070701@gmail.com>
Date: Wed, 26 Jun 2013 19:49:10 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1831F7C6-54BC-4E5F-BC00-1B8C17E8D1FD@gmail.com>
	<CAP9ODKqVqLxQ8QNY_1DDJGjRSrW=6YsiHdwPjpzE9EKmybQ4+Q@mail.gmail.com>
In-Reply-To: <CAP9ODKqVqLxQ8QNY_1DDJGjRSrW=6YsiHdwPjpzE9EKmybQ4+Q@mail.gmail.com>
Cc: "yocto@yoctoproject.org \(yocto@yoctoproject.org\)"
	<yocto@yoctoproject.org>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: eglibc (would be 2.18) recipes
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
X-List-Received-Date: Thu, 27 Jun 2013 02:49:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/26/2013 06:46 PM, Otavio Salvador wrote:
> On Wed, Jun 26, 2013 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi All
>>
>> I have put together eglibc recipes for upcoming 2.18 release and pushed to a contrib tree here
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/eglibc-2.18
>>
>> They built angstrom/systemd-images fine and booted OK on all supported qemu machines
>> on OE-Core
>>
>> Please test them out in your configurations and machines and provide feedback, lets weed out
>> the issue early
> 
> Could you also make a tree based on poky?

the patches should apply on top of poky as it is.

> 
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> 


