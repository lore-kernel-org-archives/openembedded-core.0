Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 03ED86FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 10:34:51 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id y83so2032293wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 03:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=84j/HdukTdMt3150gvH59nsl5raI9rnHgPGV88mrd0A=;
	b=Iv9RR89LaqUkeFtrmGW2Dq+l0dS6EY3/dVzYlPS7Cm1Tyum/d/nLUP2qwqaSfwCmP/
	Ymd6D+e0lEoCKnleZCGwPIrC0Cp8zJJ41JMvJFZk76LX5Pepjp7kdE3QAHAUH+Nw5uut
	nJTPws4mCrxrGjegiYsdcCeTXy/k5GdYUH8niggoetVw44nfibRLK9FxfwLEB8Yl4Fb1
	qy46Fn4mcv5rvJ3wwfYZT3acmy+1D+1qPBBgKAD642VG9/JH7PYNv16TI9Xq1l/OuT/B
	INMadIwCbjF+aBAtmeWvO1aDbHl3E+9TYHapBut7UtAJFDr6KK0EWuH7ePNgV19bv1z5
	X+OA==
X-Gm-Message-State: AMCzsaXSRYpYrV1EuVUOztiv3l9lyLzRKzdiT7Y2om6M0VA3mfoPJW2g
	hJWRAwCRibURyFpYt2jMczWoVGRD
X-Google-Smtp-Source: ABhQp+QS4ZU1vmIdTaHnxMqwHxDZ8nJI5y1J35HbOQI/Q5gVz78+XdJrrHIk5bQFv/E5p12Tw8ME5Q==
X-Received: by 10.80.182.35 with SMTP id b32mr12985829ede.205.1509014092163;
	Thu, 26 Oct 2017 03:34:52 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k42sm4782614edb.88.2017.10.26.03.34.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Oct 2017 03:34:51 -0700 (PDT)
Message-ID: <1509014090.13607.90.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Oct 2017 11:34:50 +0100
In-Reply-To: <20171025180312.10308-3-thomas.perrot@tupi.fr>
References: <20171025180312.10308-1-thomas.perrot@tupi.fr>
	<20171025180312.10308-3-thomas.perrot@tupi.fr>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [meta][PATCH 3/3] Fix some issues in the fitImage generation
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
X-List-Received-Date: Thu, 26 Oct 2017 10:34:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Thomas,

On Wed, 2017-10-25 at 20:03 +0200, Thomas Perrot wrote:
> Avoid a circular dependency between do_concat_dtb and do_assemble_fitimage
> when UBOOT_SIGN_ENABLE is active:
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

Can you please re-read
http://lists.openembedded.org/pipermail/openembedded-core/2017-October/143637.html

Have you actually tried building on master, or at least cherry-picked the
two patches that are in master to pyro locally?
I am using exactly the same two patches I keep referring to on my local pyro
without any problem.
In case you have actually tried them, I'd like to know why they don't work
for you, otherwise I'd still say that this patch is not needed.



Cheers,
Andre'


