Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id BE21178474
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 17:26:28 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id t124so253190oih.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 10:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=FaWjn3sXVn/fwMPOv5t4L3mkqX2yrlRpu3gEbTTKZxM=;
	b=ideCiiPedZzoQwsA3iFDCgY23b3ZL2tlAm1bXOjtvqQUshb2UFkOBpPYhVMYgtpmLB
	sfRPjgr21U0CxyjuyLLmEv2nf87yTu1dunEOTGfyVwKtPZrz3rcYsJmyyXrGQ0PNWRyP
	D6rPM6NGW35RzDX3SAZ70Q2w35j+vyo+qql0J8Sw1GWbADNyyU+D/2f8h39MNl3qUACb
	HRMjdWFLQ5YLKikYL3ZPgCHtSEcq62UezhXDBO3X1bFYNmrK/ALSjPSVDMvVqQc97L65
	w12IXrfF+x81Is90r0YKrfRXO3wCAE95ou2wF0YEqpuqynFNwOK0iloTqMjwJ9GNnd/B
	dhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=FaWjn3sXVn/fwMPOv5t4L3mkqX2yrlRpu3gEbTTKZxM=;
	b=oM8UyefDgL7doipEssC5bUV2rqBhT6Vwo2qZSJ0/6Tdn8UGuAVHzbngg1ZrsgLvxWd
	hDtyTboeLsyyrUYOp+Sww6gSOFUb7zlg1GmFeLNTjMlpRmr77Z3TosT04bkhNBoTp9CJ
	uIWc+GaBFltHKV1l26IrWLsYQXOyoP9M1BOdyqStzX7ZX7ZMxLXlSgjvag2HtnLwZEDG
	5ZoBnpXCif2VTnDUqLBBohX2rva37w70qrf82OGK+2aNgBqU0G+R5TpirnrsRHMT/dIZ
	iA8Yy0EuJ7nRzIMxSjXCMDatDRXcYW7+Fwr5flNeKAuZTRniz9g6iz7UK7X+6rZioSpG
	3Ldg==
X-Gm-Message-State: AHYfb5gRp2SrwJIc80sdeSM0PRP1Tq8yhzk/749zesugoH6VakAmLWke
	zrbAw3SDXj8S0+0SaXE=
X-Received: by 10.202.106.145 with SMTP id f139mr5727954oic.161.1504200388682; 
	Thu, 31 Aug 2017 10:26:28 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50])
	by smtp.gmail.com with ESMTPSA id h76sm349579oig.28.2017.08.31.10.26.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 10:26:27 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id k77so2454859oib.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 10:26:27 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6R3+LjDJn4rEmTlmBqXD5OH6rFznLzx657Em9vSYFOoJsicNLtBgKiAFhZFzi41d0C2RYgNpu/qki04Jov7T8=
X-Received: by 10.202.85.196 with SMTP id j187mr6787700oib.67.1504200386832;
	Thu, 31 Aug 2017 10:26:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.37 with HTTP; Thu, 31 Aug 2017 10:26:26 -0700 (PDT)
In-Reply-To: <20170831122335.6864-1-clopez@igalia.com>
References: <20170831122335.6864-1-clopez@igalia.com>
Date: Thu, 31 Aug 2017 14:26:26 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq4Jb4HfhHCpNgg+zwwqc0E21t3cmGGMHm9jfOmqVpg2g@mail.gmail.com>
Message-ID: <CAP9ODKq4Jb4HfhHCpNgg+zwwqc0E21t3cmGGMHm9jfOmqVpg2g@mail.gmail.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-live-boot: disable systemd-update-done.service on live images
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
X-List-Received-Date: Thu, 31 Aug 2017 17:26:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 31, 2017 at 9:23 AM, Carlos Alberto Lopez Perez
<clopez@igalia.com> wrote:
> When systemd is used, it will invoke a service on first boot that triggers
> a rebuild of ldconfig caches (rebuild dynamic linker cache).
>
> This is fine on the first boot of a system that has been installed, but it
> makes no sense on a live system. The worst part is that rebuilding this
> caches is slow and it causes the live system to take longer to boot.
> (I measured this in 30 seconds longer on a standard PC system booting
> core-image-sato live from an USB memory).
>
> Disable this by touching /etc/.updated and /var/.updated on the live initramfs.
>
> For more details see https://bugzilla.redhat.com/show_bug.cgi?id=1201725 and
> https://www.freedesktop.org/software/systemd/man/systemd-update-done.service.html
>
> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>

This should be done to the live boot module of initramfs-framework as well.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

