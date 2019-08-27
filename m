Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 565B96B50B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 18:23:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Hy1429yyz3J;
	Tue, 27 Aug 2019 20:23:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566930202;
	bh=EjyfGvoIEcYPef0HY+0BHtxqIwU14ND1CXruL11v834=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0z3lw7D5THRObcayDSaShW0F4b+YFvqAYlAlhTR2LspakIbamuGfdzB7nbv9QipK
	cuYdY173IG2ajkpQYcYmhSfPLdSZ+6iLzNHAO1aYyYUrdvD5m6H6pGYFGfa7HFvqV0
	SQ3qnAtm8BiAF0OaHTGsOMhKbHExJ5lcWm0znixaeuRmQLITVcKxMZ6LHJkvbReRj8
	Zjbt0ZoC5sQul0snTO6Q+pE/dm/0uCiA/qO8l9vPcuCVQiiH5hkMtqcs3ezaKxPn+N
	RISo2Zo4gm1+QTFxKc0TFKjGnzH4Ff71oWAqewJAIr9nwTEUV7q39IlwZwfiJBXuoc
	NVMM6rQ+IbIjjA2ky2e3aUdwU99aosd1x0kJYVlBYSprEhjCUpERrCOPAbwIPbylpy
	JT02MvQcJs7ovLr9UJ5pP1Mp9TcMRW4oBAsoydrvLvsBir/LhGOQkugr3WSX9gO+OH
	0q+r2tKOL7Tyv3h+ETZ+f/ylsvXAGhEHTg1dw7vrUYLv4533O/PzVbDhItdML7uSpD
	1VY98RTdpFw9TCGk/KVzhNNFfxYH60vlZh4GN9OXvimzFjXz6b4NIvic1cU7YfDBXM
	abElZjIoa8uSIfYA2m+cRdpQz66ydIQSYuFujJPoYafNstZY/1JNGuxn7ah3zt7+hV
	Yd9GwPvSRYk2Cmn+CNyR59P4=
Date: Tue, 27 Aug 2019 21:23:17 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20190827182317.GB29638@localhost>
References: <CAP9ODKqnJX-fLme5JUQF8XAHr2hDzJ31auZPQGOUQCehuTb4XA@mail.gmail.com>
	<b3e14a93-8d27-c5f4-0895-8122a030d451@windriver.com>
	<CAP9ODKqWyAG5Zigqcwi7JEgxreaGfSYgBKQG23fhHrHi81QVcQ@mail.gmail.com>
	<4035859d-d86b-16ff-d40c-b5dbdbf56b71@intel.com>
	<e0fd2cfb-afc3-53d6-c821-b7a3ce05d4d4@windriver.com>
	<CAP9ODKqM8tPNPQQ9LjbUKSaCq7CQF4Pica7RLVLnH9qNikA9Tg@mail.gmail.com>
	<3e6e1e23-ead9-7982-0bc1-49639638a216@windriver.com>
MIME-Version: 1.0
In-Reply-To: <3e6e1e23-ead9-7982-0bc1-49639638a216@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Conflict of systemd and sysvinit
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
X-List-Received-Date: Tue, 27 Aug 2019 18:23:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Aug 19, 2019 at 12:22:30PM -0500, Mark Hatle wrote:
> On 8/19/19 11:49 AM, Otavio Salvador wrote:
> > On Mon, Aug 19, 2019 at 1:48 PM Mark Hatle <mark.hatle@windriver.com> wrote:
> >> On 8/19/19 11:27 AM, Ross Burton wrote:
> >>> On 19/08/2019 11:37, Otavio Salvador wrote:
> >>>> On Sun, Aug 18, 2019 at 11:00 PM Kang Kai <Kai.Kang@windriver.com> wrote:
> >>>>> On 2019/8/18 上午3:27, Otavio Salvador wrote:
> >>>>> Would you like to give more detailed steps how the error occurred? And
> >>>>> what's extra settings in you local.conf please?
> >>>>
> >>>> I had sysvinit and systemd enabled.
> >>>
> >>> The autobuilder should be exercising this, so when it's fixed we need to
> >>> ensure the AB covers the case Otavio is hitting.
> >>
> >> If they are both enabled what is the expected functionality of the system?
> >> (which is init, etc...)
> > 
> > The image needs to pick the desired ones.
> 
> Ok.. so build both packages.. and then come install time, one or the other must
> be in the PACKAGE_INSTALL (however the image chooses to do this), and the other
> should NOT be included.
> 
> This could be problematic, as I've seen recipes build with systemd dependencies
> in them.  (Both initscripts as well as system health monitoring and such..  That
> would conflict with a sysvinit [or systemd] if configured for the other.)
> Someone may need to review dependencies in the system looking for things that
> depend on systemd... or have a systemd/sysvinit 'conflict' of some kind.  (I've
> not attempted such an audit before.)
>...

Dependencies on libsystemd are not a problem in sysvinit systems,
assuming there is proper runtime fallback code.
Shipping both an init script and a systemd unit file is also not a problem.

In Debian you can just switch the init system and reboot and it works,
with all the other binary packages unchanged.

> --Mark

cu
Adrian

BTW: There are problems like how to make GNOME happy without systemd,
     and there is a lack of people in Debian working actively on the 
     sysvinit side. But on a high level the problems you were worried 
     about are "works in Debian".


