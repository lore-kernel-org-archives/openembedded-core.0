Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0A57F426
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 15:24:09 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r195so7567710wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 08:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=aY2sstAkPSXI8auSrldgWMTNOs/cpa2wv9lt811rSBM=;
	b=ft33fg9slNIj9fbKdKoYI7fezJJBI7qEU1CRqCkHA4PwuEVtiaU9Cby8tjPBHh/Drw
	ZG2JlXBwkRxJ+7BxhGrrBhwwChaFFPTJHIxbcgbgor5KL4Gt1byW1Qc42n+A2Zy14r68
	6uUXNdXSnq8xYm3cO9aNMimKd+AxbJ1JLx4Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=aY2sstAkPSXI8auSrldgWMTNOs/cpa2wv9lt811rSBM=;
	b=ecBa+b9v/o9Xn1DglldROvpw+GLo552zIvuUBJdWmH0PXoo9lD70jeWjqzbTFqjeoW
	LAll08kOW1FYWX87JYsQ1auANzWInmzboFJI5Iz2mtKxAxihC1VT/sigOSkWbp0mr7Vq
	1TpWjtz90KxkLtU525Nsw+OP5vSRaWZ1b7wzubg4SdGLeaYU2XwOfN3wrp++rB4ZbE1U
	3bktjrzh9KaoHiZ8a44oAZtBxAlxrNtzVjRUdep6Z6U+Xu6QmA4oDQTjfsx0YeTgJ+0v
	PFtgtVjgP61KJyWXCbwLqWRDNdxIxJAuxf30luuevy/QtxKxvB9hLDSjkj8AKYjpawWX
	AnAw==
X-Gm-Message-State: APjAAAVq0Vnv0mctSxggUIwQZOLjwfxLATm8usF5QqQ/mQsJNr1S5vjq
	yI8hcwlQbg8U/gMx8U6x/6dw1Q==
X-Google-Smtp-Source: APXvYqyszPCSW+0e4jScMa4uNaCk8XuhJcggPnDOetXiO3eFEYsETve6JxVnZb3L6TUjFZGQ1W69Fw==
X-Received: by 2002:a1c:7ec4:: with SMTP id z187mr3160205wmc.94.1567783449933; 
	Fri, 06 Sep 2019 08:24:09 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y3sm8456194wra.88.2019.09.06.08.24.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 08:24:09 -0700 (PDT)
Message-ID: <b61dc3ff2a7e061bf78a2b2c97022e92bf7fff24.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Sep 2019 16:24:06 +0100
In-Reply-To: <9f2cad3d-cf89-d9da-025c-ea3e5168b5e2@windriver.com>
References: <20190906140443.30110-1-Trevor.Gamblin@windriver.com>
	<d1e5a94c07b6298a2c5d5041de7910e935eea06d.camel@linuxfoundation.org>
	<9f2cad3d-cf89-d9da-025c-ea3e5168b5e2@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] libevent: add granularity to ptest
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
X-List-Received-Date: Fri, 06 Sep 2019 15:24:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-09-06 at 11:10 -0400, Trevor Gamblin wrote:
> On 9/6/19 10:26 AM, Richard Purdie wrote:
> > On Fri, 2019-09-06 at 10:04 -0400, Trevor Gamblin wrote:
> > > From: Trevor Gamblin <trevor.gamblin@windriver.com>
> > > 
> > > The libevent ptest used to report only a global pass or a fail
> > > result.
> > > Count individual PASS, FAIL, SKIP results. The SKIP results now
> > > include tests that are disabled in the libevent code.
> > > 
> > > Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> > > ---
> > >  .../libevent/libevent/run-ptest               | 34 ++++++++++++-
> > > ----
> > > --
> > >  1 file changed, 22 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/meta/recipes-support/libevent/libevent/run-ptest
> > > b/meta/recipes-support/libevent/libevent/run-ptest
> > > index 0241851c70..b7d945246f 100644
> > > --- a/meta/recipes-support/libevent/libevent/run-ptest
> > > +++ b/meta/recipes-support/libevent/libevent/run-ptest
> > > @@ -1,18 +1,28 @@
> > >  #!/bin/sh
> > >  
> > > -fail=0
> > > +# run-ptest - 'ptest' test infrastructure shell script that
> > > +#   wraps the libevent test scripts 
> > > +#
> > > +# Trevor Gamblin <trevor.gamblin@windriver.com>
> > > +###############################################################
> > > +LIBEVENTLIB=/usr/lib/libevent
> > > +LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-
> > > %H%M%S).log"
> > > +
> > > +cd ${LIBEVENTLIB}/ptest 
> > > +
> > >  for test in ./test/*
> > >  do
> > > -	$test
> > > -	if [ $? -ne 0 ]
> > > -	then
> > > -		fail=1
> > > -	fi
> > > +    $test 2>&1|tee -a ${LOG}
> > >  done
> > >  
> > > -if [ $fail -eq 0 ]
> > > -then
> > > -	echo "PASS: libevent"
> > > -else
> > > -	echo "FAIL: libevent"
> > > -fi
> > > +passed=`grep OK ${LOG}|wc -l`
> > > +failed=`grep FAILED ${LOG}|wc -l`
> > > +skipped=`grep -E 'DISABLED|SKIPPED' ${LOG}|wc -l`
> > > +all=$((passed + failed + skipped))
> > > +
> > > +(   echo "=== Test Summary ==="
> > > +    echo "TOTAL: ${all}"
> > > +    echo "PASSED: ${passed}"
> > > +    echo "FAILED: ${failed}"
> > > +    echo "SKIPPED: ${skipped}"
> > > +) | tee -a ${LOG}
> > 
> > Does this work correctly such that ptest-runner picks up the
> > individual
> > test pass/fail results? I thought the tests would need individual
> > pass/fail lines for that to work?
> > 
> > Cheers,
> > 
> > Richard
> > 
> > 
> 
> They do have individual pass/fail results in the ptest-runner output,
> but those don't match up with the pass/fail usually provided by
> ptest, so the log is parsed for OK/FAILED/SKIPPED/DISABLED and
> translated. Example output:
> write_cb: write 12
> write_cb: write -1
> === Test Summary ===
> TOTAL: 316
> PASSED: 300
> FAILED: 0
> SKIPPED: 16
> DURATION: 87
> END: /usr/lib/libevent/ptest
> 2019-09-06T14:50
> STOP: ptest-runner
> Compare with the last log from autobuilder (
> https://autobuilder.yocto.io/pub/non-release/20190829-10/testresults/qemux86-64-ptest/libevent.log
> ):
> write_cb: write 12
> write_cb: write -1
> FAIL: libevent
> DURATION: 116
> I'm working on a v2 to address multilib - I'll add the example output
> to the commit as well.

You're missing my point. There are log parsers such as:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/lib/oeqa/utils/logparser.py

The output has to follow the format in:

https://wiki.yoctoproject.org/wiki/Ptest

to quote it:

"""
One major point of ptest is to consolidate the output format of all
tests into a single common format. The format selected is the automake
"simple test" format:

result: testname

Where "result" is one of PASS, FAIL or SKIP and "testname" can be any
identifying string (the same format used by Automake.) 
"""

which is why you'll see other run-ptest scripts using sed to add in
PASS/FAIL/SKIP strings.

I think the PASSED/FAILED counts are generated by ptest-runner itself.

Cheers,

Richard




