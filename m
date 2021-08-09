Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web08.23180.1628518167807669762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 07:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=bJjvA1aU;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 8BA5A2E891F
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Aug 2021 09:09:24 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1628518165; bh=ngTJVthYIQArkQSmq6nomAAiQOPV/2NKBFlqxsqYLHU=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=bJjvA1aU1uPOTJfyLlxCRovkvnKAwq8rlTOEf0KdAMy2OFb2p0E4X/ir9M9vClNXp
	 j1yIxb2jXtjp9VHuzB0ca8mvD5SirY69ua4O3yVvMEUiChu8GLZzYi4rnlUfRnWlAm
	 uxgjZ7ltxnTUXOr/AnCh3BXZrGuBQfSERvjCmJ3nI1iiB99IeTn4B28q8HTbvo6EwX
	 m0xIjlSpiIeZZnSGqLxv0ajKWZ4Hkq3k+LXiMsj2qYd9545KUsQJfOdM6gJixUi1tl
	 GAjOHcEv7zMgAZYYAikCmifkhbqabWDUT9qkx+A/a9YPT3XMyzo10OjQZl+ZsgtMjj
	 YQp2hBQw2DnkQ==
Date: Mon, 9 Aug 2021 09:09:16 -0500
From: "Seebs" <seebs@seebs.net>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] pseudo: Outdated records for newly-ignored paths in database cause mismatches
Message-ID: <20210809090916.18dd75fe@seebsdell>
In-Reply-To: <20210809121951.GA480@mcrowe.com>
References: <20210809121951.GA480@mcrowe.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Aug 2021 13:19:51 +0100
"Mike Crowe via lists.openembedded.org"
<yocto=mac.mcrowe.com@lists.openembedded.org> wrote:

> Cleaning the work directory makes the problem go away because that
> deletes the pseudo databases.
> 
> Does the above make sense as an explanation for these errors? If so,
> is there a good way to avoid these errors?

Good diagnostic work, makes sense to me. It would make some sense for
pseudo to ignore mismatches involving ignored paths, but it wasn't
originally designed with the ignored paths concept, so it currently
doesn't.

-s
