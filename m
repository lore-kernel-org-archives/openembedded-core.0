Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD097DB86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 13:35:11 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id k64so4701002itb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 06:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=av5v7djp6HGTxMNcq7qk7Hf9Hd5h6HvLCVDyrjC0RdM=;
	b=vuAGr4E8m4p2+v6PlEqTNF0cSN+6BHjV3Dc3YZ14pLIjnNEBcV1mhsPqVoGHZ6rt4e
	8NTjb+lU8uht4ROP3OerCgD5r1YdE8AoQ7OY9IFGbChTuNZOH0aG1NSYS9XTNie4LDzC
	j/ScfBnbsW7a9VIWHHekCTlo62K8VDCtSyhHB4qNjiqnWg3YUcxbXzNi79fklAywjUyI
	3digmsRRx9rJ9SLogNvGgG9HVuFgZJrl9pd8GReY8Mu0BaXAA45rfFbapUjavXvRB1RX
	5HD+90fh9qzfV9QvA5psU487TsFrXd6e/nW7agdXUzbwTvEH1reQ+ZmJaqBQqvItSWjg
	gxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=av5v7djp6HGTxMNcq7qk7Hf9Hd5h6HvLCVDyrjC0RdM=;
	b=QQOfEFXe0Z8/q63g1Al3YiUN9fe3V7T3hcMDolFyV20lFWYimdeR6Prx1PbyxpPbSU
	uZOOiCbcDWkwSej0/FeG8JkztzkALvMOiOLaJWYxm0wuvt9GHMPihjysImrrHC/Yw9z3
	Ptf0UYttl2Jec+h2rYeGujtqZuE2FRdQIV6Fd+2AbD3A5JvhWMqU289H0uwnm4S2UpYb
	x5Nn2IUxE3yhxLUje9AU34sMTp5PIWMcq9nWTX3cnSAizHI30l42lnh2X17XbLWeh5HO
	7w1Q4V6/sqQXMNwfl01gmDdLDGW9TKF/aFNUUqV/M1/kBEf6h0rrUbyuIcdUx8HBA+it
	6iTw==
X-Gm-Message-State: APjAAAUx5sj2Uonr9Bdbqnpi7p87m2g5oXLxazCtPyHgL8nhkep72/6P
	uZEiGJyPC2yPLCCOoXvj2CIRcvNzy2V0VvzcWfir8Q==
X-Google-Smtp-Source: APXvYqw7ILG2mo5hV/8PAVT37+oCXCo3qDelFCWgRxRnQPB35Nop52XJRB/79ZeTX+zmlxhCWvMHeweI03vdyx7N+NM=
X-Received: by 2002:a05:660c:111:: with SMTP id
	w17mr3421962itj.62.1556631312319; 
	Tue, 30 Apr 2019 06:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <1541388536-121953-1-git-send-email-changqing.li@windriver.com>
	<1555490306-29097-1-git-send-email-changqing.li@windriver.com>
	<f6e345e417eb8219c0b08ba72ef4e7f6916fdf11.camel@linuxfoundation.org>
	<7bd4040d-0ebf-490f-735d-eb64a16b1dc7@windriver.com>
	<f1cbab2b9d878718e45c11d822d7e114197969a0.camel@linuxfoundation.org>
In-Reply-To: <f1cbab2b9d878718e45c11d822d7e114197969a0.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Apr 2019 14:35:01 +0100
Message-ID: <CAJTo0LYye1JWths-jDB87CdGPbAiudTt5H8VJ39+TeO-XZWHMg@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4] dbus: fix ptest failure
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
X-List-Received-Date: Tue, 30 Apr 2019 13:35:11 -0000
Content-Type: text/plain; charset="UTF-8"

test-bus sounds like it actually tests the bus, which is useful.  If
it actually passes now then I'd say we keep it.

Ross

On Wed, 24 Apr 2019 at 18:28, <richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-04-18 at 09:59 +0800, Changqing Li wrote:
> >
> > On 4/18/19 6:01 AM, Richard Purdie wrote:
> > > On Wed, 2019-04-17 at 16:38 +0800, changqing.li@windriver.com
> > > wrote:
> > > > From: Changqing Li <changqing.li@windriver.com>
> > > >
> > > > 1. since one bug in run-ptest, testcase test-bus have never been
> > > > actually run (althrough it's result is PASS).
> > > >
> > > > After commit 0828850, test-bus can actually run but it
> > > > did not install:
> > > >   test-service, test-shell-service, test-segfault, and
> > > >   dbus-daemon-launch-helper-test
> > > > Add the configure flag:
> > > >   --enable-embedded-tests
> > > > to generate binary dbus-daemon-launch-helper-test, then install
> > > > them so that test-bus will now pass.
> > > >
> > > > 2. fix testcase test-dbus-daemon failed
> > > > we enable --enable-verbose-mode in recipe dbus-test, and don't
> > > > enable it in recipe dbus. This will make below test code get
> > > > unexpect result of have_verbose and assert.
> > > > disable --enable-verbose-mode for recipe dbus-test to fix it.
> > > >
> > > >  #ifdef DBUS_ENABLE_STATS
> > > >   g_assert_true (have_stats);
> > > >  #else
> > > >   g_assert_false (have_stats);
> > > >  #endif
> > > >
> > > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > > ---
> > > >  meta/recipes-core/dbus/dbus-test_1.12.12.bb | 13 ++++++++++---
> > > >  meta/recipes-core/dbus/dbus/run-ptest       | 16 ++++++++++++---
> > > > -
> > > >  2 files changed, 22 insertions(+), 7 deletions(-)
> > >
> > > I'm wondering if some of these tests were intentionally not run due
> > > to
> > > the length of time they take? It takes the dbus-ptest time from 26s
> > > to
> > > 250+s. Can you see which test that is and why its taking so long
> > > please?
> >
> > test-bus take most of the time, it include several sub tests. My test
> > result:
> > all test runed:
> > real    2m59.637s
> > user    0m59.494s
> > sys    0m41.952s
> > skipped test-bus:
> > real    0m13.125s
> > user    0m12.230s
> > sys    0m0.162s
> >
> > Previously we don't intentionally skip test-bus,  just because we had
> > a bug in run-ptest before,
> > so test-bus  accidentally not run,  just return PASS.
> > After below commit fix this bug, test-bus can be runned.
> > https://git.openembedded.org/openembedded-core/commit/?id=0828850fd09f738572ae8259384af07eeb81182b
> >
> > -for i in `ls test/test-*`; do ./$i ./test/data
> > DBUS_TEST_HOMEDIR=./test >/dev/null; output; done
> >
> > "DBUS_TEST_HOMEDIR=./test" will take as an argument,  make no sub
> > test is runned.
>
>
> Ross, do you remember if we intentionally skip this dbus test for
> taking around 200s, taking the overall test time from 20s to 220s?
>
> I'm strongly tempted to explicitly disable this test unless someone can
> convince me it tests someting critical...
>
> Cheers,
>
> Richard
>

