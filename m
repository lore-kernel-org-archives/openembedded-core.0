Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 096CF7641E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 18:39:09 +0000 (UTC)
Received: by obnw1 with SMTP id w1so13888526obn.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 11:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5WKwKGCdDqiVwVF7zIgm2S3+JWf41gXWgQ0YrJ1gqCs=;
	b=S0VcS1yrL+rHv5zTCFGnGf+s55E2GPp53kk9lJLF8ezsST94S9fYHVx2UZ4o+m3yXr
	VnWeGRoxrwH0HlYvWhVVVOhe8xCnHGkX5A6/FcZ6kYpxKJeZMSNiOW7VxAbm5bk0H6eo
	M1RMg9jXMoJ8SkwBzPQsHdO/r3vJaUO/A5d6ywnTYOncS9675k7m8wYBMEUEWaT6xDhC
	GhvIgLEHImEQs6ENXXvaJjoju6uUTOMnrOZ/MYm/LdtcfYxLSjh8oWbXT8eQVEx7U+kx
	t3Zvz+IRWUiraNLeLlYbtUfpT74nqZLOa5aTbBbspXozJBAOIA4tPBRc+k2qPG23jW7v
	yvjA==
MIME-Version: 1.0
X-Received: by 10.182.196.72 with SMTP id ik8mr41439114obc.36.1438195149167;
	Wed, 29 Jul 2015 11:39:09 -0700 (PDT)
Received: by 10.202.102.147 with HTTP; Wed, 29 Jul 2015 11:39:09 -0700 (PDT)
In-Reply-To: <CAP9ODKpEdFGPMMSy2h82_Z0ozeS_ZQqAZ2o9vfi4Gzt7cvjbBA@mail.gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
	<1438125665-14966-8-git-send-email-armccurdy@gmail.com>
	<CAJTo0LZP1wrXWFaOh4kRqDmY5cXqOACS54aZK0OqAzhtyz0Lzg@mail.gmail.com>
	<CAP9ODKpEdFGPMMSy2h82_Z0ozeS_ZQqAZ2o9vfi4Gzt7cvjbBA@mail.gmail.com>
Date: Wed, 29 Jul 2015 11:39:09 -0700
Message-ID: <CAJ86T=UZNJm__8yEYEt_BjxgnS=D0Zu3-UY2XQAowJ3EYx1B_Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] busybox: disable fstrim in defconfig
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
X-List-Received-Date: Wed, 29 Jul 2015 18:39:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 9:28 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Wed, Jul 29, 2015 at 11:22 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 29 July 2015 at 00:21, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> The fstrim applet (to discard unused blocks on a mounted filesystem)
>>> doesn't seem like core functionality, so disable by default.
>>
>>
>> With SSDs being more common, is this really true?  What's the size impact of
>> this?
>
> I agree with Ross here and I think it should stay enabled.

I was thinking most people with an SSD would "mount -o discard" and
let the filesystem take care of issuing trim commands. Trimming
manually from a shell script seems like more of a niche requirement.

The fstrim applet adds less than 200 bytes to the busybox binary
though (x86). I'll send an updated patch series which leaves it
enabled.

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

