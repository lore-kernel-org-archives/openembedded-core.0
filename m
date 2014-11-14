Return-Path: <wrob311@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6693F6FC68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 00:14:54 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id w7so3364330lbi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 16:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=IxavoStXqeitImq6Q9aCmIVd/rpyRogsdWm6sV41hEk=;
	b=ckCJM3Ub3co4L9ZZvL9LruAJtKIaNkbXFfuaibWYK6RmM0mc+J7RAKOFGY9zZriChl
	/7RztrgBzMvdJ+sJR9CWuVRj4Q9UsLKpcXnhgVjiStl6ZOaU5zUZTT+SpphEqH6/bgwH
	GffysJaRxxCNkEHyYMpL40jfmhF2ik54nr8Rfs0eIr7H57beiAj+PdKStUgLZbaUWZOs
	wRjLyyKceQCDe3CmhoU6IwUI2XIWyhB+v77/rrHmKWTZtPf+xmKfPlZGaRJ2EGyTinkX
	7NIKin8vy3AmyIxd19EsGWRIFDYsQHasyQSSYNTMtwxcoYiT+8KC0BkbkHFP8q9DRTbh
	cHTQ==
MIME-Version: 1.0
X-Received: by 10.152.19.37 with SMTP id b5mr8087lae.80.1415924094289; Thu, 13
	Nov 2014 16:14:54 -0800 (PST)
Sender: wrob311@gmail.com
Received: by 10.112.163.168 with HTTP; Thu, 13 Nov 2014 16:14:54 -0800 (PST)
In-Reply-To: <CAJTo0LZgHYJbttvB86MOf1_idnz-B+PQBDsDFNX8Quv44XTyog@mail.gmail.com>
References: <1415832933-372-1-git-send-email-wrobell@pld-linux.org>
	<CAJTo0LbHecBh1J3MqhpXzsrXmUv_963LS+VDD0Vrg_rzFukynQ@mail.gmail.com>
	<CA+92fu_s_2_MzGSEuJKCEvKqE+GG61QANvb_Nb4jgavspT_KDg@mail.gmail.com>
	<CAJTo0LZgHYJbttvB86MOf1_idnz-B+PQBDsDFNX8Quv44XTyog@mail.gmail.com>
Date: Fri, 14 Nov 2014 00:14:54 +0000
X-Google-Sender-Auth: xFsaBDkRjZw2xTtHJPJ7mL8pS4Q
Message-ID: <CA+92fu9dKhKTfo3vRSZDVBi0fKLFKrSN8JU2JNP24=d0Vn-qcw@mail.gmail.com>
From: Artur Wroblewski <wrobell@pld-linux.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Replace Python 3.3.x with Python 3.4.2
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
X-List-Received-Date: Fri, 14 Nov 2014 00:15:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 13, 2014 at 10:52 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 13 November 2014 20:23, Artur Wroblewski <wrobell@pld-linux.org> wrote:
>>
>> > Personally I'd prefer to see a working Python 3.4 integrated in one go
>> > instead of having a broken 3.4 integrated for an unknown about of time.
>> > Hopefully anyone else who is interested in 3.4 can step up and work on
>> > the
>> > outstanding issues now that this patch is public (which is another good
>> > reason to have a public repo with this in).
>>
>> If you specify some exit criteria for this, then I can try to improve
>> the patch. But
>> please keep in mind that Python 3.3 in Yocto is broken to such extent that
>> it
>> crashes due to missing essential modules.
>
>
>  The exit criteria would be a patch to upgrade to 3.4 that doesn't come with
> the caveat that seven of the patches need to be updated.

Yep, there is more work required.

> 3.3 being broken
> is a separate issue to upgrading to 3.4 and we should probably fix 3.3
> first, backport that fix to dizzy, and then upgrade to 3.4.

No incompatibilities were introduced in Python 3.4
(https://docs.python.org/3/whatsnew/3.4.html).
What is your reason to support version of Python, which practically
cannot be started
anyway and is 2 years old?

> I've filed a bug about the startup problem with just python3 installed
> (#6967). Note that whilst this is a bug it's not fundamentally broken as
> installing just python3-core (which python3 is an alias for - more on that
> in a minute) won't pull in the bulk of the runtime library.  Installing
> python3-core and python3-modules brings in the entire runtime, and the
> interpreter starts up fine.

See also bug #6831.

In the context of your bug report, please note that manifest file still does
not contain reprlib (the same in Poky 1.6.1)

    https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python-3.3-manifest.inc

and there is no "misc" package defined there, so I am really confused what
is the mainstream work here.

Regards,

Artur

