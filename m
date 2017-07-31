Return-Path: <net147@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 33D79784B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 08:04:46 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id g13so107736056ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 01:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TYgAibuP7npD4HsLS8kXgADDRlVtR6twsZi/kpOyKkw=;
	b=JPTWrJ/4RXpev0sYfDTPOsPCTVNy9Bcb+S7KFF2KOAJd5h/gTsMuVHcFaV1IosVp12
	WgJcK5l3yAlQFGnGsMufhYTy6BRGomp2tkGyX0R5tZ8l56YIy8erqFwzkaiXZCDrpLOy
	SsXJGLoSVJDmpaseaDVhEAlOMMCNmwNmtLYd01BRsxG8RkN64Ya4wX9Fmscd43d5f+/+
	By63LvOnzZQTbQgZopoy4zXvEcB8IqfMdp8ryNudgLwhOvm/8R5CFLSVm2S+DtfbKfXt
	1x7Ltj4+3eMzfPUP8XwTzk9aIr5itBo19lQNG08OnEj/EVQQ87iEoAnd5mFvo05Wopll
	3VIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TYgAibuP7npD4HsLS8kXgADDRlVtR6twsZi/kpOyKkw=;
	b=jpwhUfn9VL8j2VBGJa0DDXX5BdVb1OTwgEZEmRZflY7zT1B4nSUx3rJL83qkMqkpWa
	0q52E2Tb3VyjAFZav8eKrGL35QG/WvXO85Pm3cHpjYi5bd56Rldo7P0m0uvbRL62c1dC
	JEczS/Fd6se945tjOlpu3hCuaJ3A4wr2mFhrx6gF9BbPGngi9m9ZLsu/y1k6hg1GKztj
	hxlVIN6CTuFaopUfPq/BqnYai+NpmRdiieXIyy2xurF/1DvALFK7SAcXHDQPC8VXzvzo
	Go8cYUsaFKkZP8gK/ijKSETNJ0bNWPjOL27oaa/7HT5vJD0B/amVdUVtfJNdNCv6UR5e
	8UeQ==
X-Gm-Message-State: AIVw111uLoTMw8zblqThdu3t13cwznB9h60CK5jgxeQmkLGNqqZpaQUe
	MhzoPeuJW9vIwMfxXdJ+f3llrCwaaQ==
X-Received: by 10.107.19.140 with SMTP id 12mr17029604iot.51.1501488287962;
	Mon, 31 Jul 2017 01:04:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.146.198 with HTTP; Mon, 31 Jul 2017 01:04:47 -0700 (PDT)
In-Reply-To: <CANwerB1dx__iGC0ogooc1B3WSbQUv5C9SjKeg6h0ppvNBjQL0w@mail.gmail.com>
References: <20170728144527.24322-1-net147@gmail.com>
	<20170730100236.GA28203@linux.intel.com>
	<CANwerB3-Vz2MDKyFTu0kfdA7z2Mgg+y4QtJZ4ZpZZgTABnBCAA@mail.gmail.com>
	<20170731072822.GA32659@linux.intel.com>
	<CANwerB1dx__iGC0ogooc1B3WSbQUv5C9SjKeg6h0ppvNBjQL0w@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
Date: Mon, 31 Jul 2017 18:04:47 +1000
Message-ID: <CANwerB1xu8rYM3q8cUaFP-kxNm7M3sBLswz7939u=6mtWkst3g@mail.gmail.com>
To: ed.bartosh@linux.intel.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] wic: ensure generated disk system identifier is non-zero
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
X-List-Received-Date: Mon, 31 Jul 2017 08:04:47 -0000
Content-Type: text/plain; charset="UTF-8"

On 31 July 2017 at 17:58, Jonathan Liu <net147@gmail.com> wrote:
> Hi Ed,
>
> On 31 July 2017 at 17:28, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>> On Sun, Jul 30, 2017 at 08:37:26PM +1000, Jonathan Liu wrote:
>>> Hi Ed,
>>>
>>> On 30 July 2017 at 20:02, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>>> > On Sat, Jul 29, 2017 at 12:45:27AM +1000, Jonathan Liu wrote:
>>> >> Zero may be interpreted as no MBR signature present and another
>>> >> partitioning program might install a new MBR signature.
>>> >>
>>> >> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>> >> ---
>>> >>  scripts/lib/wic/plugins/imager/direct.py | 2 +-
>>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>>> >>
>>> >> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
>>> >> index f20d8433f1..fe9b688ab0 100644
>>> >> --- a/scripts/lib/wic/plugins/imager/direct.py
>>> >> +++ b/scripts/lib/wic/plugins/imager/direct.py
>>> >> @@ -297,7 +297,7 @@ class PartitionedImage():
>>> >>                            # all partitions (in bytes)
>>> >>          self.ptable_format = ptable_format  # Partition table format
>>> >>          # Disk system identifier
>>> >> -        self.identifier = int.from_bytes(os.urandom(4), 'little')
>>> >> +        self.identifier = int.from_bytes(os.urandom(4), 'little') or 0xffffffff
>>> >>
>>> >
>>> > Can we generate random identifier by calling os.urandom again if
>>> > self.identifier is zero? Something like this, may be?
>>> >
>>> > while True:
>>> >     self.identifier = int.from_bytes(os.urandom(4), 'little')
>>> >     if self.identifier:
>>> >         break
>>> >
>>> > Assigning constant 0xffffffff can potentially create nonunique identifiers.
>>> >
>>>
>>> There is no guarantee that urandom will create unique identifiers.
>> We can't have a guarantee with urandom, true. My point was that if you
>> need random value it's better to call urandom again than using a constant value.
>>
>>> Infinite loop needs a timeout and error in the case it is unable to
>>> generate a suitable identifier.
>> I'm not sure it's needed, but it's not a big deal to add this. I really
>> doubt os.urandom can generate long enough sequence of zeros.
>>
>>> It is only 0xffffffff if it is 0. That
>>> means 0xffffffff is twice as likely to occur (2 in 4294967296 instead
>>> of 1 in 4294967296) so there is tiny bias. Note that this is how it is
>>> implemented for the DISK_SIGNATURE variable in OE and in GNU Parted as
>>> well.
>> Does this mean we shouldn't do better?
>>
>
> How about random.SystemRandom().randrange(1, 0xffffffff) ?
>

random.SystemRandom().randint(1, 0xffffffff) actually

>>> >>          self.partitions = partitions
>>> >>          self.partimages = []
>>> >> --
>>> >> 2.13.2
>>> >>
>>> >> --
>>> >> _______________________________________________
>>> >> Openembedded-core mailing list
>>> >> Openembedded-core@lists.openembedded.org
>>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>> Regards,
>>> Jonathan
>>
>> --
>> Regards,
>> Ed
>
> Regards,
> Jonathan

