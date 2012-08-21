Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3sDB-0001p1-Im
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 19:25:53 +0200
Received: by eaad12 with SMTP id d12so14085eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 10:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uGUNBHsrLwtl+zWAbMVorjccP1LoEsSJJcJQxTtCRcM=;
	b=JWo0cE2vQJwXTr2jyOzw5ZSbSH2zppm5Qo+8LDJj36o7Hal86/7y9RYehUoICAJJBd
	7AAjiaU6aWSulbuBjTCjY+KfcPjFi+t8qvzDD2K1ZG4DqCXQ/cwztOSjolK4NGEsmNe8
	aOyCEOhFbLk4LMZ2VY849egWXDOI9rqQ3i4kRMEKY0y4mrZ0tAxqxHXxPPkD2p0+T7hG
	jWS75AQLMRbgWBDUcNMo+EMNGhqpL/dr/WW9KzCsr5Aw8tjzAk+UHJawuOvvcwD502C/
	/Rt7hWP96DgP1wR5T52sWotPsSB9UusEWMwPWn1QsIcTWb86ZsjyzD9yCw+ueWhVO4+U
	Y++g==
Received: by 10.14.211.3 with SMTP id v3mr14333742eeo.43.1345569229688; Tue,
	21 Aug 2012 10:13:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 21 Aug 2012 10:13:19 -0700 (PDT)
In-Reply-To: <50337719.7040801@linaro.org>
References: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
	<50337719.7040801@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2012 10:13:19 -0700
Message-ID: <CAMKF1srun9x5wb7CsLTzp7aet1RW-SRyAsgucaSPAtcUzKYvKA@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Aug 2012 17:25:53 -0000
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
>

Yes. I am testing a patch for it. For tries just delete the *intermediate* files
and see if it helps, I believe you will need it for meta-linaro as well.

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


