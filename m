Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T9wA1-0002cT-Ok for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 12:51:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q87AdC87028104;
	Fri, 7 Sep 2012 11:39:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27749-03; Fri,  7 Sep 2012 11:39:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q87Ad3K1028097
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 7 Sep 2012 11:39:05 +0100
Message-ID: <1347014344.7493.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Ertsaas <mertsas@cisco.com>
Date: Fri, 07 Sep 2012 11:39:04 +0100
In-Reply-To: <1346997570-23066-1-git-send-email-mertsas@cisco.com>
References: <1346997570-23066-1-git-send-email-mertsas@cisco.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] rsync: Add md5sum and sha256sum for the rsync_2.6.9
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
X-List-Received-Date: Fri, 07 Sep 2012 10:51:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-07 at 07:59 +0200, Martin Ertsaas wrote:
> rsync_2.6.9 is the only rsync recipe in openembedded without GPLv3 license, but it lacked the
> checksums for the fetcher.
> 
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> ---
>  meta/recipes-devtools/rsync/rsync_2.6.9.bb |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



