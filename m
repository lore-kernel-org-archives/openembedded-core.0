Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5B98A7C4F9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 20:22:04 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y3so12504991wmm.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 13:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=6N7xSIM+ifcJvJGF4O6eXqCh4gkeDenkOlkDxVwTpdo=;
	b=RV2Hgd6djvX0f5KfzQDrhmsk0S8jyi+vc+yji77kOX/VgFSA4vqzSg0/q+wGKkrp5N
	GLjLFSkwADwIWPDYu3yV0KgdJ9+ZBMaX/wd6YrT7/YIvKdRQg9Edv3loc2BjJJZimpjH
	uFVtJQyUij0oTKiXqwNzXaCTMzVB+Jtah2xxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=6N7xSIM+ifcJvJGF4O6eXqCh4gkeDenkOlkDxVwTpdo=;
	b=VZrK5i9QZQChRqrKx0KPreyRoMBK7qImlUEe2O7b2AwMe5JAfTbBgCZkM2VuUC6ttL
	QbqF8JiN6HXLz1i4tTPHdIwESXHLpx95aWCs1CTY8n48mpQ3+B7TUGQzYp8kS5qTQ5ZA
	QVfIq6+JDSoVWMt0WCJp6WUkEYiDY/tDiUZsw1R89uQ5g7SwKSROAnukGZBWMxYvT8TB
	k0Sx0nkIA14bufeWxNZP0ORzfgDK1OupkaBqAJDNl/D9Lhj+zPvW7uo4ILEZJAtN96V+
	Ao8e36wutWNMlH3M70GxPfsJg9wBKc3bZN1rYQRto/92VI62Zm1/MBLUGd+w79jzYE3n
	NNoA==
X-Gm-Message-State: APjAAAXvbV4ZGWgPd5FtEq22om57yiMFHHjz0L14uRSfI8c3uVcfGlmS
	CiIfF+rEjAmr425bE/PHCWLt9ufdMS8=
X-Google-Smtp-Source: APXvYqz3bJIcNPodkGQMSmIVBekbnGFF0wszbrvR8VmlKFUhJvv+LUdA75AEc0b4SNRqGOb+PyHxxw==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr715746wmh.150.1558815724954; 
	Sat, 25 May 2019 13:22:04 -0700 (PDT)
Received: from hex ([85.255.236.98]) by smtp.gmail.com with ESMTPSA id
	i10sm4492933wrw.88.2019.05.25.13.22.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 13:22:04 -0700 (PDT)
Message-ID: <e87bc770766533097f5061674ef94fafaed51c29.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 25 May 2019 21:22:02 +0100
In-Reply-To: <20190522222132.25731-2-jonathan.rajotte-julien@efficios.com>
References: <20190522222132.25731-1-jonathan.rajotte-julien@efficios.com>
	<20190522222132.25731-2-jonathan.rajotte-julien@efficios.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] lttng-tools: add lttng-modules to ptest dependencies
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
X-List-Received-Date: Sat, 25 May 2019 20:22:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-22 at 22:21 +0000, Jonathan Rajotte wrote:
> The lttng-tools project is essentially a "tracer" controller, the tests
> depends heavily on lttng-ust and lttng-modules presence.
> 
> Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> ---
>  meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> index f1bb7224f3..7e80bb45d1 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
>  
>  DEPENDS = "liburcu popt libxml2 util-linux"
>  RDEPENDS_${PN} = "libgcc"
> -RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps perl-module-overloading coreutils util-linux kmod"
> +RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules"
>  RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
>  RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"
>  # babelstats.pl wants getopt-long

Thanks for these patches, this will help a lot.

This patch threw up some issues in testing since kernel modules are
machine specific and this then means lttng-tools should become machine
specfic too (which is a bad idea and not necessary).

I've sent out an additional patch which resolved that, not as neatly as
I'd like as I had to special case lttng-modules in the mutilib code.

It gets this merged though as I'd like to stop seeing those timeouts
once and for all!

Cheers,

Richard


