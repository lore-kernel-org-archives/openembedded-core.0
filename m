Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 396C372E91
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 11:52:21 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id b6so644489yha.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Feb 2015 03:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=GJ9tzQEIWPyPNAqw7jhbDuJlQPNhOzoi1NMO99+ef6s=;
	b=N+DUp9ON6PU81tw5faE4Fp+sMNrLosEvcNvSe8SY0X6EO97/vMeiarb58CZQGsW9bb
	unPOhUGs2xWdUw6+rB7ZInSg9mCGVZ+2oOI1TgoOUONN9mxVsSh+Bq5wRx8eiSIm+ZIY
	/14Wi8mglX8vDYTdIKHYRVpEWD0+DxEilx/3BYyKoWdIP4XZaKJ9lRquBrEGSBJZLoVY
	sDZnDH6E0iodg8pQfXuAJnS/Iqn02NX8aLxXks7GXmyfMYF6WSi35bkRkjq/Ts3G9iNA
	nd9nr0OYgU1GByjFeh9ZCMacE88TnXEnJhRa/G/bdBPJFZBWxWPsslz+F3mqrU9GDl7+
	xVIQ==
MIME-Version: 1.0
X-Received: by 10.236.44.98 with SMTP id m62mr4228609yhb.136.1423396342343;
	Sun, 08 Feb 2015 03:52:22 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Sun, 8 Feb 2015 03:52:22 -0800 (PST)
In-Reply-To: <20150130230609.GA13593@bshelton-desktop>
References: <20150130230609.GA13593@bshelton-desktop>
Date: Sun, 8 Feb 2015 09:52:22 -0200
X-Google-Sender-Auth: 6dONTygQN8JuukqZEy5fqraThMs
Message-ID: <CAP9ODKqT1n753HSnTGmhRnRaRz8rD7C0JX_pd5dXt3a5T2BM7Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: opkg intercept for ldconfig on oe-core
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
X-List-Received-Date: Sun, 08 Feb 2015 11:52:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 30, 2015 at 9:06 PM, Ben Shelton <ben.shelton@ni.com> wrote:
...
> Is this expected behavior?  Is opkg intercept still supported?  Should we fix
> this, and if so, what would be a safe way to do it?

I don't know if this is the expected behavior for now but the
intercept does make sound like a very good mechanism for the embedded.
It should reduces the time spent in an upgrade and also reduce the
writing in the storage. Both very good consequences of adopting it.

However I am not sure how much work would be need to revert this
change and confirm it does not regret somehow. Did you test changing
the postinst fragment?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

