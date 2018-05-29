Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8A060102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 18:57:32 +0000 (UTC)
Received: from ted ([192.168.3.30]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w4TIuGVj021420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 29 May 2018 19:56:27 +0100
Message-ID: <1527620176.16911.114.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 19:56:16 +0100
In-Reply-To: <CAJ86T=XdWPKG+EURX35cgpxbOL6FetzKdoND+=aXte1MPcxdtw@mail.gmail.com>
References: <1527215248-7224-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1srvQZ7z3xYaNJU9M_QQNq+pBFftSrJNBWwhcXQp0XDQPw@mail.gmail.com>
	<CAJ86T=XdWPKG+EURX35cgpxbOL6FetzKdoND+=aXte1MPcxdtw@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dropbear: drop obsolete patch 0004-fix-2kb-keys.patch
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
X-List-Received-Date: Tue, 29 May 2018 18:57:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-05-29 at 11:26 -0700, Andre McCurdy wrote:
> On Tue, May 29, 2018 at 10:29 AM, Khem Raj <raj.khem@gmail.com>
> wrote:
> > 
> > On Thu, May 24, 2018 at 7:27 PM, Andre McCurdy <armccurdy@gmail.com
> > > wrote:
> > > 
> > > This patch has been obsolete since 2005:
> > > 
> > >   https://github.com/mkj/dropbear/commit/736f370dce614b717193f45d
> > > 084e9e009de723ce
> > Seems fine to drop but I would like to understand why we carried it
> > thus far.
> > What is the history of it in OE ?
> It's older than the git history in oe-core (ie it was added in August
> 2005 as part of the first commit to oe-core).
> 
> The patch looks like it was initially created in March 2005 against
> dropbear 0.45.
> 
> In 2011 someone (incorrectly) added a tag "Upstream-Status:
> Inappropriate [configuration]".
> 
> That's about as much history as we have.

Looks like it was added for 0.44:

http://git.openembedded.org/openembedded/commit/packages/dropbear?id=ed6e40d6aff6cffabeff6f7fd6a9fee062566b2c

and there was some associated discussion:

http://familiar.handhelds.narkive.com/b1VGg2bI/problem-w-dropbear-ssh

so remote systems with 2048 length keys were somehow causing it
problems?

Cheers,

Richard

