Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5D9601F9
	for <openembedded-core@openembedded.org>;
	Sun,  8 Mar 2020 14:34:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v2so7834684wrp.12
	for <openembedded-core@openembedded.org>;
	Sun, 08 Mar 2020 07:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=URnbsCmnln5NFNThlEK0kid4ms9ZWHYxP/pEwxppQOk=;
	b=LLbTpEf6BnR8WZ2D9rcBZitAgOBuVSGzo5jWZC50U4eytVJpl/BygXesTAspVMzWQF
	eN2A4p4wDn3d9NI8jHM+DGfyYqIVEfZVyuOdY65jw5v1H4eyybSYAkmDceDtAPec658Q
	LWQBW/+BTFejLb7fGCJ9uSTd4IwPWJwOfxoag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=URnbsCmnln5NFNThlEK0kid4ms9ZWHYxP/pEwxppQOk=;
	b=BrIvfXpJ8qP+wBpKL12B1Vnt7BxZ06wbqcX6sZtsR8HzWFxmhh18rQuQMt3R5MTYjF
	VW2teXExHQvNIXCcsz8Zbq/TnUFGPFmC9zMzuYQNl9xBi41+HF0+vRv6DEeLn1jw3TFx
	VX4xa1Wk9/5N9NYU0k/ozGAPDY8BIw70M1GyjUFPBZRzgyrZtTC24GLJmnI6mUOIYt6f
	Ass1s6vNuy72HpCCAaKjcRBFsnh9JyxYi/zcGeasl+lkbcp+sK4uihUqDogXiVyOlVxX
	oXfoRyI13V53wF2QLXcTnzj0n5uZrXpySuHfVomPQk51Skouj2hDImqDkj44M687Tb/J
	2+OA==
X-Gm-Message-State: ANhLgQ2V1aIAp8jOooa8R2gwfNAzZfNT8/DbV7IJtlZjBZSIfB6e6FdM
	8u++IrhOpfU91s7kzCFK2c6tww==
X-Google-Smtp-Source: ADFU+vtZgaozexFsnrlprFIEpQXSXEIxR5oLXafj/N7JfBntovISE7hUe64CFZigXXLKuCtJOZVCMg==
X-Received: by 2002:adf:f70f:: with SMTP id r15mr15640044wrp.269.1583678084572;
	Sun, 08 Mar 2020 07:34:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j205sm21709699wma.42.2020.03.08.07.34.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 07:34:43 -0700 (PDT)
Message-ID: <d2d3ad268f75dacaf4061ba4dc537a22bda6bd65.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Trevor Gamblin
	<trevor.gamblin@windriver.com>
Date: Sun, 08 Mar 2020 14:34:42 +0000
In-Reply-To: <07697e4e61eec35dc6ca42fd7c0b6694aca036c4.camel@linuxfoundation.org>
References: <e7b54a7b237a70346379df8483837a6b97ccc73f.camel@linuxfoundation.org>
	<c88b00fa-a513-c0a0-eb30-62cef90f66bb@gmail.com>
	<df13465da1047d41fb47b19c7479a836b8b71245.camel@linuxfoundation.org>
	<babd7ffac5376394f222d6ed21544028ee053369.camel@linuxfoundation.org>
	<CANNYZj9ryAAC37rCRvxiT10LKpg1uo27H8GPW_o_qrh3X9Qrtw@mail.gmail.com>
	<07697e4e61eec35dc6ca42fd7c0b6694aca036c4.camel@linuxfoundation.org>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@openembedded.org>
Subject: Re: M3 build status
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
X-List-Received-Date: Sun, 08 Mar 2020 14:34:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-03-08 at 13:18 +0000, Richard Purdie wrote:
> On Sun, 2020-03-08 at 14:08 +0100, Alexander Kanavin wrote:
> > On Sun, 8 Mar 2020 at 09:15, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > This is now closer. Alex fixed the libmodule-build-perl and
> > > gettext
> > > reproducibility issues (thanks!), I tracked down a glibc issue
> > > and
> > > procps one I saw locally. On a fresh autobuilder run we saw:
> > > 
> > > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200307-mk0v6ljq/packages/diff-html/
> > > and
> > > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200307-5pvgdd3a/packages/diff-html/
> > > 
> > > which I believe is the remaining blocking issue on coreutils-
> > > ptest.
> > 
> > Not quite. The coreutils-ptest itself seems to persistently fail
> > here:
> > 
> > AssertionError: Failed ptests:
> > {'coreutils': ['tests/tail-2/assert.sh']}
> > 
> > so I'd like to have that fixed before it goes in. We have a 100%
> > ptest pass rate now (except for random timing fluctuations), which
> > I
> > don't want to see regressed :)
> 
> I agree that would be nice and something we need to do before
> release,
> I may let us sort that one test in M4 to enable the M3 build, I have
> to
> take a pragmatic approach to this.
> 
> That said, there is a more pressing issue:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1686
> 
> which is somehow seemingly related to the coreutils change, I just
> can't see how as yet :/
> 
> (as well as the gcc-plugin reproducibility issues)

Caused by the new libmodule-build-perl which depends upon build-
essential and hence gcc which isn't target multilib 'safe'.

If we could stop the -ptest package dependencies leaking to -dev we'd
avoid this.

Cheers,

Richard



