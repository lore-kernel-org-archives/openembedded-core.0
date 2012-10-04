Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TJouW-0007S3-Rn
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 19:08:32 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so558232eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 09:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=pwDH7zL+2R5FIMLOc15feztgCB38crVOopglFRScG5E=;
	b=gTPEGVNNmIktPplP9Yj8H7rzvwJA4gUNCbdLiPZccOX88JTJaGuPWmjpPuoJkaM177
	a7HSMmXksj/Vm3hR0XW0kPNJGVrG7Zg9xSeh+1ryogkLVKaME1Tg5OWFW9iQx56rWM4W
	jDjeErO8nNMf/4TIPmvtt2KyDxMWDKI9lrF9vO2nmKqFkGb3jHurtCl1peH5KMBgJpU1
	WXBQi5F7YxoPptxR1kj1tJO0Icgdjom48kEUaHmfQgCtuuTNqVQcykiCqkVL1x7xQ2o6
	n7Rkqk1hX8HNnlzNVEH3tBUxq6iUn+ITQUtow62Y8oDAykuLZagZCglTC43pBkEoAWmW
	vn1A==
Received: by 10.14.4.201 with SMTP id 49mr9287351eej.0.1349369731934; Thu, 04
	Oct 2012 09:55:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Thu, 4 Oct 2012 09:55:01 -0700 (PDT)
In-Reply-To: <95933d4d0d8226614433d225f106dd3b8aedb3df.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<cover.1349356755.git.Martin.Jansa@gmail.com>
	<95933d4d0d8226614433d225f106dd3b8aedb3df.1349356755.git.Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Oct 2012 09:55:01 -0700
Message-ID: <CAMKF1sr=OnrzMec_NnM8OCr_vt1LZBTnUimWCcpJSHMrTUhxPw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] tune-xscale: replace TUNE_CCARGS for webkit-gtk and cairo only with xscale in TUNE_FEATURES
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
X-List-Received-Date: Thu, 04 Oct 2012 17:08:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 4, 2012 at 6:23 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> -TUNE_CCARGS_pn-webkit-gtk = "-march=armv4t"
> -TUNE_CCARGS_pn-cairo = "-march=armv4t"
> +TUNE_CCARGS_pn-webkit-gtk = "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-march=armv4t", "", d)}"
> +TUNE_CCARGS_pn-cairo = "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-march=armv4t", "", d)}"

I would rather try to remove this option completely if possible. I
wonder if we still need to target armv4t when building on xscale
may be the reason it was added is no more relevant ?


