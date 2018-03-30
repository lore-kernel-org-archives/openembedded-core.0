Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 35AED74663
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 09:13:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2U9D5Hj003616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 30 Mar 2018 10:13:06 +0100
Message-ID: <1522401185.11431.117.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2018 10:13:05 +0100
In-Reply-To: <CAJ86T=XqUjHH-1_pBKfozk588wWBmqHTOhOBfT15iEmx8qC7rw@mail.gmail.com>
References: <1512524120-16006-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=WiHB_6J8Rj0YXv7MTqu7xBgLFt9+09W+UsEjKd-PoyAA@mail.gmail.com>
	<CAJ86T=Ur=A8XQH=UJu9NmxE7KmPgYmWN0bLL8X1akvV0vLNA7w@mail.gmail.com>
	<CAJ86T=U+mP5KPJBUL+18i3g21nCiMX_JNi0_Ad2mj5iGNqFvog@mail.gmail.com>
	<CAJ86T=XqUjHH-1_pBKfozk588wWBmqHTOhOBfT15iEmx8qC7rw@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [morty][PATCH] lib/oe/terminal.py: use an absolute path to execute oe-gnome-terminal-phonehome
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
X-List-Received-Date: Fri, 30 Mar 2018 09:13:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-03-28 at 15:55 -0700, Andre McCurdy wrote:
> On Fri, Mar 9, 2018 at 8:15 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > 
> > On Wed, Feb 21, 2018 at 1:40 PM, Andre McCurdy <armccurdy@gmail.com
> > > wrote:
> > > 
> > > On Tue, Jan 23, 2018 at 12:16 PM, Andre McCurdy <armccurdy@gmail.
> > > com> wrote:
> > > > 
> > > > On Tue, Dec 5, 2017 at 5:35 PM, Andre McCurdy <armccurdy@gmail.
> > > > com> wrote:
> > > > > 
> > > > > From: Ming Liu <liu.ming50@gmail.com>
> > > > > 
> > > > > A flaw was found on my Ubuntu 14.04.5 LTS, on which that
> > > > > gnome-terminal is
> > > > > the default terminal, when I run any of the tasks:
> > > > > bitbake busybox -c menuconfig/devshell/devpyshell
> > > > > bitbake virtual/kernel -c menuconfig/devshell/devpyshell
> > > > > 
> > > > > I got a error as follows:
> > > > > "Failed to execute child process "oe-gnome-terminal-
> > > > > phonehome" (No such file or directory)"
> > > > > 
> > > > > Seems the environment of the process calling Popen is not
> > > > > passed to the
> > > > > child process, this behaviour is a known issue in Python bug
> > > > > tracker:
> > > > > http://bugs.python.org/issue8557
> > > > > 
> > > > > It could be fixed by using an absolute path instead per test.
> > > > Ping.
> > > Ping again.
> > And again...
> > 
> > It looks like this (and a couple of other patches) made it as far
> > as:
> > 
> >   http://git.openembedded.org/openembedded-core-contrib/log/?h=stab
> > le/morty-next
> > 
> > but then got stuck or forgotten?
> Ping number four.
> 
> As an interesting data point, it's now over 20 months since the bug
> was introduced and first reported on the mailing list:
> 
>   http://lists.openembedded.org/pipermail/openembedded-core/2016-July
> /124215.html

Sorry, I think the problem is my mail archives don't seem to have this
original patch. Each time there is a ping, I go and try and find it,
get confused and then get distracted. I have no idea why this isn't
there.

I've queued it in morty-next which should give some hope to this
getting sorted, assuming we can fix the other morty breakage and get
clean builds.

Cheers,

Richard



