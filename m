Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 08BF779BE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 19:51:25 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id n11-v6so8073019iob.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 12:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=odN9+St/zzmm+CDnCZz9rdMgUNpwC4BELHUAKFGr4eg=;
	b=fLmFfDKx7Zfn0SMr4gySSizeMUQVDq6q+xaBGSGY69tG2Ojt/X8Y8l14FkOByHraUU
	GnvxZzyN3NEJqFXyM9+wZs0/hxaEQ40s4GfOmmA/zSa3I0QsZQO71NA+9hJrtohM2eQx
	gGxlrHchZS7i8Ra+/wxG8xBGOoSO3hM10ImrVONLFJvoMYK6kCkeP7nXKPVhhqZzVQEx
	cQdqAGQFTpcWKZ9Yled1goFaUZORhX/zAsrGkE3pGZV2C8ySZ/RaxW6T9StsYA/j1zw+
	V2dAOIOFaWymKEouuFYCFdruYO1iTtVveniZz7dw1XdLsD4C3nCWaBJljlYQ2lmZIJ9O
	FaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=odN9+St/zzmm+CDnCZz9rdMgUNpwC4BELHUAKFGr4eg=;
	b=JVKgmgCDmkzLVx4fZSHezFORF8oPBqQHvjLSg0hj4xMBTMWuzjBcn4yzZfT6ZtanWm
	RtV3NMSGcIr2X7BmWZWWqmsaGdb8zLQ1cmrgk7lKkixLzVxOOnT1JPUR4cfH2Fe6CY5W
	d30lbGcRrTzphOVAzoTzyArs48ywgbPc02iG5v4FN30Pqt3PgvfVULiSuMZMROlr90tM
	inW/nk1I154EtNfRl849j7C8v8LBzXSata6/gfaj2aN7sYhLxpDBuW1yo5IODuQjQt+H
	U+ncApaZlogj5ht9TT7PgcgX2GhF1xmH9AiYrzeWIOzFTczgW5ZHmx/4FQaavb0pgTs6
	Wnqw==
X-Gm-Message-State: AGRZ1gKnOj7yf4ryLUpvvpsscWJ/zFZ4hbaWS3Bmzur8Ibw9rsjy2rAu
	AHpNq5NXSU1Dj8UmDomatfTfNDf0ytZdjvmMG6S4qA==
X-Google-Smtp-Source: AJdET5cvn5ls02Acv06GBHiatxPenNEOLUrSXgu0dKn27Q5OXe04LELyDpLv4WC9kULDouZWJPq8VRJeXvjJkET/9HE=
X-Received: by 2002:a6b:b583:: with SMTP id
	e125-v6mr46433iof.201.1540929086895; 
	Tue, 30 Oct 2018 12:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <1540885980-278826-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LYGn-tUcgjwMo1801RARVivebmW=sm-dkzy7hdSbjzQuw@mail.gmail.com>
In-Reply-To: <CAJTo0LYGn-tUcgjwMo1801RARVivebmW=sm-dkzy7hdSbjzQuw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 19:51:15 +0000
Message-ID: <CAJTo0LYHiG2Q149oQrCfJnMY3Si3rC8zrQ7hC7U7U89igSfD5A@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: Update SRC_URI
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
X-List-Received-Date: Tue, 30 Oct 2018 19:51:26 -0000
Content-Type: text/plain; charset="UTF-8"

It's back now.

Ross
On Tue, 30 Oct 2018 at 12:13, Burton, Ross <ross.burton@intel.com> wrote:
>
> The machine is only down temporarily and should be back soon.  I don't
> think we should merge this as we'll be reverting shortly.
>
> Ross
> On Tue, 30 Oct 2018 at 07:53, <mingli.yu@windriver.com> wrote:
> >
> > From: Mingli Yu <Mingli.Yu@windriver.com>
> >
> > The official repo for mtd-utils is git://git.infradead.org/mtd-utils.git,
> > however there comes below error:
> > $ git ls-remote git://git.infradead.org/mtd-utils.git
> > fatal: unable to connect to git.infradead.org:
> > git.infradead.org[0: 198.137.202.133]: errno=Connection timed out
> > git.infradead.org[1: 2607:7c80:54:e::133]: errno=Network is unreachable
> >
> > Use the alternative one instead currently.
> >
> > Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> > ---
> >  meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> > index f53c6c1..b71c997 100644
> > --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> > +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> > @@ -13,7 +13,7 @@ RDEPENDS_mtd-utils-tests += "bash"
> >  PV = "2.0.2+${SRCPV}"
> >
> >  SRCREV = "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
> > -SRC_URI = "git://git.infradead.org/mtd-utils.git \
> > +SRC_URI = "git://github.com/sigma-star/mtd-utils.git \
> >             file://add-exclusion-to-mkfs-jffs2-git-2.patch \
> >             file://0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch \
> >  "
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

