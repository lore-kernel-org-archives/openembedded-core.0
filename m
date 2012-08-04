Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sxl5y-0007ED-Ou
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 22:37:10 +0200
Received: by obcva7 with SMTP id va7so2892103obc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2012 13:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=TMM9NSq3TtZXlfKwcjMv331Axwx2IqwqvjmPXaF8AKI=;
	b=EsPSs5rageop8a5jpYbybp46eHiRcUFrig671sciW9NnAcnWMXZwvIusESP4Kinekx
	ZvQMzUb2opQZXVkQuj1Ywe4L5AKdzJA7+VWtfr0iruVPyF8KEhvQQo3d9mTymF00TAnC
	7CrvpBSV4G+yPmkDula+EMnzDxaEBvVYJ5yemOR5IdFv/vBFtj55OaIbar3Hl/KiKq64
	ZiYYKe2KkQaUVw9jFlZacL5jxg0zS+K0e70K82BcgpZ9MKl6aRZrxZ4MDCAV6X+5v8cN
	4eaVjNQh46p+swK9mjJlRs12RdbgpKKcrpV41i+C89hRaL9zSQ+MpDdJ0IQ5Xe0O4QHn
	QwAw==
MIME-Version: 1.0
Received: by 10.50.191.227 with SMTP id hb3mr1830092igc.45.1344111927182; Sat,
	04 Aug 2012 13:25:27 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Sat, 4 Aug 2012 13:25:27 -0700 (PDT)
In-Reply-To: <20120804195625.GA3267@jama.jama.net>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
	<CALbNGRQjUxm0h2+YA=Tog2_JhWPKGJmdy9QyhOjSQWLRQ1eKOQ@mail.gmail.com>
	<501CD3EE.3080100@intel.com>
	<CALbNGRTJM5=Xt4NqoEuEQa2U-eMtmQzy42HmwRK0zvkq-zK-3Q@mail.gmail.com>
	<501D2B2B.6070806@intel.com>
	<3103BB42-D7DD-456B-8733-9A019CA66E99@dominion.thruhere.net>
	<CALbNGRRLGToMpW2tCzdtEcpZmAmgK3d2VKF0SVi-hgBanFOexQ@mail.gmail.com>
	<CAMKF1spXi6PqV6ZLqLPMUE0oEF2Sou+Jst-QME-XhLoCANeaPQ@mail.gmail.com>
	<20120804195625.GA3267@jama.jama.net>
Date: Sat, 4 Aug 2012 22:25:27 +0200
Message-ID: <CALbNGRQtH+rg9t9EwmEygBZeuZL=8E77OduSYBwpLAEwHFav0g@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] gtk-icon-cache: call postinst scriplet at do_rootfs time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Aug 2012 20:37:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 4, 2012 at 9:56 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Sat, Aug 04, 2012 at 12:51:47PM -0700, Khem Raj wrote:
>> On Sat, Aug 4, 2012 at 12:37 PM, Andreas M=FCller
>> <schnitzeltony@googlemail.com> wrote:
>> > And less than 3min on overo with the patches we sent (and my xfce
>> > image is full of gtk-icon-update). Don't misunderstand me: I agree on
>> > doing things like this on host if possible. But for me the main time
>> > waiting on a new image is do_rootfs and I just suggest to think about
>> > having these tasks run only once - but we can do this later or never.
>> > A bit off topic: As far as I can remember there were times when it was
>> > a no-go having gtk-native in oe-core. I hope they are over...
>>
>> I certainly agree with you that it should be run once. However what if
>> you changed something in icons between towo do rootfs runs ?
>> but I would like to know how much build time is it adding to do_rootfs ?
>> sometimes over optimising is bad too.
Good point I totally forgot (the old approach worked correct for that).
I come back to my first post on this: I would like to see some more
generic runonce approach...
>
> I think Andreas patch does run it once *per* do_rootfs, so not for every
> package which uses it if there is at least one installed in do_rootfs
> then it's executed once.
>
Andreas


