Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 74C1D734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 14:39:09 +0000 (UTC)
Received: by igcqs7 with SMTP id qs7so108372400igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 07:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=k8Ma0gW1amEo1aFzE29aVWX6ASBFgbkB+Ui35xOpoRc=;
	b=en7/XD18quCiaOVA5dP+W1Y0ZP0+3BgJbJr6yYTHd+DRqnxWoiOLLQ5DE5bp8bjIRT
	duzDhfYYRXJpUwUJN8Y38oc4QTH/nw/5v5RTcSpFKgQOSbtGT+3SUxcL8dP+AP2Fzp2Y
	l9IzD/uv2zEFTaTv1pw4C1aDQZnwf2t532rYloqSUhKvXPdQTGUtkSCFxZYuBUiyIBAj
	CMo5qqiwHgc2osHWMrwrWfVnmqZeDeaQVUDkl+cuYYu7Y5Xhjw4di4xxaBQD/0kLJ7pF
	aewsmfNQsfg8c5/KXGErK+p0bmSaOiOWq/gX1OZGKy4N1A06p8Ap+Larbh4w5+JhtsWe
	016w==
X-Gm-Message-State: ALoCoQlQtXfsEZ+T0icNG3MV5odkOdvYsQ2vEQ0RHbontisC3Allg3u/nWX011olhzbeCZ4fL18X
X-Received: by 10.107.169.10 with SMTP id s10mr5115592ioe.138.1436971149127;
	Wed, 15 Jul 2015 07:39:09 -0700 (PDT)
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com.
	[209.85.223.170]) by smtp.gmail.com with ESMTPSA id
	kk9sm10185158igb.7.2015.07.15.07.39.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jul 2015 07:39:08 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iebmu5 with SMTP id mu5so34793062ieb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 07:39:06 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.150.141 with SMTP id y135mr4916146iod.38.1436971146774; 
	Wed, 15 Jul 2015 07:39:06 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 15 Jul 2015 07:39:06 -0700 (PDT)
In-Reply-To: <65e10d1ba71dbde6af6be14d971e91fc8b690aed.1436965937.git.cristian.iorga@intel.com>
References: <cover.1436965937.git.cristian.iorga@intel.com>
	<65e10d1ba71dbde6af6be14d971e91fc8b690aed.1436965937.git.cristian.iorga@intel.com>
Date: Wed, 15 Jul 2015 11:39:06 -0300
Message-ID: <CAP9ODKpKw3GJDyLSX-xiZRK7DxjN98U4dA3zXHF1h6qAyw_01Q@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] qemu: upgrade to 2.4.0-rc0
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
X-List-Received-Date: Wed, 15 Jul 2015 14:39:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 15, 2015 at 10:17 AM, Cristian Iorga
<cristian.iorga@intel.com> wrote:
> - Get rid of direct use of gnutls APIs in quorum
> blockdrv in favour of using the crypto APIs.
> - Convert VNC websockets to use crypto APIs.
> - All previous CVE are now included.
> - larger_default_ram_size.patch patch removed,
> no longer necessary.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>

use qemu_2.4.0.bb name otherwise it might be a problem for upgrade.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

