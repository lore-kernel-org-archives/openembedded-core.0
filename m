Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 08FD565D72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 14:37:29 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hu19so1085353vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=RfBtEZnIE3g8r524RZDcETR8MVd6DCFa8G9scxhJai4=;
	b=OTMwh6rIG+oRgJc85ys2X2wAFku+um948UcHc/jjXNjbkR4bFxM2fXJpMbC5vecMdg
	PmC+k2g8shIkxI7B5ox3eKWwrJGQ8cM02fpARPeO88UqKONEzZNcLYM/MKkUytFg4sFG
	FZIhvwtcQhRyiQ0a3I+nEUYdwPYuwTbTl1pZXNZ4d6EFNVUwpbZyX+r7kIiO7fOq+NMs
	NZlmfIdDHaR+7ASmR8iaA9gN1FPr0al96RtKMGvbhEfh8GHecvfue3GBHWcff/hcrfFA
	DucBbhgk+s6TowAjxo3+QoGwcBJV3HHjkvbAKjkakG6oZZf1ecH/5Y3vKLsLQZ1rUiML
	4PlA==
X-Received: by 10.52.53.101 with SMTP id a5mr26986011vdp.14.1398091049905;
	Mon, 21 Apr 2014 07:37:29 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.221.5.133 with HTTP; Mon, 21 Apr 2014 07:36:49 -0700 (PDT)
In-Reply-To: <CALbNGRSGu_rTC58mSFWAO_-tpgn67C1qKz9mrdeH09P-QwccGA@mail.gmail.com>
References: <CALbNGRSqnLj6Hr+6dL0rcyacz1pXSf+XySbYs_tx_gnq5+QfEg@mail.gmail.com>
	<CANyK_8d907x2d2_9MemcBqtB3oS6fyhzZyiRWMGSOEoXTcoinA@mail.gmail.com>
	<CALbNGRSXjpbvPa9N1yFYRqHn7X5rMSw-6F5vnbrFwMpq0pXHZQ@mail.gmail.com>
	<CALbNGRTyORP9DfxidwAhNqjFb5N937vbjJYncqwLXmc4fnxjWA@mail.gmail.com>
	<CALbNGRSGu_rTC58mSFWAO_-tpgn67C1qKz9mrdeH09P-QwccGA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 21 Apr 2014 15:36:49 +0100
X-Google-Sender-Auth: ITlHAUrnmnWNlXWKhJDaM05Q3-Y
Message-ID: <CANyK_8cfGW-C-Bo4onB77zEbCK1XDF0nOtw9cGZkMN8Jz-y-aQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: issue with file-ownership in images
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
X-List-Received-Date: Mon, 21 Apr 2014 14:37:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21 April 2014 11:35, Andreas M=C3=BCller <schnitzeltony@googlemail.com> =
wrote:
> On Thu, Apr 17, 2014 at 7:08 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Thu, Apr 17, 2014 at 1:53 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>> OK I did a test with current git master.
>>
>> Good news:
>>
>> the sequence of running preinst-script and unpacking is correct now:
>>
>> | NOTE: Performing useradd with [--root
>> /home/a.mueller/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfc=
e4-tiny-image/1.0-r0/rootfs
>> --system --no-create-home --user-group --home-dir /etc/polkit-1
>> polkitd] and 10 times of retry
>> ...
>> ...
>> | Installing polkit (0.112-r0) on root.
>> | Downloading file:/home/a.mueller/tmp/oe-core-eglibc/deploy/ipk/armv7at=
2hf-vfp-neon/polkit_0.112-r0_armv7at2hf-vfp-neon.ipk.
>> ...
>>
>> Bad news:
>>
>> gid/uid are still identical to those with opkg 2.01 (based on same ipks =
created)
>>
>> I think what happens is that opkg simply uses the ids which were found
>> during installation.
>>
>> So now with the sequence looking solved, I understand better what you su=
ggested:
>>> It would certainly be possible to add options to the
>>> next version of opkg to lookup uids & gids from a given passwd & group
>>> file (which could be those from the sysroot). Is that something that
>>> would be useful in the future?
>> Yes this would solve this issue (nit: replace 'sysroot' by rootfs or ima=
ge).
> I think it would be better to translate user/group names to IDs
> generally and error out if that fails. As seen with polkit: using IDs
> used during install/packing as fallback causes strange effects - or in
> other words: If environment where a package is installed has not
> prepared the required users/groups, something is wrong and the package
> will not work as expected.

Equally, non-OpenEmbedded users of opkg might want to use the
uids/gids in packages without modification. I think the solution for
opkg is to make things more configurable. I'll open an enhancement
issue to that effect on the opkg bug tracker. Unsure how soon it will
get solved as I'm very busy at the minute but I can at least write it
down so it doesn't get forgotten.

>
> Andreas

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

