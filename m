Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QjXu0-00047v-GA for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 16:37:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEXQlZ023515
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:33:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22788-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:33:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEXIfD023509
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:33:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1311156453.30326.53.camel@phil-desktop>
References: <1311156453.30326.53.camel@phil-desktop>
Date: Wed, 20 Jul 2011 15:33:15 +0100
Message-ID: <1311172395.2344.42.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] libgcc: correct mode on libgcc_s.so.1 to ensure it gets stripped
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
X-List-Received-Date: Wed, 20 Jul 2011 14:37:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 11:07 +0100, Phil Blundell wrote:
> If the library is installed without execute permission then package.bbclass
> will not consider it for stripping.  This is particularly unfortunate because 
> there seems to be a bug somewhere else which is causing all DSOs to end up with 
> a NEEDED dependency on libgcc_s, even if they don't actually require it, and 
> hence it is getting installed in all images (for uclibc on i586 at least).
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>

Merged to master, thanks.

Richard



