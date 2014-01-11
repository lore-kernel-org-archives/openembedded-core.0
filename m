Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id C51346A467
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 15:10:43 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so5064316wgg.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 07:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=ouVX3GUvwgzAvFLdmjMYQ5uJuUyWMhTS2RnT1Ph2Cf0=;
	b=CnlPUq926+gmnJ208JSfw/5yMso1XZQ17le1PmxRA+lelv6Y9D+dthg/UcYYqItTVg
	h5SZDnb7e/bYGhIvaJoTW8wdNGC8RVMAtK6pxZkNrdPQfD0Rl0B1KxTvao/9Y5RuJY1w
	psTSY5UvIT6AiPTwGhuETKhLEp4l46bEHFZkWMTQfhgsO+4ql1C5i94+YpHMQ15uEah4
	r7lz883affGPha9UAFx7z5sivgW07u6ed9mF9R8A4fpnM2NaJpKnoIF9FJbJkM5i0dY7
	9HPOebpUY1poytgT3RLEFDF+LbC05QhtBU6T8sApWClIrP3nq6zsk3qrXRANTbyCVYYL
	7uvA==
X-Gm-Message-State: ALoCoQkKnhthWk6Tgb4s5dS3+0QG7pFs5/6vLl0800hfJ0nPGAOvpGnUYftGWlCmnix/np+GaNHP
X-Received: by 10.180.19.130 with SMTP id f2mr3472199wie.6.1389453044154;
	Sat, 11 Jan 2014 07:10:44 -0800 (PST)
Received: from ?IPv6:2001:610:612::655f:610f:92cf:b63b?
	([2001:610:612:0:655f:610f:92cf:b63b])
	by mx.google.com with ESMTPSA id x4sm8092151wif.0.2014.01.11.07.10.42
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 11 Jan 2014 07:10:43 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1389452899-633-2-git-send-email-andrei@gherzan.ro>
Date: Sat, 11 Jan 2014 16:10:41 +0100
Message-Id: <8969D90B-28E6-4C07-A113-93A9C033EFAD@dominion.thruhere.net>
References: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
	<1389452899-633-2-git-send-email-andrei@gherzan.ro>
To: Andrei Gherzan <andrei@gherzan.ro>
X-Mailer: Apple Mail (2.1827)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] feature-arm-thumb.inc: Use thumb instruction by default if TUNE_FEATURES thumb
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
X-List-Received-Date: Sat, 11 Jan 2014 15:10:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 jan. 2014, om 16:08 heeft Andrei Gherzan <andrei@gherzan.ro> het =
volgende geschreven:

> Avoid a confusion when including thumb in TUNE_FATURES. In the curent =
behavior,
> if I include thumb in TUNE_FATURES, ARM_THUMB_M_OPT will be "-marm" =
which makes
> no sense for me as a default behavior. Obviously I can change this by =
using
> ARM_INSTRUCTION_SET =3D thumb. But this seems strange and confusing. =
So let's do
> it the other way around: have thumb instructions as default when =
TUNE_FATURES
> contains "thumb" and switch to "arm" instructions when =
ARM_INSTRUCTION_SET is
> "arm".

Since ARM_INSTRUCTION_SET is unset for most things this will change the =
default, are you sure that this is what you want?

regards,

Koen=

