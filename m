Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 425666188C
	for <openembedded-core@openembedded.org>;
	Sun,  8 Mar 2020 13:18:21 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g134so7162539wme.3
	for <openembedded-core@openembedded.org>;
	Sun, 08 Mar 2020 06:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=5s5BNPGcT2rLzesaiJbhlahjBstN4UELB1bmis2x9F4=;
	b=IZKlb63X/1AlMGjs1UQz7T3uPNTwNBnA3tP0vuIM/WX5GeGKKfg9Xjze7dfFroTbiM
	HWBCdjYR/s50aAIH34GYgH0tHU2H7OJz9uh0M8A/p7MEzYKCAGQE9wovlMiHkaNPOZdc
	IK0/Ib10E+L1ZraWAVQSD/wrhbym/QVlxLMEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=5s5BNPGcT2rLzesaiJbhlahjBstN4UELB1bmis2x9F4=;
	b=bJyIOqX0igMBTmzTyiVBR021ZDrpWJNGX35n9igPb/k35kIoMI5mPI9T3dguAKDfXB
	IYipSdPi9SJaPYLkZDZ2KnV7fcAlauJ59OGSZcVWJr3G0d9NWDSAyoeWgiLCQjnX3GO5
	g8K4Tn/c3xUxq9c2fZCihlZFS7gzvj8B5SPzV5BnFkuuQUx6vwA56GPAep8xsKQfz2Xo
	F+VXBxMHTqeUCNCOvmS9iYahyzvdTkQzK3okPqG+/5vfalZOmkeeJXjxLqsKNMrpGRyr
	+Nsf4411S4QehCf19e+3Wi8ciGr2S/w+Y/LEUTxBublxQAhhoFuyNETMoJoqJ2nd7tp8
	rweA==
X-Gm-Message-State: ANhLgQ3xiA8aJgaM64Z4pkOuzoIxoeoWqhTm5Vo58unpvGeOUKI5ybz1
	W6R9BQ/tUzx5qO/KNQ6iYuRg+w==
X-Google-Smtp-Source: ADFU+vv/pDeozv2T5v2YNPG1d05xwd5eQq/HcGFNRaixlfRM8RJ7NlpsFN/SvFsX01JmDiWIcS9NOQ==
X-Received: by 2002:a05:600c:24b:: with SMTP id
	11mr14976721wmj.1.1583673500417; 
	Sun, 08 Mar 2020 06:18:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v16sm40169566wrp.84.2020.03.08.06.18.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 06:18:19 -0700 (PDT)
Message-ID: <07697e4e61eec35dc6ca42fd7c0b6694aca036c4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Trevor Gamblin
	<trevor.gamblin@windriver.com>
Date: Sun, 08 Mar 2020 13:18:18 +0000
In-Reply-To: <CANNYZj9ryAAC37rCRvxiT10LKpg1uo27H8GPW_o_qrh3X9Qrtw@mail.gmail.com>
References: <e7b54a7b237a70346379df8483837a6b97ccc73f.camel@linuxfoundation.org>
	<c88b00fa-a513-c0a0-eb30-62cef90f66bb@gmail.com>
	<df13465da1047d41fb47b19c7479a836b8b71245.camel@linuxfoundation.org>
	<babd7ffac5376394f222d6ed21544028ee053369.camel@linuxfoundation.org>
	<CANNYZj9ryAAC37rCRvxiT10LKpg1uo27H8GPW_o_qrh3X9Qrtw@mail.gmail.com>
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
X-List-Received-Date: Sun, 08 Mar 2020 13:18:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-03-08 at 14:08 +0100, Alexander Kanavin wrote:
> On Sun, 8 Mar 2020 at 09:15, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > This is now closer. Alex fixed the libmodule-build-perl and gettext
> > reproducibility issues (thanks!), I tracked down a glibc issue and
> > procps one I saw locally. On a fresh autobuilder run we saw:
> > 
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200307-mk0v6ljq/packages/diff-html/
> > and
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200307-5pvgdd3a/packages/diff-html/
> > 
> > which I believe is the remaining blocking issue on coreutils-ptest.
> 
> Not quite. The coreutils-ptest itself seems to persistently fail
> here:
> 
> AssertionError: Failed ptests:
> {'coreutils': ['tests/tail-2/assert.sh']}
> 
> so I'd like to have that fixed before it goes in. We have a 100%
> ptest pass rate now (except for random timing fluctuations), which I
> don't want to see regressed :)

I agree that would be nice and something we need to do before release,
I may let us sort that one test in M4 to enable the M3 build, I have to
take a pragmatic approach to this.

That said, there is a more pressing issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1686

which is somehow seemingly related to the coreutils change, I just
can't see how as yet :/

(as well as the gcc-plugin reproducibility issues)

Cheers,

Richard


