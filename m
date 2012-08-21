Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3tWU-0004Gn-KO
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 20:49:54 +0200
Received: by eekb57 with SMTP id b57so37260eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 11:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Vd6wdUlWkChxYTa5dGhVzpdv8l3931JUiB2NhxBFvt8=;
	b=crdOPnHv6rYEhv77yjYawP5YMRHZsLqqboJtHp44vYpCWggZ6gpKVC8lpmP2D9IFT2
	2C7MlRyVp1s78Q0GaFUAmhCbAFpIIg7sy0mNehZ8MK6S0r6ZputlE+okSoZj1vYBF0to
	/4QqTNE17y9Ir8et6n489x6w7ayx9XJfzruwq90lttBIBZgAWujLUyURe8e25/zcHmJu
	Or9HNUcVXG9y5g/P/dmL2rHvspHkr2Iwd8Joemy9bKnX4F5c/haMHEFk2nOW/LpuI2iY
	kMIa86nl6rECxrvJENNL4hrN1P9DsUNc0Ogj5iCULh/hoxUNbehEwM1COTkl/YzJqNPj
	hAig==
Received: by 10.14.4.201 with SMTP id 49mr14866588eej.0.1345574270709; Tue, 21
	Aug 2012 11:37:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 21 Aug 2012 11:37:20 -0700 (PDT)
In-Reply-To: <50337719.7040801@linaro.org>
References: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
	<50337719.7040801@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2012 11:37:20 -0700
Message-ID: <CAMKF1soXoZ4hHkAA0xJCkwP0dh4g7EVW3E-rsc=-gEeMMsBZuA@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Toolchain rework, call for testing
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
X-List-Received-Date: Tue, 21 Aug 2012 18:49:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 21, 2012 at 4:55 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> W dniu 17.08.2012 06:47, Khem Raj pisze:
>> Hi All
>>
>> Recently glibc build has been simplified upstream. It has dropped the
>> dependency on libgcc_s and libgcc_eh for building glibc itself.
>> This means that we can simplify our toolchain bootstrap a bit by
>> dropping 1 of the 3 cross gcc build stages. We do not need
>> gcc-cross-intermediate anymore.
>
> Please adapt also toolchain-layer in meta-oe for those stuck with gcc 4.6.

Patch for toolchain-layer is sent for meta-linaro The patch is here

https://github.com/kraj/meta-linaro/commits/master

please merge into the meta-linaro layer.

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


