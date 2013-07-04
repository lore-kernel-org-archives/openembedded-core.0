Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1DFD5607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 13:19:21 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wc20so1620625obb.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 06:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ykpXg+PycRv9a6yvMbmrmZAmNzb1B6NawAc4tQU3/uA=;
	b=ZEyQ1ddiOFXgbi/up5FhqDS5Flzuqe6aRf4dFU5pctoo2iY/IHK3L9TKla7PDqtXR+
	VWr4oLKrw5kmWZiW4SLCRgdKv+T5ThJRf4GbfphHsEf/rYMuVEg3PnAnmQDEqbuVdEVB
	nuqRMqi4JovQL8NNDPHxdlhDI3afNnBACqcMRZVLs7TfV5uNFWuyfp9pmS4bjwbI+Hby
	rrOtnjdqlxlPqJZSV/p6xt7zTKuxq/5eFZRh23JXSSbgUwCHFKIHD0JDq4/flnVXShzd
	F7VPcr0qTHkj5caNRSfCkMKAgn+rC84lpJTuV6+FP5RR2tQAeGx1ha2Ss68KykemMpjS
	QdQA==
MIME-Version: 1.0
X-Received: by 10.182.105.99 with SMTP id gl3mr6052354obb.94.1372943961866;
	Thu, 04 Jul 2013 06:19:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Thu, 4 Jul 2013 06:19:21 -0700 (PDT)
In-Reply-To: <20130704053401.GA25335@xiaoyu.lan>
References: <20130704053401.GA25335@xiaoyu.lan>
Date: Thu, 4 Jul 2013 10:19:21 -0300
X-Google-Sender-Auth: RXy7PslTSOVDRyynt4iCwcl16Yk
Message-ID: <CAP9ODKor5N3QHkf6N748=mjbyA9gv26RTfNZCHX9Wq0bZVhUag@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Using OpenEmbedded for customized builds
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
X-List-Received-Date: Thu, 04 Jul 2013 13:19:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 4, 2013 at 2:34 AM, Holger Hans Peter Freyther
<holger@moiji-mobile.com> wrote:
> Good Morning,
>
> we have a basic product and build the images for it using
> OpenEmbedded. Some customers require the installation of
> additional packages, or even the modification of some of
> the installed ones. The current approach would be to build
> one VM per customer but that doesn't really scale.
>
> I think somehow I want to end up with having my base/generic
> buuld and a way to put additional ipk's into a customer
> directory. So something likes this:
>
>   base-build/tmp/deploy/ipk/
>                             armv5te/
>                             machine/
>                             customer1/
>                                       armv5te/
>                                       ...
>                             customer2/
>                                       armv5te/
>                             customer3/
>
> or
>
>   base-build/tmp/...
>
>   customer1-build/tmp/deploy/ipk/...
>
> In both cases the customer should only include the packages
> that were built for the customer. All the 'base' packages should
> be taken/used from the base built. I could indicate for which
> customer I build by setting an environment variable?
>
> For a corner case, e.g. if I change the SRCREV and re-build with
> a customer flag set, this package should still go to the customer
> directory.
>
> Can this be already modeled? Do you have any idea how this could
> be done?

Currently I did this using MACHINEOVERRIDE and I made a machine which
is reused for each customer. So I have a single kernel and machine
setup but customer aliases which I can use to control the system in
the image and like.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

