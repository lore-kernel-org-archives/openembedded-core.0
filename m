Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4417F893
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:47:26 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 3so10638155pfb.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=0+X+7JIXZOTvciAnV37eh3Q+nrKrTEQCiw9V3GvVyGk=;
	b=exRVhg4ct3xAAnv3K68/7i5QKfZ4rJ8dxupIstAnxgE0PJZHllvZsNGrXg5OnTnv7B
	D4BwcWdz/muJ5mriAAQD4FbguOLs4sDXkgV7E7Jb2FPTpL3vz7zpAt2g7vYV/m/23r57
	9O/qjl1gvIzqvnXXb9yagTzUy4wshrx6RR6tWDmfWs2H0c8c2EtHmI8/R0SgO7rfrT5W
	YO62CZVFOt7sUpQtuGy6PbRtMoufPnlR/xuDcuPMDwL++4hJWtRZLKOy6snt54eBJ8OX
	Xypp2FjYT6iGAIoHxHy9UOfJyldeDebm9LETklQk2I6v2qgEQdlV7c6eBX1dCiCrdYIv
	eVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=0+X+7JIXZOTvciAnV37eh3Q+nrKrTEQCiw9V3GvVyGk=;
	b=LP6sfVf4pzAlB7DCzxy8EDu065mQOv/v8RTmb2oAJ8db/uEXJ7/spmXLWg1ZRke0Nx
	R2RQHi26VM1iBvYRINQT/URLZS2q5Eg52NfTQ2MjL7RkGJP8xW7JeLODOyzv6xHXCXCA
	y5pqGBZ/ADKVp/iP0Rc4buUzT3gmttwCMdCd86xFjuI9mb3qTa0ruqzBWf3pXwBwOgRn
	PX2PjuAZbf8Puc8S7Xe/+DXwbSTFnqKkNUH5b6URCnr1ERhObIsgZ6EbIty/4AEXetWB
	vEirIGeKNPnAuc9B1k3Bx+t+LoHVRAO7tv40b6PuInaT9Tx/wusJMmZsvubyd33WrxVT
	hsyQ==
X-Gm-Message-State: APjAAAWEePqbrgb/pSk7/SecbCpju1HbRJDbhB9HYtXdHgM/qoGJg5z+
	ZFd6PanJRO3VXQtstf6NnPU=
X-Google-Smtp-Source: APXvYqx3p1czwQGeHojU848O3SPJRalE6AMjWE0i1QMLaEsbUllJ/1CFGoVasUGN7wHp3yC+A1Zfpg==
X-Received: by 2002:aa7:9f08:: with SMTP id g8mr222920pfr.59.1574095648081;
	Mon, 18 Nov 2019 08:47:28 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:e882:2a90:3db0:e053?
	([2601:202:4180:a5c0:e882:2a90:3db0:e053])
	by smtp.gmail.com with ESMTPSA id
	13sm21574156pgq.72.2019.11.18.08.47.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2019 08:47:27 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Agner <stefan@agner.ch>, openembedded-core@lists.openembedded.org
References: <20191108091419.25156-1-stefan@agner.ch>
	<7e0b2e1cc9931c92c2bcdcf5ef1f6f75@agner.ch>
	<4b4629ef84240f6d5e7da1363d88ebe15f4ab049.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e03eeb0f-f8cd-f6ea-ad02-44f41bdf1e84@gmail.com>
Date: Mon, 18 Nov 2019 08:47:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4b4629ef84240f6d5e7da1363d88ebe15f4ab049.camel@linuxfoundation.org>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v3 1/2] zstd: move recipe to oe-core from meta-oe
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
X-List-Received-Date: Mon, 18 Nov 2019 16:47:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/18/19 4:19 AM, Richard Purdie wrote:
> On Thu, 2019-11-14 at 15:47 +0100, Stefan Agner wrote:
>> On 2019-11-08 10:14, Stefan Agner wrote:
>>> From: Stefan Agner <stefan.agner@toradex.com>
>>>
>>> Zstd is a very fast compression algorithm and has gained quite some
>>> popularity recently. An upcoming patch allows to compress rootfs
>>> using Zstd. Moving Zstd to oe-core allows this new conversion
>>> formats
>>> to be automatically tested by the oe-selftest
>>> imagefeatures.ImageFeatures.test_image_fstypes test.
>>>
>>> Furthermore there are three packages in oe-core which allow to
>>> enable
>>> Zstd support through packageconfig currently.
>> Any update/thoughts on this?
> I've not made a final decision on whether to merge it fails selftests
> due to a lack of a maintainer:

Does a possible Poky LTS have any factor in deciding to add more
packages to core?

- armin
>
> 2019-11-16 20:13:49,922 - oe-selftest - INFO - distrodata.Distrodata.test_maintainers (subunit.RemotedTestCase)
> 2019-11-16 20:13:49,922 - oe-selftest - INFO -  ... FAIL
> 2019-11-16 20:13:49,923 - oe-selftest - INFO - 2: 29/40 153/378 (109.44s) (distrodata.Distrodata.test_maintainers)
> 2019-11-16 20:13:49,923 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/distrodata.py", line 84, in test_maintainers
>     """ + "\n".join(['%s (%s)' % i for i in no_maintainer_list]))
>   File "/usr/lib/python3.6/unittest/case.py", line 670, in fail
>     raise self.failureException(msg)
> AssertionError: 
> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> zstd (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-extended/zstd/zstd_1.4.4.bb)
>
> To reproduce, run: "oe-selftest -r distrodata.Distrodata.test_maintainers"
>
> Cheers,
>
> Richard
>
>


