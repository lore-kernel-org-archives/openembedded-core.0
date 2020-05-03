Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web12.26067.1588523184752598728
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id D07942E8920;
	Sun,  3 May 2020 11:26:23 -0500 (CDT)
Date: Sun, 3 May 2020 11:26:21 -0500
From: "Seebs" <seebs@seebs.net>
To: "Jacob Kroon" <jacob.kroon@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH] pseudo_ipc.h: Fix enum typedef
Message-ID: <20200503112621.32e1e1ed@seebsdell>
In-Reply-To: <e8a9982b-1412-087f-b8ac-283b657106aa@gmail.com>
References: <20200503042712.1878496-1-jacob.kroon@gmail.com>
	<20200503002852.1273f3a1@seebsdell>
	<e8a9982b-1412-087f-b8ac-283b657106aa@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 3 May 2020 17:49:09 +0200
"Jacob Kroon" <jacob.kroon@gmail.com> wrote:

> The type has never been used, so an alternative fix would be to get
> rid of it altogether, and just keep the enum identifiers.

I think I anticipated the type being used for something but it did
indeed not happen. It could also just be changed to 'enum [type]
{ ... }', I guess.

But I think your fix is the simplest and closest to what I probably
thought I was doing at the time.

-s
