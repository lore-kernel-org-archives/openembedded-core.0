Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4791C605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 21:26:58 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so18670763igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 14:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=u4q1rSEi64zPXI0/WoTgOIq50hi7w5jH0v6Yk8lKk9A=;
	b=iq7mcwwkShcaJUOLek6BPFC0g74d7iIz7LdEogvel1FL+gH7/MNFlq3clq37juREKD
	vP1/p2Xcu9LZNbaCe0K1yPRG6c1LSX3JKEYeDfYpZB+6SzVTgHjXrNVzpyi/2HAFgWxM
	6oLOWbY4Q4zmw/4o31dluJAz/gOJ/MySurNzGQgeeRKHiKpamDtxOvZ2jsg00y5k4MvA
	x7sqRDprQBbXFh6ueM5IIvANNywrrKTZ5PjFFTK1E2FidTtkbsf3L756nvd+1yPtknl7
	P7Smn6C7FOaf5ci5SD6V5Q7zDUYr6rKTLmJwcvyFadRfOtZXBWRfw2KZHmSZu24w3FhX
	DLLg==
MIME-Version: 1.0
X-Received: by 10.50.66.37 with SMTP id c5mr260190igt.26.1429219619997; Thu,
	16 Apr 2015 14:26:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Thu, 16 Apr 2015 14:26:59 -0700 (PDT)
In-Reply-To: <20150416103133.GA2341@jama>
References: <cover.1429170493.git.Qi.Chen@windriver.com>
	<c1c7339199e08085ed82ffed0d80356d5b177807.1429170493.git.Qi.Chen@windriver.com>
	<20150416103133.GA2341@jama>
Date: Thu, 16 Apr 2015 18:26:59 -0300
X-Google-Sender-Auth: lZhFSK7JJNaMf1tIfVrBC3GnUu8
Message-ID: <CAP9ODKo3uX+GQQKHWMRxvF26Gm9XW-V+rs54Hc8sQkJc3=dJ1w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] layer_extra_sanity.bbclass: add new bbclass
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
X-List-Received-Date: Thu, 16 Apr 2015 21:27:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 16, 2015 at 7:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Apr 16, 2015 at 03:49:19PM +0800, Chen Qi wrote:
>> Add a new bbclass for extra sanity check for layers.
>>
>> These sanity checks include:
>> *) conf/machine and conf/distro don't appear in the same layer.
>>    The rational is that distro specific changes and BSP specific changes
>>    should be splitted into different layers for better maintenance.
>>    The meta layer is an exception.
>> *) A BSP layer is not included if MACHINE is not set to any of the conf file
>>    it provides.
>>    The rational is that BSP layer, by design, is supposed to make changes
>>    specific for the BSPs it covers. Including a BSP layer which doesn't contain
>>    a conf file matching the MACHINE setting might cause potential problem.
>
> This is exactly the opposite of what the manual says.
>
> BSP layer should be written in a way that it has no unwelcome
> side-effects for other MACHINES (by proper usage of MACHINE overrides).

Besides what Martin said it is very common to have extra BSP layers
for customer layers which are used for some machines. For example we
have customers which mix Freescale and Marvel machines in same
platform and all work very well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

