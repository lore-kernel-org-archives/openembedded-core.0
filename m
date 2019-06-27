Return-Path: <matt@madison.systems>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 120617E69E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 11:34:51 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id u10so1296425lfm.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 04:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=85MA428SWhxcUp5d7WRXTHv/q6O4ZfTJW/iYd7+geOo=;
	b=jrjtlcm891WHelnDaOyTTT2msvh2Nb7AEadgGB599UY/0ekfyg8OKeH7OazJ8zIO3M
	qSA4zArDo37TPvdVt1M/Vc4TRtmQA6dHblFgTG5CWcU3o3pgs2af97rkas3uYmRpKPGf
	lwHUlS8MnUyvSUPA11vjtA1NVgtH2lvXrlQKlO++oKxuFY8vb2icPOwVv2G6/HPb2q1f
	2I/t6dk6K4U6SedCo6qSIRaIK3VlVjsRLH5/LR/oXA1cTgNNAPtBoyWICGj/I9+VNguK
	yt184TuV+6Y0RkwZeeCIgtNs5v2zipiSJWup5CFwJaGks1K67sUbnBcp1HlzMo7d2nVj
	N7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=85MA428SWhxcUp5d7WRXTHv/q6O4ZfTJW/iYd7+geOo=;
	b=ZyPMEMfayPdygSxTiKU4ymArODPL2Y96G4h3EM7bYRnKrsQQDmlmWhyc8BJtNE57lv
	sWEedwRaaP+YCWzm2H2AVjVCPFlSgS3LEPfQ4oTcnXK9S23ymggjytWzSaRuI49xsczm
	hFmaGt88GdY7U8br2p9OPgSjf+6RTzoBVZfC7Wa5SpCVWsQGug+ARQpOaV7iG+S0/A/1
	3Giia+/UoX/lX5EPs35/Y0IQPBman+wqeXzfU9r8uu8jgLGpdN+afCJvBsJeIzkLC9e0
	1W7DAJH0YqXWwm6hZsv4DemyxeDptSjEXGpZXGG61S4MAmGCXVDroWeNSu1YV6PLgiW3
	R68A==
X-Gm-Message-State: APjAAAXtUemYfMHjy/PYpdCInRMQo4/jjMytLyHpUquBAAvoUoHv9tZZ
	5bRudOUqPXRzQa90SPPWX1KTQ6e1oftSooCbYIMufg==
X-Google-Smtp-Source: APXvYqz3T+LG6Jz11UEqB+vjd708zBaWZUBNs7RmSlGLUTVzZ+F15mOJNh7dl5zoKRdtvg48/TjekMbfz8kh/jfHF/8=
X-Received: by 2002:a19:41c8:: with SMTP id o191mr1792189lfa.83.1561635292394; 
	Thu, 27 Jun 2019 04:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20180304210937.29727-1-matt@madison.systems>
	<20180304210937.29727-7-matt@madison.systems>
	<5D0C9F8B.8060109@windriver.com>
	<CAGgRHJoXVPEq-L9iHniD9mQtvC3CGq3-jP7NincOx1gVqCps3g@mail.gmail.com>
	<5D1335A3.6060508@windriver.com>
	<CAGgRHJozBOK+JH3uFQ-=utkTk97Gqg0N1yH2vdgC8-z6cQwUNA@mail.gmail.com>
	<5D1465AA.2050401@windriver.com>
In-Reply-To: <5D1465AA.2050401@windriver.com>
From: Matt Madison <matt@madison.systems>
Date: Thu, 27 Jun 2019 04:34:41 -0700
Message-ID: <CAGgRHJqHLmiga8CAj7od2OuqRc2MKcnc0cGuXFc1SgMSOMrGGQ@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 06/13] go.bbclass: ptest cleanup and improvements
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
X-List-Received-Date: Thu, 27 Jun 2019 11:34:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2019 at 11:40 PM Yu, Mingli <mingli.yu@windriver.com> wrote=
:
>
>
>
> On 2019=E5=B9=B406=E6=9C=8826=E6=97=A5 22:00, Matt Madison wrote:
> > On Wed, Jun 26, 2019 at 2:02 AM Yu, Mingli <mingli.yu@windriver.com> wr=
ote:
> >>
> >>
> >>
> >> On 2019=E5=B9=B406=E6=9C=8825=E6=97=A5 20:23, Matt Madison wrote:
> >>> On Fri, Jun 21, 2019 at 2:08 AM Yu, Mingli <mingli.yu@windriver.com> =
wrote:
> >>>>
> >>>> Hi Matt,
> >>>>
> >>>> I noticed your commit is the latest update for go-dep ptest. But the
> >>>> go-dep ptest doesn't work in my environment. I'm trying to figure ou=
t
> >>>> what's wrong is here though I didn't know much about go.
> >>>
> >>> I went back over the commits, and I don't think I did anything with
> >>> go-dep specifically. I can see that the tests are failing for it, and
> >>> it looks like it's because go-dep's test programs make some
> >>> assumptions about the environment.  For one thing, it needs the go
> >>> compiler installed. It also looks like it's expecting some source
> >>> files to be present... in other words, it's not really designed for a
> >>> cross-build setup, with tests run on the cross-built target. It could
> >>> be messy to work around that, and I'm not sure how useful it would be
> >>> anyway, seeing as how go-dep is more of a build tool.  Might be bette=
r
> >>> to just disable ptests for it completely.
> >>
> >> Many thanks Matt for your information!
> >> Did you ever run go-dep ptest?
> >> Go through the run-ptest script for go-dep, it actually runs the
> >> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose
> >> source file is
> >> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go.
> >
> > Yes, I see that.  That main program starts by rebuilding the dep
> > program from source, then runs the tests using that copy of the
> > program, so it's assuming that you're still in a development
> > environment where you can run a full go build.  That's what I meant by
> > it not being designed for a cross-build setup.
> >
> > I've patched the test program to create a symlink to the installed dep
> > program instead of rebuilding, and got further.  You'll need to
> > include 'go', 'git', and 'git-perltools' in the image to get the tests
> > to run. Some of the test cases failed until I set GOCACHE in the
> > environment to point to a valid path; I'm not sure why.  The tests
> > took a long time to run on my qemux86 build, though - at least 30
> > minutes.
>
> Thanks very much for Matt's guide!
>
> I have applied the patch you provide to create a symlink to the
> installed dep program instead of rebuilding and also add go', 'git', and
> 'git-perltools' into the image, but there is no PASS case, all failed as
> attached go-dep_ptest.log.

The device under test needs Internet access to fetch repos from
Github. From the log, it looks like perhaps yours didn't?

>
> BTW, you said you set GOCACHE, what's the valid path do you mean?

Any directory that the user has write access to.  The default is
$HOME/.cache/go-build .

-M

>
> Thanks,
>
> >
> > Here's the patch I applied to use the already-built dep binary.  An
> > alternative approach would be to put everything in place to allow the
> > test program to rebuild the dep binary itself, but that would drive up
> > the time for the test run even further.
> >
> > Regards,
> > -Matt
> >
> > ---
> >   cmd/dep/dep_test.go | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/src/github.com/golang/dep/cmd/dep/dep_test.go
> > b/src/github.com/golang/dep/cmd/dep/dep_test.go
> > index 687eef3a..535ca56d 100644
> > --- a/src/github.com/golang/dep/cmd/dep/dep_test.go
> > +++ b/src/github.com/golang/dep/cmd/dep/dep_test.go
> > @@ -18,13 +18,18 @@ import (
> >   // deletes it after the tests have been run.
> >   // Most of this is taken from
> > https://github.com/golang/go/blob/master/src/cmd/go/go_test.go and
> > reused here.
> >   func TestMain(m *testing.M) {
> > - args :=3D []string{"build", "-o", "testdep" + test.ExeSuffix}
> > - out, err :=3D exec.Command("go", args...).CombinedOutput()
> > + args :=3D []string{"dep"}
> > + out, err :=3D exec.Command("which", args...).CombinedOutput()
> >    if err !=3D nil {
> > - fmt.Fprintf(os.Stderr, "building testdep failed: %v\n%s", err, out)
> > + fmt.Fprintf(os.Stderr, "finding dep failed: %v\n%s", err, out)
> > + os.Exit(2)
> > + }
> > + args =3D []string{"-s", string(out[:len(out)-1]), "testdep" + test.Ex=
eSuffix}
> > + out, err =3D exec.Command("ln", args...).CombinedOutput()
> > + if err !=3D nil {
> > + fmt.Fprintf(os.Stderr, "symlinking dep failed: %v\n%s", err, out)
> >    os.Exit(2)
> >    }
> > -
> >    // Don't let these environment variables confuse the test.
> >    os.Unsetenv("GOPATH")
> >    os.Unsetenv("GIT_ALLOW_PROTOCOL")
> >

