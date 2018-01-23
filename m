Return-Path: <raj.khem@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9F43778784
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 22:43:07 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id d7so1939534oti.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=A60cRMFm2auNc0vhAZJgQo47jiztiLFJkvtc5WxVNGU=;
	b=u0BFm5kK76F8Jgm9hlvcCv2mn1pJiuPef/tAKDcFTKx0rOTl/lOfnySzAdf9Sd8KAI
	Bj10qvnyfS78/EYKyzH78kZbuOdN4RgAj8FQRaXYgew9a+37/KTvhCOxgYeMnOpa7p5P
	1aSkp8XvApxMIpTo53+edWoL8dBJSSe9yudwa7wpdgG2O9gyLj/TSvbfZjM6W/Q6ne+2
	lFXotmq8zF6l7nui0zabXfJtc00z3VnVSVYNfm9oOvt2v/ieGwcE+J7fWk9tCwgTwRPt
	vWa0I+RdIRehC2x5bmBz3esYSwjWLtWsxFkq5avB4PqnnYSXyXZnOqcLVj4Z+N1kKPQV
	ALUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A60cRMFm2auNc0vhAZJgQo47jiztiLFJkvtc5WxVNGU=;
	b=M24s9SOevO3Mzlf4jkxUnERm6LT11yPhI/SNJUIg0Cmr/DYYJtAVlxR7L/Z+KNYna6
	Me6tqvUJgPcFZ8xMhV85cIbPzjSoVhXFIxY0m0B3uE8zV8nAb/Y+fB6GgEsJEs/Yb5PQ
	Ra7addzpQt/OzJZgcIdSVYqdOkblCBs2Wu3AdY0lyGTtj7r4kGw4vl74EEisDbzKmpTr
	5CPyaVaWnEHIBqtTEtvZM/VsG5f4ZlRhwEKrrvWBEQXx7evXOS1v8O9fHh5Y6BX5hw2o
	fR2Iv1QiUHVvQDioH7IPbon5N3pOA1hnLq5F8GqRJ+yfbZ0MF5v+s1+tvtxSq+vAI+fD
	K1Tw==
X-Gm-Message-State: AKwxytdvbADowCnDA7cfT8zvnRubUZ8ldCEU5EnMnPtTnnGmFpX2LdEN
	k9DNR8nJxg0NpHG3i2yTB4/d8C+k
X-Google-Smtp-Source: AH8x22566heqB03qFoKHwUJfA9GIlIbwA4B0QqMMgkfis4ibuIyes2hnOJXxyMcMUDSAwI/Gh87wNg==
X-Received: by 10.157.60.112 with SMTP id j45mr8540276ote.399.1516747387991;
	Tue, 23 Jan 2018 14:43:07 -0800 (PST)
Received: from [172.27.88.30] ([217.140.111.136])
	by smtp.gmail.com with ESMTPSA id g9sm663154otc.51.2018.01.23.14.43.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 14:43:07 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20171212024917.14550-1-allenwild93@gmail.com>
	<1513068908.30397.2.camel@andred.net>
	<CAN33hf_0Y1=fCKmFYeCCZdVcEGyMjeUZHSkMzMiZP0z1VC5jmA@mail.gmail.com>
	<CAN33hf9ntsO=MfoRExd==qHBTV5h0tgkAZqZTzr9R-yQK5ZcUQ@mail.gmail.com>
	<CAJTo0LaCuoNPtTeKGqcvCsCMHqvLNq3w0U-RvhSg-dM-dmitTg@mail.gmail.com>
	<CAN33hf9qNwzWRRayMQ-t_PqEceGZJpULEP-_UBUe-1xnbYJAUw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <a96dea68-7bb1-3421-70f8-a7c4d53aa472@gmail.com>
Date: Tue, 23 Jan 2018 16:43:06 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <CAN33hf9qNwzWRRayMQ-t_PqEceGZJpULEP-_UBUe-1xnbYJAUw@mail.gmail.com>
Subject: Re: [PATCH] syslinux: always use the BFD linker
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
X-List-Received-Date: Tue, 23 Jan 2018 22:43:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/16/17 12:57 PM, Allen Wild wrote:
>>   LD='${LD} -fuse-ld=bfd"
> 
> This doesn't work because the -fuse-ld option is only relevant when
> using gcc as a wrapper for the linker.  The Makefile calls
> x86_64-oe-linux-ld directly (which is a hardlink of
> x86_64-oe-linux-ld.gold or x86_64-oe-linux-ld.bfd) so when the linker
> starts up it's already Gold, rather than letting gcc call ld automatically.
> 
> Syslinux calls LD directly to use a custom linker script and avoids
> linking with system libraries (not uncommon for bare-metal programs like
> a bootloader). The -nostdlib gcc option can be used to get the same
> effect when linking with gcc as a wrapper, but doing that involves
> patching many syslinux makefiles to prefix LDFLAGS options with -Wl.

you need to override LD in recipe much like how KERNEL_LD is setup and
then ensure that LD is honored by makefiles
and sets LD to weakly assign to 'ld' to fix it properly.

> 
> I have a working version of a patch that does this (19 changes in 15
> makefiles), I can submit it here after some more testing if others think
> it's an acceptable fix. I ignored the EFI targets for now, but such a
> patch could be upstreamed after updating and testing the EFI code too.
> 
>>That's a terrible implementation of "install"
> 
> I agree, and I think that the fact that libgpl.elf and ldlinux.elf are
> getting rebuilt at all means the current recipe violates upstream's
> "don't recompile the bootloader itself" wishes in doc/distrib.txt. The
> tarball we use includes shipped versions of those elf files and a bunch
> of c32 files, but for some reason make is deciding to rebuild them from
> source when we run make install. I haven't been able to determine why
> that's the case.
> 
> Allen
> 
> On Wed, Dec 13, 2017 at 6:53 AM, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
> 
>     On 13 December 2017 at 02:42, Allen Wild <allenwild93@gmail.com
>     <mailto:allenwild93@gmail.com>> wrote:
> 
>         Oops, forgot mail the list when sending my first reply.
> 
>         I tried appending LDFLAGS, but it doesn't work for syslinux. It's
>         during do_install, not do_compile, that $(LD) is called directly to
>         link libutil.elf, libcom32.elf, libgpl.elf, and ldlinux.elf.
> 
> 
>     That's a terrible implementation of "install" and it should be using
>     LDFLAGS, so that's an upstreamable patch.  As Andre says, adding the
>     flag to LD directly should work.
> 
>     Ross 
> 
> 
> 


