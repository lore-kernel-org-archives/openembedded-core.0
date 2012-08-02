Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Swk6Z-00017k-QS
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 03:21:35 +0200
Received: by lbol5 with SMTP id l5so616615lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 18:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=cXmdkv/qk1imXavO7F5IHmQ6ZM3rjUW+xVIF/agaeJA=;
	b=gT/WND3nkbqqFJCI+43M32p+k1befDtVG2LZL0wm/5OHeyho7CGiaKlHSGKWnqjs8M
	f2v4fzBCydGKSx16OU+1Jram9dZ9Bgcz0RM+oo9adS4Y3q/VMFuGJgXLmHqSM6eW74kc
	7gMBG5Ge9OwCbxsgzhQX7oLwwHdrL1tOlGl6jJBD4EZImqo4ZBZva38yvW54Q0OeqSzW
	pM4rIVz/A8uZ8sVxrBjm7zjoun8qUF1HUTxuigJXJlB3+XjWXB0UcohgKKQaZ9STwXBk
	KmngnAT74N3s9qjISE7ymtITgaNPtjUI8Di9jBi1k92qshfu3ULiAuTeBTU50GBsGun1
	mVTw==
Received: by 10.112.11.38 with SMTP id n6mr8600823lbb.82.1343869796820; Wed,
	01 Aug 2012 18:09:56 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.209 with HTTP; Wed, 1 Aug 2012 18:09:36 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1208012004070.4406@oneiric>
References: <alpine.DEB.2.02.1208011831540.5168@oneiric>
	<CAEsOVNfHoY3gbwJoVCUfS61LeN_idZpNMtU3aOmZLVs7=BDQmA@mail.gmail.com>
	<alpine.DEB.2.02.1208011855500.26345@oneiric>
	<CABcZANkSy37E3DFWH6n53sbG-7nPzOzBBfPp2JOqRzhyPS=erQ@mail.gmail.com>
	<alpine.DEB.2.02.1208012004070.4406@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 1 Aug 2012 18:09:36 -0700
X-Google-Sender-Auth: VJuxigIrJnjXnmAUxgiqAAovNcc
Message-ID: <CABcZANmZ=A+BJSTvnhHHaChzn=4t9yXKJmHhO4xistaOga5Gdw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: using an external (arm) toolchain - just checking i did this properly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 01:21:36 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 1, 2012 at 6:06 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Wed, 1 Aug 2012, Chris Larson wrote:
>
>> On Wed, Aug 1, 2012 at 4:57 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>> > | + cp -a ERROR: ld.so: object ''\''libpseudo.so'\''' from LD_PRELOAD
>> > cannot be preloaded: ignored.
>> > /home/rpjday/CodeSourcery/Sourcery_G++_Lite/bin/../arm-none-linux-gnueabi/libc/lib/.
>> > /home/rpjday/y/builds/oe/qemuarm_csl/tmp-eglibc/work/armv5te-oe-linux-gnueabi/external-sourcery-toolchain-2009q1-203-r7/image/lib
>> > | cp: target
>> > `/home/rpjday/y/builds/oe/qemuarm_csl/tmp-eglibc/work/armv5te-oe-linux-gnueabi/external-sourcery-toolchain-2009q1-203-r7/image/lib'
>> > is not a directory
>> > | ERROR: Function failed: do_install (see
>> > /home/rpjday/y/builds/oe/qemuarm_csl/tmp-eglibc/work/armv5te-oe-linux-gnueabi/external-sourcery-toolchain-2009q1-203-r7/temp/log.do_install.26331
>> > for further information)
>> > NOTE: package external-sourcery-toolchain-2009q1-203-r7: task
>> > do_install: Failed
>> > ERROR: Task 270
>> > (/home/rpjday/y/src/oe-core/meta/recipes-core/meta/external-sourcery-toolchain.bb,
>> > do_install) failed with exit code '1'
>> > NOTE: Tasks Summary: Attempted 83 tasks of which 78 didn't need to be
>> > rerun and 1 failed.
>> > ERROR: An uncaught exception occured in runqueue, please see the
>> > failure below:
>> >
>> >   but i'm *guessing* it's because i don't have the 32-bit libs
>> > installed on my 64-bit ubuntu system.  i'll worry about that after
>> > food.
>>
>> Could be, also make sure you have NO32LIBS set to 0. The toolchain
>> binaries are 32 bit, so need a 32 bit libpsuedo.
>
>   that would appear to be the issue.  however, since i already built
> all the native tools, do i have to start from scratch and rebuild it
> after changing the value of NO32LIBS?  since it would seem that the
> current build of pseudo won't do me any good.  does that make any
> sense?

Yeah, I'd just run 'bitbake pseudo-native'.
-- 
Christopher Larson


