Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 30B2F6ACD6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 05:55:35 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id l13so2301761iga.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 22:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+ubipDKUsmMlwyGtCXAS0Jooog/8sbuDnx62Do209K0=;
	b=I4/Xb7zoeImikBQIL6imh1iD8oCmrUD9LDHJENNZVxTPcQXQRFJlj+U9eIoAGLLNOj
	IwUwdRpWVFEm8R2+e/1GU0FVPmwRfkdZGNuSdChmIP9U9kl8O+p8KGu6vffQ9t0guTXQ
	HoU9kr8NpcZCIELH2frJlFqpnI8MHvb2Dw4zhWvCfZOBdS93f3V+BJ+4HqlCzLZffG+p
	oqb9aZP+nx32+BB8xV4GQ+bKYeG8obqV7hWDU57I3NKa9Ky7EhAFuFbd7hbMBBsq08Ty
	/p0DP34HPmXMyPLedYP48VmqXweYr1ssl9TCnhh2Ds4gA/JU81D37sgWY6G5vpyAIYfR
	refA==
X-Received: by 10.42.90.74 with SMTP id j10mr2279823icm.29.1406699736917; Tue,
	29 Jul 2014 22:55:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Tue, 29 Jul 2014 22:55:06 -0700 (PDT)
In-Reply-To: <1406633242-28359-1-git-send-email-maxin.john@enea.com>
References: <1406633242-28359-1-git-send-email-maxin.john@enea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jul 2014 22:55:06 -0700
Message-ID: <CAMKF1socScY49GgMLArdeD-D3Au_DPYw+mR75MeaOBaWwTSnrg@mail.gmail.com>
To: "Maxin B. John" <maxin.john@enea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] i2c-tools: Uprev to 3.1.1
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
X-List-Received-Date: Wed, 30 Jul 2014 05:55:39 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 4:27 AM, Maxin B. John <maxin.john@enea.com> wrote:
> +SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/${PN}-${PV}.tar.bz2 \

use BP instead of PN-PV

