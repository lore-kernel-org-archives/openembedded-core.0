Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id EFC4A7D70B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 19:57:04 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id w25so5274395ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 12:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wPJ2WwV3goN2b+NOKdwP19eyQuM5WeQD+OAu5Le34v8=;
	b=vGmKZtMdfvx8yyX+LnGleXal+0eI+3iN6bPRGJiG1H6rKmhHJBIL1Cl+AYKCKTCZEW
	P2l4EGl7vGdveo3U33U8v7mucsxaRaJ+4u/LRqpnSdLKqsdhducKS5BCqN3SlkUDblRK
	HmV5hG/SOkpAquVFIOqjz+9T3Me5pNi49JgVsg+XGDtLXsGZdi9EzkLpvX0RW2hcstCa
	rFCk46dOPYN8/Dm5qNkU8moqruf9b2JZMf+6GK43WLqnamavZR7zOCUdcvB+qzcvhuvy
	5y0oQnyRepzq4o/unxBCLlFQGHX94+3v9lCqr4rMHTwkubpgqSVCOBnLs87BixkaEqxA
	QMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wPJ2WwV3goN2b+NOKdwP19eyQuM5WeQD+OAu5Le34v8=;
	b=L/Ob1j+R/ZSVz9zgfkteNt5FZXxFV6ElIwRBREU6zOZQnyH1ND/rGmKU8u2oTUOn++
	A0vW3Eh5DMtcgiPpel30JEiQKqKjPnDE6n473Hn8e0Hnou1o8iKQrl3sJeHrmiCagBbC
	yAq5Vbar0T4k3QbEgweRvWL/7hAMTe951hSoyBorI43iL+C7s/ktain6l5quFIQ5IpLB
	fz6I8pu2sxfuFCxNE5Nayg6GnBakhDzQmQrIpXNn+wphDFYWrhF9QySpU3T5fMb9xIN2
	kuMXgEipX2B8zg/2Om7UvRb8OslptkHl2ttnRctIg3cxpV4BLM9wCxRvDIp3AAUMGHjr
	XYYg==
X-Gm-Message-State: APjAAAWGVttKZXUs+XqL6GkHN5y17nPkHT2GnpVViBWCmGwwVkGcFj4S
	8VZ6S8hlqPlUxUaK7ZkniolQXYk+eSlAqzQY56uoyw==
X-Google-Smtp-Source: APXvYqxgShc5OUIiQVdoM3AaoAAj5/Y3KkC/Bru//5TdUr4Ohyz3F5qwWJx25wVaGXZlsdnbKwuubePsmGxO7mPJV5E=
X-Received: by 2002:a6b:38c3:: with SMTP id
	f186mr39354552ioa.187.1560110225903; 
	Sun, 09 Jun 2019 12:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190606020544.26181-1-douglas.royds@taitradio.com>
	<20190607012157.16757-1-douglas.royds@taitradio.com>
	<CAJTo0LaXrqCh6Nn9V8QWZS8+ivUdbOwTAcVvwXi7xziETMQKtw@mail.gmail.com>
In-Reply-To: <CAJTo0LaXrqCh6Nn9V8QWZS8+ivUdbOwTAcVvwXi7xziETMQKtw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 9 Jun 2019 20:56:55 +0100
Message-ID: <CAJTo0LZgdExX7m=7vcTR7duMvO7ajdHhgY3KX+7vrGJvJR+hQA@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] json-c: Disable icecc to avoid implicit-fallthrough warning as error
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
X-List-Received-Date: Sun, 09 Jun 2019 19:57:05 -0000
Content-Type: text/plain; charset="UTF-8"

FWIW, this just landed in json-c master:

https://github.com/json-c/json-c/commit/07ea04e65193c3e5c902c5b79421d5fa48ff67c7

"build: add option --disable-werror to configure"

Ross

On Fri, 7 Jun 2019 at 12:20, Burton, Ross <ross.burton@intel.com> wrote:
>
> FWIW I still believe that just patching out -Werror is the correct fix
> here.  To be honest I'm really close to writing a QA check that
> -Werror and friends isn't being used at all...
>
> Filed https://github.com/json-c/json-c/issues/489 in the hope that
> upstream will handle it.
>
> Ross
>
> On Fri, 7 Jun 2019 at 02:22, Douglas Royds via Openembedded-core
> <openembedded-core@lists.openembedded.org> wrote:
> >
> > icecc preprocesses source files locally before shipping them off to be compiled
> > on remote hosts. This preprocessing removes comments, including /* fallthrough */
> > comments in switch statements that normally prevent the implicit-fallthrough
> > warning.
> >
> > Rather than turning off -Werror by patching configure.ac, it is simpler to
> > disable icecc completely for json-c. There are very few source files to compile,
> > so the compilation is quick even without icecc.
> >
> > See https://github.com/icecc/icecream/issues/419
> >
> > Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> > ---
> >  meta/classes/icecc.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > index edb0e10434..c0f21bdbfd 100644
> > --- a/meta/classes/icecc.bbclass
> > +++ b/meta/classes/icecc.bbclass
> > @@ -76,6 +76,7 @@ ICECC_ENV_DEBUG ??= ""
> >  # target-sdk-provides-dummy - ${HOST_PREFIX} is empty which triggers the "NULL
> >  #                             prefix" error.
> >  ICECC_SYSTEM_PACKAGE_BL += "\
> > +    json-c \
> >      libgcc-initial \
> >      target-sdk-provides-dummy \
> >      "
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

