Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 81B3C7F44F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 14:23:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p13so7351140wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=wAFHBg/4ZFpVJtBWgL+NwWid3WFE0rMpumyDS2akX3o=;
	b=UdJ3GTEKdshy0N2xqMwqXDzREyPNSwtptY+bkKCloZpAHLFmeWZldXqmaJ8Txxi4T5
	F7JwyNZkSE55AO63YXPfofXMOvoCe4KgjHJjI2R+2wnFuMctEG0GeFgXsVWlx6yT3yor
	plL2KU+DpIzmRYV7B7btj+uqmp9nTMWfM6v9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wAFHBg/4ZFpVJtBWgL+NwWid3WFE0rMpumyDS2akX3o=;
	b=PKX+j0wXn9kPCKvrKHMV/KHn1RF5/9hqxGNnR9YQce5asyooe7O3hwWlu6SP7QvLta
	WxEC3UskVXAPjHzcAV3K2dQDRrVOwH031R277z94hld7mF2+U5Sz5kf8FHDpVgN15acD
	nSv0YTfjSYsWnVo18yrgcspYfd5cRnZ0uZe6NeFy5tUeOknbVX64ZCq0A954UzXeNaXg
	BCloQC/+sOwMC6h2unEt8zan4UDfIVmRRK4kqCCE27wGpmbHa2yq/scgQBPVaHYa6uU2
	fqdEnrJd5/xPRfHbKxc2djn9fKDFsNPAx0ehUZrXqBAtm0sGz7iyGN/CXKGGiUHFsdnp
	FbqQ==
X-Gm-Message-State: APjAAAWLDuKGn2bJXfLuLCDP+u3n5S992g6ozh0vl7sKfDp00BSuwcio
	tbqKaxHWwYwNv31GC7uhZ3ttSw==
X-Google-Smtp-Source: APXvYqz1YQKV6qDNr3mTT5RqPD6j8rLGJ+HqASZGwJYFxn2nBVdIrgTmSys7BjzCm2e4QN2Za/pQrQ==
X-Received: by 2002:a1c:a003:: with SMTP id j3mr7445452wme.42.1567779837187;
	Fri, 06 Sep 2019 07:23:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h12sm5737677wrp.51.2019.09.06.07.23.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 07:23:56 -0700 (PDT)
Message-ID: <8ac92297f48538afe156290f1e60b80abf00f1dd.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 06 Sep 2019 15:23:55 +0100
In-Reply-To: <CAMKF1so5hDAtGESfwjCNNGJtnikskPqQg2rFsTKdxYh-g9QXAQ@mail.gmail.com>
References: <20190906072347.31616-1-richard.purdie@linuxfoundation.org>
	<20190906072347.31616-2-richard.purdie@linuxfoundation.org>
	<CAMKF1so5hDAtGESfwjCNNGJtnikskPqQg2rFsTKdxYh-g9QXAQ@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gcc-cross: Fix header file corruption problems
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
X-List-Received-Date: Fri, 06 Sep 2019 14:23:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-09-06 at 07:15 -0700, Khem Raj wrote:
> 
> 
> On Fri, Sep 6, 2019 at 12:24 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > gcc's makefile can move files, replacing with the contents
> > "timestamp". This
> > corrupts the headers and breaks things like the gcc testsuite.
> > 
> > Add in a fix to ensure the headers are not corrupted through their
> > hardlink copies.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-devtools/gcc/gcc-cross.inc | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
> > b/meta/recipes-devtools/gcc/gcc-cross.inc
> > index e417b898734..95af6d89a9d 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > @@ -212,6 +212,9 @@ do_gcc_stash_builddir[cleandirs] =
> > "${BUILDDIRSTASH}"
> >  do_gcc_stash_builddir () {
> >         dest=${BUILDDIRSTASH}
> >         hardlinkdir . $dest
> > +       # Makefile does move-if-change which can end up with
> > 'timestamp' as file contents so break links to those files
> > +       rm $dest/gcc/include/*.h
> > +       cp gcc/include/*.h $dest/gcc/include/
> >  }
> 
> I think we moved them outside gcc dir isn’t it 

Not sure I follow? I think the patch is correct?

Cheers,

Richard


