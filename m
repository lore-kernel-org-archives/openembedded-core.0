Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 72B8C78087
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 14:26:21 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id f18so4074269lfg.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 06:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e2de6vPjNaEzvfvJ5oBWujczNX331JSZHPUk82PKbuw=;
	b=FwclZ7Gl//Ii4N/s/rV3D8qrDngWoazvZJaNuv+a7K9CMAvTa66fzC4jknfLmVqmkN
	THAjaqWrlGoDXq5c30tjf948LL32Ix8SVwuIg/wiYPM0M8AOoUziLDyrck+JG4AtZNuC
	77wspr9v2fXu5QcFSGLZFQYrs88UBbJzf7YnBSJRmJcqeqOr4L3/gkKa7QCuShBRKNXM
	nFAY94iMwQGVsDtd6oRic+jdyOHc2sd37m/HnDHXNK4myriGawUSrHP60EZ4rMJW54QX
	ArCDjFjsG6VzJdO9WWjUZxpZ8Khc4F/NC/xrBCdDyA8wQoEH+hlAIRAjrDpf1Z2NotYV
	2M7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e2de6vPjNaEzvfvJ5oBWujczNX331JSZHPUk82PKbuw=;
	b=Vk79ZsNR+f8UR2OgJgHm/11Z6xJtMuUJ9C/gwtMYz31i5HlpIAaKNBwRzNjpazerin
	8mNwgNgQnGi8NubKub/Iso8Ke0IWp0D7AQouqK1gOYbG5rQPfyK3NGOxY9PkypyKKgHu
	vV2LWBptapyq1hR3uG0vEmrkFZ1BnDz9XkyxtBAg1GH/8/wdMtDufkm5tQC49bRc0sir
	pT55FfMXim7cKHUXa9GJskRCw5YG1uJhX9S/jYzzBttIuexS1EhHZ5qVhzEFoLTDNLmz
	ntvZ1SnKmL10abMbccsq+SX9rjQowUkmM6wDUmL3acz/krLx+h1GUbnieetrG0A05LlY
	TjyA==
X-Gm-Message-State: AJaThX73Kw5dc+SyhW8deF5v4e8hgikN4Xx4y1dptt6NaTZuCUGXcBl+
	7LAGUDk/1G3DkTabFg2HmyO1zPe1qw4tWjGr0zI=
X-Google-Smtp-Source: AGs4zMa0hmaOx8eLhk4Z6h6zxL10qGfC5EzAv3yAlw1P4lOSLKyT2joVr6H5jVnva0qRHAQ5n/MWVVn2pE4vKPYmK48=
X-Received: by 10.46.117.23 with SMTP id q23mr1463460ljc.85.1511965582836;
	Wed, 29 Nov 2017 06:26:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.59.196 with HTTP; Wed, 29 Nov 2017 06:26:21 -0800 (PST)
In-Reply-To: <b02650d0-d612-b8ae-a088-38a929474432@linux.intel.com>
References: <20171127183538.68275-1-danismostlikely@gmail.com>
	<b5ec6830-3185-054f-7354-d9caa66e692b@linux.intel.com>
	<CACS+7ZT=pyM3uD-LbBy437NT=nHAS7ONarmMp0E3TA-b40LFaQ@mail.gmail.com>
	<955afb0f-78b2-2de8-db0a-f301b62bc8ab@linux.intel.com>
	<CACS+7ZRKCjqB7Hp39Wv5GCLEV_qZsA=kh-okjLaGty0s8Cr96g@mail.gmail.com>
	<b02650d0-d612-b8ae-a088-38a929474432@linux.intel.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 29 Nov 2017 08:26:21 -0600
Message-ID: <CACS+7ZS1KmQtN1qiEROC6db5pO3x97oEN8kVtUPMxCggsrfVsg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: fix python3 dependencies
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
X-List-Received-Date: Wed, 29 Nov 2017 14:26:22 -0000
Content-Type: text/plain; charset="UTF-8"

On 29 November 2017 at 00:09, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/28/2017 06:54 PM, Dan McGregor wrote:
>>>
>>> Can you dig a bit deeper and find out the root cause of the error message
>>> you are getting without this patch please? Try also with a plain poky
>>> checkout, and see if the issue disappears there.
>>
>>
>> Yeah, as I said above python3 distutils seems to be broken when
>> multilib is enabled. I'll fix that and send a patch later today or
>> tomorrow.
>
>
> Just wondering, do you have this fix in your setup?
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3d29214b20433a506a3d59cdc08fc1a9be09a5a0
>

I do. I found that distutils isn't patched in there, it's still hardcoded.

> Alex

