Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 68FFD71A39
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 07:04:01 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id a197so61256186wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 00:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/nMQeWZRGJdoHJPr06apkIqCane94x561+O3HzhKbj8=;
	b=fCFpzb9AljCdDhj6SfJ1Gl9GMYx/pitcYH3kgxCAOkZyx7SZ0Y9Z5dVF1yVACNQzOk
	CzFCoDvwFuZ+aQ4fI1WgiweNwZEZ5mPJKyZz2w0OPY7juuamg7Ckhg5WcexRIt52kt1D
	ODB0KQTeJLFN5PDWWCyBXncDRlyiIanNQW0DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/nMQeWZRGJdoHJPr06apkIqCane94x561+O3HzhKbj8=;
	b=d1mOsWL1PEUDPeMI7XsURgvA1WC9VmSaQzhNgcwZe5aAxcqpLPI2Lso0e+Cn8FMcEZ
	LtTPnV5ZGqzTNN9MmodGon3UdXXz8GIFd257Ug0J1Rj9QS5tyMutkFYkJmsEMjUHsizR
	VjFTAYgV7qDlEc61T0orRZUVUo9asQiUpFIIZMeJVRsMj/aguO07kyhgp2+9Ro3DnnYs
	1rCyN0TMjXAGs3UFl6B5bAZ4d21vQ5eFy51gK4P0kElj10B/MDZUNH3H6RMVHHRHb/+7
	YGETm/xvlK2IVBdP6SZ/qIKmLTQRFxh4Se/x90fJoKloPvh67A6J8tGaAHRt58VkPFE0
	nXYw==
X-Gm-Message-State: ABUngvfbAb0HoO7J78tnKVUyx7spYcGgBh2jjOTlJmj3inLl4hxriJvnE+WplT9rWGO7Wc1/wjKc1dvIQteoBeH1
X-Received: by 10.28.17.212 with SMTP id 203mr235835wmr.48.1477983842317; Tue,
	01 Nov 2016 00:04:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.211.65 with HTTP; Tue, 1 Nov 2016 00:04:01 -0700 (PDT)
In-Reply-To: <CAJTo0LYBANe9f--NJkex3sN52ZGUH6Nrd45ktaYV1qxdY8gNJg@mail.gmail.com>
References: <20161029145747.32390-1-fathi.boudra@linaro.org>
	<CAHvQdo11Y5ZV0GaC0YsdFCEz6KwLymLms51hDkASayPXo-3TVA@mail.gmail.com>
	<CAJTo0LYBANe9f--NJkex3sN52ZGUH6Nrd45ktaYV1qxdY8gNJg@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Tue, 1 Nov 2016 09:04:01 +0200
Message-ID: <CAGNsrLAHewjcgMojrCaVT+T-cAogpicW2=o=D0T6Fn+3tmNdog@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core PATCH] wayland: upgrade from 1.11.0 to 1.11.1
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
X-List-Received-Date: Tue, 01 Nov 2016 07:04:03 -0000
Content-Type: text/plain; charset=UTF-8

On 31 October 2016 at 13:32, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 31 October 2016 at 08:25, Johannes Pointner <h4nn35.work@gmail.com>
> wrote:
>>
>> Wouldn't it make more sense to update to 1.12?
>> Since 1.11.1 is backporting fixes from 1.12 as stated in the annouce
>> mail of the release.
>
>
> Absolutely - there's a 1.12 so unless there's a good reason to avoid it in
> master we should be moving to that.

The reason is pretty simple, I submitted this change only to go with
the weston patch backported from master to 1.11 serie since it is what
is available in oe-core. It's the combination I tested on my available
boards and nothing related with newer version.

> Ross

