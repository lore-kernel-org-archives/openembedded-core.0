Received: from mail-ve0-f169.google.com ([209.85.128.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UcExp-0003mw-Dw
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 15:08:22 +0200
Received: by mail-ve0-f169.google.com with SMTP id jw11so202388veb.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 05:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=GHny+tqTYPjJCvtUqM3GgLyd21KV7eV2upwTv4vcf9I=;
	b=igD5rKy4HbUqQS7qKqbi+TOgdFqCF6s1XcmuLiXyVt2EKGPHwqcbvCXfSdhkh3OVov
	fP7ijTnYZS5Xp2NMm2cyyzEugT3Dfx2yqbrhCbuv4grhzbAZW7uT2SSXWIwzS5jyBCLx
	zZdBRTZjOy81BQkPtjCEKOarCNgFUO18dCiUPzUGu0/GOvM9w1ckIMsCFEclAU6kQUgH
	YIUzs2+zb7hPObIFC1qna4qf3DzNDz2+CzajVdM7t64AXZS5EogJdLWtHKbKmCqkIxFb
	P/l14S2FBNHgj1QygcyHNUBXC7YW9dH3B2vudmPWbvyKkyNQhZMAupqxmTdRbdfwvsj0
	aWgQ==
X-Received: by 10.58.15.193 with SMTP id z1mr21615746vec.40.1368535809822;
	Tue, 14 May 2013 05:50:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 14 May 2013 05:49:49 -0700 (PDT)
In-Reply-To: <1368530609-11218-1-git-send-email-laurentiu.palcu@intel.com>
References: <1368530609-11218-1-git-send-email-laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 May 2013 13:49:49 +0100
Message-ID: <CAJTo0LaHgkTMr3N9ij-hPjo8fDqMTYzoabZa5xZfMVZ8xd1iWA@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQmv1u95RbnExYzeH0IwFOBcqd0oIbotPn4dwGvSHnhfIweRy4xFBy+69VTrzcPMJrVwbyRY
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: make udev-hwdb postinstall run on host
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
X-List-Received-Date: Tue, 14 May 2013 13:08:26 -0000
Content-Type: text/plain; charset=UTF-8

On 14 May 2013 12:23, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Run udevadm inside qemu in order to create the HW database index on
> host.
>
> The alternative would be to build a native version
> of udevadm which would imply several things: split out systemd recipe,
> create a common inc file and create a new recipe for udevadm native.
>
> However, this latter solution might also add up to the build time
> (the native recipe would need to run configure, make udevadm, install),
> besides the time spent in the actual postinstall...
>
> So, having the postinstall run through qemu is a good trade-off.

Agreed.

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross


