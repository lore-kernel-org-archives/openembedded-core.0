Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA3D7D598
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 17:28:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b1so14944540wru.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 10:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=tmKV2NJkXItWyHWQq4xTWLkh0v/wreFZezv5yvYWTA4=;
	b=ACeq9EDcnOPwKzF9ujZqv5JWcRXnIiu3Ia0GkBAgQXSbW3Tn/mYrhfktRDIT0tuhrY
	zFxhTWA4d8QweJW0oudmOj/5HJhN5OpWCNvuZJj3+O7z4cmrofeAYip7kuORrBLUWynB
	jc4G/p9FdrSFd/UOgl/ybEKybcRaCUvgQa40Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tmKV2NJkXItWyHWQq4xTWLkh0v/wreFZezv5yvYWTA4=;
	b=dOZLPYnPuxPRBIxHWHk6OMYce4azP+blqGzZnH189fg6Xvdu7vDsfRyXOaBw9FTYOd
	L57bAfChKr0oScT5N5Dgy6vZlq5dtuAq0ROG4+0XA35gyrqsRC4528muSeLtvqfLdnXo
	JTON5dE/eatrKG/IGhhmHC+mUd3aHMc5XVJF5yFJRPeh9YJFJE5CDe0/OIpJARBg76R6
	A0uO4xY2VEGRFwKEoXNPlNTSyRWbii7+i1m2sVDS8wnegwOwesAqDmHRdbeiERL1wLSi
	5t79A7RGMBiImgTI4ukY0XLTaOJweMolImjwJESN22PIFWKte0Sf3N0wd/hPBvyl3V1A
	cdHQ==
X-Gm-Message-State: APjAAAUuk2B/VXUAll474ePVLR1QYiTywB9u8t7eie4QAljYmBaP0WcJ
	3siOHiYcPytvBvFvdaugufW52k+OV0w=
X-Google-Smtp-Source: APXvYqy2bKPygySNvKDjCPmQGrBNFFGl2jJB0d8Jui36Jxm/Qr1O6j37qAcI5azNX0wJzj3E8gs7Mw==
X-Received: by 2002:adf:f64f:: with SMTP id x15mr2781048wrp.202.1556126926840; 
	Wed, 24 Apr 2019 10:28:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r9sm18779399wmh.38.2019.04.24.10.28.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Apr 2019 10:28:46 -0700 (PDT)
Message-ID: <f1cbab2b9d878718e45c11d822d7e114197969a0.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 18:28:44 +0100
In-Reply-To: <7bd4040d-0ebf-490f-735d-eb64a16b1dc7@windriver.com>
References: <1541388536-121953-1-git-send-email-changqing.li@windriver.com>
	<1555490306-29097-1-git-send-email-changqing.li@windriver.com>
	<f6e345e417eb8219c0b08ba72ef4e7f6916fdf11.camel@linuxfoundation.org>
	<7bd4040d-0ebf-490f-735d-eb64a16b1dc7@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 24 Apr 2019 17:28:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-18 at 09:59 +0800, Changqing Li wrote:
> 
> On 4/18/19 6:01 AM, Richard Purdie wrote:
> > On Wed, 2019-04-17 at 16:38 +0800, changqing.li@windriver.com
> > wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > > 
> > > 1. since one bug in run-ptest, testcase test-bus have never been
> > > actually run (althrough it's result is PASS).
> > > 
> > > After commit 0828850, test-bus can actually run but it
> > > did not install:
> > >   test-service, test-shell-service, test-segfault, and
> > >   dbus-daemon-launch-helper-test
> > > Add the configure flag:
> > >   --enable-embedded-tests
> > > to generate binary dbus-daemon-launch-helper-test, then install
> > > them so that test-bus will now pass.
> > > 
> > > 2. fix testcase test-dbus-daemon failed
> > > we enable --enable-verbose-mode in recipe dbus-test, and don't
> > > enable it in recipe dbus. This will make below test code get
> > > unexpect result of have_verbose and assert.
> > > disable --enable-verbose-mode for recipe dbus-test to fix it.
> > > 
> > >  #ifdef DBUS_ENABLE_STATS
> > >   g_assert_true (have_stats);
> > >  #else
> > >   g_assert_false (have_stats);
> > >  #endif
> > > 
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > ---
> > >  meta/recipes-core/dbus/dbus-test_1.12.12.bb | 13 ++++++++++---
> > >  meta/recipes-core/dbus/dbus/run-ptest       | 16 ++++++++++++---
> > > -
> > >  2 files changed, 22 insertions(+), 7 deletions(-)
> > 
> > I'm wondering if some of these tests were intentionally not run due
> > to
> > the length of time they take? It takes the dbus-ptest time from 26s
> > to
> > 250+s. Can you see which test that is and why its taking so long
> > please?
> 
> test-bus take most of the time, it include several sub tests. My test
> result:
> all test runed: 
> real    2m59.637s
> user    0m59.494s
> sys    0m41.952s
> skipped test-bus:
> real    0m13.125s
> user    0m12.230s
> sys    0m0.162s
> 
> Previously we don't intentionally skip test-bus,  just because we had
> a bug in run-ptest before,
> so test-bus  accidentally not run,  just return PASS. 
> After below commit fix this bug, test-bus can be runned.
> https://git.openembedded.org/openembedded-core/commit/?id=0828850fd09f738572ae8259384af07eeb81182b
> 
> -for i in `ls test/test-*`; do ./$i ./test/data
> DBUS_TEST_HOMEDIR=./test >/dev/null; output; done
> 
> "DBUS_TEST_HOMEDIR=./test" will take as an argument,  make no sub
> test is runned. 


Ross, do you remember if we intentionally skip this dbus test for
taking around 200s, taking the overall test time from 20s to 220s?

I'm strongly tempted to explicitly disable this test unless someone can
convince me it tests someting critical...

Cheers,

Richard


