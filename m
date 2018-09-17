Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 18C2F79558
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 14:57:09 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id z8-v6so15510719qto.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 07:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Sx9vI626qox/XThK697dY/YilfNhdUlgSfjcrFll/Dw=;
	b=p0MvObx3KsQB0wBMTafbctnreuGxUTDyh+GJXUgFNtkD/PXj2PCL3GDPj62JpvzRaA
	3FEhYpDeXd61zi1MuCH8pa6BpMUyNAZPoojPv7XrwUysVYiRLprY3Mg1Byj2QmP3G/Ke
	hN0n35HVh1CMHm/1Z4uR4/0bQwE1+jLWF+8uwWcBLVdZ5jNK4+8sNFHAXDgzEnYCs3k2
	ZK1wNtNlDZP7BNl8qNrmoNoADjrc55GhRdt54miCaWyjkU11KVSe07cDIcMAfrNiUHoR
	nWkPHTqyiOWaPsysglNG1zCDG7lBH8tBmgvVIlIcxxcs5vo/wsg0lCMY7O9+LHjh8KIz
	SDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Sx9vI626qox/XThK697dY/YilfNhdUlgSfjcrFll/Dw=;
	b=nAS6L8qRsOFt6B01WwaNoazJ9PJc7Kmv/NverDrQd/6V9DnFDiWxHCDqFXAtiEUCsH
	LgSLupcn9jnQJYHxDNtmuGV+z9b4vjatZQwpR7zW//6kqHrSmeCZ6A5YmURVC69OC7JT
	nf7vCRdCDeF0mtdo66bb/NsU+5BhPWvW2CKtaqBcebej4hVyUOBsJJxJ//u7Xs8B76Pn
	yUIGleeca2FTcHTY2zbUebprooBOJqWTyNEAh7KnRQxGibqdaVpfE2uPK7Fd8Z6GxwZa
	vqY0b8pb3xMFnJzX0F7HxO8SAjdJ6LNZXlJg7dioyqF4rZbEEFB/D6I6/eoGFRD5tDTG
	RE0g==
X-Gm-Message-State: APzg51D8YJeroQ+BAVU/S23x/8fXgXeWW87yVNC5PTZHdLjs9zgjF12x
	R1v0cr58FFrc4gQDCY3T2uCl0aSf/V9XnML0Axw=
X-Google-Smtp-Source: ANB0VdYAQpdB99bw422SOCbaSCHFwstpIW02UtdTvW8PnnrgKIR3sr/icbktii9/oVjM6qd2l1/Myhr5GKp+9Ibyrpw=
X-Received: by 2002:a0c:87f8:: with SMTP id
	53-v6mr18134562qvk.228.1537196230659; 
	Mon, 17 Sep 2018 07:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535478536.git.raj.khem@gmail.com>
	<62f7c23173a051958c2cf6e8d7a4fce9bd0ef279.1535478536.git.raj.khem@gmail.com>
	<CAO5Uq5SZ0hfF_zNcP9c0ntOwmCVbeKBqiApV6AOR2GkVSNOz+A@mail.gmail.com>
In-Reply-To: <CAO5Uq5SZ0hfF_zNcP9c0ntOwmCVbeKBqiApV6AOR2GkVSNOz+A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Sep 2018 07:56:44 -0700
Message-ID: <CAMKF1sqsO0b2uAmia7ko5qoZZRYReqaBYj-pDkjzR9v4Yif76Q@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] gpgme: Inherit distutils3-base
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
X-List-Received-Date: Mon, 17 Sep 2018 14:57:10 -0000
Content-Type: text/plain; charset="UTF-8"

No, it doesn't. but
inherit distutils-common-base python3native
together will work and also drop the runtime dep on python
On Mon, Sep 17, 2018 at 2:27 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Hi Khem
>
> On Tue, Aug 28, 2018 at 6:51 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > its building a module therefore its important to provide correct cross
> > build environment, distutils3-base automatically inherits python3native
> > this is seen when using clang where it tried to link with gcc since the
> > environment falls back to builtin LDSHARED variable
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> With this change I'm getting python3 pulled into images when using
> gpgme, which I really don't want. If I add:
>
> diff --git a/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> index ac9fccf..8b34aa3 100644
> --- a/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> +++ b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> @@ -50,6 +50,8 @@ LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG',
> 'python3', ' python3', '', d
>
>  PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', '
> distutils-base', '', d)}"
>  PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', '
> distutils3-base', '', d)}"
> +PYTHON_INHERIT_class-target = "${@bb.utils.contains('PACKAGECONFIG',
> 'python2', ' pythonnative', '', d)}"
> +PYTHON_INHERIT_class-target .= "${@bb.utils.contains('PACKAGECONFIG',
> 'python3', ' python3native', '', d)}"
>
>  EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
>                   --disable-gpgconf-test \
>
> I avoid that runtime dep, but does that still work for clang?
>
> > ---
> >  meta/recipes-support/gpgme/gpgme_1.11.1.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-support/gpgme/gpgme_1.11.1.bb b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> > index 151fc03f55..ac9fccf133 100644
> > --- a/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> > +++ b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> > @@ -48,8 +48,8 @@ LANGUAGES ?= "${DEFAULT_LANGUAGES}"
> >  LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' python2', '', d)}"
> >  LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' python3', '', d)}"
> >
> > -PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
> > -PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}"
> > +PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' distutils-base', '', d)}"
> > +PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' distutils3-base', '', d)}"
> >
> >  EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
> >                   --disable-gpgconf-test \
> > --
> > 2.18.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Alex Kiernan

