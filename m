Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 072EA7E6EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 20:53:03 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id h21so20027435qtn.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T6MzDs2Khq81xkxyqMUMdm7zhQ1Q7zwXHuPqPt1JPkE=;
	b=Sw3EcMg0qmSl6FjVTQZ+s+vrlsi1DdXjrI2+WdBfY8UQCypZ1pDs+dvT016QtoQV5K
	44+iTgNJKOmCuL74cRgfesyx75q8dWkpSGGfE3hg3aw3Ix6LPR0onscWw5i9beq8y92A
	+UudVMBRY56IHbeDlNFNELlaRzXLHg9ZRhNLzRZ6LjYiDocZMGxfV8EbzfMYYRJMkuX+
	ElvHj0/5iwCmAC3Ec8PxQfoXNXnfqLGfvE7R1/Xq3sHrEQplUgC66JlmOCyzU17TL4T+
	8sSB8qhFMm2OZXvY7v9u9V/OvmR8VgS8ArkSyIO1v7lU3BMDaOm6O7ys1/wKEVEnW26+
	y6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T6MzDs2Khq81xkxyqMUMdm7zhQ1Q7zwXHuPqPt1JPkE=;
	b=XF+6XWMy2U8GwjmtM+x5OrbcRrT1cJ6JbULV/Ebdg2BxsSEjiPAOlH/Ie70ZqMFRR1
	JMKnEElfs8qxJo8qPjY6zfbFV6veKpaviAubBGrY9spzRX90TtzBVKLUbCTV5qyZfrPl
	ThLOkhnIaKoQp+qvGPuFyvEbtaLqpkCoj5vGUekrDm/gU4gbOKLcU5OGjGq1+l8mw3CC
	YCm035oNkcYVS3MJdJ6jkWvwNra36vXtQQDKQBQd6KOdpWPWT5yzt2pJcVnS7zglS3Ug
	6HHPFkxmQu2q/nYO3AdPGD+S67rRey6eRGEgyR6uX8l+urSoJr15qaNraVBpaXSO3eCd
	PKFQ==
X-Gm-Message-State: APjAAAXMS/Rjm/3y+vKf2D+V3hQ5rsAE2Bac1h3dFl/QP7xz/TEfPUUE
	zeP7yuuuoJoIxEqIiJ7iYcufHXskx8dQxnkFFoE=
X-Google-Smtp-Source: APXvYqyhgcQ6vFfW+JIVXK3C+yPiXRrY9nEKIByUCyUvVWNQZBCG/hjVZcrlsJ0bzq4uSUEy6uojxOr368VQwaPLMf0=
X-Received: by 2002:ac8:e05:: with SMTP id a5mr37485976qti.53.1560372784631;
	Wed, 12 Jun 2019 13:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<7c1f46d8510f95fe7a35127196bd496935efe384.1559950879.git.timothy.t.orling@linux.intel.com>
	<566287162a0ddfec6fa1935244b9fff9d530039a.camel@intel.com>
In-Reply-To: <566287162a0ddfec6fa1935244b9fff9d530039a.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Jun 2019 13:52:38 -0700
Message-ID: <CAMKF1sruYUAYqcvRe34m+AdK89cC0azzxtaQjTpd31X+5jFHmA@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] serf: switch to python3-scons-native
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
X-List-Received-Date: Wed, 12 Jun 2019 20:53:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 9, 2019 at 10:10 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> This is causing on CentOS 7:
>
> | DEBUG: Executing shell function do_compile
> | scons: *** SCons version 3.0.5 does not run under Python version
> 3.4.8.
> | Python 2.7 or >= 3.5 is required.
>
> Looks like it's using host python which is at 3.4.8 in this case.
>

same error on ubuntu 14.04 on both serf and serf-native
https://errors.yoctoproject.org/Errors/Details/248342/
https://errors.yoctoproject.org/Errors/Details/248341/

> Thanks,
>
> Anuj
>
> On Fri, 2019-06-07 at 16:47 -0700, Tim Orling wrote:
> > SCons has supported python3 since v3.0.0, use it.
> >
> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> > ---
> >  meta/recipes-support/serf/serf_1.3.9.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-
> > support/serf/serf_1.3.9.bb
> > index 65a8114bb4..706c86be47 100644
> > --- a/meta/recipes-support/serf/serf_1.3.9.bb
> > +++ b/meta/recipes-support/serf/serf_1.3.9.bb
> > @@ -14,7 +14,7 @@ SRC_URI[sha256sum] =
> > "549c2d21c577a8a9c0450facb5cca809f26591f048e466552240947bdf
> >  LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> >
> > -DEPENDS = "python-scons-native openssl apr apr-util util-linux
> > expat"
> > +DEPENDS = "python3-scons-native openssl apr apr-util util-linux
> > expat"
> >
> >  do_compile() {
> >       ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE}
> > PREFIX=${prefix} \
> > --
> > 2.20.1
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

