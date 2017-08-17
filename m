Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8F62978419
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 06:18:34 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 83so8241445pgb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 23:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3mzWAZsNfyzDSu6LLTTGPrDLX3EyrECLUsaeGzhChpY=;
	b=JpMCrnD5Pw/6vCmsxC8R73K6eHGcVYcWERLsk3t9MujvjbOjT5fX01ZyDajClXWWS5
	TG6JKkLm7YNHJZk0uLZj3BzDVcWNqf8XGGBEO3WigdQ7jFfg5AsNs+xuvwkm1WpUg5W5
	rirUXAtTTqOZnPcNbGQFgUfg0OwKXgFNUdCtUK24pHN1LyrkAK5TZvm7GwPbpux7MdfS
	f4jVG5zqD9A9V9TPZqQArNODrDynPC1GsCf2nEzWNrTISgu0x2ilNRJiPikcOvfjSdZz
	XSd2jTlPvWJmFUNRXsKIqqGUpsvCtTuk8mkoYwTq4w+rLoJsRa5ckSeVP+ufBl88KVeS
	rqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3mzWAZsNfyzDSu6LLTTGPrDLX3EyrECLUsaeGzhChpY=;
	b=tybSeBiCwXtj3cXPsT+4CmzT+MA2djZazX2rCDMBYNE6UcLasBYIWvyaipV9TWTh+l
	o66C59fzzK2M49WkInq2AOzEZPdyvI1tane7/Jkb/qcBrCLGcl5V8geg1kOY4Zwr1UHH
	VIqaZC7MuJB8AJibY6i/8ob7FNtd4GTMdczzkJtKiUx+B29xxtM8KTlbBU52jplwcXSZ
	2CegIUHL9tgwmRtde4sgjzPdtBg3KURE2YPCymcQ0yf3lURqvGUqmDGsllbeXeH9XD6B
	Wp7aXoyEsH8gtXEqvNrZ9pMW0DhfFEme/S23xRMOPfg4J67nthK7qFlGf92/j2lkhpqf
	Kdbg==
X-Gm-Message-State: AHYfb5ir5v8vNzxulya6c21vdrTj7/Ub5kbrjr839xiwKRfwvAKQTLOj
	P4o4qJuAfWRj/kMiQ+0LihXwTOds7Q==
X-Received: by 10.101.86.12 with SMTP id l12mr4029831pgs.123.1502950715723;
	Wed, 16 Aug 2017 23:18:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Wed, 16 Aug 2017 23:18:04 -0700 (PDT)
In-Reply-To: <1502870987.13978.87.camel@linuxfoundation.org>
References: <20170814032418.3936-1-raj.khem@gmail.com>
	<20170814032418.3936-2-raj.khem@gmail.com>
	<1502870987.13978.87.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2017 23:18:04 -0700
Message-ID: <CAMKF1spYCEqtMHUdoi8ETNFdRK8NaY1KSefNqRk=FDigD3oosw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Thu, 17 Aug 2017 06:18:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 16, 2017 at 1:09 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2017-08-13 at 20:24 -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
>>  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
>>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> I think this breaks on x32:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/1183/steps/BuildImages/logs/stdio
>

i cant reproduce this here i changed

-DEFAULTTUNE ?= "core2-64"
+DEFAULTTUNE ?= "core2-64-x32"


and built mesa and core-image-sato from scratch. all seems to build and boot ok

> Cheers,
>
> Richard

