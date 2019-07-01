Return-Path: <matt@madison.systems>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0D77D1AB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 11:59:55 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v24so12856508ljg.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2qQO0e1vSf4QDhMV1BJbvfTd1EPttqpyd0K99Zfhl/c=;
	b=hGOE+c1M+d4aG+mJXwBQqg0eDEclM2qF2EuyhB5A3ScL/PkRPKrzUOmPUaNzG20yf+
	RZWmqdKDbNIYOMqhonH0FPSXvT1d0B7qIoVH9WSF9hgN+ZfuTFtYR4PlTJ29/Am6s+/V
	gDSHOLn+n6MWX/+hwVDsDQ/WbsSfjK1bpMQWztxeey91q07gRo4f/rEV/q2E15UeX8EN
	aeXbZGMuKivUHTb/no3Ofm+P9/WWXpoW08TYilh0/ed/nCDMYIrF3fPglfJUGu7F+JKe
	2yj2cTLFK6HdSrq/u1GyE2v/2QKjaeTB4bmktomxc659ZD3LAGn6EnMY4nJfajOHR+6z
	NGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2qQO0e1vSf4QDhMV1BJbvfTd1EPttqpyd0K99Zfhl/c=;
	b=gDEuyPNle5ww8VYk7M4z/r+8riFUNkGw/OPrswc5kFtP53f3ecVUpXmBBzNNnqgY33
	Mf3UC0XRVhzbOb4BSIRupPbQuTVGqhOCyI5mLtRsUGeHJ4QLYlMTBBoRBA8+A2+Oto+q
	8qYG4hcO0hcvAKXz26jZrVYojH5z4n8yVKjbMD3lrXWth5e7k6VZYSUFcdYlHWLzKWST
	5oczzS9WZbOMNfBhL03aA27KeQ0T8zu1v74P/fDlk4+DD/qEu6nR78tODe1bxl0qapgk
	Q8VuCITX2CKwhE/DsPObMlXapAHlwDZOVjf6ReRWEBxt0jSzQ8f302StlMY8Sh4wNdRh
	PxQA==
X-Gm-Message-State: APjAAAW0URLVOy5yI/qAKf2ccz7+mzmuhqrwlekROXaxZuiBUH+GS16C
	upNZNyqVhsQ7Mn4e7rFKXi6Zcz6C5M0vTY1xIqMJPA==
X-Google-Smtp-Source: APXvYqxPPqiBCEtqH41Z5wJGFvWQL7Na56iSWykWy3qw9rqJOCR5xsGCA9ZCBmCSqzwGgG3SSoMnQV6afQvXOcCLQHA=
X-Received: by 2002:a2e:9997:: with SMTP id w23mr14122188lji.45.1561982395636; 
	Mon, 01 Jul 2019 04:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190628075701.78128-1-mingli.yu@windriver.com>
	<9b5dca23cf1d8a90466bc084236599487726f4b6.camel@linuxfoundation.org>
	<5D196A07.7040304@windriver.com>
In-Reply-To: <5D196A07.7040304@windriver.com>
From: Matt Madison <matt@madison.systems>
Date: Mon, 1 Jul 2019 04:59:44 -0700
Message-ID: <CAGgRHJqeFE75tXJ7qB4gyxkZaWsLmFozY+1YoJLUPXzG9Q+fOA@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-dep: disable PTEST_ENABLED
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
X-List-Received-Date: Mon, 01 Jul 2019 11:59:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2019 at 6:59 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 2019=E5=B9=B406=E6=9C=8828=E6=97=A5 19:02, Richard Purdie wrote:
> > On Fri, 2019-06-28 at 00:57 -0700, mingli.yu@windriver.com wrote:
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> The run-ptest logic for go-dep actually runs the
> >> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose
> >> source file is
> >> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go.
> >>
> >> That dep_test.go starts by rebuilding the dep program
> >> from source, then runs the tests using that copy of the
> >> program, so it's assuming that we're still in a development
> >> environment where we can run a full go build.
> >>
> >> Considering it not being designed for a cross-build setup,
> >> so disable PTEST_ENABLED.
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   meta/recipes-devtools/go/go-dep_0.5.0.bb | 5 +++--
> >>   1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/go/go-dep_0.5.0.bb b/meta/recipes-
> >> devtools/go/go-dep_0.5.0.bb
> >> index a4d631f8ea..e9fc12fa5a 100644
> >> --- a/meta/recipes-devtools/go/go-dep_0.5.0.bb
> >> +++ b/meta/recipes-devtools/go/go-dep_0.5.0.bb
> >> @@ -21,5 +21,6 @@ BBCLASSEXTEND =3D "native nativesdk"
> >>
> >>   # For compiling ptest on mips and mips64, the current go-dep version
> >> fails with the go 1.11 toolchain.
> >>   # error message: vet config not found
> >> -PTEST_ENABLED_mips =3D "0"
> >> -PTEST_ENABLED_mips64 =3D "0"
> >> +# disable PTEST_ENABLED as the run-ptest script for go-dep actually
> >> runs the /usr/lib64/go-
> >> dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose source file is
> >> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go not
> >> being designed for a cross-build setup.
> >> +PTEST_ENABLED =3D "0"
> >> +PTEST_ENABLED =3D "0"
> >
> > Setting it twice looks wrong.
>
> Sorry, it should be my typo.
>
> >
> > If we're disabling it, why would we inherit the ptest class at all as
> > its not going to work anywhere?
> >
> > Upstream not considering cross test usecases isn't a reason to disable
> > a test, we have many tests enabled where upstream haven't considered a
> > cross use case, we just tend to patch as needed and start a discussion
> > with them.
> >
> > It sounds like its actually a network access problem from the image
> > you're running into anyway?
>
> Hi RP,
>
> Have discussed the ptest more with Matt in the maillist and also tried
> to add the patch under the guide from Matt to make the
> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go work with
> cross-setup env. But seems it still doesn't work.
>
> Hi Matt,
> What's your opinion?

I was able to get the test to work in my setup, with the addition of
that patch and manually setting GOCACHE in my environment. As Richard
mentioned, from the failures you were getting, it looked like a
network access issue in your setup. I'm not sure why GOCACHE needs to
be set, when 'go env' shows the correct (non-'off') default; that
might be another issue in dep that needs to be addressed.

It would be good to have at least one non-trivial ptest for a go
package, and since OE-Core doesn't have much beyond the toolchain
itself, go-dep, and glide, getting this to work would provide some
much-needed coverage. Running go-dep or glide - both build tools - on
a target seems like a fairly rare use case, though.

As for Richard's initial question, go.bbclass inherits ptest to enable
the mapping of go's built-in test builds automatically. In hindsight,
maybe this wasn't the best choice, and it was overly optimistic to
think that because go supports separate compilation and execution of
tests, that packages would generally support that by default.

-Matt

> Thanks,
>
> >
> > Cheers,
> >
> > Richard
> >
> >
> >

