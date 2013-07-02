Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id ACA65621E6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 10:36:31 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id hv10so2644964vcb.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 03:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=THlSUEyZN3jWY7aAPB6a7Xvh3CFEzePGY3JwczQQ4ZE=;
	b=ioY75xvZD6b6GLKcosfWEimS7zQUZUZ4YbeAxgRu++eXYmQ9gru57bRo7xzMMzCTOp
	dHWL2CyJEkBiAuzSoIdg/zWKzNpDD+2kwfoZvEwECDQbCAGbUr3FggeXtzwDNOEC8h6f
	FAYR4QEdqXr7S/GtVaD8HnoWX4woCpt8FP79ddEBaYrXvmPf7EzqEfQVRb29aUMcUa3m
	PIYmDDDjdNFHiO7vufa/X36MdiCCzW5+oJw0JMEJm93ptesrfzoWEDAzoVEd2u8tDSvb
	+2BOoccRa4fBjZx88pIe0MINz9BpFxDyaG54VX62OJ+feEjT79w2665Do/fAGzGpqyBN
	YOuw==
X-Received: by 10.52.163.46 with SMTP id yf14mr9208079vdb.58.1372761392451;
	Tue, 02 Jul 2013 03:36:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 2 Jul 2013 03:36:12 -0700 (PDT)
In-Reply-To: <1372457299-8340-1-git-send-email-sgw@linux.intel.com>
References: <1372457299-8340-1-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jul 2013 11:36:12 +0100
Message-ID: <CAJTo0LYvUMKyKqLBFEHXavjgRmwAxnPY6rfwFTux2ZAdSGX0Lw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkXiib1bAYujquyDYWh0ept2snVpxNW5BZeFybdSXEgmo83xpNxf68wqOm3mYzujFnGVdrK
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] security_flags: Add the compiler and linker flags that enhance security
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
X-List-Received-Date: Tue, 02 Jul 2013 10:36:32 -0000
Content-Type: text/plain; charset=UTF-8

On 28 June 2013 23:08, Saul Wold <sgw@linux.intel.com> wrote:
> These flags add addition checks at compile, link and runtime to prevent
> stack smashing, checking for buffer overflows, and link at program start
> to prevent call spoofing later.
>
> This needs to be explicitly enabled by adding the following line to your
> local.conf:
>
> require conf/distro/include/security_flags.inc

Will we be enabling this in Poky?

Ross

