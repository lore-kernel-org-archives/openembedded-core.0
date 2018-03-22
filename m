Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 736E46025E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 16:08:47 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 76B292E8938;
	Thu, 22 Mar 2018 11:08:48 -0500 (CDT)
Date: Thu, 22 Mar 2018 11:08:46 -0500
From: Seebs <seebs@seebs.net>
To: Andreas Kaufmann <andreas.kaufmann.79@gmail.com>
Message-ID: <20180322110846.25d9c2e6@seebsdell>
In-Reply-To: <1521734768-11762-1-git-send-email-andreas.kaufmann.79@gmail.com>
References: <1521734768-11762-1-git-send-email-andreas.kaufmann.79@gmail.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: explicitly enable xattr support
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
X-List-Received-Date: Thu, 22 Mar 2018 16:08:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Mar 2018 17:06:08 +0100
Andreas Kaufmann <andreas.kaufmann.79@gmail.com> wrote:

> Pseudo is using a custom configure script that detects if it shall
> build with extended file attribute support or not. The check is done
> by simply calling 'getfattr' provided by attr-native which is not
> part of the dependency list. Due to the recent changes (recipe
> specific sysroot & cleanup of $PATH) this call fails now when the
> recipe is being build for the first time (at least when being build
> for nativesdk case). Explicitly setting up a dependency to
> attr-native just to satisfy configure would be wrong also since the
> real dependency is to attr/nativesdk-attr which are already part of
> the dependency list (see DEPENDS). Therefore bypass the test in the
> configure by explicitly enabling xattr using a configure option
> available in any case.

This seems reasonable to me. The historical rationale for the configure
test was that we encountered actual systems in the wild which did not
have the underlying xattr support, as I recall? But I think that's no
longer remotely relevant.

-s

