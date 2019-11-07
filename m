Return-Path: <seebs@seebs.net>
X-Greylist: delayed 443 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Nov 2019 20:41:56 UTC
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 4C37B7F642
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 20:41:56 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 310352E8938;
	Thu,  7 Nov 2019 14:34:33 -0600 (CST)
Date: Thu, 7 Nov 2019 14:34:30 -0600
From: Seebs <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191107143430.39e16813@seebsdell>
In-Reply-To: <20191107200444.22913-1-richard.purdie@linuxfoundation.org>
References: <20191107200444.22913-1-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: Add statx support to fix fedora30 issues
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
X-List-Received-Date: Thu, 07 Nov 2019 20:41:56 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  7 Nov 2019 20:04:44 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> Modern distros (e.g. fedora30) are starting to use the new statx()
> syscall through the newly exposed glibc wrapper function in software
> like coreutils (e.g. the ls command). Add support to intercept this
> to pseudo.

I think this should be okay. If there's no real statx() wrapper, the
real_statx() call probably fails, but also things probably won't have
thought it existed/worked.

Worth double-checking that things still run with this in place on a
system that doesn't have a statx wrapper, when configuring and building
things like coreutils that will check for it.

-s

