Return-Path: <joel.stan@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 306A360B74
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 06:53:22 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q15so13182677qke.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2020 22:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S/W5xsb94xFV05/l/2cDKRuQvunrtBzj2kYOVbkeh0g=;
	b=U74qT9Fj1V/C8AzXUqb611p+so3djBZL2pJn4sgg61etJC2URvLfWp1WeDknzzpOp6
	Wv9kno0FNe1PnWG0IgVDzqw/HNp/ligs6aCzp2bsaQ4vzXf/dAjmrj++UKaqiaU5ZTcI
	ep9rTOkwIsgelNGOvTeJXLVyfUOdGwBt9eHSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S/W5xsb94xFV05/l/2cDKRuQvunrtBzj2kYOVbkeh0g=;
	b=V/9YR5s1BIINoUPm7xnvh8yrZpKTYAI/3LJ9/fmTwvjPQoGXz66tXFcWBvWkGsaPMb
	YNnvDCITlcQjWxa0RxaQcGlBgO5qFME2tlSE18nQM2T2RpWTFwt+fAkBCQSSmupcI+kl
	5xoxzfAmIBpJEii0BRRbAe4i4gd7jxj59tJiM0zr52t+j45SAgfmicDdnr29m+11OtSF
	GRm5fuMUWxOeUJ/+DHryeRhInU6kAVVnluJJWmAuIiBKd5PPfQDP9eBPbOpUf9jh135V
	EI0BS6gH008KJ++rscVRfpjwhZdkO0nTDbFsbe9WpzAW1PBRCrxSzc0RMVcJvtJ0tbDQ
	7mTw==
X-Gm-Message-State: APjAAAUUCDJ3d7sRaS5fRICDO3zQtvAjgcxfW1UDwHBM3Zj4BpIZ4Kql
	XmZL5WCVHCe871fxnaSmF9mZuzCIfBLgq2pVV68=
X-Google-Smtp-Source: APXvYqwfDmL+AVLyuuXPBGVNq635aMsGdqHHFTav4CPRsSyU+TQeu6jAozZ4+uPvjQ4Wn9e3lTeWRkR6UNH1L90Z6zw=
X-Received: by 2002:a37:dd8:: with SMTP id 207mr1232860qkn.292.1580712802843; 
	Sun, 02 Feb 2020 22:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20200203063455.417119-1-joel@jms.id.au>
	<d07c374f6602370df038e8440c2c5aedf6faecea.camel@intel.com>
In-Reply-To: <d07c374f6602370df038e8440c2c5aedf6faecea.camel@intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Feb 2020 06:53:10 +0000
Message-ID: <CACPK8Xf91sPr6WeSe+a3yxUjeh82tUJTrux5N32JgWyGoEh89g@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Additional fixes for 5.5+
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
X-List-Received-Date: Mon, 03 Feb 2020 06:53:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Feb 2020 at 06:45, Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Mon, 2020-02-03 at 17:04 +1030, Joel Stanley wrote:
> >      # use /usr/bin/env instead of version specific python
> > -    for s in `find ${S}/tools/perf/ -name '*.py'`; do
> > -        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
> > +    for s in `find ${S}/tools/perf/ -name '*.py'`
> > scripts/bpf_helpers_doc.py; do
> >          sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
> >          sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
> >          sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
> > +        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
>
> Can all these lines be replaced by:
>
> sed -i -e "1s,#!.*python.*,#!${USRBINPATH}/env python3," ${s}

This would have the same effect, yes.

