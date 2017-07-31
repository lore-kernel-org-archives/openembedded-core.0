Return-Path: <net147@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 60C207834E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 07:58:24 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id o9so265203iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 00:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=INcYF4U/G+RFTRuqsDzNhCahx5O9FBfYMAcqDB99434=;
	b=FZNmtSxfBC8lbJv21gkEW51xj8EQ6ptOQS5zYNQa9c3oDu1cqKT8DUTiBXI9rMFqKb
	m3w1Ouw8Csm4XsvygPjiVdob3hoz+dyAxjl7VdRKpWtM+qEpr5wL4pkJ766y1Zo2sycH
	GnjlVCHA9agq6SbO0IrYiOIxlcu+acB39JFqhjxj4DKIZMaMGUz7iEKhhTltlot7mbE6
	Uk6Xi/9RrHlQYdnKeg07rea/7Zsm/CYhrS+jbX6ti8FJmtJwfACqE2LjY9YD3kX7xm5M
	kX7/LWvyd4YTCwTZJCA9DQEWHhEYJRQp6gqlABoUkuy6Fyz5FR3DHyUzFA/kFin/pXAU
	G+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=INcYF4U/G+RFTRuqsDzNhCahx5O9FBfYMAcqDB99434=;
	b=WNVo0Pl3jjXtKsIUOH8NWokMC6EEIJaL7QdlfcBLBbIqUIxXhAE2uhA3eun7tvjtq7
	QgLsEqWybOow7YqYrsJmKiiBKkoAYfKcOSHczOUFJkCM/36G9/5CUyVqQ7KH8vF2Dg+F
	OJpxWIszKvZg3vq4IqESXeLrb9HfEp/b6pvEa2yAep7hNEs3XrZpZIIdWTGWYbyF6D6j
	qCNXoRwq6xkfwKqQ6+esoDgLi1YZxeApFMUTTOrxZmufiv0a9cRr5DwBYBYMrELlf67b
	OaI+hdnqPE9DfU93aOg3fq+sjhDXMq4XSAlO7omWwqyJvxnFKuoXLfEoHbvth/k9NdeC
	VsJg==
X-Gm-Message-State: AIVw113XDTVJr0DoTggwLaN3XEGXGPxiPHoSNKWTBgNLDDQWEpQmYC8A
	7XzOLRIo6btpDdLKP3Il72vcJIarHg==
X-Received: by 10.107.19.140 with SMTP id 12mr17014285iot.51.1501487905409;
	Mon, 31 Jul 2017 00:58:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.146.198 with HTTP; Mon, 31 Jul 2017 00:58:24 -0700 (PDT)
In-Reply-To: <20170731072822.GA32659@linux.intel.com>
References: <20170728144527.24322-1-net147@gmail.com>
	<20170730100236.GA28203@linux.intel.com>
	<CANwerB3-Vz2MDKyFTu0kfdA7z2Mgg+y4QtJZ4ZpZZgTABnBCAA@mail.gmail.com>
	<20170731072822.GA32659@linux.intel.com>
From: Jonathan Liu <net147@gmail.com>
Date: Mon, 31 Jul 2017 17:58:24 +1000
Message-ID: <CANwerB1dx__iGC0ogooc1B3WSbQUv5C9SjKeg6h0ppvNBjQL0w@mail.gmail.com>
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
X-List-Received-Date: Mon, 31 Jul 2017 07:58:24 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ed,

On 31 July 2017 at 17:28, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Sun, Jul 30, 2017 at 08:37:26PM +1000, Jonathan Liu wrote:
>> Hi Ed,
>>
>> On 30 July 2017 at 20:02, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>> > On Sat, Jul 29, 2017 at 12:45:27AM +1000, Jonathan Liu wrote:
>> >> Zero may be interpreted as no MBR signature present and another
>> >> partitioning program might install a new MBR signature.
>> >>
>> >> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> >> ---
>> >>  scripts/lib/wic/plugins/imager/direct.py | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
>> >> index f20d8433f1..fe9b688ab0 100644
>> >> --- a/scripts/lib/wic/plugins/imager/direct.py
>> >> +++ b/scripts/lib/wic/plugins/imager/direct.py
>> >> @@ -297,7 +297,7 @@ class PartitionedImage():
>> >>                            # all partitions (in bytes)
>> >>          self.ptable_format = ptable_format  # Partition table format
>> >>          # Disk system identifier
>> >> -        self.identifier = int.from_bytes(os.urandom(4), 'little')
>> >> +        self.identifier = int.from_bytes(os.urandom(4), 'little') or 0xffffffff
>> >>
>> >
>> > Can we generate random identifier by calling os.urandom again if
>> > self.identifier is zero? Something like this, may be?
>> >
>> > while True:
>> >     self.identifier = int.from_bytes(os.urandom(4), 'little')
>> >     if self.identifier:
>> >         break
>> >
>> > Assigning constant 0xffffffff can potentially create nonunique identifiers.
>> >
>>
>> There is no guarantee that urandom will create unique identifiers.
> We can't have a guarantee with urandom, true. My point was that if you
> need random value it's better to call urandom again than using a constant value.
>
>> Infinite loop needs a timeout and error in the case it is unable to
>> generate a suitable identifier.
> I'm not sure it's needed, but it's not a big deal to add this. I really
> doubt os.urandom can generate long enough sequence of zeros.
>
>> It is only 0xffffffff if it is 0. That
>> means 0xffffffff is twice as likely to occur (2 in 4294967296 instead
>> of 1 in 4294967296) so there is tiny bias. Note that this is how it is
>> implemented for the DISK_SIGNATURE variable in OE and in GNU Parted as
>> well.
> Does this mean we shouldn't do better?
>

How about random.SystemRandom().randrange(1, 0xffffffff) ?

>> >>          self.partitions = partitions
>> >>          self.partimages = []
>> >> --
>> >> 2.13.2
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> Regards,
>> Jonathan
>
> --
> Regards,
> Ed

Regards,
Jonathan

