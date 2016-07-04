Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8866FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 22:04:29 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id e3so73109840qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jul 2016 15:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7VGLg2iruIX0FO5+HZyXjFNVQdfjh0jMyV/qCxTD9X4=;
	b=Djm12kILhs9tmgpz+DOmpUuMr74KLHJDLNgqmw/lycfEg1NgFDTTNhNtFbsyGOPLif
	/OLdLpsewWU3x9YvqfM2h8gQ6gv7MEBPZnkkMfwEkRG4hKLxnLk8a5F+ASIIjuOFggJw
	3lvs6id5bMEYIIhIa3ohMoiQae6TwDtsN4wLSfe3BHxO5lTeysKMYKsuoT9VCuSfbLdJ
	DGi6ObOJFfR7uOjlb1p+TKG5OGt+NGqJ1XFT/Rs6x7sVl2WJjXkkNZ4eqoLVYigLCc/k
	S1JCXc2tju6EpQQa8pjmTML/3NH93AfHSFhnrtOwAHYyk8hp3Xtrz9jHn1J/s6dSXkvu
	OXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7VGLg2iruIX0FO5+HZyXjFNVQdfjh0jMyV/qCxTD9X4=;
	b=cXMtEP6nnzpNln59RPZbuPR/5txz0EMjpTekxcgd1UzvC99np3s+hjFmworoR48Oz0
	GQSFDjVon+B7R2KEKdJdWEGzao6DP66vzYBhGDQDcGWruZncnhAvMcBXpMaGURDwKLmF
	vp9NhfAA8lus1ZI5TxfCWz1JgGQmvYuLKtzxnT/IX6k8yEJxALuGEntCwxJgkqpvsqhf
	YB7cIod4rDx++nZgI5GoSBzy50DVvg0XOrHhOqksWkBgkwtBA1FQCxRCg3m0Htd1VcMM
	G8gDMZ4pDWdP9WU1nGaXhGE+7M6WLUtf+Gw5mJAaYx+V49EwgfjfZAuK0EmffGVblU9o
	Evhg==
X-Gm-Message-State: ALyK8tLEc6hk2af+z+KdB2V4pMRospVBSHl79eIaBPT6SX66m28RivX/ds3QbFCz2e+gNni4moUlFu9mcl176g==
X-Received: by 10.55.16.232 with SMTP id 101mr19452949qkq.151.1467669870544;
	Mon, 04 Jul 2016 15:04:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Mon, 4 Jul 2016 15:04:00 -0700 (PDT)
In-Reply-To: <CAJTo0LYdAVqHZ8h1tAMo5HELqL-2SkkOk-iFT9n06s6C7ufytQ@mail.gmail.com>
References: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
	<1467637324-16642-2-git-send-email-maxin.john@intel.com>
	<CAJTo0LZUvOTA9X=SE=GrK4PkFvO-F4S556zEUjdSK2yBhZkShA@mail.gmail.com>
	<CAMKF1sr-kDvBVC7swKrDHCqW+ojvtDNxEifL-91gMazoj7NuEg@mail.gmail.com>
	<CAJTo0LYdAVqHZ8h1tAMo5HELqL-2SkkOk-iFT9n06s6C7ufytQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jul 2016 15:04:00 -0700
Message-ID: <CAMKF1spq-AB_xxu_9Mh8c4tXdC+gY7znz4D-EA_PtsYt+rxDTA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] libsolv: upgrade to 0.6.22
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
X-List-Received-Date: Mon, 04 Jul 2016 22:04:30 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 4, 2016 at 6:35 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 4 July 2016 at 14:18, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> we do not do that for recipes with git fetchers usually. PV is encoded
>> as PV+git{SRCPV}
>
>
> For recipes which are tracking releases, it's fairly common - and I feel
> clearer - use have the PV in the filename and thus PV instead of spreading
> the SHA everywhere for no reason. It's version 0.6.22, nobody cares what the
> SHA is.
>
> *If* it was a SHA beyond 0.6.22 then PV+SHA makes perfect sense.

seems ok. dont have strong opinions either way

>
> Ross

