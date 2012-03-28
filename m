Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SCp7Y-0002NH-Cs for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 11:24:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2S9Fkr2018209
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 10:15:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15632-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 10:15:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2S9Fcqj018202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 10:15:39 +0100
Message-ID: <1332926139.28414.194.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Mar 2012 10:15:39 +0100
In-Reply-To: <e9d2eb8bec97c9bd98bbd5ea2073924e284ba41b.1332814325.git.xiaofeng.yan@windriver.com>
References: <cover.1332814325.git.xiaofeng.yan@windriver.com>
	<e9d2eb8bec97c9bd98bbd5ea2073924e284ba41b.1332814325.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 9/9] local.conf.sample.extended: The set for archiving packages
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
X-List-Received-Date: Wed, 28 Mar 2012 09:24:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-27 at 10:24 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> User can use these variables to get atchiving packages they want.
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta-yocto/conf/local.conf.sample.extended |   32 ++++++++++++++++++++++++++++
>  1 files changed, 32 insertions(+), 0 deletions(-)

This commit introduced duplicate information as Chris noted. I also
thought we could make it clearer so in the end I pretty much rewrote it
(to mention INHERIT += too). I've merged a patch along these lines which
should complete this series now.

I would note that a few people have ideas for cleanups to the code. For
example, rather than figuring out .bb and .inc files as you do now,
there is a bitbake variable you can look at to get this information.

I'm seeing the merged code as a first draft of this which we can now
iterate over and improve. As such I'll take improvement patches.

Cheers,

Richard



