Received: from mail-vb0-f42.google.com ([209.85.212.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5w8P-0001Z7-1j
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 11:33:46 +0100
Received: by mail-vb0-f42.google.com with SMTP id ff1so1370894vbb.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 02:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Zajti1JTBJyaEFUltcJlsx1y4f+muR9lPQ7i0Er5UiU=;
	b=dY3TIM3vXGEuTn6tubJ1E0B/0lwdQU5NXzz8nVxm/hzaci2NCpKYMtoevZdvNoN1ON
	9wyRpk336eO5/8yYExZKHcjfOr3Yzg8sZ/jks4FYvWzFq7p0hLxNGHPuo51i69i7ORYf
	cAWwU/Zo4PUlibmXZHOO7NpWvGH5U/uIdHbKdqphIEglk+BY6wvKuZMujgVDMHC4w271
	OJFP7VETVoCUi3sbFcQlFvt/SGGSf2hN8xlsFZjYixuvrJbMVsPEhHwL5CXylUnlSs7p
	Urh9CFCrR8/UHWmeQqaAE0by/wB7eyeDaAcSsll/A6+VZNQw5lNOValGcHhpeaPfTAqi
	Oy3w==
X-Received: by 10.58.106.35 with SMTP id gr3mr25135869veb.51.1360837062746;
	Thu, 14 Feb 2013 02:17:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Thu, 14 Feb 2013 02:17:22 -0800 (PST)
In-Reply-To: <511CA9E2.70700@windriver.com>
References: <511BB265.8030505@windriver.com> <511CA4B2.1090307@intel.com>
	<511CA9E2.70700@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Feb 2013 10:17:22 +0000
Message-ID: <CAJTo0LYLtan2=YkzCN9Xvkj7k695LGba7T1QMHwYQ8EK46YvgQ@mail.gmail.com>
To: Florin Sarbu <florin.sarbu@windriver.com>
X-Gm-Message-State: ALoCoQn5a+6dMEp6PVjv3n9orSWQlCcZme7veUnhOxreRVUfYSgE5PDZWaRvMSrZWKDn5qjDl50T
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd services in the rootfs
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
X-List-Received-Date: Thu, 14 Feb 2013 10:33:56 -0000
Content-Type: text/plain; charset=UTF-8

On 14 February 2013 09:09, Florin Sarbu <florin.sarbu@windriver.com> wrote:
> The issue I was referring to was that the individual packages (that contain
> the systemd service files) generated from various recipes, do not end up in
> the rootfs solely by having them declared in the SYSTEMD_PACKAGES and having
> DISTRO_FEATURES_INITMAN ="systemd". You need now to explicitly add these
> ${PN}-systemd (or whatever name you choose for the packages that will hold
> the systemd services) in some packagegroups or image recipes to have them in
> the rootfs. It is not a question of where to have them in the rootfs, but
> rather to have them added in the do_rootfs stage.

Put the service files into the relevant package (i.e. $PN, instead of
into a separate package of their own.

This is different to how meta-systemd worked, because in oe-core
systemd is a DISTRO_FEATURE and not something you can decide at image
construction time.

Ross


