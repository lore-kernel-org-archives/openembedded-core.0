Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S7jaf-0003p1-Ct
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:29:49 +0100
Received: by wibhm17 with SMTP id hm17so5597654wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 01:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=yLElMyFBeSrH/J3pRHYzeuQNGMw0pe5Taq1Xi0DGKbQ=;
	b=KLtx98ij/iQc3EYPNrjO1VEyc53L/Wm9G7rzrGxxb/iZk8x3lx3BkqJNDydakVv7yx
	UZqJR74yUmbgpkbUPrN72xjkEq82PxmjMKWd01Wz08Y1zofikEOcewq8P7fNVvx2gLpU
	LebWSww/nDorNBeSHQz9vCO/rK3inU1zodYouemIQEwlv5N8h9yimpmHpA6inThccuxi
	3+I0hAkaO7DvM2J0SY2sqmP2bxcmrQPaCSkrFqA7gEIuA5pNLq7gd+2KvY2OH+hdZUcg
	6A2dcui9pBg5hdFxF4Xl35wDurRc9azpor5YO+ESYNAMlTwfmYZ1X7fPXdLyLooklJCw
	q4+w==
Received: by 10.216.136.13 with SMTP id v13mr1006447wei.32.1331713264430;
	Wed, 14 Mar 2012 01:21:04 -0700 (PDT)
Received: from [10.68.37.11] ([87.111.147.121])
	by mx.google.com with ESMTPS id df3sm50104341wib.1.2012.03.14.01.20.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 01:20:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <9583d660052617740b61feeb6739263f06e5a64f.1331685330.git.paul.eggleton@linux.intel.com>
Date: Wed, 14 Mar 2012 09:21:06 +0100
Message-Id: <512FF648-8A82-4307-BEB7-0EC1A8FD15A7@dominion.thruhere.net>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<9583d660052617740b61feeb6739263f06e5a64f.1331685330.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQloDqEKTLQXXH3pi4UlWgeLwFM1Bd/4YDHJghJW9jDecsm5Kjst+iQ3BOhHDfQXwAAGuGOT
Subject: Re: [PATCH 6/6] linux-yocto-tiny: add dependency on xz-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2012 08:29:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 mrt. 2012, om 01:36 heeft Paul Eggleton het volgende geschreven:

> The kernel configuration requires lzma to compress the kernel image
> (CONFIG_KERNEL_LZMA=3Dy), so add a dependency on xz-native which =
provides
> it.

Have a look at =
https://github.com/Angstrom-distribution/meta-ti/commit/b72cb13fcf83b9d342=
808ea30379bfb6a1321b54 :)

regards,

Koen=


