Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id D89097E53A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 14:21:41 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id o11so13208255qkg.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 07:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZoZw7GK33wgwWeG17xVVYkbZAUYXRMAMc7fCmTRbxQE=;
	b=kABHUKb5dZL+wvbpyBOdA4kEeRfjLZJg4Bgn6SPhcxKhGtiWlR9Y93iJpCxWKg0smM
	ZJEryAZOhi59hSuQz5mVmBOqS6bMEaAXloJzkvVgBafy8MpK+lX/7Xd7vLRrZrhpwt4/
	PT63sRkNQEGEcoR5D9Cz4VUGCydqcdqy2X1/dubC/B7EPi87yGgfxDdLJGZYyY1PBScR
	k6My7Umagj1vo0T6l5nuiC3yHUMj7R08TxoOI6glQ5u8j+Mjm5JmeoAIVEJjaoekatSe
	vkelZ7SRKjpoBgmfQDjNZwwHMK4Gu6U0TyvKE52aHlY9Pt7PuAfjUPQSxuCXQi+UGtiw
	AB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZoZw7GK33wgwWeG17xVVYkbZAUYXRMAMc7fCmTRbxQE=;
	b=h46m++RNfa6+e2Y3ry2qx44+fymn+aq0HGmbG+1wuFOpOytoc7IDO2yUvTfEtiA6re
	WP0/t5sIK6XXqwwsVRf32a5P0H3wHbbwN/Qsz1jHGvVOnfCFVx7ysoux37s8A8iIchjC
	rTh+UgKjvSk0l0hq+x+w3gDwJW3p7C07qSWR57HtvjDhx8kf9aJfrZbMR35cSSPpc+JX
	XSTpxRCq6dZ4Gn87ydNu8KY6f1n0NMG7qSiseER6TgtJ1npXWfrNu+UWyFo/oO4ltg2H
	3db2HwhWQXDFVZtTRMhi7RyjTPubiMr0nLP4Vr9LOF3igkdQNoEcdOenHcQ7wEGk2TV5
	dXSA==
X-Gm-Message-State: APjAAAXhpl0zXT5kblKgsiUFpLitjHhPkseW9RL7o2nMG000dD8USAIP
	ZzMTN3alNE/tfwFLe2Fzwr1yOQ79vBesRTKahDKHZJXx
X-Google-Smtp-Source: APXvYqwbRz65NHXzSJIkt7SymsZ0Zo0wBsm5ttJdjT+3H4nfPW5Vvnl8vYzPTHCEXNIlwlePFAqlSE2TH0LavczxBO8=
X-Received: by 2002:a37:c403:: with SMTP id d3mr23430282qki.212.1568038902215; 
	Mon, 09 Sep 2019 07:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190909031607.1806186-1-raj.khem@gmail.com>
	<4719cb39acdead5dd44e1100f0dd9265b0185da2.camel@linuxfoundation.org>
In-Reply-To: <4719cb39acdead5dd44e1100f0dd9265b0185da2.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Sep 2019 07:21:16 -0700
Message-ID: <CAMKF1sp82+VfqstYutVxV5MfmGGBDGMFUsJ3rYWZb2go4CSKcg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3native, pythonnative: Separate definition and export of PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
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
X-List-Received-Date: Mon, 09 Sep 2019 14:21:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 9, 2019 at 12:44 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2019-09-08 at 20:16 -0700, Khem Raj wrote:
> > This helps recipes where they need to explicitly pass the variable
> > and
> > does not entertain the ones from environment
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/classes/python3native.bbclass | 6 ++++--
> >  meta/classes/pythonnative.bbclass  | 6 ++++--
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes/python3native.bbclass
> > b/meta/classes/python3native.bbclass
> > index d98fb4c758..bed04bd941 100644
> > --- a/meta/classes/python3native.bbclass
> > +++ b/meta/classes/python3native.bbclass
> > @@ -14,8 +14,8 @@ export STAGING_LIBDIR
> >  # find_package(PythonLibs REQUIRED)
> >  # which ends up using libs/includes from build host
> >  # Therefore pre-empt that effort
> > -export
> > PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
> > -export
> > PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
> > +PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
> > +PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
> >
> >  export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> >
> > @@ -24,3 +24,5 @@ export PYTHONNOUSERSITE = "1"
> >
> >  # autoconf macros will use their internal default preference
> > otherwise
> >  export PYTHON
> > +export PYTHON_LIBRARY
> > +export PYTHON_INCLUDE_DIR
>
> I'm confused as this makes no difference to bitbake and is equivalent.
> exported variables are always set in the datastore...
>

I was still seeing it unset on am ARM builder, I, however, did a
composite change where this change along with another change where
this was used went in together so I need to test this separately

second reeason was to make it adhere to same convention in the
bbclass like other variable e.g. PYTHON which inself could be reeason
good for this change even if it is a nop

> Cheers,
>
> Richard
>

