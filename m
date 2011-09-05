Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R0f50-0002is-R4 for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 21:43:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JcakT001113;
	Mon, 5 Sep 2011 20:38:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00973-04; Mon,  5 Sep 2011 20:38:32 +0100 (BST)
Received: from [192.168.1.40] (dynamic10.rpnet.com [192.168.1.40])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JcRdh001106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 5 Sep 2011 20:38:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1315074165-20137-3-git-send-email-dbaryshkov@gmail.com>
References: <1315074165-20137-1-git-send-email-dbaryshkov@gmail.com>
	<1315074165-20137-3-git-send-email-dbaryshkov@gmail.com>
Date: Mon, 05 Sep 2011 20:38:27 +0100
Message-ID: <1315251507.1243.18.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 3/3] qt-demo-init: fix init script
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
X-List-Received-Date: Mon, 05 Sep 2011 19:43:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-03 at 22:22 +0400, Dmitry Eremin-Solenikov wrote:
> qt-demo-init initscript lacks some quotes, which makes it bave not fulle
> correct. Fix that.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init |    8 ++++----
>  meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb      |    2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Merged to master, thanks.

Richard



