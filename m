Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id 4571C6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 08:57:02 +0000 (UTC)
Received: from ad.chargestorm.se (2.69.203.166) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Tue, 4 Mar 2014 09:57:01 +0100
Date: Tue, 4 Mar 2014 09:56:53 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20140304085653.GA3511@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1393857456-18343-1-git-send-email-olof.johansson@axis.com>
	<CAMKF1sq5C01yFquzWjAUaHDgr30ZFXj-dnujS0XWBWrWHC5YXA@mail.gmail.com>
	<20140304083720.GA30745@axis.com>
MIME-Version: 1.0
In-Reply-To: <20140304083720.GA30745@axis.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH v2] sanity.bbclass: support wildcards in SANITY_TESTED_DISTROS
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
X-List-Received-Date: Tue, 04 Mar 2014 08:57:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Olof Johansson <olof.johansson@axis.com> [140304 09:37]:

> On 14-03-03 19:17 +0100, Khem Raj wrote:
> > On Mon, Mar 3, 2014 at 6:37 AM, Olof Johansson <olof.johansson@axis.com> wrote:
> > > With this change, you can use shell like globbing expressions (as
> > > supported by Python's fnmatch) for entries in SANITY_TESTED_DISTROS.
> > > This makes it possible to say that, e.g. "all Debian 7 Wheezy releases
> > > are supported" with the entry "Debian-7.*".

> > I dont think its a good thing. We should be strict about it as we are.
> > otherwise it can end up
> > with bigger problems to save few  typing words

> I don't really think we are strict about it today. Currently,
> Ubuntu LTS (12.04) does not include point release number in its
> lsb release name. Debian does (and I noticed a similar bump patch
> was sent for CentOS recently). I suspect that in many cases, a
> new Ubuntu point release contains about the same changes that the
> Debian point release does.

> The issue is that new point releases, at least in the case of
> Debian, happens about every two months. These bumps are
> integrated to master, backported to older branches, but it still
> won't reach people working off releases immediately.

> Even if Poky chooses not to adopt this, it would still be a nice
> thing to have support for doing this internally for our
> layer/distro.

I'm with Olof and Mark on this one. 

We should at least add the code for allowing wildcards in the
SANITY_TESTED_DISTROS. Then everyone creating our own setups/distros can
choose to add wildcards or not.

Whether we should add wildcards in Poky is a separate question. Though,
we should treat e.g. Debian and Ubuntu in the same way.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

