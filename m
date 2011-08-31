Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qyq2W-000451-PD for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 21:01:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7VIucbL010798
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 19:56:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10560-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 19:56:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7VIuWxL010792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 19:56:32 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <5be44598c9af0659e4cdeb758875ee32d4f897e4.1314754472.git.xiaofeng.yan@windriver.com>
References: <cover.1314754472.git.xiaofeng.yan@windriver.com>
	<5be44598c9af0659e4cdeb758875ee32d4f897e4.1314754472.git.xiaofeng.yan@windriver.com>
Date: Wed, 31 Aug 2011 19:56:18 +0100
Message-ID: <1314816978.5939.477.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] qt-demo-init: Fix bug 999
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
X-List-Received-Date: Wed, 31 Aug 2011 19:01:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-31 at 09:39 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> [YOCTO #999]
> qt4e-demo-image needs qt-demo-init when starting qtdemoE.
> qt-demo-init was pulled from Openembeded.
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init |   55 ++++++++++++++++++++++
>  meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb      |   19 ++++++++
>  2 files changed, 74 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init
>  create mode 100644 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb

Merged to master, thanks.

Richard



