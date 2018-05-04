Return-Path: <ptsneves@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id F162D74CE8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:46:56 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o2-v6so18050958wrj.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MHcofFnLBe2s2G2hlnvk3gEIHWLaPqAHsbFnUxt2+AM=;
	b=rLNPeNxDRAKHzmjGkTYltEP4TVqiN159Oq/FZ5CPGcefOis5hHvoSYQWPlspJoxJi6
	OjZi6zvQoHrp8o7fDTCEqIMjI96DF1V8kkh4iCwIQFGEh9YdOJBbco2zmxKxqXeZYICM
	4yTjPYoQYQakjtjumJo8u3hNpQNCtNSGKaJD1rPMFcitSvvth1DoWOG6MQl2gDNNJS9D
	rWvSmwFiO5imNsQlCtD1U7VXASKh7BMqxlSt0d1loyjLOeuPq5KvsUAyeLq9Z+OACgH8
	4vs7kH8j6h/DGojCGhAReNcWW8uA3gJ17I8Jnp566wD6ZlG7VUobdpxdrAdzptGd15uK
	I8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MHcofFnLBe2s2G2hlnvk3gEIHWLaPqAHsbFnUxt2+AM=;
	b=YXGTtcfqpfxsB4KuZ2ADD7q5FJlWPt4bJzM4kWceR5MukMV7fYcAKenvKR+zKU5/IR
	QqYXVErLQe3nAgUvMxrRPx0J5p5Nj5mSU2ziwn2yf2TRAuiV+Goo1PkE5Tf7lOTeQE9B
	vYL3kU70KEn699AEydm0F6PDt36BVXL3BxLxbHwauNJx1InYCqP78Pd346luFloTcJxE
	kszZKrlBRPXLCtW2ufp84SkVICdx8wq0WaIoDgnbRUBw7XCrIDDniOMRPtCqZRLDdrqM
	/IOsbpXZSXxUoU7fgVpU7rujYEqawnoLlbZNRRP8O4BC4Lyp8IimD0/etJflQczLRWtu
	MrWw==
X-Gm-Message-State: ALQs6tAerZ9ruM6gBWApaNPs1hzXKW1h5xCWMR0r5261dmbJsAutsL9z
	MUG/ZjLpsRmVHh/cmHpjfm2ps9YZ5yz6motEFQ==
X-Google-Smtp-Source: AB8JxZqR+OfCPrt1uO7n8VYllMmRk52BhZy6QTnqoT7UFXLA+j9NlPxkw+obAvEXRxHlCxEUwkYtgvTYax0zwHZPLQo=
X-Received: by 2002:adf:972c:: with SMTP id
	r41-v6mr23220133wrb.79.1525438017385; 
	Fri, 04 May 2018 05:46:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.39.68 with HTTP; Fri, 4 May 2018 05:46:56 -0700 (PDT)
In-Reply-To: <20180504123244.43049-14-alexander.kanavin@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-14-alexander.kanavin@linux.intel.com>
From: Paulo Neves <ptsneves@gmail.com>
Date: Fri, 4 May 2018 14:46:56 +0200
Message-ID: <CAJO0J4hyjRyj+Zzz2Y7BTg0aB-dfEQXX4pJSi11n4Vc2iYkrJw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 14/14] babeltrace: switch over to git
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
X-List-Received-Date: Fri, 04 May 2018 12:46:58 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Alexander

I always wondered, what is the rationale for not always using the git
repositories? If there is one why did we change for this specific
recipe?

I ask this because I am in the process of creating a massive layer,
whose only purpose is to have the software come from the git
repository and not from the tarballs of the original poky recipes.

On Fri, May 4, 2018 at 2:32 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Tarball directory is gone.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-kernel/lttng/babeltrace_1.5.5.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> index 92d86b92e8b..5d7a7efd2f5 100644
> --- a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> @@ -10,10 +10,10 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
>
>  inherit autotools pkgconfig
>
> -SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
> +SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5 \
>  "
>
>  EXTRA_OECONF = "--disable-debug-info"
>
> -SRC_URI[md5sum] = "7decafd46093e4e47c14e7307d498986"
> -SRC_URI[sha256sum] = "409146789b4a6b81f6a275fcad932a030743d444f6de5bd4a34aaf17aa72e8ac"
> +S = "${WORKDIR}/git"
> +SRCREV = "d68a4daf85c73ab7d7070de0c98d0c170af4758e"
> --
> 2.16.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

