Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0F9D96B3F6
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 21:36:38 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id c13so2086508vea.10
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 14:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=D5ARHdeAX/AodPrNNGoyUCjM5I4YEwVrFi8dZ3o0GWE=;
	b=RMyc7QY/okQJqwyEalK/w1qMUBdDbmswY269NjO65RkM1YtvHZsaQtxEbUFjy0i09L
	lZFkv892qO9jQa189oP7xGsCJkVeS6UI9/yJ/xvY6dRj/VQ7XUtgz2TlAVel8V5uQtJ2
	HNhzJW+CnQJtfhW+Og3+rXdUa1Jg8JmEiGOPZM9fm2Ai3i8KHCLa9Fu6Wun2OuI23rzN
	/2cFxW6QMH2Zg/HdXeVi8BvaJz4/DSaTSqgYKtGFGUs1ND6d5LixETXZfZ93s2yFoCT6
	JqaZFWMc53SmpYjMD4IH5HlWGEU0W7MEKebmZ1kfD/ApkIL199fs4gbFljaakKZmmpxa
	h9Sg==
X-Gm-Message-State: ALoCoQlB/MhA/cChJquU1k7+PgaHItPssWn3/AyTy7zLbaQvPtQy0krdh14+VLPZkxYOsdWdMAyY
X-Received: by 10.52.229.73 with SMTP id so9mr3310427vdc.27.1377207399350;
	Thu, 22 Aug 2013 14:36:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 22 Aug 2013 14:36:19 -0700 (PDT)
In-Reply-To: <739A9EF8-4ABD-419C-978B-29006E185238@gmail.com>
References: <739A9EF8-4ABD-419C-978B-29006E185238@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Aug 2013 22:36:19 +0100
Message-ID: <CAJTo0LZ-NCuuE0hQYpgzx0GXhikAUVzRrVaDFayg-OLnt1o7TA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: World build on OE-Core
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
X-List-Received-Date: Thu, 22 Aug 2013 21:36:40 -0000
Content-Type: text/plain; charset=UTF-8

On 22 August 2013 22:24, Khem Raj <raj.khem@gmail.com> wrote:
> x86_64
> ======
>
> Summary: 17 tasks failed:
>   /builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb, do_compile
>   /builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.14.bb, do_compile
>   /builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_compile
...

The majority of your failures on x86-64 get autobuilt every night, so
I'd be curious to see the your logs if you still have them.

Ross

