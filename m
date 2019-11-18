Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4B07F8B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 18:39:58 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id D005D5C3985;
	Mon, 18 Nov 2019 19:39:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1574102398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Xk9H1FvkuHO5XsSy0N3j/tAjBh/7rxfrdrFt5znmGAk=;
	b=sqOb/cIkeEjHVckLE1BDDKBaE1DV1ybRssYC1rRcknsbFhUcXp9YrWYtM+DitEDplpGvwv
	4iiYv30M/yA3OkOjMtgBEcYMDyw7cXhaJ/NYHOoNo5k3Hr3FiqZYkQBl1YVB8Bl5ywb7wf
	U4h4+lMtiZKvKB7Vcjmb0Bb38mfiZGo=
MIME-Version: 1.0
Date: Mon, 18 Nov 2019 19:39:58 +0100
From: Stefan Agner <stefan@agner.ch>
To: alex.kiernan@gmail.com
In-Reply-To: <4b4629ef84240f6d5e7da1363d88ebe15f4ab049.camel@linuxfoundation.org>
References: <20191108091419.25156-1-stefan@agner.ch>
	<7e0b2e1cc9931c92c2bcdcf5ef1f6f75@agner.ch>
	<4b4629ef84240f6d5e7da1363d88ebe15f4ab049.camel@linuxfoundation.org>
Message-ID: <92892787582baf91d2de15279d6e60ac@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 18 Nov 2019 18:39:58 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

[adding Alex, he maintained the recipe in meta-oe so far]

On 2019-11-18 13:19, Richard Purdie wrote:
> On Thu, 2019-11-14 at 15:47 +0100, Stefan Agner wrote:
>> On 2019-11-08 10:14, Stefan Agner wrote:
>> > From: Stefan Agner <stefan.agner@toradex.com>
>> >
>> > Zstd is a very fast compression algorithm and has gained quite some
>> > popularity recently. An upcoming patch allows to compress rootfs
>> > using Zstd. Moving Zstd to oe-core allows this new conversion
>> > formats
>> > to be automatically tested by the oe-selftest
>> > imagefeatures.ImageFeatures.test_image_fstypes test.
>> >
>> > Furthermore there are three packages in oe-core which allow to
>> > enable
>> > Zstd support through packageconfig currently.
>>
>> Any update/thoughts on this?
> 
> I've not made a final decision on whether to merge it fails selftests
> due to a lack of a maintainer:

Alex, would you be OK with you listed as maintainer?

--
Stefan

> 
> 2019-11-16 20:13:49,922 - oe-selftest - INFO -
> distrodata.Distrodata.test_maintainers (subunit.RemotedTestCase)
> 2019-11-16 20:13:49,922 - oe-selftest - INFO -  ... FAIL
> 2019-11-16 20:13:49,923 - oe-selftest - INFO - 2: 29/40 153/378
> (109.44s) (distrodata.Distrodata.test_maintainers)
> 2019-11-16 20:13:49,923 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent
> call last):
>   File
> "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/distrodata.py",
> line 84, in test_maintainers
>     """ + "\n".join(['%s (%s)' % i for i in no_maintainer_list]))
>   File "/usr/lib/python3.6/unittest/case.py", line 670, in fail
>     raise self.failureException(msg)
> AssertionError: 
> The following recipes do not have a maintainer assigned to them.
> Please add an entry to meta/conf/distro/include/maintainers.inc file.
> zstd
> (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-extended/zstd/zstd_1.4.4.bb)
> 
> To reproduce, run: "oe-selftest -r distrodata.Distrodata.test_maintainers"
> 
> Cheers,
> 
> Richard

