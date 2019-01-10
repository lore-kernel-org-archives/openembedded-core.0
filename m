Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id AFC317BFB6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 20:48:15 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id t13so5686145ply.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 12:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=OYfeQRWRxKwHUn5AmVpYOdxVvaeAU0Jb2Nf0wy8+Sog=;
	b=uXxlUhVUn1B5bAybpjv/cM63z6ojMyUCSiZ8MZDb280C6GywYwE22WBx+Y7k2vNDyR
	nO81fzqXNkIEUyGQpKkGbj/ht4WbNx3uRFx76HWUIXHucK7Mz0Jvw4Az+p/W3U0avo0J
	yRsopJN+tB4rOTbKVr4n46spqUmqPcpPHax9o8f9b0uudObc1od8anOnM0BWzpbsRCAH
	qF/GvNAu6BHf3VeG3hfRBoHj7bpdEfYcAz7POd4WBjNQUprYy9OKCtU0RGp9cNJIwNwA
	MTjCqoI0Nas5z9nXWQFQ+NuJZE1DJsEa4ZLbXJli42L+Wo1KNLmyg8mK/dHFIFe5DqHU
	MKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=OYfeQRWRxKwHUn5AmVpYOdxVvaeAU0Jb2Nf0wy8+Sog=;
	b=T8KcICwVciLuZWeEZYOhj11lpQNXcPXWcCuietrESsItGHUYgh3UYhdWGaLWOJuiYu
	JmbkLsXYFblwfgvPDc0HIOWahWwl4Z0JXoF/zXuX2M+I3UoD3AIzQwAd464+KxdrFpe5
	DT3nPua8Us6QLl7gSSaiIlDVBh7LhzAxZchbZCpRaX9aD7OLAafu8oqUQwr/k5G5e4Wh
	t92nM6g5h1yx3+3Qhrtt0tFSiR5LOE2vZKZT396gC46pKZsqt0lfDd3M1gyeTK+f+YcC
	VYc6RiEALOx50q5y8ZQp5Nk/qubitEys01sNjqidi2vfz7dc08dqluZkhO4gCgKWs37a
	5+tQ==
X-Gm-Message-State: AJcUukcMDbU0WdJyp9ZEeVQ2s+G/7xq9oxhPTrl8nLib+rgqf91xZgGA
	ZARanUghnOBf98/JS4HU31+Z4ozg
X-Google-Smtp-Source: ALg8bN4DflqZFFP7sKJQCecoJuqD+uDspzj26yGcUjLyobNeIjB1P3OFz51Vw0ukvRludvaf3nTpOg==
X-Received: by 2002:a17:902:24a2:: with SMTP id
	w31mr11629854pla.216.1547153296507; 
	Thu, 10 Jan 2019 12:48:16 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:f95f:7cf9:fdd5:fd56?
	([2601:202:4180:c33:f95f:7cf9:fdd5:fd56])
	by smtp.gmail.com with ESMTPSA id
	t12sm119991007pfi.45.2019.01.10.12.48.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 12:48:16 -0800 (PST)
To: Ferry Toth <ftoth@telfort.nl>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <bb4e7e77-fc77-d180-cf50-aecc92c42c24@telfort.nl>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <af7fc6ac-01d9-8132-6ca7-1586afc3bc57@gmail.com>
Date: Thu, 10 Jan 2019 12:48:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <bb4e7e77-fc77-d180-cf50-aecc92c42c24@telfort.nl>
Subject: Re: Sudden errors building Sumo
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
X-List-Received-Date: Thu, 10 Jan 2019 20:48:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/10/19 8:23 AM, Ferry Toth wrote:
> After a new checkout I am experiencing multiple errors building Sumo
> that might be related:
> bison-3.0.4
>
> cross-localedef-native_2.27
>
> coreutils-8.29
>
> On another machine with slightly out-of-date Sumo these problems do
> not occur.
>
>
> Detail below.
>
>
> Any ideas how to fix?
Can you provide how you are building this ie, local.conf, MACHINE and host

What are your before and after commit hashes used?

- armin
>
> Ferry
>
>
> virtual:native:/home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-devtools/bison/bison_3.0.4.bb:do_compile
>
>
> | ../bison-3.0.4/lib/fseterr.c: In function 'fseterr':
> | ../bison-3.0.4/lib/fseterr.c:77:3: error: #error "Please port gnulib
> fseterr.c to your platform! Look at the definitions of ferror and
> clearerr on your system, then report this to bug-gnulib."
> | #error "Please port gnulib fseterr.c to your platform! Look at the
> definitions of ferror and clearerr on your system, then report this to
> bug-gnulib."
> | ^~~~~
>
>
> /home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-core/glibc/cross-localedef-native_2.27.bb:do_compile
>
>
> | /home/ferry/Develop/tmp/out/linux64/build/tmp/hosttools/ld:
> argp-fmtstream.c:(.text+0x525): undefined reference to `_IO_fwide'
> | /home/ferry/Develop/tmp/out/linux64/build/tmp/hosttools/ld:
> argp-help.o: in function `argp_failure':
> | argp-help.c:(.text+0x20b3): undefined reference to `_IO_fwide'
> | collect2: error: ld returned 1 exit status
>
>
> virtual:native:/home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-core/coreutils/coreutils_8.29.bb:do_compile
>
>
> | ../coreutils-8.29/lib/freadseek.c: In function 'freadptrinc':
> | ../coreutils-8.29/lib/freadseek.c:68:3: error: #error "Please port
> gnulib freadseek.c to your platform! Look at the definition of getc,
> getc_unlocked on your system, then report this to bug-gnulib."
> | #error "Please port gnulib freadseek.c to your platform! Look at the
> definition of getc, getc_unlocked on your system, then report this to
> bug-gnulib."
> | ^~~~~
>


