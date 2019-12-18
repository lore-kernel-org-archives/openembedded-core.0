Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 57B127FE79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 16:52:21 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 1121E2E891B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 10:52:21 -0600 (CST)
Date: Wed, 18 Dec 2019 10:52:19 -0600
From: Seebs <seebs@seebs.net>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <20191218105219.28367e5f@seebsdell>
In-Reply-To: <CANNYZj97BZUwF=G7WCaGwbh4zrJAYvS=ayWQSRZxHOemQ86BDA@mail.gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-13-alex.kanavin@gmail.com>
	<20191218091834.41b49324@seebsdell>
	<CANNYZj9yLNUhmU0tWcyeWJ7tRXQKGd31X-_GKNKshYzYaE3Auw@mail.gmail.com>
	<20191218102154.5bbf52e0@seebsdell>
	<CANNYZj97BZUwF=G7WCaGwbh4zrJAYvS=ayWQSRZxHOemQ86BDA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH 13/25] pseudo: adjust for attr 2.4.48
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
X-List-Received-Date: Wed, 18 Dec 2019 16:52:21 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Dec 2019 17:24:21 +0100
Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> You can also supply your own definition of ENOATTR, as it doesn't
> change.

That way lies EVEN MORE madness. I don't have any guarantee that it
won't be changed at some point, and... I mean, silly though it sounds
to talk about "defined" or "undefined" when working on pseudo, it's
*really* not okay for non-implementation code to be defining a symbol
starting with a capital E like that.

I am not sure why the attr people hate compatibility with existing code,
but probably because they're monsters who are motivated only by a desire
to crush the hopes and dreams of others. That's usually why people make
backwards-incompatible header changes.

-s

