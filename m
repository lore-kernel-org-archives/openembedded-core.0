Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0C86059F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 10:17:04 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id b9so894886wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 03:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=24flSRnyhUuZFPha9Wl5H9OWGgbsp1k97mzOZ0TkKBY=;
	b=AQAQP9bkb8KCr2YcgZLby0FNkRFbAuTfh6WmFeSI530+3N5X40XH6dWNpOX3HXVKgA
	E2zW+5e+j5f30bAxJexz35j/B3GAeIjtG6L2i6hE4DEb2NDRVCU6AVo1AMlbU4ys9fZN
	53kOMINQKk8A2EXeld0aAa2de/oOk3t4+rUR83DmLfmrTVCwctWfryYdIMfmuR7wEPpT
	XKRm5Vz+B9yE7Y3qmnN/0+i8T9qB0Id3dWCpCVD2RhxNPus1gyrn5YJz1JVjmt8dFNrF
	KVqd29TtHIjmpA4pYu3wVVJe6B54oVgYozfIkb7W9+WUapEBby1+MsBZubXfYUF7+sqz
	eLdQ==
X-Gm-Message-State: AMCzsaWPwFxX+QbW0aHRMm/zn+Wf+mtI1pQnGU4bKawjvkxY55KM6iml
	qwrdbUTMjgGCFcvrFDR1IJQa4022
X-Google-Smtp-Source: ABhQp+Q6x+XM+CgMwCrjCL2aT/Jxgsmafk8fLjfWAUfIXr9c5mdaKgVNHPBxhUgz31LdbXmU1/jZ9A==
X-Received: by 10.28.32.216 with SMTP id g207mr1183596wmg.138.1508926624834;
	Wed, 25 Oct 2017 03:17:04 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q81sm2008979wmd.27.2017.10.25.03.17.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 03:17:04 -0700 (PDT)
Message-ID: <1508926623.13607.56.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 11:17:03 +0100
In-Reply-To: <20171025071832.5802-1-thomas.perrot@tupi.fr>
References: <20171025071832.5802-1-thomas.perrot@tupi.fr>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [meta][pyro][PATCHv3] Avoid a circular dependency between do_concat_dtb and do_assemble_fitimage
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
X-List-Received-Date: Wed, 25 Oct 2017 10:17:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-10-25 at 09:18 +0200, Thomas Perrot wrote:
> When UBOOT_SIGN_ENABLE is active:
> 
> Dependency loop #1 found:
>   do_concat_dtb (dependent Tasks ['linux-
> yocto_4.10.bb:do_assemble_fitimage'])
>   do_install (dependent Tasks ['pseudo_1.8.2.bb:do_populate_sysroot', 'u-
> boot_2017.01.bb:do_compile', 'u-boot_2017.01.bb:do_concat_dtb'])
>   do_deploy (dependent Tasks ['u-boot_2017.01.bb:do_deploy_dtb', 'u-
> boot_2017.01.bb:do_install'])
>   do_assemble_fitimage (dependent Tasks ['linux-yocto_4.10.bb:do_compile', 
> 'u-boot_2017.01.bb:do_deploy'])

Thanks for adding more details of the problem. Please compare this against
the commit message of

http://git.openembedded.org/openembedded-core/commit/?id=7da4c0a56eb2027b3e36b9e42f1f83dfb02bb920

Looks exactly the same.

Are you saying that
http://git.openembedded.org/openembedded-core/commit/?id=7da4c0a56eb2027b3e36b9e42f1f83dfb02bb920
http://git.openembedded.org/openembedded-core/commit/?id=e44b72ab45c757cc83c7856c118588f1af299790
don't fix your problem?


Cheers,
Andre'


