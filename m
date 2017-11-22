Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1B6786F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 20:42:43 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id h81so11820677oib.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 12:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=XG5KmgV9Tz5Wvw5h2QZMENdtOXLsYFyyBeSqPVVVtFY=;
	b=bVfFkIGEep7w1VyGaTqJHIA8DEw2uTP8HmSjPc7cmH5esUKUH7NaOXqWo27L/R+a7S
	hVj8ii/JlqiUHWYcUYJiYR1TQ7oPL2xOtzR3ABwEc2dATD8fMTf048LhdTuAcXxN6y4Z
	DOlUFdVp8YAC03x6p5qtTXRaF9PlZ4k8yGUBpPJsQODGQ3UyF3T514pEesdrHCedAra2
	rygbfQagV4PD4ki58SBWaEYP3lUP9Oz6Ieu+hiqLZcywbVPOxfHbHX5p3sP9bZ3Md8Qh
	HNq8wrYNOzR/tqWALL71GZzIV2ZFpi3s7ENDwi6nN9I25R0l7n9aOK9KZQoLejEo4Y1K
	4IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=XG5KmgV9Tz5Wvw5h2QZMENdtOXLsYFyyBeSqPVVVtFY=;
	b=Lkl0uExvMtmeIHyn5eluqWTHEnRnDOL4IT01tg1/iczMiaM/HopEThZaQwRXz8JuJn
	UDcW0jWD5CwHp+d5nrmxGl1UPao+3iO7NLyeix/iBoD+8DfqPKjdccDh9MROFpxKrhax
	dvGAfifrAQTOUyDHF0MtefXPMecM55zj6spIAmODgLCJ9VHF+5OroZA4k2meoDYoQqT9
	Q8QSqi8dUGY35EwCoboznCTbE1UUd5oDrhSxjajVivOe2ivpCZsKL/9f7k/Ii4YariG8
	vVdgCoUzSUvQ8r0Q0Y21dTr6LNfdvFlX2brUhlFIlw1ZqKLQcW5dLKixh7Aed83tJpFb
	Aumg==
X-Gm-Message-State: AJaThX6rbp3oYt//z0Vo6EotqlM2OrEPy20F5c6Vl6udU7mSS3rVdH7+
	As0tzUNHkhOZU2HYtWdZYDHmpN5V
X-Google-Smtp-Source: AGs4zMZO4yMrBjwKY7VOj05MbxLDCZ+K8+Bt+POcWibUzNgttzm6ZviDar4YrY2dIg9fVrOkfLDWhw==
X-Received: by 10.202.166.14 with SMTP id p14mr4902175oie.48.1511383364068;
	Wed, 22 Nov 2017 12:42:44 -0800 (PST)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com.
	[209.85.218.53]) by smtp.gmail.com with ESMTPSA id
	t29sm7591604otc.46.2017.11.22.12.42.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Nov 2017 12:42:42 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f53.google.com with SMTP id h81so11820624oib.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 12:42:42 -0800 (PST)
X-Received: by 10.202.216.137 with SMTP id p131mr4747336oig.140.1511383362188; 
	Wed, 22 Nov 2017 12:42:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Wed, 22 Nov 2017 12:42:41 -0800 (PST)
In-Reply-To: <20171122170930.1861-1-alejandro.hernandez@linux.intel.com>
References: <20171122170930.1861-1-alejandro.hernandez@linux.intel.com>
Date: Wed, 22 Nov 2017 18:42:41 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoqySKd=NPbp-0d+EBZ9Evk=ZKG0Te7AykOQE+Bp4z2WA@mail.gmail.com>
Message-ID: <CAP9ODKoqySKd=NPbp-0d+EBZ9Evk=ZKG0Te7AykOQE+Bp4z2WA@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-live-boot-tiny: Create the initramfs-live-boot-tiny recipe
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
X-List-Received-Date: Wed, 22 Nov 2017 20:42:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 22, 2017 at 3:09 PM, Alejandro Hernandez
<alejandro.hernandez@linux.intel.com> wrote:
> The original initramfs-live-boot recipe RDEPENDS on udev, which is ok since
> the init script relies some of its functionality on udevadm and such,
> but on core-image-tiny-initramfs the init script simply drops to shell
> after a basic setup, so udev is not needed.
>
> This patch splits up an initramfs-live-boot-tiny recipe which does not
> use udev, but uses busybox-mdev instead, eudev installed about 600
> extra Kilobytes to core-image-tiny-initramfs userspace, by avoiding to
> install eudev we achieve an even smaller footprint (almost 40% smaller).
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>

It'd be nice if you could migrate to initramfs-framework as it
provides mdev module and has part of this already done.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

