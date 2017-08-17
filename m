Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E34847849B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 13:00:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7HD0QT2014471
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 17 Aug 2017 14:00:27 +0100
Message-ID: <1502974826.13978.212.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org, ross.burton@intel.com
Date: Thu, 17 Aug 2017 14:00:26 +0100
In-Reply-To: <1502954107-9252-1-git-send-email-hongxu.jia@windriver.com>
References: <1502954107-9252-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 17 Aug 2017 14:00:27 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] mc: unify curses initialization
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
X-List-Received-Date: Thu, 17 Aug 2017 13:00:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-08-17 at 03:15 -0400, Hongxu Jia wrote:
> Since ncurses upgraded to 6.0+20170715, it compile failed
> ...
> > 
> > ../../../mc-4.8.19/lib/tty/tty-ncurses.c:199:13: error:
> > dereferencing
> pointer to incomplete type 'TERMINAL {aka struct term}'
> > 
> >      cur_term->Nttyb.c_cc[VINTR] = CTRL ('g');   /* ^g */
> >              ^~
> ...
> 
> Backport a patch from upstream fixed the issue.
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

Unfortunately there is a version in meta-gplv2 that fails to build:

https://autobuilder.yocto.io/builders/nightly-non-gpl3/builds/406

I'm tempted just to delete that recipe at this point as porting the
patch to it would have to be done cleanroom style.

Cheers,

Richard

