Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0305560D7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:40:00 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id j5so583798qaq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 08:40:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TMxBWftjlUIGSpBW4wlSPTNCgINOHa9Oy7J4/mOedVQ=;
	b=bcey+A8QU70CazvAKr1ap79pRSOY5Z1fvNeJdKNC7YSJB40DrYJh3EcSyJCLzIFb17
	tisDeGYcgZ9HV63E61SWTyhKsLpIEEfbIk18Knax+PJnWdCMWAOabbOAS2VAYSPZLdVC
	Ia2iKt6kfX0TWDk7eJ/ULHUsFQGXhU4i1ct7sA8ZFCWyeoBj3jp1VeTLC6OH9QtoxP7m
	U2NXGYCBkmnNlqE1BezWypfilAsYAwLXjuj5gWKHr2WS3o0HVCGypr2tE/7/KQYglJNx
	+RsqgUcKadGRwRy29aIDT+uXf/9rxHL44IitXlBfW/KZGciN5TfXB/Ho/UvatYm7jd4S
	O6rw==
X-Gm-Message-State: ALoCoQmmHVOnUCkWK11AN1ofVoTPaRj0qdWpay3pFAzOK+1nUelUOgOhVUv1Qoz4ujpN0hnd2QF2
X-Received: by 10.49.35.112 with SMTP id g16mr55140758qej.13.1387384801786;
	Wed, 18 Dec 2013 08:40:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Wed, 18 Dec 2013 08:39:41 -0800 (PST)
In-Reply-To: <0D6B3970-7154-4445-A7D7-A470E4ED44E4@dominion.thruhere.net>
References: <1386842653-1089-1-git-send-email-ross.burton@intel.com>
	<A4C74CC9-C110-42B7-B61D-5010176F3595@dominion.thruhere.net>
	<CAJTo0LYLDfXcxQT5gQPu9dwCvtjx=-23iHw+Xth+E0w78QWjnQ@mail.gmail.com>
	<0D6B3970-7154-4445-A7D7-A470E4ED44E4@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Dec 2013 16:39:41 +0000
Message-ID: <CAJTo0LaEDkYqfHYHFkGFzF27mCjo8nprVXCpjDQE_43GRocN7w@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-compat-units: drop machineid.service
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
X-List-Received-Date: Wed, 18 Dec 2013 16:40:01 -0000
Content-Type: text/plain; charset=UTF-8

On 18 December 2013 15:42, Koen Kooi <koen@dominion.thruhere.net> wrote:
> ... every boot you get a new machine ID and hence a new journal ID, which sucks. We can debate if that sucks more or less than having duplicate machine IDs across the boards on your desk :)

In the spirit of Linux we can make this a choice, though something
like a systemd postinst that can optionally write a machine ID to
/etc.  If enabled, the rootfs will get a machine ID at construction
time.

Ross

