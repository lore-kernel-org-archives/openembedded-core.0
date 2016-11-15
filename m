Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E51176FF76
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 21:16:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a20so4267306wme.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 13:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KUrUruhyfaQ8d7BbNeCb7KTjaYDYifEifDQ6tj92jPY=;
	b=d4xggQWAJ831cw7U6mL7VwvLH7VkIIxoKtgP/Sc/z7q4Yajg1Qm8KpoIhh71ieouw/
	wkPHOzo1TPikEKr0TQdUyinFELpqVWeyDF4pbl2lxPLUjmu8HkU8FwKpRTF97cvx6rxk
	0RwhRDGFloHePYgCOKUa4e/r4S6SdgD3DyfldL4vjveiIYzGAwPvYBnyzqVdD3m63L9I
	eKtNU/2EY63UZiA4gxC0Cgx/2/l3F3eW/le+N+53IS4j/PWTpzPxt8Zob1+jgjagysCw
	vTzoZDou91zgPeIKefGNEOWfdFukg71btuv2pZzST3W1YTXs6K64vXEwd9FzEQGPEDKi
	MdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KUrUruhyfaQ8d7BbNeCb7KTjaYDYifEifDQ6tj92jPY=;
	b=ZmNX1h4NOgn16JlM5oe6bzmyf9peZMh/Bn0W0U0wj2VsHcp4OnT7wLXrDatNU8bhD4
	cjUwfJU52SVs67LRAByIVmNqswpLSpxV6EIyKIhiWy0BonJ3S90sSt7b/VIGzHH9dzk0
	EIzhD5rt/A5QwjfGUpJAq+l7LP0ueTkIy8xYsAgLBBjEsbmO4TcR+ovnz9JAGzhua2kk
	G4PiYlO2WZKAAPktHz413qxO5ZcpOP68mPss0kUIypo7gbV/5ay21znGmsBrEpvM3vzZ
	RMUEchvV6WlhX6Xx61q10is5s9Na3iA2D8B2onxLAI23ccb96ljC3I7lE3eSExg7tWSG
	PnFA==
X-Gm-Message-State: ABUngveRSZ7C4zjkcOs7n4j8+C5yL3TgYiYikaaTDb/dCJ1qEP5EBV84kgcPm2oJxBGEtkYoKNtokpAO4/8DRg==
X-Received: by 10.194.115.226 with SMTP id jr2mr14912665wjb.75.1479244607676; 
	Tue, 15 Nov 2016 13:16:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.45.33 with HTTP; Tue, 15 Nov 2016 13:16:46 -0800 (PST)
In-Reply-To: <CAGNsrLACnGpM2t_0s00kzvdpkHLsB57KEcLRwmy8wJ5r83dnsw@mail.gmail.com>
References: <20161108135457.13249-1-fathi.boudra@linaro.org>
	<CAJTo0LZhZi+hgbUvd87E413nEOKP3g5uGY2eqZB5yX2ydHZKGA@mail.gmail.com>
	<CAGNsrLACnGpM2t_0s00kzvdpkHLsB57KEcLRwmy8wJ5r83dnsw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 15 Nov 2016 13:16:46 -0800
Message-ID: <CAJ86T=UqQ0fP73OcLeWNG_iqS9nQQCMNgXyyEjFZbfVgAFRAVg@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: upgrade from 1.11.1 to 1.12.0
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
X-List-Received-Date: Tue, 15 Nov 2016 21:16:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 9, 2016 at 6:41 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> On 9 November 2016 at 14:15, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 8 November 2016 at 13:54, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>>>
>>>  FILES_${PN}-xwayland = "${libdir}/${BPN}/xwayland.so"
>>
>>
>> Because you didn't fix this patch the weston-xwayland package is never
>> built, buildhistory is huge and core-image-weston with X11 enabled doesn't
>> build.
>
> I'll spin a v2 with Jussi suggested split.

Would it be OK to split the version update and the packaging changes
across two commits?

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

