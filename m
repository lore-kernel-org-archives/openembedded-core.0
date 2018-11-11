Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 960B66C263
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 21:19:03 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b13so7183857wrx.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2018 13:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vPkOgFhICQa9w/eIGN4FuxydKE857xG+zyaUJptRQUg=;
	b=bKTx3Bjs+0DuqrOVVDGu6fTz+9EmOZeNf0H8Z4t4zxrMenFI6g+4ChWPxnznXmCvxA
	/cXcfB6aZnnpI39uvuDlEalgei24Y8MqBOArT1s4kVRjJS0AzNl+cltlIAPd2HYzN3tE
	9hFZwte3JQEa1kcGxMS0xrd00biYUk8SlhvIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vPkOgFhICQa9w/eIGN4FuxydKE857xG+zyaUJptRQUg=;
	b=hFmYg5v8Bo/tEJROu/yXIzVjIHAgyB/6pF8JZdtYY8ofcKw7NzhZKNfPIHrC//O2Zt
	FngV544XSVbeL2fthk7xlMUrhGRrQYG6s7Ol7bCgnbycFN2r+vaYmgLYs3DpiK3LNrzT
	H9/4zQpUkn/NOzW4L+LLynOsxzlCFiOVLYmxoj/MppZdD/S1MrQ3h7kdd/ur7aLcnCz+
	xPvqL3DxGUq4lCJMwSEE43Psx+A50LxVs/aMn5AFYvZrrRRePuSEuBEBuM0+4nGboXni
	nkFcpx/fn2Z2rYHXdPGyV7XPtN1TDJvqGDJWWmYn38x8lXX7upPHUUbDuF2gxZ/JJ6SM
	YxKA==
X-Gm-Message-State: AGRZ1gLRcoSrqrBEUQkBVC2o12lBCSn+nYqMf0lZV+R5jzwxKoXIdzRJ
	BYRCnAtKkbGvhDaXXQxKz6Wa8A==
X-Google-Smtp-Source: AJdET5dMGUrSPTg0FgHRJaPvhK/yAz8nDrH5xGqaDdeJxhWVUsRNnh1+daX1BfC0VHOz3KjN/AcrAw==
X-Received: by 2002:a5d:498f:: with SMTP id
	r15-v6mr14051349wrq.317.1541971143833; 
	Sun, 11 Nov 2018 13:19:03 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n7-v6sm10325667wrt.60.2018.11.11.13.19.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Nov 2018 13:19:03 -0800 (PST)
Message-ID: <e1af6ef60da366ccc0cc163eb26040e03ee156bc.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Nov 2018 21:18:54 +0000
In-Reply-To: <eb4748cd-d26c-a916-f887-311dd6bbb8fa@gmail.com>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
	<20181109142912.23102-11-richard.purdie@linuxfoundation.org>
	<eb4748cd-d26c-a916-f887-311dd6bbb8fa@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 11/12] testimage: Further cleanup DEFAULT_TEST_SUITES
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
X-List-Received-Date: Sun, 11 Nov 2018 21:19:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-11-11 at 12:52 -0800, akuster808 wrote:
> On 11/9/18 6:29 AM, Richard Purdie wrote:
> > Now the test markup of the development tools tests is complete,
> > this
> > can be further tweaked to auto run the correct tests.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/testimage.bbclass | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/classes/testimage.bbclass
> > b/meta/classes/testimage.bbclass
> > index b00d47441b2..4e9494296e1 100644
> > --- a/meta/classes/testimage.bbclass
> > +++ b/meta/classes/testimage.bbclass
> > @@ -40,12 +40,12 @@ TEST_NEEDED_PACKAGES_DIR ?=
> > "${WORKDIR}/testimage/packages"
> >  TEST_EXTRACTED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/extracted"
> >  TEST_PACKAGED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/packaged"
> >  
> > -BASICTESTSUITE = "ping date df ssh scp python perl apt opkg gi
> > ptest dnf rpm parselogs logrotate connman systemd oe_syslog pam
> > stap ldd xorg"
> > -DEVTESTSUITE = "gcc kernelmodule buildcpio buildlzip
> > buildgalculator "
> > +BASICTESTSUITE = "\
> > +    ping date df ssh scp python perl apt opkg gi ptest dnf rpm
> > parselogs \
> > +    logrotate connman systemd oe_syslog pam stap ldd xorg
> > kernelmodule gcc \
> > +    buildcpio buildlzip buildgalculator"
> 
> Again Nak. You are forcing folks to have x11, systemd etc in the
> "Basic". 

No, I'm not. If the image doesn't have x11 in it, the test will show
"skipped". If the image doesn't have systemd in it, it will show those
tests as "skipped". If you just want to test ptest, you can specify
that, which is what you had to do before this change anyway *just* to
run ptest.

So I'm not really seeing the problem?

The only risk with doing this is that a test may be skipped when it
shouldn't be. The plan is to verify the right set of test results were
obtained when the QA overall results from a release build are compared
against a known list of tests which should have run.

Cheers,

Richard


