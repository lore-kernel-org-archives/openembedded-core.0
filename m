Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxhzV-0007PJ-BT
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 18:50:33 +0100
Received: by mail-pa0-f49.google.com with SMTP id bi1so4206408pad.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 09:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=EwIA5IU00HNa3k+5qIdU/hW3Ziy7TJ0q/T/1ZKrAztk=;
	b=rqJKIHOwpQb/dDLviTgHmkYC5fW3fJPocjZaywMw2eO10AnxloRwfaQGCagBsy64wO
	janQPVysPSPVEbFfYUMhPdgxn9c+BjJzZlRcHPlyIF4nW+7zF48A1lrCUcH4GJ+Hc3dL
	gt6dZT6Wxs09t6hqVpPQGR6NP/Xba5YlZoSinrDmMwa7MpQ4oKl9aIUFPk8OtDzf+JzS
	PmsPlURu7o5AE5U70v+k+FzP6Eh1y4AnHHwE/1LNoPwxxnXdUmNrCt1aTJ3TtxDQpnyF
	u2QSkCgPfksiUtHvwICtXYTdjZvsY7DtezY3CkCZo9gBn9/lV8chN3q+Ut9d6j7VZVe7
	Pn4A==
X-Received: by 10.66.89.199 with SMTP id bq7mr58180170pab.26.1358876102227;
	Tue, 22 Jan 2013 09:35:02 -0800 (PST)
Received: from [172.23.9.30] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ue7sm11085362pbc.53.2013.01.22.09.35.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 09:35:01 -0800 (PST)
Message-ID: <50FECDC3.8020407@gmail.com>
Date: Tue, 22 Jan 2013 09:34:59 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
References: <cover.1358634922.git.raj.khem@gmail.com>
	<613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
	<lyobghp6nh.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyobghp6nh.fsf@ensc-virt.intern.sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 17:50:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/13 7:41 AM, Enrico Scholz wrote:
> Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> +KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
>> ...
>> -KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
>
> that's bad... gold linker has serious problems to compile stuff like
> kernel or bootloaders and setting 'KERNEL_LDSUFFIX = .bfd' was a good
> way to workaround these problems.
>

something like this patch here

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=70b3efc5fc4b31f8ad17c23e77e80cb6abcac258

should work for you. Can you try it out ?

>
>
> Enrico
>



