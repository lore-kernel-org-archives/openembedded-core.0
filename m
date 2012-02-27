Received: from 253-16.static.businesstel.hu ([178.210.253.16]
	helo=teledigit.eu) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kgy@teledigit.eu>) id 1S1xyz-0003x6-PB
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 11:39:06 +0100
X-AuthUser: kgy@teledigit.eu
Received: from linux-oxe9.localnet ([195.228.189.98]:37915)
	by teledigit.eu with [XMail 1.26 ESMTP Server]
	id <S2704> for <openembedded-core@lists.openembedded.org> from
	<kgy@teledigit.eu>; Mon, 27 Feb 2012 11:30:40 +0100
From: Gyorgy Kovesdi <kgy@teledigit.eu>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 11:30:34 +0100
Message-ID: <41586593.1CLnZEXO8J@linux-oxe9>
Organization: NNG
User-Agent: KMail/4.7.2 (Linux/3.1.9-1.4-desktop; KDE/4.7.2; x86_64; ; )
In-Reply-To: <1330181716.13788.33.camel@ted>
References: <17057774.C0TjevbrGC@kgy> <1330181716.13788.33.camel@ted>
MIME-Version: 1.0
Subject: Re: empty dirs in glib-2.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2012 10:39:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> rmdir was used specifically so we'd know if the directory wasn't empty.
> What files are in there?

...../usr/lib/gio/modules:

total 32K
drwxr-xr-x 2 kgy users 4.0K Feb 27 11:26 .
drwxr-xr-x 3 kgy users 4.0K Feb 27 11:26 ..
-rwxr-xr-x 1 kgy users 2.0K Feb 27 11:26 libgiofam.la
-rwxr-xr-x 1 kgy users  20K Feb 27 11:26 libgiofam.so

It is reproducible now, even in a brand new checkout.

Regards
Gyorgy Kovesdi



