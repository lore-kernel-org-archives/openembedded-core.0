Return-Path: <paul@betafive.co.uk>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC6560273
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 22:28:31 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 90CAF20840;
	Sun, 31 Mar 2019 18:28:30 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Sun, 31 Mar 2019 18:28:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:cc:subject:content-type; s=fm1; bh=089QQ/EPcC4jhLIUK/hU+O08fNo6
	4kHHGRsDBr4I630=; b=aMINYsVnDAT4hqhyW1XRCwP0IAcf+NrSpJmQgzY/EUE9
	Immio4A3xeIX1zZHGMB/xaUq9Qi65z/sFV0qknzuUk/uQE7VShQnaLZqpHkI9lsR
	XbeUjLHJBZXyXjIrTcyMYMlIq1LM+NPvmNahpgcWd8HpHCbzxoSUQD6TFnkEfjKi
	CeXugfRyt2/zijUMCArnLF7xU6Nr2zJrluFa622H3XqsLz6p7OJNl8TZIXNJKffi
	ATVt+4Nmxjsm/zZevllaMTwQnw9E6FVF25PmuLxBpl1MFQ6kS2YKkicatUsV+u+i
	HULp2w5w9Sd596SStCvNUWEhFb0GhjXS1JVpy0b3fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=089QQ/
	EPcC4jhLIUK/hU+O08fNo64kHHGRsDBr4I630=; b=8dhsziza1s+FLhDmaRvDrD
	0ZFK6ssi6CN9nm8fqee6M3Zm6bocVOmetfR58zmmsB8gcQFW/XZFmpooFe9KjrH3
	XW1NeioaLYazYkgl4CRoBm7qSJnzRznXqobPNY5BcYruVwRY/TRHsg6KvOBnQ24t
	6T5+XC/yJndMxIjg06mWExsxprUyzsMgWA8xbe1jC6bCXV1ip8Xk1FnO2Dp7rIvk
	qr2+yVdoR0C93EEL6FgO29e61teZ89+V8p06RQENQ8vUdzZVW/iKSXRqidwNnbHX
	UZvRbrWqWuQDhOmlRrnKAI1W0psnPX5Hj0vtB/d/DKW+awi7d58yCp7V4YH7fNgw
	==
X-ME-Sender: <xms:DT-hXHrBrdEqAdxwBueXBYPGKC4rX5h9VYzJSu2Ep2v_lL2fGVWISg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrleefgddutdcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfrfgruhhl
	uceurghrkhgvrhdfuceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecurfgrrh
	grmhepmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehl
	uhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:DT-hXADnud55ElY2JIuYlF2K_db3m6C4PXY28TRL_-y5GUOSJi9WxQ>
	<xmx:DT-hXAMUHUoC7fr7ObWEWH1qXWWVTCUGqdZ-S3AZQ_v8LmvbNbyIig>
	<xmx:DT-hXODNe3tRmXHkGpV2KeAjKNYjMtAln6zwjOcAa3rWydgWlU29Dw>
	<xmx:Dj-hXDVL8FsLY3A7O1OHgnNOq7lxAEuSh2W4KdQFMfKTfBIntx7eaQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D7CC97C1B9; Sun, 31 Mar 2019 18:28:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-329-gf4aae99-fmstable-20190329v1
Mime-Version: 1.0
X-Me-Personality: 84186096
Message-Id: <05e3208a-24a2-4a6d-ba33-a23f00ffe41f@www.fastmail.com>
In-Reply-To: <20190331205613.GA4664@bill-the-cat>
References: <20190331155012.3085-1-open.source@oleksandr-kravchuk.com>
	<20190331201141.GH18421@bill-the-cat>
	<CANNYZj9QeaLU8AC03CmtczcVJ_jbuaL7gQEQ6HQVnDB82z+taw@mail.gmail.com>
	<20190331205613.GA4664@bill-the-cat>
Date: Sun, 31 Mar 2019 18:28:31 -0400
From: "Paul Barker" <paul@betafive.co.uk>
To: "Tom Rini" <trini@konsulko.com>,
	"Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] vim: update to 8.1.1097
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
X-List-Received-Date: Sun, 31 Mar 2019 22:28:31 -0000
Content-Type: text/plain

On Sun, 31 Mar 2019, at 21:56, Tom Rini wrote:
> On Sun, Mar 31, 2019 at 10:19:51PM +0200, Alexander Kanavin wrote:
> > On Sun, 31 Mar 2019 at 22:12, Tom Rini <trini@konsulko.com> wrote:
> > > Looks better, thanks. Is there a particular fix / change you're doing
> > > this for? I ask since every commit is a version bump we might want to
> > > set a guideline of once a month or so for bumping vim to the latest.
> > 
> > It's a bit insane upstream is doing that.
> > Should we set PV to something like PV = "8.1+git${SRCPV}"? That way
> > devtool/AUH/RRS will not be reporting a new version for each commit,
> > and will only do that when 8.2 is out.
> 
> No, we should follow what upstream does for version numbers, it's what
> other distros do. And on the related topic of "is it a stable branch?",
> it does seem like yes, it is. We should just remember to not update it
> more often than say the first of the month, without a specific reason.

When I've done vim updates in the past I aimed for once every 3 months. I also looked at Debian/Fedora/etc to find a version that someone else has already tested in a distribution - with vim having so many "releases" you have the same issue you'd get from picking a random commit off the master branch from another project. Matching against a version used somewhere else gives us something to compare to when we hit a bug.

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

