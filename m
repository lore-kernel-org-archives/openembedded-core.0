Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id C559C6F8FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 19:01:23 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id x10so1309521pdj.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 12:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=tovERy1ZKh56QMblgRIOj6UKMLRc8syFHzuJS7YsBxc=;
	b=m41KnCH2mWlIGsn22h5y/NZ7ghpzLEbI8PNqyyw4swyTqCh9ePOGb4gmVUtk4U9Pa+
	vS0aHs5UZCGpPgNw4Y+Sqes9qzWYLkQsQJxzBHMKiKBN9KapM4xQoJQaD4IW2EAaYpNC
	HENsdYwW5Bg1pHHWbABKaZa8HzqnZdk64YVGunBuIBSJrjXIFnAv/CV9WoQCdLszi/8V
	qos73vvYtZI7g/TnRKM2LyzcLK3YlUzYGTp8E2pHg74o5gCxcpT161fZUnheJWIVE65G
	Gl4exUge4cmWC4fA5ojjOO8j/CrdZXZJpIvFxSRk3ynX+WeZsDLYM4Rc1RYQWb2JGe6f
	x5pA==
X-Gm-Message-State: ALoCoQkzHySQaeTxdFCMjR/WuEwth3Lbema6fsYxqorLGDUa8E9aZLWay5Bv1ALsa101GbfDwLae
MIME-Version: 1.0
X-Received: by 10.68.241.73 with SMTP id wg9mr50727199pbc.62.1395342084072;
	Thu, 20 Mar 2014 12:01:24 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.11.164 with HTTP; Thu, 20 Mar 2014 12:01:24 -0700 (PDT)
In-Reply-To: <B0C68756-9FE4-459F-9DFE-753106847A87@dominion.thruhere.net>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
	<CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
	<CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
	<B0C68756-9FE4-459F-9DFE-753106847A87@dominion.thruhere.net>
Date: Thu, 20 Mar 2014 19:01:24 +0000
X-Google-Sender-Auth: _gRN-8JIlFIJhp100XRujasjoXg
Message-ID: <CAOMwXhMDOma1N73M5n64G2T-FaH+Zevo2r8baenFsX9EZiFa5Q@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Thu, 20 Mar 2014 19:01:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 4:28 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 20 mrt. 2014, om 14:28 heeft Burton, Ross <ross.burton@intel.com> het volgende geschreven:
>
>> On 20 March 2014 12:44, Laszlo Papp <lpapp@kde.org> wrote:
>>> You are free to NACK without an explanation why it is important, but
>>> do not expect it to weigh much that way, at least in my eyes, based on
>>> that you are not even a maintainer as far as I know.
>>
>> One good reason: systemd reads the LSB headers.
>
> As well as other inits that support sysv mode.

This init script is adding support for sysv and no more. This is also
indicated in the first line of the commit message. I am sorry, but I
will not test it systemd and with other systems. You are free to test
it with everything in the world out there, and provide a more
intelligent change and void my work.

This is what I call not pragmatic. It is not like incremental
improvement is not useful because it does not do all the things in the
world right away. This is clearly communicated in the commit message
what it is for. For SysV, this is not any problem, it works fine.

No one has revealed a real issue with that so far as far as I can
tell. So why block a feature that was meant for something just because
someone cannot test on everything and/or does not want? What is being
read here in my understand is, "everything or nothing". This is not
pragmatic.

Please notice that perfection is the enemy of good. So my bottom line,
feel free to reject this feature in favor of having nothing instead of
something.

Unless someone can come up with a rebuttal that it is not working for
the intended and documentation use case, I am not willing to change
it, sorry. It would be pointless because I could not test it anyway,
and I will not send blind changes like that.

