Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwAVW-0001Jp-Fl for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:20:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VB9LvD020181
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:09:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19675-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:09:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VB9B8o020175
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:09:12 +0100
Message-ID: <1343732941.9526.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2012 12:09:01 +0100
In-Reply-To: <1343717699-23305-1-git-send-email-raj.khem@gmail.com>
References: <1343717699-23305-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] glib-2.0-nativesdk: Fix build on ubuntu 11.10
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
X-List-Received-Date: Tue, 31 Jul 2012 11:20:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-30 at 23:54 -0700, Khem Raj wrote:
> When you have a distro which has older version of
> glib-2.0 installed then it does not have compile_resources
> installed which essentially glib-2.0 nativesdk is
> looking for on build host. So like in a cross build
> we disable the configure check which will force it
> to build an internal copy and use it.
> 
> This problem may not be seen on newer distros like
> ubuntu 12.04 since they have newer version of glib-2.0
> installed
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



