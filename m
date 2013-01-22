Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Txh2G-0005Ty-Kt
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 17:49:21 +0100
Received: by mail-pb0-f41.google.com with SMTP id xa7so4066488pbc.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 08:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=6pmYV33nlanJ0jy6TEUl7DIPywrmxPuyrR744b3qvtM=;
	b=F7vo95pGTaFMcZLzl58Yy6PuhUX2PICrZ62B8L5UmLqHFext2pGAr84NyFt4alpc7j
	kG3BtTRfFEeHK9eXLd0mloU5xKgBZIMhKoADGfzG5uu8BBZlMrUWPsvZSChcm5sxsqKz
	5JpAOu8Iy+tpQdP/fxDrjUnHPd0uOnUeHvPpf9zdIwALa3omuLY6LYmw4V9NElKtnIRv
	67IbLqYhEtwVwpvkDBV2eoElmmLOCLBlBIKcfkhfenqHnIR+wJEWBR6LfkSqPYsypyz7
	OQx4EPyScrRo5f/TdXNh3z55Jj3gK9Khdnp5N6f8IPnCx8a3rjTZEIJL2/XsvtU8h5bW
	8Lig==
X-Received: by 10.66.82.67 with SMTP id g3mr57345685pay.58.1358872429618;
	Tue, 22 Jan 2013 08:33:49 -0800 (PST)
Received: from [172.23.9.30] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id tq4sm11005205pbc.50.2013.01.22.08.33.47
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 08:33:48 -0800 (PST)
Message-ID: <50FEBF6A.40305@gmail.com>
Date: Tue, 22 Jan 2013 08:33:46 -0800
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
X-List-Received-Date: Tue, 22 Jan 2013 16:49:23 -0000
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

This was not the intended use of KERNEL_LD IMO.
There are is than kernel that does not go well when using gold, I think 
the right approach would be to check ld-is-gold being present in 
DISTRO_FEATURES and appending '.bfd' to LD variable like other recipes do

>
>
> Enrico
>



