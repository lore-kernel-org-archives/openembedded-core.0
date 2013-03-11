Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFCIr-0004fL-J4
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 00:38:50 +0100
Received: by mail-vc0-f177.google.com with SMTP id m18so2381371vcm.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 16:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=k9WOJZp1rBtaP3TquauZttkODOMhrU7fepRls7Egajc=;
	b=Wu4xPoLzR2UpGFR1lRak1ufSi00mK8oezVhKMj8s1DfY/Yo7ks9Ll4UiLIwl0k2+dV
	MmY8WVOZ66HkXoBPZEbbZK3B38SpRsdwG+w70baBUmemho3VayaxWt1OfuR3edzgzqTM
	hLQ9EQ/T0LGkENVrzDMAxUwKnhIRML18Cl7kE6pi6cCkjDcIfBW0Xd/ZxQc8MCWL/clg
	Ng5QltIgWkcgNk5FHVPE1sGXamLIbbRYD7ebPom4bOK7RWTcKwr71yCTaJp1pmEfR49R
	hTS41LA1c/QixR2Sii6TrqFa04T0rnJSWLTkgcqQZe2YkZRAcK7iqj94z8tQKCqMF4xM
	K1nQ==
X-Received: by 10.52.75.65 with SMTP id a1mr4914092vdw.79.1363044130801; Mon,
	11 Mar 2013 16:22:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Mon, 11 Mar 2013 16:21:50 -0700 (PDT)
In-Reply-To: <ACE79805-5D74-40F1-8443-1410AC215E88@gmail.com>
References: <cover.1363031776.git.ross.burton@intel.com>
	<CAJTo0LY7vOy4_A3YJ2-jGMfLr32o7XKY-BGp9xuiB_wnVhb6Ag@mail.gmail.com>
	<CAP9ODKr_3VVmw5vGm8EnnmOKEu8z2uzp97iBjh7315DduPegoQ@mail.gmail.com>
	<ACE79805-5D74-40F1-8443-1410AC215E88@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Mar 2013 16:21:50 -0700
Message-ID: <CAJTo0LZiS3Sx8fKZFyiDWJ21csLiKhOvuJi4=qs16CQ+u1Doxg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQnLw1A5gKLnSz3/6A2XCJM3LMFYaDOfwhySjmzc7ywW2jn+e6ZWgtSc+E+KPDJbaP3AKkb0
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
X-List-Received-Date: Mon, 11 Mar 2013 23:38:52 -0000
Content-Type: text/plain; charset=UTF-8

On 11 March 2013 15:49, Khem Raj <raj.khem@gmail.com> wrote:
> using different init manager is a separate problem than what Ross tried to address here isn't it ?

This series lets you do DISTRO_FEATURES="systemd sysvinit" and it will
build support for both in the packages, and then based on
DISTRO_FEATURES_INITMAN it will build different images.

Ross


