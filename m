Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web12.18697.1588483736868508535
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 22:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 6DFE42E891B;
	Sun,  3 May 2020 00:28:55 -0500 (CDT)
Date: Sun, 3 May 2020 00:28:52 -0500
From: "Seebs" <seebs@seebs.net>
To: "Jacob Kroon" <jacob.kroon@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH] pseudo_ipc.h: Fix enum typedef
Message-ID: <20200503002852.1273f3a1@seebsdell>
In-Reply-To: <20200503042712.1878496-1-jacob.kroon@gmail.com>
References: <20200503042712.1878496-1-jacob.kroon@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  3 May 2020 06:27:12 +0200
"Jacob Kroon" <jacob.kroon@gmail.com> wrote:

> 'pseudo_access_t' is a type, so use typedef.
> 
> Fixes building pseudo with gcc 10 where -fno-common is the default.

Wow! That's amazing, and yes, that's a bug, and the fix looks right to
me. I don't know how that got missed all these years. (But don't rely
on this evaluation too heavily just yet, I haven't actually looked at
the code more carefully, but this seems obvious.)

-s
