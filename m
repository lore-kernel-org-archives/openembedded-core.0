Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyW16-0002ww-1N for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 23:38:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ULXoQe003028
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:33:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01344-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:33:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ULXfHj003014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 22:33:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <c6f961b7fa75da18714607f5846f1a6b216cc4ff.1314325071.git.xiaofeng.yan@windriver.com>
References: <cover.1314325071.git.xiaofeng.yan@windriver.com>
	<c6f961b7fa75da18714607f5846f1a6b216cc4ff.1314325071.git.xiaofeng.yan@windriver.com>
Date: Tue, 30 Aug 2011 22:33:29 +0100
Message-ID: <1314740009.5939.438.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [OC-core][PATCH 1/1] qt4e-demo-image: Fix bug 999
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
X-List-Received-Date: Tue, 30 Aug 2011 21:38:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-26 at 10:24 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> [YOCTO #999]
> Copy metadata of qt4e-demo-image from OE for easy testing qt4embeded on embedded platform.
> This image was tested on qemuarm and can run program "qtdemoE".
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-qt/images/qt4e-demo-image.bb |   19 ++++++++++
>  meta/recipes-qt/tasks/task-qt4e.bb        |   56 +++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-qt/images/qt4e-demo-image.bb
>  create mode 100644 meta/recipes-qt/tasks/task-qt4e.bb

Merged to master, thanks.

Richard



