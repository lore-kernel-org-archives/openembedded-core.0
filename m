Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 201C26C2B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:53:23 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x10so1846196wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 04:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=w61OCWnnLQXqiSHw/nivlQb9ZUlT/87tc3vkT6/2vhQ=;
	b=CD6N5rXnq9XIpnz9Z+Jb2sRyz/aPeFWsYeUgTXviHcQcFJqiuwSj3//KNRRF2xLvTG
	ms9GFKU7KKHBKSGiQz3d4neri2EHDJZTVujw7gGQgDbMRq0uz77P5xVHNPapDHMs2kIb
	PS6m93AfjyXL2sDfQ4I/+Xwd3tUhQCP1X+mYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=w61OCWnnLQXqiSHw/nivlQb9ZUlT/87tc3vkT6/2vhQ=;
	b=XdDJkQIxpny91gZOF6tMdNXFWKSgXnEEtf6ZZSZiY/UpPBern7FbCK9hrO60jAlkS4
	qWjnsyx/V7zHscPt2YryjsXxcImVv8GSeBDwZtBEz/HdkpEFyJoO3niOTusNIlsxhd8E
	lTdnt4/OZl0p3KPtfHucEARq/12lglGHLb1/DW26dmHuqN0RBgzyidWzrMpiEYIkaXvv
	XRxykVQnogZcF/PyZI2xc6DjuTf3DQWm+Amg9MV1zb2PwuPDaT/hKXrXhSRYu+0mF2/t
	LfdfrdEJv/9H6Ul490NCq7/1dU62rSXBka0KVVyOm/YEhvSq0hDN56auOEj0PbZOV/RF
	xuvg==
X-Gm-Message-State: AA+aEWY+bjx9+Gg+CIVEkS+mH0yGa4wHKmTlOdRT6/mi75gE3aFqMGJ2
	Vo+RLswSiNrYZ4zpxV4sJVjuiA==
X-Google-Smtp-Source: AFSGD/Xcy4HWZ5BJKV5unOXxaY8KM8vgrAJgOmzcu1WX7SH9B1i5CxZwT4I6NIB6LX4fdTsT23AYrQ==
X-Received: by 2002:adf:da41:: with SMTP id r1-v6mr404385wrl.129.1542718404329;
	Tue, 20 Nov 2018 04:53:24 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z8sm24100867wrr.52.2018.11.20.04.53.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Nov 2018 04:53:23 -0800 (PST)
Message-ID: <fbb2b0ead56624464117557944906cb8ff451d57.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andrej Valek <andrej.valek@siemens.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 12:53:22 +0000
In-Reply-To: <20181120111725.4337-2-andrej.valek@siemens.com>
References: <20181120111725.4337-1-andrej.valek@siemens.com>
	<20181120111725.4337-2-andrej.valek@siemens.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] nativesdk/sdk: Fix sdk dummy providers for opkg
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
X-List-Received-Date: Tue, 20 Nov 2018 12:53:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-11-20 at 12:17 +0100, Andrej Valek wrote:
> > ERROR:  OE-core's config sanity checker detected a potential
> > misconfiguration.
> >     Either fix the cause of this error or at your own risk disable
> > the checker (see sanity.conf).
> >     Following is the list of potential problems / advisories:
> > 
> >     Required perl module(s) not found: Text::ParseWords
> > Thread::Queue
> > Data::Dumper
> 
> It means that perl wasn't excluded from buildtools-tarball.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/recipes-core/meta/dummy-sdk-package.inc | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc
> b/meta/recipes-core/meta/dummy-sdk-package.inc
> index eafcb823ab..44fb1cb714 100644
> --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> @@ -20,7 +20,11 @@ PR[vardeps] += "DUMMYPROVIDES"
>  python populate_packages_prepend() {
>      p = d.getVar("PN")
>      d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
> -    #d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
> -    #d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
> +
> +    # opkg needs some additional package dependencies handling
> +    pkg_type = d.getVar("IMAGE_PKGTYPE")
> +    if pkg_type == "ipk":
> +        d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
> +        d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
>  }

Sadly we can't do this, both do_package_write_ipk and
do_package_write_rpm depend on do_package and this would cause
do_package to change depending on the package backend selected which
would mean inconsistently generated packages. We're going to have to
find a better solution (and maybe add do_populate_sdk testing to the
nightly-packagemanagers test to ensure that doesn't regress).

Cheers,

Richard



