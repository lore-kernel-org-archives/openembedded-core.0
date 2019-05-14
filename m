Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D55007C87F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 21:32:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c5so337182wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=19Vb98wAQigDZ4tq4WRTVQNjoBfgiyiylQXO/uHidh8=;
	b=NQEA1Mu3bvGcClbbM1KSDBlIXs1gUgKzUARdMYv0pS3h81mPbsHHH1IgnTykzokFnU
	QJUgzvJf109J5MRgqNCiy5YbX1/Y95LasjK7zBGP1gaknvSwkV3VQtDFYD0LNRIaQ7RK
	gI+8yCag0Y3QGWJy1v6R+dqtstLvJstljrS7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=19Vb98wAQigDZ4tq4WRTVQNjoBfgiyiylQXO/uHidh8=;
	b=cIFEMEVoEv2vtq/Ajsf0BV83w7oOr+K8crJg9hh2bO12sW6kjCf4+TjK0iysER1wSu
	ljIXwJuKw90n+Argn+38q3KJ2IqYh9NTt0riT6q6o2N+RrzfDoTqjdqbaHLX9GNPm6YV
	81/Vt5eRD//Scth3LKXd+4xEgc5fufLkZcINXwx4r5P/BTbDcdahMuUibwugDRXPC9jS
	AIfxN4JcVROOezYFRKQJXSpSWrjBJ4r4Z4q120cwYXai9c2T9veh14f+riAX1ZnbD/47
	+ksV1pom8EZv1g9yL7PO6I3r1nRa+GoXiexFp8ai0MvlRjaNJbBTSJDslEXvY/v9Oi01
	kVTw==
X-Gm-Message-State: APjAAAX/SnWWUny3+T5xXHxkVC5mahrqQkhHF25pLXyRuB594PtdJPr1
	evAziNQUdVlktRmsEFp8OwZ+ZA==
X-Google-Smtp-Source: APXvYqxua7tIExy9D8+VtOgrLdVKereRge/NawEH7rSKcgYsVilf6mYlL1dv304DyyXuVsdxFLbzOw==
X-Received: by 2002:a5d:430f:: with SMTP id h15mr5291363wrq.132.1557869531580; 
	Tue, 14 May 2019 14:32:11 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id h14sm65956wrt.11.2019.05.14.14.32.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 14 May 2019 14:32:10 -0700 (PDT)
Message-ID: <19e3463fcf6a41f0c35b7227760bd1f2cf6aeac5.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-core@lists.openembedded.org, "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 May 2019 22:32:08 +0100
In-Reply-To: <8f1030b6-b831-7ac8-88e3-1208272d7533@windriver.com>
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
	<20190514035716.27376-2-Randy.MacLeod@windriver.com>
	<4588fa927b2e10223bab39d65aab4184db783f49.camel@linuxfoundation.org>
	<8f1030b6-b831-7ac8-88e3-1208272d7533@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] valgrind: do not strip the package or ptests
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
X-List-Received-Date: Tue, 14 May 2019 21:32:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-14 at 13:54 -0400, Randy MacLeod wrote:
> On 5/14/19 10:08 AM, Richard Purdie wrote:
> > On Mon, 2019-05-13 at 23:57 -0400, Randy MacLeod wrote:
> > > About half the ptests will fail if the executables deployed
> > > as part of the ptest package are stripped. Currently
> > > there is no easy way to only strip the main valgrind
> > > package so leave it and the ptests *all* unstripped.
> > > 
> > > There is an enhancement filed to enable wildcard stripping:
> > >     https://bugzilla.yoctoproject.org/show_bug.cgi?id=13343
> > > so this recipe can be fixed once that is implemented.
> > > 
> > > Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> > > ---
> > >   meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > 
> > I did test whether we could get away with a dependency on valgrind-
> > dbg
> > as in theory that should behave the same way. It doesn't which
> > means
> > the debug symbol linkage isn't being honoured by valgrind and that
> > is
> > something we need to look into too :/.
> 
> I tried that as well. When it didn't work and I couldn't find an
> example that used that sort of dependency, I looked for other
> solutions
> and ended up with the admittedly poor one here which only has the
> one benefit that it works. ;-)

Actually, my test was flawed. I just retested and this time it worked.
What I tested with was:

RDEPENDS_${PN}-ptest += " sed perl perl-module-file-glob ${PN} ${PN}-dbg"
INSANE_SKIP_${PN}-ptest = "debug-deps"

Can you see if that works for you?

We also have a problem that its overflowing the 4GB limit on some image
sizes with the debug info included :/

Cheers,

Richard


