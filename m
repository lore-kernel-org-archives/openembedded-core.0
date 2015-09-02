Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D1B997700A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 07:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t827A0Cb004017; Wed, 2 Sep 2015 08:10:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id b8HjS1qd9L0f; Wed,  2 Sep 2015 08:10:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8279lUf004009
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 2 Sep 2015 08:09:58 +0100
Message-ID: <1441177787.24871.33.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Wed, 02 Sep 2015 08:09:47 +0100
In-Reply-To: <CAP9ODKp9Vkw-vHNp1PMqE1eTfmW8-s5o6+0JYTv=sFEHm9nc1g@mail.gmail.com>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<20150901215512.GE2458@jama>
	<CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
	<255516EC-098E-457B-A2E6-2F7C953CAA8D@gmail.com>
	<CAP9ODKp9Vkw-vHNp1PMqE1eTfmW8-s5o6+0JYTv=sFEHm9nc1g@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Wed, 02 Sep 2015 07:10:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-01 at 19:51 -0300, Otavio Salvador wrote:
> On Tue, Sep 1, 2015 at 7:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> On Sep 1, 2015, at 3:05 PM, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
> >> On Tue, Sep 1, 2015 at 6:55 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >>> I hate to say it, but for meta-oe and meta-qt5 I would like to use
> >>> gerrit - it's great to see all related information (all revisions of the
> >>> patch, all review comments, all results of verification builds) in
> >>> single location from where you do the actual submissions to official
> >>> branch when all criteria are satisfied.
> >>
> >> Me too; we have been using Gerrit for patch management for a while and
> >> it works very well.
> >>
> >> If you want, we can host it at our server, by the way.
> >
> > hmm can we use gerrit.openembedded.org or review.openembedded.org ?
> > may be redirected to a different hosting area underneath.
> 
> If people want it, we can provide a VM for it. So OE can freely host it.

In the interests of being completely clear I do not want to use gerrit
for OE-Core. I was asked to use it as part of another project and it
simply doesn't work with the way I think or handle patches. I cannot
begin to describe how much I disliked it.

I'd also note that it means moving the meta-oe repository to be under
gerrit control. One of the issues we've had in the past with it was that
it is a "all or nothing" solution where it either touches/controls
everything of you don't use it at all :/. What impact that has for other
repos in the system and consistency of the server I'm not sure.

It also doesn't really solve the problem we have with OE-Core which is
simply too many patches for the maintainers/submaintainers and test
cycles we have at the moment. Reading Martin's comments, I realised that
with OE-Core we do try and have a faster turnaround cycle, at least for
the less controversial patches and this probably increases some of the
pressure :/.

I should also mention that progress is being made with patchwork. We've
gone from many patches not being updated correctly to the interface
being better updated automatically now. Its still not perfect but its a
start. I continue to believe that patchwork can better integrated into
the workflows we have with a bit of time, and work is slowly moving
forward with that.

Cheers,

Richard


