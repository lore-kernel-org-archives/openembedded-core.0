Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Srbtx-0001xs-8S for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 23:35:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ILO0Yx029147
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 22:24:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27762-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 22:23:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ILNqN4029141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 22:23:53 +0100
Message-ID: <1342646636.513.53.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2012 22:23:56 +0100
In-Reply-To: <20120718173922.GA20427@windriver.com>
References: <20120718173922.GA20427@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] nasm: nasm has a build dependency on groff-native
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
X-List-Received-Date: Wed, 18 Jul 2012 21:35:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-18 at 13:39 -0400, Amy Fong wrote:
> nasm has a build dependency on groff-native
>     
> In one incident, there was a case where nasm-native compile phase failed
> with the following:
>     
>       +troff: can't find `DESC' file
>       +troff: fatal error: sorry, I can't continue
>     
> During this, groff-native was in the sysroot install phase.
> To remedy this, adding groff-native in nasm's dependency list.
>     
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>  nasm_2.07.bb |    2 ++
>  1 file changed, 2 insertions(+)

This patch doesn't apply against master which has version 2.10.01. I
made it apply in this case since it appears still relevant but please
check this in future.

Cheers,

Richard



