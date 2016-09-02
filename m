Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBA87710C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 12:34:32 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id l94so176544413ual.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2016 05:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=IQaf6q61yjXMFeG1oII3FVDmdh0y+duRa+9i2RAZ5CA=;
	b=TKx5uI5lhEoW8G8jA/1z7mrJ9qS63d9o7wVoWCAyLreSPUTP1pTtU5zosr2LmLwP7e
	EE25S6aCy1PIx3i5BbMTo9H8y5rEqXPlPcjFqmN1lkL8tSYSTJCZS8i2ZY29FhtRcF5E
	5kWVPVL7CO5votFwMvyqEt5ml1r5fQg4dfA+r2/l89NsPXzUzKFdDSCaL0CyjamudfiJ
	pyokDcKiHc3FlNbZMYUJWIMyRx9O1b2+iQOHKSc5D/V+1UiW5D7VrUjc8E6EZssCrV50
	ywdA+ysysfHMm42q6a2goUic9yLOfl7MRaTRkC+BjDHSwd2+nRUbDgd1AqwxS4V2Sv4R
	sL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=IQaf6q61yjXMFeG1oII3FVDmdh0y+duRa+9i2RAZ5CA=;
	b=O5KWsmXAVwSd+Bs4ZCb1l+R1vzhba1dG6xMIIlzQDQTQ5u5aI/M1xupvT84hrS38Tp
	hWbmBOFJkefSIdcxJ8wwJfZQpMz0WwysG+CjIK3wHINlUyarHXhjC0SyM+JVVGP0hJke
	cs+VtwI2pljlVSZb8xNuGdFbvfP5zBaNjeBUbdQ0eJ+0Fv2Wb+C34osLCDkT5lX3I3xS
	dBnw/dSOXqDE4Xso6RVH0lsXQIP0raJiqJG2zx1CuP/+ygVL/cgHkgX/7itSX8vjOv9Q
	JhI3Z2/k/XEI4sbwcJr9O7i4msLVakxaQR/yPD8U1Lh5dTRhv5uTBysRc9crQuqUfD0R
	t0Rg==
X-Gm-Message-State: AE9vXwPq9q+og8G4EaET/5VDYD5pkert9DomkBCzB9/IeELRhKX1l/IiD9D9ukTVC+iA3g==
X-Received: by 10.176.4.85 with SMTP id 79mr4546653uav.129.1472819672669;
	Fri, 02 Sep 2016 05:34:32 -0700 (PDT)
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com.
	[209.85.213.46])
	by smtp.gmail.com with ESMTPSA id w66sm776494vkw.13.2016.09.02.05.34.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Sep 2016 05:34:31 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f46.google.com with SMTP id v189so21805339vkv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2016 05:34:31 -0700 (PDT)
X-Received: by 10.31.161.137 with SMTP id k131mr12732487vke.122.1472819670786; 
	Fri, 02 Sep 2016 05:34:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Fri, 2 Sep 2016 05:34:29 -0700 (PDT)
In-Reply-To: <CAJTo0LafVEqcVF02+naw8JvbzF2fi2y+Ws=OH0+=OgAyDNSt1A@mail.gmail.com>
References: <lya8ftx7w4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1472662673.29583.90.camel@linuxfoundation.org>
	<ly60qgxzp3.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LafVEqcVF02+naw8JvbzF2fi2y+Ws=OH0+=OgAyDNSt1A@mail.gmail.com>
Date: Fri, 2 Sep 2016 09:34:29 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrUAz1dNOZQhVxf6JqaV+g89gzfuzd7pMSiWwkDtsGkwA@mail.gmail.com>
Message-ID: <CAP9ODKrUAz1dNOZQhVxf6JqaV+g89gzfuzd7pMSiWwkDtsGkwA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Replacement for tslib?
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
X-List-Received-Date: Fri, 02 Sep 2016 12:34:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 2, 2016 at 8:56 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 1 September 2016 at 00:53, Enrico Scholz
> <enrico.scholz@sigma-chemnitz.de> wrote:
>>
>> I am not aware of any way how /dev/input/eventX values can be calibrated
>> within the kernel.
>>
>> Most capacitive touchscreens are doing this calibration in hardware
>> so that values correspond 1:1 to screen coordinates.  But resistive
>> touchscreens return usually only the raw 10-12 bit ADC values in
>> ABS_X/Y.
>
>
> tslib is still available in meta-oe, or I'd suggest looking at libinput.

The biggest problem with libinput at this moment is the lack of an
utility to calibrate it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

