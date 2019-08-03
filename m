Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF707CE4E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 10:53:41 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v19so68716877wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 03:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=nGe+ckgsU4F7Nq8zYgzbJxQS5KKZ2BmRBBcLtFZOqVg=;
	b=NU67RlvmzVGuop5+iUgEXKGJ4GZWOr0rTpivOLPcwFv77KhVoo340c6M6k+74FMoVJ
	z+fNYerUHl++xQ5Vqrh/6RxYBEEGH/so66kJjDMm/XolKgnPmRmi63rdTbDNG7gvvrc3
	c//T1cybsa+1TJL2Mp6Gn6yyMFdPu85OgEFOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nGe+ckgsU4F7Nq8zYgzbJxQS5KKZ2BmRBBcLtFZOqVg=;
	b=TOWhZOAppvRrfdMKliW++G3avqoIhpQto4T4k5A1XFWQg4NXjBGJYK3IznxdSJtKZY
	eM83PCjik4xRuhdTrkMDlWzuVsqv5dJLeE8qP64yxJZqHJYKJ6A3DSyVR2NX10ppC20m
	jv6N7dsQdOPyUHUh/utAdbQ1I52VzxzJB+j+Gwo0u3Hm+JUL+KOcHSxGru839jodFSfp
	Wh4T8mw1UWJhD4EzX+lAXxipG8HWDoF7AWqvTKvKaK2dFLQAg25wqOmO0IraFHVjZ4WJ
	gFyvY6ocMaun/YdNwMbiatu/hSE8a3DZW29A/tR4vKZMVoiUM1dMFKdWavdS5qPE4MV0
	0RRw==
X-Gm-Message-State: APjAAAVtL7ymoHAQRBww6t3Y8zLwDb4n8n0bceI7q1kSNXJ7MB+teRLQ
	TRs3WP05i14AaZpRcYYrZ5KIxw==
X-Google-Smtp-Source: APXvYqwEoCSj/z+wpbZxSRN5eht3vlenHrXy0qclr8efc1hQur7I8yglcFUY7jHi4Er0Ok0VHOcUug==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr8630727wmj.109.1564829622738; 
	Sat, 03 Aug 2019 03:53:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g17sm61026865wrm.7.2019.08.03.03.53.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 03 Aug 2019 03:53:42 -0700 (PDT)
Message-ID: <232eed90aa6b376d8505d94f0b51e9352101fea7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 03 Aug 2019 11:53:41 +0100
In-Reply-To: <20190731174820.16459-2-raj.khem@gmail.com>
References: <20190731174820.16459-1-raj.khem@gmail.com>
	<20190731174820.16459-2-raj.khem@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] llvm: Update to 8.0.1
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
X-List-Received-Date: Sat, 03 Aug 2019 10:53:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-07-31 at 10:48 -0700, Khem Raj wrote:
> Add missing dependency on libedit
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/llvm/llvm_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-
> devtools/llvm/llvm_git.bb
> index 0067635c2b..6d3d69b9fb 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -8,7 +8,7 @@ SECTION = "devel"
>  
>  LIC_FILES_CHKSUM =
> "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
>  
> -DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
> +DEPENDS = "libffi libxml2 zlib libedit ninja-native llvm-native"
>  
>  RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
>  
> @@ -19,12 +19,12 @@ PROVIDES += "llvm${PV}"
>  LLVM_RELEASE = "${PV}"
>  LLVM_DIR = "llvm${LLVM_RELEASE}"
>  
> -SRCREV = "d2298e74235598f15594fe2c99bbac870a507c59"
> +SRCREV = "19a71f6bdf2dddb10764939e7f0ec2b98dba76c9"
>  
>  BRANCH = "release/${MAJOR_VERSION}.x"
>  MAJOR_VERSION = "8"
>  MINOR_VERSION = "0"
> -PATCH_VERSION = "0"
> +PATCH_VERSION = "1"

I had to tweak MESA_LLVM_RELEASE in the mesa recipe to match this
change...

(squashed into this patch in -next)

Cheers,

Richard


