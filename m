Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QjDMw-0005Jw-EB for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 18:42:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6JGbu3g003188
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 17:37:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02290-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 17:37:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6JGbka4003182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 17:37:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Date: Tue, 19 Jul 2011 17:37:44 +0100
Message-ID: <1311093464.2344.14.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/22] Patches and Kernel Updates
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
X-List-Received-Date: Tue, 19 Jul 2011 16:42:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-18 at 23:50 -0700, Saul Wold wrote:
> The following changes since commit b975de5ea76c5f8827fb48c0c3c29902872ad3d6:
> 
>   bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:22:59 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

I merged these apart from:

> Ihar Hrachyshka (1):
>   Fixed concurrency problem for ZIP packed recipes.

which doesn't need the need_unzip/NEED_UNZIP_FOR_UNPACK piece

> Joshua Lock (2):
>   sanity: don't warn about SRC_URI checksums for connectivity test uris

This looks like the .done stamp pieces would stop the test from working
at all as far as I can see.

> Otavio Salvador (1):
>   package.bbclass: add support to split Qt translation files

This should be implemented from the QT classes really, not in the core.
If we need to add in some functionality to allow this fine but I don't
believe this is a good thing for the core in general.

I did mention this to Otavio at the time but I don't think we came to a
conclusion on exactly how to do it.

Cheers,

Richard




