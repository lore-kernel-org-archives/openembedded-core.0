Received: from mail-ve0-f182.google.com ([209.85.128.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U37DG-0003OR-Ez
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 16:47:06 +0100
Received: by mail-ve0-f182.google.com with SMTP id ox1so1307276veb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2013 07:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=VE1wyJ0pOim6d4RK7jfvskIZhoAnWDHIzRVcrR8cBfI=;
	b=ahSlmeA6cgSJsnXtXON4SBkR13RO9ZEiUflIizsXANcHpvjA1KtdDKW09gXr55w45q
	ht9avehX940V6NAzr5OZhyyoxrctcT+zSZ/ELMTTkHZ6p/4KhfYxT3YGY9VOIP3pNyak
	eaD3XeLKpIL9343VhTJrS0gZI+7VdCqH6TC4BPjU5G/EZU7SWbZ8X9u646jydOo9um6f
	bEmK6HxfabgmzpcO3kHGZ9YTB3pxXv094a+Y3u6oK60bcN1w+q8f8kcks2BIr/O0edqy
	XuC4V720E7aGh60I4JT1BCySidSJVI/qFSy0iNoIwLediyaGx9ZVYEWpP33zkJzuZEd0
	BNRA==
X-Received: by 10.220.214.6 with SMTP id gy6mr30368561vcb.8.1360164674175;
	Wed, 06 Feb 2013 07:31:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Wed, 6 Feb 2013 07:30:53 -0800 (PST)
In-Reply-To: <f31f33c04c363ee10814d11430520bee42f5230d.1360159588.git.paul.eggleton@linux.intel.com>
References: <cover.1360159588.git.paul.eggleton@linux.intel.com>
	<f31f33c04c363ee10814d11430520bee42f5230d.1360159588.git.paul.eggleton@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Feb 2013 15:30:53 +0000
Message-ID: <CAJTo0LZMt7V1qgDKvYUwHdzR4eK9qRqM3PJ=m7w13M778rUH4w@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQlDVxQGsAbc4lvXbDpfp2Cb10Fw53ExcbTLMpOo6QFZFXbEDMjmkx7Vcc0ZJI0Ek3+/AtdC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-danny][PATCH 1/1] classes/rootfs_rpm: fix missed complementary packages with complex arch names
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
X-List-Received-Date: Wed, 06 Feb 2013 15:47:08 -0000
Content-Type: text/plain; charset=UTF-8

On 6 February 2013 14:07, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> If the package architecture name is complex (e.g. with the meta-yocto-bsp
> beagleboard machine and Poky, the architecture-specific package name is
> "armv7a-vfp-neon"), rpm reports architecture names that contain
> underscores instead of dashes, which when passed to oe-pkgdata-util
> during complementary package processing did not match a valid pkginfo
> path. Replacing the underscores with dashes again fixes the issue.
>
> Note that this bug affects the danny branch and not master since the
> substitution is already performed there in a different manner.
>
> Fixes [YOCTO #3792]
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Merged to danny-next, will be in the next build run (hopefully tonight).

Ross


