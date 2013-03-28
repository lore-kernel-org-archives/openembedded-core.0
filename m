Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1ULK5g-0000ep-Dx
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 22:10:40 +0100
Received: by mail-la0-f43.google.com with SMTP id ek20so18331384lab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 13:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=F9+4ZRnsGL+1AVzGCYKEwFeITFqzOVodDJbGV4NsRzw=;
	b=cjDAXBfHeS8gSnCVlPXp7bJ13mPuKyLhw9kCAMRcKvFraO4Qal5ohGHFlM3zLEr9w4
	dH2Sk1kPnc1vApR4wBLwfhEXLGT9Os7cDE4EwV+JDEokaD3KFfRIQVRNO/EvL4acU9NY
	bMVD09yeiGDxIMsl0FiLtj+F5RW7CRhnr5/QUNC4IQssWo3gZXk54i0nZNbiBSzsQmzJ
	J04nMQ309eL/1BWR7fWo1eETO/FwU1Gbm+VhJtuEWM2gCY184iu5lHZcBd1IJvUAPPwL
	Ozsk/bVvyhVNoyaHSzm7u8Nh/0+ARO+3BZF7gpRVBHA//jRBDOUzPPsuCdO4gX9DxbsY
	HZ0g==
MIME-Version: 1.0
X-Received: by 10.112.42.37 with SMTP id k5mr286802lbl.49.1364503984247; Thu,
	28 Mar 2013 13:53:04 -0700 (PDT)
Received: by 10.112.61.3 with HTTP; Thu, 28 Mar 2013 13:53:04 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF8436F7FAD6@ALA-MBB.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF8436F7FAD6@ALA-MBB.corp.ad.wrs.com>
Date: Thu, 28 Mar 2013 16:53:04 -0400
Message-ID: <CADkTA4Ozv+O+tfvSfbBCq7qzRQWNgVGH4r24W6U=nSLQgb-Pcw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: QEMU_UI_OPTIONS
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
X-List-Received-Date: Thu, 28 Mar 2013 21:10:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 28, 2013 at 4:29 PM, Slater, Joseph
<joe.slater@windriver.com> wrote:
> I notice that, by default, we pretend we have a touchscreen instead of a
>
> mouse (-usbdevice wacom-tablet option) for the qemu bsp's.  Is there
>
> some reason for this?

Avoiding screen grab is the best reason (and all that I need) to use
the tablet options.

Cheers,

Bruce

>
>
>
> I have experimented  some and, with other adjustments, have found
>
> it possible to not specify it, but I do admit interaction with the target
>
> graphics window does seem "cleaner" if we do use it.
>
>
>
> Joe
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


