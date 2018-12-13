Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA146BDEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 17:10:06 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id j2so2815566wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 09:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=8lkEcM3nrh8LyCnHKZTnk6IBU5WY8A3gKik/+mSRvKE=;
	b=HEfBjPt7BnlxkGrrd/dDl3+Yyu4hxJhHQUEOr/71AqBaRfjYeUMv23CoU23+qIxpec
	o6FX5C5XAp/ti/nVUb8jh7dWWM4sCvBcovhUIS1gdFp8saVDx1RLuJMdECiNktCr3Zp3
	HsY0eJ8qIMM9M6KTPFYvvws+shbm1jZc59XlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8lkEcM3nrh8LyCnHKZTnk6IBU5WY8A3gKik/+mSRvKE=;
	b=WhFKMj9edUU2OZDFI8ffVVdTzVODro3mAm2R5aib/Jw31B87A4b3jWp8gpKHiZJ9zs
	Hcb5Td2xBliMvF1e2S5RXcD+L5JBAQnhcLid9mlOptsJ4/HKhVUNjz/fFGRmY28o3UWT
	OmxAx9G2R9Tcv+fq6VBNGC7xz/oPUOLYAurr4+VYM9V00BSTxO7uA2PmGr4/ww8Bc1yu
	6r7xtzxwlhstaVYkagyIqOvjnGzUbTOqpChNYz1R7CeERdU2w3JMu1LEBzHP6XMBXK9Q
	pAUjCpABPwZLtxkTemJRzo0KhczZszLKzk2CGWcLatalSZeO2kvyC2yVQtkryafzVa2m
	JcZw==
X-Gm-Message-State: AA+aEWYBexErjnt2c8OiM+fhOpaZtujcif+T0mshGnYma11eNKBwjTju
	PgypatAqtTL/J5/Wcwi7iqAUBw==
X-Google-Smtp-Source: AFSGD/WATAgMjA94jfXlMpdnX1YL9iEEJVtJaSinzFVGHFggWlF4931hJxU+9OQP5k//DdlY8TnVEw==
X-Received: by 2002:adf:a4d9:: with SMTP id h25mr20697627wrb.167.1544721006853;
	Thu, 13 Dec 2018 09:10:06 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m15sm2094007wrr.95.2018.12.13.09.10.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Dec 2018 09:10:06 -0800 (PST)
Message-ID: <881be0d2f140d2995f55281c17fb5fab3b5e73e0.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 13 Dec 2018 17:10:04 +0000
In-Reply-To: <CAPybu_2uF6YPM+74Afne3_NPJg8LCdaF3BsgdR=yjQJRUO6i9w@mail.gmail.com>
References: <CAPybu_0YGwMPD1N4kfN0KUb6snAowee6MfN2+tJNVaHqrUddrA@mail.gmail.com>
	<17edc46703e7423f1a730bdea6cc3f0e1877d9d6.camel@linuxfoundation.org>
	<CAPybu_2uF6YPM+74Afne3_NPJg8LCdaF3BsgdR=yjQJRUO6i9w@mail.gmail.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Multiconfig and native recipes
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
X-List-Received-Date: Thu, 13 Dec 2018 17:10:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-13 at 17:41 +0100, Ricardo Ribalda Delgado wrote:
> Hi Richard
> 
> Thanks for your fast response
> On Thu, Dec 13, 2018 at 5:19 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2018-12-13 at 16:19 +0100, Ricardo Ribalda Delgado wrote:
> > You haven't said how your configurations were different.
> > 
> > With multiconfig you have to use it responsibly and a little
> > caution.
> > 
> > It sounds like you're using the same TMPDIR for these builds but
> > the
> > builds are differently configured. That wouldn't be expected to
> > work.
> > The builds can only share TMPDIR if the configurations are
> > compatible
> > with each other (same DISTRO type config, different MACHINE for
> > example).
> > 
> 
> That is exactly my usecase. I wan to build for all the machines with
> exactly the same distro:
> 
> ricardo@neopili:~/curro/yocto/europa/build$ for a in
> conf/multiconfig/*; do echo $a; cat $a; done
> conf/multiconfig/inteli7.conf
> MACHINE = "inteli7"
> conf/multiconfig/qt5022.conf
> MACHINE = "qt5022"
> conf/multiconfig/qt5506.conf
> MACHINE = "qt5506"
> 
> I am now trying to hack bitbake/lib/bb/cooker.py to convert all tasks
> multiconfig:*:AAAAA-native into AAAAA-native
> it might not be the final sollution, but maybe we can use it to
> discuss further options.

Rather than hacking this, I'd suggest you look at why it thinks it
needs to run this native target three times.

In a normal build, if you select one of the machines, "bitbake erlang-
native", then change machines and run the same command, does it
rebuild?

If so, the task hashes are different. The next thing to do would be to
run bitbake-diffsigs and find out why they're different.

There are signature tests in oe-selftest which will find similar
problems like this, assuming I'm guessing at the problem correctly.

Cheers,

Richard



