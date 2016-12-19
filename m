Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 34533731C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:51:39 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id j10so23248318wjb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BiNVEbRcBfX1tM00o0clrzXQ8+CH0QyF2ZERElxgliI=;
	b=mWCjuy77nTl0MwRFNGlB19+qqTH44fT9kyB6faEGO5X7DGIv7qFrGnVhAadkAKSSK6
	+U4BUt6SLMTzTt2ztz/tEeVuyCiJ7Mplat5IHgjHq2teW6eFcy8clMMwXuqSm0KGKXO0
	hMk8U09lWHrzFN5l+37YI6w4O8rF1cAiiE6SNgsBMiKgOXJtILnYDvlZVnYmfHDh+nyI
	NGXHQoZjC7DSsHkNgiZ7jzSGly6s3zRFbD9Nujwr0WP0fd/1D6zmy0Ts0iwS7hfsKTwT
	Sa+Cht8WQTY5GCsJ17I5XfRF2bT1H8sOJCZEGu7ITb9h52KVit+Z5oI4+GRgPeg2AdG7
	jraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BiNVEbRcBfX1tM00o0clrzXQ8+CH0QyF2ZERElxgliI=;
	b=krsbnJhBcmNQhMN6JCNOkPGR0yrvbKvuPcasWh959nvJmbopFAajLnBBbHmvtkfvnC
	bKE44ZPln75JHhUSPbSKH6TDB4LSm/fbCC439g1cBPwxPM1FPigH9gm0kDFCakJ4RkX0
	RxG9CkNFIUkKzy9aSv/DRncKfI7U9AVWmDWdq6HfTOMUHBA/fgVOPZ5oxVkCh0G0j98T
	j6EYgTsuExB1gUyxkn/12j99PaWxxo6net92c9XshDxKviEicn50cbIsBx+5XsB5lj7Q
	3KVETVFUx4UbLJG5FgoVySinbIzQ+RHEHTww2z1ccSkvuruClAFw/yU6zuoLs9+Re47I
	zA8w==
X-Gm-Message-State: AKaTC019sEPIijYyRiXeOnEhP1oK3WuAayadVKlnQQ4mRGMiJMM1G492SaV9CXhvjMlSBNm+efrR6X0uyV9lLw==
X-Received: by 10.194.112.170 with SMTP id ir10mr12875592wjb.190.1482148300859;
	Mon, 19 Dec 2016 03:51:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Mon, 19 Dec 2016 03:51:40 -0800 (PST)
In-Reply-To: <CAJTo0LZvF2qQphCO+CFZ9jUHqgwoEVXrjOgaGe1kAF_+5D07jg@mail.gmail.com>
References: <1482080556-4642-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LZvF2qQphCO+CFZ9jUHqgwoEVXrjOgaGe1kAF_+5D07jg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 19 Dec 2016 03:51:40 -0800
Message-ID: <CAJ86T=W4s6iqODR_x0s8B5BV=Y=7fXQtaSn+GBZ5+GNrY3s1cw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glew: build for EGL in non-X11 distros
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
X-List-Received-Date: Mon, 19 Dec 2016 11:51:40 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 3:46 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 18 December 2016 at 17:02, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Add PACKAGECONFIG options for 'opengl' (ie the previous default, with
>> dependencies on opengl and X11) and 'egl', which depends on EGL only
>> and allows glew to be built for non-X11 distros.
>
> Can it build both or is this definitely a build time choice?

Build time choice, one or the other.

