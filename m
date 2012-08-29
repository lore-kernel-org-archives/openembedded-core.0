Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6c77-0000n5-Hm
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 08:50:57 +0200
Received: by pbcwy7 with SMTP id wy7so624136pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 23:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=oR0lQ9Qdb6QepGc2PE1xUDK1h0GfS4wm5Jkq4tLfXdA=;
	b=of41ph8tBzG1p/5RHFwTdtXV+qNbphbMLcXqUVf79IMS8UQDAi247/5djxYla6PXAF
	WLg++Ge4I2t4k1yJwNGHhm6wQsDMu3g/ury2fcI9O2oaNA548ldAriXQkypCDQYrrIux
	UCUEERw+A4KUntFFHDrFTIjCYGZLegPQ3NWh71tRBvysb7KHGwjJk8BoYPkBG7+1f4HC
	Ht6ovBqzIUuScvIGbBXLEowebcE7e2Q7C6kKS2ajqmheadv6yeIwkh6EQjjpkNzY7sdG
	jWGkZK1VpXFDD8xJhuia+l3YJG9Q2qihkT62ZFhJ5FNsLA2N0ClQPgTiMnI6vUv3Rxni
	KrrQ==
Received: by 10.68.193.194 with SMTP id hq2mr2339592pbc.93.1346222323268;
	Tue, 28 Aug 2012 23:38:43 -0700 (PDT)
Received: from sa-nc-common4-151.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id od6sm17149003pbb.7.2012.08.28.23.38.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Aug 2012 23:38:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAGiJk9dvZ=_eSZwcXRnsfwo+h0x9fWJnCapuSCVz_HftgJAw6g@mail.gmail.com>
Date: Tue, 28 Aug 2012 23:38:39 -0700
Message-Id: <EB7F39C1-4BA2-47F1-B736-8A5BB085335A@gmail.com>
References: <CAGiJk9dvZ=_eSZwcXRnsfwo+h0x9fWJnCapuSCVz_HftgJAw6g@mail.gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
X-Mailer: Apple Mail (2.1486)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Package re-order fallouts?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 06:50:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 28, 2012, at 12:37 AM, Samuel Stirtzel =
<s.stirtzel@googlemail.com> wrote:

> after switching from the Denzil branch to next it seems that the
> package order has been changed.
> This causes failures with non symlink .so files in -dev packages for
> various meta-kde recipes.
>=20
> What is the preferred way to fix this?
> Currently done something like: unset FILES_SOLIBSDEV and add all
> dev-libs by hand (there must be a better way to fix this).
>=20


yes if you have files ending with .so and are not symlinks then its =
better that you specify
them by hand to go into packages you want them to be in presumably -dev =
and empty out FILES_SOLIBSDEV=


