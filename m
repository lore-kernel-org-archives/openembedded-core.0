Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5ABED6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 17:37:09 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id q124so15204172wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 10:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JQ1+Qzqb/paQljGdAuFGm/YSHX2Z79tNLjT3l51h3hw=;
	b=V4/j+9aaiVQ0882Xrz8T6yWtZaJgTEJkmAAAoXoANNhNdxDm13wl03707fuKZf5Q6v
	CQ2v2jv6iLurd4mwoOjr2XdV3aVO3ecIcOOgmC/75aBqZi+P7Z+6snQrwGyVgUiJkK8x
	eECyRETSx0iXt333DOGdMYbq7LYGu4bkJc2CXDiPLslpEbk3eYhQ2fBOp4zipgW6YrsC
	QPPJaMAc+fOV+HOQpI0BzhjKF8Vk4ifFLFoeCX1LXo1SWzO8FXqRDXI40hYHEfPzO9YX
	YAzXfylJuc6CH6d5FK2R3MqpYybsXxg72nVSnrOwx6jd4xAFodtKeev69Cq7l9YpEddF
	uZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JQ1+Qzqb/paQljGdAuFGm/YSHX2Z79tNLjT3l51h3hw=;
	b=K47TgjR4NXGxmFZiofenUGGGuu3ylmQEyQO3j/3KEu7YM+sfAT9zN6zFmClS6xwU1V
	w4sdAf9f7J8/HnAzSL+wCwgpHrMOahMjdyChOCN6Wnw7t4wnm9LK+lZrvlWd7NKH90kg
	85seGhz3rpfIt0u2qWsEdUncS6gnrLsk1F49y+MO0yeOjv3TpKHrl8dLRsCotw9ZuoLS
	EGuUMlKPDf4rQU0boGyr5oQ2IGcDuBVDJPE7XnUSYEQ8U3WsvsG9jJCGvOTz9bQq1Fxz
	6QjspsWYqiP4Xj5PYejzmOldjIYn9JcKGSLHnwqYnVd+Ez6fw7QrpEFKmi/vK7nLSqv/
	OW0Q==
X-Gm-Message-State: AMCzsaWTUBv01a9t91yeuIuAvNwQairVCxP/AEiTB0VX0045GoOFCuJW
	/qkqRYpbzAQ6V2XnPSZyVC+xv+xn49lsrHnc4kI=
X-Google-Smtp-Source: AOwi7QDfIQkYxr/f5OZPVqCL/aziQmXO/7rxDGVNO2K3aDJlNZ5Hlp55ch0pPTINSdmGYy/NIeP4l9EvzQvajR6oo8k=
X-Received: by 10.28.147.208 with SMTP id v199mr2282521wmd.136.1507829830941; 
	Thu, 12 Oct 2017 10:37:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Thu, 12 Oct 2017 10:37:10 -0700 (PDT)
In-Reply-To: <CAPyrkgyyiiqNpHimOdqL138CNhz6dm19VoKJx=yZ7HOx2NcXcg@mail.gmail.com>
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
	<CAPyrkgyyiiqNpHimOdqL138CNhz6dm19VoKJx=yZ7HOx2NcXcg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 12 Oct 2017 10:37:10 -0700
Message-ID: <CAJ86T=VF0c5J0Z+TW1_9+6VQvGTMu3e0X_EA_rBbwLnR6CWFRw@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
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
X-List-Received-Date: Thu, 12 Oct 2017 17:37:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 12, 2017 at 5:16 AM, Paul Barker <pbarker@toganlabs.com> wrote:
> On Thu, Oct 12, 2017 at 1:10 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 12 October 2017 at 13:07, Paul Barker <pbarker@toganlabs.com> wrote:
>>>
>>> Is it too late in the cycle for rocko to start adding "sse2" to
>>> TUNE_FEATURES for relevant machine configurations and include files?
>>> If it's still ok to make this change for rocko then this might be the
>>> best path forward.
>>
>> As per the weekly status mail from Stephen, we've been frozen for weeks and
>> on Monday the 2.4RC2 build was done.  Unless QA finds something serious to
>> fix, I suspect that will be the 2.4 release.
>
> I'm not expecting this to be fixed in time for 2.4.0 now. Can this
> sort of change go into the rocko branch after release though?
>
> What is broken, to my understanding, is all applications written in go
> which perform floating point calculations on qemux86 or any other x86
> target which doesn't support SSE2 instructions. We should find some
> way of fixing this for the rocko branch after release. I'm just trying
> to gauge what sort of solution will be acceptable before I spend time
> implementing and testing.

I guess for rocko we should go back to your original suggestion, ie
"should we just set GO386 = "387" so that it applies to all go
binaries and accept the slight loss of performance on x86 systems that
do support sse2 instructions?"

