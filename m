Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TR6rr-0000Gz-6Q
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 21:43:55 +0200
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 24 Oct 2012 12:29:58 -0700
Received: by mail-ob0-f197.google.com with SMTP id tb18so2611920obb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 12:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ChRoqT8ZK9zbkSX2ak5rZPhRsSF/2Iv3aygE+Gqdin8=;
	b=D6Jt1+ZV1utRPAQ7iF7QxOmKzx7HknW5o5y6JsFnGBw+hPPY2nY09wp9xJg6VtDhSQ
	cuNR9vQStUl6gri+plWdcMKMzgeJEcpiFfAEDIiYIlM3BnIZ6x20qud/Yj45n0jB0vWN
	vKq/Nzkhs8PKKvdkLMcolPElY6UNfqv90ix1lHl7l7zJhc1lH4sbq2rZtV3aXZqMC9D0
	WjTUDyag2NxEeIB5nYP14axAPY6w80Bbl4C3J9/uPiRDY+N+c6vJDL2ZGzZFjJXr+x2E
	gy/ZSL9rSBIrEYzPI7JZngWySvQ6sl78QczeA4xidjsuyk+RKpxPoEnj3LWPoV+VHW4J
	xTMg==
Received: by 10.182.228.69 with SMTP id sg5mr8567374obc.2.1351107025133;
	Wed, 24 Oct 2012 12:30:25 -0700 (PDT)
Received: by 10.182.228.69 with SMTP id sg5mr8567371obc.2.1351107025064; Wed,
	24 Oct 2012 12:30:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Wed, 24 Oct 2012 12:30:04 -0700 (PDT)
In-Reply-To: <20121024180946.GI3269@jama.jama.net>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
	<20121024180946.GI3269@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Oct 2012 20:30:04 +0100
Message-ID: <CAJTo0La2913pziDM+QPg-GpLfeLDc6T0=HmSwfMUt9wbsBgy1Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmjzw2XK+pcro4wkEfYy9+zBeQlx5/STHqrgdTD30/fCQJ5a541Bl/VjFMdbT8slbHFyqNxUSj9i+pjJ3U5lxh/YLF3dbRt+0X5XQbF01vdJA7RXd2/aGJgaI6cnSZkIqp3naGjOgXxBMFHnnLlnSGc68jpHxcnpfPFTxJpgt98VSdFb4fWarJ8ELy4VdXSdbDQBFZF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] pulseaudio: add GConf dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Oct 2012 19:43:55 -0000
Content-Type: text/plain; charset=UTF-8

On 24 October 2012 19:09, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Oct 24, 2012 at 05:37:33PM +0100, Ross Burton wrote:
>> Add explicit build-dependency on GConf as currently it's an implicit dependency
>> and so vunerable to races at build time.
>
> Isn't better to inherit gconf or the issue I had today with foxtrotgps
> does not apply here?

This just links to gconf, no schemas.

Ross


