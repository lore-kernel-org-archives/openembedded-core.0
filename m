Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qy1ff-0001C9-0h for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 15:14:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7TD9exN003135;
	Mon, 29 Aug 2011 14:09:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22015-08; Mon, 29 Aug 2011 14:09:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7TD9YJ6003128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 29 Aug 2011 14:09:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314366565-9185-1-git-send-email-dbaryshkov@gmail.com>
References: <1314366565-9185-1-git-send-email-dbaryshkov@gmail.com>
Date: Mon, 29 Aug 2011 14:09:26 +0100
Message-ID: <1314623366.5939.293.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [V2] opkg-utils: ignore packages disapperaring filelist generation
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
X-List-Received-Date: Mon, 29 Aug 2011 13:14:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-26 at 17:49 +0400, Dmitry Eremin-Solenikov wrote:
> Package files disappearing during index generation don't cause a fatal
> error. Make package file disappearing during filelist generation also
> a non-fatal error.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  .../opkg-utils/index-ignore-filenotfound.patch     |   17 +++++++++++++++++
>  meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    2 +-
>  2 files changed, 18 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



