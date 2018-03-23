Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 845826FFA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 16:49:40 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 3B04A2E892B;
	Fri, 23 Mar 2018 11:49:41 -0500 (CDT)
Date: Fri, 23 Mar 2018 11:49:39 -0500
From: Seebs <seebs@seebs.net>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180323114939.218c0607@seebsdell>
In-Reply-To: <CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 23 Mar 2018 16:49:40 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Mar 2018 16:30:55 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> Because in GNU's infinite wisdom they're using renameat2() to do
> atomic renames in the mv command, and as renameat2 isn't in the
> headers for F27 it just does a syscall directly. This is in upstream
> coreutils so once they make a release, everyone gets it.

UGH.

I... am really unsure whether it's possible to catch that, because
I really, really, don't want to try to intercept raw syscall() calls.
I don't think that ends well.

I wonder if they can be persuaded to, you know, NOT use a syscall
directly when it's not in the system headers, on the grounds that the
system headers define the exported interface, and bypassing them is
almost certainly a very bad idea.

-s

