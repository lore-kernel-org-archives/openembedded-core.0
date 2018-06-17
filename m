Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 62A1C744D2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 13:23:58 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id l22-v6so12620891oib.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IpEaF9vJ1Eu1pGOj8aioRm31M38WiQrzTWUGP6CbF7Q=;
	b=CKK4lzIjdeuvUeR5tS7lbbnp+eKnEAI/3snl34L15hzmzvwmD0o70Jc3almsbFSWM7
	pq+iA4TaDouHRfbrULRkVJEn1UqQsD7qypa7T+p8Ojmw/DKgCrpb/VvdHyMcDRG+eT3h
	8Ibm5I0+RNBfl3qOhIsizF6DlyOeRl8CGuVJxN0CXK7hevbLfT51XsFfdiMiBCk8lfpu
	fjsaqn4ulTLM/Z72x+kycxEc3eOEHaQbQl9CU0ByF0BQeh8bycnDXc0A5OnZIL+a6lcj
	5jEA8v9Q9LRAX36XKrwrG6CYOEey2i/xB8p7gsXbcf79yOz9CCQuHkXorcvot9YNcGEV
	WXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IpEaF9vJ1Eu1pGOj8aioRm31M38WiQrzTWUGP6CbF7Q=;
	b=Gg4T5rRRbcLtWPUV2F9aNetHpb05YpJ3enzdxVn2s/rlbTIkFE70aPcFzQtLyfPC0x
	qaSJun1KF8b/lwGclcdE8jt/p/d3l+cJ4DKoep7oIr6qnuOS2PsaYuNmX48E57BP5Q3t
	cx3RdKEet46cJGIFmzhQfCTVEzHDdY2g0dqWALK7j0lLFBn/61CyBs+LbngzgeksFRey
	LtyK41iLDMwq9TmWsQ+KLqZn1WfaS9wkxkwRiBskO3c8aAue70zTpmERKTAxWRCJdGQ6
	dQAhU3d9G7DpjVQPHu3o0A+4EjzDzg4GVhC1yxByTq0CVfK8QriKA7B9FX43ZMG6wd3L
	YoGg==
X-Gm-Message-State: APt69E1sJtO1xSQaYeHEG7RUgFkk8rTPQHUpOVSgZ4csbWv14fwM05Oi
	TU7yAWVeJAX/3sqENHkICOTWPN5OWcMoBW/Elw47NQ==
X-Google-Smtp-Source: ADUXVKKrwnsBoYxz09zhg/x0oACy0+DVHDC7hPBRUU0guBigEOAAQLLAv+J0aw/ZeyiLBU+NYENqehX+YjR+swkHFEE=
X-Received: by 2002:aca:2808:: with SMTP id 8-v6mr5189709oix.235.1529241839343;
	Sun, 17 Jun 2018 06:23:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Sun, 17 Jun 2018 06:23:38
	-0700 (PDT)
In-Reply-To: <60a306a33463bd9b20631b61e17884012237588b.camel@linuxfoundation.org>
References: <20180613115053.28394-1-ross.burton@intel.com>
	<60a306a33463bd9b20631b61e17884012237588b.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 17 Jun 2018 14:23:38 +0100
Message-ID: <CAJTo0LZ9ZLMost=OyVo84tnO4u71_tNbS6eG9jbVkuODXn02kg@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: port to Meson
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
X-List-Received-Date: Sun, 17 Jun 2018 13:23:58 -0000
Content-Type: text/plain; charset="UTF-8"

Arch detection in Meson isn't quite there, for Mesa it fails to build
assembly bits because host != target (x86-64 != x86-64)...

Ross

On 16 June 2018 at 22:33,  <richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2018-06-13 at 12:50 +0100, Ross Burton wrote:
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  ...ac-Allow-explicit-enabling-of-cunit-tests.patch | 53 ------------
>> ----------
>>  .../recipes-graphics/drm/libdrm/installtests.patch | 25 ----------
>>  meta/recipes-graphics/drm/libdrm_2.4.92.bb         | 23 ++++------
>>  3 files changed, 9 insertions(+), 92 deletions(-)
>>  delete mode 100644 meta/recipes-graphics/drm/libdrm/0001-
>> configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
>>  delete mode 100644 meta/recipes-
>> graphics/drm/libdrm/installtests.patch
>
> Fails generally on x86[1] until you add:
>
> EXTRA_OEMESON_append_x86 = " -Dintel=true"
> EXTRA_OEMESON_append_x86-64 = " -Dintel=true"
>
> since the arch detection in cross builds is obviously not quite
> functioning correctly.
>
> [1] https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds/1068/steps/BuildImages/logs/stdio
>
> after the above 'fix', it still fails on musl:
>
> https://autobuilder.yocto.io/builders/nightly-musl/builds/1095
> https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/541
>
> Cheers,
>
> Richard
>
>

