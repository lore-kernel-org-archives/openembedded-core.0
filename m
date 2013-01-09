Received: from mail-ie0-f177.google.com ([209.85.223.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TsxBh-0004CA-W9
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 16:03:33 +0100
Received: by mail-ie0-f177.google.com with SMTP id k13so2171333iea.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 06:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sXv9XKU/l8qvfLAmzI1uPBAwINyZ/hbgz9lcXzK2aRg=;
	b=w6pCLRCx49lkRcYEi4R23RN4YZyXrV8NwBGsBVe4Su/8GKuJGjNh7QWCHL2wSKtd5e
	z4OuhnEUpqtThCDRxK1QVym1qKtFzUgcjlbgl6hDAnIgODvSKfaWPa1xJZ0Ftnrk03OU
	DX/0sweo3ISZIZIlNrseXkZqHuLLSXO87R2aAdD3VjoHL+sW3FOnBj6lS82YYmEvLBgD
	39IpenSMFY2KFPbtHGvFI1o3w5qZgTRDU6BDXn1NHLVSCClHAjBv+b2rac6POTDvNFVN
	+rwlpj85eiyAdthupMjm+u8buT0uNDb4tvWyqeED2EXgP82oyMwsvng4umNXXTD8v1Cj
	QG5A==
Received: by 10.50.179.71 with SMTP id de7mr1857988igc.84.1357742897360; Wed,
	09 Jan 2013 06:48:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Wed, 9 Jan 2013 06:47:46 -0800 (PST)
In-Reply-To: <50ED56C1.60809@linaro.org>
References: <cover.1357343832.git.raj.khem@gmail.com>
	<50ED56C1.60809@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Jan 2013 06:47:46 -0800
Message-ID: <CAMKF1spZvgZwUjnV=tVXi490Gqwexq5p5+NEAm5Ri36FEdwUFw@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/4] eglibc 2.17 upgrade
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
X-List-Received-Date: Wed, 09 Jan 2013 15:03:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 9, 2013 at 3:38 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> W dniu 05.01.2013 01:00, Khem Raj pisze:
>> I would like folks to try and test this upgrade. I have tested it on angstrom/systemd-image
>> booted on all supported qemu images.
>>
>> This is however now the final set since I have to put the 2.17 tars on
>> downloads location
>>
>> Please try it out in your configurations and let me know if you find issues.
>
> bitbake meta-toolchain fails:
>
> Applying patch ld-search-order.patch
> patching file elf/dl-load.c
> Hunk #1 FAILED at 2107.
> Hunk #2 succeeded at 2283 with fuzz 2 (offset 114 lines).
> 1 out of 2 hunks FAILED -- rejects in file elf/dl-load.c
> Patch ld-search-order.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch

hmm this is weird. let me see whats going on here.

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


