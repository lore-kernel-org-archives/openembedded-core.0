Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id E576271B2A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 09:06:48 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k61so19824349wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 01:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZAsreBT3CrNzeWvOSqWbOiAWvMIuvA3wo9lRDxpVw3M=;
	b=MoCJ86//y6kfIbjBodKiTYcVCOn/lSIpd2nzW9onzA6iaNs9JyBYk2f6yRVH+qjmxl
	bRvvFzEwwBVyBj3kCQZwsnvr59OClWLaBPaej/ObVrveSWruNJkJv4TXZwK6p1lyosv4
	lm8kCcJx6/0D0u+aayjVznlNwCnscUXjbFRroIfC21pWhFk1TMrOuninKw6EtyQeIc4N
	XRa0ZYbP+pN0MtVROFgnOW7aufgRsasdpsQcj1geCgalVp1Kcg5eSlrHyu5HPydZ3Bjo
	6haxOY+41lKdvK20OT89j1qYbUexah+D+LJs1/Lnq7tNKnxZMHBy/Ne+JV8sqcb71MJP
	J9xQ==
X-Gm-Message-State: AJaThX7hD/DWdX/ubhKfkeHJWraE7wgFljgp/UKGLoC8Q/wpJs4vmdwy
	APgmvp3ObkrE4nzKNUAlbOU=
X-Google-Smtp-Source: AGs4zMaxmW5HvPI1HVuG3JN+5SoSz0oNgr4JGJg3XhAS8yvGgbgBx2pujWcImQaLoLqA3OHhL1yhAw==
X-Received: by 10.223.139.3 with SMTP id n3mr13257109wra.166.1510736809747;
	Wed, 15 Nov 2017 01:06:49 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id h8sm6708098wme.30.2017.11.15.01.06.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Nov 2017 01:06:48 -0800 (PST)
Message-ID: <1510736807.4049.75.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Robert Yang <liezhi.yang@windriver.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Wed, 15 Nov 2017 09:06:47 +0000
In-Reply-To: <4a8c2156-35df-8786-31c8-b35b8a6588d3@windriver.com>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
	<62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
	<1510563249.4049.33.camel@andred.net>
	<a4f2cfac-2714-ef11-c4ff-308ce183f1e1@windriver.com>
	<1510654568.4049.64.camel@andred.net>
	<CAJTo0LZFWFV-ZThaf0aNxC6r8+guutmNU68759hHND7zESmc6A@mail.gmail.com>
	<CAJTo0LbnJtZG2LTe_NsOgH5-q1y7JectDHDM0h9nJMbi5txb9w@mail.gmail.com>
	<1510668148.4049.71.camel@andred.net>
	<4a8c2156-35df-8786-31c8-b35b8a6588d3@windriver.com>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting
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
X-List-Received-Date: Wed, 15 Nov 2017 09:06:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Wed, 2017-11-15 at 10:23 +0800, Robert Yang wrote:
> 
> On 11/14/2017 10:02 PM, André Draszik wrote:
> > Is that an ipk / OPKG issue? Should something be removing the old
> > packages
> > from deploy?
> 
> I tried PACKAGE_CLASSES = "package_ipk", I got the same result as ross:

OK, so I tried with autoconf-archive myself now. I get the same result as
you two.

But - When moving a recipe from MACHINE_ARCH to TUNE_PKGARCH then the old
package is not removed.

[...]
> I guess something is wrong with your build.

To summarise:
- moving a recipe from TUNE_PKGARCH to allarch removes the old package
- moving a recipe from MACHINE_ARCH to TUNE_PKGARCH *doesn't* remove the old
  package.

Where would I start looking?


Cheers,
Andre'


