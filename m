Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RRPfi-00037E-SO for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 15:44:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAIEbedK030894
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:37:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30684-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:37:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAIEbYFt030888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:37:35 GMT
Message-ID: <1321627060.16309.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 Nov 2011 14:37:40 +0000
In-Reply-To: <e1b1eb55f02eed20c1b1c84a0c95faf50175beec.1321598073.git.kai.kang@windriver.com>
References: <cover.1321598073.git.kai.kang@windriver.com>
	<e1b1eb55f02eed20c1b1c84a0c95faf50175beec.1321598073.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] mesa: fix calling host's commands
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
X-List-Received-Date: Fri, 18 Nov 2011 14:44:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-18 at 14:36 +0800, Kang Kai wrote:
> mesa use its script file bin/mklib to generate libraries, and call the
> host's commands "ar/ranlib/gcc/g++". Fix it to call the cross-compile
> tools properly.
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  meta/recipes-graphics/mesa/mesa-7.11.inc           |    1 +
>  meta/recipes-graphics/mesa/mesa-common.inc         |    2 +-
>  .../mesa/mesa/crossfix-mklib.patch                 |   71 ++++++++++++++++++++
>  3 files changed, 73 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/mesa/crossfix-mklib.patch

Merged to master, thanks.

Richard



