Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 582FB7D436
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 02:07:30 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 8so527839pfr.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 19:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=59uiUjBZCEcOXqv29BCbV5BkXHzJ4dPdGFH44gQnjoI=;
	b=d8FBd2ILyYwBf9YCj4QkKklukxj0knmMR/rlGxmX3ko0qvwivF/wwHhXBst/rmV2LB
	kqIopxbIz3HVSVFzSiLBFlw/Dc6LYTLJLh0M/uo0rqrE0HevPSopk4i6sDTm3ZHrhXpr
	Wi+EcMONzcBaLj76Qf1OFy0qUjb6HEJ5d3XgAwhtowN3Dk5VU3l9hMF0xvLVIcDda9mb
	ZBx1nhiu8fW0xEVdDEzdlm/Eb8We3oHzVYq/09m2C7GWx9e6jVX10OYZKQcA867xT22y
	4j30O+NSqHlR4ScjnyDKpELae/HDuizJmC8zt3YRq4qEfluP8DbswmO7sjyb0W/8fNTj
	rZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=59uiUjBZCEcOXqv29BCbV5BkXHzJ4dPdGFH44gQnjoI=;
	b=Fv8iyLZr85EFBv1RhY0qGAWpsCD9VheFW12no/iFsjLDX2JFFxkhxJU8L4EZRwC4sR
	AU4PWyAcPSWz9XFtZ/iNEGMrw5OuNuBlocaif+QpAad7kuFYxDYi+SXSEmaGUhMHSMsO
	ODJ+i9N1xIU8A/p5nKjdgft/skYF/7zKYxDh6UKRfWYH7rPsKosTBDYDz9SeYw/oKXY6
	r6sxIysZj9kCYwC9zJEAMliDuYRvGu4Ej4aUEuzPaE6iBzIlzBCyM5L+pbX5sQyMPQGC
	aaXs+9kfjPax+Yl3NrQbIL79N00+xT/D8//GQwKoAIZw1QJb26McWXbAbcyU5ZG+MY73
	Cmvw==
X-Gm-Message-State: APjAAAWj+xFVXbWOY4whS5fEMfNcau8oFU4AUIwS8t58GXS5IVlk6JSR
	aDcDZeCMUjxp1XFLKMmeN9xBYGS6ipA=
X-Google-Smtp-Source: APXvYqyNpjuzJE+fEuKlKwb+ea86Dmy0kPp38zFrGAwlgCPcZ4lnrS33Fc0f+UUIreV2j03T1A2fCw==
X-Received: by 2002:a63:4e57:: with SMTP id o23mr3127882pgl.368.1554343650702; 
	Wed, 03 Apr 2019 19:07:30 -0700 (PDT)
Received: from [10.240.241.171] ([116.212.180.67])
	by smtp.gmail.com with ESMTPSA id
	j16sm23065632pfi.58.2019.04.03.19.07.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 19:07:29 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190403170443.10657-1-richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <56a8da36-21cb-4340-df89-1c96f0b40052@gmail.com>
Date: Wed, 3 Apr 2019 19:07:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190403170443.10657-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] core-image-sato-sdk-ptest: Fix free space issues causing test failures
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
X-List-Received-Date: Thu, 04 Apr 2019 02:07:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/3/19 10:04 AM, Richard Purdie wrote:
> Some tests such as strace-ptest require more than the current 500MB of free
> space. Increase the amount available, staying under the 4GB limit. We have more
> flexibility now since we shrank kernel-devsrc and the comments are out of date
> due to that.
Won't this be more of a common issue for any image that pulls in the
same stuff is is not named sato?

- armin
> This should improve the strace-ptest results and the util-linux ones since
> those sort after strace and also hit the space issues as strace-ptest didn't
> clean up after itself when failing.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> index 7e3152b4a11..1027ec03be0 100644
> --- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> +++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> @@ -4,11 +4,12 @@ DESCRIPTION += "Also includes ptest packages."
>  
>  IMAGE_FEATURES += "ptest-pkgs"
>  
> -# This image is sufficiently large (~3GB) that it can't actually fit in a live
> +# This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
>  # image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
> -# box) and explicitly add just 500MB.
> +# box) and explicitly add just 1500MB.
> +# strace-ptest in particular needs more than 500MB
>  IMAGE_OVERHEAD_FACTOR = "1.0"
> -IMAGE_ROOTFS_EXTRA_SPACE = "524288"
> +IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
>  
>  # ptests need more memory than standard to avoid the OOM killer
>  QB_MEM = "-m 1024"


