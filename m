Received: from mail-vc0-f176.google.com ([209.85.220.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULZ2G-0007eb-Rm
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 14:08:00 +0100
Received: by mail-vc0-f176.google.com with SMTP id ib11so455885vcb.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 05:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=LWCebDOmXgt9jBTOawZfqIcuPDn6GjqtfdkvcPCTVvk=;
	b=pjYBwwv4z1NuwCCJkydc0Ff8NAKUQhou97xUI2DYFEm9I27HYHMdFYdc3I0TcTzUhR
	O5GgxhwQaKyJLOtrR4h3ooD8I+cLgaMjq0PfJPHN/SthT7Gqhn212SM5l2mC5iAd6tiJ
	u6Xn4FzfvhuqKhI3hVdL77kd12LBvBWEv6PSnDdw9Zw9nlXwcAd+LO78+HQSKux7VrmV
	kd5RNqU4zIHFtwG54r/9BKHN9+9Zyh/E4YllO6UtlHLO424eCKN0tJCHQaelAGxf46QJ
	E7ael0fGr+jBI0ncYfyaqu2slVP6v/gy/KNuek2mshH7I5tmbA8mJddVncknxp+Q6qar
	LDag==
MIME-Version: 1.0
X-Received: by 10.52.65.147 with SMTP id x19mr1490727vds.27.1364561456568;
	Fri, 29 Mar 2013 05:50:56 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Fri, 29 Mar 2013 05:50:56 -0700 (PDT)
In-Reply-To: <D8B28775-1426-427F-B7CB-E10164FAF197@gmail.com>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
	<20130328122110.GA5105@jama>
	<35803143-FAED-48CC-9FD1-1E216B3A575C@gmail.com>
	<A54391FA-3CD5-4290-A92B-EE3477A2EEAE@dominion.thruhere.net>
	<D8B28775-1426-427F-B7CB-E10164FAF197@gmail.com>
Date: Fri, 29 Mar 2013 13:50:56 +0100
Message-ID: <CALbNGRSs_t4EbStjw4S6djPiL3xJDRQ0U0MvS820f1OkC7Q6cQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 29 Mar 2013 13:08:01 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 29, 2013 at 9:18 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mar 29, 2013, at 1:12 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
>>
>> Op 29 mrt. 2013, om 06:28 heeft Khem Raj <raj.khem@gmail.com> het volgende geschreven:
>>
>>>
>>> On Mar 28, 2013, at 5:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>>> On Thu, Mar 28, 2013 at 12:48:29AM -0700, Khem Raj wrote:
>>>>> udevadm is now moved from /usr/bin to /bin so account for that
>>>>> bash completions for udevadm should be packages with udev-utils
>>>>> since thats where udevadm itself is, they were in systemd package
>>>>> which is not correct location for it
>>>>>
>>>>> Backport patches for readahead fixes on spinning disks
>>>>> and to tackle error reported on missing /etc/sysctl.conf
>>>>
>>>> Looks like it creates few new (empty) directories:
>>>>
>>>> WARNING: QA Issue: systemd: Files/directories were installed but not
>>>> shipped
>>>> /etc/kernel
>>>> /etc/kernel/install.d
>>>> /usr/lib/kernel
>>>> /usr/lib/kernel/install.d
>>>
>>>
>>> OK I have created a new package called systems-kernel-install and these dirs along with
>>> kernel-install binary are moved into the new package and updated the pull request.
>>
>> There's a new releases, 200, mostly bugfixes and some hwdp and  keymap updates. Your 199 patch has the most important fixes, so I'm not sure if it's worth to respin to 200 or get this in and update to 200 (or 201) later.
>
>
> yeah lets stay at 199 for some time and cherry pick fixes we need.
>
>
Anybody an idea why I get this when building from scratch:

| /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
'systemd': No such file
| make[2]: *** [org.freedesktop.systemd1.Manager.xml] Error 1
| make[2]: *** Waiting for unfinished jobs....
| /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
'systemd': No such file
| make[2]: *** [org.freedesktop.systemd1.Unit.xml] Error 1
| /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
'systemd': No such file
| make[2]: *** [org.freedesktop.systemd1.Service.xml] Error 1
| /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
'systemd': No such file
| make[2]: *** [org.freedesktop.systemd1.Job.xml] Error 1
| /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
'systemd': No such file
| 'systemd': No such file
| make[2]: *** [org.freedesktop.systemd1.Socket.xml] Error 1
| make[2]: *** [org.freedesktop.systemd1.Timer.xml] Error 1
| /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
'systemd': No such file
| make[2]: *** [org.freedesktop.systemd1.Target.xml] Error 1

Andreas


