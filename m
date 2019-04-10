Return-Path: <seebs@seebs.net>
X-Greylist: delayed 509 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Apr 2019 00:08:15 UTC
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 9133A7D8F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 00:08:15 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 0DEAA2E8938;
	Wed, 10 Apr 2019 18:59:46 -0500 (CDT)
Date: Wed, 10 Apr 2019 18:59:44 -0500
From: Seebs <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190410185944.0a16ea5d@seebsdell>
In-Reply-To: <20190410231254.25763-1-richard.purdie@linuxfoundation.org>
References: <20190410231254.25763-1-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: Update to gain key bugfixes
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
X-List-Received-Date: Thu, 11 Apr 2019 00:08:15 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 11 Apr 2019 00:12:54 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> -SRCREV = "6294b344e5140f5467e6860f45a174440015304e"
> +SRCREV = "6ebc7d6bc8ab973d0ba949eeb363821811ce8dc5"

I would sort of recommend one of the two commits since then -- one may
fix the .NET startup failures, and the other fixes warnings that this
one introduced and I forgot to fix. But I'm also okay with this one.

-s

