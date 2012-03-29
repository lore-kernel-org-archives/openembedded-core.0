Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDMsj-00013T-P4 for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 23:27:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TLIgOj005521
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:18:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04773-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:18:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TLIV74005515
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:18:32 +0100
Message-ID: <1333055910.18082.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 22:18:30 +0100
In-Reply-To: <c513f4ecba19d0ceeb5d158287e77d3c74322254.1333036186.git.scott.a.garman@intel.com>
References: <cover.1333036186.git.scott.a.garman@intel.com>
	<c513f4ecba19d0ceeb5d158287e77d3c74322254.1333036186.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] runqemu: set console=ttyS0 when running with nographic option
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
X-List-Received-Date: Thu, 29 Mar 2012 21:27:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-29 at 08:57 -0700, Scott Garman wrote:
> When passing the nograhic option to the runqemu script, set
> console=ttyS0 in the kernel options so the user can view
> the kernel boot messages.
> 
> This fixes [YOCTO #1475]
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  scripts/runqemu |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



