Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TG66m-00059Z-Ia for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:41:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OARQ9S027779;
	Mon, 24 Sep 2012 11:27:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27712-02; Mon, 24 Sep 2012 11:27:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OARFqU027773
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 11:27:16 +0100
Message-ID: <1348482435.4654.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 24 Sep 2012 11:27:15 +0100
In-Reply-To: <1348256558.4444.194.camel@x121e.pbcl.net>
References: <1348256558.4444.194.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] rootfs_ipk: Avoid leaving run-postinsts around if online package management is disabled
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
X-List-Received-Date: Mon, 24 Sep 2012 10:41:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-21 at 20:42 +0100, Phil Blundell wrote:
> If all postinsts have already been run during rootfs construction then
> there's no point in having run-postinsts in the installed system.
> Clean it up at the same time that update-rc.d and suchlike are being
> removed.
> 
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
> v2: per suggestion from Paul Eggleton, don't refer to O_P_M in subject 
> line since oe-core doesn't use it anymore
> 
>  meta/classes/rootfs_ipk.bbclass |   14 ++++++++++++--
>  1 files changed, 12 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



