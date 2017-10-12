Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0ADCD77E9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 12:16:55 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id t69so12650334wmt.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 05:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JsQIrplGauzFOtLPFl6FLlbgryagm2gb+YMA+LQEtnw=;
	b=fq/Y344NF/vfPsgbA+ZQoeLbSAUKmY6d7x/rursNpbKY/PkD029NLhVPThqlxwLhn6
	PLvFZGOmuWmKvtr6Gh5Svb8iMIGTPOSvSTt6hf5ANIQfl+sx8eckaiSP/1VL3HepCWJo
	wXkjc1fd+fTtjQEh789os3hFipZzxQq3Yx9FSeDHAID5zzPw5Z89wFUnqgRk2Jy+LLWy
	9re2VudKHmnDVuevHd86hs6cufAO/3QOHbMTY7E4nKml5NNJz0G0C8LnoYU2YC0vtyW5
	4EOk7sP6d0lnQsww0pJl/gLQk6bUt62fg4hn8ozaWUc0MwjoWUEOxjIV8EhQSzvNjSKh
	wWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JsQIrplGauzFOtLPFl6FLlbgryagm2gb+YMA+LQEtnw=;
	b=eM55S0LMnFjB4nK27p9PGl2K/FT5kc4jqOmktSGH/8lLSush41NmvQ7FwQy6TUEo11
	ft2Q2mBWhUZFsh1UgWSH4nE9dP/SO8c4R6juIntM1LiQbdGT2ifiHqOgf0JqlkUiakxA
	QSEhfguz3zWoGz2mLm3QAxLQwuvqGDGF+LR+TTZja6c8r2Qm1Ugf86/Vq628rDpmMXGq
	8GDsSj40onT2sVy3JqiJ8sxkqMqC0Xo/OnoH9jJEzpVnnUwjDGzV3+2zA0a0yCi9TLBI
	gwtO4lTc144nc2noKiyy47fL6X4TSAFOCqm3OrgrMm90wTydlhCqEm4bfEBtHfgNxZpm
	RmgQ==
X-Gm-Message-State: AMCzsaU6J7fjU2xEKsTTbSuH/jahyBAOtHCJ6y3zq8IPKDD4LhUGzRJ7
	UVSxctjeTJDdAagGaMnWjWE01AjSYxvVknWv8wsIUw==
X-Google-Smtp-Source: AOwi7QBR5UzJ7OjlyndZlsJ8eh26IUud0GhpRBBND8cl2XiMCxY11zKtwyB3XN5qtW1Hnd79NXCXFQtwBlqV8MzSlbM=
X-Received: by 10.28.143.130 with SMTP id r124mr1934629wmd.122.1507810616906; 
	Thu, 12 Oct 2017 05:16:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.154.248 with HTTP; Thu, 12 Oct 2017 05:16:56 -0700 (PDT)
In-Reply-To: <CAJTo0LZfw2bWmOuS9i-AoHG7EepuCiOyEboobXtm1LMLgpmfpQ@mail.gmail.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
	<CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
	<CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
	<CAPyrkgxV9aQvx3frYAJFKuK3jBY7Cv+V8=zFjvvLM-jbK5PH8g@mail.gmail.com>
	<CAMKF1sqQF01x8WOWQRt=jnfBCAsP8_5OSLZnJtPo9QWBu9RGCA@mail.gmail.com>
	<CAPyrkgwgE2SKjh8ODxVRku2E3VmHKJLF8sBUL7Mzd4gAWnJ0jg@mail.gmail.com>
	<CAMKF1somGhHGW_0i=2eBB9xkB+6Fkcv5PUK8Yp2evtvWzHbB6Q@mail.gmail.com>
	<CAPyrkgwhNAh+q1cPayXa=DV7x3K_T8T2YL4h=kfOiiz4CimJdQ@mail.gmail.com>
	<CAJ86T=UCwz44_twkQR-y=MR8TQVeTo2+RdXzOWc5Eyvv8dV5jg@mail.gmail.com>
	<0c97da3b-489d-eba0-8106-7b00d142746b@windriver.com>
	<CAPyrkgwDWH4Rk2T3V31Jyt0RjU4wCEd5sfPnm8Qevn3PWkbk6w@mail.gmail.com>
	<CAJTo0LZfw2bWmOuS9i-AoHG7EepuCiOyEboobXtm1LMLgpmfpQ@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Thu, 12 Oct 2017 13:16:56 +0100
Message-ID: <CAPyrkgyyiiqNpHimOdqL138CNhz6dm19VoKJx=yZ7HOx2NcXcg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Illegal instruction when running go binaries in qemux86
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
X-List-Received-Date: Thu, 12 Oct 2017 12:16:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 1:10 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 12 October 2017 at 13:07, Paul Barker <pbarker@toganlabs.com> wrote:
>>
>> Is it too late in the cycle for rocko to start adding "sse2" to
>> TUNE_FEATURES for relevant machine configurations and include files?
>> If it's still ok to make this change for rocko then this might be the
>> best path forward.
>
>
> As per the weekly status mail from Stephen, we've been frozen for weeks a=
nd
> on Monday the 2.4RC2 build was done.  Unless QA finds something serious t=
o
> fix, I suspect that will be the 2.4 release.
>

I'm not expecting this to be fixed in time for 2.4.0 now. Can this
sort of change go into the rocko branch after release though?

What is broken, to my understanding, is all applications written in go
which perform floating point calculations on qemux86 or any other x86
target which doesn't support SSE2 instructions. We should find some
way of fixing this for the rocko branch after release. I'm just trying
to gauge what sort of solution will be acceptable before I spend time
implementing and testing.

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

