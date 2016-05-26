Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE276010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 11:27:31 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n129so4002146wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 04:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5cM0kQntIdj6hYfmbvdDPAfEP2BfbjNGtq0vfeGgBxo=;
	b=fvplJsXhe9HXE0vymKcEjivnqlTVeXIqEYQUBsB7M9z15zZ0S82thkfmxMyZI/3tpR
	yteXr7Ta81OpK2AosTV0LJKRZqcl8VwzCktv3nUJCgwFn3aB+a8MCTDKzhQkC3K0PCv8
	WZThV53d+c0GpqGBwzQbHIyUrQc631i3Wj2tXXxlHvBObNJaSxYg8wHV0qhBJX3ewpso
	JM4m5Wc3+tH5nGeCA/ki0lLQ0Q9AN/u3f5zRKqT1u8yBa6ihLqBnI4IxhD7JpCKfB8dk
	odTFKL7y4uaeuYIMdNwj2ThH8EgaPB7zgQfhOxtJLB62uuxS3kmfOV2/j9MKv1C0JIPQ
	TN3A==
X-Gm-Message-State: ALyK8tKqnW5CFpvkoZdqttzST5Y9/mtCkl0CWQApTLmT48K/bNOQ2qXeJ/JvTjS90Rz+Ew==
X-Received: by 10.194.10.162 with SMTP id j2mr8827268wjb.72.1464262052213;
	Thu, 26 May 2016 04:27:32 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	bu7sm13866552wjc.3.2016.05.26.04.27.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2016 04:27:31 -0700 (PDT)
Message-ID: <1464262049.28160.5.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Armin Kuster <akuster808@gmail.com>, akuster@mvista.com, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 12:27:29 +0100
In-Reply-To: <cover.1464025858.git.akuster808@gmail.com>
References: <cover.1464025858.git.akuster808@gmail.com>
X-Mailer: Evolution 3.20.2-2 
Mime-Version: 1.0
Subject: Re: [PATCH 00/72] Krogoth-next V2, pull request
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
X-List-Received-Date: Thu, 26 May 2016 11:27:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Armin,

On Mo, 2016-05-23 at 21:55 -0700, Armin Kuster wrote:
> Rebased, removed per feedback and add a few new ones.
> 
> Please consider this for krogoth-next.
> 
> The following changes since commit
> da4bfbef46e52d2b647a837a47d0f5cb813ba8b2:
> 
>   gdb: Backport patch to changes with AVX and MPX (2016-05-22 08:43:01
> +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akuster/krogoth-next
>   http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/krogoth-next
> 
> [...]
> 
> André Draszik (2):
>   gdb: fix QA warning (uClibc)
>   feature-arm-neon.inc: restore vfpv3-d16 support

Please also add commit
cf82db2ba732031f392760e4f363e8b608e6fae3 'feature-arm-vfp.inc: fix
overzealous ARMPKGSFX_FPU modification' to as otherwise various other arms
don't build.


Cheers,
Andre'

