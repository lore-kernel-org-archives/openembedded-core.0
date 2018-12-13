Return-Path: <mac@mcrowe.com>
Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
	by mail.openembedded.org (Postfix) with ESMTP id 636266C46D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 15:17:31 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id XSjygmVnR2XG6XSjzgYL21; Thu, 13 Dec 2018 15:17:31 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=CtuRjEwD c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=2ur7OfE09M0A:10 a=YDYnOk0jAAAA:20 a=xNf9USuDAAAA:8
	a=4fKCripP9ZdtPvwEFRwA:9 a=CjuIK1q_8ugA:10 a=SEwjQc04WA-l_NiBhQ7s:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1gXSjy-0002WD-9Z; Thu, 13 Dec 2018 15:17:30 +0000
Date: Thu, 13 Dec 2018 15:17:30 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20181213151730.v2eb7lcyj2ypans6@mcrowe.com>
References: <99949e3e-c252-9504-ea89-f379bab6f021@dresearch-fe.de>
	<CAMKF1soU6M4zv6Xu4ugwheBHGO49cZSnnOD-PWSWJsCaAJC28g@mail.gmail.com>
	<a212aa5f-27a7-3181-cab8-c07fa5eca72a@dresearch-fe.de>
	<d45d83de-c360-6306-d35a-1388fdbd518a@dresearch-fe.de>
	<04a430ad-567a-d9d3-8a17-77e2dd55d025@dresearch-fe.de>
	<20181106190645.4xgvktwoyfuzgmby@mcrowe.com>
	<20181121182831.imvsz7kheqpaswti@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20181121182831.imvsz7kheqpaswti@mcrowe.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfERMlpxfr8asFPnmaw9bP1ErsXD6IUxC5fgaWbpKHmcWdk7n0ndKtjXCF47APd1SXpeTqKooMK+2WBjjwyqXgzVGjwTy8Kg2GRqjzm7d41fVaCpr6UnR
	4+mlKqZZjwmnWIPiSJmECAlwbMa8scsdJSg=
Subject: Re: devshell problems after distro upgrade openSUSE Leap 42.3 -> 15.0 (tmux only)
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
X-List-Received-Date: Thu, 13 Dec 2018 15:17:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 21 November 2018 at 18:28:31 +0000, Mike Crowe wrote:
> On Tuesday 06 November 2018 at 19:06:45 +0000, Mike Crowe wrote:
> > On Monday 16 July 2018 at 08:19:11 +0200, Steffen Sledz wrote:
> > > On 04.07.2018 13:37, Steffen Sledz wrote:
> > > > On 03.07.2018 08:04, Steffen Sledz wrote:
> > > >> On 02.07.2018 20:25, Khem Raj wrote:
> > > >>> On Sun, Jul 1, 2018 at 11:39 PM Steffen Sledz <sledz@dresearch-fe.de> wrote:
> > > >>>>
> > > >>>> After upgrading my build system from openSUSE Leap 42.3 to openSUSE Leap 15.0 a
> > > >>>>
> > > >>>>   bitbake foo -c devshell
> > > >>>>
> > > >>>> no longer switches to the related work directory. The devshell is opened in the original directory without any error or warning instead.
> > > >>>>
> > > >>>> Any hints what's wrong here or how I can debug this behaviour?
> > > >>>>
> > > >>>
> > > >>> which terminal are you using, probably some default behavior changes there ?
> > > >>
> > > >> Main terminal is xterm. No special settings for the devshell terminal, so tmux is started like before.
> > > > 
> > > > 
> > > > After some more tests I can limit the problem to OE_TERMINAL="tmux". Other terminals like screen or xterm work well.
> > > > ...
> > > 
> > > 
> > > Ping!
> > 
> > The same problem happens with Debian Buster (currently "testing".) I was
> > unable to reproduce the problem when running
> >
> >  (cd subdirectory && tmux split-window)
> > 
> > from a shell prompt.

This was deemed a bug by tmux upstream and fixed there:

 https://github.com/tmux/tmux/issues/1549

I reported the bug to Debian, who applied the fix on top of 2.8:

 https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=914816

and the fixed version 2.8-2 has now migrated to Debian Buster:

 https://tracker.debian.org/news/1009699/tmux-28-2-migrated-to-testing/

It looks like Ubuntu Cosmic 18.10 has tmux 2.7-1, so it wasn't affected.
Ubuntu Disco (19.04?) currently has 2.8-2 which contains the fix.

It would be possible to work around the tmux 2.8 bug in oe-core by always
passing the directory as I did in my patch, but I shall let someone who is
affected by it decide whether that's worthwhile.

Mike.

