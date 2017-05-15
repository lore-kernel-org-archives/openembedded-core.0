Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 88EAF71C84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 20:26:27 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id k74so19421310qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 13:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MiUqxmbEh8lndNlP4+1kXrP4Gf1tvf3D5RPyiW5ER/U=;
	b=pIy+s+twQzuOzaQhg+82lVIXfE7mVAAeN+wfXzdeafeX8sOSWSSQn6sUzuhETl2xV2
	efCi6F9BRGzwh8x9faxzpsLBmg8sBebLTtIjzJ66/srRLr8rWfd5x04mEMBXSnEIl+U0
	ITKCmjNsg6T7Wgn4omOTz5ZXdu1QAH0qW9VxGxXrZpscS3754/4Zu0do90lzG4aQwrCP
	BE//Hh7xjN+I2hqaZQEw1KLB2BulidpOckF5usualIkB5XLmz2Z3wP6AJIWP1jrxSoqk
	PNY1tOLDP362+lLdW6Yn7715jX3fLPRhq9ac0+zFKJL9I1tOsywP6tLlCv2pg0IconJB
	ktGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MiUqxmbEh8lndNlP4+1kXrP4Gf1tvf3D5RPyiW5ER/U=;
	b=WT/Znkif852zonj5DV7nWKFbNHJT1UHPm/shGCDkNbQFYeskLNFfZy31YSXJXDNGiA
	PrV6fyPjn+NS4j3NCl8esPRP8FgpvUJvZA3kmZlD23sTxmyDYmaYV2v7kHzD4obOR2qt
	fB7Wac6o8MKoKPl73S5D4h76/ukVrmiwqUvAgwD0aguKlnGzkLFkxHgSJJqqCOjhMulo
	3CqNftwsO+2UVNdIfEZ3U3O6d5oCGaxll8sj6ZFaCuRD5qXvu8oa24eDNmcs5o4S2p87
	VOuykRqG0cux3WNaf7b+tI8FlgS0qNScznLtZ4PJCJ3QEh6cGrotFbBR17II4rhBe7T6
	87Lw==
X-Gm-Message-State: AODbwcA4YmwN+rf4N6qDlysOCpzWBTFWYAxAiaXrqjUBuyDQ1J2odLeZ
	g5owd4Y5Up/FhSgoRFYCElL1Z+M2ug==
X-Received: by 10.80.178.228 with SMTP id p91mr6094473edd.131.1494879989108;
	Mon, 15 May 2017 13:26:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Mon, 15 May 2017 13:25:58 -0700 (PDT)
In-Reply-To: <1494877678.1179.263.camel@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<e03ca7d9d2d8b290fe306da077e0fc74a6916efd.1494854721.git-series.patrick.ohly@intel.com>
	<CAMKF1spKnOnZfMoijNz5kQjE2=5OO3k4CUVK5d04id1B42JB2A@mail.gmail.com>
	<1494875908.1179.254.camel@intel.com>
	<CAMKF1srA7qkRJMtDgn6eNT8Fhs2dP6YUhJ3CMiNBFU+6ZdreZg@mail.gmail.com>
	<1494877678.1179.263.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 May 2017 13:25:58 -0700
Message-ID: <CAMKF1so9iLoMCs7Z0JtO9FEsg-bGpUUUrUH+FZP7YH+PHBs1qA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 6/6] local.conf.sample: make debug-tweaks depend on IMAGE_MODE
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
X-List-Received-Date: Mon, 15 May 2017 20:26:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 15, 2017 at 12:47 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Mon, 2017-05-15 at 12:34 -0700, Khem Raj wrote:
>> On Mon, May 15, 2017 at 12:18 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
>> > On Mon, 2017-05-15 at 08:50 -0700, Khem Raj wrote:
>> >> On Mon, May 15, 2017 at 6:27 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
>> >> > Enabling "debug-tweaks" unconditionally, even if it is only in the
>> >> > local.conf.sample file, runs the risk of that getting used in
>> >> > production images.
>> >> >
>> >> > By checking the per-image IMAGE_MODE, the debug tweaks only get
>> >> > enabled for images not meant for production.
>> >> >
>> >> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>> >> > ---
>> >> >  meta/conf/local.conf.sample | 5 +++--
>> >> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >> >
>> >> > diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
>> >> > index 85c5e21..edadbb7 100644
>> >> > --- a/meta/conf/local.conf.sample
>> >> > +++ b/meta/conf/local.conf.sample
>> >> > @@ -114,8 +114,9 @@ PACKAGE_CLASSES ?= "package_ipk"
>> >> >  #                     e.g. ssh root access has a blank password
>> >> >  # There are other application targets that can be used here too, see
>> >> >  # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
>> >> > -# We default to enabling the debugging tweaks.
>> >> > -EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
>> >> > +# We default to enabling the debugging tweaks unless an image is explicitly
>> >> > +# requested to be built for production.
>> >> > +EXTRA_IMAGE_FEATURES ?= "${@ '' if 'production' == d.getVar('IMAGE_MODE') else 'debug-tweaks'}"
>> >>
>> >> is IMAGE_MODE defined per image recipe ?
>> >
>> > Conceptually it is, although I guess it might get set globally in
>> > practice.
>> >
>> > The class just defines the empty string (= no specific mode) as ??=
>> > default. Then a distro's local.conf sample can define a weak ?= default,
>> > probably "development" (similar to the current practice of enabling
>> > debug-tweaks in local.conf.sample). Finally, specific image recipes
>> > (like a core-image-minimal-development.bb which includes
>> > core-image-minimal.bb) can force a fixed mode with
>> > IMAGE_MODE_forcevariable = "development".
>>
>> People use same distro with two different images for production and
>> devcelopment and conrols are inserted via IMAGE_FEATURES
>> with this change once effectively needs two different distros for prod and dev
>
> Why that?
>
> The production image recipe "foobar-image-production.bb" can use
> IMAGE_MODE_forcevariable = "production"
> and the development image recipe "foobar-image-development.bb" can use
> IMAGE_MODE_forcevariable = "development".
>
> Then whatever the user might configure in local.conf is ignored in favor
> of the fixed recipe values. If there's a concern about using
> _forcevariable: that could be addressed by configuring a global
> IMAGE_MODE_DEFAULT ??= "" and an IMAGE_MODE ??= "${IMAGE_MODE_DEFAULT}"
> in image-mode.bbclass and changing IMAGE_MODE_DEFAULT in distro or local
> conf. Then individual recipes can set IMAGE_MODE =
> "development/production" without having to fall back to _forcevariable.
>
> Or do you mean that there's just one image .bb and traditionally
> IMAGE_FEATURES were changed to switch back and forth? The same works
> with IMAGE_MODE. The advantage over enabling or disabling dangerous
> IMAGE_FEATURES is that users of a distro don't need to know about them.
> They get the guarantee that (for a responsible distro) the dangerous
> once will not get enabled by default for IMAGE_MODE=development.
>

IMAGE_MODE is a distro settings not image setting is that correct ?

