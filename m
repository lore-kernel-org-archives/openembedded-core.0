Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0437E437
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 14:56:38 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n15so7211068wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=y4Ue6qPFjFFXcBUjbAFvGscUJdpZOd7ErVVlEEks0/8=;
	b=YRv/EZwVMTziLwLv4aW5zwIGdYwsffVG8MY+6oqQluqNNbsbfkwKId9COV8DK37DNy
	2ZFvi0AP6O2SFNNmqvQ7PUrgrMBAmJffUpaBxv3Wsz0vsCdNXcqcA4prmh4MVf12T3vQ
	LbUhVTKCzp2hCI8scdBM83JML+nygQrCILWfEQVFO1nebADVm1jyMS1Fa9xO4T4cO+rA
	BYHDTClGitTyLXuyTF9sldgBfDevbk9apQTyoGeISdvvnQneDOCi5I6cVVpIV/KYKSoX
	Kzj+bo6s1Ms9wk13Ek3uVeecHeF9ijyCE+7dlUEkjXsZpinBGBZKuQey+IxjPtibX5cA
	AsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=y4Ue6qPFjFFXcBUjbAFvGscUJdpZOd7ErVVlEEks0/8=;
	b=WmeItYaYRljyAN0FWw3eK5bZb82AAItoqsuIg/W4caoE9nvpJF6r456pW5iCgSe76L
	wsyfq9UX81hKg5n+zOrA1GICWeNPN8AmfduVJ8NVcdQ/oBJwy64yw7+rwooS3c6fYB2d
	i7HjjZNSNyuSqwB1vFUdDJqZUQXwayvGzQbU0RDmAS9RxuY+Bc7CNuwlE87tbRKo+Ioy
	N/y3l/md4Dw7weHhd/kjz92pIvXAxIQas4leR3UdRyPMXbeGUTyn62SHtFFINutRfJva
	wrvfXrzb0Br+l8RocxtD7n5s/aTrP1zIBP9KlY5fBWdsakgFh0DKcmPtwojQFZsiKVWE
	ME4A==
X-Gm-Message-State: APjAAAU1+Wki8JDEzhKoZXk7zv/mg7bq6ZbM1H+clcqr820RHi/k8EzG
	NBS65mGc1uOqe6igdH8N0GdRe7nIhvE=
X-Google-Smtp-Source: APXvYqxq4ZBWS6ueqedFDnL8BGc1O//sfdFoNtFZynZWf9siKF3HOxsLAiNk5rqAUVpcPwnwji+pVg==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr11859027wrn.334.1572188198872; 
	Sun, 27 Oct 2019 07:56:38 -0700 (PDT)
Received: from [10.192.11.162] ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id
	a17sm10399956wrx.84.2019.10.27.07.56.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Oct 2019 07:56:38 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <a5bb0fd6ed961516f649139e41cbdddf42ce17e2.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <52271207-9556-e9cb-667b-0b2d9916a0d1@gmail.com>
Date: Sun, 27 Oct 2019 07:56:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a5bb0fd6ed961516f649139e41cbdddf42ce17e2.camel@linuxfoundation.org>
Subject: Re: qemu rebuild contamination
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
X-List-Received-Date: Sun, 27 Oct 2019 14:56:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/27/19 2:57 AM, Richard Purdie wrote:
> I've been trying to figure out why we get a weird build failure with
> hash equivalence enabled. Armin has also been searching for an odd
> issue with warrior and the qemu tests. I may have a lead.
>
> If you build a standard qemu:
>
> "bitbake qemu-system-native"
>
> and save off the resulting qemu-system-XXX binaries, then add:
>
> PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"
> PACKAGECONFIG_append_pn-qemu-system-native = " virglrenderer"
> PACKAGECONFIG_append_pn-qemu-system-native = " glx"
>
> to local.conf, then:
>
> "bitbake qemu-system-native"
>
> it rebuilds as expected, save off the qemu-system-XXX binaries,
>
> then remove the local.conf entries and:
>
> "bitbake qemu-system-native -c configure -f"
> "bitbake qemu-system-native"
>
> then save off the resulting qemu-system-XXX binaries, you'll find that
> whilst these first and last sets should match, they don't. Its obvious
> with "ldd qemu-system-x86_64" that the linked libraries persist from
> the second to third set when they should not.
>
> The reason is that when configuration changes, autotools.bbclass will
> wipe out ${B} however qemu doesn't use the autotools class and hence B
> is not cleaned for changes in configuration.
>
> We could abstract the pieces of autotools.bbclass which do this into a
> separate class, or, easier, have qemu's do_configure wipe ${B}.
>
> Armin: This may be the issue you're searching for with warrior?
You mean the virgl failure? I did set the native packconfig to make the
selftest and that had no affect. In facted, Zeus has the same mismatch.
Alex's patches I believe align them to match.

The virgl failure is fixed using an updated version of libdrm. I thought
I sent an email about that.

- armin
>
> Cheers,
>
> Richard
>


