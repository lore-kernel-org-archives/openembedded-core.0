Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE707D20A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 02:34:44 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id k14so13557592qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 19:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qEuXSCUdSkyaDVl9NAL1VYPgiBiZx/KFd/uN7ho/T64=;
	b=F4uZATTw1kRjPOKUKUwN7qaTmrWgWZVxQKcFb4c3KYgklguIc7ikEPV8uwRic1LX6j
	S/D3uMBxYcd1Fdylg5JIY91F13q24dMuMuw2yFnj5YgZGZfXIvQU7fzgsBf3kxN9RIU1
	RK2KCUdbe10p/ztl0JcbhcjfAmnwFaG5VOGxVaYB0qdXLqfXbH2JeQW8N/mvy6e7PtO9
	MGVWNDkm+A4AoG07PZyajjcLJqpBWpdz9SmvR7ViZPyeaaGeSkonk+Umg31zZtuTEiMB
	yXPeoSm8r7rJD/Tm+DOxeJM2VU/0mvZ/8PZw4sZsAZsxSHHzsn+CkLD9/q1DUuaa1agf
	qDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qEuXSCUdSkyaDVl9NAL1VYPgiBiZx/KFd/uN7ho/T64=;
	b=LHckplvuAqqSMkbDoBZmbjdANVyt54jhdIErQXOuBbncvZ4YHgoJLNOC/aOTMVmBez
	vZMfkKJkxKKkCTqiIFrM1kccBlxj6Q5UUEPDVtvBg+31kMNlr6kP0WSaS5gYj6dvANqh
	PA6xSSxTo/wE70qi9QtBDurPKRgYe4uajnm04LO1l2EXijyp/HwWx/on4toGm1i4d3og
	Msb0zpPsZD7G4TmhJop1Vj0npePvVwxiCYE0NDOQOw6ZEfhqU3z2RC7Chly6cLt4KJCV
	YtI5EtX0a80pkZbU0l2Du6fi1cX6Jz53pmd9EsTJD62zDZgWPn5zjMLufh86eedOY6P+
	SvIA==
X-Gm-Message-State: APjAAAVSVSaPMt6ytkB+GXto2SYF+zWIp68C42qI90NqyGyFf1CKGNUe
	24OsCK0BIK3pkirEz0ljECL9a+lrPqz+RdqKvv4=
X-Google-Smtp-Source: APXvYqykDm0ofen3brOETF8RbcL/Z1LFhSao8NVwOENC69iHGd1BDEVNUB+omrW1QQ7hLXLXbw01O1aZ6a38jk7r/T4=
X-Received: by 2002:ac8:501:: with SMTP id u1mr56812992qtg.198.1554172485829; 
	Mon, 01 Apr 2019 19:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190327142005.17453-1-ross.burton@intel.com>
	<CAMKF1sosOJ6_Dk-CAiyz38iyBpV3ty4df5Ya5e4m=ccGxLyRSQ@mail.gmail.com>
	<CAJTo0Lam4oEvd6rPYvvu=AckU7irH=4tEqGhfOVEMo9j7AkcjQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lam4oEvd6rPYvvu=AckU7irH=4tEqGhfOVEMo9j7AkcjQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Apr 2019 19:34:19 -0700
Message-ID: <CAMKF1srHw-SfA_TwxP-qB_Yi3y07rsjzk1MxFxoHa7ZfsGicPA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] asciidoc: use Python 3 port
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
X-List-Received-Date: Tue, 02 Apr 2019 02:34:45 -0000
Content-Type: text/plain; charset="UTF-8"

I find many posts reporting similar issue also I see it happen on
ubuntu 18.04 host as well

https://groups.google.com/forum/#!topic/asciidoc/FC-eOwU8rYg
https://groups.google.com/forum/#!topic/asciidoc/N4boYdQ3Zik

On Mon, Apr 1, 2019 at 7:01 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Error 4 is 'validation error', can you recover the file that is failing?
>
> Ross
>
> On Sat, 30 Mar 2019 at 02:01, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Mar 27, 2019 at 7:20 AM Ross Burton <ross.burton@intel.com> wrote:
> > >
> > > There's a sort-of-official port of asciidoc to Python 3.  Whilst the official
> > > replacement is asciidoctor which is rewritten in Ruby, this is a fairly trivial
> > > swap and removes Python 2 from core-image-sato builds entirely.
> > >
> > > Moving forward we should evaluate asciidoctor, but that can wait.
> > >
> > > Change the RDEPENDS so that python3 is only a dependency for target and
> > > nativesdk builds, for native this can use the host python3.
> > >
> > > Remove redundant DESTDIR export that isn't needed.
> > >
> >
> > its failing on my archlinux builder, ideas ?
> >
> > https://errors.yoctoproject.org/Errors/Details/234833/
> > https://errors.yoctoproject.org/Errors/Details/234829/
> >
> > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > ---
> > >  meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 21 ++++++++++++---------
> > >  1 file changed, 12 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> > > index 38164d55735..d0d15171ac4 100644
> > > --- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> > > +++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> > > @@ -8,17 +8,20 @@ LICENSE = "GPLv2"
> > >  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> > >                      file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
> > >
> > > -SRC_URI = "http://downloads.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz"
> > > -SRC_URI[md5sum] = "c59018f105be8d022714b826b0be130a"
> > > -SRC_URI[sha256sum] = "78db9d0567c8ab6570a6eff7ffdf84eadd91f2dfc0a92a2d0105d323cab4e1f0"
> > > +SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https"
> > > +SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
> > > +PV .= "+py3-git${SRCPV}"
> > >
> > > -UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/asciidoc/files/"
> > > +DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native"
> > >
> > > +S = "${WORKDIR}/git"
> > > +
> > > +# Not using automake
> > >  inherit autotools-brokensep
> > > +CLEANBROKEN = "1"
> > >
> > > -export DESTDIR = "${D}"
> > > -DEPENDS_class-native = "docbook-xml-dtd4-native"
> > > -RDEPENDS_${PN} += "python"
> > > -BBCLASSEXTEND = "native"
> > > +# target and nativesdk needs python3, but for native we can use the host.
> > > +RDEPENDS_${PN} += "python3"
> > > +RDEPENDS_remove_class-native = "python3"
> > >
> > > -CLEANBROKEN = "1"
> > > +BBCLASSEXTEND = "native nativesdk"
> > > --
> > > 2.11.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

