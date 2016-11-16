Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5C2E26FFCC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 05:04:20 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t79so46297427wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 21:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eOAsysY09eipFeojhSMGZSnz8d2lg3QQJcm51OmZUSA=;
	b=WR3H9Ajmh0aLLe8fpJjZwwzkX280jFINHztgenM2wgFFHu4Z0dFdm/izCx/QcBBpcY
	U928YWM6Uw1VQPbrObU+qFsQf7G0vQZYo7l8kU/T/5mS+hZ/Raj04RFCdh7r3pd7WybJ
	wi0AQLcc7HV/GNJzJVasoqt+QuQMSNbAlDjC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eOAsysY09eipFeojhSMGZSnz8d2lg3QQJcm51OmZUSA=;
	b=j+kJ2Ov488kcilqj0iJJHLh1rD2+CWfiVNbv1ajPxIkBKbpPyWyHB4JmZaZRin+f0C
	MIRPz/ASFUTvXHFJ3A5ClRt41kJN5FFlHm9noUt3pzgg1A9KNzJzupCTv+BXCe1xTbl+
	K2DPZxfTP8SkP5nRIu6wbKhofMZW3XqdPKrus6gC/eyI9LAak7W44kfAZ71W7LF8ozuI
	CTF2SdLH15CIc+KbepWLNTdHdf+Yb3HSEYyQpoITrKQS4KqkvZm7NK/ylG7EIpWSkA87
	Ii94RXynHqJL+g1xMwak6svmjJIDWzka3xgDekHmVThZRETrKcMiqKQxjGGc+A4tmPET
	ezmw==
X-Gm-Message-State: ABUngve7tyyN8RmGF02uVSpeNijtzIk+CzdevQftZGZWTrLyDzNLhTebYBu41zOWqMKIOwWrDjiuXt6lI7eQSYkS
X-Received: by 10.28.208.203 with SMTP id h194mr7152808wmg.45.1479272661917;
	Tue, 15 Nov 2016 21:04:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.211.65 with HTTP; Tue, 15 Nov 2016 21:04:21 -0800 (PST)
In-Reply-To: <CAJ86T=UqQ0fP73OcLeWNG_iqS9nQQCMNgXyyEjFZbfVgAFRAVg@mail.gmail.com>
References: <20161108135457.13249-1-fathi.boudra@linaro.org>
	<CAJTo0LZhZi+hgbUvd87E413nEOKP3g5uGY2eqZB5yX2ydHZKGA@mail.gmail.com>
	<CAGNsrLACnGpM2t_0s00kzvdpkHLsB57KEcLRwmy8wJ5r83dnsw@mail.gmail.com>
	<CAJ86T=UqQ0fP73OcLeWNG_iqS9nQQCMNgXyyEjFZbfVgAFRAVg@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Wed, 16 Nov 2016 07:04:21 +0200
Message-ID: <CAGNsrLBX62=RgAN8BXsOBdUiJVQ7CFnKDtUJnVFEK-WhWsT-RA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Wed, 16 Nov 2016 05:04:21 -0000
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 23:16, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Nov 9, 2016 at 6:41 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>> On 9 November 2016 at 14:15, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> On 8 November 2016 at 13:54, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>>>>
>>>>  FILES_${PN}-xwayland = "${libdir}/${BPN}/xwayland.so"
>>>
>>>
>>> Because you didn't fix this patch the weston-xwayland package is never
>>> built, buildhistory is huge and core-image-weston with X11 enabled doesn't
>>> build.
>>
>> I'll spin a v2 with Jussi suggested split.
>
> Would it be OK to split the version update and the packaging changes
> across two commits?

ok

>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

