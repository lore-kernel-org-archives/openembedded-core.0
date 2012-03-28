Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SCp7x-0002QP-EF for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 11:25:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2S9G7pq018219
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 10:16:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15891-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 10:16:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2S9G09i018212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 10:16:01 +0100
Message-ID: <1332926161.28414.195.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Mar 2012 10:16:01 +0100
In-Reply-To: <1332902465-14472-1-git-send-email-raj.khem@gmail.com>
References: <1332902465-14472-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] zypper: Fix build with gcc 4.7
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
X-List-Received-Date: Wed, 28 Mar 2012 09:25:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-27 at 19:41 -0700, Khem Raj wrote:
> More details in patch header
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-extended/zypper/zypper/gcc-scope.patch |   20 ++++++++++++++++++++
>  meta/recipes-extended/zypper/zypper_git.bb         |    3 ++-
>  2 files changed, 22 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-extended/zypper/zypper/gcc-scope.patch

Merged to master, thanks.

Richard



