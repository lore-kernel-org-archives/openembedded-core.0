Received: from mail-vb0-f42.google.com ([209.85.212.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFVv3-0000RZ-5f
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 21:35:33 +0100
Received: by mail-vb0-f42.google.com with SMTP id ff1so106111vbb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 13:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=VwMAfO9Ms/xEVVhJ7bKoswRw4M2JCVKRW8Nht8PeyH8=;
	b=eWRQ9YJlr+gQEEk9PsusBL+WKet4ZyIofS53cpHcHPLizuIlEea2fUFFe81CNyiKPv
	H78jhFa4AtQfJZV8DfWPHeN0/6UN08/f0g/aGdtNt/3egWsYaK4gSrK63wWct5ifrRV7
	4NuGuxrLow7CgPzB5v8ttpgVMNg5QIFG3Is+1b5Gz/WDf4xnVNgqDTulQDKa38tjwGOk
	As08G8/Svgpq9F3qDNb4KZfGmnEGh3F89TcIQbGhhHC/mDkLmKJx99gVn9wY0i50NdJM
	C1Et2iX9iWCsgM+ptGBgXuasO3ehk4UaUhV+C1hTWhwfIu+Tf8voqo9+VwO8fMKHkI76
	F1uA==
X-Received: by 10.52.155.5 with SMTP id vs5mr6123365vdb.24.1363119533087; Tue,
	12 Mar 2013 13:18:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Tue, 12 Mar 2013 13:18:32 -0700 (PDT)
In-Reply-To: <170DF684-F55C-4065-8D24-0295044CB17C@dominion.thruhere.net>
References: <cover.1363031776.git.ross.burton@intel.com>
	<CAJTo0LY7vOy4_A3YJ2-jGMfLr32o7XKY-BGp9xuiB_wnVhb6Ag@mail.gmail.com>
	<CAP9ODKr_3VVmw5vGm8EnnmOKEu8z2uzp97iBjh7315DduPegoQ@mail.gmail.com>
	<ACE79805-5D74-40F1-8443-1410AC215E88@gmail.com>
	<CAJTo0LZiS3Sx8fKZFyiDWJ21csLiKhOvuJi4=qs16CQ+u1Doxg@mail.gmail.com>
	<170DF684-F55C-4065-8D24-0295044CB17C@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Mar 2013 13:18:32 -0700
Message-ID: <CAJTo0LbeitdVoZF0BjoEWT-J99tNcTHiEC178C6t-kPZXCE0=g@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm6t7UUpnT19EmwZ9Ul+gCPG3lyox9OpF54vmlVdGkcHEifgR89TA+gHDScp8Xmi1ESmrJA
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/9] hybrid systemd/sysvinit
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
X-List-Received-Date: Tue, 12 Mar 2013 20:35:41 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2013 00:42, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Isn't DISTRO_FEATURES_INITMAN more like an IMAGE_FEATURE now?

In a sense - it populates a distro feature though a backfill and is
used when constructing an image, so if you explicitly set
DISTRO_FEATURES to include both then swapping this will change the
image.

As I said, it should probably be renamed.  Any suggestions?

Ross


