Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id A083D782F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:51:00 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id 21so25539854qtx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 07:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DzuMUscaaLGOznycldAy4n3RTDt+GTFcQKO0222xRPs=;
	b=VlrWr4RwKwsCXcKIBFYt2H+TYrx9e163u86H6r0JFIemQLbtmyeG9zfxG9wmHP7sG5
	EQzaaIQ+wWY4xRjTngHPL0Nap6SwSOboP1d38ARQS3ORDmMY6kvCQ1sK6Yb8x2w1o4/Z
	XqKqvcKTWzBB0XmnGin66mZTtyZy47MUjnsas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DzuMUscaaLGOznycldAy4n3RTDt+GTFcQKO0222xRPs=;
	b=CPK6KGstuEjxd5B+vG94aeRtJz+iQgcO4phpagfppCXRI4qysdF55EvEtNwg0XH+UZ
	dQQbzUPpKK/lgZKhf1EGnSov0dnkoDDIu+RvcY7TfWh1+Ev552l4XD2+ZrPsYQ5Pf2rc
	Q163fPeMxvv3x5G1PyD1a0v/nyJSK2V0+PphM7OrylaOibEqxrZ/1zEESGByIdbfVTCq
	mA9Z85ZOYjTSF5eJXU3bB1kbcJSvndwZEL4RTk+BMtMBR+pMVQ0zSm2vWK9FLL09zMiD
	O+HuzND53WYXDgoQGHd+puhMkr/9278hOI4lvrjWMf22NZ6xtX6Rn4FOOp8avbVWZtAp
	OIjg==
X-Gm-Message-State: AIVw112xCnFYgQvry4l0G9noBAiARUXtzN1pMYUU1Ww8X3XTKt8zFELm
	oirwThrc/L7nGxr7hbIV8LcUbN3z4do7
X-Received: by 10.237.33.3 with SMTP id 3mr5099698qtc.63.1500562261483; Thu,
	20 Jul 2017 07:51:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.97.194 with HTTP; Thu, 20 Jul 2017 07:50:40 -0700 (PDT)
In-Reply-To: <CAJTo0LYGGAPLrw5599fhHzdHsrhrJoDPP_FDxDdHxZSESw3_jg@mail.gmail.com>
References: <20170720115657.11406-1-nicolas.dechesne@linaro.org>
	<CAMKF1sqOWkSJqqcj4ZW+NB40pJvpuC2NtKJH2Ea3iCwzxwE-8g@mail.gmail.com>
	<CAJTo0LYGGAPLrw5599fhHzdHsrhrJoDPP_FDxDdHxZSESw3_jg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jul 2017 16:50:40 +0200
Message-ID: <CAP71WjzRdQ4=vK=6PvfzFz7GJrYNG9fawTPYucNMCkBGO5+ZHg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: fix pkg-config utilization
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
X-List-Received-Date: Thu, 20 Jul 2017 14:51:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 4:30 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 July 2017 at 13:54, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> There is a proposal to repace pkgconfig with pkgconf, and I hope it
>> will create a symlink to provide pkg-config
>
>
> Yes, it does.

ok.. sorry, i had missed the pkgconf discussion.. i will send a v2
with the --disable-xxx and then i will send one patch to enable the
xcb flag under x11 and add support ffplay/sdl2

>
> Ross

