Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 305C56FF23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 13:11:08 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id j1so123052970oih.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 06:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jezRU0XnihMF3nTD1i5xhAPhLys9LmClUjv9lXL/V3Y=;
	b=sWrywA8wUGyxZhXZnBwCjMpyL2koq/3Bzmax73V/KJKpghc5hoVogdGAUYLCCqS2Mo
	w0ax0PFep9vCmgOejZjD50pVYoQ7vQ53m3Ujfl2WeN0qVYLQAgfGT8ah+4KqVgxdHa/d
	yG7zSNdD6BLiWjxqtrvfP61YCUg5vBescO2pZqGIbk4uGjt+biBGJUKlmauHyCjuZoE2
	+z8KXJCjzQ4pHjPyzF05sG3isxZpNr1NzX3LUNlKxl1W81DIEYZwJidOlmyDAos57c1A
	A5rouAAedhFJyoGdgyQXa4Yv/GUa5pVhP6qTXiA5n5d8vPxM9+eMJaSawfpKmWw0wcd+
	bT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jezRU0XnihMF3nTD1i5xhAPhLys9LmClUjv9lXL/V3Y=;
	b=GCe5RTVKxwUd2WKTCnNjfqxg6LuZLmfrvKbxlC4lBOgKrmrHt2UVxHuDPXjYPYXLPn
	2VqgQeiGiCkWxje7KaIHpKifItSVaDMSVM53xQ3MXkFZRUgge0+8mI+A4LPclEHGDetV
	o56mGFrKupanMKSRF9Q7nmCIxX+H+c/jHg2ohfWtmRxOnbH5Ytk44/+8ubUw3xaYBC8w
	NyJIGFKEBKr36f3ZSgxAtXmj0F0e4DqBS5Sb0gi3s9AJS3Wd63Kx/pvdsbR2+rnICJJz
	JEzlw1hLa9oqDxzxV4B3q8h3lW047qe+jJOW7YR9X138iYqb985e4mRAs+Gk8sl2NQcq
	UWxQ==
X-Gm-Message-State: ALyK8tIK96zog5WolZd9STceUPAIIu1gPdXSgIVuJiUB7Dkm9FuhFK0N2Cwo0ffozPOJWGNx00UzKEmlVfDHDhRV
X-Received: by 10.157.14.236 with SMTP id 99mr5675608otj.83.1464268269512;
	Thu, 26 May 2016 06:11:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Thu, 26 May 2016 06:10:39 -0700 (PDT)
In-Reply-To: <20160526130149.GW21318@axis.com>
References: <cover.1464176988.git.jussi.kukkonen@intel.com>
	<285302afb2b9fb0a868aeda0cbfa3ea956702793.1464176988.git.jussi.kukkonen@intel.com>
	<20160526130149.GW21318@axis.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 26 May 2016 16:10:39 +0300
Message-ID: <CAHiDW_H1qEL=jEBVKS5Q3Ni_wZQ8SErPHfKJLypm=mr2yKf6rQ@mail.gmail.com>
To: Olof Johansson <olof.johansson@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] gnupg.org-hosted recipes: Change SRC_URI to https site
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
X-List-Received-Date: Thu, 26 May 2016 13:11:11 -0000
Content-Type: text/plain; charset=UTF-8

On 26 May 2016 at 16:01, Olof Johansson <olof.johansson@axis.com> wrote:
> On 16-05-25 16:29 +0300, Jussi Kukkonen wrote:
>> https version seems more reliable and in an informal test fetching
>> all gnupg recipes now takes <20% of the time it used to.
>>
>> Define GNUPG_MIRROR in bitbake.conf so future tweaks to this are
>> easier. Replace some slower mirrors with the official ftp site
>> and another from gnupg.org mirror list.
>>
>> Change gnutls to use GNUPG_MIRROR as well: they have their own domain
>> but the ftp site is the slow, unreliable gnupg.org one.
>>
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> ---
> ...
>> -SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
>> +SRC_URI = "${GNUPG_MIRROR}/gnupg/gnupg-${PV}.tar.bz2 \
>
> I'm not fond of having variables like these, since it makes the
> URL in the recipe harder to work with and interpret. Maybe not a
> deal breaker, but we already have PREMIRRORS, which can be used
> instead of variable indirection. A similar patch, almost a year
> ago, was rejected.

I'm not attached to the variable, I'll change those to plain URLs if
that's preferred.

Jussi


>  http://lists.openembedded.org/pipermail/openembedded-core/2015-July/108217.html
>
> --
> olofjn

