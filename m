Return-Path: <matt@madison.systems>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id E66796AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 19:29:27 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id z124so9395480lfa.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=bjfy9+FE0PSW+31IQenE8VnnFo/zdRr3gLUeWXiXG8w=;
	b=Fw8i4NIw8ug7fXZjnSEuY1fWEwYO4eTI5oNMr0fQhlH3gR37+nU0tvEQZfPhTlx4mq
	iCaEr0g84BBLKkpw5mCQx0p7P2yCqJV5YpVe44vCx/R0a+933awKVyZWXss8r2ou/vO9
	OsVejiTxsFOiVy9QiaroXo/5qIk7QWdVzUSnio8Fmhc+oyWd2ZfL+AbK/IztYuz+vYbo
	rIW0tbiS3efot8xtLnVIrx+JuvchrJCkmtYY51MtfQ+YpE+cZ92oSDuP4HAHgYGSiVg1
	2gAFBY5la1n2W6c22XnXEVHS8ll7lVkb81k+ToIIkEqsUP2rBalbzG4HrZkftOTVsbuf
	JGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=bjfy9+FE0PSW+31IQenE8VnnFo/zdRr3gLUeWXiXG8w=;
	b=k79f+afnY0KPLmvQu27Jzijl/Pm0GBlNUkWHw7OyXmLNLWWCOzeryJKacFWoGZhQeY
	NAR0Y5VOh2tJbiD1PbiMw+z2SzFdRQafLXBrHHo4mXvZOb2+npW3RSaX3iN4kRVFdKVv
	TU0Ld0s2y+rthOPweqJT5ho6u+X1ZYFf2mj6ycmnu9jpQLZ4azG2FPxrAnu2Wby6DTmG
	7pxdswPmZw8gMg4NIpvrmyYxVeMxkVHArQxNSMivu4eqW6Jj5ER1Py2185LTbYEEovhO
	R9hrHU2CGCVlQFJ64DrQqSqirsLtz9ncMK542yPtZGWWGB0ajQEcz7iPLtJKI2bjLMWG
	CBrQ==
X-Gm-Message-State: ALoCoQkI0tfj7Pu4cwUwh5QIdWXcETBbrr/1l9TzFKLI4aY1VyDYixwGQIFd92Y1HYoe8c7btRlEZfcMUmdY7C/l8l9oMFemHg==
MIME-Version: 1.0
X-Received: by 10.25.156.65 with SMTP id f62mr4802696lfe.98.1450207767089;
	Tue, 15 Dec 2015 11:29:27 -0800 (PST)
Received: by 10.25.145.200 with HTTP; Tue, 15 Dec 2015 11:29:27 -0800 (PST)
In-Reply-To: <56704DFF.9070804@linux.intel.com>
References: <1449422732-12975-1-git-send-email-matt@madison.systems>
	<56704DFF.9070804@linux.intel.com>
Date: Tue, 15 Dec 2015 11:29:27 -0800
Message-ID: <CAGgRHJqoz-jUH3RmjHKRUwvZhRJtObb2oEsGiNiUPvGqXsGziQ@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Debian multilib packaging fixes
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
X-List-Received-Date: Tue, 15 Dec 2015 19:29:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

[Resending as I forgot to cc the list]

On Tue, Dec 15, 2015 at 9:29 AM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> Hi Matt,
>
> I'm starting to look at your patches, in what arches/combinations you
> test the patches?

I've been working on a BSP layer for the jetson-tx1, which is
aarch64/armv7a-hf, so that's what I've been testing with.  The BSP
defs are in https://github.com/madisongh/meta-tegra.

Thanks,
-Matt

>
> Kind regards,
>         alimon
>
>
> On 12/06/2015 11:25 AM, Matt Madison wrote:
>> I ran into sevearl issues while trying to build an ARM multilib rootfs
>> using Debian packaging.  After several go-rounds, it looked like the
>> cleanest solution was to tweak how DPKG_ARCH gets constructed and
>> to have the DpkgPM class in oe/package_manager.py use that variable
>> to locate multilib variants (similar to RpmPM).  I also took the
>> liberty of expanding the Debian architecture mappings so the names
>> align better with what's documented on the Debian wiki, for those
>> cases where a direct mapping is possible.
>>
>> Matt Madison (2):
>>   package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
>>     function
>>   package_manager.py: fixes for multilib deb packaging builds
>>
>>  meta/classes/cross-canadian.bbclass |  2 +-
>>  meta/classes/package_deb.bbclass    | 35 +++++++++++++++++++++++++-----=
-----
>>  meta/lib/oe/package_manager.py      | 17 +++++++++++------
>>  3 files changed, 37 insertions(+), 17 deletions(-)
>>

