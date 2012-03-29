Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDN32-0001O4-9B for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 23:38:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TLTLCX005643
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:29:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05108-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:29:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TLTAY8005637
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 22:29:11 +0100
Message-ID: <1333056549.18082.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 22:29:09 +0100
In-Reply-To: <a913503c671f8442d554a5f54cf93bcf8219a53d.1332927487.git.kai.kang@windriver.com>
References: <cover.1332927487.git.kai.kang@windriver.com>
	<a913503c671f8442d554a5f54cf93bcf8219a53d.1332927487.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] ghostscript: fix parallel make issue
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
X-List-Received-Date: Thu, 29 Mar 2012 21:38:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-28 at 17:41 +0800, Kang Kai wrote:
> [Yocto 1202]
> 
> Update ghostscript-9.02-parallel-make.patch to fix parallel make
> failure.
> Bump up PR.
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  .../ghostscript-9.02-parallel-make.patch           |   13 +++++++++++++
>  .../ghostscript/ghostscript_9.05.bb                |    2 +-
>  2 files changed, 14 insertions(+), 1 deletions(-)

Sadly the makefiles are littered with CP_ races. I've merged a patch
which hopefully addresses them all rather than fixing them up one by one
as they occur.

Cheers,

Richard



