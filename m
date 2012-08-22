Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4Gxm-0001fl-2e for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 21:51:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7MJdVlU006121;
	Wed, 22 Aug 2012 20:39:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05702-07; Wed, 22 Aug 2012 20:39:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7MJdNG3006115
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 22 Aug 2012 20:39:24 +0100
Message-ID: <1345664364.3907.137.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Garman <scott.a.garman@intel.com>
Date: Wed, 22 Aug 2012 20:39:24 +0100
In-Reply-To: <50350A1B.4060505@intel.com>
References: <cover.1345573717.git.peter.seebach@windriver.com>
	<511616ed1761453ec1323aa945c559ca6cafffd1.1345573717.git.peter.seebach@windriver.com>
	<50350A1B.4060505@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] runqemu-export-rootfs and friends: don't put pseudo db in target fs
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
X-List-Received-Date: Wed, 22 Aug 2012 19:51:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-22 at 09:34 -0700, Scott Garman wrote:

> This would mean that if someone tried to put multiple rootfs directories 
> in the same subdirectory, they could clobber each other's pseudo_state 
> data, correct? Putting multiple rootfs directories in the same subdir is 
> a common use case already, I don't think we could break that.
> 
> If you appended the top-level rootfs directory name to ../pseudo_state, 
> e.g, ../pseudo_state_<dirname>, that would keep the pseudo_state 
> directories separate and make it fairly obvious what rootfs they 
> belonged to.

I'd wondered about this too. Can you use <dirname>.pseudo_state to make
the list sort better and help people with tab completion and so on? :)

Cheers,

Richard



