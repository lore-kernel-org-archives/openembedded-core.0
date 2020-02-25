Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 40F6E6182B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 14:07:43 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g3so14840186wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 06:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ILW72e89NhLhezidEzbHAaHdGbYOyBHRFKQHihBNSLw=;
	b=abOqnZahxAl7fGDmhd6K2bMnAZdRNmvNUDnDyeEIZMzWBjaJxukk4P/uwKpOShL8TL
	59RbrsqcfWI0bJq0C9d4cOMnGe233Q74pyJhwKxgsLoHxNAgIfrvtx+my0Ea8vEt8nH7
	CL23841HToCE9pF3j6OVo2koehsVyHCco7B1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ILW72e89NhLhezidEzbHAaHdGbYOyBHRFKQHihBNSLw=;
	b=X6hiIJYMTWurZ2eTLFUdeRzRetEtFKkpXzKYG9w+bSjp4pVIo2Go9Sbtx2PD5Yli9i
	wBTnmuMhbNv0RY+PmZisvQGLjcIf/Hh04I+ueUV3/xt/1UO16I5e6Nnh6Nh/8JTWpiJ4
	+HuBezkPEGtR/McAfv2ZtTcXdf3xOVpDanqhoPgVPPT6OMfbYgQbltqknPDKLkf6i+Od
	lXU+DUHFtL3E44dntrq68tQQNuzunC3mWWOyjipz7YWuq3UKh06JCVZXIMpXqDXstV4i
	KQsw34SIwT6V90Xag9/AeYnueRyCElFZzolDdnC+h7sjr0hiEEOkooFEqOjWPTdesEQm
	tkzw==
X-Gm-Message-State: APjAAAWopAnussnltTrdfEalCOblGdjBCHlNNgP2iGB5FukK2NNSYYPe
	mX1BVxkcXelRr5y3ceUT4oTZvQ==
X-Google-Smtp-Source: APXvYqw4xxv24EFR+b7JEfJIhD5SWC5HX+sjt9upN8u5LvDV8Mx35W1qKTLf4oEsFkZ+I+0UIhfqDw==
X-Received: by 2002:a5d:6690:: with SMTP id l16mr9282046wru.251.1582639663872; 
	Tue, 25 Feb 2020 06:07:43 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q12sm8810431wrg.71.2020.02.25.06.07.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 06:07:43 -0800 (PST)
Message-ID: <0a3ecc0796a2737d8396d39c38bb08b2331ef08b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Date: Tue, 25 Feb 2020 14:07:41 +0000
In-Reply-To: <CALbNGRRvG9BT3noMne1c4Xc7ALJjT5KT+3eZtaMun=bT5g772A@mail.gmail.com>
References: <20200225054406.867243-1-raj.khem@gmail.com>
	<29622e48fc7ebf80aa002b2d1903f6d970af9d86.camel@linuxfoundation.org>
	<CALbNGRRvG9BT3noMne1c4Xc7ALJjT5KT+3eZtaMun=bT5g772A@mail.gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mime,mime-xdg: Conflict with allarch
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
X-List-Received-Date: Tue, 25 Feb 2020 14:07:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-02-25 at 13:24 +0100, Andreas Müller wrote:
> On Tue, Feb 25, 2020 at 11:21 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2020-02-24 at 21:44 -0800, Khem Raj wrote:
> > > mime and mime-xdb classes add dependencies ( both runtime and
> > > buildtime
> > > ) on target packages, therefore recipes using allarch should not
> > > inherit
> > > mime/mime-xdg or vice-versa, this fixes subtle sstate mismatches
> > > 
> > > [YOCTO #13805]
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Andreas Müller <schnitzeltony@gmail.com>
> > > ---
> > >  meta/classes/mime-xdg.bbclass | 5 +++++
> > >  meta/classes/mime.bbclass     | 5 +++++
> > >  2 files changed, 10 insertions(+)
> > 
> > Is this the right way to fix this? mime info probably is arch
> > independent, so should we be whitelisting some of the dependencies?
> > 
> > Cheers,
> > 
> > Richard
> > 
> Khem and I had a short discussion about this [1]. His first approach
> was to remove DEPENDS. As far as I remember the deps were added to
> avoid QA warning.
> 
> Honestly I never understood why these are spawned. If there is a fix /
> workaround this could be reduced to rdeps which an be handled for
> allarch.
> 
> [1] https://github.com/YoeDistro/openembedded-core/commit/5605a9cf78c3731e2cc055cd4f8cc88a0b3d7e26

I'd guess something like:

SIGGEN_EXCLUDERECIPES_ABISAFE += "\
  shared-mime-info \
  desktop-file-utils \
"

in layer.conf might be the correct fix. The other approach is just a
workaround.

Cheers,

Richard




