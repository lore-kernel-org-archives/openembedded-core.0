Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id D43F9714EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 15:06:35 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id v10so2715472qac.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 08:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tpf06Bq/dT3kC2DX6Cz+L6pHK8JgaeCi2gwRlXU9NE4=;
	b=Vlp0n5ZhYAYoppy+/ixSVWuZwJ3WzKUyDa2cpi7x9C+jvhLweJjA6dYPpX8BIOdJie
	RLEahtkdpsjSxKuZAxImH5yMPIeovGSJeecF9Tj3MaJTuRFl7xpML+uHf5f9XC6/5kRP
	PtqOnmWv1Cvr7qO88t5ojkhAlQogwl0idvwJQd4aJCzlgnu6LU9r0zJJnC4p+fhIfB7V
	ti/HJTmOKNVPGId1HXUeBlWpgPSxpFYBBh80HkSSE58NSbg8zLYploAZa1cHvFe7kNCM
	bX2VMbwKnkRy2CP9usPaBhbg6DP2wLfb2VYkt4JpuZBUeKBjWu/+UnasnzHLgWhdcf1D
	KH7w==
X-Gm-Message-State: ALoCoQmyW2Mf7bmGkauNc1Y2Cp7aaxZBKqWY5M1mZvzfHZfiXINVU0oCbn0BdH9IGze150taUD6B
X-Received: by 10.224.104.2 with SMTP id m2mr1528637qao.52.1411139196649; Fri,
	19 Sep 2014 08:06:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 19 Sep 2014 08:06:16 -0700 (PDT)
In-Reply-To: <1411109370-27814-1-git-send-email-rongqing.li@windriver.com>
References: <1411109370-27814-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Sep 2014 16:06:16 +0100
Message-ID: <CAJTo0LbxDxYCXTo6p4YS2U7-UY1f6UVnUcO3NaeaGi0BSx2C7w@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] pinentry: add recipes
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
X-List-Received-Date: Fri, 19 Sep 2014 15:06:43 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2014 07:49,  <rongqing.li@windriver.com> wrote:
> +DEPENDS = "libcap ncurses"
> +
> +inherit autotools
> +
> +SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
> +       "
> +
> +SRC_URI[md5sum] = "e2b6f94471ba1e978f6e5bf6b275189b"
> +SRC_URI[sha256sum] = "359db3bf46cb743ba0b3aeef259f6107271ca888ba3e22c1cba525c9aca35612"
> +
> +EXTRA_OECONF = "--disable-pinentry-gtk\
> +               --disable-pinentry-gtk2 \
> +               --disable-pinentry-qt \
> +               --disable-pinentry-qt4 \

Add PACKAGECONFIG options so the distro can pick if it wants curses,
gtk2, gtk3, qt3 or qt4 UIs.

Ross

