Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 092BB7F7CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 08:46:05 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 866985C369E;
	Wed, 20 Nov 2019 09:46:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1574239566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=7zqEoC1kTATayKVqTf6aMxouggbM17ybbXAj9SWSWVU=;
	b=n0rGjyk6J6U94/h6mL/gurTdjbjio/wqT8Qnynpy2pIsePGxAWviB1rh6XRLbKdJCm8TVS
	R2zaZDFc+e4wzElHfZeIv5OJXtKfFVTIohzZvoC94NrhifrqEOeIfGrnrA4mkSnMXQ9xf0
	zoxA2uWYAOI66MuONvqwxfLnJXtLZ4o=
MIME-Version: 1.0
Date: Wed, 20 Nov 2019 09:46:05 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <CAO5Uq5Qo9dn52iwc43NVrH2SPp65eKqddNhYu9Mm4RoGQRd+pg@mail.gmail.com>
References: <20191108091419.25156-1-stefan@agner.ch>
	<7e0b2e1cc9931c92c2bcdcf5ef1f6f75@agner.ch>
	<4b4629ef84240f6d5e7da1363d88ebe15f4ab049.camel@linuxfoundation.org>
	<92892787582baf91d2de15279d6e60ac@agner.ch>
	<CAO5Uq5Qo9dn52iwc43NVrH2SPp65eKqddNhYu9Mm4RoGQRd+pg@mail.gmail.com>
Message-ID: <598ecaba189d2f966c2fd03cdea03370@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] zstd: move recipe to oe-core from meta-oe
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
X-List-Received-Date: Wed, 20 Nov 2019 08:46:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-11-19 17:18, Alex Kiernan wrote:
> On Mon, Nov 18, 2019 at 6:39 PM Stefan Agner <stefan@agner.ch> wrote:
>>
>> [adding Alex, he maintained the recipe in meta-oe so far]
>>
>> On 2019-11-18 13:19, Richard Purdie wrote:
>> > On Thu, 2019-11-14 at 15:47 +0100, Stefan Agner wrote:
>> >> On 2019-11-08 10:14, Stefan Agner wrote:
>> >> > From: Stefan Agner <stefan.agner@toradex.com>
>> >> >
>> >> > Zstd is a very fast compression algorithm and has gained quite some
>> >> > popularity recently. An upcoming patch allows to compress rootfs
>> >> > using Zstd. Moving Zstd to oe-core allows this new conversion
>> >> > formats
>> >> > to be automatically tested by the oe-selftest
>> >> > imagefeatures.ImageFeatures.test_image_fstypes test.
>> >> >
>> >> > Furthermore there are three packages in oe-core which allow to
>> >> > enable
>> >> > Zstd support through packageconfig currently.
>> >>
>> >> Any update/thoughts on this?
>> >
>> > I've not made a final decision on whether to merge it fails selftests
>> > due to a lack of a maintainer:
>>
>> Alex, would you be OK with you listed as maintainer?
>>
> 
> I'm fine with that - it's very low overhead.

Thanks Alex, will send a v4 with you as maintainer.

--
Stefan

