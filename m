Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 96FF26C14C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 16:57:41 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c207so12380622pfc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 09:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=8JE6t0qVeTLni21idbpge6E7/pien9Sb1VCRf6AYi9k=;
	b=c1TjGisMpz22HmNCu2D3LKvEJnmPqSGEEerk9e41cWQwa7jQztgiFZu+dWtT6CN/lX
	4+P1V7SJznjR6FCwJOw8T9g/RNXWOQkNSTPhM8UB6gzpIsvRC0kxwfp6tSZ+7c18gcUo
	19wKn3389SpeDQfvwQ6ACwvb2nKqCrpNy79tn/XET0H6Y6RR6o9rCDLBjVLmjj9dybG/
	WARSPE9F8VJarz0JUwsBSqzNtOSWZ9/alzk6ZFLHdMKoyEhG1SJ4NVqJetq9hwDn1IVX
	jzPLooTw3wgjZ8labUiFnOPmu52cbeEUgD6qJ2Hx3DE5KczlOGyQrMepxHDqnk15g91z
	NyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=8JE6t0qVeTLni21idbpge6E7/pien9Sb1VCRf6AYi9k=;
	b=f0jiaof4/46hq4TJnhpwrA8co+8Dw1tB87sNtoGU5i5PKCUxAdyrkYawBQ70QwuokU
	KFfmuFyG6E6S5poxxTRJCBpm99S7CP6XD/95a8CymEnTx/+EK1W+XT0diM388cJ3iZ/R
	a7Bg2VfSFWwgT2Eijyc87FMGYB1PYe5yAvZ7lJzK8hs1C4xZofvO02ZaIekroY9mjyK2
	x00i3MJSyn8PhOWi56LQ1nVHT/c8syixXmV6DTJXzoxbU0ih2cX2r/GqJGdrRY1ZsSpG
	zq0fwvoFkwIPn++JYwpVkEnyaQBG43dsQcgmYOBd8qPoOMSTxfKdLXuESvMfEguXhjwj
	bFiA==
X-Gm-Message-State: APjAAAUkRFLOekrbUniwJlG7BpBo2fPzHtjE7Jx6hFoDfh4P3C0Sd/oG
	/y5S3X4E6Y+j4i6SBxFMMPdBZxYw
X-Google-Smtp-Source: APXvYqxWHw9ZxEiY9HUrZxAuUwYOHZMuTkN6aa3RkbMqCGVqldUiElcWP0yzIG9dO0em2LyS+Ky0Qw==
X-Received: by 2002:a62:15cf:: with SMTP id 198mr845148pfv.243.1555520262443; 
	Wed, 17 Apr 2019 09:57:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:cc23:8bc8:1820:5475?
	([2601:202:4180:c33:cc23:8bc8:1820:5475])
	by smtp.gmail.com with ESMTPSA id
	i15sm78873912pfd.162.2019.04.17.09.57.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Apr 2019 09:57:41 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190417155947.24890-1-richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d12938fb-ffbd-05e5-c518-96cf7222d9f8@gmail.com>
Date: Wed, 17 Apr 2019 09:57:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417155947.24890-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/3] core-image-sato-ptest-fast: Add 'fast' ptest execution image
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
X-List-Received-Date: Wed, 17 Apr 2019 16:57:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/17/19 8:59 AM, Richard Purdie wrote:
> Create a common include file which lists recipes that have ptests divided
> into 'fast' and 'slow' groups. This allows us to include ptests which otherwise
> may not get included in images and allows us to test the faster running things
> more regularly.
>
> The new image allows access to these faster executing tests. 'fast' is defined
> as tests which execute in under 30s roughly speaking.
Maybe at some point allow recipes to define their own groupings. It
would lend itself to scaling better.

Can we define the system at ~30 seconds? All these may be fast on a 196
core system where as on my laptop all would be slow ; )

- armin
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../distro/include/ptest-packagelists.inc     | 75 +++++++++++++++++++
>  .../images/core-image-sato-ptest-fast.bb      | 16 ++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 meta/conf/distro/include/ptest-packagelists.inc
>  create mode 100644 meta/recipes-sato/images/core-image-sato-ptest-fast.bb
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> new file mode 100644
> index 00000000000..768ba743ed0
> --- /dev/null
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -0,0 +1,75 @@
> +#
> +# Lists of the ptests in OE-Core, sorted into two sets by the time they take
> +#
> +# ptests which take less than ~30s each
> +#
> +PTESTS_FAST = "\
> +    acl-ptest \
> +    apr-ptest \
> +    apr-util-ptest \
> +    attr-ptest \
> +    bluez5-ptest \
> +    bzip2-ptest \
> +    dbus-test-ptest \
> +    diffstat-ptest \
> +    diffutils-ptest \
> +    elfutils-ptest \
> +    ethtool-ptest \
> +    flex-ptest \
> +    gawk-ptest \
> +    gdbm-ptest \
> +    gdk-pixbuf-ptest \
> +    gzip-ptest \
> +    json-glib-ptest \
> +    kbd-ptest \
> +    libconvert-asn1-perl-ptest \
> +    liberror-perl-ptest \
> +    libpcre-ptest \
> +    libtimedate-perl-ptest \
> +    libtest-needs-perl-ptest \
> +    liburi-perl-ptest \
> +    libusb1-ptest \
> +    libxml-namespacesupport-perl-ptest \
> +    libxml-perl-ptest \
> +    libxml-parser-perl-ptest \
> +    libxml-sax-perl-ptest \
> +    libxml-sax-base-perl-ptest \
> +    libxml-simple-perl-ptest \
> +    libxml2-ptest \
> +    lzo-ptest \
> +    nettle-ptest \
> +    openssl-ptest \
> +    opkg-ptest \
> +    pango-ptest \
> +    parted-ptest \
> +    quilt-ptest \
> +    sed-ptest \
> +    slang-ptest \
> +    zlib-ptest \
> +"
> +
> +#PTESTS_PROBLEMS = "\
> +#    qemu-ptest \ # Doesn't run any tests?
> +#    ruby-ptest \ # Timeout
> +#    mdadm-ptest \ # Timeout
> +#    clutter-1.0-ptest \ # Doesn't build due to depends on cogl-1.0
> +#"
> +
> +PTESTS_SLOW = "\
> +    bash-ptest \
> +    busybox-ptest \
> +    e2fsprogs-ptest \
> +    glib-2.0-ptest \
> +    gstreamer1.0-ptest \
> +    libevent-ptest \
> +    lttng-tools-ptest \
> +    openssh-ptest \
> +    openssl-ptest \
> +    perl-ptest \
> +    python-ptest \
> +    python3-ptest \
> +    strace-ptest \
> +    tcl-ptest \
> +    util-linux-ptest \
> +    valgrind-ptest \
> +"
> diff --git a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
> new file mode 100644
> index 00000000000..b794a7dc9e9
> --- /dev/null
> +++ b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
> @@ -0,0 +1,16 @@
> +require core-image-sato-sdk.bb
> +require conf/distro/include/ptest-packagelists.inc
> +
> +IMAGE_INSTALL += "${PTESTS_FAST}"
> +
> +DESCRIPTION += "Also includes ptest packages with fast execution times to allow for more automated QA."
> +
> +# This image is sufficiently large (~1.8GB) that it can't actually fit in a live
> +# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
> +# box) and explicitly add just 1500MB.
> +# strace-ptest in particular needs more than 500MB
> +IMAGE_OVERHEAD_FACTOR = "1.0"
> +IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
> +
> +# ptests need more memory than standard to avoid the OOM killer
> +QB_MEM = "-m 1024"


