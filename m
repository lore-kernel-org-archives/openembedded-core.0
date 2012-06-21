Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ShfN1-0007q6-Jn for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 13:16:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LB5Ume021737
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:05:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21414-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:05:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LB5NvX021731
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:05:24 +0100
Message-ID: <1340276724.1640.93.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 12:05:24 +0100
In-Reply-To: <cover.1340132548.git.josh@linux.intel.com>
References: <cover.1340132548.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [2011-1 PATCH 0/3] apt-native fixes
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
X-List-Received-Date: Thu, 21 Jun 2012 11:16:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-06-19 at 12:35 -0700, Joshua Lock wrote:
> With the toolchain provided on modern distros apt-native fails to compile, this
> series cherry-picks several patches from master which ensure that apt and 
> apt-native can be built reliably.
> 
> Cheers,
> Joshua
> 
> The following changes since commit 30c6ec403e1696b5fd94b92328ef9edec535a57a:
> 
>   scripts/qemuimage-testlib: fix typos (2012-06-14 11:17:35 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib josh/edison
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/edison
> 
> Richard Purdie (2):
>   apt: Fix locale header and hardcoded libname issues
>   apt: Fix parallel make race
> 
> Robert Yang (1):
>   apt 0.7.14: do_compile failed with gcc 4.7

Merged to 2011-1, thanks.

Richard



