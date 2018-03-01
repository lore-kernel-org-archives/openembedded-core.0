Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 903ED78854
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 15:06:54 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 77E1C2E8925;
	Thu,  1 Mar 2018 09:06:55 -0600 (CST)
Date: Thu, 1 Mar 2018 09:06:53 -0600
From: Seebs <seebs@seebs.net>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20180301090653.7d4708a9@seebsdell>
In-Reply-To: <20180301135346.44613-1-alexander.kanavin@linux.intel.com>
References: <20180301135346.44613-1-alexander.kanavin@linux.intel.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: update to latest master
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
X-List-Received-Date: Thu, 01 Mar 2018 15:06:54 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  1 Mar 2018 15:53:46 +0200
Alexander Kanavin <alexander.kanavin@linux.intel.com> wrote:

> toomanyfiles.patch rebased

Do we still have a reason for that, if we're using epoll to address
that?

That said, with the new fastop sanity-fix, that is probably much less
dangerous than it used to be.

-s

