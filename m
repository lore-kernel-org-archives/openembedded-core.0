Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA2C76104
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 00:10:49 +0000 (UTC)
Received: by iodd200 with SMTP id d200so3656724iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Nov 2015 16:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=l5ejSS6YfNn2Pj4VTyxta41bwLFUh0dfyWSikOLxwjI=;
	b=HxHKtmCnvr+KTss/Wgwy9Vehmwj3a5/laQvi4qG5kvXW43DaD53yMqCo57NNasY1Y5
	aZHmS5ptiYmczMv8UQHR0GYFz/o/WfsB91YIqVRgkJHF1mhq0nW+1WgthyVDZ4psVflv
	IkgG7g6X2ER1T7ZUF67RvaIbd+I/O32vxFcRS3oAj9GZXT2RqCWyil48VFOjjFX/s/uD
	e9BKf2iZjqRF0/me4YvgmS7yJtQMoDUlbB+EcM39WBelqb12L5jXtm58IhLYF0aT81xS
	FOuxaVyVaaHMQq3v74f9zAkNm2VlRHHydqxRm/Ne7atV5eLXwFgVibh//TRoU77+6mqr
	PeDw==
X-Received: by 10.107.4.3 with SMTP id 3mr6750443ioe.195.1446509449430; Mon,
	02 Nov 2015 16:10:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Mon, 2 Nov 2015 16:10:20 -0800 (PST)
In-Reply-To: <1446509230-116578-5-git-send-email-mark.hatle@windriver.com>
References: <1446509230-116578-1-git-send-email-mark.hatle@windriver.com>
	<1446509230-116578-5-git-send-email-mark.hatle@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Nov 2015 16:10:20 -0800
Message-ID: <CAMKF1srqHEUBJTxNvsoXyCf5HWPGb4cCxQ1a0cJntLN7_+X2RQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] Revert "local.conf.sample: Disable image-prelink by default"
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
X-List-Received-Date: Tue, 03 Nov 2015 00:10:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 2, 2015 at 4:07 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> This reverts commit 6dd28030f323d7106a02ec54ce4e249561ab0836.
>
> Prelink now works properly again.  Re-enable the functionality.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/conf/local.conf.sample | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 9d1480e..3ae24ab 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -128,9 +128,7 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>  #   - 'image-swab' to perform host system intrusion detection
>  # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
>  # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
> -# NOTE: image-prelink is currently broken due to problems with the prelinker.  It is advised
> -# that you do NOT run the prelinker at this time.
> -USER_CLASSES ?= "buildstats image-mklibs"
> +USER_CLASSES ?= "buildstats image-mklibs image-prelink"

With all the discussions around benefits of it recently, I think its
better disabled IMO,

