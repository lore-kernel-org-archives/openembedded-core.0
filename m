Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 80A9878434
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 14:06:10 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 5F6952E8922;
	Thu, 29 Mar 2018 09:06:11 -0500 (CDT)
Date: Thu, 29 Mar 2018 09:06:09 -0500
From: Seebs <seebs@seebs.net>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20180329090609.67b6990b@seebsdell>
In-Reply-To: <lyvadfqea7.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
	<CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
	<20180326160746.1dce7ae9@seebsdell>
	<CAJ86T=VaJyJYbBTkjR1yUTSJPCFSjgZCZZkYbyGEaTWYCg+u7A@mail.gmail.com>
	<20180326203209.2da967eb@seebsdell>
	<CAJ86T=VqLZrmyLBYD4ovQc9eNJQx5Rqp8YK+=3hPHgmjqqa55w@mail.gmail.com>
	<20180326210734.165ac038@seebsdell>
	<CAJ86T=X8bq6MKdvnq7sPFzjKN3ZgEJL70xHGCgSNBuC7ppi51w@mail.gmail.com>
	<20180326234108.4b52c066@seebsdell>
	<CAJ86T=VtdUAahO+PE2w8BzuPHAJCM1PEyWaYwg4SSGHU6jtm=A@mail.gmail.com>
	<20180327142230.15f1abf9@seebsdell>
	<CAJ86T=V=b2jsSuVEicQbbgrax+8iV7HV0B=cKWDaejLq-Dh2eQ@mail.gmail.com>
	<20180327152026.335b4c2d@seebsdell>
	<CAJ86T=VdHEb4cyB=oSTHytyGc9B0+wN39qOSHWuVR0g6dFTLUg@mail.gmail.com>
	<20180327161010.3e20edac@seebsdell>
	<lyvadfqea7.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Thu, 29 Mar 2018 14:06:10 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Mar 2018 14:04:00 +0200
Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> __builtin_apply() should deal with it.

The documentation hints at possible problems when dealing with other
functions, but doesn't mention any architecture difficulties. It's
possible gcc simply never uses any of the weird conventions, it's also
possible that builtin_apply just doesn't work reliably on such
architectures. The gcc docs do state that gcc's calling conventions
never depend on whether a function has a fixed or variadic argument
list, which suggests that it's probably safe-ish. (Some compilers use
very different calling conventions for variadic functions.)

-s

