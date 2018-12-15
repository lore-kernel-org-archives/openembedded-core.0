Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E6AF76C4CF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 11:00:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a62so7932788wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 03:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=kb5/AoXLKhAxilZBm22QsQw8ntetajncwK0eePvlYXc=;
	b=RtTqofu6eom4RPQIjQLr+/OFICMSfX+0mJ5eobLZJVHMyT9bKsaGkSkC3l6LBNBHJe
	h6fhKmA2BPCNCX+gqAP6D7bqapt5SM7iIriQdf7WXRC02Az/20GDervN7KXqnt/MTzj4
	H9fpweyTQQR7xie89ZfZE5pjw+haWMCD/+8sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kb5/AoXLKhAxilZBm22QsQw8ntetajncwK0eePvlYXc=;
	b=SUholnHXwSSvFvcrHZtcAKuVU/M/rctrrH4MFNNlECD8b9iMnVUj1BTHw3jRhIpxC8
	vEZihxip231hKKOgcsuzl+dqaqNZ0zj1swdVHyRPTF10M6KZ9zqx9jbt4Cq5d0ixPMUy
	I3TkdVgffe/PZ30FrX8/XbZl/thNR7HDH4fd7TqFLaB7uggypjfcYLM7yMYfoi6+UhHj
	CAMjY6WIO+Z8p0Q+WERAs3t3U+zi7ibm6HToyCiNi8H8OnkRWmgvuET+zu2rX3gfiAHL
	4JJ7+f6tQeziBoZBQ1ffucq+NQ7IhhcJPWcXQAZI5kfTzQMPtukE7TlyuFZBGz160Cpq
	qrsA==
X-Gm-Message-State: AA+aEWZbOOjTWH59zgP1m3lT5OJTKN1nqj/XIxGMc346aCwTEBlEiGqi
	28j2RldL1LQUtfwAISrxAV9rLA==
X-Google-Smtp-Source: AFSGD/WKMpFYZJknEQedmbt3zF8yUz67izXpxuP5QcEibN410fdre2IE0G8/O8NDPyENCHZKCPO+Pw==
X-Received: by 2002:a1c:868a:: with SMTP id i132mr5783865wmd.49.1544871628546; 
	Sat, 15 Dec 2018 03:00:28 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	60sm10764414wrb.81.2018.12.15.03.00.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 15 Dec 2018 03:00:27 -0800 (PST)
Message-ID: <abe4d45b54c8d323e8d2f04ea01d04367a19beb2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, serhe.popovych@gmail.com
Date: Sat, 15 Dec 2018 11:00:26 +0000
In-Reply-To: <CAJ86T=XQqr-3Jgg1xMPkHz0Qx_KwPxpv3d8xoeKuR5YcP-o00w@mail.gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<1544810082-22164-8-git-send-email-serhe.popovych@gmail.com>
	<CAJ86T=XQqr-3Jgg1xMPkHz0Qx_KwPxpv3d8xoeKuR5YcP-o00w@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/13] musl: Ensure GLIBC_LDSO symlink target does not exist on reinstall
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
X-List-Received-Date: Sat, 15 Dec 2018 11:00:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-14 at 11:09 -0800, Andre McCurdy wrote:
> On Fri, Dec 14, 2018 at 9:57 AM Serhey Popovych
> <serhe.popovych@gmail.com> wrote:
> > Otherwise do_install task will fail on rebuild.
> > 
> > Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-
> > core/musl/musl_git.bb
> > index 9cc875c..4593cde 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -61,7 +61,7 @@ do_install() {
> >         oe_runmake install DESTDIR='${D}'
> > 
> >         install -d ${D}${bindir}
> > -       rm -f ${D}${bindir}/ldd
> > +       rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
> 
> The correct fix here is actually to remove this line entirely. The
> official ruling is that there should be no expectation that re-
> running do_install should work and patches to make it work are not
> acceptable.
> 
>   
> http://lists.openembedded.org/pipermail/openembedded-core/2018-September/273723.html

Lets be clear, re-running the do_install task *is* supported and works
today. It is actually meant to work when re-run. do_install clears out
${D} at its start so we can assume in do_install functions that it is
empty at the start of the function.

The only problem may be if you're manually re-running the do_install
script in WORKDIR/temp. If you're doing that, you have other problems
like the missing fakeroot environment to handle so the non-empty
directory is only one minor issue, you're missing other setup pieces as
well.

Cheers,

Richard




