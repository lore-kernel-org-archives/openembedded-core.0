Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T1e79-0007ve-AB for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 15:58:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FDkUSg001680
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:46:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00424-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:46:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FDkMDq001673
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:46:23 +0100
Message-ID: <1345038382.538.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 14:46:22 +0100
In-Reply-To: <1344960631-8817-1-git-send-email-ross.burton@intel.com>
References: <1344960631-8817-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] classes: add gsettings.bbclass
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
X-List-Received-Date: Wed, 15 Aug 2012 13:58:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-14 at 17:10 +0100, Ross Burton wrote:
> This class registers postinst/postrm hooks to compile the GSetting schemas, and
> adds the relevant dependencies.  If possible the postinst happens on the host to
> avoid running it on the target.
> 
> [ YOCTO #2798 ]
> ---
>  meta/classes/gsettings.bbclass |   37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta/classes/gsettings.bbclass

Merged to master, thanks.

Richard



