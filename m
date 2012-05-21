Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SWO5T-0007yM-4h for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 10:35:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4L8POUE018768
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18004-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4L8PEh7018762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:15 +0100
Message-ID: <1337588714.11345.607.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 21 May 2012 09:25:14 +0100
In-Reply-To: <1337534195-5184-1-git-send-email-andrei@gherzan.ro>
References: <1337534195-5184-1-git-send-email-andrei@gherzan.ro>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bb/fetch2/__init__.py: Don't try to compute checksums for directories
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
X-List-Received-Date: Mon, 21 May 2012 08:35:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-05-20 at 20:16 +0300, Andrei Gherzan wrote:
> In this way we avoid failing the build while trying to fetch local
> directories.
> 
> [YOCTO #2475]
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  bitbake/lib/bb/fetch2/__init__.py |    5 +++++
>  1 file changed, 5 insertions(+)

Please send bitbake patches to the bitbake-devel list in future. I've
applied this one directly since there is a clear need to fix problems
though, thanks!

Cheers,

Richard



