Return-Path: <seebs@seebs.net>
X-Greylist: delayed 508 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Dec 2019 15:27:04 UTC
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id D612775E80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 15:27:04 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id B54252E8963
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 09:18:36 -0600 (CST)
Date: Wed, 18 Dec 2019 09:18:34 -0600
From: Seebs <seebs@seebs.net>
To: openembedded-core@lists.openembedded.org
Message-ID: <20191218091834.41b49324@seebsdell>
In-Reply-To: <20191218143758.129308-13-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-13-alex.kanavin@gmail.com>
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
X-List-Received-Date: Wed, 18 Dec 2019 15:27:05 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Dec 2019 15:37:46 +0100
Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> +Latest versions of attr have removed the xattr.h header,
> +with the rationale that libc is providing the same wrappers.

I'm a bit concerned about this -- will this still work with *older*
versions of xattr?

-s

