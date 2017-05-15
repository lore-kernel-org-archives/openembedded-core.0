Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id EFCD672FB0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 19:35:18 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u75so19072621qka.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 12:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KvyAppkYTEQmL+/hELp/vtQRbINdr7TLG53grn7zpas=;
	b=jnFCsch3uOpWvm+Hv0lOGlCJLoY2kvpHYmYLEfa9gyGnGxc/Cti9KsWnryYDKOFEjK
	jkzCt7YO84UfKS9LrKBqxijFt4uCm226MVOxgj7Ek3kFQonX3kxDDr8ttwNxZbJFvI3O
	rJiO4dqX3p2YQoEMjQcf8CytR26unHyTzBSICFrukVcZ7lAtK8tnG2/oDlRpwrEkVdXW
	0pMGXjNzifqi3woNg4l9wHpysXIWc9EaIUMber59YWlHcYILwsxlruNSIkayta33qmqL
	IxSf/CuJd5Seetg/3Fli0PHtH5kdvWeU0TepHS04BIxkuBIJgtNi/jBfBL090adlQ8s7
	2Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KvyAppkYTEQmL+/hELp/vtQRbINdr7TLG53grn7zpas=;
	b=adtjlT1LQlxDd43ZKxOEyH2TQ4aZN/O0LKMCn2yd6KAozXCb/qx8lNvfkfKzQ2XrmV
	Og0VC58YavcRePdrXJ+65crZFLbJIbLJ/wQXaL+5ZM6qBI2ofNTso8w/28E7D6Dp6W7I
	2e7TXhOZZ3IS9bSiyg9WwQlOQPJAKTOkZRH9/DLcuH+N4XGyajbIDLOEYBgggd3HKnve
	X3vVEbAmfq+baMCkW1YRvIdk7QYCmRFwFDn0GOhkv9Sbc/tafoTAEv57vjIUG2cuV1ez
	0SwzCimZrldtG1rL1CffOl3+6jkjPErcZV1KM89vcOogDHJe719IYuX/7eK5exZBxi2T
	BGOA==
X-Gm-Message-State: AODbwcBB64FuG6JNG9iTPqazexuQzhNrbbk6CFxt+e1STebVD1POP2cW
	nS7SckEr+rekYDdwDVeCO+en6TrxDg==
X-Received: by 10.80.154.165 with SMTP id p34mr235764edb.127.1494876919547;
	Mon, 15 May 2017 12:35:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Mon, 15 May 2017 12:34:48 -0700 (PDT)
In-Reply-To: <1494875908.1179.254.camel@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<e03ca7d9d2d8b290fe306da077e0fc74a6916efd.1494854721.git-series.patrick.ohly@intel.com>
	<CAMKF1spKnOnZfMoijNz5kQjE2=5OO3k4CUVK5d04id1B42JB2A@mail.gmail.com>
	<1494875908.1179.254.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 May 2017 12:34:48 -0700
Message-ID: <CAMKF1srA7qkRJMtDgn6eNT8Fhs2dP6YUhJ3CMiNBFU+6ZdreZg@mail.gmail.com>
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
X-List-Received-Date: Mon, 15 May 2017 19:35:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 15, 2017 at 12:18 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Mon, 2017-05-15 at 08:50 -0700, Khem Raj wrote:
>> On Mon, May 15, 2017 at 6:27 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
>> > Enabling "debug-tweaks" unconditionally, even if it is only in the
>> > local.conf.sample file, runs the risk of that getting used in
>> > production images.
>> >
>> > By checking the per-image IMAGE_MODE, the debug tweaks only get
>> > enabled for images not meant for production.
>> >
>> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>> > ---
>> >  meta/conf/local.conf.sample | 5 +++--
>> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
>> > index 85c5e21..edadbb7 100644
>> > --- a/meta/conf/local.conf.sample
>> > +++ b/meta/conf/local.conf.sample
>> > @@ -114,8 +114,9 @@ PACKAGE_CLASSES ?= "package_ipk"
>> >  #                     e.g. ssh root access has a blank password
>> >  # There are other application targets that can be used here too, see
>> >  # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
>> > -# We default to enabling the debugging tweaks.
>> > -EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
>> > +# We default to enabling the debugging tweaks unless an image is explicitly
>> > +# requested to be built for production.
>> > +EXTRA_IMAGE_FEATURES ?= "${@ '' if 'production' == d.getVar('IMAGE_MODE') else 'debug-tweaks'}"
>>
>> is IMAGE_MODE defined per image recipe ?
>
> Conceptually it is, although I guess it might get set globally in
> practice.
>
> The class just defines the empty string (= no specific mode) as ??=
> default. Then a distro's local.conf sample can define a weak ?= default,
> probably "development" (similar to the current practice of enabling
> debug-tweaks in local.conf.sample). Finally, specific image recipes
> (like a core-image-minimal-development.bb which includes
> core-image-minimal.bb) can force a fixed mode with
> IMAGE_MODE_forcevariable = "development".

People use same distro with two different images for production and
devcelopment and conrols are inserted via IMAGE_FEATURES
with this change once effectively needs two different distros for prod and dev

