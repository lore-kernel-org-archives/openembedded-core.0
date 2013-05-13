Received: from mail-la0-f46.google.com ([209.85.215.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UbzWG-0002H7-2k
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 22:38:52 +0200
Received: by mail-la0-f46.google.com with SMTP id fk20so6598607lab.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 13:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=+7uFQnrxsLvRYZaQuXUXzOFDrrdmaWIsTuD7D9MqfG4=;
	b=Ks65MgMJu2wWN0bl0ti+vCHrrSOgWX3zdHbNZmq1U0MwJbBO/qSPRZt5C5VupRrZnG
	fPq+QNhSIbdJShcwGg2p4C5/A09pxNhAIUjsKJqMC/AlsYBcGmfK5jjRkII3dC3g2q9Q
	QMg7gOIfqkwT7Vq7YkcFPKj+KG1STobC4uK5IgWLNNOPb7rMWguhuqlSk3q88PBnEPN+
	7OXOiyHYFkciW7yEI/6s0wl3liDicvcWUcM7cXS0DeD72kjlapU7xG6ua5lKEmhlFLgr
	D+kXzJJaW/PGq+WeWvbhzVM+KIauXKl0URKx+oE4xLK7Vm+rdU/aT43fHjTr6OUIKuOh
	XA/g==
MIME-Version: 1.0
X-Received: by 10.152.1.196 with SMTP id 4mr14106500lao.54.1368476441205; Mon,
	13 May 2013 13:20:41 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Mon, 13 May 2013 13:20:41 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305131558330.23405@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
Date: Mon, 13 May 2013 16:20:41 -0400
Message-ID: <CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Mon, 13 May 2013 20:38:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 3:59 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Mon, 13 May 2013, Trevor Woerner wrote:
>
>> On Mon, May 13, 2013 at 3:38 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>> >   having unwisely wandered into this MIPS64 minefield a couple weeks
>> > back, i might as well see if i can get a build.  in short:
>> >
>> > * switch to kraj/qemumips64 branch of openembedded-core-contrib
>> > * add that as another layer along with oe-core
>>
>>
>> I believe you only need to add this oe-core/meta layer once. My bblayers.conf contains:
>>
>>      BBLAYERS ?= " \
>>           /home/trevor/devel/yocto/git/meta-poky/meta-yocto \
>>           /home/trevor/devel/yocto/git/meta-poky/meta-yocto-bsp \
>>           /home/trevor/devel/yocto/git/openembedded-core/meta \
>>           "
>>      BBLAYERS_NON_REMOVABLE ?= " \
>>           /home/trevor/devel/yocto/git/openembedded-core/meta \
>>           /home/trevor/devel/yocto/git/meta-poky/meta-yocto \
>>           "
>>
>>
>> > * MACHINE = "qemumips64"
>> > * bitbake a core-image-minimal
>> >
>> >   is there anything critical i'm forgetting? what's the safest simple
>> > image to try to build?  fetching is now underway ...
>>
>> That's exactly what I tried.
>
>   so, once the build finishes, should i be expecting to run anything
> other than (if memory serves):
>
> $ runqemu qemumips64
>
> ???  any known issues or surprises?

That's all you need, here's my output:

root@qemumips64:~# uname -a
Linux qemumips64 3.8.11-yocto-standard #1 PREEMPT Mon May 13 15:47:58
EDT 2013 mips64 GNU/Linux

That's built from scratch on Yocto master. So clearly there's something strange
going on in the failing configs.

Bruce

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


