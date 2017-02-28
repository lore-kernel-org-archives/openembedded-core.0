Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id A187D72FBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 18:24:19 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id j56so2831214uaa.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 10:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+7ITntoqvJcs2K9UTLKVTlpghhkz6oV7qeXlt8PLZak=;
	b=LWkfSYBOq6FhtbHeD+l5rgD7nhldNiUoBD6mHhnsWtq5LDGSwe4J0/tbGt3J+5KyR/
	LNQMuBDDuRyjqsayA0saC3NTS0r8UmfTA+zYA8vKZLDSz/j7wwrQ+Nqx51lz0hrNybp0
	QaGYMrEbvBqXHZAjydU1V1xn36TpS6rscyvcLLy5m3Ycf11vmy2rIM9B2xhmG6rfswMQ
	uKTRiMmZvMnFFXDFcvuUWYQy1MHY0IOTXP2Vj5PWg+Bf5sL/jS67PG7eDQhaf2C/a62x
	K1U6Uo6vQ38J5w95uxyny33LXtiG/e1AlUQwcO4z1/7OI5gH9OXQ7Bcmj4vYueE04Mfq
	/b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+7ITntoqvJcs2K9UTLKVTlpghhkz6oV7qeXlt8PLZak=;
	b=r+A0V+siwbtyzwF/L2hkns/3KyayCZVWpaUZPDA7Xrl83VqV0k95vuKhZdSXQATGO6
	rKLSLyxtIEq93L9sz+U30w71moRFvI+6DlqmUEqfk1aZDjf+ZpVAtsQEHOuIApO6BozW
	YSlE1zag6Pk6ObwJBoZj6fiuYzPgQ0p5tOBv3wwyGVAb/wP0np+LKPrF0AtS48VE86Dy
	V00nSoECgIMzehR+E5S5EoXKs98C2zXvkRKnzWF6p7ggG3fRIwWy1kh6SjVwbPkMpOoU
	m2w0ELjqZ/rHEfNqaXqwnq6x4tXC7MU2sDqxBM4ZupGPAj/7sVzZguJiPa0fGydrTWKz
	bhgw==
X-Gm-Message-State: AMke39lS0cs52rALaPy0t1AI6ZmjSZNGN85csead5lOxePD6/utsUt9HbTAZXSicjsEVb70judDLuKVroe+uSw==
X-Received: by 10.176.90.195 with SMTP id x3mr1681139uae.165.1488306260266;
	Tue, 28 Feb 2017 10:24:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Tue, 28 Feb 2017 10:23:49 -0800 (PST)
In-Reply-To: <1488274875-10233-1-git-send-email-maxin.john@intel.com>
References: <1488274875-10233-1-git-send-email-maxin.john@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Feb 2017 11:23:49 -0700
Message-ID: <CAMKF1spHQMTkyoV+X0vupBG4HXn7G+e+_KOToQ595vf=nNy7bA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gstreamer1.0-omx_1.2.0: remove recipe
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
X-List-Received-Date: Tue, 28 Feb 2017 18:24:19 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 28, 2017 at 2:41 AM, Maxin B. John <maxin.john@intel.com> wrote:
> Removing this recipe since we have the latest gstreamer1.0-omx_1.10.4
> in place.
>

this is ok

> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb | 11 -----------
>  1 file changed, 11 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
> deleted file mode 100644
> index 3b4580f..0000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require gstreamer1.0-omx.inc
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
> -                    file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
> -
> -SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
> -
> -SRC_URI[md5sum] = "d24e8c0153c35dfefee3e26b1c2c35f8"
> -SRC_URI[sha256sum] = "0b4874961e6488ad9e5808114bd486ea981c540907262caab1419355fd82d745"
> -
> -S = "${WORKDIR}/gst-omx-${PV}"
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

