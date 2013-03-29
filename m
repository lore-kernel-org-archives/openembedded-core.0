Received: from mail-ve0-f181.google.com ([209.85.128.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULZ7e-0007l9-CW
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 14:13:34 +0100
Received: by mail-ve0-f181.google.com with SMTP id pa12so493814veb.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=wkSyxWRl4GSGi11xETlwBUgyFPHsPLcQyRYoe+i3a74=;
	b=ygQFF0+eBG4TQvfzFDX3gL2Qr9mWWSWhc1guj9N0UEkbSMyAvT/7bU49LcqjPe0aHQ
	Hytj6ExF8PHSsEGITXWQ8VVZGc5yXKqCFwxOaxKrxIrA0tzQEBH36/FwDIFH2kJCWc/z
	wALsKXSYuhC7tI+n8f5A0SXuO9oTJh+b651vixLIG90yeNAejh48MHOq+u0wywNK6Dci
	mf2uL3i1HNpexd5jXpC8eQlDH77Xfeg0jJKcXK3gM1YoUy17c3ad2fDI4bEWGkZu8aBX
	nlWd8AI2n0fDieHpRSE6koYpxqRMDSH6YjMjPVr4Z3mhiTXBRwM05BJVsqFxkTBnEDYu
	D0qg==
MIME-Version: 1.0
X-Received: by 10.52.65.147 with SMTP id x19mr1501158vds.27.1364561790123;
	Fri, 29 Mar 2013 05:56:30 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Fri, 29 Mar 2013 05:56:30 -0700 (PDT)
In-Reply-To: <CALbNGRSs_t4EbStjw4S6djPiL3xJDRQ0U0MvS820f1OkC7Q6cQ@mail.gmail.com>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
	<20130328122110.GA5105@jama>
	<35803143-FAED-48CC-9FD1-1E216B3A575C@gmail.com>
	<A54391FA-3CD5-4290-A92B-EE3477A2EEAE@dominion.thruhere.net>
	<D8B28775-1426-427F-B7CB-E10164FAF197@gmail.com>
	<CALbNGRSs_t4EbStjw4S6djPiL3xJDRQ0U0MvS820f1OkC7Q6cQ@mail.gmail.com>
Date: Fri, 29 Mar 2013 13:56:30 +0100
Message-ID: <CALbNGRSy1T1SxSGPbKK+Zz=aZi9FdmDBx5Qs2bSWgQM1=AtiwA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 13:13:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2013 at 1:50 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Mar 29, 2013 at 9:18 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mar 29, 2013, at 1:12 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
>>
>>>
>>> Op 29 mrt. 2013, om 06:28 heeft Khem Raj <raj.khem@gmail.com> het volge=
nde geschreven:
>>>
>>>>
>>>> On Mar 28, 2013, at 5:21 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>>>>
>>>>> On Thu, Mar 28, 2013 at 12:48:29AM -0700, Khem Raj wrote:
>>>>>> udevadm is now moved from /usr/bin to /bin so account for that
>>>>>> bash completions for udevadm should be packages with udev-utils
>>>>>> since thats where udevadm itself is, they were in systemd package
>>>>>> which is not correct location for it
>>>>>>
>>>>>> Backport patches for readahead fixes on spinning disks
>>>>>> and to tackle error reported on missing /etc/sysctl.conf
>>>>>
>>>>> Looks like it creates few new (empty) directories:
>>>>>
>>>>> WARNING: QA Issue: systemd: Files/directories were installed but not
>>>>> shipped
>>>>> /etc/kernel
>>>>> /etc/kernel/install.d
>>>>> /usr/lib/kernel
>>>>> /usr/lib/kernel/install.d
>>>>
>>>>
>>>> OK I have created a new package called systems-kernel-install and thes=
e dirs along with
>>>> kernel-install binary are moved into the new package and updated the p=
ull request.
>>>
>>> There's a new releases, 200, mostly bugfixes and some hwdp and  keymap =
updates. Your 199 patch has the most important fixes, so I'm not sure if it=
's worth to respin to 200 or get this in and update to 200 (or 201) later.
>>
>>
>> yeah lets stay at 199 for some time and cherry pick fixes we need.
>>
>>
> Anybody an idea why I get this when building from scratch:
>
> | /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a=
-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
> 'systemd': No such file
> | make[2]: *** [org.freedesktop.systemd1.Manager.xml] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a=
-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
> 'systemd': No such file
> | make[2]: *** [org.freedesktop.systemd1.Unit.xml] Error 1
> | /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a=
-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
> 'systemd': No such file
> | make[2]: *** [org.freedesktop.systemd1.Service.xml] Error 1
> | /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a=
-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
> 'systemd': No such file
> | make[2]: *** [org.freedesktop.systemd1.Job.xml] Error 1
> | /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a=
-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
> /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-v=
fp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
> 'systemd': No such file
> | 'systemd': No such file
> | make[2]: *** [org.freedesktop.systemd1.Socket.xml] Error 1
> | make[2]: *** [org.freedesktop.systemd1.Timer.xml] Error 1
> | /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a=
-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
> 'systemd': No such file
> | make[2]: *** [org.freedesktop.systemd1.Target.xml] Error 1
>
FYI: Last building version is 197

Andreas


