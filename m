Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 135FE6AB99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 08:01:11 +0000 (UTC)
Received: by wicmc15 with SMTP id mc15so82731073wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 01:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=q/6tuL2FRjbSgU6x6Ljc8zATfjVWqptUZZRLH22d0lE=;
	b=Y6jejK8Wsz0lttbtg9TkGxQq0NvjovuuFHO5UWA9UCWRDjiTT3VAqdsDWafrhXNtFr
	pRUKcOfE8hUtKp1m2nXcrSujNSpyMBaubmAWjoS/LUPrqkFUlx/y3brWGZ5kuxH50LIK
	fPZziAfNIza5fSSkiuIqpGhNv6NEpbOtlVG++wHDAgyy5IyNDsydKYs4q+sN1NxVF7OB
	TV+SinDdw258Pmak8uSXyPWxHmguIFoFiV3WBUHeiP6hvxkhaMnXQbPrzWKytwvSnMdF
	BVUCy7iAl0WuqgWVWr57YL/9SiBuWOAj8Y9pUWWcKD0F+fpW1cadigiUo9c7F4vw9wQb
	Pt3Q==
X-Received: by 10.180.188.100 with SMTP id fz4mr17606601wic.91.1431936072452; 
	Mon, 18 May 2015 01:01:12 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id js3sm15602675wjc.5.2015.05.18.01.01.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 May 2015 01:01:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 18 May 2015 10:01:38 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20150518080138.GD9407@jama>
References: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: trouble related to oe-core update
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
X-List-Received-Date: Mon, 18 May 2015 08:01:12 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2015 at 09:46:03AM +0200, Andreas M=FCller wrote:
> Hi,

Hi,

> have seen that a while ago but had no time to take care.
>=20
> Since oe-core commit
>=20
> commit 3e760031f91fb87c3e2f62b77a117eb41164f259
> Author: Martin Jansa <martin.jansa@gmail.com>
> Date:   Wed Feb 18 15:40:35 2015 +0100
>=20
>     feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb =
suffix
>=20
> I get
>=20
> ERROR:  OE-core's config sanity checker detected a potential misconfigura=
tion.
>     Either fix the cause of this error or at your own risk disable the
> checker (see sanity.conf).
>     Following is the list of potential problems / advisories:
>=20
>     Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
> (cortexa9t2hf-vfp-neon).
>=20
> I don't understand this fully but it seems that
> fsl-dynamic-packagearch.bbclass would add this pkg arch but this never
> happens because sanity.bbclass is executed first and interrupts
> parsing. What I don't understand: Am I the only one having this issue
>o
I'm not using meta-fsl*, butdo you have this patch in your setup?
http://patches.openembedded.org/patch/90989/
it was discussed off-list a while ago and this change looks like result
of that discussion.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

