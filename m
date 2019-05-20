Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 525387E075
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 15:04:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l2so15009727wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 08:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=O+x96ijKs2NLOM5P4XabkUO5HjHCxuxZCv15tJRIcGE=;
	b=lYMLutuBcUlP5GP1rr2BrZ0WZcf0WYT4p0c9hgsXi7m9/1I6LrTGE3QWrdwmHUSwZp
	tDB2XxzgnqtZHzNNePKJ5C/PiGA6f9xqc6Oang/tNYRkpoXppaKizv2A+Mc7BZK2yec2
	ApedL/1YVgEKLyWhvxQcP9euttriBr5vRixiXoX5KTAvN+bQtV0QO54vABlJLDJGIgr7
	VHeBeYggLgYHeTxlaZond0Dhqs60zFR1sn7N4ADAZMUb/ZjvDgRSUuDjIDZQMSKprtMK
	rBp1e6jKCc+56QgLNEKxc04b0LiIXdQdiuaQiMJ11lVfnhaD/J7B4T7FeDxxKrDPr355
	e9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=O+x96ijKs2NLOM5P4XabkUO5HjHCxuxZCv15tJRIcGE=;
	b=PjYdhDN/CA/q1Ek9v517TtQi1KhoXSIHanZdVrFJXDkRwnca+Di4vSii+E7n5mxUoR
	P5rGUeWfnYec+rR4t6r7pbSaRMMjnYznQO/qTRw9E9b2i2w5kxP0XKcHJ/LNYgXf8o2o
	FRNctXwD0bknOanPK7VvEtFfcM303Mzj97GVwSvCzgEI7HD9M9beIiXyfbu1hI0mHPVD
	5EEisnF7Jbwr6+QjG24sgePAhuGeqY4qPo6ZQ0jeFE4zaSN99HTOkQpYkhg+IUrKGrnI
	r+BW58I36SfUR1ReKQU8jNEsjnHA1/iqa4qCZezjItb1pTJQMSlcXOOgEYyHfk4o4d3m
	XjkA==
X-Gm-Message-State: APjAAAW55BzOH7bnALP6pM8ra9X1pVUkwuP9fG9Cx8wLMFUg02Q4PPvh
	dHLoIhEhijoyqyzWlGz7keBp4Syf
X-Google-Smtp-Source: APXvYqwQsMEbXeW3fW8mcOYIrOcjg5T9NgSUhJGqcUgxJAVkNtCFkTpcaozdkzCb96jZiCFuznA70w==
X-Received: by 2002:adf:e711:: with SMTP id c17mr8982824wrm.227.1558364694011; 
	Mon, 20 May 2019 08:04:54 -0700 (PDT)
Received: from bluca-lenovo ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	o4sm20504492wmo.20.2019.05.20.08.04.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 08:04:52 -0700 (PDT)
Message-ID: <9ca3cf5a62ce6c2aaee7e15b68be684184644200.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:04:52 +0100
In-Reply-To: <e8e8d3b516e2a0e3b30fe2aa1882700f3ad5df43.camel@linuxfoundation.org>
References: <20190516210956.19906-1-luca.boccassi@gmail.com>
	<e8e8d3b516e2a0e3b30fe2aa1882700f3ad5df43.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [PATCH] python*-setuptools: add separate packages for pkg_resources module
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
X-List-Received-Date: Mon, 20 May 2019 15:04:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-20 at 15:14 +0100, Richard Purdie wrote:
> On Thu, 2019-05-16 at 22:09 +0100, 
> luca.boccassi@gmail.com
>  wrote:
> > From: Luca Boccassi <
> > luca.boccassi@microsoft.com
> > >
> > 
> > The pkg_resources Python module is useful by itself, for example
> > for
> > automatic loading of resources shipped in a Python package.
> > Add separate packages for it, so that users can depend on them
> > individually and avoid pulling in the entire setuptools, which
> > include scripts to download other packages, which might not be
> > desired on minimal images.
> > 
> > Other distributions like Debian and Ubuntu already split setuptools
> > and pkg-resources in this way.
> > 
> > The setuptools packages now depend on the new pkg-resources
> > packages,
> > to avoid regressions for other packages that depend on them
> > already.
> > 
> > Signed-off-by: Luca Boccassi <
> > luca.boccassi@microsoft.com
> > >
> > ---
> >  meta/recipes-devtools/python/python-setuptools.inc | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> > b/meta/recipes-devtools/python/python-setuptools.inc
> > index 357aa07086..ad00cbe0ef 100644
> > --- a/meta/recipes-devtools/python/python-setuptools.inc
> > +++ b/meta/recipes-devtools/python/python-setuptools.inc
> > @@ -24,6 +24,7 @@ RDEPENDS_${PN} = "\
> >    ${PYTHON_PN}-html \
> >    ${PYTHON_PN}-netserver \
> >    ${PYTHON_PN}-numbers \
> > +  ${PYTHON_PN}-pkg-resources \
> >    ${PYTHON_PN}-pkgutil \
> >    ${PYTHON_PN}-plistlib \
> >    ${PYTHON_PN}-shell \
> > @@ -37,3 +38,6 @@ do_install_prepend() {
> >  }
> >  
> >  BBCLASSEXTEND = "native nativesdk"
> > +
> > +PACKAGES =+ "${PYTHON_PN}-pkg-resources "
> > +FILES_${PYTHON_PN}-pkg-resources =
> > "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
> 
> 
> This breaks native builds:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/614
> 
> 
> (and many other similar failures)
> 
> Cheers,
> 
> Richard

Hello Richard,

Thanks for the heads-up, any suggestion as to why the above patch
wouldn't be enough to build both native and target binary packages for $python-pkg-resources?

-- 
Kind regards,
Luca Boccassi


