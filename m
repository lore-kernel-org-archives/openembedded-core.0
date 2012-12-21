Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm0Sw-0006vk-JB
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 12:08:34 +0100
Received: from mail-yh0-f70.google.com ([209.85.213.70])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 02:53:47 -0800
Received: by mail-yh0-f70.google.com with SMTP id o21so6310746yho.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 02:53:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=b82klxkSXHfzHMDPe7XxcVOPDeGYPUcIOY4nNzQW1no=;
	b=f/Zzc5Y5bovpLfzDNRrj5n7BwTFqBBonX47J4gmCZQ/0fLjX0O/KRKjWUbJc9vJ3nj
	nTz4X5Ge2Bh4txcHRRF/bCRfTstx19BEIU8RrsDVkxxON4JuyxrNsbLIWQw4lssy7eMb
	WQd1HreOgXTS9cggiRL+R+25cEumdeN8/6LhQDjaXciYUWI6NxjjqBZ2Tw3REqjKUkc1
	D0VolkuQ8lPKegpjXcxYCcMnLKuVOi2NUbNtufESgIKdUprZjmvlTHD3Fjvb22BSGgmt
	P612OlL+Rj1Cc2e5cjPcRRNzIXZyGoHse15DKunAvL8t74fcbIaS/cncXR21lnsBFKcH
	sBlg==
X-Received: by 10.58.221.130 with SMTP id qe2mr20031514vec.14.1356087226370;
	Fri, 21 Dec 2012 02:53:46 -0800 (PST)
Received: by 10.58.221.130 with SMTP id qe2mr20031503vec.14.1356087226279;
	Fri, 21 Dec 2012 02:53:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 02:53:26 -0800 (PST)
In-Reply-To: <CAJ2CSBvvwVhrjGjmh5CXrSEbR7oz+iPr+uhGXa3ytTvXxKXkGQ@mail.gmail.com>
References: <cover.1356021837.git.alexandru.damian@intel.com>
	<5f9c3b67176f90714a2fd394e64f7d8da3cb0258.1356021837.git.alexandru.damian@intel.com>
	<CAJTo0Lb2QgqE77f4oZm8sqc3izJfDhmcniGoMMCyTtBOsne2Dw@mail.gmail.com>
	<CAJ2CSBvvwVhrjGjmh5CXrSEbR7oz+iPr+uhGXa3ytTvXxKXkGQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 10:53:26 +0000
Message-ID: <CAJTo0La-8q8qnzdu2iju1E-62mr86n0xZcNa21h+XRTgYBgiFQ@mail.gmail.com>
To: "Damian, Alexandru" <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQklcka0ngSsH4MnxM6M0PxbovcGCaEiB8qK0c5mZ1u06vwpAKhs47z5l7XGouzbkYpqtlUR7rkJvNzB3D5hpoBtT/iAuE4dM41JafiOFdAzGLmyCNoCtRuKZcZZleUPefd/ukOMpL/VWbm4k6ajR1oyyL0sQLq3SIWuCbl6NwqPi4O4zpdwJsD9Z/sgNeoxO0J6QR3P
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] Prepare mesa-dri for weston compatibility
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
X-List-Received-Date: Fri, 21 Dec 2012 11:08:34 -0000
Content-Type: text/plain; charset=UTF-8

On 21 December 2012 10:10, Damian, Alexandru <alexandru.damian@intel.com> wrote:
> Mesa-dri provides these packages, why shouldn't we let the system know ?

Because build-time dependencies are expressed as source packages, not
binary packages.  If you add them to mesa-dri then you'll have to
follow it up with a patch for every recipe that builds more than just
${PN}.

> Is there any way to prevent weston being built based on mesa-dri version ?

I don't see any reason to bother with that at the moment - we'll soon
have mesa 9.0.2 in oe-core so there won't be any problem.

>> I also don't see anything that adds a build-dependency on wayland for
>> the Wayland EGL backend to build successfully.
>
> It fails gracefully if wayland isn't selected.

mesa-dri needs wayland headers for the wayland backend to build, but
there isn't anything pulling in wayland if you enable the distro
feature.

All you need is:

+PACKAGECONFIG ??= "...
+                   ${@base_contains('DISTRO_FEATURES', 'wayland',
'wayland', '', d)} \
+                  "
+
+PACKAGECONFIG[wayland] = ",,wayland"

Ross


