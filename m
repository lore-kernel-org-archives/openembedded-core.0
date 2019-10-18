Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 95B2C7D58A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 21:28:08 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a6so7501916wma.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 14:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4ZJcXZyGZWEtQoUwWgNVQ1CgbsOhRBRIYInomvA3/ZQ=;
	b=fnNFUJga7w9ncVK1DXu7mreu1t1RyAbdLF07mjtkA9zK6Yi422qpT7cVbC7GtgS+xb
	MRRIPbmmrA+Tao4pauX0O09bc97yoiaRYgzuDsb9DcncVYjO/jvEz4exAGG2MMsGyfU6
	Wd56J8H75FzIudYVjBOOBUTFmmExVQ9CQf98E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4ZJcXZyGZWEtQoUwWgNVQ1CgbsOhRBRIYInomvA3/ZQ=;
	b=mrYEWyPs/a9g2maalq+PKE/NHMU89Qjkj4iKnifRk2gnlqypqeiDnvg6J2ZtsFIKBd
	DD2mtx3wdw8gjmxXmopeIrsCrupIXfZepYPMXxwwnBbOjU6qFeNKBqcY8UCtuV2nA9Kw
	ePtlWTOSq+5OxU3nFsQvNXJixSpduy3dRhk/oqgI/eOpPE44GJlYlrDvRY630Gih/ln4
	lcwGN1hiKi4Ee3KX7n5H+9C/MFi8EtMGECbtPtEaPDgIRlY+diE/4+VENC7+z7yHd4Oj
	ICcm565E9PLdO22hxWUii73RlmhGdEn0BCrGzNbOjD22IJZrcn9hH//pPax+Y3cuGUb7
	y36g==
X-Gm-Message-State: APjAAAVwcyHUJDeZNZjx948gb/zDyb8pR2TcDh5xnqS+GzZm1FsUKEiO
	skfHUyBCCsclv+zzy4+3O5YbEw==
X-Google-Smtp-Source: APXvYqwvkRPvmq8EgJCvHFeofxzrZT5mdX6QAYTEn67kPTlHV4OQ9UAiIId+LnPMHCJfqiB7/9qrxg==
X-Received: by 2002:a1c:5458:: with SMTP id p24mr8810286wmi.32.1571434089194; 
	Fri, 18 Oct 2019 14:28:09 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 15sm200557wmx.31.2019.10.18.14.28.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 18 Oct 2019 14:28:08 -0700 (PDT)
Message-ID: <1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@intel.com>
Date: Fri, 18 Oct 2019 22:28:07 +0100
In-Reply-To: <CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
References: <20191018112819.16210-1-ross.burton@intel.com>
	<CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] file: explicitly disable seccomp
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
X-List-Received-Date: Fri, 18 Oct 2019 21:28:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-10-18 at 18:03 +0530, Khem Raj wrote:
> 
> 
> On Fri, Oct 18, 2019 at 4:58 PM Ross Burton <ross.burton@intel.com>
> wrote:
> > file will automatically enable seccomp if the seccomp headers are
> > available, but
> > the build will fail on Opensuse Tumbleweed because the include
> > paths are wrong.
> > 
> > Enabling seccomp is a bad idea because it interacts badly with
> > pseudo (causing
> > build failures), so explicitly and globally disable seccomp.
> > 
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-devtools/file/file_5.37.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/file/file_5.37.bb
> > b/meta/recipes-devtools/file/file_5.37.bb
> > index a840dbc012b..c53a120b840 100644
> > --- a/meta/recipes-devtools/file/file_5.37.bb
> > +++ b/meta/recipes-devtools/file/file_5.37.bb
> > @@ -21,6 +21,8 @@ S = "${WORKDIR}/git"
> > 
> >  inherit autotools update-alternatives
> > 
> > +EXTRA_OECONF += "--disable-libseccomp"
> > +
> 
> On host it makes sense but how about for target recipe ? We do have
> libseccomp support 
> Perhaps it’s best to disable it for native and native sdk alone ?

Given the problem reports in the media and the decisions made by most
other distros I think disabling this is probably safest until its been
make more usable (no other distro is shipping this enabled now).

Cheers,

Richard






