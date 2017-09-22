Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB42783BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 16:52:04 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id F19582ADD07;
	Fri, 22 Sep 2017 11:52:05 -0500 (CDT)
Date: Fri, 22 Sep 2017 11:52:04 -0500
From: Seebs <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170922115204.37ef6f2c@seebsdell>
In-Reply-To: <1506098477-5444-2-git-send-email-richard.purdie@linuxfoundation.org>
References: <1506098477-5444-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1506098477-5444-2-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] pseudo: Add fastop reply fix
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
X-List-Received-Date: Fri, 22 Sep 2017 16:52:05 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 22 Sep 2017 17:41:17 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> This changes the pseudo FASTOP functionality so that a reply to the
> operation is required. This means we then cannot lose data if a
> connection is closed. This in turn stops corruption if we run out of
> file handles and have to close connections.
> 
> This tweaks the connection closure patch to update the comment there
> which is now outdated.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This looks reasonable to me. I did some testing with a very similar
patch and concluded that, while it slowed performance slightly, it
didn't slow it nearly as much as the pre-fastop behavior did.

-s

