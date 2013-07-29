Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 52BD960958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:47:04 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id ox1so2115739veb.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 03:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=TCKclLRk966lmoZbsNQytQBkioARXwnEt7rW2Hi1ONw=;
	b=aMWNeLuj08N2VoMXNIjkuWF6evp0cnu/qeHBbnzk54hXHI0s5B9svyWV/H8wY+/UYm
	zObfO43XMmg0sz/Z7DKwGQ3tRY8NvAbesjeffVj/r/PCSABsVJes4yF5/Yw05DhhlOnL
	XtGUfQzUAuvgQj58G/SFntzSj62NHPmi+SC/zSJgt6iMVcqlD4ggbln7ehU+jNZmrx39
	JQICfy1mCpUPz10FcB3L+ADmDld4JJUYFFGwaaEdldlfN8nkFPbn4qulYaFAFJYSzBCj
	zMLK/sNjkQKGFiHPN2gFkfNWYKMxbdIMFU1q157b9gS62O+LOfSsbS0UvOW3yqXTQlsY
	VGWw==
X-Received: by 10.220.145.4 with SMTP id b4mr1368682vcv.94.1375094824937; Mon,
	29 Jul 2013 03:47:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 29 Jul 2013 03:46:44 -0700 (PDT)
In-Reply-To: <CAOMwXhNsgLaOtmCouNmB3d7wuACAt7iSLfO5zMq-ph0FBi8w0A@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<CAOMwXhN556gDMxEGGSaFwYMJ7EU=Pvn+4mZcy0Q4eLyn7ShjqA@mail.gmail.com>
	<1375094306.13247.11.camel@phil-desktop.brightsign>
	<CAOMwXhNsgLaOtmCouNmB3d7wuACAt7iSLfO5zMq-ph0FBi8w0A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jul 2013 11:46:44 +0100
Message-ID: <CAJTo0LaG_CZcqXOrRe_fLq-HpQOGfqWeLFq7F8Cs8FTbsEnRPg@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
X-Gm-Message-State: ALoCoQkYjjq4UEgcp8Zja9PPyl6KML6qNJF29FrzmcNSa6wFiTiMVxkmg707zUzMklYXUQrWtSfp
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 10:47:04 -0000
Content-Type: text/plain; charset=UTF-8

On 29 July 2013 11:42, Laszlo Papp <lpapp@kde.org> wrote:
> you would cause a "runtime" issue which is pretty simple to fix

Enabling rfkill would involve writing a bbappend and patching busybox,
when a PACKAGECONFIG would make everyone happy and configurable from
the distro.  Even if we disagree on what the default value should be,
it should be a PACKAGECONFIG.

Ross

