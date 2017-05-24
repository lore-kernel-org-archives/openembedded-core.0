Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 58FE577DC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 13:38:11 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id d127so68755988wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hYnZyY0vKDlTn4zfFtiS47T3OIGI2caVEw0hmTEsNMs=;
	b=Dt+P7lPw67lSHsxma8nupClT8JgU5par40OnIGmSDSznuURqV1Irx4ptgejk+abHAd
	fap927KWjOwhQy6f2RCBgoTzhalr+w9j3EGTHIo69LEApLmDkP2/Q+JrF+WZpa3ass1u
	mI7z0VhLvHnaIUQaGDSzjgmxgg7b35dN1+xntuKcyrfAmeqpo8ndQJcgJpW0upGyDmlF
	QL+gy20A3CfRzS6eaRT/VsOCExoPICp7XnkaDmWltzhhdlgmufcfeuUHtd1YlVUuEF48
	FLU64n7ZVYCkuUgkEc0kXdTwWeiz85Z2QqvCcsI3oHJ8wjmL7snWe5cqzYYpdlSbJEHW
	DgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hYnZyY0vKDlTn4zfFtiS47T3OIGI2caVEw0hmTEsNMs=;
	b=sNnIycA7p+nqvFv5bXHhH7bjv4VZCXU9sUpwiQw4cy+RD9OD/HAn8OOnm2lzZz3N0g
	0mVsrTSYQX0p5QnSUsXgaZXJLThau5Opd7gLQE9bQfIvQ6ZE0hHCFkjwhYo815iKAm4W
	K3SzRAQPZbpxANP+pBuw8QLdtJeJolmLxIQ9ZT0uqdYLqz2smaO4tDckBLndQPdRAzaZ
	DuMRjBbmO1twvtjWjuM9ItfeBgjHpOR2xETkP8PuYHOfvhHThhVwRDzWW3d4JXDZhxHh
	J5GfiCvDN8Qe7yO05TZ2sgJXvxgOMApKi4xJ+5UKmoXWQpqxf3A0J52V1xeTb5pr49hl
	Alxw==
X-Gm-Message-State: AODbwcACYrfcyy/yZewU5l+ORGnl0d/vsbm76lCQ7+5L3ZB63Qx6kuj2
	QGx/iDELErY/gGUIFQCsYtw+SIqtBw==
X-Received: by 10.28.69.11 with SMTP id s11mr5794582wma.85.1495633091806; Wed,
	24 May 2017 06:38:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.128.65 with HTTP; Wed, 24 May 2017 06:38:11 -0700 (PDT)
In-Reply-To: <410d6a00d45b4b1fa84dd0e36196f753@XBOX02.axis.com>
References: <20170507013304.30165-1-JPEWhacker@gmail.com>
	<CAJTo0Lafr6dearC1uiQpumEUHA9ggAC59MhtvFWVvYi-Oc_8TQ@mail.gmail.com>
	<CAJdd5GZeT8h7qXfKF=XM7Q0kKoMgQSxNprqhWz7wYv_vBquzTQ@mail.gmail.com>
	<09a43b20-0aa0-beed-f019-762bb23d0a79@linux.intel.com>
	<CAJdd5GadD1wBi_GcWQRk92pW8WG-oUQcATLDemWXcZkCax+pjA@mail.gmail.com>
	<CAJdd5GZWc73h2hgGk=LboLfYkMPOME1yLoLCZyK5hCy79_TV+w@mail.gmail.com>
	<410d6a00d45b4b1fa84dd0e36196f753@XBOX02.axis.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 24 May 2017 08:38:11 -0500
Message-ID: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: Atomically generate host keys
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
X-List-Received-Date: Wed, 24 May 2017 13:38:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 24, 2017 at 5:03 AM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Joshua Watt
>> Sent: den 23 maj 2017 21:57
>> To: Randy Witt <randy.e.witt@linux.intel.com>
>> Cc: OE-core <openembedded-core@lists.openembedded.org>
>> Subject: Re: [OE-core] [PATCH] openssh: Atomically generate host keys
>>
>> On Tue, May 23, 2017 at 12:56 PM, Joshua Watt <jpewhacker@gmail.com>
>> wrote:
>> > On Tue, May 23, 2017 at 12:23 PM, Randy Witt
>> > <randy.e.witt@linux.intel.com> wrote:
>> >> On 05/23/2017 08:29 AM, Joshua Watt wrote:
>> >>>
>> >>> On Tue, May 23, 2017 at 9:37 AM, Burton, Ross
>> <ross.burton@intel.com>
>> >>> wrote:
>> >>>>
>> >>>>
>> >>>> On 7 May 2017 at 02:33, Joshua Watt <jpewhacker@gmail.com> wrote:
>> >>>>>
>> >>>>>
>> >>>>> +if [ ! -f "$NAME" ]; then
>> >>>>> +    echo "  generating ssh $TYPE key..."
>> >>>>> +    ssh-keygen -q -f "${NAME}.tmp" -N '' -t $TYPE
>> >>>>> +
>> >>>>> +    # Sync to ensure data is written to temp file before
>> renaming
>> >>>>> +    sync
>> >>>>> +
>> >>>>> +    # Move (Atomically rename) files
>> >>>>> +    # Rename the .pub file first, since the check that triggers
>> a
>> >>>>> +    # key generation is based on the private file.
>> >>>>> +    mv -f "${NAME}.tmp.pub" "${NAME}.pub"
>> >>>>> +    sync
>> >>>>> +
>> >>>>> +    mv -f "${NAME}.tmp" "${NAME}"
>> >>>>> +    sync
>> >>>>> +fi
>> >>>>>
>> >>>>
>> >>>> All of these syncs seem quite enthusiastic, are they really
>> needed?
>> >>>> Writing
>> >>>> the file to a temporary name and then mving it to the real name
>> should
>> >>>> result in either no file or a complete file in the event of power
>> loss,
>> >>>> surely?
>> >>>
>> >>>
>> >>> My understanding (and observation) of most journal file systems is
>> >>> that only metadata (i.e. directory entries and such) are journaled
>> in
>> >>> typical usage. The first sync is necessary in this case to ensure
>> that
>> >>> the actual file data gets put on the disk before we rename the
>> files,
>> >>> otherwise in the event of interruption journaled rename might get
>> >>> replayed but have garbage data. The second one is more of a "force
>> >>> operation order" sync to make sure the public file is written
>> before
>> >>> the private one, as a reordering would cause problems. The last
>> sync
>> >>> is the most optional, but I've seen it take minutes for disk to
>> sync
>> >>> contents if no one calls "sync", so it is very possible that all
>> our
>> >>> work of regenerating keys would be for naught if power is
>> interrupted
>> >>> in the meantime.
>> >>>
>> >>> I think some of these syncs can be removed. Namely, the first and
>> >>> third one. The second one needs to be there, but can server double
>> >>> duty of syncing data to disk and enforcing the order between the
>> >>> public and private rename. It does mean we could get a state where
>> the
>> >>> public key exists but is garbage, but this should be OK because the
>> >>> private key won't exist and it would be regenerated.
>> >>>
>> >>> The third sync can be removed and I can put one final sync at the
>> end
>> >>> after all keys are generated to ensure we won't go through all the
>> >>> effort of regenerating the (last) key again in the event of
>> >>> interruption shortly after, unless you would prefer I didn't.
>> >>>
>> >>
>> >> The typical convention for this is,
>> >>
>> >> 1. Update file data.
>> >> 2. sync file
>> >> 3. sync containing directory
>> >> 4. mv file to new location
>> >> 5. sync directory containing new file (although I've seen this step
>> left out
>> >> before)
>> >>
>> >> https://lwn.net/Articles/457672/ is a good example which is linked
>> from
>> >> https://lwn.net/Articles/457667/
>> >>
>> >> But one of the important parts vs your code, is also that the
>> example is
>> >> only calling sync on the files/directory needed, vs calling "sync"
>> with no
>> >> arguments which is going to cause all data in all filesystem caches
>> to be
>> >> flushed.
>> >
>> > Ah, OK. That makes sense, I will update sync to specify the
>> > files/directory explicitly.
>>
>> FWIW, I did some tests on the sync behavior:
>>
>> It appears that older versions of the sync command ignore any
>> arguments and just call sync(). From Ubuntu 14.04:
>> $ strace sync foo
>> ...
>> write(2, "sync: ", 6sync: )                   = 6
>> write(2, "ignoring all arguments", 22)  = 22
>> write(2, "\n", 1)                       = 1
>> sync()                                  = 0
>> ...
>>
>> The same is true for the (default) busybox version of sync on master
>> (again verified with strace), but it doesn't complain nosily about it.
>
> Busybox has a separate fsync applet to do file synchronization, but it
> is not enabled in the default OE-core configuration...

Ok. I think for best compatibility I'll just use "sync", as that will
always be safe, just not always optimally efficient. I think this is
OK, since key generation either only occurs once (r/w rootfs), or once
per boot (r/o rootfs).

>
>> I looked at the coreutils code, and sync was changed to respect
>> arguments in January of 2015
>> (8b2bf5295f353016d4f5e6a2317d55b6a8e7fd00) and only call fsync() on
>> the provided arguments (if any are provided).
>>
>> Either way, adding the arguments to the sync call in my patch won't
>> hurt because it is forward compatible, even though it won't be
>> optimally efficient currently because the sync command currently
>> simply calls sync()
>
> //Peter
>

