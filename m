Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 91A9D61FE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 19:53:24 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id jw12so8347491veb.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 12:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=gBYq7ZfGnkCOtVVyp7nk6G+fP4XAgn4w+WTD3u9oJ9U=;
	b=mtdY3fV/RdsIcBLndynSK4mlDT2nejYYxAy1BASUG0j+cwxHPR+Sh9mt4HwPp5hadl
	exxf5aXEJ7z2balS8Asg6OBRoLrHbHkE0Cf63bFQ192Qj1mURP65i6Ek2mwZaAt/9S4n
	H6kKqvVkW7UjRe50PaxaECLSRL8+fSe+7hXjj/GsnS7b+na8shepyYULBk3RwOOFbnVx
	zLLxfmK2agSohaELoixzYJlyd0fDhhvx2AGjKdngNMwolQWa4TxlySCkyMX4co8mmEE/
	tHcVR90bP353InQ55LkZw04V/8+TNXtPakx3r+UCBFRYSjTNdIxA6Bx4964vCQtaePvW
	t+BA==
X-Received: by 10.220.92.135 with SMTP id r7mr32575265vcm.11.1398110005304;
	Mon, 21 Apr 2014 12:53:25 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.221.5.133 with HTTP; Mon, 21 Apr 2014 12:52:45 -0700 (PDT)
In-Reply-To: <CANyK_8cfGW-C-Bo4onB77zEbCK1XDF0nOtw9cGZkMN8Jz-y-aQ@mail.gmail.com>
References: <CALbNGRSqnLj6Hr+6dL0rcyacz1pXSf+XySbYs_tx_gnq5+QfEg@mail.gmail.com>
	<CANyK_8d907x2d2_9MemcBqtB3oS6fyhzZyiRWMGSOEoXTcoinA@mail.gmail.com>
	<CALbNGRSXjpbvPa9N1yFYRqHn7X5rMSw-6F5vnbrFwMpq0pXHZQ@mail.gmail.com>
	<CALbNGRTyORP9DfxidwAhNqjFb5N937vbjJYncqwLXmc4fnxjWA@mail.gmail.com>
	<CALbNGRSGu_rTC58mSFWAO_-tpgn67C1qKz9mrdeH09P-QwccGA@mail.gmail.com>
	<CANyK_8cfGW-C-Bo4onB77zEbCK1XDF0nOtw9cGZkMN8Jz-y-aQ@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 21 Apr 2014 20:52:45 +0100
X-Google-Sender-Auth: 1QNRsMm9DpeBKtR_bOE9SmXuM1w
Message-ID: <CANyK_8eXqnP=VjHVBFXcU6m=knDv=bpoC7jO4dxK2CQ88BJ9xQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 21 Apr 2014 19:53:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21 April 2014 15:36, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 21 April 2014 11:35, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
>> On Thu, Apr 17, 2014 at 7:08 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>> On Thu, Apr 17, 2014 at 1:53 PM, Andreas M=C3=BCller
>>> <schnitzeltony@googlemail.com> wrote:
>>> OK I did a test with current git master.
>>>
>>> Good news:
>>>
>>> the sequence of running preinst-script and unpacking is correct now:
>>>
>>> | NOTE: Performing useradd with [--root
>>> /home/a.mueller/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xf=
ce4-tiny-image/1.0-r0/rootfs
>>> --system --no-create-home --user-group --home-dir /etc/polkit-1
>>> polkitd] and 10 times of retry
>>> ...
>>> ...
>>> | Installing polkit (0.112-r0) on root.
>>> | Downloading file:/home/a.mueller/tmp/oe-core-eglibc/deploy/ipk/armv7a=
t2hf-vfp-neon/polkit_0.112-r0_armv7at2hf-vfp-neon.ipk.
>>> ...
>>>
>>> Bad news:
>>>
>>> gid/uid are still identical to those with opkg 2.01 (based on same ipks=
 created)
>>>
>>> I think what happens is that opkg simply uses the ids which were found
>>> during installation.
>>>
>>> So now with the sequence looking solved, I understand better what you s=
uggested:
>>>> It would certainly be possible to add options to the
>>>> next version of opkg to lookup uids & gids from a given passwd & group
>>>> file (which could be those from the sysroot). Is that something that
>>>> would be useful in the future?
>>> Yes this would solve this issue (nit: replace 'sysroot' by rootfs or im=
age).
>> I think it would be better to translate user/group names to IDs
>> generally and error out if that fails. As seen with polkit: using IDs
>> used during install/packing as fallback causes strange effects - or in
>> other words: If environment where a package is installed has not
>> prepared the required users/groups, something is wrong and the package
>> will not work as expected.
>
> Equally, non-OpenEmbedded users of opkg might want to use the
> uids/gids in packages without modification. I think the solution for
> opkg is to make things more configurable. I'll open an enhancement
> issue to that effect on the opkg bug tracker. Unsure how soon it will
> get solved as I'm very busy at the minute but I can at least write it
> down so it doesn't get forgotten.
>

http://code.google.com/p/opkg/issues/detail?id=3D129 has been opened to
track this for opkg.

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

