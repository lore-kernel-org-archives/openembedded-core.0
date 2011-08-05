Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpNKv-0005bs-Aq for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:33:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GT0iV014123
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:29:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13855-05 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:28:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GSu0J014117
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:28:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <acf0ee2a4a18f8a50bcb7dc81dfec290bf8d6656.1312522526.git.dongxiao.xu@intel.com>
References: <cover.1312522526.git.dongxiao.xu@intel.com>
	<acf0ee2a4a18f8a50bcb7dc81dfec290bf8d6656.1312522526.git.dongxiao.xu@intel.com>
Date: Fri, 05 Aug 2011 17:28:33 +0100
Message-ID: <1312561713.14274.137.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] task-core-boot.bb: Add PACKAGE definition to facilitate multilib
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
X-List-Received-Date: Fri, 05 Aug 2011 16:33:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 13:48 +0800, Dongxiao Xu wrote:
> If there is no PACKAGES defined in bb file, its default definition would
> be "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-locale".
> In multilib case, ${PN} is extended with ${MLPREFIX}, so there is no
> rename occurred for the PACKAGES. Therefore for task-core-boot,
> RDEPENDS_lib32-task-core-boot will be empty, resulting busybox,
> tinylogin, etc. are not bulit out.
> 
> This fixed the issue that /bin/sh is not provided while do_rootfs.
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  meta/recipes-core/tasks/task-core-boot.bb |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



